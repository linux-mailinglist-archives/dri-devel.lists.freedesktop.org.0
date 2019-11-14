Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C558CFCFB3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 21:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EF86E3FB;
	Thu, 14 Nov 2019 20:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEFD6E3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 20:31:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s5so8233517wrw.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 12:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xrGK4XSxLK8daRWkwFS6OsjqxfoBJHTZ4472D/sbTNI=;
 b=sdfZpppBkXfHB6z41wtUK1glSWhAOcuWhqq4zw0jUYRE0nq3S87hQSYO/aO36cskr3
 YjSVB2MhXRup8Gk1sDKvfxRb6iPr7rBTl5uP9z2Wb56fRyw5D+09atFWV2K/NtXilw8b
 fGB0c0/9VN10z5rep1v3vO/cnVmlvHvfYjcuF2ZMyfj5AyG0hKNRM6EhmwqIdqOcZpRr
 lXhFGc7rLt5cX+Ql/eUD8TMExfGa27T+pk2BrLxyr91rSS4CPaDdOiK3k5/pNRAxFqz0
 A1RRDHMVFF1KYclntgf1ucH7NLFw4+nWpbYJDUzWH2lXJ+2N6uVi5rJ6SArfxdt/0zkW
 Ec1g==
X-Gm-Message-State: APjAAAXOZ0+iOwFHMEy7MS+zISgcztIKwI1xD6ObOB3/K6Y+v+E2t6TB
 ZrFK+QznJJL3qpEnFyr154A=
X-Google-Smtp-Source: APXvYqxps0X0FFQBJnBrVXDHms4NvvcvClz9T98MD1+q8IBuInpCF0ZioNZpideNYi5uV0FENgubDQ==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr10186575wru.159.1573763480083; 
 Thu, 14 Nov 2019 12:31:20 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n1sm8755284wrr.24.2019.11.14.12.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 12:31:18 -0800 (PST)
Date: Thu, 14 Nov 2019 21:31:17 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
Message-ID: <20191114203117.GA761559@ulmo>
References: <20190811183932.15850-1-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190811183932.15850-1-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xrGK4XSxLK8daRWkwFS6OsjqxfoBJHTZ4472D/sbTNI=;
 b=k2hSixm3GFrfEkBPy7Fi63J6e64zOPKcDGWnaW9FM+LXURuA49nELVLiWivw4LjloC
 G0j70jj4i+c3pujvbNJb+ZBKjWgsrB/C/J4Rj1FUtLHZMoLQKLSs0lkZ5HHzArDcFBcE
 q09e18h4Z+HnrFdUsTVlqGnHtEkLCz5fAw+ue5SHxo8PqY3O984SIq/o0Ek8CTZLnFFM
 flQvLPxsGCpqVnxwjCwBs9KKulLefQvLV4ExkJ2mod68pgw9tTcWOZwJHeEe0K0oLtpx
 k500uxyX/Js0UC200IishMmP69j9vlWGw0VnzZVSotk0wlZno+0hfs4D5gitGvYSIt5j
 JAJw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1359975478=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1359975478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2019 at 09:39:32PM +0300, Dmitry Osipenko wrote:
> The drivers core bumps runtime PM refcount during of entering into
> suspend to workaround some problem where parent device may become turned
> off before its children. In order to disable and reset CRTCs/HDMI/etc
> hardware, the runtime PM needs to be "forced" into suspend mode.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v2: The SYSTEM_SLEEP_PM_OPS are now set for all of the relevant drivers a=
nd
>     not only for the DC because turned out that they all should enforce t=
he
>     suspending.
>=20
>  drivers/gpu/drm/tegra/dc.c    | 2 ++
>  drivers/gpu/drm/tegra/dpaux.c | 2 ++
>  drivers/gpu/drm/tegra/dsi.c   | 2 ++
>  drivers/gpu/drm/tegra/hdmi.c  | 2 ++
>  drivers/gpu/drm/tegra/hub.c   | 2 ++
>  drivers/gpu/drm/tegra/sor.c   | 2 ++
>  drivers/gpu/drm/tegra/vic.c   | 2 ++
>  7 files changed, 14 insertions(+)

I'm not exactly sure I understand why this is necessary. Runtime PM is
controlled by the drivers themselves so that when an output (say SOR) is
disabled, it drops the runtime PM reference. The idea is that since the
disabled output is no longer needed it can just go into a low power mode
which on Tegra usually means clocks off and reset asserted (and in some
cases also power domain off).

DRM/KMS has system-level suspend support, which we use to disable all
outputs when entering suspend. I see that, unfortunately, this doesn't
seem to actually cause the devices to runtime suspend. I'm pretty sure
that this used to work at some point, so I don't know what changed. I'd
have to look into this a little more. The core doing something like this
behind the driver's back seems wrong and having to force the device into
suspend mode seems like it's just piling up on the workarounds.

Thierry

>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 4a75d149e368..6c8f5222d558 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2572,6 +2572,8 @@ static int tegra_dc_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dc_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dc_suspend, tegra_dc_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_dc_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 2d94da225e51..22f80f69ffb8 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -638,6 +638,8 @@ static int tegra_dpaux_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dpaux_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dpaux_suspend, tegra_dpaux_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct of_device_id tegra_dpaux_of_match[] =3D {
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 2fbfefe9cb42..fd0f8cec8c7e 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1665,6 +1665,8 @@ static int tegra_dsi_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_dsi_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_dsi_suspend, tegra_dsi_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct of_device_id tegra_dsi_of_match[] =3D {
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 334c4d7d238b..ef66defac767 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1739,6 +1739,8 @@ static int tegra_hdmi_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_hdmi_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_hdmi_suspend, tegra_hdmi_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_hdmi_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 92f202ec0577..3d33d0360169 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -931,6 +931,8 @@ static int __maybe_unused tegra_display_hub_resume(st=
ruct device *dev)
>  static const struct dev_pm_ops tegra_display_hub_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_display_hub_suspend,
>  			   tegra_display_hub_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  static const struct tegra_display_hub_soc tegra186_display_hub =3D {
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 4ffe3794e6d3..b743193bf0b1 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3572,6 +3572,8 @@ static int tegra_sor_resume(struct device *dev)
> =20
>  static const struct dev_pm_ops tegra_sor_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(tegra_sor_suspend, tegra_sor_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_sor_driver =3D {
> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> index 958548ef69e7..880304a65c5c 100644
> --- a/drivers/gpu/drm/tegra/vic.c
> +++ b/drivers/gpu/drm/tegra/vic.c
> @@ -476,6 +476,8 @@ static int vic_remove(struct platform_device *pdev)
> =20
>  static const struct dev_pm_ops vic_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  };
> =20
>  struct platform_driver tegra_vic_driver =3D {
> --=20
> 2.22.0
>=20

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3NuYwACgkQ3SOs138+
s6G+7Q/+P+mkojE+rHRI4ZMc+b9mOvTUZBtwAj53oa4TdGYuTCZdSb3SxsOHtkCV
ILcEuY1Wjbw1JEAWclTVaFXJy3eWlJHcG+tDZf3NKZefuAQ+HJbPUJ2Z1YBwfy7n
DqcXdpTY5lfFWbuZCaU35bPlL7Bfd2MEZD7SxLdC+Tfcv8I7jfFZjBPZJN3GdGfk
KEPwXFBfQ2XeQmUHcidkEjJFADGwKGApU6MORS1UnV6epF3d5mLLF5CUqajIPZh7
Nd4mseykcmfoARHRLAmlK3dV9zHE5JGgFLpbWCF/NKvS7eP7Ke4qMetp3qhPOUto
ZNSMloJiSbEimHsZbG9YlyCvYulkDz4u2ECK13iE13rnROjSt06qhqR91G20ibFJ
axYyZHlV1UGg0DvGliyHlkgBKWnjiXuc4mPYlzJxutmo7B+uRkiQ0wqLo8vlf72o
4NBizcSzfmy+TYPL2jkMqePvJJyrGz+0xhFyxb6Ft7zR+x1vQFYpSw5TPksZ/O0k
doGZrJRDZPvGCiCr8iJnI1qjTo2Y/WZS5kRmheFDO2Q6qdNfxLKEtlOtJDA2l3lU
vwphL1XBC8oa/OKCHBqTW5G5iCR28/9+YIb4mq5OorBUdY+bVl1hgyiNFYvjsVHW
GN4sSS9gy0l50Znta4ecJ9k1eYTuPBvBWTenJ3+T4ealVDNm2R4=
=XCS8
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============1359975478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1359975478==--
