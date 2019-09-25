Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2ABD935
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCEC6E8A8;
	Wed, 25 Sep 2019 07:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310036E8A8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 07:37:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8P7b6r0008327;
 Wed, 25 Sep 2019 02:37:06 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8P7b639020486
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Sep 2019 02:37:06 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 02:37:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 02:37:05 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8P7b2mU007724;
 Wed, 25 Sep 2019 02:37:03 -0500
Subject: Re: [PATCH] drm/bridge: tc358767: fix max_tu_symbol value
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, <dri-devel@lists.freedesktop.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Andrzej Hajda
 <a.hajda@samsung.com>
References: <20190924131702.9988-1-tomi.valkeinen@ti.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fa751629-8338-1601-8b4b-1c7fe02d2d61@ti.com>
Date: Wed, 25 Sep 2019 10:37:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924131702.9988-1-tomi.valkeinen@ti.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569397026;
 bh=SnPFtZZzIqdMoaH2slT79ddNkSe417tITfyHBpdJU5Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dfMq0i1gEPh721RQ9hpre/6sDO+Hg+8oWWOgMXFUs5mM2Hl973SYqnSCDFvUt1HVh
 y4uukdmUCuAioQd8XmhlEF8OT43AMDBBYB8hOiRFjv4bdkW3Z5Afrduhlw/xYTfP9P
 lpY5e0Z0CW0k/oqP9Wh9fSpA+XTHu9lgr43qqmxs=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQvMDkvMjAxOSAxNjoxNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gbWF4X3R1X3N5bWJv
bCB3YXMgcHJvZ3JhbW1lZCB0byBUVV9TSVpFX1JFQ09NTUVOREVEIC0gMSwgd2hpY2ggaXMgbm90
Cj4gd2hhdCB0aGUgc3BlYyBzYXlzLiBUaGUgc3BlYyBzYXlzOgo+IAo+IHJvdW5kdXAgKChpbnB1
dCBhY3RpdmUgdmlkZW8gYmFuZHdpZHRoIGluIGJ5dGVzL291dHB1dCBhY3RpdmUgdmlkZW8KPiBi
YW5kd2lkdGggaW4gYnl0ZXMpICogdHVfc2l6ZSkKPiAKPiBJdCBpcyBub3QgcXVpdGUgY2xlYXIg
d2hhdCB0aGUgYWJvdmUgbWVhbnMsIGJ1dCBjYWxjdWxhdGluZwo+IG1heF90dV9zeW1ib2wgPSAo
aW5wdXQgQnBzIC8gb3V0cHV0IEJwcykgKiB0dV9zaXplIHNlZW1zIHRvIHdvcmsgYW5kCj4gZml4
ZXMgdGhlIGlzc3VlcyBzZWVuLgo+IAo+IFRoaXMgZml4ZXMgYXJ0aWZhY3RzIGluIHNvbWUgdmlk
ZW9tb2RlcyAoZS5nLiAxMDI0eDc2OEA2MCBvbiAyLWxhbmVzICYKPiAxLjYyR2JwcyB3YXMgcHJl
dHR5IGJhZCBmb3IgbWUpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21p
LnZhbGtlaW5lbkB0aS5jb20+CgpJIGNvdWxkIHJlcHJvZHVjZSB0aGUgcHJvYmxlbSBhbmQgc2Vl
IHRoYXQgdGhlIHBhdGNoIGZpeGVzIGl0LCBzbzoKClRlc3RlZC1ieTogSnlyaSBTYXJoYSA8anNh
cmhhQHRpLmNvbT4KCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
fCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBpbmRleCAxM2FkZTI4YTM2YTgu
LmI2YWExYmQ0N2UxZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKPiBAQCAtNjc3
LDYgKzY3Nyw4IEBAIHN0YXRpYyBpbnQgdGNfc2V0X3ZpZGVvX21vZGUoc3RydWN0IHRjX2RhdGEg
KnRjLAo+ICAJaW50IHVwcGVyX21hcmdpbiA9IG1vZGUtPnZ0b3RhbCAtIG1vZGUtPnZzeW5jX2Vu
ZDsKPiAgCWludCBsb3dlcl9tYXJnaW4gPSBtb2RlLT52c3luY19zdGFydCAtIG1vZGUtPnZkaXNw
bGF5Owo+ICAJaW50IHZzeW5jX2xlbiA9IG1vZGUtPnZzeW5jX2VuZCAtIG1vZGUtPnZzeW5jX3N0
YXJ0Owo+ICsJdTMyIGJpdHNfcGVyX3BpeGVsID0gMjQ7Cj4gKwl1MzIgaW5fYncsIG91dF9idzsK
PiAgCj4gIAkvKgo+ICAJICogUmVjb21tZW5kZWQgbWF4aW11bSBudW1iZXIgb2Ygc3ltYm9scyB0
cmFuc2ZlcnJlZCBpbiBhIHRyYW5zZmVyIHVuaXQ6Cj4gQEAgLTY4NCw3ICs2ODYsMTAgQEAgc3Rh
dGljIGludCB0Y19zZXRfdmlkZW9fbW9kZShzdHJ1Y3QgdGNfZGF0YSAqdGMsCj4gIAkgKiAgICAg
ICAgICAgICAgKG91dHB1dCBhY3RpdmUgdmlkZW8gYmFuZHdpZHRoIGluIGJ5dGVzKSkKPiAgCSAq
IE11c3QgYmUgbGVzcyB0aGFuIHR1X3NpemUuCj4gIAkgKi8KPiAtCW1heF90dV9zeW1ib2wgPSBU
VV9TSVpFX1JFQ09NTUVOREVEIC0gMTsKPiArCj4gKwlpbl9idyA9IG1vZGUtPmNsb2NrICogYml0
c19wZXJfcGl4ZWwgLyA4Owo+ICsJb3V0X2J3ID0gdGMtPmxpbmsuYmFzZS5udW1fbGFuZXMgKiB0
Yy0+bGluay5iYXNlLnJhdGU7Cj4gKwltYXhfdHVfc3ltYm9sID0gRElWX1JPVU5EX1VQKGluX2J3
ICogVFVfU0laRV9SRUNPTU1FTkRFRCwgb3V0X2J3KTsKPiAgCj4gIAlkZXZfZGJnKHRjLT5kZXYs
ICJzZXQgbW9kZSAlZHglZFxuIiwKPiAgCQltb2RlLT5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXkp
Owo+IAoKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
