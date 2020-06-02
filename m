Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6261EBC3B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E20A6E136;
	Tue,  2 Jun 2020 12:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E8B689D6C;
 Tue,  2 Jun 2020 12:59:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6E71FB;
 Tue,  2 Jun 2020 05:59:50 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD77D3F305;
 Tue,  2 Jun 2020 05:59:49 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 81DD568065E; Tue,  2 Jun 2020 13:59:48 +0100 (BST)
Date: Tue, 2 Jun 2020 13:59:48 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/malidp: Don't call drm_crtc_vblank_off on unbind
Message-ID: <20200602125948.GQ159988@e110455-lin.cambridge.arm.com>
References: <20200602095140.36678-1-daniel.vetter@ffwll.ch>
 <20200602095140.36678-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602095140.36678-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTE6NTE6MzlBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBUaGlzIGlzIGFscmVhZHkgZG9uZSBhcyBwYXJ0IG9mIHRoZSBk
cm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bigpLAo+IGFuZCBpbiB0aGF0IGNhc2Ugb25seSBmb3Ig
dGhlIGNydGMgd2hpY2ggYXJlIGFjdHVhbGx5IG9uLgo+CgpJJ20gcHJldHR5IHN1cmUgdGhhdCBp
dCBkaWRuJ3QgdXNlZCB0byBiZSB0aGUgY2FzZSB3aGVuIEkgd3JvdGUgdGhlIGNvZGUKYW5kIEkg
d2FzIGhpdHRpbmcgd2FybmluZ3MgZnJvbSA4NDAxNGIwYTM5ZWVmNmRmICgiZHJtL2F0b21pYy1o
ZWxwZXI6IGNoZWNrIHRoYXQKZHJpdmVycyBjYWxsIGRybV9jcnRjX3ZibGFua19vZmYiKSwgYnV0
IEknbSBoYXBweSB0aGF0IHRoaW5ncyBoYXZlIG5vdyBiZWVuIGZpeGVkLgoKPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGl2aXUg
RHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1
LmR1ZGF1QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IENjOiBCcmlhbiBTdGFya2V5
IDxicmlhbi5zdGFya2V5QGFybS5jb20+Cj4gQ2M6Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2Rydi5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBpbmRleCAwMjkwNDM5MmUzNzAuLmRiNmJhNWM3
ODA0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4gQEAgLTkyOCw3ICs5MjgsNiBA
QCBzdGF0aWMgdm9pZCBtYWxpZHBfdW5iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWRybV9k
ZXZfdW5yZWdpc3Rlcihkcm0pOwo+ICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRybSk7Cj4g
IAlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7Cj4gLQlkcm1fY3J0Y192Ymxhbmtfb2ZmKCZtYWxp
ZHAtPmNydGMpOwo+ICAJbWFsaWRwX3NlX2lycV9maW5pKGh3ZGV2KTsKPiAgCW1hbGlkcF9kZV9p
cnFfZmluaShod2Rldik7Cj4gIAlkcm0tPmlycV9lbmFibGVkID0gZmFsc2U7Cj4gLS0gCj4gMi4y
Ni4yCj4gCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZp
eCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAog
XCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
