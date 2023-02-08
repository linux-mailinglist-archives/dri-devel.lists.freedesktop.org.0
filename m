Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12BD68EA3B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 09:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1CE10E6FF;
	Wed,  8 Feb 2023 08:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE4E10E07A;
 Wed,  8 Feb 2023 08:56:27 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id dr8so49383885ejc.12;
 Wed, 08 Feb 2023 00:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3S5QBxLDinDcOg+9K/QSPTkn2HaKsZvFE2yzJm3HC7A=;
 b=gLhA1dRLW3xG7rS+PG8hPgEo6+h7fRFnkwhQCgZhy3qIKkNP/EFX6T/UhBmglcuTrt
 5pktLJCPFHpdh0dPfbmTwaihvh/02LmNcT2O30IrrVW2ExBWgUYb2oqfyQBPR84zboxq
 qgi1byTecBCKc1Iq8Qq8Y3p0MKZR4w+ZPyfS3uCY465ZSBi46oLUc1PjK21XNPWosZiZ
 Po0p1PiBpfM5JRIIVcfHWVB6J9G44LnEtwBNHJq7BRCvL3OsZ02kXlXittfK6WOkMPYE
 RT51dPVAMOgOtlj7QgQoFx8Gvt6RbQWfE3wfaj0lS4QGYRmgsbIcfXZtq7xX7R4PjmES
 ysQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3S5QBxLDinDcOg+9K/QSPTkn2HaKsZvFE2yzJm3HC7A=;
 b=df12SinQjXh0Aw6kK+CrCvG3+wH/ktVudoGSfR6TYMbxVPIBpMbck4YRgdrI6l0yJ9
 f2lvv805bmuHUXPPYn6DdFZAVFKARQK2JaYFu2XnKbr1YNMksAN49cTRkX6jyPaje26u
 X35uEDxKoN47S4g0zw5bVzIJzvD3a+nHyEbo2GmnOtO32RFdTl3CrvIZ7nPyfudfkOP+
 u6Z5TRlfXhEnZol7Pc830x9ceT0UXkCrPOZyH1FlUY8tXlSiPi9ciWljQoMFr0OW52nw
 Yd5RUOyppkUwLkybQYhaY6AxBkllgP+O7Ioqzr6eJl4DH+UHXOsR5EB52wR6hN9kMrEK
 Pyug==
X-Gm-Message-State: AO0yUKX0cT28uwRYtao+Bw2rL0CcfksL4kNZOYyC8eSIBNJhZZymYBre
 jlNZSOW1TXUxjiez4KTCQYk=
X-Google-Smtp-Source: AK7set8bD3EQRHTkbJcIbyU7G0wyKtt/aIJDIErtEtdBHYv+9An+zuy8dapXBQ+F93k4AP6AGmVmgA==
X-Received: by 2002:a17:906:824c:b0:859:1d78:765 with SMTP id
 f12-20020a170906824c00b008591d780765mr6600849ejx.11.1675846585626; 
 Wed, 08 Feb 2023 00:56:25 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s13-20020a170906c30d00b0088842b00241sm7989649ejz.114.2023.02.08.00.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 00:56:25 -0800 (PST)
Date: Wed, 8 Feb 2023 10:56:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [PATCH 2/3] drm/connector: Add enum documentation to
 drm_colorspace
Message-ID: <20230208105621.392fb2cc@eldfell>
In-Reply-To: <20230203020744.30745-2-joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-2-joshua@froggi.es>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oh1pUcgo2pR+IICUorw1QcK";
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
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Oh1pUcgo2pR+IICUorw1QcK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  3 Feb 2023 02:07:43 +0000
Joshua Ashton <joshua@froggi.es> wrote:

> To match the other enums, and add more information about these values.
>=20
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/drm_connector.h | 41 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)

Hi Joshua,

sorry for pushing you into a rabbit hole a bit. :-)

>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index edef65388c29..eb4cc9076e16 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -363,13 +363,50 @@ enum drm_privacy_screen_status {
>  	PRIVACY_SCREEN_ENABLED_LOCKED,
>  };
> =20
> -/*
> - * This is a consolidated colorimetry list supported by HDMI and
> +/**
> + * enum drm_colorspace - color space

Documenting this enum is really nice. What would be even better if
there was similar documentation in the UAPI doc of "Colorspace" under
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-=
properties
listing the strings that userspace must use/expect and what they refer
to.


> + *
> + * This enum is a consolidated colorimetry list supported by HDMI and
>   * DP protocol standard. The respective connectors will register
>   * a property with the subset of this list (supported by that
>   * respective protocol). Userspace will set the colorspace through
>   * a colorspace property which will be created and exposed to

Could this refer to "Colorspace" property explicitly instead of some
unmentioned property?

>   * userspace.
> + *
> + * @DRM_MODE_COLORIMETRY_DEFAULT:
> + *   sRGB (IEC 61966-2-1) or
> + *   ITU-R BT.601 colorimetry format

Is this what the "driver will set the colorspace" comment actually
means? If so, I think the comment "driver will set the colorspace"
could be better or replaced with "not from any standard" or "undefined".

sRGB and BT.601 have different primaries. There are actually two
different cases of BT.601 primaries: the 525 line and 625 line. How
does that work? Are the drivers really choosing anything, or will they
just send "undefined" to the sink, and then the sink does whatever it
does?

Or is this *only* about the RGB-to-YCbCr conversion matrix and not
about colorimetry at all?

If it's only about the conversion matrix (MatrixCoefficients in CICP
(H.273) terms), then which ones of the below also define only the
MatrixCoefficients but no colorimetry?

> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
> + *   SMPTE ST 170M colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
> + *   ITU-R BT.709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
> + *   xvYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
> + *   xvYCC709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_SYCC_601:
> + *   sYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPYCC_601:
> + *   opYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_OPRGB:
> + *   opRGB colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> + *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format

Is this one known as the constant luminance variant which requires
KMS/driver/hardware knowing also the transfer characteristic function?

Is there perhaps an assumed TF here, since there is no KMS property to
set a TF? Oh, maybe all of these imply the respective TF from the spec?

I suspect the "linear" should read as "constant luminance".

> + * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> + *   ITU-R BT.2020 R' G' B' colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> + *   ITU-R BT.2020 Y' C'b C'r colorimetry format

...compared to this one known as the non-constant luminance variant,
i.e. "the simple RGB-to-YCbCr conversion"?

> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> + *   DCI-P3 (SMPTE RP 431-2) colorimetry format
> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> + *   DCI-P3 (SMPTE RP 431-2) colorimetry format

These two can't both be the same, right? That is, the description is
missing something.

> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
> + *   RGB wide gamut fixed point colorimetry format

Is this one scRGB too?

> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
> + *   RGB wide gamut floating point
> + *   (scRGB (IEC 61966-2-2)) colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
> + *   ITU-R BT.609 colorimetry format

Typo: BT.609

Which one of the two BT.601?

>   */
>  enum drm_colorspace {
>  	/* For Default case, driver will set the colorspace */

Thanks,
pq

--Sig_/Oh1pUcgo2pR+IICUorw1QcK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPjY7UACgkQI1/ltBGq
qqdDkw//U2Wm7Xm26RMpKU0ti2n62PX6vil46utEj8hcQA10r0F9m8bFNe1TND3N
XbTy6zo6WliKVcWxIFQMxVmOEoR5fSNKxb5qNwGnsA+5GBbuEmIqxK55frG5TB5T
B3G61K7ibdWazK38k6En19/G+dk+QgLiSA8hDYiwpHlnUn3NnfcIkts75dgQBsc1
HxMb+nGaMDwten3ycMrBGF/0ryiZC8LH2XNkH0LoOo1yAb8DQhq0KGFi0lXUjxY2
P5dPha1uv8ao2CK4jBn5QxmdZTPgVKlOcbwHowAKLo4oGWqBfQxCIGfW6vdV6Pai
VhH7MZ1zW/g9x0fxXI+J1w44rNfvZuO+sPr3iDBhMl8fBuNtrzKpHL1aEXPjUqIC
vR/yFCpevottz2lzxtucwLxUgyWS48dp7++bpoVuyUqyBDCnYPE1K5u7FRx9Im7/
j7vy6CDVGuMHPTsCA7sFU7zv8XHtb5J+8Xrb9EgojeI687tKlsog18lwzJJWWJ9i
5BNV4R0d69mj/7oXqbjcwsvHR+bxF3AjhhE3ogISS6w2RiX9FK3xSGha3sathFYO
vjX94zqmdeU4UqAWqPckJKTTReUdbbwZF3SM9E6KvDgzIcX6ICaPHmjn6oU3O/6/
cbAW7ofhYb8v19V/4fOMPaSTHpFd/1kILLpCZfiNUCYPg+tCwuc=
=RI1r
-----END PGP SIGNATURE-----

--Sig_/Oh1pUcgo2pR+IICUorw1QcK--
