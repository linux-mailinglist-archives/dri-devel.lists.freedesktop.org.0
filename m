Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91351253F46
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86076EB11;
	Thu, 27 Aug 2020 07:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B06EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 07:35:10 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 185so5287734ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 00:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=7APyHOujPL1VeK8Eil0L8aFHD4Q0gYtExWSlFGcjgmg=;
 b=B3bi80kjtgfp+lEYjnG2F+19d/sX90y5UROZig2euZ+1ZBZkpgt3aH1dzEyv63kUjk
 +IcdxUFm+Yly2y8SWe6/UHVwmpqeWu9m1J9hXbinVmBwBC/x8pdPVWw4kC7BVx5QTF4K
 /6ACxh/dX3WOUJO1MvvwYycomLb7V41/1I5mDWzKjvDGdNX1qcmaa4m1xpoqcthKpKeW
 gBjmLEE0n8K65BEydcs+y5HqxvKRJ2TRitAGB/J7vG+2B6k99toYX9IxWTtlIRkucux6
 MeJDWdCbiW/z6pSA+GVQG56wOnEN3aAWCkSTryd/A0nxdlKXO1M0eNq15yFU/x4MObn9
 hxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7APyHOujPL1VeK8Eil0L8aFHD4Q0gYtExWSlFGcjgmg=;
 b=NFmAoaSJ0h5QA94cyKpKXfsJBBzlPGMfupw368Gp0rXijiUrrviywIUiQwtPWcWTjA
 JSet2Pk3UICXz9C0pbZIBsNHXUg5yZzFWvur7KHsTyFdEMy5QnJ8KD1azXHLZxmJphAk
 ULlGjbMDO0TqJwDTmnlH340tTv+uWXRy05aZitiaJ/Pt2D38QzesK45an/IEvuKVra2C
 dPm0cdphIt503E8m78cGq/dw/eC34KxxSDg+yIil1JAmH0AXaLGvvJgFWHODL6gshnCp
 hwC2fo4Fjd42xIOX4ltwsQ+tUO9vpFscswOmLx+ADNIo2qETMcT+0hzGc8OrBRRdgad0
 eKEA==
X-Gm-Message-State: AOAM530oq6ZEJXQ+yrIV2X9bRcLHRt7Xl+HzGtnKOr99hpa6EE4HJxt9
 aq62FLDsbj3SrE9yeQQOyaQ=
X-Google-Smtp-Source: ABdhPJzVuZLGlIVYCxQHJ6jt0P6Csdk4Q8l7EO2A2x3ucFfSbPYImf6ufnSiupv9tFerYJ7vq1kseQ==
X-Received: by 2002:a2e:3a10:: with SMTP id h16mr2320532lja.221.1598513708321; 
 Thu, 27 Aug 2020 00:35:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e25sm282458ljp.47.2020.08.27.00.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 00:35:08 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:34:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Algea Cao <algea.cao@rock-chips.com>
Subject: Printing bitfields in the kernel (Re: [PATCH] drm: Parse
 Colorimetry data block from EDID)
Message-ID: <20200827103456.57edaf59@eldfell>
In-Reply-To: <20200826142328.131144-1-algea.cao@rock-chips.com>
References: <20200826142328.131144-1-algea.cao@rock-chips.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de
Content-Type: multipart/mixed; boundary="===============1634578334=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1634578334==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PKLpTK3oOKREpLRBpjtEfJP"; protocol="application/pgp-signature"

--Sig_/PKLpTK3oOKREpLRBpjtEfJP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Aug 2020 22:23:28 +0800
Algea Cao <algea.cao@rock-chips.com> wrote:

> CEA 861.3 spec adds colorimetry data block for HDMI.
> Parsing the block to get the colorimetry data from
> panel.
>=20
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> ---
>=20
>  drivers/gpu/drm/drm_edid.c  | 45 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  3 +++
>  include/drm/drm_edid.h      | 14 ++++++++++++
>  3 files changed, 62 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 31496b6cfc56..67e607c04492 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3223,6 +3223,7 @@ add_detailed_modes(struct drm_connector *connector,=
 struct edid *edid,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> +#define COLORIMETRY_DATA_BLOCK		0x5
>  #define HDR_STATIC_METADATA_BLOCK	0x6
>  #define USE_EXTENDED_TAG 0x07
>  #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> @@ -4309,6 +4310,48 @@ static void fixup_detailed_cea_mode_clock(struct d=
rm_display_mode *mode)
>  	mode->clock =3D clock;
>  }
> =20
> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (db[1] !=3D COLORIMETRY_DATA_BLOCK)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, const =
u8 *db)
> +{
> +	struct drm_hdmi_info *info =3D &connector->display_info.hdmi;
> +
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_xvYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_709)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_xvYCC_709;
> +	if (db[2] & DRM_EDID_CLRMETRY_sYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_sYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADBYCC_601)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_ADBYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADB_RGB)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_ADB_RGB;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_CYCC)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_CYCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_YCC)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_YCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_RGB)
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_BT2020_RGB;
> +	/* Byte 4 Bit 7: DCI-P3 */
> +	if (db[3] & BIT(7))
> +		info->colorimetry |=3D DRM_EDID_CLRMETRY_DCI_P3;
> +
> +	DRM_DEBUG_KMS("Supported Colorimetry 0x%x\n", info->colorimetry);

Hi,

taking a tangent here, printing bitfields as hex is hard to read. How
about using something like nvkm_snprintbf()? Of course not literally
that function since it's Nouveau internal, but as an end user I would be
happy to see DRM core or the kernel generics have similar functionality
that actually decodes the bits and prints their proper names.

Does such facility not exist yet?


Thanks,
pq

> +}
> +
>  static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>  {
>  	if (cea_db_tag(db) !=3D USE_EXTENDED_TAG)
> @@ -4994,6 +5037,8 @@ static void drm_parse_cea_ext(struct drm_connector =
*connector,
>  			drm_parse_vcdb(connector, db);
>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, db);
> +		if (cea_db_is_hdmi_colorimetry_data_block(db))
> +			drm_parse_colorimetry_data_block(connector, db);
>  	}
>  }
> =20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index af145608b5ed..d599c3b9e881 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -207,6 +207,9 @@ struct drm_hdmi_info {
> =20
>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
> +
> +	/* @colorimetry: bitmap of supported colorimetry modes */
> +	u16 colorimetry;
>  };
> =20
>  /**
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index cfa4f5af49af..98fa78c2f82d 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -229,6 +229,20 @@ struct detailed_timing {
>  				    DRM_EDID_YCBCR420_DC_36 | \
>  				    DRM_EDID_YCBCR420_DC_30)
> =20
> +/*
> + * Supported Colorimetry from colorimetry data block
> + * as per CEA 861-G spec
> + */
> +#define DRM_EDID_CLRMETRY_xvYCC_601   (1 << 0)
> +#define DRM_EDID_CLRMETRY_xvYCC_709   (1 << 1)
> +#define DRM_EDID_CLRMETRY_sYCC_601    (1 << 2)
> +#define DRM_EDID_CLRMETRY_ADBYCC_601  (1 << 3)
> +#define DRM_EDID_CLRMETRY_ADB_RGB     (1 << 4)
> +#define DRM_EDID_CLRMETRY_BT2020_CYCC (1 << 5)
> +#define DRM_EDID_CLRMETRY_BT2020_YCC  (1 << 6)
> +#define DRM_EDID_CLRMETRY_BT2020_RGB  (1 << 7)
> +#define DRM_EDID_CLRMETRY_DCI_P3      (1 << 15)
> +
>  /* ELD Header Block */
>  #define DRM_ELD_HEADER_BLOCK_SIZE	4
> =20


--Sig_/PKLpTK3oOKREpLRBpjtEfJP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9HYiAACgkQI1/ltBGq
qqc9jg//YlHW3L6UDL4d1hg+YWdsy3l/QUbxRtSsw0j8vQhULjaTs1YUNDb+S/WE
KYBuHY5enEJ2kUH4USsBaI1uhhdFHrq3SM41DnUQKIqWB3lLJmNbJj2YgXNh+vg0
l20I1uQQuhGH64xDVKLuPdCS4BnxxlFHSueGaZ4txhmQ2ruPfKF45Hm+IhBSyrJN
VyCiazoNsVhQbGlhwhtB2P7sQSM1YY+Ul0nXb1R6a80ziBjV4Kx9OTTewqLLqT6J
Xg74c2ELcVnfqDLXPNUF/NLSv+BsA8xxSPe4lyHddL4kgWOzofMrjng4JN7C6tVC
fZdG+AVLeYgic2TCNkgW8dX9I6/47YjgHEfjDmXKE2InbjhbaudG+6jstISUBepi
F5MKoTtItDxVnDkl9TZv7c0UxJp9lcNQ44vcb/qyvYagvZCrmnYNFC+SuPvGQ+ia
xg5+uo+m8qAAka6dbGOByGRbaDgMCGWZIGKGDOGkQT10IUpqcNkZ56pvTdC2yaUr
8Qnd5cITOgLZVlWp/P+ZuDc09s5lbbWStpBqW5fLJrumH2natvK5NksATucN/vvm
ylS/eIvSJLZDCSq8veMdy2gOzWgaI9AaJHI0q4sgwfPOedBEsJEHE9DNvU8gONnu
oXz7CjEuq1qzSvqNCzIYWT9+aa5bBfLyFWbOtO9wakgt1hspAGQ=
=xWEr
-----END PGP SIGNATURE-----

--Sig_/PKLpTK3oOKREpLRBpjtEfJP--

--===============1634578334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1634578334==--
