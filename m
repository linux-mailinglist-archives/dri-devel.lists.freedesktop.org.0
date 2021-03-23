Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC59345BB4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 11:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668C6E88D;
	Tue, 23 Mar 2021 10:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CB16E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:10:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id w3so26113365ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 03:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tSFOBkXb8kubXgr6Jc8Fc45KDru0SmongeHBDw+m/oo=;
 b=IEvtamB+xQnN5ciJr4BFrhRtcVNeKyFQJ72DMv5yj3fnbsE0BK5JGI6VIp9NcyOnv5
 F3zq0TZg/o2BFahWjh7iMU2qn9MXm3hrrquQukKcAEKwRhFCnQYFCh+FunxLKZCZj6R8
 iEhHsVHa4xnGsYlEdZru+HhurvTztXVyXJJRjyVzxqHPfNQH092mO561GT2RMBVm0YXV
 x1TStwIsjE9mHS2p512GolkKWhzIZfjCc+QmdajE7y93i62l9jMQKxoWq+NRZPvBwtyh
 EI92taJK9ndn/HhOwZ0syyt9C5bmL+yPsoU3b1npYQlXbt0f86BT/kYEHlS1aqVinZYx
 IzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tSFOBkXb8kubXgr6Jc8Fc45KDru0SmongeHBDw+m/oo=;
 b=UGQ3o9hdJ36mCYIoc6vIpwSxP86TrpYa67/JffGwu++L0+ovawY7O+5CzkeFC3OPyj
 yC50VVx0wSqF4opuSKl82Gj+TvFT9+PyFMAGIRMLk5JtUfMBwBBHVmQiyvBXHqS+fzX7
 mrqe9+HImsuseZ3pS9SvvWZWObYeBzeR/e8wEq1DDLIjglg7bBcFn4XiZtcYLUaBagkw
 Ji7Sm7nFa47SFWHHem6Cwgf3UkTXTGuiwcJI5JDQLTJSOYccGVHktKdqYWQRGlpkhD5z
 ZEUyGtd75yKbZIKf5bAjI9LZ1fdjRvMJNtopcY6myd7uSsCtB0rCQEpVhPzFv0CTS1wL
 19RQ==
X-Gm-Message-State: AOAM5327+dEISPyJv58NhRL1isrYVdvgqvD5l5Xiw+/Oy4xrtRAmoiqS
 MQhyTZh3dUZWOYv31DNlbbc=
X-Google-Smtp-Source: ABdhPJyqz+G5Df5fWzGpKVatHhkBpyY8kaKcoQsJd5p1Bn3eGa3ZbH1VtEYsRxZ2TB6KsJHvFga/PQ==
X-Received: by 2002:a17:907:3e92:: with SMTP id
 hs18mr4079631ejc.396.1616494250033; 
 Tue, 23 Mar 2021 03:10:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 90sm13350326edr.69.2021.03.23.03.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 03:10:38 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:10:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v5 02/21] gpu: host1x: Allow syncpoints without
 associated client
Message-ID: <YFm+sn7iIRuw0kli@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-3-mperttunen@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-3-mperttunen@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============2121263005=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2121263005==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oWlwZvt0sbwLqGJf"
Content-Disposition: inline


--oWlwZvt0sbwLqGJf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 03:00:00PM +0200, Mikko Perttunen wrote:
> Syncpoints don't need to be associated with any client,
> so remove the property, and expose host1x_syncpt_alloc.
> This will allow allocating syncpoints without prior knowledge
> of the engine that it will be used with.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v3:
> * Clean up host1x_syncpt_alloc signature to allow specifying
>   a name for the syncpoint.
> * Export the function.
> ---
>  drivers/gpu/host1x/syncpt.c | 22 ++++++++++------------
>  drivers/gpu/host1x/syncpt.h |  1 -
>  include/linux/host1x.h      |  3 +++
>  3 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
> index fce7892d5137..5982fdf64e1c 100644
> --- a/drivers/gpu/host1x/syncpt.c
> +++ b/drivers/gpu/host1x/syncpt.c
> @@ -42,13 +42,13 @@ static void host1x_syncpt_base_free(struct host1x_syn=
cpt_base *base)
>  		base->requested =3D false;
>  }
> =20
> -static struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
> -						 struct host1x_client *client,
> -						 unsigned long flags)
> +struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
> +					  unsigned long flags,
> +					  const char *name)

If we expose it publicly, it's a good idea to add kerneldoc.

>  {
>  	struct host1x_syncpt *sp =3D host->syncpt;
> +	char *full_name;
>  	unsigned int i;
> -	char *name;
> =20
>  	mutex_lock(&host->syncpt_mutex);
> =20
> @@ -64,13 +64,11 @@ static struct host1x_syncpt *host1x_syncpt_alloc(stru=
ct host1x *host,
>  			goto unlock;
>  	}
> =20
> -	name =3D kasprintf(GFP_KERNEL, "%02u-%s", sp->id,
> -			 client ? dev_name(client->dev) : NULL);
> -	if (!name)
> +	full_name =3D kasprintf(GFP_KERNEL, "%u-%s", sp->id, name);
> +	if (!full_name)

I know this just keeps with the status quo, but I wonder if we should
change this to be just "%u" if name =3D=3D NULL to avoid a weird-looking
name. Or perhaps we want to enforce name !=3D NULL by failing if that's
not the case?

Thierry

--oWlwZvt0sbwLqGJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZvrIACgkQ3SOs138+
s6GULg//WZxen6+j0/vKv7r4giFVSYkWBSD6HsmdPf5QfO6ZHfuBJ0yX3nUaRNy/
hmdtXXxxY1d3xJYevYmfGHpQe0vXnI2Nr9k6DyGu+4K4/FOENZKOX1TMFdmiqqW2
hbZwOXjVkqZmoJEo5KlsozLxSd1tYKbJl+2ic1VnQ5RF/Eh100jGF6tQ3NtATgWd
6jDlGC+mWH7nn7UtKnE/+98Fpz7PKX5baoCfcjidJwYMBNjFXpa6BnPRWhEtAfk1
oeMGMZ3HL6Dp3gGr7cHAnkoL0cuo8KSoG2qkTFpU0E0Dub1dFk4VNaSgXte1zqCo
GCcWLEMbprbhfsqMn8AtIALyHLmoD3HBbPs8jjRixSaSX0yPwK50ru1PC3eO01+E
Nae8v+ZV7TgDA2ohruO6ZqrPm+rtigkHzrAMIeY1fZJmBBdy6S1q08Zu9lh0ReTy
jj3ioxjzBR5TcvMPd2jcOlwixrXAMl1nQa77bHpBy5J+e8c7cndhhd9KSdVC9tyP
5o/sDFsTeMM5bwEYEfIeQ4RXb7wmVBHhr3Sz5qpfEe+2A/5DS7ffGzpsAcDb2L03
zzaF9QOzusUnS7dwcVXbi/y7vY8JNigXSWWU9AT/9T+7NHVpRXB3D9dgL6ryN58x
iIc1wa34oY5gFlsOB/MaT/WdbTHpoZGRrypIdTbF7mNwYRtXbZA=
=EwxF
-----END PGP SIGNATURE-----

--oWlwZvt0sbwLqGJf--

--===============2121263005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2121263005==--
