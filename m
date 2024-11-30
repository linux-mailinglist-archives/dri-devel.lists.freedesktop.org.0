Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13D9DF246
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 18:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EEB10E063;
	Sat, 30 Nov 2024 17:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tke1MyuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E568610E063
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 17:37:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-385dece873cso832339f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732988255; x=1733593055;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
 b=tke1MyuEVMs0mgOi1oR3wcZnhssP5gnOm4BAaYC+RI0YmNsqhTTAycGjpgAmOKGDgu
 Oi1mxDUnIur66JeNt6XARRb/rJ5Zvf6jbuVEmJx+TVkYFlZHkxkFpFaD3tkCIREjyPFz
 BXfvpmE3zV8APIVMt8ob2TMhZ3JPCLnCwH44JGsm1asCFnSl23YNNRL8r1mKa67v5Nds
 7jsqTOsIdMTjOzqncW4o2a6a3QAawMmfyhQwxXB9WC2SADoPnEgSBiTzWzh0PC+ZS/hq
 75ktSignD/xZCaB3ADIEQOokn69LAyzFUJ3XwlEW16FPcpuxYO/cekWi8tDqFxNIePne
 NwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732988255; x=1733593055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHsN6TaNp1079VuBOcy+ma3PsSKaKXviIRckoZ4F6Sg=;
 b=dPIdTDZ2VEn+TmzSppJLCJ0dQprvRSgj1QaYa8quH2hMFmuINgrNSkMD3dj5j8vjqF
 SUev/0quVgIoWpxvNAqjrtFkx1z5mpPVI58LfxdLOl4xcKfE2tSl5oPIMY1owi023p7S
 qvLu2vL9rKVYRNsmK234JDL8n3klldCIALUfF051zGs3jL9ApICfjtiZUBHB28lIKlu6
 +nV6fXOUesJkQ7ituUTtnex/EUX9l0gIeKixuj7ix7QGF9oHp39CUndKbV9jdStiaeFP
 dVUF2AxIr1RTnjbDCV/Vts3z+SRNGXq7pJeFoV6yq3O3ObDkCvh5dUAF2oT+SxBX1cNX
 +1Sg==
X-Gm-Message-State: AOJu0YyhNxAspPOYtxptclZ1Dg1Cna+rjtaFHc7eUGjD1kMJjbcVwxyR
 9UPv175sFdt7RwLt02VLzUwLN+XZER9XZa/5XFFrwDZ7VV0tzpOLidTOctsCDoE=
X-Gm-Gg: ASbGncvzQfz67vv+1VCLgtfTsAhqjCC3njaLgxaPcVQoeMZXbBGuLyCJkwMGISNZvJ3
 Tsr9W8EwfLwFNP9fC/1W8yyWwq3rJ2LQkrT/TrkyZa54HUhzNTm8ubSxkszRQbpZBJycWeVBigk
 OA0TWgXu6mQBCkeAe5X18AO3n+bVZKW4qDaJDiEM7XC0IUAjBvGfgRyneMz7ZK6eG8T8hP8b3LQ
 W+gTk2gljFKyyieXgQ225TvuqZms8Pzs0lysqJnxMq+eQkh38HqyAM=
X-Google-Smtp-Source: AGHT+IFwFQ2rSjeB0u3yaS6t10AI+CYIIMAsPZIeMkH7fQN0rD+w3+XGwsQFyRldnEvjiwCvxiOdhQ==
X-Received: by 2002:a5d:59a3:0:b0:385:cf9d:271d with SMTP id
 ffacd0b85a97d-385cf9d2858mr8248469f8f.21.1732988254848; 
 Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385eb10bf7esm453594f8f.14.2024.11.30.09.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 09:37:34 -0800 (PST)
Date: Sat, 30 Nov 2024 18:37:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com, 
 dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <gyt3z6jisr4cea4wwk32hgzbatbczibppgrv6copcl4qo2chlx@w5kcqulhoe2p>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4chv2ajqebpzf4n4"
Content-Disposition: inline
In-Reply-To: <20241125093316.2357162-10-victor.liu@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4chv2ajqebpzf4n4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
MIME-Version: 1.0

Hello,

On Mon, Nov 25, 2024 at 05:33:06PM +0800, Liu Ying wrote:
> +struct platform_driver dc_de_driver = {
> +	.probe = dc_de_probe,
> +	.remove_new = dc_de_remove,

Please use .remove here. Also in a few other patches of this series.

Best regards
Uwe

> +	.driver = {
> +		.name = "imx8-dc-display-engine",
> +		.suppress_bind_attrs = true,
> +		.of_match_table = dc_de_dt_ids,
> +		.pm = pm_sleep_ptr(&dc_de_pm_ops),
> +	},
> +};

--4chv2ajqebpzf4n4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdLTVoACgkQj4D7WH0S
/k4Tewf9EssJcTTmbhrMd+Z9OEMUakhfq+ufnw7+fdnL5bSz1UG4O6BpXKdSHEOG
3GVGRRTto7bFTDc8d6AjAymdKak5N9qoiKUvbjXBcqqw/yrQnatqoSbVaGXl1AhM
bC3ACa2Jk+hpxBLZ0ADQNIsiTHt1JsD25oyDT+LdjtBWwGcao8CWuPNQY9vu/+np
jeqbvSKy0ZxJyb9DtQkAErXp6TDgbDIus7W/t+SER/BSZVQuZQH1cZ/Il8Fyf41K
jlKO+ARu3pWEngcNyxZmR5mUzZdh6+0Gfoy31/tdmao58gaN/fLFirQ0NruQFDEM
3M2Ee3lQXE8MXaOGn2uhWj312eKAZw==
=RpIh
-----END PGP SIGNATURE-----

--4chv2ajqebpzf4n4--
