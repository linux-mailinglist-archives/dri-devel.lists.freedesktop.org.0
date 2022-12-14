Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264664C55C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42910E234;
	Wed, 14 Dec 2022 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CF210E22F;
 Wed, 14 Dec 2022 08:57:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y25so9286603lfa.9;
 Wed, 14 Dec 2022 00:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cUc52zEjvVbrANnXNk+UIjZtd0EkaI5I+dB82xQuzlI=;
 b=WyQF25NemzhYEs671VkTq9vbL/MRmdps2CBOA2nHGXn5fWUsHBGvYU+4HlB28J2cS0
 9NiaaEIw59XRTuV6ctibYkmUboa3K9byUfVS6pcawmamx5O6upavVkM3xZUVIZQyQcFT
 vpbh+FsX5O2VYCWvzy/FTpA8NBS13JcSkmiKxoKwUfMySIIgugu9xm6Nc7nV1kRxc+YQ
 PHSl0W9Z4zaT8/DugBSEChQ8prwmwiS0X1YyJsSNx+rfRAm/5pPCSqWADwMtHe51n1p0
 dobazpjjfNK9THHOF5xB+fSpKEhxnl4x7IgotW1t1deRw5eHWF0Ke8X5V8cHZcSMDFHl
 su2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cUc52zEjvVbrANnXNk+UIjZtd0EkaI5I+dB82xQuzlI=;
 b=bfkY+sIiLrN5cUR0T+K9d6zi3Mys32qK1UPJyK8/9M0jnRAHfN0P1WLiysKGVpISnj
 ArWGALqV52+6dTbYEzgynSwE1nJG6ZhLJZ+arNLDTzF4lh12xTKXzHfuI+HQEyjfsVHQ
 Pusl97yUJQwGOQ4MOSIbP2D09nz+/NC65u1ZKboqZZd8kWFg/IM2LKLXQ9QadczxsHnT
 3hXrgt3mo0zi0jQVdna3kkcRdWzJRJKLtBL/Su6r+RYx08LZMEGoUpsu9sUExeYz14XV
 P22D4R4WENe0SZpiJOTACEZEab3gX5TTRQWmAcOPiQ6IcKgRCFg/dFGhyb7EXZKc+EFy
 1Tsg==
X-Gm-Message-State: ANoB5pke8aoPl2UwveccNoXrF1fdlE5CCs45oMC6jnjFEOknvBViUgTv
 +f5yiLRC8l5fdY0lIC+pBJ0=
X-Google-Smtp-Source: AA0mqf7ue7elkZfQ6+Hn9U2Vw9bPPA1Q6iZxlmMwih85G+EX9boba0sABTTJx5DkJPOZn4nXM/CWfQ==
X-Received: by 2002:a05:6512:6d1:b0:4b4:91db:a51d with SMTP id
 u17-20020a05651206d100b004b491dba51dmr7119020lff.28.1671008231040; 
 Wed, 14 Dec 2022 00:57:11 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x13-20020ac2488d000000b004b581ab4c77sm721618lfc.78.2022.12.14.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 00:57:10 -0800 (PST)
Date: Wed, 14 Dec 2022 10:57:07 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 04/16] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Message-ID: <20221214105707.3e0eb9d9@eldfell>
In-Reply-To: <8613220b-7199-1ce3-9310-2403db069cb2@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-5-harry.wentland@amd.com>
 <20221213123932.67edc8dc@eldfell>
 <8613220b-7199-1ce3-9310-2403db069cb2@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R16hhnpye72J2Fs/GQIv0X+";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/R16hhnpye72J2Fs/GQIv0X+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Dec 2022 11:41:08 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 12/13/22 05:39, Pekka Paalanen wrote:
> > On Mon, 12 Dec 2022 13:21:25 -0500
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> This allows us to use strongly typed arguments.
> >>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Vitaly.Prosyak@amd.com
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: amd-gfx@lists.freedesktop.org
> >> ---
> >>  include/drm/display/drm_dp.h |  2 +-
> >>  include/drm/drm_connector.h  | 47 ++++++++++++++++++------------------
> >>  2 files changed, 25 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp=
.h
> >> index 4d0abe4c7ea9..b98697459f9c 100644
> >> --- a/include/drm/display/drm_dp.h
> >> +++ b/include/drm/display/drm_dp.h
> >> @@ -1615,7 +1615,7 @@ enum dp_pixelformat {
> >>   *
> >>   * This enum is used to indicate DP VSC SDP Colorimetry formats.
> >>   * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 =
through
> >> - * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY defin=
ition.
> >> + * DB18] and a name of enum member follows &enum drm_colorimetry defi=
nition.
> >>   *
> >>   * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
> >>   *                          ITU-R BT.601 colorimetry format
> >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >> index 62c814241828..edef65388c29 100644
> >> --- a/include/drm/drm_connector.h
> >> +++ b/include/drm/drm_connector.h
> >> @@ -371,28 +371,29 @@ enum drm_privacy_screen_status {
> >>   * a colorspace property which will be created and exposed to
> >>   * userspace.
> >>   */
> >> -
> >> -/* For Default case, driver will set the colorspace */
> >> -#define DRM_MODE_COLORIMETRY_DEFAULT			0
> >> -/* CEA 861 Normal Colorimetry options */
> >> -#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
> >> -#define DRM_MODE_COLORIMETRY_BT709_YCC			2
> >> -/* CEA 861 Extended Colorimetry Options */
> >> -#define DRM_MODE_COLORIMETRY_XVYCC_601			3
> >> -#define DRM_MODE_COLORIMETRY_XVYCC_709			4
> >> -#define DRM_MODE_COLORIMETRY_SYCC_601			5
> >> -#define DRM_MODE_COLORIMETRY_OPYCC_601			6
> >> -#define DRM_MODE_COLORIMETRY_OPRGB			7
> >> -#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
> >> -#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
> >> -#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
> >> -/* Additional Colorimetry extension added as part of CTA 861.G */
> >> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
> >> -#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
> >> -/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry F=
ormat */
> >> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
> >> -#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
> >> -#define DRM_MODE_COLORIMETRY_BT601_YCC			15
> >> +enum drm_colorspace {
> >> +	/* For Default case, driver will set the colorspace */
> >> +	DRM_MODE_COLORIMETRY_DEFAULT,
> >> +	/* CEA 861 Normal Colorimetry options */
> >> +	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
> >> +	DRM_MODE_COLORIMETRY_BT709_YCC,
> >> +	/* CEA 861 Extended Colorimetry Options */
> >> +	DRM_MODE_COLORIMETRY_XVYCC_601,
> >> +	DRM_MODE_COLORIMETRY_XVYCC_709,
> >> +	DRM_MODE_COLORIMETRY_SYCC_601,
> >> +	DRM_MODE_COLORIMETRY_OPYCC_601,
> >> +	DRM_MODE_COLORIMETRY_OPRGB,
> >> +	DRM_MODE_COLORIMETRY_BT2020_CYCC,
> >> +	DRM_MODE_COLORIMETRY_BT2020_RGB,
> >> +	DRM_MODE_COLORIMETRY_BT2020_YCC,
> >> +	/* Additional Colorimetry extension added as part of CTA 861.G */
> >> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
> >> +	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
> >> +	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry =
Format */
> >> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
> >> +	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
> >> +	DRM_MODE_COLORIMETRY_BT601_YCC,
> >> +}; =20
> >=20
> > Hi,
> >=20
> > what's the entry for "the traditional sRGB"?
> >=20
> > It cannot be DRM_MODE_COLORIMETRY_DEFAULT, because the doc here says
> > that it maps to some driver-defined entry which may be something else.
> >  =20
>=20
> If I understand this list correctly the only entry that currently covers
> sRGB is DEFAULT.

Then either the list or the doc needs fixing:

- If DEFAULT is driver-chosen, we really do need an entry for "the
  traditional (s)RGB", which corresponds to the bits Y0, Y1, Y2, C0, C1
  being all zeros (CTA-861-H).

- If DEFAULT means that the bits Y0, Y1, Y2, C0, C1
  are all zeros, then it's not driver-chosen, and the doc needs to be
  more clear about this.

But since there are really the UAPI (right?), this should be said in
the UAPI docs for "Colorspace" property, and the internal doc here
could just point to that.

I think this could be just misdocumentation, because in CTA-861-H, the
state Y0=3D0, Y1=3D0, Y2=3D0 is labeled as "RGB (default)" in table Table 16
- AVI InfoFrame RGB or YC B C R Field, Data Byte 1. It's not "driver
will set something", it's "whatever the sink expects when nothing is
explicitly said otherwise" which I assume is practically "the
traditional RGB".

C0=3D0, C1=3D0 means "no colorimetry data".

This is something we need to be able to explicitly choose in userspace,
when that is what we want to have.


Thanks,
pq

--Sig_/R16hhnpye72J2Fs/GQIv0X+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOZj+MACgkQI1/ltBGq
qqcc0BAAlLhObuoPlr0L2/zcoTWt4zKWOsBcft2B/cHyWgx1gnROxVOgnXkw/JbY
/p441epXtXlnLOdZeASIrO2qHf/anx3ExjF+dPWtaqGeTwXDsBYkfIRpUZv6pYzX
r0vJCbNJ7sIlm+Gx0cLnFp6iIWM2Dpy16+C7+yVLRKGCnVubv8jWEew8Vpcbh6QN
rIy7sNwH4lKkbuDvtT9x+r7fgs5gnIjgxpP//ZxVLKXSSQLKvNeZK4RSfdj1rFGJ
AJrst11Lay3CtYuHI7sT901CuOROgd6u08CzQivZS9tYPVDdM++djexk7OTZDXIH
De2SOxifdxTqZ9m0lk4hgxa5lAIYcPhxuYhhspMo3Wo30M0IA3/2anNZ8/4QHI3X
bTFJwNFXcatyY6y14MVBX7sszDDtW4d4k2KMAv/lhD4CvWagZdOCaTLxu3fqfdVC
jdgSu+UlVMV5VFuRCx7DUPl7i5VCyZtTQmx/raYa4cGXBCOFmhhu0Pj98icCWX7C
7l4OutpYMlEa7ywr8SSUW3y2R8951tbNGMZF81qSF2Df8F32LLWndC2V79ezgMdk
pqtqrgmIh2itaqf4feujCO24gyFyAqLPdtyIVOWSNbVs1ifdThVjrb0NvoJZC9mO
3oz69TCKieHpmRHZRVJOLlp1tABxk2Nl9WTPt9zJdiu3iW9guOk=
=kZt5
-----END PGP SIGNATURE-----

--Sig_/R16hhnpye72J2Fs/GQIv0X+--
