Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B55596F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925E16E241;
	Tue, 25 Jun 2019 20:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D46E23F;
 Tue, 25 Jun 2019 20:52:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A475E80301;
 Tue, 25 Jun 2019 22:52:18 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:52:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/7] drm/radeon: Fill out gem_object->resv
Message-ID: <20190625205217.GC19279@ravnborg.org>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625204208.5614-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=h74VYRpQRrQeAbtIsNgA:9 a=CjuIK1q_8ugA:10
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
Cc: amd-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDI6MDVQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGF0IHdheSB3ZSBjYW4gZGl0Y2ggb3VyIGdlbV9wcmltZV9yZXNfb2JqIGltcGxl
bWVudGF0aW9uLiBTaW5jZSB0dG0KPiBhYnNvbHV0ZWx5IG5lZWRzIHRoZSByaWdodCByZXNlcnZh
dGlvbiBvYmplY3QgYWxsIHRoZSBib2lsZXJwbGF0ZSBpcwo+IGFscmVhZHkgdGhlcmUgYW5kIHdl
IGp1c3QgaGF2ZSB0byB3aXJlIGl0IHVwIGNvcnJlY3RseS4KPiAKPiBOb3RlIHRoYXQgZ2VtL3By
aW1lIGRvZXNuJ3QgY2FyZSB3aGVuIHdlIGRvIHRoaXMsIGFzIGxvbmcgYXMgd2UgZG8gaXQKPiBi
ZWZvcmUgdGhlIGJvIGlzIHJlZ2lzdGVyZWQgYW5kIHNvbWVvbmUgY2FuIGNhbGwgdGhlIGhhbmRs
ZTJmZCBpb2N0bAo+IG9uIGl0Lgo+IAo+IEFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVz
diBjb3VsZCBwcm9iYWJseSBiZSBkaXRjaGVkIGluIGZhdm91cgo+IG9mIGFsd2F5cyBwYXNzaW5n
IGEgbm9uLU5VTEwgcmVzdiB0byB0dG1fYm9faW5pdCgpLiBBdCBsZWFzdCBmb3IgZ2VtCj4gZHJp
dmVycyB0aGF0IHdvdWxkIGF2b2lkIGhhdmluZyB0d28gb2YgdGhlc2UsIG9uIGluIHR0bV9idWZm
ZXJfb2JqZWN0Cj4gYW5kIHRoZSBvdGhlciBpbiBkcm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhl
cmUgZm9yIGNvbmZ1c2lvbi4KU29tZXRoaW5nIGZvciB0b2RvLnJzdCAtIHNvIHRoaXMgZG9lcyBu
b3QgZ2V0IGxvc3QgaW4gYSBjaGFuZ2Vsb2cKcGVvcGxlIHdpbGwgc29vbiBmb3JnZXQ/CgoJU2Ft
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
