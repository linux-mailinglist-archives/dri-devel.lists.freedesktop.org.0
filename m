Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C31EBC3F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 15:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C456E0CF;
	Tue,  2 Jun 2020 13:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DD4E6E0CF;
 Tue,  2 Jun 2020 13:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CBB1FB;
 Tue,  2 Jun 2020 06:00:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F9B23F305;
 Tue,  2 Jun 2020 06:00:18 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id EEFDA68065E; Tue,  2 Jun 2020 14:00:16 +0100 (BST)
Date: Tue, 2 Jun 2020 14:00:16 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/hdlcd: Don't call drm_crtc_vblank_off on unbind
Message-ID: <20200602130016.GR159988@e110455-lin.cambridge.arm.com>
References: <20200602095140.36678-1-daniel.vetter@ffwll.ch>
 <20200602095140.36678-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602095140.36678-3-daniel.vetter@ffwll.ch>
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTE6NTE6NDBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGlzIGlzIGFscmVhZHkgdGFrZW4gY2FyZSBvZiBieSBkcm1fYXRvbWljX2hlbHBl
cl9zaHV0ZG93bigpLCBhbmQKPiBpbiB0aGF0IGNhc2Ugb25seSBmb3IgdGhlIENSVEMgd2hpY2gg
YXJlIGFjdHVhbGx5IG9uLgo+IAo+IE9ubHkgdHJpY2t5IGJpdCBoZXJlIGlzIHRoYXQgd2Uga2ls
bCB0aGUgaW50ZXJydXB0IGhhbmRsaW5nIGJlZm9yZSB3ZQo+IHNodXQgZG93biBjcnRjLCBzbyBu
ZWVkIHRvIHJlb3JkZXIgdGhhdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+CgpCZXN0
IHJlZ2FyZHMsCkxpdml1Cgo+IENjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5j
b20+Cj4gQ2M6Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgfCAzICst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2hkbGNkX2Rydi5jCj4gaW5kZXggMTk0NDE5ZjQ3YzVlLi4yNmJjNWQ3NzY2ZjUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxjZF9kcnYuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMKPiBAQCAtMzQ3LDkgKzM0Nyw4IEBAIHN0YXRp
YyB2b2lkIGhkbGNkX2RybV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJb2Zfbm9kZV9w
dXQoaGRsY2QtPmNydGMucG9ydCk7Cj4gIAloZGxjZC0+Y3J0Yy5wb3J0ID0gTlVMTDsKPiAgCXBt
X3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsKPiAtCWRybV9jcnRjX3ZibGFua19vZmYoJmhkbGNkLT5j
cnRjKTsKPiAtCWRybV9pcnFfdW5pbnN0YWxsKGRybSk7Cj4gIAlkcm1fYXRvbWljX2hlbHBlcl9z
aHV0ZG93bihkcm0pOwo+ICsJZHJtX2lycV91bmluc3RhbGwoZHJtKTsKPiAgCXBtX3J1bnRpbWVf
cHV0KGRldik7Cj4gIAlpZiAocG1fcnVudGltZV9lbmFibGVkKGRldikpCj4gIAkJcG1fcnVudGlt
ZV9kaXNhYmxlKGRldik7Cj4gLS0gCj4gMi4yNi4yCj4gCgotLSAKPT09PT09PT09PT09PT09PT09
PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUg
bm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0t
LS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
