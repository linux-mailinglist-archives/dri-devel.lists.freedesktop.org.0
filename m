Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565CD55431
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 18:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7126E16B;
	Tue, 25 Jun 2019 16:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0F6E194
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:12:38 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hfo3h-0008H0-8C; Tue, 25 Jun 2019 18:12:37 +0200
Message-ID: <1561479157.2587.16.camel@pengutronix.de>
Subject: Re: [PATCH 13/59] drm/etnaviv: Drop drm_gem_prime_export/import
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Tue, 25 Jun 2019 18:12:37 +0200
In-Reply-To: <20190614203615.12639-14-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-14-daniel.vetter@ffwll.ch>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDE0LjA2LjIwMTksIDIyOjM1ICswMjAwIHNjaHJpZWIgRGFuaWVsIFZl
dHRlcjoKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkg
bmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+IENjOiBSdXNz
ZWxsIEtpbmcgPGxpbnV4K2V0bmF2aXZAYXJtbGludXgub3JnLnVrPgo+IENjOiBDaHJpc3RpYW4g
R21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IENjOiBldG5hdml2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwoKUmV2aWV3ZWQtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2
LmMgfCAyIC0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMKPiBpbmRleCBkYjNiMDAwMzFmY2YuLjQwMGZiYjI1
ODhmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwo+IEBAIC00Njks
OCArNDY5LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGV0bmF2aXZfZHJtX2RyaXZlciA9
IHsKPiA+IMKgCS5nZW1fdm1fb3BzwqDCoMKgwqDCoMKgwqDCoMKgPSAmdm1fb3BzLAo+ID4gwqAJ
LnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAo+ID4gwqAJ
LnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+ID4gLQku
Z2VtX3ByaW1lX2V4cG9ydMKgwqDCoD0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gPiAtCS5nZW1f
cHJpbWVfaW1wb3J0wqDCoMKgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiA+IMKgCS5nZW1fcHJp
bWVfcGluwqDCoMKgwqDCoMKgPSBldG5hdml2X2dlbV9wcmltZV9waW4sCj4gPiDCoAkuZ2VtX3By
aW1lX3VucGluwqDCoMKgwqA9IGV0bmF2aXZfZ2VtX3ByaW1lX3VucGluLAo+ID4gwqAJLmdlbV9w
cmltZV9nZXRfc2dfdGFibGUgPSBldG5hdml2X2dlbV9wcmltZV9nZXRfc2dfdGFibGUsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
