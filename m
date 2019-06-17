Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301247C2F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 10:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3886A8915B;
	Mon, 17 Jun 2019 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4908189151;
 Mon, 17 Jun 2019 08:24:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 792877FDF6;
 Mon, 17 Jun 2019 08:24:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCCF17E666;
 Mon, 17 Jun 2019 08:24:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E34D16E18; Mon, 17 Jun 2019 10:24:38 +0200 (CEST)
Date: Mon, 17 Jun 2019 10:24:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
Message-ID: <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-41-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 08:24:50 +0000 (UTC)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gQXNpZGU6IFdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHN3aXRjaCB0aGUgb3RoZXJz
IG92ZXIgdG8KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KCldoaWxlIG1vc3QgY2FsbGJhY2tzIGFy
ZSBwcmV0dHkgc3RyYWlnaHQgZm9yd2FyZCAoanVzdCBob29rIHRoZSBzYW1lCmNhbGxiYWNrcyBp
bnRvIHRoZSBkcm1fZ2VtX29iamVjdF9mdW5jcy4gc3RydWN0KSB0aGUgbW1hcCBiaXRzIGFyZSBh
CmJpdCBtb3JlIG9ic2N1cmUuCgpGaXJzdCwgdGhlcmUgc2VlbSB0byBiZSB0d28gd2F5cyB0byBt
bWFwIGEgZ2VtIGJ1ZmZlcjoKCiAgKDEpIGRybV9kcml2ZXItPmZvcHMtPm1tYXAsIGFuZAogICgy
KSBkcm1fZHJpdmVyLT5nZW1fcHJpbWVfbW1hcC4KCmRybV9nZW1fb2JqZWN0X2Z1bmNzIGhhcyBq
dXN0IGEgc2luZ2xlIHZtX29wcyAuLi4KCkFsc28gaXQgaXMgbm90IG9idmlvdXMgaG93IG9uZSB3
b3VsZCBjb252ZXJ0IHNvbWV0aGluZyB3aGljaCBiYXNpY2FsbHkKY2FsbHMgdHRtX2JvX21tYXAo
KSBpbiBkcm1fZHJpdmVyLT5mb3BzLT5tbWFwIHRvIHRoZSBuZXcgaW50ZXJmYWNlLgoKdGhhbmtz
LAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
