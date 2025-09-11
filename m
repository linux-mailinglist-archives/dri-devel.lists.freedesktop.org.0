Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9AFB53A1B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 19:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61610E11B;
	Thu, 11 Sep 2025 17:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YnUTeAMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3502410E11B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757610950;
 bh=2Eq4Hvyv/njviY7lOo+dE9G2lXGZB7YsBKBt5jkiD0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YnUTeAMAjwJ0WXa5mrzYDNZeNa/ovDB3oyP17+AfM4B4pGbvAmBkhCdZ0LY0DDFzn
 TwxOKXEVwzl66sSySAmICfwIkao6R9Whq8Y51lou9IzKuZDn4rws0MWmPqfHBWcD7b
 IPhRdyz6kBAz4rT54BhXzlUYqKyb5E6JloqYH/Mx2H5dB2wWH5PRNhklqdCRwVIAeQ
 v2KY+/yb825tKj3+HWfTGigz4BKD3kpxBOXZBGjsijJTddDt0o06g2Cml6dOXYANtD
 Lj3alBgT68ZxCzFoQLmlnB62x6jKsYRMsHQNKdT3iNWul1W22IaTCaoVI4m3ivykSN
 02MsO0f9W3fbw==
Received: from xpredator (unknown
 [IPv6:2a02:2f05:840b:7800:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 239FE17E04D6;
 Thu, 11 Sep 2025 19:15:50 +0200 (CEST)
Date: Thu, 11 Sep 2025 20:15:48 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <aMMDxIWN9TadgVyw@xpredator>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcHynAHALJt8tqVo"
Content-Disposition: inline
In-Reply-To: <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
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


--HcHynAHALJt8tqVo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 04:50:59PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 04:07:34PM +0300, Marius Vlad wrote:
> > From: Andri Yngvason <andri@yngvason.is>
> >=20
> > Adds a new general DRM property named "color format" which can be used =
by
> > userspace to force the display driver output a particular color format.
> >=20
> > Possible options are:
> >     - auto (setup by default, driver internally picks the color format)
> >     - rgb
> >     - ycbcr444
> >     - ycbcr422
> >     - ycbcr420
> >=20
> > Drivers should advertise from this list the formats which they support.
> > Together with this list and EDID data from the sink we should be able
> > to relay a list of usable color formats to users to pick from.
>=20
> It's unclear, who should be combining this data: should it be the kernel
> or the userspace.
Userspace. I've went a bit into why that is in the cover letter. That
was a pain point in the previous versions raised by other folks. Drivers
are free to advertise whatever color formats their HW supports. To
filter what panel/display supports userspace would look at the EDID and do =
an
intersection with the ones with the driver. This not uncommon, userspace
already looks today at the EDID for color management / HDR purposes. There's
just too much for the kernel to handle and rather than offloading that
to the kernel, people suggested previously to let userspace handle that.
>=20
> From my POV deferring this to the userspace doesn't make sense: there
> will be different quirks for monitors / panels, e.g. the EDID wrongly
> advertising YUV or not advertising a knowlingly-working capability.
Yeah, for sure. There have been some folks also raising that and discussing=
=20
that a bit further in previous thread on similar topic:
https://lore.kernel.org/dri-devel/TY4PR01MB14432B688209B2AA416A95228983EA@T=
Y4PR01MB14432.jpnprd01.prod.outlook.com/

Note that people have added quirks into libdisplay-info library to
overcome these limitations. It is far more easier to that into a library
than in the kernel.

I think to some extent 'Auto' can fill up this task. Drivers can perform
these checks on their own, including the ability to look at the EDID data.
Most likely some of them do that today and performs actions based on
that (all the Y420 checks for instance).

>=20
> I think that the property should reflect the kernel view on the possible
> formats, which should be updated during get_modes() (or every time EDID
> is being read).
The property advertises the supported color formats by display driver.
Userspace just filters these out based on what the sink supports. This
could just a policy in the compositor / UI.  There's nothing preventing
you to force push from those advertised formats.
>=20
> And that's not to mention that there are enough use-cases where the
> connector doesn't have EDID at all.
Totally. But what would be the expectation in that case? Drivers can
still advertise 'Auto' if they'd like.
>=20
> >=20
> > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Signed-off-by: Andri Yngvason <andri@yngvason.is>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c |   5 +
> >  drivers/gpu/drm/drm_atomic_uapi.c   |   4 +
> >  drivers/gpu/drm/drm_connector.c     | 177 ++++++++++++++++++++++++++++
> >  include/drm/drm_connector.h         |  54 ++++++++-
> >  4 files changed, 235 insertions(+), 5 deletions(-)
> >=20
>=20
> --=20
> With best wishes
> Dmitry

--HcHynAHALJt8tqVo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmjDA7gACgkQ9jQS5glH
1u/48BAAmjdbfJLK7XC5EcOd67zhKkdy1XMM80crPRnROKIoUu66fHU25MO6zuH5
mh0HpiYqz0DuOcffO0xlLMKai+r0OCcaOqi3/9qrRipPt1g5Y+AGuJYfOk7AoEXV
EmfrGpI5ck2zGM/kddgeDgHiUkPzdSiYAL1AwjFHdBiv3V0TdItkW0CJbTWvRWXU
Mg2wJAczqEMBF7lllhJsVmZ6XzeQsWoTbK1q63+Fb8b++K7PkJ34LnG0xnOST/q/
S3vzRajVg3gn8fYgn+jDlhV/KWQ72/pVVibp1pxuw5lmOg1OYofeVI6C1Xsz3hbU
UomGLSz5vfcT2rtHZBFo6BFteWoQ0V2lGMAv3FIpLlnA7zQXEKYUUF+VfajHdXh9
dFJvbmXO0Hor5s2JwzZQaHdFimgCQpOF+1TYvSBG4UC/F4E2cIU23nIxwWIvJIxR
eDlYw9s7PDoh9xJ4Ueu5RFeanjlbjSp+SiWfOcrztkxJp45rdWJs0BH8kZKQIban
UCodMwVGjR0ci66Gv/KQjzUC8ELybIe9GBy6631hLI6GBiUN/M2lMhb0fGRW4P22
c1KBR2G/MBnHbohWqoNFCJ8Py+sPk9cPgyTDmYundtAtGStyV4IQLDgPnQ8iPpX7
GqTXEECrt/M1BlF99sbS8PwnyIlF3UMOyUDCN01YsyEJVVYt9r4=
=0rBm
-----END PGP SIGNATURE-----

--HcHynAHALJt8tqVo--
