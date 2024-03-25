Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5B88A568
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A736110E959;
	Mon, 25 Mar 2024 14:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V5Fhd8d3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751310E968
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2C6CFCE1A4E;
 Mon, 25 Mar 2024 14:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A1C43390;
 Mon, 25 Mar 2024 14:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711378597;
 bh=rUou32nCSQR7kqwsRazu2MYapdVbiQSFI+/LDE2aIMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5Fhd8d39kg6LPBwjP7IOiAfq8h1SSCjkzN6YFuMUht+X62MTyw6ajJVG7M4vBy+Y
 9EGtNYqa8985+ormJQoQnRgcXI80/tDQghVxkVr/NyRfu50Yeu9jPu2JKlA3/wNgqp
 Q3FE80MJpkIBpEdA4GWaQMLt92JOwmpdSODUZ+QZEYOIUVhyfNNjTbpl4rVVFaho1V
 oXnXiRJ50a2BUNoa634Wy3Au9H7k3GyIx6CJwVFaDVHFRlTnS3N7mD1Qgb7grKFcV3
 TPUvib5xOAwR1Otk7IlSLVRkONka2HCd3/1NNfWwoP+grKfj13sVpIStuYr6MNXo6a
 Bz06t8sqS//7g==
Date: Mon, 25 Mar 2024 15:56:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
Message-ID: <20240325-humongous-hyena-of-sufficiency-15e291@houat>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
 <87v85aield.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mvcsbylzkx3xemkl"
Content-Disposition: inline
In-Reply-To: <87v85aield.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mvcsbylzkx3xemkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 25, 2024 at 04:13:50PM +0200, Jani Nikula wrote:
> On Mon, 25 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > Jani recently pointed out that the Kconfig symbols are a bit difficult
> > to work with at the moment when they depend on each other, and that
> > using depends on would be a better idea, but no one really did the work
> > so far.
> >
> > So here it goes :)
> >
> > It's been tested by comparing the drm-misc-arm, drm-misc-arm64 and
> > drm-misc-x86 before and after this series and making sure they are
> > identical.
> >
> > Let me know what you think,
> > Maxime
>=20
> Thanks for doing this, I think this is the right direction!
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
> That said, 'make olddefconfig' is bound to drop some previously enabled
> configs for people, I think in part due to the renames. For example, all
> the CEC stuff and DP aux device got deselected for me. It's possibly
> going to lead to some grumbling.

Yeah, I got bitten by that when rebasing my HDMI series. Maybe we could
enable them all by default to prevent any issue when bisecting?

Maxime

--mvcsbylzkx3xemkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgGQnAAKCRAnX84Zoj2+
dkpUAYDjACtoNYVRCMtbaFXkfV6Hizgldkgz3puLPHVxL/Cg5vbJWajbOms63TUM
NGPydm8BfA1VfOlhRGmiqENhX4jOT88HJT7sZH40GN1mt3poUtng1iFT+Zn+DsKG
2DVUX4Y6eg==
=DM1a
-----END PGP SIGNATURE-----

--mvcsbylzkx3xemkl--
