Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F14F49A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 11:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC5E6E95F;
	Sat, 22 Jun 2019 09:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59376E95F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 09:05:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 74D4C8035B;
 Sat, 22 Jun 2019 11:05:05 +0200 (CEST)
Date: Sat, 22 Jun 2019 11:04:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/1] drm/exynos: drop use of drmP.h
Message-ID: <20190622090459.GA7064@ravnborg.org>
References: <20190621184904.25975-1-sam@ravnborg.org>
 <CAJKOXPeNDGYCctL4OpBH1V+Ez4Ld1CDzB_pANxQkwqBzj8zEmA@mail.gmail.com>
 <20190622073144.GA12883@ravnborg.org>
 <CAJKOXPfwSB5dn4k5OfMN=jb5DxnqwqAZnma3yF_UPHs5PapUSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPfwSB5dn4k5OfMN=jb5DxnqwqAZnma3yF_UPHs5PapUSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=Ub1tiNI5gqzlV-9_ROgA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLgoKPiA+IEFkZGluZyBhIENPTVBJTEVfVEVTVCBkZXBlbmRlbmN5IHdpbGwg
ZW5hYmxlIHRoZSBidWlsZAo+ID4gZm9yIHRoZSBhbGx5ZXNjb25maWcsIGFsbG1vZGNvbmZpZy4K
PiA+IFRoYXRzIHdvcnRocyB0byBjb25zaWRlciB0byBhdm9pZCBmdXR1cmUgbWlzdGFrZXMuCj4g
PgoKPiBPaCB5ZXMsIHRoYXQgZGVmaW5pdGVseSBtYWtlcyBzZW5zZSAoYXNzdW1pbmcgaXQgY29t
cGlsZXMgb24gYWxsCj4gYXJjaHMpLiBNYXliZSB5b3UgY2FuIHNlbmQgYSBmb2xsb3cgdXAgYWRk
aW5nIHRoZXNlPwoKVGhlIGRyaXZlciBpcyBsaW1pdGVkIHRvIEFSTSB0b2RheS4KSSBjb3VsZCB0
YWtlIGEgc2hvdCBhdCBmaXhpbmcgYnVpbGQgZXJyb3Mgb24gb3RoZXIgYXJjaHMKYW5kIHRoZW4g
bGV0IHRoZSBmdWxsIGRyaXZlciBkZXBlbmQgb24gQ09NUElMRV9URVNULgoKSSB3aWxsIGdpdmUg
aXQgYSBzcGluLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
