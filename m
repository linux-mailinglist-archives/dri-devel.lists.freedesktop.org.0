Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E0253A88
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 01:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68DC6EB0C;
	Wed, 26 Aug 2020 23:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621F36EB0C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:02:10 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DC9920B1F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598482929;
 bh=bCjCScApoje+ayni77KRjV1QLUiQwwWxm8yIGtQ7Vaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G52m6VY9mQDjn1suTD9wsUR71Zs9dOK8EwRciblQDH2krnAbYoYN9K47Ha1vXoBkR
 bLBr7vyx5GEl5IoDbhLPfCZ2y3qvvrqv4XdXirpr0Fyi1VyVdcRlBdqZz9volySEBh
 HCmpmnOV3XTIw+ZwjNWOhKLv3H1g5R2W911R4tHw=
Received: by mail-ed1-f48.google.com with SMTP id b2so3226956edw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:02:09 -0700 (PDT)
X-Gm-Message-State: AOAM532X17cp8TXYxXvygE4PQ0I6tBhrtYe0gpovEczw24FOddr7XCS0
 ETU4M51PddKlZE+JvPw8Oks3JJSQyKBtxZV1eg==
X-Google-Smtp-Source: ABdhPJzvgIKXOsUB/2JDtGjX6TXHpU+YwBmlx7G7aEdn6AJRmJ2tC3KN8bkUm5p4M73ZSUJ2axruuCmlcgbeN/o/haA=
X-Received: by 2002:a50:d71c:: with SMTP id t28mr6557897edi.148.1598482928003; 
 Wed, 26 Aug 2020 16:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
 <1597718492.6381.6.camel@mszsdaap41>
 <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
In-Reply-To: <CAAOTY_94Bd4PGnn88r_yJC0LYkmcByTY52gwNMALuv9+D0rTXg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Aug 2020 07:01:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OfwCN4_GyyvyYRHfFh_7iRYVKtiR1ieV_Q9ijhEJw+g@mail.gmail.com>
Message-ID: <CAAOTY__OfwCN4_GyyvyYRHfFh_7iRYVKtiR1ieV_Q9ijhEJw+g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
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

SGksIEppdGFvOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0OOaciDE45pelIOmAseS6jCDkuIvljYgxMDo0NeWvq+mBk++8mgo+Cj4gSGksIEppdGFv
Ogo+Cj4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjmnIgx
OOaXpSDpgLHkuowg5LiK5Y2IMTA6NDHlr6vpgZPvvJoKPiA+Cj4gPiBPbiBUdWUsIDIwMjAtMDgt
MTggYXQgMDc6NDIgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+IEhpLCBKaXRhbzoK
PiA+ID4KPiA+ID4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxN+aXpSDpgLHkuIAg5LiL5Y2IOTowN+Wvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gaG9y
aXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSBzaG91bGQgYmUgaGJwICogYnBwIC0gaGJwIGV4dHJhIGJ5
dGVzLgo+ID4gPiA+IFNvIHJlbW92ZSB0aGUgd3Jvbmcgc3VidHJhY3Rpb24gMTAuCj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMg
fCA5ICsrKystLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gPiA+ID4gaW5kZXggMjcwYmYyMmM5OGZlLi41ZDAzMWU2MzQ1NzEgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiA+ID4gPiBAQCAtNDczLDE0ICs0NzMs
MTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQo+ID4gPiA+ICAgICAgICAgaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlID0gKHZt
LT5oc3luY19sZW4gKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+Cj4gPiA+IFNvIHRoaXMg
c3VidHJhY3Rpb24gMTAgaXMgY29ycmVjdD8KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQ2h1
bi1LdWFuZy4KPiA+ID4KPiA+Cj4gPiBZZXMsIEl0IGlzIHJpZ2h0Lgo+ID4KPiA+IEluIHRoZSBj
ZWE4NjEgYW5kIGRtdCBzcGVjIHRoZSBtaW5pIGhzeW5jIGlzIDQwIHBpeGVscy4KPiA+IFNvIHRo
ZSB2bS0+aHN5bmNfbGVuICogZHNpX3RtcF9idWZfYnBwID49IDEyMCA+IDEwCj4gPgo+Cj4gT0ss
IHNvCj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5o
dS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4gPiBCZXN0IFJlZ2FyZHMKPiA+IGppdGFvCj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGlm
IChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0UpCj4gPiA+
ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPQo+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAg
LSAxMCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUg
PSB2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHA7Cj4gPiA+ID4gICAgICAgICBlbHNl
Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAoKHZt
LT5oYmFja19wb3JjaCArIHZtLT5oc3luY19sZW4pICoKPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGhv
cml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5jX2xl
bikgKgo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZHNpX3RtcF9idWZfYnBwOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBkYXRhX3BoeV9jeWNsZXMg
PSB0aW1pbmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZSArCj4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQg
KyAzOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJv
ICsgdGltaW5nLT5kYV9oc19leGl0Owo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBpZiAoZHNpLT5t
b2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCkgewo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBpZiAoKHZtLT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpICogZHNpX3Rt
cF9idWZfYnBwID4KPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTIuNQo+ID4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0Cj4gPiA+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsKPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
