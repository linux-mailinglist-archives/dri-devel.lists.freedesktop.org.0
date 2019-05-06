Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EBE14AD9
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A027898F5;
	Mon,  6 May 2019 13:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407A898F5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:23:01 +0000 (UTC)
X-Originating-IP: 90.88.149.145
Received: from localhost (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1834E1BF211;
 Mon,  6 May 2019 13:22:55 +0000 (UTC)
Date: Mon, 6 May 2019 15:22:55 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 18/20] lib: image-formats: Add v4l2 formats support
Message-ID: <20190506132255.k5d4e6wcsy5ltjjk@flea>
References: <cover.8ec406bf8f4f097e9dc909d5aac466556822f592.1555487650.git-series.maxime.ripard@bootlin.com>
 <a9af304793a38b6001c9155f36e370002926841c.1555487650.git-series.maxime.ripard@bootlin.com>
 <5c904167-14f3-8e64-42f1-650d0689f78d@xs4all.nl>
MIME-Version: 1.0
In-Reply-To: <5c904167-14f3-8e64-42f1-650d0689f78d@xs4all.nl>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0934131320=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0934131320==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="elbcsaswnwcxysle"
Content-Disposition: inline


--elbcsaswnwcxysle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans

On Thu, May 02, 2019 at 10:24:00AM +0200, Hans Verkuil wrote:
> On 4/17/19 9:54 AM, Maxime Ripard wrote:
> > V4L2 uses different fourcc's than DRM, and has a different set of formats.
> > For now, let's add the v4l2 fourcc's for the already existing formats.
>
> For this lib to be more useful for V4L2, would it be a good idea to add
> Bayer formats as well? This can be done in a separate patch.
>
> Those formats are V4L specific, but are very common.

Yeah, this was mostly to support the formats that are already
supported as of today, but eventually more are going to be supported,
and the bayer formats seems like a natural choice :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--elbcsaswnwcxysle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXNA1LwAKCRDj7w1vZxhR
xQb1AP9+7X+VYpkwMiJLhzyVSkvkphWcjZ4tq9sc/yOP03E47AD/YZpmkkIpI1FW
n04Y3eAA5DKrtCudeW0FjnAIclNJogs=
=bYjp
-----END PGP SIGNATURE-----

--elbcsaswnwcxysle--

--===============0934131320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0934131320==--
