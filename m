Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC26533781
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 09:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE31B10EA9E;
	Wed, 25 May 2022 07:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4310EA9E;
 Wed, 25 May 2022 07:37:55 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t25so34636943lfg.7;
 Wed, 25 May 2022 00:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hpg8n0S33NSIN+lluPk2yS5xwFJkYhnuGZhLbBPgysY=;
 b=bBeX/M9xNPmVwxa+NgrTglUNF1MyanlNQOpNgXo/C98PduGiICBV0ZTIeSjlLHb9cN
 Mndn18lB0XxS95Pon8dudlIr84hvIU/UQiMwwav4IA+e/HcNYMzZdcxykOQL2esmoqIh
 DdDrg6Daao/WQpCodytc4Gp6UfNBqByR43CtovwE2/5/o1k6DxXwoQ6s0yo/pTeunpzi
 Fbgu4fyfx1C6on8lWS4LyvpjznVbwbfmLd0hT7XFrYcI0r127L0ME4jGipp1dVkWPH4c
 CN+TQfZDLWL+KM/K4maZgZvJhJbol0YBB+05d/ZOUpbD62cT1E7BYC1WO4ZrO0EX4FYi
 yXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hpg8n0S33NSIN+lluPk2yS5xwFJkYhnuGZhLbBPgysY=;
 b=kOMjgZGNW0Zhnw2K2nDXt+YGPP0BGBfJjsgePfQwwzMnq6bjYqZMi4mm1MfURmnpxa
 0Jxi66rZ9KXukKXgjraV3Pi5K0PVAAk/KfzkibcfxQJnwR67re40zlnBb/UK4juXatrd
 pxtYWm1PCdDieVGfC3TeLakNhHUQ2+7HW46AIJ4ldW5A+dhVPP2KkM/H19cpHkCv05Qd
 FruAHRDsuL9WutI6w0q54jQ+lG93XfTf/UxPjDCv6giR6WtdBXO/Gr3Zai3JB8AY5HCW
 nZ2KWoJ27mGwDA6zS75/91cTxq5Of82DOwbf5xv5/dzyHX/DUNLvmxvxIq3felNYhXy8
 wPBg==
X-Gm-Message-State: AOAM532XdYzLOmpYNfjRUZaIwwi/AfY9U851mMIjOTwnZUqOHzedAf80
 fpi5A+azXMMxUaa7mlfYeW0=
X-Google-Smtp-Source: ABdhPJxHe7xHEgV+om3Ib/QsMp2qagVsGVNZCWxGw07ERgMI38J5Fxg1fF3xGCALiN03zYGUBSVaRw==
X-Received: by 2002:a05:6512:23a8:b0:478:5ae8:a239 with SMTP id
 c40-20020a05651223a800b004785ae8a239mr15345139lfv.73.1653464273421; 
 Wed, 25 May 2022 00:37:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m2-20020a056512014200b00477a14d1eb4sm2952623lfo.34.2022.05.25.00.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 00:37:53 -0700 (PDT)
Date: Wed, 25 May 2022 10:37:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm: Don't block HDR_OUTPUT_METADATA on unknown EOTF
Message-ID: <20220525103750.2793ccb8@eldfell>
In-Reply-To: <20220524183320.28870-1-harry.wentland@amd.com>
References: <20220524183320.28870-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+VKYi1WB6iLzBQVAr/S=xFm";
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
Cc: sebastian.wick@redhat.com, Uma Shankar <uma.shankar@intel.com>,
 vprosyak@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/+VKYi1WB6iLzBQVAr/S=xFm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 May 2022 14:33:20 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> The supported EOTFs are defined in eotf_supported in drm_edid
> but userspace has no way of knowing what is and isn't supported
> when creating an HDR_OUTPUT_METADATA and will only know
> something is wrong when the atomic commit fails.

Hi Harry,

maybe clarify here the two different sets of "supported": EDID data vs.
kernel code? I think the paragraph uses the same word for both meanings.

>=20
> Since it is expected that userspace reads the EDID to understand
> what the display supports it doesn't make sense for DRM to block
> an HDR_OUTPUT_METADATA if it contains an EOTF the kernel doesn't
> understand.
>=20
> This comes with the added benefit of future-proofing metadata
> support. If the spec defines a new EOTF there is no need to
> update DRM and an compositor can immediately make use of it.
>=20
> Fixes: https://gitlab.freedesktop.org/wayland/weston/-/issues/609
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: ppaalanen@gmail.com
> Cc: sebastian.wick@redhat.com
> Cc: vprosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> ---
>  drivers/gpu/drm/drm_edid.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..223f96a72064 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5691,10 +5691,8 @@ drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_dr=
m_infoframe *frame,
> =20
>  	/* Sink EOTF is Bit map while infoframe is absolute values */
>  	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
> -	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
> -		DRM_DEBUG_KMS("EOTF Not Supported\n");
> -		return -EINVAL;
> -	}
> +	    connector->hdr_sink_metadata.hdmi_type1.eotf))
> +		DRM_DEBUG_KMS("Unknown EOTF %d\n", hdr_metadata->hdmi_metadata_type1.e=
otf);
> =20
>  	err =3D hdmi_drm_infoframe_init(frame);
>  	if (err < 0)


--Sig_/+VKYi1WB6iLzBQVAr/S=xFm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKN3M4ACgkQI1/ltBGq
qqfo7Q//eAmF5P2tUXSNitIcyVevHe7IYZC0N4aIcui3m3tzE0+5NUK5t8qMQODC
fqB35gLe8h4wsH5p+9xLciuS4w7PYsk4ylzMe/tp/zi69Jc4/43vuQYWXG6p9PL3
5etBt0tjm1Z/jfiejxK9X50yVbMW5lfYU7nNccCJWyINGUGxdyM/DzLWVFqw7/pm
gzgQgpKDSNvu5DahRkLpJgtP/o1OSnfAObbiIxGUEJHj2tDet0cSx3Y6aG0cvTqa
6pcMaHwwdyL/XEvoTNBOTOaDalaS+L+BEBOwQsekFZx1Yg6wFRC4l6Y5rtMZhThp
w4fC+/gH+mQB6UCYtTtAugbfgAz7I6GYXcU+RmmFt40xBmG9p7+GgV/inL8+To+3
CeWB2THSP56njVTolCLahxHrxmC2FeXCr/nr6QT0p5lxzyrbSae5+9XtmqKSNjvJ
eT1Piel/ld9Q4JBtYgUDyVdOuBXnQVm5ciDsyjbHuAWMO7gtAQMOLKxRTVzx3NM5
5V8QzIF4x9gG45XdKCBLEhYYSWhr06pL3jQzqPmE5576+IFhCb9beCE5qs+ztFq6
Jeab4kORdehEk/3xE4LudLjcfNcSKRjkgaeGWskrxgfEAcFdmLm1olfrmGGVFL86
k+NsNwisqyO0BQPJLpzjhXr2B9e/hViFJj7G1dzeHxBzYVt5CNA=
=XoND
-----END PGP SIGNATURE-----

--Sig_/+VKYi1WB6iLzBQVAr/S=xFm--
