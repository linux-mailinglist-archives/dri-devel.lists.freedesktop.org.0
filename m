Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84978BAE3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C956E14F;
	Tue, 13 Aug 2019 13:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA76E14F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:55:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 233FE2B2;
 Tue, 13 Aug 2019 15:55:12 +0200 (CEST)
Date: Tue, 13 Aug 2019 16:55:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 32/60] drm/omap: dss: Make omap_dss_device_ops optional
Message-ID: <20190813135501.GI5009@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-29-laurent.pinchart@ideasonboard.com>
 <5154578a-5dea-3254-34e2-01e8fbc34a11@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5154578a-5dea-3254-34e2-01e8fbc34a11@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1565704512;
 bh=+PL5G3X397NTv/SFikS4eDjQbHRAUah0ulh5dEZMvOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDK3qEIESms5jPj6kSbw/I7aFyPELEvyVh68SXRvQxU4dHYmkx7DdYR+jSQ1n3jYv
 eeCR5o3PF12JcuislRofv0T2SslUZoOva4FF0pCM9VV6KLiueP9mjbtHXELfxfle1d
 HcRas0N+pjkfyB7+u0de/E2dYQu+Q8iOD6nbLhpQ=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDEwOjQ4OjAxQU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDA3LzA3LzIwMTkgMjE6MTksIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBBcyBwYXJ0IG9mIHRoZSBtb3ZlIHRvIGRybV9icmlkZ2Ugb3BzIGZvciBzb21l
IG9mIHRoZSBpbnRlcm5hbCBlbmNvZGVycwo+ID4gd2lsbCBiZSByZW1vdmVkLiBNYWtlIHRoZW0g
b3B0aW9uYWwgaW4gdGhlIGRyaXZlciB0byBlYXNlIHRoZQo+ID4gdHJhbnNpdGlvbi4KPiAKPiBJ
IGRvbid0IHNlZW0gdG8gYmUgYWJsZSB0byBkZWNpcGhlciB0aGUgZmlyc3Qgc2VudGVuY2UuIElz
IHRoZXJlIGEgd29yZCAKPiBvciB0d28gbWlzc2luZyBmcm9tIGl0PwoKSW5kZWVkLiBJJ3ZlIHJl
d3JpdHRlbiB0aGlzIGFzCgpBcyBwYXJ0IG9mIHRoZSBtb3ZlIHRvIGRybV9icmlkZ2Ugb3BzLCB0
aGUgZHNzZGV2IG9wcyB3aWxsIGJlY29tZSBlbXB0eQpmb3Igc29tZSBvZiB0aGUgaW50ZXJuYWwg
ZW5jb2RlcnMuIE1ha2UgdGhlbSBvcHRpb25hbCBpbiB0aGUgZHJpdmVyIHRvCmFsbG93IHRoZW0g
dG8gYmUgcmVtb3ZlZCBjb21wbGV0ZWx5LCBlYXNpbmcgdGhlIHRyYW5zaXRpb24uCgo+IE90aGVy
IHRoYW4gdGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
