Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0D64B34D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 11:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEAE10E2FE;
	Tue, 13 Dec 2022 10:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0910E2FD;
 Tue, 13 Dec 2022 10:36:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id q6so4162128lfm.10;
 Tue, 13 Dec 2022 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eOhpTETZJwOmzldrrcBwvLYwkVMNAxwwRumLeYPEC+4=;
 b=c2uO1Be2hbY9b9Y3vOOuwJrtgaKisHMoijLfR6IZwbgJqjLxxr14ZTHkfFf2IOwAT8
 rf+JTSuBFomPkgg+dtfhQCwaklF22zvOgbhRB4JDZrQzNDqZWBfAtFU3eLwmprA0mPbs
 wtqeODBKY1CH8+mdyfRWumJs1kc8PPJM62CfWOFLapzcouGXXUKxPmGT8ui/cL7ITpP/
 c5vqlj7ks0E133QtUCr+WHRCgFtYBRFOcG4neMEpVAik9NoBXzzChOQksO40hHsG/1Cw
 9+RclJSuq/nFIPE/bta0vxATNrY/Uqes6LLcL7geBwqrmnOwtkRAKmTLW6onne8ycxht
 tcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOhpTETZJwOmzldrrcBwvLYwkVMNAxwwRumLeYPEC+4=;
 b=fhAK5gL8Exb8i5EWJ8CnVz/Rvknq9bvLWB9hirMcBaQO+oMN1VTWbsqpHUFsiTxGXZ
 SLWXqZM3cDfAf/BhqOzY7ZQt0AWYux+4chPtniV/oHzC8KbTNHmrcsakozlzDC0ab8Nx
 DcgC6gIwzcINIO2hm2inlwsnwpc2S0CXnIontYvE2GauMjF53MbedMP/HLvjd9WrOUIs
 M8sxwknYhZwVd8DkxSzH+TzU+BxwkhKQLXEXJCKxDG+V/HhHOPjEZ+MBaifUA6JEiwyt
 wiZU9W4F/xckAgkrFq4DQuwC815fFfjeeIktUUMZHqnj/Y4m8f6hfhuB2Q/o7RP6Cnqi
 pF3g==
X-Gm-Message-State: ANoB5pkowr86w39zTgJnG5i4gQW9nj3m7u1DtNoZxchL1sX2b6A/XJtz
 kDcNKzJr+ocvSPKXbU48u7I=
X-Google-Smtp-Source: AA0mqf5Q8qHvMnPLtrnbtPmLzUlXQNSnnDEuKs8+Sb4rNYSajp4B/ZU9meXkxeZlE/pTCGT3MOrCqw==
X-Received: by 2002:a05:6512:3e19:b0:4b0:6023:6f6f with SMTP id
 i25-20020a0565123e1900b004b060236f6fmr7532718lfv.57.1670927763640; 
 Tue, 13 Dec 2022 02:36:03 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056512344800b004b590c768edsm314518lfr.1.2022.12.13.02.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 02:36:03 -0800 (PST)
Date: Tue, 13 Dec 2022 12:35:59 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 14/16] drm/amd/display: Add debugfs for testing output
 colorspace
Message-ID: <20221213123559.33425bf1@eldfell>
In-Reply-To: <20221212182137.374625-15-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-15-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//rYKCY.xiOVuBaa_tHSX4ID";
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

--Sig_//rYKCY.xiOVuBaa_tHSX4ID
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Dec 2022 13:21:35 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> In order to IGT test colorspace we'll want to print
> the currently enabled colorspace on a stream. We add
> a new debugfs to do so, using the same scheme as
> current bpc reporting.
>=20
> This might also come in handy when debugging display
> issues.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 461037a3dd75..d95d1c9f4805 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -935,6 +935,61 @@ static int amdgpu_current_bpc_show(struct seq_file *=
m, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
> =20
> +/*
> + * Returns the current bpc for the crtc.
> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_colo=
rspace
> + */
> +static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
> +{
> +	struct drm_crtc *crtc =3D m->private;
> +	struct drm_device *dev =3D crtc->dev;
> +	struct dm_crtc_state *dm_crtc_state =3D NULL;
> +	int res =3D -ENODEV;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	drm_modeset_lock(&crtc->mutex, NULL);
> +	if (crtc->state =3D=3D NULL)
> +		goto unlock;
> +
> +	dm_crtc_state =3D to_dm_crtc_state(crtc->state);
> +	if (dm_crtc_state->stream =3D=3D NULL)
> +		goto unlock;
> +
> +	switch (dm_crtc_state->stream->output_color_space) {
> +	case COLOR_SPACE_SRGB:
> +		seq_printf(m, "RGB");

What does COLOR_SPACE_SRGB mean? Printing it as "RGB" seems suspicious.
Should this be "sRGB" or "BT709_RGB" instead?

> +		break;
> +	case COLOR_SPACE_YCBCR601:
> +	case COLOR_SPACE_YCBCR601_LIMITED:
> +		seq_printf(m, "BT601_YCC");
> +		break;
> +	case COLOR_SPACE_YCBCR709:
> +	case COLOR_SPACE_YCBCR709_LIMITED:
> +		seq_printf(m, "BT709_YCC");
> +		break;
> +	case COLOR_SPACE_ADOBERGB:
> +		seq_printf(m, "opRGB");
> +		break;
> +	case COLOR_SPACE_2020_RGB_FULLRANGE:
> +		seq_printf(m, "BT2020_RGB");
> +		break;
> +	case COLOR_SPACE_2020_YCBCR:
> +		seq_printf(m, "BT2020_YCC");
> +		break;

What do these actually mean?

Are these a combination of colorimetry and color representation
(YCbCr/ICtCp - RGB conversion)?

Should these match enum drm_colorspace entries?


Thanks,
pq


> +	default:
> +		goto unlock;
> +	}
> +	res =3D 0;
> +
> +unlock:
> +	drm_modeset_unlock(&crtc->mutex);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	return res;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
> +
> +
>  /*
>   * Example usage:
>   * Disable dsc passthrough, i.e.,: have dsc decoding at converver, not e=
xternal RX
> @@ -3326,6 +3381,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>  #endif
>  	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
>  			    crtc, &amdgpu_current_bpc_fops);
> +	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_en=
try,
> +			    crtc, &amdgpu_current_colorspace_fops);
>  }
> =20
>  /*


--Sig_//rYKCY.xiOVuBaa_tHSX4ID
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOYVY8ACgkQI1/ltBGq
qqfBMw//WYpTOlb1D5lnkgfazVAKZ5rFyhipRgSEYRtQYS1mpLJSOl8efKNt+gaB
8qmuKB/qXsYchFnTszpm4elMbaxR2Wi2BYGUBramQRgOfxxHMP4VE64bqqhgfZb+
DTQHy3+R7OW+eST37kmOrQ28WiKN5eVlIqfrc0hMJ0kzy6pJOBjJYDNVj51mgnCg
xHcIN1uU0uDhLnYUl0MxYmSi/ctFRFVA7kQ8wsvbagqFULGvPToXR0Se6+FeC3WI
NMnoMSyLhgUHgbsuM8G8hQ9Th4uvtcutX3gcTgtXbhleNynAsrHU31iUTxxtK3aY
4eV0GY1H1n99wH4qV/AWsvALbb7M+/Vu/OoNivCZKx5mOrQPgZQVPXnqLZ1ltU3c
x6sR4gjhp2Xbbus96c6QPHimE6NEyic05R5jdh/GDGZCKTqaLZcbuahZF+stPfqG
6JSBwmZixOnWf2wJvN8WC9uIw5A/2DFGNiYsXlEMZY57KmII23kgE1bSxRKS0VkU
wqpd2WPsSJVDCxkI1lRBcyW/sidRpOSQb0gWFKJDhuVnvhdwi8thayVrli8/+mub
lpOtjR6PLCSXnlxnURAEmNm2gG7UsTi+9tlm2aA6ntQ+I5thGAVnopOASSLgU3G0
PK3CDetj54BGJXoHUsthuA2NtWAjHY4gSPqi1VZ9U2FHtGrHEho=
=7M62
-----END PGP SIGNATURE-----

--Sig_//rYKCY.xiOVuBaa_tHSX4ID--
