Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8A57CE8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090216E5D9;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DE46E397
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 11:45:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QBjaMd112837;
 Wed, 26 Jun 2019 06:45:36 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QBja2C025430
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2019 06:45:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 26
 Jun 2019 06:45:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 26 Jun 2019 06:45:36 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QBjZMP020610;
 Wed, 26 Jun 2019 06:45:36 -0500
Subject: Re: [PATCH 2/2] backlight: arcxcnn: add "arctic" vendor prefix
From: Dan Murphy <dmurphy@ti.com>
To: Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-3-git-send-email-bdodge09@gmail.com>
 <e3a6f4f5-8da9-f533-5cef-3ae2a87f52bc@ti.com>
Message-ID: <215b39a5-8f4b-c96f-b5e7-292132d84813@ti.com>
Date: Wed, 26 Jun 2019 06:45:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e3a6f4f5-8da9-f533-5cef-3ae2a87f52bc@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561549536;
 bh=I/ctjznRxQiSnecOM85p6pOQO7x6Ipp335rglx6ouZk=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=qgKAcV4lw28iZNDurpHklbugvY3NO6YOrXSoOjL5wpAKSe6+PjzlMkWmEs7SU/UNm
 PI8TsmMNiNb+2u9Lk9VhFDkN5jIot5lOxQa9hcylqfUKzOvnOEkf2D4W0HxxpTMQPs
 8LvVNPZSlMbF4qpIuj3vsX+IGfQhYDzrQNypKjRo=
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8KCk9uZSBvdGhlciB0aGluZwoKT24gNi8yNi8xOSA2OjQyIEFNLCBEYW4gTXVycGh5IHdy
b3RlOgo+IEhlbGxvCj4KPiBPbiA2LzI0LzE5IDExOjA1IFBNLCBCcmlhbiBEb2RnZSB3cm90ZToK
Pj4gVGhlIG9yaWdpbmFsIHBhdGNoIGFkZGluZyB0aGlzIGRyaXZlciBhbmQgRFQgYmluZGluZ3Mg
aW1wcm9wZXJseQo+PiB1c2VkICJhcmMiIGFzIHRoZSB2ZW5kb3ItcHJlZml4LiBUaGlzIGFkZHMg
ImFyY3RpYyIgd2hpY2ggaXMgdGhlCj4+IHByb3BlciBwcmVmaXggYW5kIHJldGFpbnMgImFyYyIg
dG8gYWxsb3cgZXhpc3RpbmcgdXNlcnMgb2YgdGhlCj4+ICJhcmMiIHByZWZpeCB0byB1cGRhdGUg
dG8gbmV3IGtlcm5lbHMuIFRoZXJlIGlzIGF0IGxlYXN0IG9uZQo+PiAoU2Ftc3VuZyBDaHJvbWVi
b29rIFBsdXMpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIERvZGdlIDxiZG9kZ2UwOUBnbWFp
bC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMg
fCAzNSAKPj4gKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5jIAo+PiBiL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5fYmwuYwo+PiBpbmRleCA3YjFjMGEwLi4xNGM2N2YyIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hcmN4Y25uX2JsLmMKPj4gKysr
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYXJjeGNubl9ibC5jCj4+IEBAIC0xLDkgKzEsOSBA
QAo+PiDCoCAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4+IMKgIC8q
Cj4+IC0gKiBCYWNrbGlnaHQgZHJpdmVyIGZvciBBcmN0aWNTYW5kIEFSQ19YX0NfME5fME4gRGV2
aWNlcwo+PiArICogQmFja2xpZ2h0IGRyaXZlciBmb3IgcFNlbWkgKGZvcm1lcmx5IEFyY3RpY1Nh
bmQpIEFSQ19YX0NfME5fME4gCj4+IERldmljZXMKPj4gwqDCoCAqCj4+IC0gKiBDb3B5cmlnaHQg
MjAxNiBBcmN0aWNTYW5kLCBJbmMuCj4+IC0gKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8YmRvZGdl
QGFyY3RpY3NhbmQuY29tPgo+PiArICogQ29weXJpZ2h0IDIwMTYtMjAxOcKgIHBTZW1pLCBJbmMu
Cj4+ICsgKiBBdXRob3IgOiBCcmlhbiBEb2RnZSA8YmRvZGdlQHBzZW1pLmNvbT4KPj4gwqDCoCAq
Lwo+PiDCoCDCoCAjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+Cj4+IEBAIC0xOTEsMjcgKzE5
MSw0MCBAQCBzdGF0aWMgdm9pZCBhcmN4Y25uX3BhcnNlX2R0KHN0cnVjdCBhcmN4Y25uICpscCkK
Pj4gwqDCoMKgwqDCoCBpZiAocmV0ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBscC0+cGRh
dGEtPmluaXRpYWxfYnJpZ2h0bmVzcyA9IHByb2dfdmFsOwo+PiDCoCAtwqDCoMKgIHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0wIiwgJnByb2dfdmFsKTsK
Pj4gK8KgwqDCoCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjdGljLGxlZC1j
b25maWctMCIsICZwcm9nX3ZhbCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsbGVkLWNvbmZpZy0wIiwg
Cj4+ICZwcm9nX3ZhbCk7Cj4gQ2FuIHlvdSBhZGQgbmV3IGxpbmVzIGJldHdlZW4gdGhlc2UgYW5k
IGFsbCBiZWxvdwoKTWF5YmUgYWRkIGEgZGV2X2luZm8gaGVyZSB0byBpbmRpY2F0ZSB0aGF0IHRo
aXMgaXMgYmVpbmcgZGVwcmVjYXRlZC4KCkl0IHdpbGwgbWFrZSB0aGUgQ2hyb21lIGJvb2sgY29u
c29sZSBub2lzeSBidXQgYXQgbGVhc3QgaXQgd29uJ3QgZ28gc2lsZW50LgoKRGFuCgoKPj4gwqDC
oMKgwqDCoCBpZiAocmV0ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBscC0+cGRhdGEtPmxl
ZF9jb25maWdfMCA9ICh1OClwcm9nX3ZhbDsKPj4gwqAgLcKgwqDCoCByZXQgPSBvZl9wcm9wZXJ0
eV9yZWFkX3UzMihub2RlLCAiYXJjLGxlZC1jb25maWctMSIsICZwcm9nX3ZhbCk7Cj4+ICvCoMKg
wqAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyY3RpYyxsZWQtY29uZmlnLTEi
LCAmcHJvZ192YWwpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGxlZC1jb25maWctMSIsIAo+PiAmcHJv
Z192YWwpOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQgPT0gMCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGxwLT5wZGF0YS0+bGVkX2NvbmZpZ18xID0gKHU4KXByb2dfdmFsOwo+PiDCoCAtwqDCoMKgIHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsZGltLWZyZXEiLCAmcHJvZ192YWwp
Owo+PiArwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsZGlt
LWZyZXEiLCAmcHJvZ192YWwpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGRpbS1mcmVxIiwgJnByb2df
dmFsKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBs
cC0+cGRhdGEtPmRpbV9mcmVxID0gKHU4KXByb2dfdmFsOwo+PiDCoCAtwqDCoMKgIHJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsY29tcC1jb25maWciLCAmcHJvZ192YWwpOwo+
PiArwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsY29tcC1j
b25maWciLCAmcHJvZ192YWwpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAiYXJjLGNvbXAtY29uZmlnIiwgJnBy
b2dfdmFsKTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBscC0+cGRhdGEtPmNvbXBfY29uZmlnID0gKHU4KXByb2dfdmFsOwo+PiDCoCAtwqDCoMKgIHJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsZmlsdGVyLWNvbmZpZyIsICZwcm9n
X3ZhbCk7Cj4+ICvCoMKgwqAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyY3Rp
YyxmaWx0ZXItY29uZmlnIiwgCj4+ICZwcm9nX3ZhbCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImFyYyxmaWx0ZXItY29uZmlnIiwgJnByb2dfdmFs
KTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0ID09IDApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBscC0+
cGRhdGEtPmZpbHRlcl9jb25maWcgPSAodTgpcHJvZ192YWw7Cj4+IMKgIC3CoMKgwqAgcmV0ID0g
b2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyx0cmltLWNvbmZpZyIsICZwcm9nX3ZhbCk7
Cj4+ICvCoMKgwqAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyY3RpYyx0cmlt
LWNvbmZpZyIsICZwcm9nX3ZhbCk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmMsdHJpbS1jb25maWciLCAm
cHJvZ192YWwpOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQgPT0gMCkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGxwLT5wZGF0YS0+dHJpbV9jb25maWcgPSAodTgpcHJvZ192YWw7Cj4+IMKgIEBAIC0zODEs
NiArMzk0LDggQEAgc3RhdGljIGludCBhcmN4Y25uX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2wpCj4+IMKgIH0KPj4gwqAgwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXJj
eGNubl9kdF9pZHNbXSA9IHsKPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gImFyY3RpYyxhcmMy
YzA2MDgiIH0sCj4+ICvCoMKgwqAgLyogaGVyZSB0byByZW1haW0gY29tcGF0aWJsZSB3aXRoIGFu
IG9sZGVyIGJpbmRpbmcsIGRvIG5vdCB1c2UgKi8KPgo+IHMvcmVtYWltL3JlbWFpbgo+Cj4KPj4g
wqDCoMKgwqDCoCB7IC5jb21wYXRpYmxlID0gImFyYyxhcmMyYzA2MDgiIH0sCj4+IMKgwqDCoMKg
wqAgeyB9Cj4+IMKgIH07Cj4+IEBAIC00MDQsNSArNDE5LDUgQEAgc3RhdGljIHN0cnVjdCBpMmNf
ZHJpdmVyIGFyY3hjbm5fZHJpdmVyID0gewo+PiDCoCBtb2R1bGVfaTJjX2RyaXZlcihhcmN4Y25u
X2RyaXZlcik7Cj4+IMKgIMKgIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPj4gLU1PRFVMRV9B
VVRIT1IoIkJyaWFuIERvZGdlIDxiZG9kZ2VAYXJjdGljc2FuZC5jb20+Iik7Cj4+ICtNT0RVTEVf
QVVUSE9SKCJCcmlhbiBEb2RnZSA8YmRvZGdlQHBzZW1pLmNvbT4iKTsKPj4gwqAgTU9EVUxFX0RF
U0NSSVBUSU9OKCJBUkNYQ05OIEJhY2tsaWdodCBkcml2ZXIiKTsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
