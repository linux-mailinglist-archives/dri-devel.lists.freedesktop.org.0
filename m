Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893727D88FA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7572010E878;
	Thu, 26 Oct 2023 19:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D76D10E878
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:34:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9FF30CE3FEE;
 Thu, 26 Oct 2023 19:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8767EC433C8;
 Thu, 26 Oct 2023 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698348860;
 bh=SkTgfCoXNMdmeWinOnZ1SsXQ907DdbHEAf3ryNnM4Gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=edzyiGozU1QE4eJCU0hy6+P2s5Xzb3qnTcsxM6q0AO7lVEIrXHqiZtzp8KKzKDq/d
 wbP/BP8VPOfKD3XokJN0ZD19C3dXGAATI42uRGBFzF85IJ/oGvNeO6NZlWmsgko9AO
 ytD5daGgIbP/41rbMPPwF7rsKyAgKUU76ZadN8hspfGJb+U3g8Qc+8OhapD2HCPMIa
 4ztvcolWWkWiqdK9mWx2HZIe0KDLmIIDD+dojc1Qsb38nlqL1U6TSVbeZpblRCS8ie
 6WGN5vhJhmqFzvX827nxcHdHJI8StG6bnZKTeGQzhQBgEsZcyfH8BHtBYR5ne9FaUg
 moGHd4onPQ/wQ==
Date: Thu, 26 Oct 2023 21:34:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 2/2] drm/todo: Add entry to clean up former seltests
 suites
Message-ID: <epdvcfm7imbcy53nb4z7pcbp3glebv6uhjzm3pc4mkl2say334@xc5rqghzfqpa>
References: <20231025132428.723672-1-mripard@kernel.org>
 <20231025132428.723672-2-mripard@kernel.org>
 <8b3a8ffc-dd40-88ac-6989-bc727d0045f4@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kbyic2idpm33jz5g"
Content-Disposition: inline
In-Reply-To: <8b3a8ffc-dd40-88ac-6989-bc727d0045f4@igalia.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kbyic2idpm33jz5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maira,

On Wed, Oct 25, 2023 at 02:26:44PM -0300, Maira Canal wrote:
> Hi Maxime,
>=20
> Wouldn't be nice to add to the TODO list an item regarding the deleted
> drm_mm tests? Something just to remember us to develop new tests for it
> in the future.

I guess we could, but it's really not clear to me what these were
testing in the first place.

So the scope of the work would effectively be "increase our test
coverage" which I believe is already covered by the todo task just
above.

Maxime

> On 10/25/23 10:24, Maxime Ripard wrote:
> > Most of those suites are undocumented and aren't really clear about what
> > they are testing. Let's add a TODO entry as a future task to get started
> > into KUnit and DRM.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   Documentation/gpu/todo.rst | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 03fe5d1247be..b62c7fa0c2bc 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -621,6 +621,23 @@ Contact: Javier Martinez Canillas <javierm@redhat.=
com>
> >   Level: Intermediate
> > +Clean up and document former selftests suites
> > +---------------------------------------------
> > +
> > +Some KUnit test suites (drm_buddy, drm_cmdline_parser, drm_damage_help=
er,
> > +drm_format, drm_framebuffer, drm_dp_mst_helper, drm_mm, drm_plane_help=
er and
> > +drm_rect) are former selftests suites that have been converted over wh=
en KUnit
> > +was first introduced.
> > +
> > +These suites were fairly undocumented, and with different goals than w=
hat unit
> > +tests can be. Trying to identify what each test in these suites actual=
ly test
> > +for, whether that makes sense for a unit test, and either remove it if=
 it
> > +doesn't or document it if it does would be of great help.
> > +
> > +Contact: Maxime Ripard <mripard@kernel.org>
> > +
> > +Level: Intermediate
> > +
> >   Enable trinity for DRM
> >   ----------------------
>=20

--kbyic2idpm33jz5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTq/OgAKCRDj7w1vZxhR
xRm+AQDndOsj87J+UaFUDNUPsLYShmXOa+Ve1u1acgf4bBo/LwEApZh4ZUi1mv9Y
cNjaQ/I0PHG3MPM6jLUDN45A/c29fAU=
=+91u
-----END PGP SIGNATURE-----

--kbyic2idpm33jz5g--
