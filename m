Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8CD2738
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 12:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3EA6E362;
	Thu, 10 Oct 2019 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6BD6E362
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 10:31:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AAVt4E002714;
 Thu, 10 Oct 2019 05:31:55 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AAVtK2097014
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 05:31:55 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 05:31:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 05:31:51 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AAVqgX109829;
 Thu, 10 Oct 2019 05:31:52 -0500
Subject: Re: [PATCH v10 4/6] dts-bindings: leds: Document the naming
 requirement for LED properties
To: Rob Herring <robh@kernel.org>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-5-jjhiblot@ti.com> <20191009192628.GA24087@bogus>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <f281d352-ec3e-f80a-66ea-b955609f2531@ti.com>
Date: Thu, 10 Oct 2019 12:31:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009192628.GA24087@bogus>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570703515;
 bh=oTQ6m0DLPijn4Z75VG/MQLEv1ErJGwIKzArMsIw7Reo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=gDzQJKaL5ZvdXWt7JQU1Odz5MXSAU4BnqfxoG/K0mKbj9ifPOyncptYUb7TWOxNKK
 hwA3dCOfGekVFIyO6giwm6HTdfezyLf8Zfb2pNXgv7h1nZXjZbBN/CARWAhW14fwyX
 EyTHEoXmvGGZB6t5MTMX77NJ7D+7aVI5uRsNEJw8=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA5LzEwLzIwMTkgMjE6MjYsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDA5
LCAyMDE5IGF0IDEwOjUxOjI1QU0gKzAyMDAsIEplYW4tSmFjcXVlcyBIaWJsb3Qgd3JvdGU6Cj4+
IExFRCBwcm9wZXJ0aWVzIG11c3QgYmUgbmFtZWQgImxlZHMiIGluIHRoZSBzYW1lIHdheSB0aGF0
IFBXTSwgY2xvY2tzIG9yCj4+IFBIWSBwcm9wZXJ0aWVzIGFyZSBuYW1lcyByZXNwZWN0aXZlbHkg
InB3bXMiLCAiY2xvY2tzIiBhbmQgInBoeXMiLgo+Pgo+PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RA
dGkuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50
eHQgICAgICAgfCAyMCArKysrKysrKysrKysrKysrLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAo+PiBpbmRleCA5ZmE2Zjk3OTVk
NTAuLjMxYjhjMWY2OGQyNyAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvY29tbW9uLnR4dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0Cj4+IEBAIC0xMCw2ICsxMCw5IEBAIGNhbiBpbmZs
dWVuY2UgdGhlIHdheSBvZiB0aGUgTEVEIGRldmljZSBpbml0aWFsaXphdGlvbiwgdGhlIExFRCBj
b21wb25lbnRzCj4+ICAgaGF2ZSB0byBiZSB0aWdodGx5IGNvdXBsZWQgd2l0aCB0aGUgTEVEIGRl
dmljZSBiaW5kaW5nLiBUaGV5IGFyZSByZXByZXNlbnRlZAo+PiAgIGJ5IGNoaWxkIG5vZGVzIG9m
IHRoZSBwYXJlbnQgTEVEIGRldmljZSBiaW5kaW5nLgo+PiAgIAo+PiArTEVEIHByb3BlcnRpZXMg
c2hvdWxkIGJlIG5hbWVkICJsZWRzIi4gVGhlIGV4YWN0IG1lYW5pbmcgb2YgZWFjaCBsZWRzCj4+
ICtwcm9wZXJ0eSBtdXN0IGJlIGRvY3VtZW50ZWQgaW4gdGhlIGRldmljZSB0cmVlIGJpbmRpbmcg
Zm9yIGVhY2ggZGV2aWNlLgo+PiArCj4gVGhpcyBpcyB3b3JkZWQgb2RkbHkuIFRoZSBwcm9wZXJ0
eSBpcyAnbGVkcycgYW5kIGl0IGlzIGFsd2F5cyBhIGxpc3Qgb2YKPiBwaGFuZGxlcyB0byBMRUQg
ZGV2aWNlIG5vZGVzLiBJdCBpcyBwcmVzZW50IGluIGFuIExFRCBjb25zdW1lciBkZXZpY2UuCgpI
b3cgYWJvdXQ6CgpbLi4uXQoKQSBMRUQgY29uc3VtZXIgZGV2aWNlIGhhcyBhICdsZWRzJyBwcm9w
ZXJ0eS4gVGhpcyBwcm9wZXJ0eSBpcyBhbHdheXMgYSBsaXN0Cm9mIHBoYW5kbGVzIHRvIExFRCBu
b2RlcyAoY2hpbGQgbm9kZSBvZiBhIExFRCBkZXZpY2Ugbm9kZSkuCgpsZWRfZGV2aWNlIHsKIMKg
wqDCoCAuLi4KCiDCoMKgwqAgbGVkMDogbGVkQDAgewogwqDCoMKgIMKgwqDCoCAuLi4KIMKgwqDC
oCB9OwoKIMKgwqDCoCBsZWQxOiBsZWRAMSB7CiDCoMKgwqAgwqDCoMKgIC4uLgogwqDCoMKgIH07
Cn07Cgpjb25zdW1lciB7CiDCoMKgwqAgLi4uCiDCoMKgwqAgbGVkcyA9IDxsZWQwPiwgPGxlZDE+
Owp9OwoKPgo+PiAgIAo+PiAgIE9wdGlvbmFsIHByb3BlcnRpZXMgZm9yIGNoaWxkIG5vZGVzOgo+
PiAgIC0gbGVkLXNvdXJjZXMgOiBMaXN0IG9mIGRldmljZSBjdXJyZW50IG91dHB1dHMgdGhlIExF
RCBpcyBjb25uZWN0ZWQgdG8uIFRoZQo+PiBAQCAtMTY1LDkgKzE2OCwyMCBAQCBsZWQtY29udHJv
bGxlckAzMCB7Cj4+ICAgCQlmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDI+Owo+PiAgICAgICAgICAg
fTsKPj4gICAKPj4gLSAgICAgICAgbGVkQDMgewo+PiArICAgICAgICBia2xfbGVkMDogbGVkQDMg
ewo+PiAgIAkJcmVnID0gPDM+Owo+PiAtCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJQ0FU
T1I7Cj4+IC0JCWZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8Mz47Cj4+ICsJCWZ1bmN0aW9uID0gTEVE
X0ZVTkNUSU9OX0JBQ0tMSUdIVDsKPj4gKwkJZnVuY3Rpb24tZW51bWVyYXRvciA9IDwxPjsKPj4g
ICAgICAgICAgIH07Cj4+ICsKPj4gKyAgICAgICAgYmtsX2xlZDE6IGxlZEA0IHsKPj4gKwkJcmVn
ID0gPDQ+Owo+PiArCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9CQUNLTElHSFQ7Cj4+ICsJCWZ1
bmN0aW9uLWVudW1lcmF0b3IgPSA8Mj47Cj4+ICsgICAgICAgIH07Cj4+ICt9Owo+PiArCj4+ICsK
Pj4gK2JhY2tsaWdodEA0MCB7Cj4gRWl0aGVyIG5lZWRzICdyZWcnIG9yIHRoZSB1bml0LWFkZHJl
c3MgZHJvcHBlZC4KPgo+PiArCWxlZHMgPSA8JmJrbF9sZWQwPiAsIDwmYmtsX2xlZDE+Owo+IGRy
b3AgdGhlIHNwYWNlICAgICAgICAgICAgXgo+Cj4+ICAgfTsKPj4gLS0gCj4+IDIuMTcuMQo+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
