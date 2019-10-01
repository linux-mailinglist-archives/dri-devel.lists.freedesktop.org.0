Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC80BC417C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 21:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF19A6E784;
	Tue,  1 Oct 2019 19:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CF46E784
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 19:59:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C11D23F;
 Tue,  1 Oct 2019 21:59:05 +0200 (CEST)
Date: Tue, 1 Oct 2019 22:58:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 05/50] drm/bridge: Extend bridge API to disable
 connector creation
Message-ID: <20191001195853.GF21064@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-6-laurent.pinchart@ideasonboard.com>
 <3ac8ee76-8399-6d60-1db8-05c5763e6f75@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ac8ee76-8399-6d60-1db8-05c5763e6f75@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569959945;
 bh=KKCo+OHMj+MNMfeQtZVm2aUfJ9D6nmESCOw7quIXMFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NyeLKtC4dj1D8O1d8EMolvlrGlzyduBCGtCy+wDZRr+N+ho4LQN3A8gCnQzGr+lbA
 eu5WKr+snaf/J5CxB/Y3m+0a0fVm82UXl/e2fFwDuM50Jy7vhFHg2+C6hT+kKNNcd7
 epD6KFnVLROgUjRoyCqI8lnD57vCns9N5ob+y92o=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDEwOjA0OjExQU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIwLzA4LzIwMTkgMDQ6MTYsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gCj4gPiBAQCAtMTExMSw3ICsxMTEzLDcgQEAgaW50IGR3X21pcGlfZHNpX2JpbmQo
c3RydWN0IGR3X21pcGlfZHNpICpkc2ksIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+
ICAgewo+ID4gICAJaW50IHJldDsKPiA+ICAgCj4gPiAtCXJldCA9IGRybV9icmlkZ2VfYXR0YWNo
KGVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCk7Cj4gPiArCXJldCA9IGRybV9icmlkZ2VfYXR0
YWNoKGVuY29kZXIsICZkc2ktPmJyaWRnZSwgTlVMTCwgdHJ1ZSk7Cj4gCj4gVGhpcyBkb2Vzbid0
IGxvb2sgY29ycmVjdC4gV2hlcmUgZG9lcyB0aGUgInRydWUiIGNvbWUgZnJvbT8KCkl0IHNob3Vs
ZCBiZSAwLiBJIHRoaW5rIGl0IGNvbWVzIGZyb20gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhp
cwpwYXRjaCwgd2hpY2ggSSd2ZSByZWJhc2VkIGluc3RlYWQgb2YgcmVnZW5lcmF0aW5nIGl0IGNv
bXBsZXRlbHkgd2l0aApDb2NjaW5lbGxlLiBJJ2xsIGZpeCB0aGF0LgoKLS0gClJlZ2FyZHMsCgpM
YXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
