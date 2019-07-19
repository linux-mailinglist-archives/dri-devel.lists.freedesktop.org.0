Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFA66E4AF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 13:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B556E6E802;
	Fri, 19 Jul 2019 11:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ECD6E802;
 Fri, 19 Jul 2019 11:08:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 24E792008A;
 Fri, 19 Jul 2019 13:08:01 +0200 (CEST)
Date: Fri, 19 Jul 2019 13:08:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Message-ID: <20190719110800.GA3247@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-12-sam@ravnborg.org>
 <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57ad927c-4b7f-d6e2-edda-720386190054@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=eF2l136HLxNaSI10T0kA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLgoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIGFuZCB2ZXJ5IHZhbGlkIHF1
ZXN0aW9uLgoKT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDY6NTY6NDdBTSArMDAwMCwgS29lbmln
LCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMTguMDcuMTkgdW0gMTg6MTUgc2NocmllYiBTYW0gUmF2
bmJvcmc6Cj4gPiBkcm1fZmlsZSB1c2VkIGRybV9tYWdpY190IGZyb20gdWFwaS9kcm0vZHJtLmgu
Cj4gPiBUaGlzIGlzIGEgc2ltcGxlIHVuc2lnbmVkIGludC4KPiA+IEp1c3Qgb3BlbmNvZGUgaXQg
YXMgc3VjaCB0byBicmVhayB0aGUgZGVwZW5kZW5jeSBmcm9tIHRoaXMgaGVhZGVyIGZpbGUKPiA+
IHRvIHVhcGkuCj4gCj4gTWhtLCB3aHkgZG8geW91IHdhbnQgdG8gcmVtb3ZlIFVBUEkgZGVwZW5k
ZW5jeSBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZT8KClRoZSBpZGVhIGlzIHRvIG1ha2UgaW5jbHVk
ZS9kcm0vKiBpbmRlcGVuZGVudCBvZiB1YXBpL2RybS8qIHNvIHRoZQpoZWFkZXIgZmlsZXMgYXJl
IGxlc3MgdGFuZ2xlZCB1cCB0aHVzIGVhc2llciB0byByZWFkIGFuZCBjb21wcmVoZW5kLgoKLmMg
ZmlsZXMgdGhhdCByZXF1aXJlcyB1YXBpIGNhbiB0aGVuIGluY2x1ZGUgdGhlIHVhcGkgaGVhZGVy
cy4KCkZvciBub3cgbXkgZm9jdXMgd2FzIHNvbGVseSBvbiB1YXBpL2RybS9kcm0uaCAtIHNvIEkg
ZHVubm8gaWYgdGhpcwppcyBhbiBhY2hpZXZhYmxlIGdvYWwgZm9yIGluY2x1ZGUvZHJtLyouCgpG
b3IgdWFwaS9kcm0vKiBoZWFkZXJzIHRoaW5ncyBhcmUgbW9yZSBjbGVhci4gVGhleSBzaGFsbCBi
ZQppbmRlcGVuZGVudCBvZiBpbmNsdWRlL2RybS8qIGFzIHRoZXkgYXJlIGV4cG9ydGVkLgoKPiBJ
IG1lYW4gdGhlIHR5cGUgY2FuJ3QgY2hhbmdlIGJlY2F1c2UgaXQgaXMgVUFQSSwgYnV0IGl0IGlz
IHJhdGhlciBiYWQgCj4gZm9yIGEgZG9jdW1lbnRhdGlvbiBwb2ludCBvZiB2aWV3LgoKRm9yIGEg
d2lkZWx5IHVzZWQgdHlwZSBJIHdvdWxkIGFncmVlLgpGb3Igc3RydWN0IGF1dGgsIHRoYXQgaXMg
b255IHVzZWQgaW4gZHJtX2F1dGguYyB0aGVuIHRoZSBkb2N1bWVudGF0aW9uCmltcGFjdCBpcyBt
aW5vci4gQnV0IHlvdXIgcG9pbnQgaXMgaW5kZWVkIHZhbGlkLgooc3RydWN0IGF1dGggaGFzIG9u
ZSBmaWVsZCBvZiB0eXBlIG1hZ2ljX3QpLgoKSSB3aWxsIGF3YWl0IGZ1cnRoZXIgZmVlZGJhY2sg
YmVmb3JlIHdlIGRlY2lkZSB0byBhcHBseSB0aGlzIHBhdGNoIG9yCm5vdC4KVGhlIHBhdGNoZXMg
dGhhdCBwdXNoZXMgaW5jbHVkZSBvZiBkcm0vZHJtLmggdG8gdGhlIHJlc3BlY3RpdmUgLmMKZmls
ZXMgYXJlIGxlZ2l0IGFzIHdlIGRyb3AgdGhlIGRlcGVuZGVuY3kgb24gYW4gaW5kaXJlY3RseSBp
bmNsdWRlZApoZWFkZXIgZmlsZS4gSSB3aWxsIHByb2Nlc3MgdGhlc2UgcGF0Y2hlcy4KCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
