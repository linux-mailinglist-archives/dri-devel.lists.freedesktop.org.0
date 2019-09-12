Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324AAB18DC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0E06EEA0;
	Fri, 13 Sep 2019 07:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8806ECE7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 11:40:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBePBm024620;
 Thu, 12 Sep 2019 06:40:25 -0500
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CBePTt013823
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Sep 2019 06:40:25 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:40:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:40:24 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBeOl4035179;
 Thu, 12 Sep 2019 06:40:24 -0500
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
To: Andreas Kemnade <andreas@kemnade.info>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
 <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-leds@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20190911172106.12843-1-andreas@kemnade.info>
 <20190911172106.12843-3-andreas@kemnade.info>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4b3407bb-d171-6a70-8252-573a4afbd056@ti.com>
Date: Thu, 12 Sep 2019 06:40:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911172106.12843-3-andreas@kemnade.info>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568288425;
 bh=JAbUfkXS1yEg2PX6HE2Q/UJubwObycdqS5f0+MTrqI8=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=wUS2FXnjRMRb7nbux+n8VSR2S+QdV9Fa9p8pUDFqVPSwvbqhilzjFXWtVJlCnJesl
 oxX6owTH+yAb4R2D2Xn5kNI5aT5dvwiYKBMv1nvTt9VM+KVjf6tYnwkzQSs0R6XsVw
 r9mS2gdQ5iImyK6GMPxAN/Q5JPZMIG/GYLaCW6AI=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kcmVhcwoKT24gOS8xMS8xOSAxMjoyMSBQTSwgQW5kcmVhcyBLZW1uYWRlIHdyb3RlOgo+IEZv
ciBub3cganVzdCBlbmFibGUgaXQgaW4gdGhlIHByb2JlIGZ1bmN0aW9uIHRvIGFsbG93IGkyYwo+
IGFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSByZWdpc3RlciB2YWx1
ZXMKPiB0byBkZWZhdWx0IGFuZCBhY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCBkb2VzIG5vdCBn
aXZlCj4gcG93ZXIgc2F2aW5ncy4KPgo+IFRlc3RlZCBvbiBLb2JvIENsYXJhIEhELgo+Cj4gU2ln
bmVkLW9mZi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KPiAtLS0K
PiBjaGFuZ2VzIGluIHYyOgo+IC0gc2ltcGxpZmljYXRpb24KPiAtIGNvcnJlY3QgZ3BpbyBkaXJl
Y3Rpb24gaW5pdGlhbGlzYXRpb24KPgo+IGNoYW5nZXMgaW4gdjM6Cj4gLSByZW1vdmVkIGxlZ2Fj
eSBpbmNsdWRlCj4KPiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyB8IDkg
KysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIGIvZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gaW5kZXggOGY4NGYzNjg0ZjA0Li5kOWU2N2I5YjI1
NzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4g
KysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gQEAgLTEyLDYgKzEy
LDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvcHdtLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9sbTM2MzBhX2JsLmg+Cj4gICAKPiBAQCAtNDgsNiAr
NDksNyBAQCBzdHJ1Y3QgbG0zNjMwYV9jaGlwIHsKPiAgIAlzdHJ1Y3QgbG0zNjMwYV9wbGF0Zm9y
bV9kYXRhICpwZGF0YTsKPiAgIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmxlZGE7Cj4gICAJ
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsZWRiOwo+ICsJc3RydWN0IGdwaW9fZGVzYyAqZW5h
YmxlX2dwaW87Cj4gICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICAgCXN0cnVjdCBwd21fZGV2
aWNlICpwd21kOwo+ICAgfTsKPiBAQCAtNTM1LDYgKzUzNywxMyBAQCBzdGF0aWMgaW50IGxtMzYz
MGFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAgIAl9Cj4gICAJcGNoaXAtPnBk
YXRhID0gcGRhdGE7Cj4gICAKPiArCXBjaGlwLT5lbmFibGVfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCZjbGllbnQtPmRldiwgImVuYWJsZSIsCj4gKwkJCQkJCUdQSU9EX09VVF9ISUdI
KTsKPiArCWlmIChJU19FUlIocGNoaXAtPmVuYWJsZV9ncGlvKSkgewo+ICsJCXJ2YWwgPSBQVFJf
RVJSKHBjaGlwLT5lbmFibGVfZ3Bpbyk7Cj4gKwkJcmV0dXJuIHJ2YWw7Cj4gKwl9Cj4gKwo+ICAg
CS8qIGNoaXAgaW5pdGlhbGl6ZSAqLwo+ICAgCXJ2YWwgPSBsbTM2MzBhX2NoaXBfaW5pdChwY2hp
cCk7Cj4gICAJaWYgKHJ2YWwgPCAwKSB7CgpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbgoKSXQg
bG9va3MgZ29vZCB0byBtZQoKUmV2aWV3ZWQtYnk6IERhbiBNdXJwaHkgPGRtdXJwaHlAdGkuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
