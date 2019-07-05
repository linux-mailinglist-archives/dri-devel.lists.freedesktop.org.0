Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9516048C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907286E487;
	Fri,  5 Jul 2019 10:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F18E6E487
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:33:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65AXdMJ045769;
 Fri, 5 Jul 2019 05:33:39 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65AXdgj019071
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Jul 2019 05:33:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 05:33:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 05:33:38 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65AXa3F125307;
 Fri, 5 Jul 2019 05:33:36 -0500
Subject: Re: [PATCH 3/4] backlight: add led-backlight driver
To: Pavel Machek <pavel@ucw.cz>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-4-jjhiblot@ti.com>
 <20190702095434.d426lichmaffz7a5@holly.lan>
 <531e237c-b570-5270-6fc3-6629a8bf7acd@ti.com>
 <20190702130434.frbx7jkec27ejbpo@holly.lan>
 <72c45311-c710-dc2d-a6de-68e44ea8436a@ti.com>
 <20190703094457.etmbbjhhssbdkveo@holly.lan>
 <a8886ae9-31ec-de4c-0a83-5f681582a0b9@ti.com>
 <20190705100851.zn2jkipj4fxq5we6@devuan>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6c21af33-8c3b-58a8-0a1b-f85fb9f80050@ti.com>
Date: Fri, 5 Jul 2019 12:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705100851.zn2jkipj4fxq5we6@devuan>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562322819;
 bh=a+9kqxFBb4ONOgcxUqkn+qLv8UCr52lzZuc0RccW2Xw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LRqAfRzKxnl2Xipdm3VYCpApjQIdqkeD3HVFzK3CMyriOURvthKE7CBvCshT8CPUs
 Dt82c+aEXJXv3DOLCQY5F2is2/Qv/i1CG16L38FsjLfJH4wYPcgghxh1lQQi0yOfxz
 T46mSNHK/la9A84zPIDoWZ+iMD8wfHKvnjw6eNr4=
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
Cc: mark.rutland@arm.com, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF2ZWwKCk9uIDA1LzA3LzIwMTkgMTI6MDgsIFBhdmVsIE1hY2hlayB3cm90ZToKPiBIaSEKPgo+
Pj4+PiBBbHNvIHN0aWxsIHJlbGV2YW50IGlzIHdoZXRoZXIgdGhlIExFRCBkZXZpY2UgaXMgYmVp
bmcgY29ycmVjdGx5Cj4+Pj4+IG1vZGVsbGVkIGlmIHRoZSBhY3Qgb2YgdHVybmluZyBvbiB0aGUg
TEVEIGRvZXNuJ3QsIGluIGZhY3QsIHR1cm4gdGhlIExFRAo+Pj4+PiBvbi4gSXMgaXQgKnJlYWxs
eSogYSBjb3JyZWN0IGltcGxlbWVudGF0aW9uIG9mIGFuIExFRCBkZXZpY2UgdGhhdAo+Pj4+PiBz
ZXR0aW5nIGl0IHRvIExFRF9GVUxMIHVzaW5nIHN5c2ZzIGRvZXNuJ3QgY2F1c2UgaXQgdG8gbGln
aHQgdXA/Cj4+Pj4gV2hhdCBJIHVuZGVyc3Rvb2QgZnJvbSB0aGUgZGlzY3Vzc2lvbiBiZXR3ZWVu
IFJvYiBhbmQgVG9taSBpcyB0aGF0IHRoZQo+Pj4+IGNoaWxkLW5vZGUgb2YgdGhlIExFRCBjb250
cm9sbGVyIHNob3VsZCBiZSBjb25zaWRlcmVkIGEgYmFja2xpZ2h0IGRldmljZSwKPj4+PiBub3Qg
YSBzaW1wbGUgTEVELiBJJ20gbm90IHN1cmUgaWYgdGhlIHN5c2ZzIGludGVyZmFjZSBpcyBzdGls
bCByZWxldmFudCBpbgo+Pj4+IHRoYXQgY2FzZS4gTWF5YmUgaXQgc2hvdWxkIGp1c3QgYmUgZGlz
YWJsZWQgYnkgdGhlIGJhY2tsaWdodCBkcml2ZXIKPj4+PiAocG9zc2libGUgd2l0aCBsZWRfc3lz
ZnNfZGlzYWJsZSgpKQo+Pj4gbGVkX3N5c2ZzX2Rpc2FibGUoKSBzb3VuZHMgbGlrZSBhIHNlbnNp
YmxlIGNoYW5nZSBidXQgdGhhdCdzIG5vdCBxdWl0ZQo+Pj4gd2hhdCBJIG1lYW4uCj4+Pgo+Pj4g
SXQgaXMgbW9yZSBhIHRob3VnaHQgZXhwZXJpbWVudCB0byBzZWUgaWYgdGhlIHBvd2VyIGNvbnRy
b2wgKnNob3VsZCogYmUKPj4+IGltcGxlbWVudGVkIGJ5IHRoZSBiYWNrbGlnaHQuIENvbnNpZGVy
IHdoYXQgaGFwcGVucyBpZiB3ZSAqZG9uJ3QqCj4+PiBlbmFibGUgQ09ORklHX0JBQ0tMSUdIVF9M
RUQgaW4gdGhlIGtlcm5lbDogd2Ugd291bGQgc3RpbGwgaGF2ZSBhbiBMRUQKPj4+IGRldmljZSBh
bmQgaXQgd291bGQgbm90IHdvcmsgY29ycmVjdGx5Lgo+Pj4KPj4+IEluIG90aGVyIHdvcmRzIEkg
bmFpdmVseSBleHBlY3QgdHVybmluZyBvbiBhbiBMRUQgdXNpbmcgdGhlIExFRCBBUEkKPj4+IChh
bnkgb2YgdGhlbSwgc3lzZnMgb3Iga2VybmVsKSB0byByZXN1bHQgaW4gdGhlIExFRCB0dXJuaW5n
IG9uLgo+Pj4gSW1wbGVtZW50aW5nIGEgd29ya2Fyb3VuZCBpbiB0aGUgY2xpZW50IGZvciB3aGF0
IGFwcGVhcnMgdG8gYmUKPj4+IHNvbWV0aGluZyBtaXNzaW5nIGluIHRoZSBMRUQgZHJpdmVyIHN0
cmlrZXMgbWUgYXMgb2RkLiBXaHkgc2hvdWxkbid0Cj4+PiB0aGUgcmVndWxhdG9yIGJlIG1hbmFn
ZWQgaW4gdGhlIExFRCBkcml2ZXI/Cj4+IEkgc2VlIHlvdXIgcG9pbnQuIEluZGVlZCBoYXZpbmcg
dGhlIHJlZ3VsYXRvciBoYW5kbGVkIGluIHRoZSBMRUQtY29yZSBtYWtlcwo+PiBzZW5zZSBpbiBh
IGxvdCBvZiBzaXR1YXRpb25zCj4+Cj4+IEknbGwgdGhpbmsgYWJvdXQgaXQuCj4gRm9yIHRoZSBy
ZWNvcmQsIEkgYWxzbyBiZWxpZXZlIHJlZ3VsYXRvciBhbmQgZW5hYmxlIGdwaW8gc2hvdWxkIGJl
Cj4gaGFuZGxlZCBpbiB0aGUgY29yZS4KCkkgYW0gd29ya2luZyBvbiBhZGRpbmcgdGhlIHJlZ3Vs
YXRvciB0byB0aGUgbGVkIGNvcmUuCgpJIGRvbid0IHJlYWxseSB3YW50IHRvIGFkZCBhIEdQSU8g
ZW5hYmxlIHRvIHRoZSBjb3JlIHRob3VnaC4gSWYgbmVlZGVkIAppdCBjYW4gYmUgZGVzY3JpYmVk
IGFzIGEgR1BJTy1lbmFibGVkIHJlZ3VsYXRvciB1cCgvZG93bilzdHJlYW0gdGhlIApyZWd1bGFy
IHJlZ3VsYXRvci4KCkpKCgoKPgo+IAkJCQkJCQkJCVBhdmVsCj4gUFMgcGxlYXNlIHRyaW0gZG93
biB0aGUgcXVvdGVkIHRleHQuCQkJCQkJCQkJCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
