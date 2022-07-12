Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74145571D5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 16:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386BE14ABAB;
	Tue, 12 Jul 2022 14:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C2812A81C;
 Tue, 12 Jul 2022 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/NPqGy/kbDC5IEbL/FUb1XA0XVTu08NYRtepTQJduZo=; b=KlttEkRQkHKHhvn9Iy8v0dhlJk
 8ET+QbItDRN1A+9JQPf85e0bZcydkqirMFbA/jthkCYizHPgbTW1nIFooCfR6EpP+fepHzn3oEqbj
 /2f+itGTZ5J+I90uSpd/Ue+h8xHZv3bAbaCKaj2aw3ZRwZYULEm+tZhR3S04qMu7koZEO+dqpkx8B
 ZJk1HJA3BoqJ6qkdOkxprcW4zD/4yDlJzhwIvpV5E2ORkCjcR5X+t+LXuDYTjsVg/5y4Bk//ElMLD
 8TiyQDsgtHxt5PJTT7PJ4IaI0lopauUC40w7QkJnKvd65HVN4cDwy5J1O+PPBUT9ZbzF7YBp4t2Uo
 jHFDX7qA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oBHGn-00Dfai-3m; Tue, 12 Jul 2022 16:53:49 +0200
Date: Tue, 12 Jul 2022 13:53:22 -0100
From: Melissa Wen <mwen@igalia.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Message-ID: <20220712145322.cecigsjbpuqh3tem@mail.igalia.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com>
 <Yrmf+mWk13qkcsfs@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aa3jy3xvjorzzw3a"
Content-Disposition: inline
In-Reply-To: <Yrmf+mWk13qkcsfs@intel.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, nikola.cornij@amd.com,
 bhawanpreet.lakha@amd.com, sunpeng.li@amd.com, alex.hung@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 seanpaul@chromium.org, nicholas.kazlauskas@amd.com, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aa3jy3xvjorzzw3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/27, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Sun, Jun 19, 2022 at 09:31:03PM -0100, Melissa Wen wrote:
> > Add 3D LUT for gammar correction using a 3D lookup table.  The position
> > in the color correction pipeline where 3D LUT is applied depends on hw
> > design, being after CTM or gamma. If just after CTM, a shaper lut must
> > be set to shape the content for a non-linear space. That details should
> > be handled by the driver according to its color capabilities.
>=20
> I also cooked up a WIP 3D LUT support some time ago for Intel hw:
> https://github.com/vsyrjala/linux/commits/3dlut
> But that dried up due to having no userspace for it.
>=20
> I also cooked up some basic igts for it:
> https://patchwork.freedesktop.org/series/90165/

Yes, I found your work on it, so I based part of my proposal on your
previous proposal and also the cubic-LUT by Laurent for rcar-du [1].
They helped me to find a path to expose 3D LUT caps, thanks.

>=20
> <snip>
> > + * =E2=80=9CLUT3D=E2=80=9D:
> > + *	Blob property to set the 3D LUT mapping pixel data after the color
> > + *	transformation matrix and before gamma 1D lut correction.
>=20
> On Intel hw the 3DLUT is after the gamma LUT in the pipeline, which is
> where I placed it in my branch.
>=20
> There is now some discussion happening about exposing some
> kind of color pipeline description/configuration properties:
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

So, initially I thought we would just map the properties according to hw
pipeline, but in fact it isn't a good path to follow and would make a
big mess, so Sebastian's proposal for a pipeline description makes a lot
of sense to me. I'll join the discussion.

Anyway, thanks for all inputs,

Melissa

[1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinchart+ren=
esas@ideasonboard.com/
>=20
> --=20
> Ville Syrj=C3=A4l=C3=A4
> Intel

--aa3jy3xvjorzzw3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLNitsACgkQwqF3j0dL
ehw3zw/9EC40737UmbquiGb+tP+eHu1jV+wfVOcLwtAkx9bxNINu74MW9x86nZw6
VMqIa1FHyVTAZ0/a/nmcMNBIHGzeE13zVnYdnE91kMv0QGPNHWK+cuZGA0+xUIFB
3yY8PXKJqZS/R2ApsDqT2qQclYpPpHoB4ziBYKY/w3y+yisNVhU1TtPNzBFkpSwG
I6Zqz6TkMWqjjth2oW63SzhFmOiiHi5d+5n+HikHXYpfGxRVbQOipW1ZPOEigs68
UiuMtKQairaACZUVF5mWeUD6lDxmdpOl7qLh0HjDFsTNU5sIV8g2U6ZvBubrw/QM
DtBTkb49LlyPTFCz8NZsw+qbc+OHHGD/o3gthM/NmR0BN7dWjbbTQBFC0UOdoYlc
u9SaNuWDGqZOEEyFlmlwOoefbYAk7rFlBGLXp/ER+IIEcnx6JOKap/GclgGmJrY1
acP+MYE/moTBMEgpg8xifGOOodi+NGRTuRXhiGLEU1ncwyJfgFQ2vERbEwm8SoSp
pyA8zjjJ40vtXV+Xg0AAyzOVH/2ciMxdxUy+3F5HtEi2V1dmZG07aj51uGFCHexX
+lFEyPGLud0h6YPevJXEXmcZeA8fBaLd1u1xDs7Uyusd5nGcMZoTyTAWQ8jRT6YH
kuApDh6xfRlt7BaRDw3iA0zMaNx8/hz8XPUoCCb30ub0P8rIODo=
=oSGs
-----END PGP SIGNATURE-----

--aa3jy3xvjorzzw3a--
