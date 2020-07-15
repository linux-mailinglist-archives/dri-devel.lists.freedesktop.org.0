Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6F220D70
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 14:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FF16E02A;
	Wed, 15 Jul 2020 12:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E9E36E02A;
 Wed, 15 Jul 2020 12:53:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1501531B;
 Wed, 15 Jul 2020 05:53:49 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E99DB3F66E;
 Wed, 15 Jul 2020 05:53:48 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id AB540682E6E; Wed, 15 Jul 2020 13:53:47 +0100 (BST)
Date: Wed, 15 Jul 2020 13:53:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 08/25] drm/malidp: Annotate dma-fence critical section in
 commit path
Message-ID: <20200715125347.GT159988@e110455-lin.cambridge.arm.com>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707201229.472834-9-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDcsIDIwMjAgYXQgMTA6MTI6MTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBBZ2FpbiBuZWVkcyB0byBiZSBwdXQgcmlnaHQgYWZ0ZXIgdGhlIGNhbGwgdG8KPiBk
cm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdfZG9uZSgpLCBzaW5jZSB0aGF0J3MgdGhlIGxhc3Qg
dGhpbmcgd2hpY2gKPiBjYW4gaG9sZCB1cCBhIHN1YnNlcXVlbnQgYXRvbWljIGNvbW1pdC4KPiAK
PiBObyBzdXJwcmlzZXMgaGVyZS4KCkkgd2FzIChzdGlsbCBhbSkgaG9waW5nIHRvIGRvIGEgdGVz
dGluZyBmb3IgdGhpcyBwYXRjaCBidXQgd2hlbiBJIGR1ZyBvdXQgdGhlIHNlcmllcwpmcm9tIHRo
ZSBNTCBpdCBsb29rZWQgbGlrZSBpdCBoYXMgZXh0cmEgZGVwZW5kZW5jaWVzLCBzbyBJIHdhcyB3
YWl0aW5nIGZvciB0aGUgZHVzdAp0byBzZXR0bGUuCgpPdGhlcndpc2UsIExHVE0uCgpCZXN0IHJl
Z2FyZHMsCkxpdml1Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiAiSmFtZXMgKFFpYW4pIFdhbmciIDxqYW1lcy5xaWFuLndh
bmdAYXJtLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gQ2M6
IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFs
aWRwX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBpbmRleCA2OWZl
ZTA1YzI1NmMuLjI2ZTYwNDAxYThlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
QEAgLTIzNCw2ICsyMzQsNyBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfYXRvbWljX2NvbW1pdF90YWls
KHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiAgCXN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKPiAgCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGU7Cj4gIAlpbnQgaTsK
PiArCWJvb2wgZmVuY2VfY29va2llID0gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmcoKTsKPiAg
Cj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKGRybS0+ZGV2KTsKPiAgCj4gQEAgLTI2MCw2ICsyNjEs
OCBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfYXRvbWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSkKPiAgCj4gIAltYWxpZHBfYXRvbWljX2NvbW1pdF9od19kb25lKHN0
YXRlKTsKPiAgCj4gKwlkbWFfZmVuY2VfZW5kX3NpZ25hbGxpbmcoZmVuY2VfY29va2llKTsKPiAr
Cj4gIAlwbV9ydW50aW1lX3B1dChkcm0tPmRldik7Cj4gIAo+ICAJZHJtX2F0b21pY19oZWxwZXJf
Y2xlYW51cF9wbGFuZXMoZHJtLCBzdGF0ZSk7Cj4gLS0gCj4gMi4yNy4wCj4gCgotLSAKPT09PT09
PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8Cnwg
YnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8K
ICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
