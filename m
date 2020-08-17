Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6E247B31
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 01:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ED889D81;
	Mon, 17 Aug 2020 23:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CB989D81
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 23:42:56 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 954AC207D3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597707775;
 bh=x2x17PXByjmc5GL+cpiiMIiGtoeX2KrAjZvn4MxGmjM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jc/vz+UQzZaY3RWlTnKJ/1TkiZZistwAP8D5Rbr8gGMvQbCioL9ezZGWDCLTThzMQ
 I5yeRps1Ms1E0aACHi+zxzWiY6evzagCBlM0RQAdSbsnhAHBIiYPfeCGeWc7+3eOqs
 dR1K0IcG7QqNsmy+9iOB1VtJ8Sl6Xkug3njoTXFI=
Received: by mail-ej1-f44.google.com with SMTP id t10so19871534ejs.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 16:42:55 -0700 (PDT)
X-Gm-Message-State: AOAM533YRoQHh9ZEQoB/EdElWVmIda9tKL6LRZ7aF98prdMukxScjdpl
 fOqMAbuoO1E7OGMaxaUH9ck0xBmXExk+3q+qRQ==
X-Google-Smtp-Source: ABdhPJz1blTGXowp+NNEIdFVKpxsWzYUxZj6C7dOmrD54k7lOK5kU33K3omXAVdbUpjCWHkbhkIeIAutfvc+KMgeqYw=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr16958911ejb.187.1597707774145; 
 Mon, 17 Aug 2020 16:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
In-Reply-To: <20200817130640.18021-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 07:42:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
Message-ID: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDjmnIgxN+aXpSDpgLHkuIAg5LiL5Y2IOTowN+Wvq+mBk++8mgo+Cj4gaG9yaXpvbnRhbF9iYWNr
cG9yY2hfYnl0ZSBzaG91bGQgYmUgaGJwICogYnBwIC0gaGJwIGV4dHJhIGJ5dGVzLgo+IFNvIHJl
bW92ZSB0aGUgd3Jvbmcgc3VidHJhY3Rpb24gMTAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBT
aGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
aW5kZXggMjcwYmYyMmM5OGZlLi41ZDAzMWU2MzQ1NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiBAQCAtNDczLDE0ICs0NzMsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9j
b25maWdfdmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgaG9yaXpvbnRh
bF9zeW5jX2FjdGl2ZV9ieXRlID0gKHZtLT5oc3luY19sZW4gKiBkc2lfdG1wX2J1Zl9icHAgLSAx
MCk7CgpTbyB0aGlzIHN1YnRyYWN0aW9uIDEwIGlzIGNvcnJlY3Q/CgpSZWdhcmRzLApDaHVuLUt1
YW5nLgoKPgo+ICAgICAgICAgaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfVklE
RU9fU1lOQ19QVUxTRSkKPiAtICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oYmFja19wb3JjaCAqIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9IHZtLT5oYmFja19wb3JjaCAqIGRzaV90bXBfYnVmX2JwcDsKPiAgICAgICAgIGVsc2UKPiAt
ICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9ICgodm0tPmhiYWNrX3Bv
cmNoICsgdm0tPmhzeW5jX2xlbikgKgo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0
ZSA9ICh2bS0+aGJhY2tfcG9yY2ggKyB2bS0+aHN5bmNfbGVuKSAqCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHA7Cj4KPiAgICAgICAg
IGRhdGFfcGh5X2N5Y2xlcyA9IHRpbWluZy0+bHB4ICsgdGltaW5nLT5kYV9oc19wcmVwYXJlICsK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+
ZGFfaHNfZXhpdCArIDM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmctPmRhX2hz
X3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQ7Cj4KPiAgICAgICAgIGlmIChkc2ktPm1vZGVfZmxh
Z3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVPX0JVUlNUKSB7Cj4gICAgICAgICAgICAgICAgIGlmICgo
dm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKiBkc2lfdG1wX2J1Zl9icHAgPgo+
IC0tCj4gMi4xMi41Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
