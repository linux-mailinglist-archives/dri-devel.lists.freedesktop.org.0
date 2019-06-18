Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EB4986F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 06:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFD689C14;
	Tue, 18 Jun 2019 04:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED13F89C14;
 Tue, 18 Jun 2019 04:49:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4638C81DE1;
 Tue, 18 Jun 2019 04:49:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8851C608C2;
 Tue, 18 Jun 2019 04:49:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4348911AAF; Tue, 18 Jun 2019 06:49:25 +0200 (CEST)
Date: Tue, 18 Jun 2019 06:49:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
Message-ID: <20190618044925.qljngiypdch4wdsw@sirius.home.kraxel.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617135912.GB12905@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 18 Jun 2019 04:49:58 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBXaGlsZSBtb3N0IGNhbGxiYWNrcyBhcmUgcHJldHR5IHN0cmFpZ2h0IGZvcndh
cmQgKGp1c3QgaG9vayB0aGUgc2FtZQo+ID4gY2FsbGJhY2tzIGludG8gdGhlIGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzLiBzdHJ1Y3QpIHRoZSBtbWFwIGJpdHMgYXJlIGEKPiA+IGJpdCBtb3JlIG9ic2N1
cmUuCj4gPiAKPiA+IEZpcnN0LCB0aGVyZSBzZWVtIHRvIGJlIHR3byB3YXlzIHRvIG1tYXAgYSBn
ZW0gYnVmZmVyOgo+ID4gCj4gPiAgICgxKSBkcm1fZHJpdmVyLT5mb3BzLT5tbWFwLCBhbmQKPiA+
ICAgKDIpIGRybV9kcml2ZXItPmdlbV9wcmltZV9tbWFwLgo+ID4gCj4gPiBkcm1fZ2VtX29iamVj
dF9mdW5jcyBoYXMganVzdCBhIHNpbmdsZSB2bV9vcHMgLi4uCj4gPiAKPiA+IEFsc28gaXQgaXMg
bm90IG9idmlvdXMgaG93IG9uZSB3b3VsZCBjb252ZXJ0IHNvbWV0aGluZyB3aGljaCBiYXNpY2Fs
bHkKPiA+IGNhbGxzIHR0bV9ib19tbWFwKCkgaW4gZHJtX2RyaXZlci0+Zm9wcy0+bW1hcCB0byB0
aGUgbmV3IGludGVyZmFjZS4KPiAKPiBZZWFoIHRoZSBtbWFwIHNpZGUgaXMgc3RpbGwgYSBtZXNz
LCBidXQgbXkgc2VyaWVzIGhlcmUgd2FzIGdldHRpbmcgYSBiaXQKPiB0b28gbG9uZyBhbHJlYWR5
LiBUaGVyZSdzIGEgYnVuY2ggb2YgcHJvYmxlbXMgaGVyZToKPiAKPiBkcm1fZHJpdmVyLT5nZW1f
cHJpbWVfbW1hcCBjb3VsZCBiZSBudWtlZCBhbmQgaW5zdGVhZCB3ZSB1c2UKPiBkcm1fZ2VtX3By
aW1lX21tYXAgZXZlcnl3aGVyZS4gRXNwZWNpYWxseSB0aGUgdmFyaW91cyB2ZXJzaW9ucyBpbiBo
ZWxwZXJzCj4gcmVhbGx5IGRvbid0IGFkZCBtdWNoLgoKV2VsbCwgZXZlcnl0aGluZyB1c2luZyB0
dG0gaGFzIHRoZSBwcm9ibGVtIHRoYXQgd2UgaGF2ZSBhbm90aGVyCmR1cGxpY2F0aW9uIGhlcmU6
IGJvdGggZ2VtIGFuZCB0dG0gaGF2ZSBhIHZtYV9ub2RlIC4uLgoKU28gKGZvciBleGFtcGxlKSBk
cm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9wcmltZV9tbWFwKCkgaXMgYSB0aGluIHdyYXBwZXIKd2hp
Y2ggZG9lcyAoYSkgY29weSB2bV9ub2RlLnN0YXJ0IGZyb20gdHRtIHRvIGdlbSB2bWFfbm9kZSBh
bmQgKGIpIGNhbGxzCmRybV9nZW1fcHJpbWVfbW1hcCgpLgoKPiBTZWNvbmQgb25lIGlzIGRybV9k
cml2ZXItPmZvcHMtPm1tYXAuIFRoYXQgb25lIHdlIG5lZWQgdG8ga2VlcCwgYnV0IHRoaXMKPiBp
c24ndCBtbWFwIG9uIGEgYnVmZmVyLCBidXQgbW1hcCBvbiB0aGUgZW50aXJlIGRybV9kZXZpY2Uu
IFRoZSBvbmUgd2hpY2gKPiBzaG91bGQgYmUgcmVwbGFjZWQgYnkgZHJtX2dlbV9vYmplY3RfZnVu
Y3Mudm1fb3BzIGlzCj4gZHJtX2RyaXZlci0+Z2VtX3ZtX29wcy4KCkhtbSwgc2VlbXMgdHRtIGhh
c24ndCBzb21ldGhpbmcgSSBjYW4gaG9vayBpbnRvIGRybV9kcml2ZXItPmdlbV92bV9vcHMgLi4u
CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
