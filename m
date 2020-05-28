Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F81E6204
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 15:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFBC6E529;
	Thu, 28 May 2020 13:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E58C96E529
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:22:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E0A5D6E;
 Thu, 28 May 2020 06:22:35 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF2473F52E;
 Thu, 28 May 2020 06:22:33 -0700 (PDT)
Subject: Re: [PATCH 01/15] drm/panfrost: avoid static declaration
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
References: <20200510165538.19720-1-peron.clem@gmail.com>
 <20200510165538.19720-2-peron.clem@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b721714c-23a7-d507-fd6b-5ab24690be7d@arm.com>
Date: Thu, 28 May 2020 14:22:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510165538.19720-2-peron.clem@gmail.com>
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

T24gMTAvMDUvMjAyMCAxNzo1NSwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+IFRoaXMgZGVjbGFy
YXRpb24gY2FuIGJlIGF2b2lkZWQgc28gY2hhbmdlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogU3RldmVu
IFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgMzggKysrKysrKysrKy0tLS0tLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCj4gaW5kZXggNDEz
OTg3MDM4ZmJmLi4xYjU2MGI5MDNlYTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZmcmVxLmMKPiBAQCAtMTQsNyArMTQsMjQgQEAKPiAgICNpbmNsdWRlICJw
YW5mcm9zdF9ncHUuaCIKPiAgICNpbmNsdWRlICJwYW5mcm9zdF9yZWdzLmgiCj4gICAKPiAtc3Rh
dGljIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpOwo+ICtzdGF0aWMgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3VwZGF0
ZV91dGlsaXphdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiArewo+ICsJa3Rp
bWVfdCBub3c7Cj4gKwlrdGltZV90IGxhc3Q7Cj4gKwo+ICsJaWYgKCFwZmRldi0+ZGV2ZnJlcS5k
ZXZmcmVxKQo+ICsJCXJldHVybjsKPiArCj4gKwlub3cgPSBrdGltZV9nZXQoKTsKPiArCWxhc3Qg
PSBwZmRldi0+ZGV2ZnJlcS50aW1lX2xhc3RfdXBkYXRlOwo+ICsKPiArCWlmIChhdG9taWNfcmVh
ZCgmcGZkZXYtPmRldmZyZXEuYnVzeV9jb3VudCkgPiAwKQo+ICsJCXBmZGV2LT5kZXZmcmVxLmJ1
c3lfdGltZSArPSBrdGltZV9zdWIobm93LCBsYXN0KTsKPiArCWVsc2UKPiArCQlwZmRldi0+ZGV2
ZnJlcS5pZGxlX3RpbWUgKz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7Cj4gKwo+ICsJcGZkZXYtPmRl
dmZyZXEudGltZV9sYXN0X3VwZGF0ZSA9IG5vdzsKPiArfQo+ICAgCj4gICBzdGF0aWMgaW50IHBh
bmZyb3N0X2RldmZyZXFfdGFyZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyAq
ZnJlcSwKPiAgIAkJCQkgICB1MzIgZmxhZ3MpCj4gQEAgLTEzOSwyNSArMTU2LDYgQEAgdm9pZCBw
YW5mcm9zdF9kZXZmcmVxX3N1c3BlbmQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCj4g
ICAJZGV2ZnJlcV9zdXNwZW5kX2RldmljZShwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKTsKPiAgIH0K
PiAgIAo+IC1zdGF0aWMgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3VwZGF0ZV91dGlsaXphdGlvbihz
dHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAtewo+IC0Ja3RpbWVfdCBub3c7Cj4gLQlr
dGltZV90IGxhc3Q7Cj4gLQo+IC0JaWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQo+IC0JCXJl
dHVybjsKPiAtCj4gLQlub3cgPSBrdGltZV9nZXQoKTsKPiAtCWxhc3QgPSBwZmRldi0+ZGV2ZnJl
cS50aW1lX2xhc3RfdXBkYXRlOwo+IC0KPiAtCWlmIChhdG9taWNfcmVhZCgmcGZkZXYtPmRldmZy
ZXEuYnVzeV9jb3VudCkgPiAwKQo+IC0JCXBmZGV2LT5kZXZmcmVxLmJ1c3lfdGltZSArPSBrdGlt
ZV9zdWIobm93LCBsYXN0KTsKPiAtCWVsc2UKPiAtCQlwZmRldi0+ZGV2ZnJlcS5pZGxlX3RpbWUg
Kz0ga3RpbWVfc3ViKG5vdywgbGFzdCk7Cj4gLQo+IC0JcGZkZXYtPmRldmZyZXEudGltZV9sYXN0
X3VwZGF0ZSA9IG5vdzsKPiAtfQo+IC0KPiAgIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9yZWNvcmRf
YnVzeShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgIHsKPiAgIAlwYW5mcm9zdF9k
ZXZmcmVxX3VwZGF0ZV91dGlsaXphdGlvbihwZmRldik7Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
