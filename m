Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FF114E99
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 11:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610D6F9A6;
	Fri,  6 Dec 2019 10:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE7BE6F9A6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 10:02:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41D4C1FB;
 Fri,  6 Dec 2019 02:02:24 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C748C3F718;
 Fri,  6 Dec 2019 02:02:22 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: no need to display probe deferred error
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20191205221102.28248-1-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <ad2de6cc-41a2-7a4e-fe8a-84890b6c110a@arm.com>
Date: Fri, 6 Dec 2019 10:02:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205221102.28248-1-peron.clem@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMTIvMjAxOSAyMjoxMSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFBhbmZyb3N0IGRy
aXZlciBpcyBzaG91dGluZyBhbiBlcnJvciBpZiB0aGUgcmVndWxhdG9yIGluaXQKPiByZXR1cm4g
YW4gLUVQUk9CRV9ERUZGRVIuIFRoaXMgaXMgYSBub3QgYSByZWFsIGVycm9yIGFuZAo+IGl0IGRv
ZXNuJ3QgcmVxdWlyZSB0byBiZSBkaXNwbGF5Lgo+IAo+IENoZWNrIGlmIHRoZSBlcnJvciBpcyBu
b3QgYW4gRVBST0JFX0RFRkZFUiBiZWZvcmUgZGlzcGxheWluZyBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCA2ICsrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiBpbmRleCAyMzhmYjZkNTRkZjQu
LjAwY2VmMDYyYzM1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2aWNlLmMKPiBAQCAtOTIsNyArOTIsOCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlZ3VsYXRv
cl9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAJcGZkZXYtPnJlZ3VsYXRv
ciA9IGRldm1fcmVndWxhdG9yX2dldChwZmRldi0+ZGV2LCAibWFsaSIpOwo+ICAJaWYgKElTX0VS
UihwZmRldi0+cmVndWxhdG9yKSkgewo+ICAJCXJldCA9IFBUUl9FUlIocGZkZXYtPnJlZ3VsYXRv
cik7Cj4gLQkJZGV2X2VycihwZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVk
XG4iLCByZXQpOwo+ICsJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiArCQkJZGV2X2Vycihw
ZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwo+ICAJCXJl
dHVybiByZXQ7Cj4gIAl9Cj4gIAo+IEBAIC0xMzAsNyArMTMxLDggQEAgaW50IHBhbmZyb3N0X2Rl
dmljZV9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAKPiAgCWVyciA9IHBh
bmZyb3N0X3JlZ3VsYXRvcl9pbml0KHBmZGV2KTsKPiAgCWlmIChlcnIpIHsKPiAtCQlkZXZfZXJy
KHBmZGV2LT5kZXYsICJyZWd1bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7Cj4gKwkJaWYg
KGVyciAhPSAtRVBST0JFX0RFRkVSKQo+ICsJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJyZWd1bGF0
b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7CgpZb3UgY291bGQgYWN0dWFsbHkgZHJvcCB0aGlz
IGRldl9lcnIoKSBhbHRvZ2V0aGVyIC0KcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoKSB3aWxsIGFs
d2F5cyBwcm9kdWNlIGl0J3Mgb3duIGRldl9lcnIoKSBvdXRwdXQKaWYgaXQgcmV0dXJucyBub24t
emVyby4KCkVpdGhlciB3YXk6CgpSZXZpZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJp
Y2VAYXJtLmNvbT4KCj4gIAkJZ290byBlcnJfb3V0MDsKPiAgCX0KPiAgCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
