Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E460D3B1554
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912056E833;
	Wed, 23 Jun 2021 08:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F8D6E832;
 Wed, 23 Jun 2021 08:02:02 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k10so2499638lfv.13;
 Wed, 23 Jun 2021 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ALp5/N27RPVlOOdmQTHFA/PlRSYSgcTj/HOCoALwZHU=;
 b=jTbDpOhkkcRBj+Tr+txKS3w8AL191MGPqQKTJnQWRFyghzbRxc50ybjVs9+xSyTvBP
 NPKTd7wql5N78Irn8b3ZVHQHFY0FjPEmEsiOLtkdnErfTMzbrdg/Oxhn6tfTI03wP8pD
 4OxyMTgkHuIi/5O5pBE/DFuXlbiJyQoo8NpmtaGXEZgp8yvXA14xeAiJS2uNsTsyMJNs
 U2fwbQiqPFzTc1K164Xm2DcFlE3uTI1PF6xJc8NR7rrQabMu0T9kSMPPTLF+S1JmnW8O
 xZ143ju579UWLalmW98hQWyCtdk8LrFHsLTMBaxd6b3Bd+8teorXbhCb1Eg0/zqsok6Y
 IQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ALp5/N27RPVlOOdmQTHFA/PlRSYSgcTj/HOCoALwZHU=;
 b=fJLTr0fsPstM1D/O91vhJh2T5nCchpMoEVvPcfGXScdjq32s7jf1nLgQaeP4EwnQWP
 7pPsu/dNqPrYF8F0hptXbiSRYxv7amRyweoZ8UIOQZCnqqLXY7xycVgyZKPLz3utKsIm
 5dLymDHqzuLPUuFtm8oSXB0sPHx2x5uw6Dp55i620ducstKozk27f/jNxYVTm8WYRDMU
 esk23IzpASan+yCGaSmqK9r3ck3UxPK5ZREoll61xZf6pMVNmRKsCE0zZFAcVDb8JpgY
 c51w8dna01vL2hKKLnJugTQ4USdOlonqZ+3Qz7ABZOCx1iRSjILqhAFILygNrJofZgtG
 CZFw==
X-Gm-Message-State: AOAM533od+y9nxHciyeqT3x0BzO16Xw3uIDdeL4s4ye/UwTKft1TsMlR
 zySOQG3XKCpHTXqPgJjuoYI=
X-Google-Smtp-Source: ABdhPJxA76V011BKXooz42uid5MGbx2UUylgUe4QH9zqXyMr8+sUmU3nxOG3kR1o/s1ae8kxoCdS2Q==
X-Received: by 2002:a05:6512:4c3:: with SMTP id
 w3mr6328062lfq.594.1624435320753; 
 Wed, 23 Jun 2021 01:02:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id z15sm2459818lfs.207.2021.06.23.01.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 01:02:00 -0700 (PDT)
Date: Wed, 23 Jun 2021 11:01:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 17/17] drm/amd/display: Add handling for new
 "Broadcast RGB" property
Message-ID: <20210623110156.4791505e@eldfell>
In-Reply-To: <ded3d448-4837-f38d-9878-f5d764712db7@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-18-wse@tuxedocomputers.com>
 <20210622102955.1e0488b1@eldfell>
 <ded3d448-4837-f38d-9878-f5d764712db7@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9t65WvBL3CHONVstlbG_ova";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9t65WvBL3CHONVstlbG_ova
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 11:28:57 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 22.06.21 um 09:29 schrieb Pekka Paalanen:
> > On Fri, 18 Jun 2021 11:11:16 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> This commit implements the "Broadcast RGB" drm property for the AMD GPU
> >> driver.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> ---
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 ++++++++++++++-----
> >>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 ++++
> >>  2 files changed, 21 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 9ffd2f9d3d75..c5dbf948a47a 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -5252,7 +5252,8 @@ get_aspect_ratio(const struct drm_display_mode *=
mode_in)
> >>  }
> >> =20
> >>  static enum dc_color_space
> >> -get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing)
> >> +get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
> >> +		       enum drm_mode_color_range preferred_color_range)
> >>  {
> >>  	enum dc_color_space color_space =3D COLOR_SPACE_SRGB;
> >> =20
> >> @@ -5267,13 +5268,17 @@ get_output_color_space(const struct dc_crtc_ti=
ming *dc_crtc_timing)
> >>  		 * respectively
> >>  		 */
> >>  		if (dc_crtc_timing->pix_clk_100hz > 270300) {
> >> -			if (dc_crtc_timing->flags.Y_ONLY)
> >> +			if (dc_crtc_timing->flags.Y_ONLY
> >> +					|| preferred_color_range =3D=3D
> >> +						DRM_MODE_COLOR_RANGE_LIMITED_16_235)
> >>  				color_space =3D
> >>  					COLOR_SPACE_YCBCR709_LIMITED;
> >>  			else
> >>  				color_space =3D COLOR_SPACE_YCBCR709; =20
> > Hi,
> >
> > does this mean that amdgpu would be using a property named "Broadcast
> > RGB" to control the range of YCbCr too? =20
>=20
> Yes, because I avoided creating a new property, but I'm not really happy =
with it either.
>=20
> Possibility 1: Use "Broadcast RGB" for Y'CbCr too and clarify in document=
ation
> =C2=A0=C2=A0=C2=A0 - still confusing name
> =C2=A0=C2=A0=C2=A0 - limited does not mean something a little bit differe=
nt for Y'CbCr and not strictly 16-235:
> https://www.kernel.org/doc/html/v5.12/userspace-api/media/v4l/colorspaces=
-defs.html#c.V4L.v4l2_quantization , but name
> of option is given by preexisting property
>=20
> Possibility 2: Deprecate "Broadcast RGB" and a a more neutral sounding "p=
referred color range", with the more neutral
> sounding "limited" option instead of "Limited 16:235"
> =C2=A0=C2=A0=C2=A0 - What's the relation between the 2? pq mentioned on t=
he amdgpu
> gitlab that there is a posibility for userspace to have only the new
> or the old one shown

It's just an idea that we could decide to expose only one or the other
property. It would need to be engineered in code, go through the UAPI
validation with userspace etc. I'm not aware of this being done before
exactly like this, but DRM client caps exist.

> =C2=A0=C2=A0=C2=A0 - Alternatively ignore "Broadcast RGB" when "preferred=
 color range" is set and have them coexist?

Determining "is set" means we would need "unset" value for "preferred
color range". But there is no notion of who set it. If some KMS client
decides to set it, then it will likely remain set, even if you next
start another KMS client who does not use this property - it would just
confuse users when "Broadcast RGB" silently stopped working while it
still exists.

So I don't think this is a good solution.

When considering a new property, what I wrote just earlier fit here:
https://lists.freedesktop.org/archives/dri-devel/2021-June/312248.html

There are more questions that just what does the limited range actually
mean.

> > That is surprising. If this is truly wanted, then the documentation of
> > "Broadcast RGB" must say that it applies to YCbCr too.
> >
> > Does amdgpu do the same as intel wrt. to the question about whose
> > responsibility it is to make the pixels at the connector to match the
> > set range? =20
>=20
> I guess the kernel driver does the conversion, but i have to check
> for both.
>=20
> For Intel I did not change the behavior of Boradcast RGB, but i think
> it's not clearly specified in the docs where the conversion happens.

Right, at the very least the current behaviour needs to be documented
before enrolling this property to any more drivers, so that those
drivers can then be reviewed to work the same way.

You notice I didn't actually answer your question 1 or 2. I don't know.
Going with 1 is easy compared to 2, even if the names are awkward but
it technically shouldn't cause any problems. 2 may or may not be
better, and until we have answers to which design is better, it's maybe
best to leave option 2 alone?


Thanks,
pq

--Sig_/9t65WvBL3CHONVstlbG_ova
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS6nQACgkQI1/ltBGq
qqchjQ//UhWP/scpD6nbt+KCsdHLrYGMFqmi8iFTG/Zhl+XDBib1UkOYt0zH5IVo
i9Ag05LEaNmGK51xuDZ65wAyjyEY66T3tvcZyM6Wb+y+Au7DWTTEA5v3I4VmTD87
tSHHvAFEKtgUdukSpoemhEUuxlCad/sOqLbA0D/ykX2osM7eLiy3ViSZdjxT0Nyt
0KIhgfVQ4t5Df/uzjRHOISj6kzgUx/pZrBwwY/9c7vZ5hIzkJahEmYhOxXggMX4w
beZPHa12peZ+zom8Y94aW51WK85qoFYJ8F9Lq+Yb0NcMiKpK5qk+u4n1We1obbuG
KePy6Ctwbz2QzDsi2PBIpHHYIdEh3mZpQa8RU4bWIHYFaI6aAg/CMR46jnUMzjrw
DklDzxcd/l5/HnokBVRbHjTrks0J379KY6o85ZWyg4cUJOhcbmPEC24H7NDUpZzd
pq6LctfNTEMMeOB8DY975tNr3UYaR7hfP00iXGUC+15s0buqBhKFMcfyZ4O6dGyo
/xjX35DrGoB31aOQdLevPh6Nd+682PmwwrtAGAC/h9T+NQ2X2B7WrirBDhkhxlC7
PW7sHpyFpLBInTjOuiavpV8bd6M/cd0nONzxJQTrtw5TP7c8kuGGdC4vYplW5gtT
aPUsotdeQxloZvgk8oewjvHuIB/acDz+5GDM/4YhIpjCAH2ee80=
=9bA4
-----END PGP SIGNATURE-----

--Sig_/9t65WvBL3CHONVstlbG_ova--
