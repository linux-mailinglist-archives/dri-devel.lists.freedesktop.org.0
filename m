Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF555F48E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8406E2F6;
	Thu,  4 Jul 2019 08:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jul 2019 08:26:30 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F446E2F6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:26:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 49E032FB; Thu,  4 Jul 2019 10:20:03 +0200 (CEST)
Date: Thu, 4 Jul 2019 10:20:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] iommu: add support for drivers that manage iommu
 explicitly
Message-ID: <20190704082001.GD6546@8bytes.org>
References: <20190702202631.32148-1-robdclark@gmail.com>
 <20190702202631.32148-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702202631.32148-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDE6MjY6MThQTSAtMDcwMCwgUm9iIENs
YXJrIHdyb3RlOgo+IDEpIEluIHNvbWUgY2FzZXMgdGhlIGJvb3Rsb2FkZXIgdGFrZXMgdGhlIGlv
bW11IG91dCBvZiBieXBhc3MgYW5kCj4gICAgZW5hYmxlcyB0aGUgZGlzcGxheS4gIFRoaXMgaXMg
aW4gcGFydGljdWxhciBhIHByb2JsZW0gb24gdGhlIGFhcmNoNjQKPiAgICBsYXB0b3BzIHRoYXQg
ZXhpc3QgdGhlc2UgZGF5cywgYW5kIG1vZGVybiBzbmFwZHJhZ29uIGFuZHJvaWQgZGV2aWNlcy4K
PiAgICAoT2xkZXIgZGV2aWNlcyBhbHNvIGVuYWJsZWQgdGhlIGRpc3BsYXkgaW4gYm9vdGxvYWRl
ciBidXQgZGlkIG5vdAo+ICAgIHRha2UgdGhlIGlvbW11IG91dCBvZiBieXBhc3MuKSAgQXR0YWNo
aW5nIGEgRE1BIG9yIElERU5USVRZIGRvbWFpbgo+ICAgIHdoaWxlIHNjYW5vdXQgaXMgYWN0aXZl
LCBiZWZvcmUgdGhlIGRyaXZlciBoYXMgYSBjaGFuY2UgdG8gaW50ZXJ2ZW5lLAo+ICAgIG1ha2Vz
IHRoaW5ncyBnbyAqYm9vbSoKCkp1c3QgdG8gbWFrZSBzdXJlIEkgZ2V0IHRoaXMgcmlnaHQ6IFRo
ZSBib290bG9hZGVyIGluaWFsaXplcyB0aGUgU01NVQphbmQgY3JlYXRlcyBub24taWRlbnRpdHkg
bWFwcGluZ3MgZm9yIHRoZSBHUFU/IEFuZCB3aGVuIHRoZSBTTU1VIGRyaXZlcgppbiBMaW51eCB0
YWtlcyBvdmVyIHRoaXMgYnJlYWtzIGRpc3BsYXkgb3V0cHV0LgoKPiArCS8qCj4gKwkgKiBJZiBk
cml2ZXIgaXMgZ29pbmcgdG8gbWFuYWdlIGlvbW11IGRpcmVjdGx5LCB0aGVuIGF2b2lkCj4gKwkg
KiBhdHRhY2hpbmcgYW55IG5vbiBkcml2ZXIgbWFuYWdlZCBkb21haW4uICBUaGVyZSBjb3VsZAo+
ICsJICogYmUgYWxyZWFkeSBhY3RpdmUgZG1hIHVuZGVyd2F5IChpZS4gc2Nhbm91dCBpbiBjYXNl
IG9mCj4gKwkgKiBib290bG9hZGVyIGVuYWJsZWQgZGlzcGxheSksIGFuZCBpbnRlcmZlcmluZyB3
aXRoIHRoYXQKPiArCSAqIHdpbGwgbWFrZSB0aGluZ3MgZ28gKmJvb20qCj4gKwkgKi8KPiArCWlm
ICgoZG9tYWluLT50eXBlICE9IElPTU1VX0RPTUFJTl9VTk1BTkFHRUQpICYmCj4gKwkgICAgZGV2
LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXItPmRyaXZlcl9tYW5hZ2VzX2lvbW11KQo+ICsJCXJldHVy
biAwOwo+ICsKCldoZW4gdGhlIGRlZmF1bHQgZG9tYWluIGlzIGF0dGFjaGVkLCB0aGVyZSBpcyB1
c3VhbGx5IG5vIGRyaXZlciBhdHRhY2hlZAp5ZXQuIEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBj
b21tdW5pY2F0ZWQgYnkgdGhlIGZpcm13YXJlIHRvIExpbnV4IGFuZAp0aGUgY29kZSBzaG91bGQg
Y2hlY2sgYWdhaW5zdCB0aGF0LgoKPiAtCWJvb2wgc3VwcHJlc3NfYmluZF9hdHRyczsJLyogZGlz
YWJsZXMgYmluZC91bmJpbmQgdmlhIHN5c2ZzICovCj4gKwlib29sIHN1cHByZXNzX2JpbmRfYXR0
cnM6MTsJLyogZGlzYWJsZXMgYmluZC91bmJpbmQgdmlhIHN5c2ZzICovCj4gKwlib29sIGRyaXZl
cl9tYW5hZ2VzX2lvbW11OjE7CS8qIGRyaXZlciBtYW5hZ2VzIElPTU1VIGV4cGxpY2l0bHkgKi8K
CkhvdyBkb2VzIHRoaXMgZmllbGQgZ2V0IHNldD8KCgoKCUpvZXJnCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
