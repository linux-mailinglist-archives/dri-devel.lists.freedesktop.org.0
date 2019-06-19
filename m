Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407104B5F7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A99C6E34D;
	Wed, 19 Jun 2019 10:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F1616E348;
 Wed, 19 Jun 2019 10:11:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1C82344;
 Wed, 19 Jun 2019 03:11:19 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB1B33F738;
 Wed, 19 Jun 2019 03:13:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 4B2B4682189; Wed, 19 Jun 2019 11:11:18 +0100 (BST)
Date: Wed, 19 Jun 2019 11:11:18 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Message-ID: <20190619101118.GA17204@e110455-lin.cambridge.arm.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-8-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MjNQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBSZWFkIHRoZSBkb2NzLCBrb21lZGEgaXMgbm90IGFuIG9sZCBlbm91Z2ggZHJpdmVy
IGZvciB0aGlzIDotKQo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiAiSmFtZXMgKFFpYW4pIFdhbmciIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpBY2tl
ZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpJJ20gYXNzdW1pbmcgdGhl
IHdob2xlIHNlcmllcyBnb2VzIHRocm91Z2ggZHJtLW1pc2MgYW5kIEkgZG9uJ3QgbmVlZCB0byBw
dWxsCnRoaXMgcGF0Y2ggaW50byBtYWxpLWRwIHRyZWUuIFBsZWFzZSBzaG91dCBpZiBteSBhc3N1
bXB0aW9ucyBhcmUgaW5jb3JyZWN0LgoKQmVzdCByZWdhcmRzLApMaXZpdQoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAzICstLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiBpbmRleCAw
YzYzOTZkYzMyM2YuLmI5ZDY5OWNjN2JiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gQEAgLTU1LDggKzU1LDcgQEAgc3RhdGlj
IGlycXJldHVybl90IGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkK
PiAgfQo+ICAKPiAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGtvbWVkYV9rbXNfZHJpdmVyID0g
ewo+IC0JLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERS
SVZFUl9BVE9NSUMgfAo+IC0JCQkgICBEUklWRVJfSEFWRV9JUlEsCj4gKwkuZHJpdmVyX2ZlYXR1
cmVzID0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQywKPiAgCS5s
YXN0Y2xvc2UJCQk9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3NlLAo+ICAJLmlycV9oYW5kbGVyCQkJ
PSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAo+ICAJLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZAk9
IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LAo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCj09PT09PT09
PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxkLCAgfAp8IGJ1
dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNvZGUhICAvCiAg
LS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
