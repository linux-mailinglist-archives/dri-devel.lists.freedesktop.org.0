Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505E21B1FC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 11:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FAA6EBA7;
	Fri, 10 Jul 2020 09:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B6A36EBA7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:05:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0094831B;
 Fri, 10 Jul 2020 02:05:57 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E81C3F68F;
 Fri, 10 Jul 2020 02:05:55 -0700 (PDT)
Subject: Re: [PATCH v3 07/14] drm/panfrost: rename error labels in device_init
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200709140322.131320-1-peron.clem@gmail.com>
 <20200709140322.131320-8-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <19cea82f-ca6a-ae77-ca18-814ec5b731a8@arm.com>
Date: Fri, 10 Jul 2020 10:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709140322.131320-8-peron.clem@gmail.com>
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

T24gMDkvMDcvMjAyMCAxNTowMywgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFJlbmFtZSBnb3Rv
IGxhYmVscyBpbiBkZXZpY2VfaW5pdCBpdCB3aWxsIGJlIGVhc2llciB0byBtYWludGFpbi4KPiAK
PiBSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxh
Ym9yYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdt
YWlsLmNvbT4KCk5pY2UgY2xlYW4gdXAsIHRoYW5rcy4gQXMgeW91IG5vdGVkIHRoaXMgbmVlZHMg
cmViYXNpbmcgYXMgdGhlIAoicmVndWxhdG9yIGluaXQiIG1lc3NhZ2UgaGFzIGdvbmUuCgpSZXZp
ZXdlZC1ieTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAzMCArKysrKysrKysr
Ky0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2Uu
Ywo+IGluZGV4IDgxMzZiYWJkM2JhOS4uY2MxNmQxMDJiMjc1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+IEBAIC0yMTUsNTcgKzIxNSw1NyBAQCBp
bnQgcGFuZnJvc3RfZGV2aWNlX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
ICAJZXJyID0gcGFuZnJvc3RfcmVndWxhdG9yX2luaXQocGZkZXYpOwo+ICAgCWlmIChlcnIpIHsK
PiAgIAkJZGV2X2VycihwZmRldi0+ZGV2LCAicmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBl
cnIpOwo+IC0JCWdvdG8gZXJyX291dDA7Cj4gKwkJZ290byBvdXRfY2xrOwo+ICAgCX0KPiAgIAo+
ICAgCWVyciA9IHBhbmZyb3N0X3Jlc2V0X2luaXQocGZkZXYpOwo+ICAgCWlmIChlcnIpIHsKPiAg
IAkJZGV2X2VycihwZmRldi0+ZGV2LCAicmVzZXQgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7Cj4g
LQkJZ290byBlcnJfb3V0MTsKPiArCQlnb3RvIG91dF9yZWd1bGF0b3I7Cj4gICAJfQo+ICAgCj4g
ICAJZXJyID0gcGFuZnJvc3RfcG1fZG9tYWluX2luaXQocGZkZXYpOwo+ICAgCWlmIChlcnIpCj4g
LQkJZ290byBlcnJfb3V0MjsKPiArCQlnb3RvIG91dF9yZXNldDsKPiAgIAo+ICAgCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZmRldi0+cGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ICAg
CXBmZGV2LT5pb21lbSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShwZmRldi0+ZGV2LCByZXMpOwo+
ICAgCWlmIChJU19FUlIocGZkZXYtPmlvbWVtKSkgewo+ICAgCQlkZXZfZXJyKHBmZGV2LT5kZXYs
ICJmYWlsZWQgdG8gaW9yZW1hcCBpb21lbVxuIik7Cj4gICAJCWVyciA9IFBUUl9FUlIocGZkZXYt
PmlvbWVtKTsKPiAtCQlnb3RvIGVycl9vdXQzOwo+ICsJCWdvdG8gb3V0X3BtX2RvbWFpbjsKPiAg
IAl9Cj4gICAKPiAgIAllcnIgPSBwYW5mcm9zdF9ncHVfaW5pdChwZmRldik7Cj4gICAJaWYgKGVy
cikKPiAtCQlnb3RvIGVycl9vdXQzOwo+ICsJCWdvdG8gb3V0X3BtX2RvbWFpbjsKPiAgIAo+ICAg
CWVyciA9IHBhbmZyb3N0X21tdV9pbml0KHBmZGV2KTsKPiAgIAlpZiAoZXJyKQo+IC0JCWdvdG8g
ZXJyX291dDQ7Cj4gKwkJZ290byBvdXRfZ3B1Owo+ICAgCj4gICAJZXJyID0gcGFuZnJvc3Rfam9i
X2luaXQocGZkZXYpOwo+ICAgCWlmIChlcnIpCj4gLQkJZ290byBlcnJfb3V0NTsKPiArCQlnb3Rv
IG91dF9tbXU7Cj4gICAKPiAgIAllcnIgPSBwYW5mcm9zdF9wZXJmY250X2luaXQocGZkZXYpOwo+
ICAgCWlmIChlcnIpCj4gLQkJZ290byBlcnJfb3V0NjsKPiArCQlnb3RvIG91dF9qb2I7Cj4gICAK
PiAgIAlyZXR1cm4gMDsKPiAtZXJyX291dDY6Cj4gK291dF9qb2I6Cj4gICAJcGFuZnJvc3Rfam9i
X2ZpbmkocGZkZXYpOwo+IC1lcnJfb3V0NToKPiArb3V0X21tdToKPiAgIAlwYW5mcm9zdF9tbXVf
ZmluaShwZmRldik7Cj4gLWVycl9vdXQ0Ogo+ICtvdXRfZ3B1Ogo+ICAgCXBhbmZyb3N0X2dwdV9m
aW5pKHBmZGV2KTsKPiAtZXJyX291dDM6Cj4gK291dF9wbV9kb21haW46Cj4gICAJcGFuZnJvc3Rf
cG1fZG9tYWluX2ZpbmkocGZkZXYpOwo+IC1lcnJfb3V0MjoKPiArb3V0X3Jlc2V0Ogo+ICAgCXBh
bmZyb3N0X3Jlc2V0X2ZpbmkocGZkZXYpOwo+IC1lcnJfb3V0MToKPiArb3V0X3JlZ3VsYXRvcjoK
PiAgIAlwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShwZmRldik7Cj4gLWVycl9vdXQwOgo+ICtvdXRf
Y2xrOgo+ICAgCXBhbmZyb3N0X2Nsa19maW5pKHBmZGV2KTsKPiAgIAlyZXR1cm4gZXJyOwo+ICAg
fQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
