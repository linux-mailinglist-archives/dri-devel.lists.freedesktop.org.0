Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6788BAB
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044996E421;
	Sat, 10 Aug 2019 13:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35F5F6E1EE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:45:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D56751596;
 Fri,  9 Aug 2019 05:45:26 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12F633F706;
 Fri,  9 Aug 2019 05:45:25 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190808222918.15153-1-robh@kernel.org>
 <20190808231110.GA12294@kevin>
 <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c87da187-f957-1ac9-12c6-e7121fcb9f72@arm.com>
Date: Fri, 9 Aug 2019 13:45:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDgvMjAxOSAwNDowMSwgUm9iIEhlcnJpbmcgd3JvdGU6ClsuLi5dCj4gSSB3YXMgd29y
cmllZCB0b28uIEl0IHNlZW1zIHRvIGJlIHdvcmtpbmcgcHJldHR5IHdlbGwgdGhvdWdoLCBidXQg
bW9yZQo+IHRlc3Rpbmcgd291bGQgYmUgZ29vZC4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgYSBs
b3Qgb2YgdXNlY2FzZXMgdGhhdAo+IHVzZSBtb3JlIEFTIHRoYW4gdGhlIGgvdyBoYXMgKDggb24g
VDg2MCksIGJ1dCBJJ20gbm90IHN1cmUuCgpZZWFoLCA4IGlzIG92ZXJraWxsLiBTb21lIEdQVXMg
b25seSBoYXZlIDQgd2hpY2ggaXMgYSBsaXR0bGUgdGlnaHQgYW5kCm1pZ2h0IGNvbWUgdG8gYml0
ZSB3aGVuIHN1cHBvcnRpbmcgcXVldWVpbmcgb24gdGhlIEdQVS4gSW4gdGhpcyBwYXRjaApwYW5m
cm9zdF9tbXVfYXNfZ2V0KCkgd2lsbCBzaW1wbHkgV0FSTigpIHRoZW4gY3Jhc2ggaWYgdGhlcmUg
aXNuJ3QgYQpmcmVlIEFTOgoKPiAJCVdBUk5fT04oIWxydV9tbXUpOwo+IAo+IAkJbGlzdF9kZWxf
aW5pdCgmbHJ1X21tdS0+bGlzdCk7Cj4gCQlhcyA9IGxydV9tbXUtPmFzOwoKVGhpcyBpc24ndCBh
IHByb2JsZW0gYXQgdGhlIG1vbWVudCAodGhlcmUncyBhIG1heGltdW0gb2YgMiBqb2JzIG9uIHRo
ZQpHUFUgYXQgdGhlIG1vbWVudCkuIEJ1dCB3aGVuIHlvdSBzdGFydCBxdWV1ZWluZyBqb2JzIGl0
J3MgcG9zc2libGUgZm9yCmVhY2ggam9iIHRvIGJlbG9uZyB0byBhIGRpZmZlcmVudCBhZGRyZXNz
IHNwYWNlLiBXaXRoIHRocmVlIHNsb3RzIGFuZApmb3IgZWFjaCB5b3UgY2FuIGhhdmUgb25lIGpv
YiBydW5uaW5nIGFuZCBvbmUgd2FpdGluZyB0aGF0J3MgYSBtaW5pbXVtCm9mIDYgQVNlcywgcGx1
cyB5b3UgbWlnaHQgd2FudCBvbmUgY29uZmlndXJlZCB0byBkdW1wIGNvdW50ZXJzLiBTbyBhCnRv
dGFsIG9mIDcgYXJlIG5lZWRlZCB0byBhdm9pZCBoYXZpbmcgdG8gd2FpdC4gSGFyZHdhcmUgZGVz
aWduZXJzIGxpa2UKcG93ZXJzIG9mIDIgc28gd2UgaGF2ZSA4LgoKa2Jhc2UgYWxzbyBjYW4gYmUg
bGF6eSBhYm91dCBkZWFsaW5nIHdpdGggY29tcGxldGVkIGpvYnMgLSB0aGlzIGFsbG93cwpldmVu
IG1vcmUgam9icyB0byBiZSBjb25zaWRlcmVkICJvbiB0aGUgR1BVIiBzbyBldmVuIHdpdGggOCBB
U2VzIGl0IGlzCnBvc3NpYmxlIHRvICJydW4gb3V0IiEKClN0ZXZlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
