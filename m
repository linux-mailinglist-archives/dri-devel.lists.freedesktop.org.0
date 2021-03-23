Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D06345E3D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95746E8DA;
	Tue, 23 Mar 2021 12:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C026E8DF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:35:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bx7so23231197edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lHmZ3Qa8XJH26ATXcTSyeZyZq/ONQq04Zxc5xOYmrXE=;
 b=Gww335WUAvsbjcIhqAZaR0+4xb3pEjPIzjYMbzDFHLUNWpOA+s88ILn6nr8qPsmNBs
 lRjIOpsKYFqzdxCETLAU+5phU3qyopHIRH/GpYAEXB2AJi/8yxR5/BqXlGjm7V9C/4F6
 PUEq/HP5T+HX2Tpvm/rmGT80S7aL5+Nl9io/r2aP60OXz5DhIVowX4pk9coJm7aweKmp
 roxsRfT3JvS0ptyy0JetCpfBI1Y14mjMxm8tcsd01iD5+hX1E6BnWJcOiA7yJOIOnnTP
 2QEZdyqlgUscWnESV/FxPwWmHGfPw+p9GI/o6oSauD2cYaayE7wCpMZne2W+epqvUDLm
 VbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lHmZ3Qa8XJH26ATXcTSyeZyZq/ONQq04Zxc5xOYmrXE=;
 b=VfBUd3+FClztSnksj28zg/+fx5TvyyXBowUxwtpWOQJWRz1u0hrvRKpcfVatfe1IVv
 RjjErlXz3vHLVrfIP6DbAuz1F/y5yP0zK3VD92YpRKozKsuZDuWhbZxWY3EV9SgEjgul
 GVi9Dv04Izh1aOfjeWMBNoR5KUs6c0ShJ1J+mylTKIBUx4E0K++u0wPC2vdURPT0ldqp
 2kCrM3desenMm/nM0EXKKhBKwSu9Tv3yqgEMxW86IgtGQ6l7aABV1XyjE8bHOyhRPyOb
 9NFQYoUCtUr/VLaa9DJWlgojeds5y9NTSMa10Z7cz1llbpnhjP4UuAXFFPYLmluVnPD6
 1NYw==
X-Gm-Message-State: AOAM53108icMYhm7VJMI0hEISZiWi9u06ppqJXy5t3DhLG0HBZwtlnYE
 j95hso1xb7Z1jz13kYsmHYE=
X-Google-Smtp-Source: ABdhPJwDl5lVjxm2Lk+CFqVGqQlkazMzvWjd7yuCrr/d/4lhp8UTDj8ZJ2CRgWXHqDL9IraR2xHpFQ==
X-Received: by 2002:a50:9ea7:: with SMTP id a36mr4472158edf.174.1616502910517; 
 Tue, 23 Mar 2021 05:35:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id hd8sm10918993ejc.92.2021.03.23.05.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 05:35:09 -0700 (PDT)
Date: Tue, 23 Mar 2021 13:35:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 18/21] drm/tegra: Allocate per-engine channel in core
 code
Message-ID: <YFngka4Z5pbH/HNd@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-19-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-19-mperttunen@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Type: multipart/mixed; boundary="===============1182217900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1182217900==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SgsY4S7moYzTCfXq"
Content-Disposition: inline


--SgsY4S7moYzTCfXq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:16PM +0200, Mikko Perttunen wrote:
> To avoid duplication, allocate the per-engine shared channel in the
> core code instead. Once MLOCKs are implemented on Host1x side, we
> can also update this to avoid allocating a shared channel when
> MLOCKs are enabled.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 11 +++++++++++
>  drivers/gpu/drm/tegra/drm.h |  4 ++++
>  2 files changed, 15 insertions(+)

It'd be helpful if the commit message explained what these per-engine
shared channels are used for.

>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index cd81b52a9e06..afd3f143c5e0 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -880,6 +880,14 @@ static const struct drm_driver tegra_drm_driver =3D {
>  int tegra_drm_register_client(struct tegra_drm *tegra,
>  			      struct tegra_drm_client *client)
>  {
> +	/*
> +	 * When MLOCKs are implemented, change to allocate a shared channel
> +	 * only when MLOCKs are disabled.
> +	 */
> +	client->shared_channel =3D host1x_channel_request(&client->base);
> +	if (!client->shared_channel)
> +		return -EBUSY;
> +
>  	mutex_lock(&tegra->clients_lock);
>  	list_add_tail(&client->list, &tegra->clients);
>  	client->drm =3D tegra;
> @@ -896,6 +904,9 @@ int tegra_drm_unregister_client(struct tegra_drm *teg=
ra,
>  	client->drm =3D NULL;
>  	mutex_unlock(&tegra->clients_lock);
> =20
> +	if (client->shared_channel)
> +		host1x_channel_put(client->shared_channel);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index f38de08e0c95..0f38f159aa8e 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -87,8 +87,12 @@ struct tegra_drm_client {
>  	struct list_head list;
>  	struct tegra_drm *drm;
> =20
> +	/* Set by driver */
>  	unsigned int version;
>  	const struct tegra_drm_client_ops *ops;
> +
> +	/* Set by TegraDRM core */
> +	struct host1x_channel *shared_channel;

Perhaps reorder this so that the core-initialized fields are closer to
the top and the client-initialized fields are closer to the bottom? That
seems like a more natural order.

Thierry

--SgsY4S7moYzTCfXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZ4JEACgkQ3SOs138+
s6HxCQ/9Hy09Sp0Dp/+VWhV+rCnj9j1MA7ewsLVRiajzKQfUFnsyHFkZuJUoDS7z
YKVzFvbPs0qaq9YhkWHZ1/JdIMjKebY6mjEABEMYC7Gb1zhh0vb/PmHffjb4j3BE
LqyvYex0q8MIrTvKyeIZrbBuLNyUKyFC5oeRqVsvLXne5bE7Niqiizdclm/rTWTi
mbrccvEyZXiUl/UHnvJe2SA9G6UhziSJBEe32RUuAQ3L28/dvwk0n6xf3FwUgcR9
BNX2sL6xJ79ddb5ADIYf0DcLp5w8H+pya+XoOftaWIgdZ12mHxmw/BQ2Js3oSqRZ
NjPFZwQS3fjrtuM9DwvoRXacB3BIJsbIxN+OXkjHm6z/u4YueByNMUcvQtjPAYRE
UUpiJeMs78QvzQ4F3brXdoBbqLNMiIbpyIErcT9LcYtQNDY+p3U7FmH8aa1AC2uj
iGnyPXtq+3SnQXm7k5myxJ5XPnxMnAKT/JLnZdjzo3IFoIE7/0E5mO800ADmCXV2
VZ02hXhT7stHOXM8ZRsAeltJE+1RPyPXOVR3HcoW7P1NCqHw4zci6v7DQa2U86y8
+HnLtlj7abDm3Y45Ryz5UpYriVLhjLAXZXDGFcmEdIOmzQrGdGEQqIOULFNMkR3S
eIRHrDKvuhoOVFXWoTFUnln2/49K/EcII6rdRHlBKhhvHvALp9s=
=nW7f
-----END PGP SIGNATURE-----

--SgsY4S7moYzTCfXq--

--===============1182217900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182217900==--
