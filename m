Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1F605EE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D406E495;
	Fri,  5 Jul 2019 12:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A5C6E09F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:31:08 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 45A75FF806;
 Fri,  5 Jul 2019 12:31:02 +0000 (UTC)
Date: Fri, 5 Jul 2019 14:31:01 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 5/5] RFC: MAINTAINERS: maintain drm/arm drivers in
 drm-misc for now
Message-ID: <20190705123101.purqrxvfzr2ifjkk@flea>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
 <20190705121006.26085-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190705121006.26085-5-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 James Qian Wang <james.qian.wang@arm.com>, Dave Airlie <airlied@redhat.com>,
 Mali DP Maintainers <malidp@foss.arm.com>, Lowry Li <lowry.li@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0891327382=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0891327382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o7mdyfk3dvuhzgye"
Content-Disposition: inline


--o7mdyfk3dvuhzgye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2019 at 02:10:06PM +0200, Daniel Vetter wrote:
> From discussions with Liviu it sounded like the komeda team would
> benefit a bit from more cross-review with other drivers. To make sure
> komeda is aligned with how similar problems are solved in other
> drivers (in the end everyone ends up with similar ideas on how to
> solve various display engine design issues).
>
> An option would be to use drm-misc as an incubator for a few kernel
> releases, at least until the big design items have been tackled: Aside
> from the four kms properties already landed that we need to take out
> again there's also a pile of new ones proposed already for komeda.
> drm-misc seems to work fairly well at encouraging these kind of
> cross-driver reviews and working on cross-driver infrastructure in drm
> core. Later on we can move all the drivers out to a dedicated arm tree
> again (if that's desired).
>
> Of coures that would mean Lowry and James need drm-misc commit rights
> (all other arm contributors have it already I think).
>
> Cc: Lowry Li (Arm Technology China) <lowry.li@arm.com>
> Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--o7mdyfk3dvuhzgye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXR9DBQAKCRDj7w1vZxhR
xWWgAP9XUb1YH3qZmdD5LCRaOn5I44ZvnvvjtTI2D0svTZ5ZMQEA2usjJgbaeioj
M3xeVSkSncv+7xSniAjhIlQUhOxVJQU=
=7IlM
-----END PGP SIGNATURE-----

--o7mdyfk3dvuhzgye--

--===============0891327382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0891327382==--
