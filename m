Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41286B3A2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7AA10E9EA;
	Wed, 28 Feb 2024 15:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dUcPd79D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB2110E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:48:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0BE30CE1F96;
 Wed, 28 Feb 2024 15:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11C7C433F1;
 Wed, 28 Feb 2024 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709135312;
 bh=DnIOP4tId5Cp0AK7cRCdQlwnwdRFAtim2unSlV5uBKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dUcPd79D7nCybFNMnDMtuCkIDSO20VfwtL8EtKcjFP+Q2furOX18O/DKLnBCMLqEJ
 f91g/1CQ1ZtoE+leQ29xUAhfTrYWZTfBctgjxc281tzGM1YisyXYnH1eLSzRDzPJ9F
 UVeG+NvOVPOzEvMTmbM1+pipsrDJKAxkdR7GTlR+Zjdj5aJHkC8dSmzTmk3ypOZYzb
 Zkgplkuf/867biAPXEZ7BXodrYLr9skBumFF8PSCogF4LXT6oxZuvGOKUqFbfqxdIk
 MTNABb82rdSSXPvLgaUU+vViDfEonvKAxirqZqzDNBHkHA/PsiZhVy8Frq2Prszhi7
 lkuFlZntkMVmw==
Date: Wed, 28 Feb 2024 16:48:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mnakxp7lmft77bin"
Content-Disposition: inline
In-Reply-To: <20240226171143.27e60c30@eldfell>
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


--mnakxp7lmft77bin
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 26, 2024 at 05:11:43PM +0200, Pekka Paalanen wrote:
> On Mon, 26 Feb 2024 15:10:45 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi Pekka,
> >=20
> > On Wed, Feb 21, 2024 at 11:07:51AM +0200, Pekka Paalanen wrote:
> > > On Fri, 16 Feb 2024 18:48:55 +0000
> > > Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> > >  =20
> > > > From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > >=20
> > > > Add this as a value for enum_drm_connector_tv_mode, represented
> > > > by the string "Mono", to generate video with no colour encoding
> > > > or bursts. Define it to have no pedestal (since only NTSC-M calls
> > > > for a pedestal).
> > > >=20
> > > > Change default mode creation to acommodate the new tv_mode value
> > > > which comprises both 525-line and 625-line formats.
> > > >=20
> > > > Signed-off-by: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com> =20
> > >
> > > since no-one else commented yet, I'd like to remind of the new UAPI
> > > requirements:
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-us=
erspace-requirements
> > >=20
> > > AFAIU, adding a new value to an existing enum still counts as new UAP=
I.
> > >=20
> > > Maybe there is no need for the full treatment here, or maybe there is,
> > > I'm not sure. I think you should make some statement about how the new
> > > UAPI requirements have been addressed. =20
> >=20
> > That property was meant to provide legacy display handling, so I don't
> > expect any reasonably recent codebase like Weston to suppport it, ever
> > :)
> >=20
> > That being said, from the beginning, that property was meant to be
> > handled as a "mode-setting" property, and thus handled by either the
> > kernel command-line, xrandr, or any similar mechanism.
> >=20
> > I would expect that new enum variant to be handled under the same terms:
> > it'll probably only show up in distro scripts or configuration files,
> > and never in any actual code base.
> >=20
> > Is it what you were expecting, or did you mean something else?
>=20
> Maybe? Let's have it in the commit message and see if DRM maintainers
> agree.

Ack.

> You should expect that all KMS clients will work towards programming
> all exposed KMS properties into known values. That's the only way to
> achieve repeatable KMS behaviour, because there is no KMS reset ioctl.
>=20
> There are no two tiers of KMS properties AFAIK. You have to be the DRM
> master to change anything. So, people cannot force any settings from
> outside of a KMS client, they have to go through the KMS client, like
> xrandr goes through Xorg (and only Xorg).

Sure. My point wasn't that we should magically get an exemption ...

> I do fully expect Weston to gain support for this property, if anyone
> cares of its value. That goes for all Wayland compositors.

=2E.. but rather that, back when we discussed it, this definitely isn't
what the general feeling was.

And that's fine, I'm glad it's something that Weston would consider.

> You're correct in that a KMS client would probably not know to control
> the value of this property automatically but it needs to come from
> configuration. That would be each KMS client's configuration. I don't
> understand how a script could achieve that.

I meant a script calling xrandr at boot for example.

> However, if you feel it is important to have KMS properties that
> display servers must not touch, then they should be documented as such.
> I do not know if that would actually lift the new-UAPI requirements,
> that is for the DRM maintainers to decide and document. Is there such a
> thing already?

It's not what I meant really. Again, back when we were discussing
merging that property no KMS client we could discuss with really wanted
to have anything to do with analog. So it's not that we were expecting
to have a property that wasn't meant to be modified by a compositor, but
rather that none wanted to.

I fully expect that property to work and be something that compositors
can modify if they want to.

Maxime

--mnakxp7lmft77bin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9VzAAKCRDj7w1vZxhR
xZ9KAQCMHx2/7vPU1LRw9YskIx7tBjE6s679Of5Ih2YW6GiWGgEAwiSNdkKr7TKD
Zu/vRQ/dBA9BcoMAk1qcTcS7JwfWtAA=
=WKqP
-----END PGP SIGNATURE-----

--mnakxp7lmft77bin--
