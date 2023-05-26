Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AE712722
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 15:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8369110E1C8;
	Fri, 26 May 2023 13:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007B710E1C8;
 Fri, 26 May 2023 13:00:22 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-4f3baf04f0cso741667e87.1; 
 Fri, 26 May 2023 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685106020; x=1687698020;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3xyrcLBJTcsomQAAXouIchIN9+Nscvda9ofnAf5WVZc=;
 b=Cz4RydyhBDXyBNqGiip53JUDF1ul1aVfNXJmA3SayEFfJyex/GNkYykyWVf3en8arC
 +BvKLMOc7CUJ9L7HkAWgOsut+wJyGv2fZtWLYxhNA0l7wFjAPMWMz/ilb6fT7y/lmOZW
 ceqq72i2JHZpqq1ZqqAxqK7udYHV5qi2PCmknzdI923UInLnsIpFq/+4uir+BxSc5UkJ
 t1UJn6V1AXlH0zifx0Pw6y3OSEMPGAAQ0ShpGtq3JVk3IIqjFaJ1cKyx9GfdkampVhBv
 UBLBSeCgSmd5AUHhTg/McndpyVAvu2uJrhl2tu1dVgsZns3+C2hycxS5FX6EnQqubdjV
 cI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685106020; x=1687698020;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3xyrcLBJTcsomQAAXouIchIN9+Nscvda9ofnAf5WVZc=;
 b=le3JSHl0jyJTRBrgMly1PKGuSlx4suafZ1cYeKINQ8f5r8xto2ieN9X2ZIi5EsifBS
 WxHtpWl75rlyakRpfNt/jwFqc2r8pqj+LPNzLUKrFsg9PUfHk4xQfzBFSMRPhdn8CObV
 MqJb49eimAumPRCEW6s9EXgjjKrv5YfISI+d/I3KKlzovizV9LJx7Bhpz+I+mz9XA5yS
 5cPjyDH/LtThe39DhiRa847cHSA9Fc9Dva2Y2AoacQxFU2ES2aP+ItWaP82nGtfIyGOM
 4UcAY8V7sO4tF5qF1xmk2P0glZ/B6g7QREz4brWYO/czhnk2C7DlhSsskoMmhzrTY6xb
 Y9gQ==
X-Gm-Message-State: AC+VfDzMm7uK1XkCNqBBDQCo7VGjwTODvCHFcKlBxLOHHuuytlncpbXe
 6DbZ9HpxvHljZyYPuKOYJeQ=
X-Google-Smtp-Source: ACHHUZ6DfRYrdNAbTY1KFYHoHQXQes5kGj7PVN0sBHMZCbT6a2/zDNBfcJ3y/UjqAkGlIy4wln+GEQ==
X-Received: by 2002:ac2:547c:0:b0:4f4:c972:981f with SMTP id
 e28-20020ac2547c000000b004f4c972981fmr468805lfn.54.1685106020185; 
 Fri, 26 May 2023 06:00:20 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n7-20020ac24907000000b004e83fbba141sm603923lfi.164.2023.05.26.06.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 06:00:19 -0700 (PDT)
Date: Fri, 26 May 2023 16:00:07 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v4 02/13] drm/connector: Add enum documentation to
 drm_colorspace
Message-ID: <20230526160007.53b09f47@eldfell>
In-Reply-To: <20230525191809.3524-3-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
 <20230525191809.3524-3-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c8X6BZlGOrFNELY9YDZlJNG";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/c8X6BZlGOrFNELY9YDZlJNG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 25 May 2023 15:17:58 -0400
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
> v4:
> - drop DP/HDMI clarifications that might create
>   more questions than answers
>=20
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/drm_connector.h | 62 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 77401e425341..ee597593d7e6 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -363,13 +363,71 @@ enum drm_privacy_screen_status {
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
> + * @DRM_MODE_COLORIMETRY_NO_DATA:
> + *   Driver specific behavior.
> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
> + *   (HDMI)
> + *   SMPTE ST 170M colorimetry format
> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
> + *   (HDMI, DP)
> + *   ITU-R BT.709 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
> + *   (HDMI, DP)
> + *   xvYCC601 colorimetry format
> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
> + *   (HDMI, DP)
> + *   xvYCC709 colorimetry format
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
> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
> + *   (DP)
> + *   ITU-R BT.601 colorimetry format
> + *   The DP spec does not say whether this is the 525 or the 625
> + *   line version.
>   */
>  enum drm_colorspace {
>  	/* For Default case, driver will set the colorspace */

This is probably as good as possible, having references to chase when
questions arise.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/c8X6BZlGOrFNELY9YDZlJNG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRwrVcACgkQI1/ltBGq
qqe4vg/+OPNZx69YvcFO49RgJRQJGn0DI6y5Q0oKtOz/WNlYRhipOZQFQKbLjKHT
wxNSViWFnwVot3gx0e9fRdKJS62+ytOSC0XRSKVZiorVLUEgy7Z1a/j0Lwkw9dzy
OfwwnEUz6C64XkSp6dmj5EtXA/AuggeqaX8/0j6WO+NPXFntQjmDWrr7PFNDKUUg
hJmEHfAXeQRakKpB7DkRBhGguHTPSIdzHFttbSXgnAAXo55cldkgZzd09Wc2AGSO
e6xQvTLaeVT9M1v3rr/keREdjXlPAS9gH3Tcvm3sQ6qoGFEP0aew4yO+MCWSVNSj
tNtuQrw6T9faSLioetg5t/34cssvyAk2MRBX39MAApdJLm9dY92ZBU514Q0podft
Z1TBIMBjCkcEEJSl9Lvhs8VR7BJifzYeaacasN1knvHibPiIqY1wzec5w0LgpEWZ
HnhyxYOVD5XtNtLnghZd0QEBhlE6zY1pt0pKtoVCiN6z9g2aeFywZFtoL3zYieNI
39sL/24mfjXiID4pHVMaptgghs/tlY/SgI6y/fOaeMMQdv46cd4JbfiXkrJPtjZS
oDEM+h0Dat9aOE3YO8a2jKWYtqgqVUQoYKNSeiqrSCjEeAEkgbA7S21gmXWzVNZ1
cY3CSW2zE8Bb16zjbdCepKqbrqbPRzddBfQaN95vm1QCXcKcaJ8=
=Q3uw
-----END PGP SIGNATURE-----

--Sig_/c8X6BZlGOrFNELY9YDZlJNG--
