Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14418BDCCC
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 09:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6A810E709;
	Tue,  7 May 2024 07:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BygZ6Mnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CD010E709
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 07:58:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D202761408;
 Tue,  7 May 2024 07:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5447AC4AF63;
 Tue,  7 May 2024 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715068711;
 bh=89t9B5VtRJzNfp6Wda6X2h6J58Yiwx7TQOCpbZd8Iu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BygZ6Mnl8LUBUOC0U0HyPNQ4qRDxoGM3qPH2R+ejDkRM3cBW88z5gVKCk0E/JcVE0
 d4PZQQmhV6iWOR0xAT5gUVEXZB553khNpiLpHtl8aRl30G39M0zySiT5koWYH7aX8Q
 E+ngcLyNg0lAVjttos/kNMyxcRrFRlfj6V/vTF1sk3VkmLBEIdp55uGvVBy+/G7eB5
 9sffzofGRbfxw/72ttntxOnV0GjldoUc8i/ItJ9lCs+EXAyOL/wnaeaA7RslA97NSz
 KL17gfTXiW60Yp5QqfU9nrj6Edvy16th/Fil0CDZ5u1WJ/3Wzr8qu/+sxw+q4h/e3e
 UT5h4HK/u9Peg==
Date: Tue, 7 May 2024 09:58:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
Message-ID: <20240507-shiny-sophisticated-mustang-bf2d2e@houat>
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <20240504122118.GB24548@pendragon.ideasonboard.com>
 <20240506-charcoal-griffin-of-tact-174dde@houat>
 <20240506073531.GA10260@pendragon.ideasonboard.com>
 <97811bfe-a1fb-419c-a148-74e3d84aa0e2@linux.dev>
 <20240506165057.GD29108@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b3imapilpypz3bfe"
Content-Disposition: inline
In-Reply-To: <20240506165057.GD29108@pendragon.ideasonboard.com>
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


--b3imapilpypz3bfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 07:50:57PM GMT, Laurent Pinchart wrote:
> On Mon, May 06, 2024 at 10:57:17AM -0400, Sean Anderson wrote:
> > On 5/6/24 03:35, Laurent Pinchart wrote:
> > > On Mon, May 06, 2024 at 09:29:36AM +0200, Maxime Ripard wrote:
> > >> Hi Laurent, Sean,
> > >>=20
> > >> On Sat, May 04, 2024 at 03:21:18PM GMT, Laurent Pinchart wrote:
> > >> > On Fri, May 03, 2024 at 05:54:32PM -0400, Sean Anderson wrote:
> > >> > > I have discovered a bug in the displayport driver on drm-misc-ne=
xt. To
> > >> > > trigger it, run
> > >> > >=20
> > >> > > echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/u=
nbind
> > >> > >=20
> > >> > > The system will become unresponsive and (after a bit) splat with=
 a hard
> > >> > > LOCKUP. One core will be unresponsive at the first zynqmp_dp_rea=
d in
> > >> > > zynqmp_dp_bridge_detect.
> > >> > >=20
> > >> > > I believe the issue is due the registers being unmapped and the =
block
> > >> > > put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_relea=
se.
> > >> >=20
> > >> > That is on purpose. Drivers are not allowed to access the device a=
t all
> > >> > after .remove() returns.
> > >>=20
> > >> It's not "on purpose" no. Drivers indeed are not allowed to access t=
he
> > >> device after remove, but the kernel shouldn't crash. This is exactly
> > >> why we have drm_dev_enter / drm_dev_exit.
> > >=20
> > > I didn't mean the crash was on purpose :-) It's the registers being
> > > unmapped that is, as nothing should touch those registers after
> > > .remove() returns.
> >=20
> > OK, so then we need to have some kind of flag in the driver or in the d=
rm
> > subsystem so we know not to access those registers.
>=20
> To avoid race conditions, the .remove() function should mark the device
> as removed, wait for all ongoing access from userspace to be complete,
> and then proceed to unmapping registers and doing other cleanups.
> Userspace may still have open file descriptors to the device at that
> point. Any new userspace access should be disallowed (by checking the
> removed flag), with the only userspace-initiated operations that still
> need to run being the release-related operations (unmapping memory,
> closing file descriptors, ...).

And for the record, this is exactly what drm_dev_unplug and
drm_dev_enter/drm_dev_exit does.

Maxime

--b3imapilpypz3bfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjnfHAAKCRAnX84Zoj2+
dt4DAX99RTnsezwYkS/RSibP1NcxpL4CCKZoY9wdmzD1LxPobMHewTlZzvejJrXZ
QgpabNMBgLzWSoWR5Wi5zbucVnQobQJp7d2zppixk1EbwNiUsNOS+Z9XcAL4Dkfe
DWQ6ip9F1w==
=oZkN
-----END PGP SIGNATURE-----

--b3imapilpypz3bfe--
