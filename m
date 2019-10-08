Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA12CFB54
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26426E7BE;
	Tue,  8 Oct 2019 13:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861966E7BE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 13:30:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98DUQh5006610;
 Tue, 8 Oct 2019 08:30:26 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98DUQeb078006
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 08:30:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 08:30:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 08:30:23 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98DUNZQ000416;
 Tue, 8 Oct 2019 08:30:23 -0500
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: Rob Herring <robh+dt@kernel.org>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
Message-ID: <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
Date: Tue, 8 Oct 2019 15:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570541426;
 bh=lQQiCwrpULzFgm3ZorluBP+qndxuBlCDA9JrLAelV6w=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=Jaw6DUR15NED4trF7LQ+GSvwQnDzExBq3Hw3+XQAUjz2dx1H93lPy4N2EqJid+ttr
 27NfNH8KyRavgm/EqaJwjZVvZ5/S+CTftv0aR/rq2hNLfpUxzbBjxMzLtsb2Vm1nbt
 KXHqb+HJn/1BQvzoq12F7U+Tie5d91bt9txDmPGQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Um9iLAoKT24gMDgvMTAvMjAxOSAxNDo1MSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPiBI
aSBSb2IsCj4KPiBPbiAwNy8xMC8yMDE5IDE4OjE1LCBSb2IgSGVycmluZyB3cm90ZToKPj4gUGxl
YXNlIHNlbmQgRFQgYmluZGluZ3MgdG8gRFQgbGlzdCBvciBpdCdzIG5ldmVyIGluIG15IHF1ZXVl
LiBJT1csCj4+IHNlbmQgcGF0Y2hlcyB0byB0aGUgbGlzdHMgdGhhdCBnZXRfbWFpbnRhaW5lcnMu
cGwgdGVsbHMgeW91IHRvLgo+Pgo+PiBPbiBNb24sIE9jdCA3LCAyMDE5IGF0IDc6NDUgQU0gSmVh
bi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGkuY29tPiAKPj4gd3JvdGU6Cj4+PiBBZGQgRFQg
YmluZGluZyBmb3IgbGVkLWJhY2tsaWdodC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUph
Y3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogRGFuaWVsIFRo
b21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBTZWJh
c3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPj4+IC0tLQo+
Pj4gwqAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjgg
Cj4+PiArKysrKysrKysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0
aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+Pj4gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4+IFBsZWFz
ZSBtYWtlIHRoaXMgYSBEVCBzY2hlbWEuCj4KPiBPSy4KPgo+IEJUVyBJIHVzZWQgIm1ha2UgZHRf
YmluZGluZ19jaGVjayIgYnV0IGhhZCB0byBmaXggYSBjb3VwbGUgb2YgWUFNTHMgCj4gZmlsZSB0
byBnZXQgaXQgdG8gd29yay4gRG8geW91IGhhdmUgYSBrZXJuZWwgdHJlZSB3aXRoIGFscmVhZHkg
YWxsIHRoZSAKPiBZQU1MIGZpbGVzIGluIGdvb2Qgc2hhcGUgPyBPciBkbyB5b3Ugd2FudCBtZSB0
byBwb3N0IHRoZSBjaGFuZ2VzIHRvIAo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnID8KPgo+
Cj4+Cj4+PiBkaWZmIC0tZ2l0IAo+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQgCj4+PiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGM3ZGZiZTdmNjdh
Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgCj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+Pj4gQEAgLTAsMCAr
MSwyOCBAQAo+Pj4gK2xlZC1iYWNrbGlnaHQgYmluZGluZ3MKPj4+ICsKPj4+ICtUaGlzIGJpbmRp
bmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBvZiAK
Pj4+IExFRHMuCj4+PiArSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdo
dCBkZXZpY2UgY29udHJvbGxlZCBieSAKPj4+IHRoZSBvdXRwdXQgb2YKPj4+ICthIExFRCBkcml2
ZXIuCj4+PiArCj4+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPj4+ICvCoCAtIGNvbXBhdGlibGU6
ICJsZWQtYmFja2xpZ2h0Igo+Pj4gK8KgIC0gbGVkczogYSBsaXN0IG9mIExFRHMKPj4gJ2xlZHMn
IGlzIGFscmVhZHkgdXNlZCBhcyBhIG5vZGUgbmFtZSBhbmQgbWl4aW5nIGlzIG5vdCBpZGVhbC4K
Pj4KPj4gV2UgYWxyZWFkeSBoYXZlICdmbGFzaC1sZWRzJyBpbiB1c2UgYW5kIHdpdGggdGhlIHNh
bWUgZGVmaW5pdGlvbiwgc28KPj4gbGV0cyBjb250aW51ZSB0aGF0IGFuZCB1c2UgJ2JhY2tsaWdo
dC1sZWRzJy4KPiBPSwoKSSBhbSB0YWtpbmcgdGhhdCBiYWNrLiBJIGhhdmUgYWRkZWQgb2ZfZ2V0
X2xlZCgpIGFuZCBkZXZtX29mX2dldF9sZWQoKSAKdG8gdGhlIExFRCBjb3JlIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvIGdldCBhIExFRCBmcm9tIHRoZSBEVC4gSSBtb2RlbGVkIAp0aGUgaW50ZXJmYWNl
IGxpa2UgaXQgaXMgZG9uZSBmb3IgUFdNLCBQSFlzIG9yIGNsb2Nrcy4gVGhlIHByb3BlcnR5IApj
b250YWluaW5nIGxpc3QvYXJyYXkgb2YgcGhhbmRsZcKgIGlzIGFsd2F5cyBuYW1lZCB0aGUgc2Ft
ZS4gVG8gZ2V0IG9uZSAKcGFydGljdWxhciBQV00vUEhZL2Nsb2NrLCBhIGlkZW50aWZpZXIgKG5h
bWUgb3IgaW50ZWdlcikgbXVzdCBiZSBwcm92aWRlZC4KClNvIHVubGVzcyB0aGVyZSBpcyBhIHN0
cm9uZyBpbmNlbnRpdmUgdG8gZG8gb3RoZXJ3aXNlIEkncyByYXRoZXIga2VlcCAKdGhpcyBuYW1l
IGhlcmUuCgoKSkoKCgo+Pj4gKwo+Pj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4+PiArwqAgLSBi
cmlnaHRuZXNzLWxldmVsczogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRo
ZSAKPj4+IGxldmVscyBtdXN0IGJlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW4gdGhlIHJhbmdlIGFjY2VwdGVkIGJ5IHRoZSB1bmRlcmx5aW5nIExF
RCAKPj4+IGRldmljZXMuCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgVGhpcyBpcyB1c2VkIHRvIHRyYW5zbGF0ZSBhIGJhY2tsaWdodCAKPj4+IGJyaWdo
dG5lc3MgbGV2ZWwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0IGlzIG5vdCAKPj4+IHByb3Zp
ZGVkLCB0aGUKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZGVudGl0eSBtYXBwaW5nIGlzIHVzZWQuCj4+PiArCj4+PiArwqAgLSBkZWZhdWx0LWJyaWdo
dG5lc3MtbGV2ZWw6IFRoZSBkZWZhdWx0IGJyaWdodG5lc3MgbGV2ZWwuCj4+IFlvdSBjYW4ganVz
dCBhc3N1bWUgdGhlc2UgMiBnZXQgYSBjb21tb24gc2NoZW1hIGF0IHNvbWUgcG9pbnQuIFNvIGp1
c3QKPj4gbmVlZCB0byBkZWZpbmUgYW55IGFkZGl0aW9uYWwgY29uc3RyYWludHMgaWYgcG9zc2li
bGUuCj4KPiBNYXliZSB3ZSBzaG91bGQga2VlcCB0aGVtIHVudGlsIHN1Y2ggYSBjb21tb24gc2No
ZW1hIGlzIHdyaXR0ZW4gPwo+Cj4gSkoKPgo+Pgo+PiBSb2IKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
