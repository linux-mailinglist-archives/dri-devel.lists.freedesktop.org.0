Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EDDCA9EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 19:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F16EA28;
	Thu,  3 Oct 2019 17:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5916EA28
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 17:23:44 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93HNef8050113;
 Thu, 3 Oct 2019 12:23:40 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93HNdRh005634
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 12:23:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 12:23:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 12:23:28 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93HNbUm045560;
 Thu, 3 Oct 2019 12:23:37 -0500
Subject: Re: [PATCH v8 5/5] backlight: add led-backlight driver
To: Sebastian Reichel <sre@kernel.org>
References: <20191003082812.28491-1-jjhiblot@ti.com>
 <20191003082812.28491-6-jjhiblot@ti.com>
 <20191003114735.byayntpe35qqrjeu@earth.universe>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <074963ce-d28f-413a-f35c-d503589a4604@ti.com>
Date: Thu, 3 Oct 2019 19:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003114735.byayntpe35qqrjeu@earth.universe>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570123420;
 bh=iWtSBJKe76nynGhnxiOJ2Lg3nCj737L2QbGyJus8OHE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ata+h7vnlts4aIRPksMFgleVPIt3OELkhLgzkSJT8AwEhjMkDFV3VLBW5frWbZhz8
 9lLeYzkW7QmilsFkhY2SrY9ih7FUzt6UJwlSPQwIuu5o2od2B5BS6t6GR5Xpu8irGT
 65j/0TSJeoEC6x49nwjVjNyMTvWFbp0UCFhaznEM=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ViYXN0aWFuLAoKT24gMDMvMTAvMjAxOSAxMzo0NywgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6
Cj4gSGksCj4KPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAxMDoyODoxMkFNICswMjAwLCBKZWFu
LUphY3F1ZXMgSGlibG90IHdyb3RlOgo+PiBGcm9tOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxr
ZWluZW5AdGkuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIGFkZHMgYSBsZWQtYmFja2xpZ2h0IGRyaXZl
ciAobGVkX2JsKSwgd2hpY2ggaXMgc2ltaWxhciB0bwo+PiBwd21fYmwgZXhjZXB0IHRoZSBkcml2
ZXIgdXNlcyBhIExFRCBjbGFzcyBkcml2ZXIgdG8gYWRqdXN0IHRoZQo+PiBicmlnaHRuZXNzIGlu
IHRoZSBIVy4gTXVsdGlwbGUgTEVEcyBjYW4gYmUgdXNlZCBmb3IgYSBzaW5nbGUgYmFja2xpZ2h0
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5j
b20+Cj4+IEFja2VkLWJ5OiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KPj4gUmV2aWV3ZWQt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4+IC0tLQo+
IFJldmlld2VkLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFi
b3JhLmNvbT4KPgo+ICh3aXRoIHNvbWUgc3VnZ2VzdGlvbnMgYmVsb3cpCgpbLi4uXQoKCj4gSSBz
dWdnZXN0IHRvIHJlc3RydWN0dXJlOgo+Cj4gMS4gY2FsbCBsZWRfc3lzZnNfZGlzYWJsZQo+Cj4g
Mi4gdXNlIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIHRvIHJlZ2lzdGVyIHRoZQo+ICAgICBs
ZWRfc3lzZnNfZW5hYmxlIGxvb3AKPgo+IDMuIHVzZSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVn
aXN0ZXIoKSB0byByZWdpc3RlciBCTAo+Cj4gNC4gZHJvcCB0aGUgcmVtb3ZlIGZ1bmN0aW9uCj4K
Pj4gKwo+PiArCWJhY2tsaWdodF91cGRhdGVfc3RhdHVzKHByaXYtPmJsX2Rldik7Cj4+ICsKPj4g
KwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBsZWRfYmxfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IGxlZF9ibF9kYXRhICpw
cml2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4+ICsJc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJsID0gcHJpdi0+YmxfZGV2Owo+PiArCWludCBpOwo+PiArCj4+ICsJYmFja2xpZ2h0
X2RldmljZV91bnJlZ2lzdGVyKGJsKTsKPj4gKwo+PiArCWxlZF9ibF9wb3dlcl9vZmYocHJpdik7
Cj4+ICsJZm9yIChpID0gMDsgaSA8IHByaXYtPm5iX2xlZHM7IGkrKykKPj4gKwkJbGVkX3N5c2Zz
X2VuYWJsZShwcml2LT5sZWRzW2ldKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsZWRfYmxfb2ZfbWF0Y2hbXSA9IHsK
Pj4gKwl7IC5jb21wYXRpYmxlID0gImxlZC1iYWNrbGlnaHQiIH0sCj4+ICsJeyB9Cj4+ICt9Owo+
PiArCj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBsZWRfYmxfb2ZfbWF0Y2gpOwo+PiArCj4+
ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBsZWRfYmxfZHJpdmVyID0gewo+PiArCS5k
cml2ZXIJCT0gewo+PiArCQkubmFtZQkJPSAibGVkLWJhY2tsaWdodCIsCj4+ICsJCS5vZl9tYXRj
aF90YWJsZQk9IG9mX21hdGNoX3B0cihsZWRfYmxfb2ZfbWF0Y2gpLAo+IFlvdSBzaG91bGQgZHJv
cCBvZl9tYXRjaF9wdHIoKS4gU2luY2UgdGhlIGRyaXZlciBkZXBlbmRzIG9uIE9GLAo+IGl0IHdp
bGwgYWx3YXlzIHNpbXBseSByZXR1cm4gbGVkX2JsX29mX21hdGNoLgo+Cj4gKEFsc28gYWZ0ZXIg
cmVtb3ZpbmcgdGhlIE9GIGRlcGVuZGVuY3kgZnJvbSB0aGUgZHJpdmVyIGl0IHdvdWxkCj4gZWl0
aGVyIHJlcXVpcmUgbGVkX2JsX29mX21hdGNoIHRvIGJlIG1hcmtlZCBfX21heWJlX3VudXNlZCBv
cgo+IG1vdmluZyBpdCBpbnRvIGEgI2lmIENPTkZJR19PRiBhcmVhIHRvIGF2b2lkIHdhcm5pbmdz
LikKClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb25zLiBJIHRoaW5rIEknbGwgd29yayBvbiB0aGVt
IGFzIGEgc2VwYXJhdGUgCnRoaW5nIGFuZCBwb3N0IHRoZW0gYWZ0ZXIgdGhpcyBpcyBtZXJnZWQg
aWYgdGhlcmUgYXJlIG5vIG90aGVycyBjaGFuZ2VzIApyZXF1aXJlZC4KCkpKCgo+Cj4gLS0gU2Vi
YXN0aWFuCj4KPj4gKwl9LAo+PiArCS5wcm9iZQkJPSBsZWRfYmxfcHJvYmUsCj4+ICsJLnJlbW92
ZQkJPSBsZWRfYmxfcmVtb3ZlLAo+PiArfTsKPj4gKwo+PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cihsZWRfYmxfZHJpdmVyKTsKPj4gKwo+PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJMRUQgYmFzZWQg
QmFja2xpZ2h0IERyaXZlciIpOwo+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+PiArTU9EVUxF
X0FMSUFTKCJwbGF0Zm9ybTpsZWQtYmFja2xpZ2h0Iik7Cj4+IC0tIAo+PiAyLjE3LjEKPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
