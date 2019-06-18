Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9449AAE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757C6E103;
	Tue, 18 Jun 2019 07:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426056E103
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:35:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6C6D5;
 Tue, 18 Jun 2019 09:35:25 +0200 (CEST)
Date: Tue, 18 Jun 2019 10:35:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 26/59] drm/rcar-du: Drop drm_gem_prime_export/import
Message-ID: <20190618073508.GD4800@pendragon.ideasonboard.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-27-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-27-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560843325;
 bh=Fzhc1I4GvnyBFZliP4EYcydVYhoOIH848SWA0jWyt+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ho9wb0GWHwy5g/DbXnaswR7Ckz3k1KfMySQt+RwkZktLuuI+F6t0lutd1XsSteZRx
 pf4agCo/mF0vFzSn0WS8E4xf2lIS2xkBLcziX2kEyQs2u5wjEJxPTnm+SW8a2/hYth
 zbh8iob0ga9i8RGmmA/3ogHpvV6tZszKqcbeVip8=
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIEp1biAxNCwgMjAx
OSBhdCAxMDozNTo0MlBNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZXkncmUgdGhl
IGRlZmF1bHQuCj4gCj4gQXNpZGU6IFdvdWxkIGJlIHJlYWxseSBuaWNlIHRvIHN3aXRjaCB0aGUg
b3RoZXJzIG92ZXIgdG8KPiBkcm1fZ2VtX29iamVjdF9mdW5jcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IENjOiBs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcKClJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpGZWVsIGZyZWUgdG8g
bWVyZ2VkIHRoaXMgYXMgcGFydCBvZiB0aGUgc2VyaWVzLgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJf
ZHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gaW5kZXgg
ODM2ODUyNTAzMTlkLi45YzkzZWI0ZmFkOGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JjYXItZHUvcmNhcl9kdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfZHVfZHJ2LmMKPiBAQCAtNDQ2LDggKzQ0Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZl
ciByY2FyX2R1X2RyaXZlciA9IHsKPiAgCS5nZW1fdm1fb3BzCQk9ICZkcm1fZ2VtX2NtYV92bV9v
cHMsCj4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQs
Cj4gIAkucHJpbWVfZmRfdG9faGFuZGxlCT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCj4g
LQkuZ2VtX3ByaW1lX2ltcG9ydAk9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAo+IC0JLmdlbV9wcmlt
ZV9leHBvcnQJPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKPiAgCS5nZW1fcHJpbWVfZ2V0X3NnX3Rh
YmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+ICAJLmdlbV9wcmltZV9pbXBv
cnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4gIAkuZ2Vt
X3ByaW1lX3ZtYXAJCT0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
