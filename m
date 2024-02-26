Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAB86776A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F3F10E6FA;
	Mon, 26 Feb 2024 13:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mzBPP1vJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005E10E619;
 Mon, 26 Feb 2024 13:59:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E923060280;
 Mon, 26 Feb 2024 13:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4431FC433C7;
 Mon, 26 Feb 2024 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708955994;
 bh=vCbtBzCqgaJiRouXjbrIN4121QvHhByTK6VZh4GYaC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mzBPP1vJrJwoFxLzvLdDOof3HSqK9VgIoMEJueY/ahvLoonsvl45xtw685qI5h4PM
 V7JdGuPpGlUGpv0kWML8EofqWg/BG6y50O+Xh1hPDZfpVJyLo61LHW6SrmLRxVDP5y
 FZugLSPlrpgHVtmyrniwU0j5jjjfvDo5tZf8pudJQ0tEU9+WqDZUEJ5Ys5nuQszny2
 wN97dJK0+gC8P1dh1s0i6EH4RGDuXBG4QuqxR6xPJaCHjwUdlZFv7JhoYsWThCmJeA
 4p9yvxEGKgrFVjNTISvR/DDt3weB6KH6F3fSIITE1E5GXUvVbh7CsKKblr/s94Ooh8
 JgOhoqVocFcVA==
Date: Mon, 26 Feb 2024 14:59:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>, 
 Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
 Saranya Gopal <saranya.gopal@intel.com>, 
 Rajaram Regupathy <rajaram.regupathy@intel.com>, Gil Fine <gil.fine@intel.com>,
 Naama Shachar <naamax.shachar@intel.com>, Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v2 00/21] drm/i915: Add Display Port tunnel BW allocation
 support
Message-ID: <vlzxwj7flftpkydkph2bg3xikuxbm4e2lhu36n2wwe4expj5vu@r6fjs5wa3mdu>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <87il2bmius.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pols76ssq4sj37jf"
Content-Disposition: inline
In-Reply-To: <87il2bmius.fsf@intel.com>
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


--pols76ssq4sj37jf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 03:54:19PM +0200, Jani Nikula wrote:
> On Tue, 20 Feb 2024, Imre Deak <imre.deak@intel.com> wrote:
> > This is v2 of [1], with the following changes:
> >
> > - Several functional/typo/formatting fixes, detailed in the patches.
> > - Move the BW allocation from encoder hooks to
> >   intel_atomic_commit_tail() fixing the allocation for MST streams
> >   enabled/disabled w/o a full modeset (i.e. w/o re-enabling the master
> >   stream).
> > - Fix an MST mode restore issue during system resume, which also lead
> >   to a tunnel BW allocation failure. (Patch 3)
> > - Ensure a DPCD DPRX cap read as required by the TBT CM any time a long
> >   HPD pulse is detected. (Patch 20)
> > - Explicitly disable the BW allocation mode during system suspend.
> >
> > The patchset is also available at:
> > https://github.com/ideak/linux/commits/dp_tun_bw_alloc
> >
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Jouni H=F6gander <jouni.hogander@intel.com>
> > Cc: Saranya Gopal <saranya.gopal@intel.com>
> > Cc: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > Cc: Gil Fine <gil.fine@intel.com>
> > Cc: Naama Shachar <naamax.shachar@intel.com>
> > Cc: Pengfei Xu <pengfei.xu@intel.com>
> >
> > [1] https://lore.kernel.org/all/20240123102850.390126-1-imre.deak@intel=
=2Ecom
> >
> > Imre Deak (21):
> >   drm/dp: Add drm_dp_max_dprx_data_rate()
> >   drm/dp: Add support for DP tunneling
>=20
> Maarten, Maxime, Thomas -
>=20
> Ack for merging these two patches via drm-intel-next?

Yep, go ahead

Maxime

--pols76ssq4sj37jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdyZVwAKCRDj7w1vZxhR
xRBwAP9qKehz7wdrtbscpkwUejou3PRmDl1hk46xhIU1GiFDJgEAs5H089AWRK0e
47AH0o3KCMdeCZxAQQKPqbjP1oT5XQ0=
=cMLO
-----END PGP SIGNATURE-----

--pols76ssq4sj37jf--
