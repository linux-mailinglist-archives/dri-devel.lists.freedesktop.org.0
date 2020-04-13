Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5F1A66B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 15:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02889E98;
	Mon, 13 Apr 2020 13:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 272A289E98
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 13:07:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 499131FB;
 Mon, 13 Apr 2020 06:07:39 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 090573F68F;
 Mon, 13 Apr 2020 06:07:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/panfrost: missing remove opp table in case of
 failure
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20200411200632.4045-1-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <694c3bd0-1588-ed28-d282-8e83fc6a06f5@arm.com>
Date: Mon, 13 Apr 2020 14:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200411200632.4045-1-peron.clem@gmail.com>
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

T24gMTEvMDQvMjAyMCAyMTowNiwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEluIGNhc2Ugb2Yg
ZmFpbHVyZSB3ZSBuZWVkIHRvIHJlbW92ZSBPUFAgdGFibGUuCj4gCj4gVXNlIExpbnV4IGNsYXNz
aWMgZXJyb3IgaGFuZGxpbmcgd2l0aCBnb3RvIHVzYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogU3RldmVu
IFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTYgKysrKysrKysrKysrLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggNDEzOTg3MDM4
ZmJmLi42MjU0MWY0ZWRkODEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZmcmVxLmMKPiBAQCAtOTAsOCArOTAsMTEgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFf
aW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgIAljdXJfZnJlcSA9IGNsa19n
ZXRfcmF0ZShwZmRldi0+Y2xvY2spOwo+ICAgCj4gICAJb3BwID0gZGV2ZnJlcV9yZWNvbW1lbmRl
ZF9vcHAoZGV2LCAmY3VyX2ZyZXEsIDApOwo+IC0JaWYgKElTX0VSUihvcHApKQo+IC0JCXJldHVy
biBQVFJfRVJSKG9wcCk7Cj4gKwlpZiAoSVNfRVJSKG9wcCkpIHsKPiArCQlEUk1fREVWX0VSUk9S
KGRldiwgIkZhaWxlZCB0byBzZXQgcmVjb21tZW5kZWQgT1BQXG4iKTsKPiArCQlyZXQgPSBQVFJf
RVJSKG9wcCk7Cj4gKwkJZ290byBlcnJfb3BwOwo+ICsJfQo+ICAgCj4gICAJcGFuZnJvc3RfZGV2
ZnJlcV9wcm9maWxlLmluaXRpYWxfZnJlcSA9IGN1cl9mcmVxOwo+ICAgCWRldl9wbV9vcHBfcHV0
KG9wcCk7Cj4gQEAgLTEwMCw4ICsxMDMsOCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0
cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAgCQkJCQkgIERFVkZSRVFfR09WX1NJTVBM
RV9PTkRFTUFORCwgTlVMTCk7Cj4gICAJaWYgKElTX0VSUihkZXZmcmVxKSkgewo+ICAgCQlEUk1f
REVWX0VSUk9SKGRldiwgIkNvdWxkbid0IGluaXRpYWxpemUgR1BVIGRldmZyZXFcbiIpOwo+IC0J
CWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKGRldik7Cj4gLQkJcmV0dXJuIFBUUl9FUlIoZGV2
ZnJlcSk7Cj4gKwkJcmV0ID0gUFRSX0VSUihkZXZmcmVxKTsKPiArCQlnb3RvIGVycl9vcHA7Cj4g
ICAJfQo+ICAgCXBmZGV2LT5kZXZmcmVxLmRldmZyZXEgPSBkZXZmcmVxOwo+ICAgCj4gQEAgLTEx
Miw2ICsxMTUsMTEgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlICpwZmRldikKPiAgIAkJcGZkZXYtPmRldmZyZXEuY29vbGluZyA9IGNvb2xpbmc7Cj4g
ICAKPiAgIAlyZXR1cm4gMDsKPiArCj4gK2Vycl9vcHA6Cj4gKwlkZXZfcG1fb3BwX29mX3JlbW92
ZV90YWJsZShkZXYpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gICB9Cj4gICAKPiAgIHZvaWQgcGFu
ZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
