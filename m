Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341D1E6218
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7C06E544;
	Thu, 28 May 2020 13:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A35CA6E546
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:23:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59D0ED6E;
 Thu, 28 May 2020 06:23:08 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C92433F52E;
 Thu, 28 May 2020 06:23:06 -0700 (PDT)
Subject: Re: [PATCH 11/15] drm/panfrost: set devfreq clock name
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-12-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <8bc659b4-dbf9-5ae6-a677-937cab6bd798@arm.com>
Date: Thu, 28 May 2020 14:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-12-peron.clem@gmail.com>
Content-Language: en-GB
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFNvbWUgU29DcyBo
YXZlICBzZXZlcmFsIGNsb2NrcyBkZWZpbmVkIGFuZCB0aGUgT1BQIGNvcmUKPiBuZWVkcyB0byBr
bm93IHRoZSBleGFjdCBuYW1lIG9mIHRoZSBjbGsgdG8gdXNlLgo+IAo+IFNldCB0aGUgY2xvY2sg
bmFtZSB0byAiY29yZSIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJv
bi5jbGVtQGdtYWlsLmNvbT4KClRoaXMgaXMgdW5mb3J0dW5hdGVseSBhIHJlZ3Jlc3Npb24gZm9y
IHRoZSBSSzMyODguIFRoZSBkZXZpY2UgdHJlZSAKYmluZGluZyBkb2Vzbid0IHJlcXVpcmUgImNs
b2NrLW5hbWVzIiwgYW5kIGZvciB0aGUgUkszMjg4IGl0IGN1cnJlbnRseSAKaXNuJ3Qgc3BlY2lm
aWVkLiBTbyB0aGlzIGJyZWFrcyB0aGUgcGxhdGZvcm0uCgpBZGRpbmcgdGhlICJjbG9jay1uYW1l
cyIgdG8gdGhlIGRldmljZSB0cmVlICdmaXhlcycgaXQsIGJ1dCB3ZSByZWFsbHkgCm5lZWQgdG8g
a2VlcCBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4KClN0ZXZlCgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDEzICsrKysrKysrKysrKysKPiAg
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggfCAgMSArCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBpbmRleCA5ZmZlYTBkNGEwODcuLjZiZjM1NDFi
NGQ1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
Ywo+IEBAIC0xMDMsNiArMTAzLDE0IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gICAKPiAgIAlzcGluX2xvY2tfaW5pdCgmcGZkZXZm
cmVxLT5sb2NrKTsKPiAgIAo+ICsJb3BwX3RhYmxlID0gZGV2X3BtX29wcF9zZXRfY2xrbmFtZShk
ZXYsICJjb3JlIik7Cj4gKwlpZiAoSVNfRVJSKG9wcF90YWJsZSkpIHsKPiArCQlyZXQgPSBQVFJf
RVJSKG9wcF90YWJsZSk7Cj4gKwkJZ290byBlcnJfZmluaTsKPiArCX0KPiArCj4gKwlwZmRldmZy
ZXEtPmNsa25hbWVfb3BwX3RhYmxlID0gb3BwX3RhYmxlOwo+ICsKPiAgIAlvcHBfdGFibGUgPSBk
ZXZfcG1fb3BwX3NldF9yZWd1bGF0b3JzKGRldiwgcGZkZXYtPmNvbXAtPnN1cHBseV9uYW1lcywK
PiAgIAkJCQkJICAgICAgcGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcyk7Cj4gICAJaWYgKElTX0VS
UihvcHBfdGFibGUpKSB7Cj4gQEAgLTE3Niw2ICsxODQsMTEgQEAgdm9pZCBwYW5mcm9zdF9kZXZm
cmVxX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gICAJCWRldl9wbV9vcHBf
cHV0X3JlZ3VsYXRvcnMocGZkZXZmcmVxLT5yZWd1bGF0b3JzX29wcF90YWJsZSk7Cj4gICAJCXBm
ZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFibGUgPSBOVUxMOwo+ICAgCX0KPiArCj4gKwlpZiAo
cGZkZXZmcmVxLT5jbGtuYW1lX29wcF90YWJsZSkgewo+ICsJCWRldl9wbV9vcHBfcHV0X2Nsa25h
bWUocGZkZXZmcmVxLT5jbGtuYW1lX29wcF90YWJsZSk7Cj4gKwkJcGZkZXZmcmVxLT5jbGtuYW1l
X29wcF90YWJsZSA9IE5VTEw7Cj4gKwl9Cj4gICB9Cj4gICAKPiAgIHZvaWQgcGFuZnJvc3RfZGV2
ZnJlcV9yZXN1bWUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCj4gaW5kZXggMzQ3Y2RlNDc4NmNmLi4x
ZjI0NzVlMWQwMzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmgKPiBAQCAtMTYsNiArMTYsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlOwo+ICAg
c3RydWN0IHBhbmZyb3N0X2RldmZyZXEgewo+ICAgCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOwo+
ICAgCXN0cnVjdCBvcHBfdGFibGUgKnJlZ3VsYXRvcnNfb3BwX3RhYmxlOwo+ICsJc3RydWN0IG9w
cF90YWJsZSAqY2xrbmFtZV9vcHBfdGFibGU7Cj4gICAJc3RydWN0IHRoZXJtYWxfY29vbGluZ19k
ZXZpY2UgKmNvb2xpbmc7Cj4gICAJYm9vbCBvcHBfb2ZfdGFibGVfYWRkZWQ7Cj4gICAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
