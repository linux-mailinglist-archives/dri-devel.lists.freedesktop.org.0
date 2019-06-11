Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1E3C913
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 12:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F90C89175;
	Tue, 11 Jun 2019 10:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0589175;
 Tue, 11 Jun 2019 10:37:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DAB988035B;
 Tue, 11 Jun 2019 12:37:13 +0200 (CEST)
Date: Tue, 11 Jun 2019 12:37:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Message-ID: <20190611103712.GA31140@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <20190609220757.10862-2-sam@ravnborg.org>
 <20190611083911.GT21222@phenom.ffwll.local>
 <20190611091107.GA29656@ravnborg.org>
 <20190611094224.GA21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611094224.GA21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=FbWCrau-7VuC2i8PjrkA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKPiA+IAo+ID4gZHJtX3ByaW50LmggdXNlcyBEUk1fTkFNRSAtIHdoaWNoIGlz
IGRlZmluZWQgb25seSBpbiB1YXBpL2RybS9kcm0uaC4KPiA+IFRoZSBlcnJvciBpcyBzZWVuIHdo
ZW4geW91IGluY2x1ZGUgZHJtX3ByaW50LmggYW5kIG5vdCBtdWNoIG90aGVyIGRybQo+ID4gaGVh
ZGVyIGZpbGVzLgo+ID4gVGlkYXkgd2UgcmVseSBvbiBvdGhlciBkcm0gaGVhZGVyIGZpbGVzIHRv
IHB1bGwgaW4gZHJtLmguCj4gPiAKPiA+IE5vdGljZSAtIHRoZSBlcnJvciBvbmx5IG1hbmlmZXN0
IGl0c2VsZiB3aGVuIHRoZSBtYWNyb3MgYXJlIHVzZWQuCj4gPiBJbmNsdWRpbmcgdGhlIGRybV9w
cmludC5oIHdpbGwgbm90IGRvIGl0Lgo+IAo+IFVoLCBJIHRoaW5rIGxldCdzIGp1c3QgaW5saW5l
IERSTV9OQU1FLCB0aGF0IGFsc28gY2xlYW5zIHVwIHRoZSBjb2RlLiBBbmQKPiBkcm9wIHRoZSB1
YXBpIGluY2x1ZGUgZnJvbSBkcm0gaW50ZXJuYWwgaGVhZGVycywgdGhhdCBmZWVscyBiYWQuIElu
Cj4gZ2VuZXJhbCBJIHRoaW5rIHVhcGkgaGVhZGVycyBzaG91bGQgb25seSBiZSBpbmNsdWRlZCBi
eSB0aGUgLmMgZmlsZXMgdGhhdAo+IGFjdHVhbGx5IGltcGxlbWVudCBpb2N0bHMgYW5kIHN0dWZm
IGxpa2UgdGhhdC4KPiAKPiBDYW4geW91IHBscyBkbyB0aGF0IHBhdGNoIGZvciBkcm1fcHJpbnQu
aD8KClllcCAtIHdpbGwgZG8gaW4gYSBmZXcgZGF5cy4KCglTYW0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
