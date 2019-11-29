Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21C10D356
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB64F89B55;
	Fri, 29 Nov 2019 09:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3D3D89B55
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:38:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 392D430E;
 Fri, 29 Nov 2019 01:38:05 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 874D53F68E;
 Fri, 29 Nov 2019 01:38:04 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Register devfreq cooling device
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <4cba7648-1354-757b-f6c8-32942e01c69d@arm.com>
Date: Fri, 29 Nov 2019 09:38:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
Content-Language: en-US
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
Cc: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMTEvMjAxOSAyMDo1NCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IFdoZW4gd2UgaGF2ZSBk
ZXZmcmVxLCBhbHNvIHRyeSB0byByZWdpc3RlciBhIGJhc2ljIGNvb2xpbmcgZGV2aWNlIGluCj4g
Y2FzZSBHUFUgd29ya2xvYWRzIG1hbmFnZSB0byBoaXQgdGhlcm1hbCB0aHJvdHRsaW5nIHRocmVz
aG9sZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJt
LmNvbT4KClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDMy
ICsrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jCj4gaW5kZXggNGM0ZThhMzBhMWFjLi5mZThlZTc3Yzk2ZTQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtMSw2ICsx
LDcgQEAKPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgLyogQ29weXJp
Z2h0IDIwMTkgQ29sbGFib3JhIGx0ZC4gKi8KPiAgI2luY2x1ZGUgPGxpbnV4L2RldmZyZXEuaD4K
PiArI2luY2x1ZGUgPGxpbnV4L2RldmZyZXFfY29vbGluZy5oPgo+ICAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbV9vcHAuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2Nsay5oPgo+IEBAIC04MSw4ICs4MiwxMSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJl
cV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAJaW50IHJldDsKPiAgCXN0
cnVjdCBkZXZfcG1fb3BwICpvcHA7Cj4gIAl1bnNpZ25lZCBsb25nIGN1cl9mcmVxOwo+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBmZGV2LT5wZGV2LT5kZXY7Cj4gKwlzdHJ1Y3QgZGV2ZnJlcSAq
ZGV2ZnJlcTsKPiArCXN0cnVjdCB0aGVybWFsX2Nvb2xpbmdfZGV2aWNlICpjb29saW5nOwo+ICAK
PiAtCXJldCA9IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCZwZmRldi0+cGRldi0+ZGV2KTsKPiAr
CXJldCA9IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKGRldik7Cj4gIAlpZiAocmV0ID09IC1FTk9E
RVYpIC8qIE9wdGlvbmFsLCBjb250aW51ZSB3aXRob3V0IGRldmZyZXEgKi8KPiAgCQlyZXR1cm4g
MDsKPiAgCWVsc2UgaWYgKHJldCkKPiBAQCAtOTIsMjkgKzk2LDM1IEBAIGludCBwYW5mcm9zdF9k
ZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIAo+ICAJY3VyX2Zy
ZXEgPSBjbGtfZ2V0X3JhdGUocGZkZXYtPmNsb2NrKTsKPiAgCj4gLQlvcHAgPSBkZXZmcmVxX3Jl
Y29tbWVuZGVkX29wcCgmcGZkZXYtPnBkZXYtPmRldiwgJmN1cl9mcmVxLCAwKTsKPiArCW9wcCA9
IGRldmZyZXFfcmVjb21tZW5kZWRfb3BwKGRldiwgJmN1cl9mcmVxLCAwKTsKPiAgCWlmIChJU19F
UlIob3BwKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihvcHApOwo+ICAKPiAgCXBhbmZyb3N0X2RldmZy
ZXFfcHJvZmlsZS5pbml0aWFsX2ZyZXEgPSBjdXJfZnJlcTsKPiAgCWRldl9wbV9vcHBfcHV0KG9w
cCk7Cj4gIAo+IC0JcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2
aWNlKCZwZmRldi0+cGRldi0+ZGV2LAo+IC0JCQkmcGFuZnJvc3RfZGV2ZnJlcV9wcm9maWxlLCBE
RVZGUkVRX0dPVl9TSU1QTEVfT05ERU1BTkQsCj4gLQkJCU5VTEwpOwo+IC0JaWYgKElTX0VSUihw
ZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKSkgewo+IC0JCURSTV9ERVZfRVJST1IoJnBmZGV2LT5wZGV2
LT5kZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsKPiAtCQlyZXQgPSBQ
VFJfRVJSKHBmZGV2LT5kZXZmcmVxLmRldmZyZXEpOwo+IC0JCXBmZGV2LT5kZXZmcmVxLmRldmZy
ZXEgPSBOVUxMOwo+IC0JCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKCZwZmRldi0+cGRldi0+
ZGV2KTsKPiAtCQlyZXR1cm4gcmV0Owo+ICsJZGV2ZnJlcSA9IGRldm1fZGV2ZnJlcV9hZGRfZGV2
aWNlKGRldiwgJnBhbmZyb3N0X2RldmZyZXFfcHJvZmlsZSwKPiArCQkJCQkgIERFVkZSRVFfR09W
X1NJTVBMRV9PTkRFTUFORCwgTlVMTCk7Cj4gKwlpZiAoSVNfRVJSKGRldmZyZXEpKSB7Cj4gKwkJ
RFJNX0RFVl9FUlJPUihkZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsK
PiArCQlkZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZShkZXYpOwo+ICsJCXJldHVybiBQVFJfRVJS
KGRldmZyZXEpOwo+ICAJfQo+ICsJcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSA9IGRldmZyZXE7Cj4g
Kwo+ICsJY29vbGluZyA9IG9mX2RldmZyZXFfY29vbGluZ19yZWdpc3RlcihkZXYtPm9mX25vZGUs
IGRldmZyZXEpOwo+ICsJaWYgKElTX0VSUihjb29saW5nKSkKPiArCQlEUk1fREVWX0lORk8oZGV2
LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIGNvb2xpbmcgZGV2aWNlXG4iKTsKPiArCWVsc2UKPiArCQlw
ZmRldi0+ZGV2ZnJlcS5jb29saW5nID0gY29vbGluZzsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYpCj4gIHsKPiArCWlmIChwZmRldi0+ZGV2ZnJlcS5jb29saW5nKQo+ICsJCWRldmZyZXFf
Y29vbGluZ191bnJlZ2lzdGVyKHBmZGV2LT5kZXZmcmVxLmNvb2xpbmcpOwo+ICAJZGV2X3BtX29w
cF9vZl9yZW1vdmVfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOwo+ICB9Cj4gIAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
