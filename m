Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176591E6210
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8286E536;
	Thu, 28 May 2020 13:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D65DA6E536
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:22:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CA4DD6E;
 Thu, 28 May 2020 06:22:56 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177183F52E;
 Thu, 28 May 2020 06:22:54 -0700 (PDT)
Subject: Re: [PATCH 07/15] drm/panfrost: use device_property_present to check
 for OPP
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-8-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2f7a41d6-325d-3731-0a6a-fa2e41d4e33a@arm.com>
Date: Thu, 28 May 2020 14:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-8-peron.clem@gmail.com>
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

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IEluc3RlYWQgb2Yg
ZXhwZWN0aW5nIGFuIGVycm9yIGZyb20gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoKQo+IGRvIGEg
c2ltcGxlIGRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCkgY2hlY2suCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkknbSBub3Qgc3VyZSBJ
IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgYmV0dGVyLiBXZSBzZWVtIHRvIGhhdmUgbW9yZSBjb2Rl
IAp0byBkbyByb3VnaGx5IHRoZSBzYW1lIHRoaW5nIGp1c3Qgd2l0aCB0aGUgaGFyZC1jb2RlZCAK
Im9wZXJhdGluZy1wb2ludHMtdjIiIG5hbWUgKGlmIHRoZXJlJ3MgZXZlciBhICd2Mycgd2UnbGwg
dGhlbiBoYXZlIHRvIAp1cGRhdGUgdGhpcykuCgpJcyB0aGUgZGVzaXJlIGp1c3QgdG8gZ2V0IGFu
IGVycm9yIG9uIHByb2JlIGlmIHRoZSB0YWJsZSBpcyBtYWxmb3JtZWQ/IApIYXZlIHlvdSBoaXQg
dGhpcyBzaXR1YXRpb24/IElmIHNvIHRoaXMgc291bmRzIGxpa2Ugc29tZXRoaW5nIHdoaWNoIAp3
b3VsZCBiZSBiZXR0ZXIgZml4ZWQgaW4gdGhlIGdlbmVyaWMgT1BQIGNvZGUgcmF0aGVyIHRoYW4g
UGFuZnJvc3QgaXRzZWxmLgoKU3RldmUKCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMTQgKysrKysrKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggZDkwMDdmNDRiNzcyLi5mY2Uy
MWM2ODI0MTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMKPiBAQCAtOTYsMTUgKzk2LDE5IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4gICAJc3RydWN0IHRoZXJtYWxfY29vbGluZ19k
ZXZpY2UgKmNvb2xpbmc7Cj4gICAJc3RydWN0IHBhbmZyb3N0X2RldmZyZXEgKnBmZGV2ZnJlcSA9
ICZwZmRldi0+cGZkZXZmcmVxOwo+ICAgCj4gLQlyZXQgPSBkZXZfcG1fb3BwX29mX2FkZF90YWJs
ZShkZXYpOwo+IC0JaWYgKHJldCA9PSAtRU5PREVWKSAvKiBPcHRpb25hbCwgY29udGludWUgd2l0
aG91dCBkZXZmcmVxICovCj4gKwlpZiAoIWRldmljZV9wcm9wZXJ0eV9wcmVzZW50KGRldiwgIm9w
ZXJhdGluZy1wb2ludHMtdjIiKSkKPiArCQkvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBk
ZXZmcmVxICovCj4gICAJCXJldHVybiAwOwo+IC0JZWxzZSBpZiAocmV0KQo+IC0JCXJldHVybiBy
ZXQ7Cj4gLQlwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCA9IHRydWU7Cj4gICAKPiAgIAlz
cGluX2xvY2tfaW5pdCgmcGZkZXZmcmVxLT5sb2NrKTsKPiAgIAo+ICsJcmV0ID0gZGV2X3BtX29w
cF9vZl9hZGRfdGFibGUoZGV2KTsKPiArCWlmIChyZXQpIHsKPiArCQlEUk1fREVWX0VSUk9SKGRl
diwgIkNvdWxkbid0IGFkZCBPUFAgdGFibGVcbiIpOwo+ICsJCWdvdG8gZXJyX2Zpbmk7Cj4gKwl9
Cj4gKwlwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCA9IHRydWU7Cj4gKwo+ICAgCXBhbmZy
b3N0X2RldmZyZXFfcmVzZXQocGZkZXZmcmVxKTsKPiAgIAo+ICAgCWN1cl9mcmVxID0gY2xrX2dl
dF9yYXRlKHBmZGV2LT5jbG9jayk7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
