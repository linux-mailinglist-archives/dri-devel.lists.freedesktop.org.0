Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503096B022C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B7D10E5BA;
	Wed,  8 Mar 2023 08:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F3510E5B2;
 Wed,  8 Mar 2023 08:59:49 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a32so15821078ljr.9;
 Wed, 08 Mar 2023 00:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678265988;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=sK8aILZorQRHY1+kB9RK81UOD/Jv43ORSJlUC3NmrKM=;
 b=dbm5Gvy01K7tA/ckdnegfD9uba5jzv6OFfVPd5PjrasNjZ6vvOfjFOlYObjKrN+tDk
 aNaP6+rPITARvJGKMW5Y4bZVxcYKNCtdYdOnEpIhWMcmlSIObiT8X/Osztlb20GUQdJe
 7WOz8JZ6w3mo/vTlWmAY/4wpABzYkDH3zaUMd6FZEm3bDMHqHmXwpKLGfL+t1d9haKtz
 +V9eWJOvh2lQh1CaKyLNqzjg78L9fSpGvCz22XEOChqd1zvD7oYlkncfDNnYoMQKYAJz
 PnF1QksQ0hgvDcBM/CeQ4ZpE5jAZgNZH64X+L0zIwwOHQhoicGJuwWLqGt+IvKyom3S0
 WagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265988;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sK8aILZorQRHY1+kB9RK81UOD/Jv43ORSJlUC3NmrKM=;
 b=lgCuviTwEdtmedN03ah95agjK/iTLYZ96lQmAD49yz/w6B+V+7mdIlD/UU3EBQi1Bi
 9RLutrgbPxYuu3Vk4MKDzpY7XmeWVFQJlVtP6cG3I1XFQEGzJ2eu3xDUo0HZsbD2R4pe
 Za+Qv0LldzbeKk8nASL4k0eRtgtHyZpNDxncTKqGVq1ZR8zRbGa/T0xp4AT21iyOUbMG
 15Nbq09xcNLtNeSITmWsoZofeYx14OMlC3BkI/Ppecdfbtljre0jRul3Kop/rDt0+8IG
 L0TVZuxMrst3hLFhSvgQBzKM88XWmii5bQAEV3VBtcEJrXVsg46sOqPctPkWb9QctR5K
 2Jsg==
X-Gm-Message-State: AO0yUKXZ29wByv/pU03iDOWxnDlSqw+W4CvgQ6/UuRtm1J1XIg47mb0U
 Hm9d+jXkkkraDIWIXUbCP24=
X-Google-Smtp-Source: AK7set9lqkKh4fyMFW8ApaUl7rNq+RTCPD+WCd+ferxz3QsAuH2CoNEhLc8hw9yanAfA3EeoPBYVIg==
X-Received: by 2002:a2e:90cc:0:b0:293:4b61:2657 with SMTP id
 o12-20020a2e90cc000000b002934b612657mr6585676ljg.33.1678265987951; 
 Wed, 08 Mar 2023 00:59:47 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y18-20020a2e9d52000000b00298593e3a01sm679801ljj.70.2023.03.08.00.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:59:47 -0800 (PST)
Date: Wed, 8 Mar 2023 10:59:44 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v3 02/17] drm/connector: Add enum documentation to
 drm_colorspace
Message-ID: <20230308105944.05fb9377@eldfell>
In-Reply-To: <20230307151107.49649-3-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-3-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QGxcggDuSCp6h/7zFmq3NYi";
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

--Sig_/QGxcggDuSCp6h/7zFmq3NYi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 10:10:52 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> From: Joshua Ashton <joshua@froggi.es>
>=20
> To match the other enums, and add more information about these values.
>=20
> v2:
>  - Specify where an enum entry comes from
>  - Clarify DEFAULT and NO_DATA behavior
>  - BT.2020 CYCC is "constant luminance"
>  - correct type for BT.601
>=20
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Hi,

this effort is really good, but of course I still find things to
nitpick about. If there is no answer to my questions, then I would
prefer the documentation to spell out the unknowns and ambiguities.

> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/drm_connector.h | 67 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 6d6a53a6b010..bb078666dc34 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -363,13 +363,76 @@ enum drm_privacy_screen_status {
>  	PRIVACY_SCREEN_ENABLED_LOCKED,
>  };
> =20
> -/*
> - * This is a consolidated colorimetry list supported by HDMI and
> +/**
> + * enum drm_colorspace - color space
> + *
> + * This enum is a consolidated colorimetry list supported by HDMI and
>   * DP protocol standard. The respective connectors will register
>   * a property with the subset of this list (supported by that
>   * respective protocol). Userspace will set the colorspace through
>   * a colorspace property which will be created and exposed to
>   * userspace.
> + *
> + * DP definitions come from the DP v2.0 spec
> + * HDMI definitions come from the CTA-861-H spec
> + *
> + * @DRM_MODE_COLORIMETRY_DEFAULT:
> + *   Driver specific behavior.
> + *   For DP:
> + *   	RGB encoded: sRGB (IEC 61966-2-1)
> + *   	YCbCr encoded: ITU-R BT.601 colorimetry format

Does this mean that HDMI behavior is driver-specific while DP behavior
is as defined?

Is it intentional that YCbCr encoding also uses different RGB-primaries
than RGB-encoded signal? (BT.601 vs. BT.709/sRGB)

Or do you need to be more explicit on which parts of each spec apply
(ColourPrimaries vs. TransferCharacteristics vs. MatrixCoefficients in
CICP parlance)?

E.g. BT.709/sRGB ColourPrimaries with BT.601 MatrixCoefficients.

> + * @DRM_MODE_COLORIMETRY_NO_DATA:
> + *   Driver specific behavior.
> + *   For HDMI:
> + * 	Sets "No Data" in infoframe

Does DEFAULT mean that something else than "No Data" may be set in the
HDMI infoframe?

If so, since these two have the same value, where is the difference? Is
DEFAULT purely an UAPI token, and NO_DATA used internally? Or NO_DATA
used only when crafting actual infoframe packets?

Should NO_DATA be documented to be a strictly driver-internal value,
and not documented with UAPI?

I am unclear if userspace is using these enum values directly, or do
they use the string names only.

> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
> + *   (HDMI)
> + *   SMPTE ST 170M colorimetry format

Does "colorimetry format" mean that the spec is used in full, for all
of ColourPrimaries, TransferCharacteristics and MatrixCoefficients?

If yes, good. If not, the wording misleads me.

> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
> + *   (HDMI, DP)
> + *   xvYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
> + *   (HDMI, DP)
> + *   xvYCC709 colorimetry format

Btw. xvYCC are funny because they require limited quantization range
encoding, but use the foot- and headroom to encode out-of-nominal-range
values in order to expand the color gamut with negative and greater
than unity values.

Just for curiosity, is it in any way possible today to make use of that
extended color gamut through KMS? Has it ever been possible?

I mean, the KMS color pipeline assumes full-range RGB, so I don't see
any way to make use of xvYCC.

> + * @DRM_MODE_COLORIMETRY_SYCC_601:
> + *   (HDMI, DP)
> + *   sYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPYCC_601:
> + *   (HDMI, DP)
> + *   opYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPRGB:
> + *   (HDMI, DP)
> + *   opRGB colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 R' G' B' colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> + *   (HDMI)
> + *   SMPTE ST 2113 P3D65 colorimetry format
> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> + *   (HDMI)
> + *   SMPTE ST 2113 P3DCI colorimetry format
> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
> + *   (DP)
> + *   RGB wide gamut fixed point colorimetry format
> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
> + *   (DP)
> + *   RGB wide gamut floating point
> + *   (scRGB (IEC 61966-2-2)) colorimetry format

Again, there is no way to actually make use of WIDE since the KMS color
pipeline is limited to the unit range color values, right? Or is it
possible by setting all color pipeline KMS properties to pass-through
and using a floating-point FB?

I suppose the FIXED vs. FLOAT has the exact same problems as BT2020_YCC
vs. BT2020_RGB, but I would be surprised if anyone cared.

> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
> + *   (DP)
> + *   ITU-R BT.601 colorimetry format
> + *   The DP spec does not say whether this is the 525 or the 625
> + *   line version.

Good to note that ambiguity here. :-)

Or maybe the DP spec writer was thinking about BT.709 ColourPrimaries
and BT.601 MatrixCoefficients...

>   */
>  enum drm_colorspace {
>  	/* For Default case, driver will set the colorspace */


Thanks,
pq

--Sig_/QGxcggDuSCp6h/7zFmq3NYi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQIToAACgkQI1/ltBGq
qqcAXw/4kpwIY8Ytsb7W9BjKTEGyczFDgW2MTO0FDWu2eeTuf54o5SmGTTj9DE0B
EIBFRJHGCIlWSLD4clWKv4eMHr7lIOwEVSQYSwaxfUZhLypFbBPfhnUenDqueMHk
3sOh4zH+COR0+bAS74aEj6s3eP2behPHlg2R+fqeKF0Mr3gw436CL17JqRoqaTAm
/Dd1f+2f6uRHqRYTvA1i3ZY1GK81QuyOQd+PKK9r6M6KqlRfzoj+969K5t0qthWw
9iLHfFF9yCtkfTR/mjyRcK5CGWBr+sOklccQpYzakJn8BguNaRX8E/y7IjZRKJ2Y
88cxkfIHVYAR1LBudT0rsXATnQbZ3vEb/8LTrP6loPtSMwJOiQMJtk8BuQUxya22
jZ48xCzAO7PkK9/0xWMJnzaehTw1N/+Gnh4Pz95JdzyqHEybzAfAXsTeDcyuuaoQ
5EMOT8VXN2EbXketZWydRjK0A6l5udibB3xvQj2xRiGfgW0Cc9dmbL5xCR7+96YH
P6vVi9A0oqntCs8WCBr+Ptd5MAS825uo+AcJ3/PrP7cEDD5+cHYzzXBWAvRKR+ZL
Ha0Os1oSZsttsHN1E1Ay+jUikSg6x/O1KNc2VH0n0cJ5J8gfjyJPbVxxeQ2j/kQf
BY++RTs4ON8ySlgZoSk07rnkSZeUGzg6hXgXA9AYhxauwJrLeA==
=7PhS
-----END PGP SIGNATURE-----

--Sig_/QGxcggDuSCp6h/7zFmq3NYi--
