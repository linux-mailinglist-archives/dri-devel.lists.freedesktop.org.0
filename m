Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5237BFD47
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F5D10E366;
	Tue, 10 Oct 2023 13:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075410E366
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:23:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c012232792so70129821fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696944180; x=1697548980; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4OkJhMqhpJlQA7D4mEBZ0eKbSauF06ASDuYayzw6gs=;
 b=Etk+eHKuwTAcRSvtYjtjws01svSHYo6nQJg2gYLBBs2BGFYHN7NqkBaf8gcYQjs4o+
 XaLq0VbZuTEra6DnNoSsijP3UglmzOuIR3auX2mE4uUWvHeCwVLSTFsxob8QDmAYQF3p
 Tt3RQlAN2+UHxVkHJ1/8BzqpvwOmcuaahaNHmfidIZKkGCaNu06Jlu2XNX+ygYqpvc7d
 AQATK/33u46jOrC10Qfy7SOHarvHvhbpFNeWlCEyH8r01/X5BHgLUry7vqIyOGJGgmrI
 bG5miEbe6lbzNUMU4bZy80T2MONxUXibmrmXl3Ls0aixS5l19RmvRUcMGdZnma5tcw0/
 YG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696944180; x=1697548980;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4OkJhMqhpJlQA7D4mEBZ0eKbSauF06ASDuYayzw6gs=;
 b=nMIT/UcGJArIU982oD6Q0w2zDTAPBPHODPpkSGTsTvvcWV2mcdCP6S7tzUTP1XtHlH
 aV2WEyeWtc1+SoJpt+8/UvMAe3uRUWOwgHCsZijJbGggNSfs2ai4XmlRj/j2K+Gvep9z
 +2ILj4bVmzkSDC7OauraNmTjKUgpMfnqzVtQS39JfgN3F/0mY3Y1NCNq62BXCwiFnVGA
 eKp6oaiyxK39Kt41bJu81RiTwrXBhPQ1yX5hycjLgey4drHdIYthiLAhETodJNwPh9o/
 eSG8GcXM0DfjLXxI2hEWbLfgBckWk8EnYWEYz77r08F4roOMt0giFgMB1+akzY/DbitI
 SfPA==
X-Gm-Message-State: AOJu0YyeK3A8aOTJ6RO7YFolEqkYPVZmxlcLXe0NYhhU31uLFo0VIdqW
 C+rhGPPeb1gLtXjjOz577eGpkGxw4yI=
X-Google-Smtp-Source: AGHT+IG4E1Rsd4mR8zKAlFKL3gBiWJYcWwe6obioes7OUwKszflS+BDw7LqnVeVigL3XOU4ZXBP1cg==
X-Received: by 2002:a05:651c:114:b0:2b4:5cad:f246 with SMTP id
 a20-20020a05651c011400b002b45cadf246mr14945414ljb.7.1696944179734; 
 Tue, 10 Oct 2023 06:22:59 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 q23-20020aa7d457000000b00537e822458esm7603769edr.20.2023.10.10.06.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 06:22:58 -0700 (PDT)
Date: Tue, 10 Oct 2023 15:22:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 1/2] drm/tegra: Return an error code if fails
Message-ID: <ZSVQMPuRnXzC0lgf@orome.fritz.box>
References: <20230626143331.640454-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pfm0RnLdhwUV4frN"
Content-Disposition: inline
In-Reply-To: <20230626143331.640454-1-suijingfeng@loongson.cn>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pfm0RnLdhwUV4frN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 10:33:30PM +0800, Sui Jingfeng wrote:
> Return -ENOMEM if tegra_bo_mmap() fails.
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/tegra/gem.c | 2 ++
>  1 file changed, 2 insertions(+)

Sorry, this fell through the cracks. I think it'd be better if
tegra_bo_mmap() were to be improved to always return either an ERR_PTR()
encoded error code or a valid pointer. Throwing NULL into the mix isn't
useful because it typically means something like -ENOMEM anyway. Error
codes are more explicit, so since we're already using them for some
cases, might as well return them for all.

Actually, looks like tegra_bo_mmap() never actually returns an ERR_PTR()
encoded error code. It's either obj->vaddr, the return value of vmap()
(which is either NULL or the address of the mapping), or the address
obtained from dma_buf_vmap_unlocked() (i.e. map.vaddr) or NULL on
failure. So I think it would equally make sense to keep your patch and
to remove the IS_ERR() check below it.

I would slightly prefer the first option, but either is fine.

Thierry

> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index dea38892d6e6..0ce22935fbd3 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -710,6 +710,8 @@ static int tegra_gem_prime_vmap(struct dma_buf *buf, =
struct iosys_map *map)
>  	void *vaddr;
> =20
>  	vaddr =3D tegra_bo_mmap(&bo->base);
> +	if (!vaddr)
> +		return -ENOMEM;
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
> =20
> --=20
> 2.25.1
>=20

--pfm0RnLdhwUV4frN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUlUC4ACgkQ3SOs138+
s6G12g//SDtyUQdjlNkFYALQ7xVJv2ZZ7b1urqiIrnAyqUtUfeiEqsckl+yNpbM7
k0gluSK5XHKMY0+VLibxBSRzGF5Kth++GEl709FCWSxAy+3cupNtX66hwkuqovpz
CnTVi25vjKDxM8AsVeCeJJin8qn721NMByrVdv9790kh6SS6HSgboP936ayD4AtN
14ckJ2RENrsBPUCj+XEol68DBQwHTbGlc+2B/znECFEDkUr/myf/O6rqLLyC/ErJ
UeHFjac5al+/zNeu4SAYobBT/RbhU11Yg1CNINiOexzzYDzYYGMppK+Uph1QfhCN
obaipcKDIb43LrzrlC6YsjsP0OgnbmdAzxYdiSvTMvzIdjp960WuFVlyxw/ofWD2
XAH1jr8DnDHdQ/Bzu4D5eD00dyGaBX3BqavZVFSNSGEC6MalA7fkZP5wk2mOGY1s
sIlTJLtQkfJngFT68SSFbPV5t5iFuLNcYvcszSn41no1CshU/ZlJMd4l2tJwLp33
2PJIpQhwBjw62/K9ZaTbvG7xiceUnkMjYfhfOi6EYNvj666qU3QxIgENyyaeMQgS
4f7XYeBY0Um7V+xEDqIcIRjhGqVv7fhtwMq5YBYjB2C6xAIgFoHiBzsbJSe8BTvr
wXCuE6mjY9+mfzxG2YmS+eRmGvO6djHAcAepluLlLOK+ib1K4OY=
=muHC
-----END PGP SIGNATURE-----

--pfm0RnLdhwUV4frN--
