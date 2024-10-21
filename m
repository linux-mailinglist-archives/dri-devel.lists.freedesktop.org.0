Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6BC9A6A57
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B3310E4FC;
	Mon, 21 Oct 2024 13:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WpzpoDBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4510E4FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:30:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 924F75C54BE;
 Mon, 21 Oct 2024 13:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6495EC4CEE5;
 Mon, 21 Oct 2024 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729517441;
 bh=RBRYg2Lyf+LiEknArGxUljEJplGrUfUMHLLkLVtBLr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpzpoDBdapgeTnMsbH+j7gWPiaE30q+ERPjBQQjtftrHfpk0LHTeJKWZbdrpucyMy
 MMlDBQ1n3N5iCflRX9Wz1G4eXs9vMOB/Pe9PG94hli7xsWOXO2eZao1Wo1jFR5LK9W
 Va+fDBrJA6MT+dJ73Uyg2G3gRzvp8OFdMiZnAXUBfsX9PRMSvLEbYTRI+JARYGZym9
 phXjrQ+joDYdKNOh9SVuAyLctLJHUlbl/w/jvphPilIQkK8Pi19LwlNL08KCCUujQm
 m8omlNeiaJxL/VTD7hh5M37DB60QqdFN74GGdbHEDK5YNoD6JKCIlTPtohWCwjwSPg
 DKGId6m/DPwHg==
Date: Mon, 21 Oct 2024 15:30:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/atomic_helper: Add missing NULL check for
 drm_plane_helper_funcs.atomic_update
Message-ID: <20241021-airborne-proud-lynx-e1186d@houat>
References: <20240927204616.697467-1-lyude@redhat.com>
 <htfplghwrowt4oihykcj53orgaeudo7a664ysyybint2oib3u5@lcyhfss3nyja>
 <bcf7e1e9-b876-4efc-83ef-b48403315d31@suse.de>
 <2f012eeab0c1cb37422d9790843ffbbc5eda0131.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="g4sw4e3uc2zpwhye"
Content-Disposition: inline
In-Reply-To: <2f012eeab0c1cb37422d9790843ffbbc5eda0131.camel@redhat.com>
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


--g4sw4e3uc2zpwhye
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/atomic_helper: Add missing NULL check for
 drm_plane_helper_funcs.atomic_update
MIME-Version: 1.0

Hi,

On Mon, Sep 30, 2024 at 03:45:13PM -0400, Lyude Paul wrote:
> On Mon, 2024-09-30 at 09:06 +0200, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 30.09.24 um 09:01 schrieb Maxime Ripard:
> > > Hi,
> > >=20
> > > On Fri, Sep 27, 2024 at 04:46:16PM GMT, Lyude Paul wrote:
> > > > Something I discovered while writing rvkms since some versions of t=
he
> > > > driver didn't have a filled out atomic_update function - we mention=
 that
> > > > this callback is "optional", but we don't actually check whether it=
's NULL
> > > > or not before calling it. As a result, we'll segfault if it's not f=
illed
> > > > in.
> > > >=20
> > > >    rvkms rvkms.0: [drm:drm_atomic_helper_commit_modeset_disables] m=
odeset on [ENCODER:36:Virtual-36]
> > > >    BUG: kernel NULL pointer dereference, address: 0000000000000000
> > > >    PGD 0 P4D 0
> > > >    Oops: Oops: 0010 [#1] PREEMPT SMP NOPTI
> > > >    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20=
240813-1.fc40 08/13/2024
> > > >    RIP: 0010:0x0
> > > >=20
> > > > So, let's fix that.
> > > >=20
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Fixes: c2fcd274bce5 ("drm: Add atomic/plane helpers")
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: <stable@vger.kernel.org> # v3.19+
> > > So we had kind of a similar argument with drm_connector_init early th=
is
> > > year, but I do agree we shouldn't fault if we're missing a callback.
> > >=20
> > > I do wonder how we can implement a plane without atomic_update though?
> > > Do we have drivers in such a case?
> >=20
> > That would likely be an output with an entirely static display. Hard to=
=20
> > imaging, I think.
> >=20
> > >=20
> > > If not, a better solution would be to make it mandatory and check it
> > > when registering.
> >=20
> > Although I r-b'ed the patch already, I'd also prefer this solution.
>=20
> Gotcha, FWIW the reason I went with this patch:
>  * atomic_update is actually documented as being optional in the kernel d=
ocs,
>    so we'd want to remove that if we make it mandatory

Sure, that makes total sense :)

>  * rvkms currently doesn't have an atomic_update. We will likely have one
>    whenever I get a chance to actually add CRC and/or writeback connector
>    supports - but for the time being all we do is register a KMS device w=
ith
>    vblank support.

WIP drivers can provide an empty implementation. And even if actually
didn't need it for $REASONS, I'd argue that an empty implementation (and
a comment) makes that explicit instead of making the reader guess why
it's not needed.

Maxime

--g4sw4e3uc2zpwhye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxZXfgAKCRAnX84Zoj2+
dlfJAYDkkhOPulr0ja4Fr7y5aisIL3dAV+71shbFI1TdZ3tI/4i3FmUP7C236+Fs
wIjnYScBgNTC1j7usayK7OzzXCXw25d8OrMV3K0RS+AJpIiAeWYUfsAlmXz9GXCN
4nwHkHAzhg==
=fT2I
-----END PGP SIGNATURE-----

--g4sw4e3uc2zpwhye--
