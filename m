Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FD4799C79
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 05:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743510E04F;
	Sun, 10 Sep 2023 03:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729410E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 03:54:59 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-573429f5874so1973590eaf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 20:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694318098; x=1694922898; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l8I/ytZjYAzCt9rW5QpCR2v7N9TIb41rg0eM/Ys3Nlw=;
 b=Hs76rOP0YgXHt+gQY/Gtct9O0qopuA6tAc0R+MUouWmv85rsWu6TB0SQhc3eVF4Svq
 WX2cMWabXYnXqY/R4v0i3nWePBBXRITjo69MfT/8iR7oKgNfY6L/CINzGjpXsXhKmmUZ
 4y9bjUOSkq/gokXSMooTBVvYv8ImCKuQu8R5x4CaEdcxxnkHokArhMp5UGVKuCIqiscf
 DVMAghfsAVny6t/+S43dCyDVArZVWaq7LkhB0Cmj+CeXf/cPzB9tfB+7nd6ABugrHEF9
 XBWcTpKXtpeeOf8ZBibamlh5sfRk7h6ponOnGE+tkNRzhpGImy2qLtF7/Dp0xhvwetV8
 tHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694318098; x=1694922898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8I/ytZjYAzCt9rW5QpCR2v7N9TIb41rg0eM/Ys3Nlw=;
 b=I02mzapt+3x4c8qixjeM4WClw1USpEGrHA5od2ZNFYAXeBIidktl24s/Acke3TQ4UJ
 1tjKttLbzQzDnKmjh3xB1LJ6MYtk5ky5Pk0J6Yse9xy7WgSFkcyQObSeoplzXsIWAr/P
 moch5M5gmoxqDUanTgm83DpFGLLRhAUgYVAxZyjsbo32iuRjYLOesJBEaV7HeniLm/sj
 V+9g+9r6eu2MQcdCooTDjwMfpzYfX7EZl14SwEUCr8AcUbukJ1YmAWjZbnl9NGPVqjtl
 RQ/vmnUBHkAm0W1mEdJReDxqQH49thb8I/CFoeU3nkmQBavjzqWz05G583ps1HqItcZ6
 YR+g==
X-Gm-Message-State: AOJu0Yz9ykP1MMqIRlZy9K+gjQLZWu/NMemshu0CUFdmkDDA3V+E4dSj
 bLK/7AYPf6AidCfQ9jTflsU=
X-Google-Smtp-Source: AGHT+IFmdTBXwP0BmCOvDapnnklEogCQpFivgh7MV+psCiblPD/X9FoNE9kxhyOeikZ+QKi3oWkkrg==
X-Received: by 2002:a05:6358:7209:b0:134:c37f:4b63 with SMTP id
 h9-20020a056358720900b00134c37f4b63mr7481569rwa.2.1694318098413; 
 Sat, 09 Sep 2023 20:54:58 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 h2-20020a170902748200b001b9d8688956sm3913678pll.144.2023.09.09.20.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 20:54:57 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 31A2B8152373; Sun, 10 Sep 2023 10:54:53 +0700 (WIB)
Date: Sun, 10 Sep 2023 10:54:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm: fix doc warnings related to drm connector
Message-ID: <ZP0-DaW3lIeaZ8xY@debian.me>
References: <20230909110343.8103-1-bragathemanick0908@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m24psGSsoqT7l832"
Content-Disposition: inline
In-Reply-To: <20230909110343.8103-1-bragathemanick0908@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m24psGSsoqT7l832
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 04:33:43PM +0530, Bragatheswaran Manickavel wrote:
> Addressing drm dp/hdmi connector related kernel documentation
> warning and add more information about these values.

What are these?

>=20
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 ++
>  include/drm/drm_connector.h     | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index bf8371dc2a61..084c95785dda 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(stru=
ct drm_connector *connector,
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace pro=
perty
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: to get hdmi supported colorspaces.
>   *
>   * Called by a driver the first time it's needed, must be attached to de=
sired
>   * HDMI connectors.
> @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_prope=
rty);
>  /**
>   * drm_mode_create_dp_colorspace_property - create dp colorspace property
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: to get dp supported colorspaces.
>   *
>   * Called by a driver the first time it's needed, must be attached to de=
sired
>   * DP connectors.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d300fde6c1a4..556d66dd122c 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
>   *   ITU-R BT.601 colorimetry format
>   *   The DP spec does not say whether this is the 525 or the 625
>   *   line version.
> + * @DRM_MODE_COLORIMETRY_COUNT:
> + *   Represents the count of colorspaces.
>   */
>  enum drm_colorspace {
>  	/* For Default case, driver will set the colorspace */

Oh, you mean to add description for colorspace-related fields.

Thanks.


--=20
An old man doll... just what I always wanted! - Clara

--m24psGSsoqT7l832
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZP0+DQAKCRD2uYlJVVFO
o72FAQC1/upVU9ceWJaSBr2/nUK7jvc12JhGtDiGaWd0X4kdNQEAjlcMtPpgNEwk
knUERgY4BXnbaet+xqtbFqc65Zr6+wQ=
=sgRJ
-----END PGP SIGNATURE-----

--m24psGSsoqT7l832--
