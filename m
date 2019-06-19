Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A659A4B6F1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D624289612;
	Wed, 19 Jun 2019 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C9389612;
 Wed, 19 Jun 2019 11:21:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E867307D871;
 Wed, 19 Jun 2019 11:21:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B633060FAB;
 Wed, 19 Jun 2019 11:21:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3D63511AAB; Wed, 19 Jun 2019 13:21:17 +0200 (CEST)
Date: Wed, 19 Jun 2019 13:21:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
Message-ID: <20190619112117.fook3u4at5nvepsk@sirius.home.kraxel.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
 <20190618044925.qljngiypdch4wdsw@sirius.home.kraxel.org>
 <CAKMK7uGzO-r5MtU+EPWiqq=J_XuF5mRo8t_br2k++Uwd0+E2Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGzO-r5MtU+EPWiqq=J_XuF5mRo8t_br2k++Uwd0+E2Zw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 19 Jun 2019 11:21:19 +0000 (UTC)
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiA+IFNlY29uZCBvbmUgaXMgZHJtX2RyaXZlci0+Zm9wcy0+bW1hcC4gVGhhdCBv
bmUgd2UgbmVlZCB0byBrZWVwLCBidXQgdGhpcwo+ID4gPiBpc24ndCBtbWFwIG9uIGEgYnVmZmVy
LCBidXQgbW1hcCBvbiB0aGUgZW50aXJlIGRybV9kZXZpY2UuIFRoZSBvbmUgd2hpY2gKPiA+ID4g
c2hvdWxkIGJlIHJlcGxhY2VkIGJ5IGRybV9nZW1fb2JqZWN0X2Z1bmNzLnZtX29wcyBpcwo+ID4g
PiBkcm1fZHJpdmVyLT5nZW1fdm1fb3BzLgo+ID4KPiA+IEhtbSwgc2VlbXMgdHRtIGhhc24ndCBz
b21ldGhpbmcgSSBjYW4gaG9vayBpbnRvIGRybV9kcml2ZXItPmdlbV92bV9vcHMgLi4uCj4gCj4g
dHRtX2JvX3ZtX29wcyBzZWVtcyB0byBiZSB0aGUgdGhpbmcgeW91IHdhbnQuCgpXb3VsZG4ndCB3
b3JrIGFzLWlzLCBidXQgd2hlbiB0dG0gYm8gYXJlIGEgc3ViY2xhc3Mgb2YgZ2VtIGJvcyBzaG91
bGQKYmUgcG9zc2libGUgdG8gY3JlYXRlIHNvbWV0aGluZyB1c2FibGUgYmFzZWQgb24gaXQuCgpS
ZWxhdGVkIHF1ZXN0aW9uOiB3aHkgdGhlcmUgaXMgbm8gZHJtX2dlbV9vYmplY3RfZnVuY3MubW1h
cCgpIGNhbGxiYWNrPwpJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gaGF2ZSBhIGNhbGxi
YWNrIHdoZXJlIHRoZSBiby1zcGVjaWZpYwpzZXR1cCBjYW4gYmUgZG9uZSwgaS5lLiB3aGF0IHR0
bV9ib19tbWFwKCkgb3IgZHJtX2dlbV9zaG1lbV9tbWFwKCkgYXJlCmRvaW5nLCBhbmQgaGF2ZSBz
b21lIGdlbmVyaWMgZnVuY3Rpb24gd2hpY2ggYmFzaWNhbGx5IGRvZXMgdGhlIGxvb2t1cCwKdGhl
biBkaXNwYXRjaGVzLgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
