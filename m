Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585106315A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08571897E0;
	Tue,  9 Jul 2019 07:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9782989FFD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 18:02:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68I2pM2047759;
 Mon, 8 Jul 2019 13:02:51 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68I2oAi097972
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 13:02:51 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 13:02:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 13:02:50 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68I2oNO005559;
 Mon, 8 Jul 2019 13:02:50 -0500
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Brian Dodge <bdodge09@gmail.com>, <pavel@ucw.cz>
References: <1561940895-15837-1-git-send-email-bdodge09@gmail.com>
 <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <f2cf7c51-4857-30bd-a096-b1ce5ff01bd5@ti.com>
Date: Mon, 8 Jul 2019 13:02:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561940895-15837-2-git-send-email-bdodge09@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562608971;
 bh=gCVJdCJhOuBj+s1tpW3aHcSTDf/4h8j7xDhTsbbntpw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Zex9v9fYpK9P9FJArcOrRkHIxc5liW5n3jTKlUu2erCIFlqDEneyO7RSGHgwLxVMb
 E8dG1bHdLu6TMsSK50wac9QaPZ7ORQQgbIw1O9Z1rfwZu6Gb90sNHPYZnP//Ic1hfW
 k14egafNPi7SDCha/15Sekl+7Fq6Fw2wXvYx97rU=
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

QnJpYW4KCk9uIDYvMzAvMTkgNzoyOCBQTSwgQnJpYW4gRG9kZ2Ugd3JvdGU6Cj4gVGhlIHZlbmRv
ci1wcmVmaXhlcy50eHQgZmlsZSBwcm9wZXJseSByZWZlcnMgdG8gQXJjdGljU2FuZAo+IGFzIGFy
Y3RpYyBidXQgdGhlIGRyaXZlciBiaW5kaW5ncyBpbXByb3Blcmx5IGFiYnJldmlhdGVkIHRoZQo+
IHByZWZpeCB0byBhcmMuIFRoaXMgd2FzIGEgbWlzdGFrZSBpbiB0aGUgb3JpZ2luYWwgcGF0Y2gu
IFRoaXMKPiBwYXRjaCBhZGRzICJhcmN0aWMiIGFuZCByZXRhaW5zICJhcmMiIChkZXByZWNhdGVk
KSBiaW5kaW5ncwo+Cj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gRG9kZ2UgPGJkb2RnZTA5QGdtYWls
LmNvbT4KPiAtLS0KPiAgIC4uLi9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4
dCAgICAgICAgIHwgMzEgKysrKysrKysrKysrKysrLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4Y25uX2JsLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9hcmN4
Y25uX2JsLnR4dAo+IGluZGV4IDIzMGFiZGUuLjRkOTgzOTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2FyY3hjbm5fYmwudHh0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2FyY3hjbm5fYmwudHh0Cj4gQEAgLTEsOCArMSwxMyBAQAo+IC1CaW5kaW5nIGZvciBBcmN0aWNT
YW5kIGFyYzJjMDYwOCBMRUQgZHJpdmVyCj4gK0JpbmRpbmcgZm9yIEFyY3RpY1NhbmQgYXJjIGZh
bWlseSBMRUQgZHJpdmVycwo+ICAgCj4gICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0tIGNvbXBh
dGlibGU6CQlzaG91bGQgYmUgImFyYyxhcmMyYzA2MDgiCj4gLS0gcmVnOgkJCXNsYXZlIGFkZHJl
c3MKPiArLSBjb21wYXRpYmxlOiBvbmUgb2YKPiArCSJhcmN0aWMsYXJjMWMwNjA4Igo+ICsJImFy
Y3RpYyxhcmMyYzA2MDgiCj4gKwkiYXJjdGljLGFyYzNjMDg0NSIKPiArCSJhcmMsYXJjMmMwNjA4
IiAoZGVwcmVjYXRlZCkKPiArCj4gKy0gcmVnOgkJc2xhdmUgYWRkcmVzcwo+ICAgCj4gICBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ICAgLSBkZWZhdWx0LWJyaWdodG5lc3M6CWJyaWdodG5lc3MgdmFs
dWUgb24gYm9vdCwgdmFsdWUgZnJvbTogMC00MDk1Cj4gQEAgLTExLDE5ICsxNiwyNSBAQCBPcHRp
b25hbCBwcm9wZXJ0aWVzOgo+ICAgLSBsZWQtc291cmNlczoJCUxpc3Qgb2YgZW5hYmxlZCBjaGFu
bmVscyBmcm9tIDAgdG8gNS4KPiAgIAkJCVNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbGVkcy9jb21tb24udHh0Cj4gICAKPiAtLSBhcmMsbGVkLWNvbmZpZy0wOglzZXR0aW5n
IGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18wCj4gLS0gYXJjLGxlZC1jb25maWctMToJc2V0dGlu
ZyBmb3IgcmVnaXN0ZXIgSUxFRF9DT05GSUdfMQo+IC0tIGFyYyxkaW0tZnJlcToJCVBXTSBtb2Rl
IGZyZXF1ZW5jZSBzZXR0aW5nIChiaXRzIFszOjBdIHVzZWQpCj4gLS0gYXJjLGNvbXAtY29uZmln
OglzZXR0aW5nIGZvciByZWdpc3RlciBDT05GSUdfQ09NUAo+IC0tIGFyYyxmaWx0ZXItY29uZmln
OglzZXR0aW5nIGZvciByZWdpc3RlciBGSUxURVJfQ09ORklHCj4gLS0gYXJjLHRyaW0tY29uZmln
OglzZXR0aW5nIGZvciByZWdpc3RlciBJTUFYVFVORQo+ICstIGFyY3RpYyxsZWQtY29uZmlnLTA6
CXNldHRpbmcgZm9yIHJlZ2lzdGVyIElMRURfQ09ORklHXzAKPiArLSBhcmN0aWMsbGVkLWNvbmZp
Zy0xOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18xCj4gKy0gYXJjdGljLGRpbS1m
cmVxOglQV00gbW9kZSBmcmVxdWVuY2Ugc2V0dGluZyAoYml0cyBbMzowXSB1c2VkKQo+ICstIGFy
Y3RpYyxjb21wLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgQ09ORklHX0NPTVAKPiArLSBh
cmN0aWMsZmlsdGVyLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgRklMVEVSX0NPTkZJRwo+
ICstIGFyY3RpYyx0cmltLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgSU1BWFRVTkUKPiAr
LSBhcmMsbGVkLWNvbmZpZy0wOglzZXR0aW5nIGZvciByZWdpc3RlciBJTEVEX0NPTkZJR18wIChk
ZXByZWNhdGVkKQo+ICstIGFyYyxsZWQtY29uZmlnLTE6CXNldHRpbmcgZm9yIHJlZ2lzdGVyIElM
RURfQ09ORklHXzEgKGRlcHJlY2F0ZWQpCj4gKy0gYXJjLGRpbS1mcmVxOgkJUFdNIG1vZGUgZnJl
cXVlbmNlIHNldHRpbmcgKGJpdHMgWzM6MF0gdXNlZCkgKGRlcHJlY2F0ZWQpCj4gKy0gYXJjLGNv
bXAtY29uZmlnOglzZXR0aW5nIGZvciByZWdpc3RlciBDT05GSUdfQ09NUCAoZGVwcmVjYXRlZCkK
PiArLSBhcmMsZmlsdGVyLWNvbmZpZzoJc2V0dGluZyBmb3IgcmVnaXN0ZXIgRklMVEVSX0NPTkZJ
RyAoZGVwcmVjYXRlZCkKPiArLSBhcmMsdHJpbS1jb25maWc6CXNldHRpbmcgZm9yIHJlZ2lzdGVy
IElNQVhUVU5FIChkZXByZWNhdGVkKQo+ICAgCj4gICBOb3RlOiBPcHRpb25hbCBwcm9wZXJ0aWVz
IG5vdCBzcGVjaWZpZWQgd2lsbCBkZWZhdWx0IHRvIHZhbHVlcyBpbiBJQyBFUFJPTQo+ICAgCj4g
ICBFeGFtcGxlOgo+ICAgCj4gICBhcmMyYzA2MDhAMzAgewo+IC0JY29tcGF0aWJsZSA9ICJhcmMs
YXJjMmMwNjA4IjsKPiArCWNvbXBhdGlibGUgPSAiYXJjdGljLGFyYzJjMDYwOCI7Cj4gICAJcmVn
ID0gPDB4MzA+Owo+ICAgCWRlZmF1bHQtYnJpZ2h0bmVzcyA9IDw1MDA+Owo+ICAgCWxhYmVsID0g
ImxjZC1iYWNrbGlnaHQiOwoKClJldmlld2VkLWJ5OiBEYW4gTXVycGh5IDxkbXVycGh5QHRpLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
