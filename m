Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84A6248817
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 16:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3956389A4B;
	Tue, 18 Aug 2020 14:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8312489A4B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:46:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AD8F207D3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597761967;
 bh=uLShTqPsScOSS/Y7xhwooyk4VokN/5lcf0l5sX6cwe0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LqPm/t4tT/0fik+ovMNaZmmhNITKQnbE/SEtpU/wQaHeFsc0oEqv0Ok7zgT8K8q0g
 RzriiVo1EJOuEDWve2doQaiolPRjJE7i2Qfp7Q61s8o6qzy1RG89yQc6J/XgBhUjv8
 N80VcYnaemw4XlLvCbVZs7Xhay5iOr2yqH8+lDpY=
Received: by mail-ej1-f50.google.com with SMTP id d6so22395598ejr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:46:07 -0700 (PDT)
X-Gm-Message-State: AOAM531itTF8BNwqalkG9+zmMTwoR+TK8Xv9xZhsyNcUtYxTx438x+uS
 v8ZQpGbvcxTtc7VbBfqgY74KdV9w3HLAKVCISA==
X-Google-Smtp-Source: ABdhPJyAegsVyLKiVAWm3/ULM5Zo7ujEpLDRmMYGDKOTvVSOcFz66S1v3I39ISq/ljIBOR2BqS2UuSxiTjiBJSeDKEk=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr21208887ejd.7.1597761965685; 
 Tue, 18 Aug 2020 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
 <1597718492.6381.6.camel@mszsdaap41>
In-Reply-To: <1597718492.6381.6.camel@mszsdaap41>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 22:45:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
Message-ID: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxOOaXpSDpgLHkuowg5LiK5Y2IMTA6NDHlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMjAyMC0w
OC0xOCBhdCAwNzo0MiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBKaXRhbzoK
PiA+Cj4gPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOac
iDE35pelIOmAseS4gCDkuIvljYg5OjA35a+r6YGT77yaCj4gPiA+Cj4gPiA+IGhvcml6b250YWxf
YmFja3BvcmNoX2J5dGUgc2hvdWxkIGJlIGhicCAqIGJwcCAtIGhicCBleHRyYSBieXRlcy4KPiA+
ID4gU28gcmVtb3ZlIHRoZSB3cm9uZyBzdWJ0cmFjdGlvbiAxMC4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA5ICsrKystLS0tLQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gPiA+IGluZGV4IDI3MGJmMjJjOThm
ZS4uNWQwMzFlNjM0NTcxIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiA+ID4gQEAgLTQ3MywxNCArNDczLDEzIEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmln
X3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkKPiA+ID4gICAgICAgICBob3Jpem9udGFs
X3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCAtIDEw
KTsKPiA+Cj4gPiBTbyB0aGlzIHN1YnRyYWN0aW9uIDEwIGlzIGNvcnJlY3Q/Cj4gPgo+ID4gUmVn
YXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+Cj4gWWVzLCBJdCBpcyByaWdodC4KPgo+IEluIHRo
ZSBjZWE4NjEgYW5kIGRtdCBzcGVjIHRoZSBtaW5pIGhzeW5jIGlzIDQwIHBpeGVscy4KPiBTbyB0
aGUgdm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCA+PSAxMjAgPiAxMAo+CgpPSywgc28K
ClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4g
QmVzdCBSZWdhcmRzCj4gaml0YW8KPiA+ID4KPiA+ID4gICAgICAgICBpZiAoZHNpLT5tb2RlX2Zs
YWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFKQo+ID4gPiAtICAgICAgICAgICAg
ICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICh2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+ICsgICAg
ICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0gdm0tPmhiYWNrX3BvcmNoICog
ZHNpX3RtcF9idWZfYnBwOwo+ID4gPiAgICAgICAgIGVsc2UKPiA+ID4gLSAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAoKHZtLT5oYmFja19wb3JjaCArIHZtLT5oc3lu
Y19sZW4pICoKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZHNpX3RtcF9idWZfYnBwIC0g
MTApOwo+ID4gPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9ICh2
bS0+aGJhY2tfcG9yY2ggKyB2bS0+aHN5bmNfbGVuKSAqCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZHNpX3RtcF9idWZfYnBwOwo+ID4gPgo+ID4gPiAg
ICAgICAgIGRhdGFfcGh5X2N5Y2xlcyA9IHRpbWluZy0+bHB4ICsgdGltaW5nLT5kYV9oc19wcmVw
YXJlICsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8g
KyB0aW1pbmctPmRhX2hzX2V4aXQgKyAzOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
IHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+ZGFfaHNfZXhpdDsKPiA+ID4KPiA+ID4gICAg
ICAgICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+
ID4gPiAgICAgICAgICAgICAgICAgaWYgKCh2bS0+aGZyb250X3BvcmNoICsgdm0tPmhiYWNrX3Bv
cmNoKSAqIGRzaV90bXBfYnVmX2JwcCA+Cj4gPiA+IC0tCj4gPiA+IDIuMTIuNQo+ID4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
