Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43309B314
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918B26ECC1;
	Fri, 23 Aug 2019 15:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEF366ECC1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:12:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A8A128;
 Fri, 23 Aug 2019 08:12:30 -0700 (PDT)
Received: from [10.1.31.94] (unknown [10.1.31.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CBE93F246;
 Fri, 23 Aug 2019 08:12:28 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <a4af6c96-7d7e-27a0-99b8-d8c6687982b6@arm.com>
Date: Fri, 23 Aug 2019 16:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190823021216.5862-9-robh@kernel.org>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAwMzoxMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gdGxiX2ludl9jb250ZXh0
KCkgaG9vayBpcyBvbmx5IGNhbGxlZCB3aGVuIGZyZWVpbmcgdGhlIHBhZ2UgdGFibGVzLiBUaGVy
ZSdzCj4gbm8gcG9pbnQgaW4gZmx1c2hpbmcgb25seSB0byBmcmVlIHRoZSBwYWdlIHRhYmxlcyBp
bW1lZGlhdGVseSBmb2xsb3dpbmcuCj4gVGhlcmUgaXMgYWxzbyBhIHByb2JsZW0gdGhhdCB3ZSBj
b3VsZCBiZSBhY2Nlc3NpbmcgdGhlIGgvdyB3aGVuIHN1c3BlbmRlZC4KPiAKPiBDYzogVG9tZXUg
Vml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KPiBDYzogU3RldmVuIFByaWNlIDxz
dGV2ZW4ucHJpY2VAYXJtLmNvbT4KPiBDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nl
bnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU3RldmVuIFByaWNl
IDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCkFsdGhvdWdoIGl0IG1pZ2h0IGJlIHdvcnRoIHRyeWlu
ZyB0byBjYXB0dXJlIHRoZSBqdXN0aWZpY2F0aW9uIGFib3V0IAp0aGlzIGluIGEgY29tbWVudCBz
b21ld2hlcmUgLSB0aGVyZSdzIGJlZW4gYSBmYWlyIGJpdCBvZiBkaXNjdXNzaW9uIAphYm91dCB0
aGlzLi4uCgpTdGV2ZQoKPiAtLS0KPiB2MjogbmV3IHBhdGNoCj4gCj4gICBkcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCA2ICstLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfbW11LmMKPiBpbmRleCBjY2Y2NzFhOWMzZmIuLjlmODUyNzVhODk2YyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBAQCAtMzI4LDExICsz
MjgsNyBAQCB2b2lkIHBhbmZyb3N0X21tdV91bm1hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVj
dCAqYm8pCj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIG1tdV90bGJfaW52X2NvbnRleHRfczEo
dm9pZCAqY29va2llKQo+IC17Cj4gLQlzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2ID0g
Y29va2llOwo+IC0KPiAtCW1tdV9od19kb19vcGVyYXRpb24ocHJpdi0+cGZkZXYsICZwcml2LT5t
bXUsIDAsIH4wVUwsIEFTX0NPTU1BTkRfRkxVU0hfTUVNKTsKPiAtfQo+ICt7fQo+ICAgCj4gICBz
dGF0aWMgdm9pZCBtbXVfdGxiX2ludl9yYW5nZV9ub3N5bmModW5zaWduZWQgbG9uZyBpb3ZhLCBz
aXplX3Qgc2l6ZSwKPiAgIAkJCQkgICAgIHNpemVfdCBncmFudWxlLCBib29sIGxlYWYsIHZvaWQg
KmNvb2tpZSkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
