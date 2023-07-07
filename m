Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947274B0B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9380D10E563;
	Fri,  7 Jul 2023 12:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7FC10E563
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:27:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbfcc6dae4so8931795e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688732842; x=1691324842;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miiLkM0CrGFVGmHvIpnji0OMSUMh4Pbjaf/A3Rfnl5o=;
 b=Vu5HWx9u3V9rXjZ4b4cB27G2d1VvXosrTKjM62C0xR+Vm1RTEjQfsWlLhODdnfh+tA
 NB3rn89cWz4qLytgjearKzt0ClfhXfJXOJbnfO/iFeEgZvk8pxVUUnjyIw83CYflUfLl
 DD5J8sYd1Qe5cyuYg4DSfwfYG4eurGDn8/X42i+kCBp4m9jhmUBEEM5i0bS4xukKzwD3
 hTqZTPjM2DaiNfyEbUk8TRaerLnlcF2ftVtmkhsx9PGW86QFBsnn6nCasIfEqjesNfnx
 bbyRddGR1ejbebLA3tT3JdUtF3RG+tCCBzSkD+dvKTOFKaFudZ51V4MHlORZNPpyiexf
 /yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688732842; x=1691324842;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miiLkM0CrGFVGmHvIpnji0OMSUMh4Pbjaf/A3Rfnl5o=;
 b=BwxtT5162RS6FfWLbO3gWNEFis9XUrGLGkGxE6EgyCJ6DNVKIz/VWb38HiSgPAHUkB
 3vVo5oXGyr0hJaRac6Uqr2N3/f6dichQXOYKKwXAPwt+qQ8QD7CK5wdAdLRYzrcG4S9R
 je1YOPdR4tr/R7KHnmZ2emz7FlTA0/a7SJJl1TPP/CUE05RoiYlnzfV4FsVha2Eg8LKJ
 j9H24DbHVABJhO/G5w2gvjO6y9LPEMaQH0fNsH7zC7g3orSIonz0mWxkBLFGfFP8oj9S
 yDHQEuDHJVTer4+fGSJgQssMcbeKL3ilmNtUQRIT1KG0Jx1b0Pb9TIJg8jaagibDyWFB
 vGpQ==
X-Gm-Message-State: ABy/qLb9RB+72SgDtvCRdnb2cGYPcszv4dpc0wvX3YUPP3EijSLY8SMP
 4wrwlDiGOFTbhf/VQMHsLwg=
X-Google-Smtp-Source: APBJJlF7fR1W+pHh1Mzn9BUQbJN/Uj+O9uypICWZaJN5U8ZkOD+qBbjYftweSghkV2agxYEfbczIIQ==
X-Received: by 2002:a05:600c:3654:b0:3fb:b3aa:1c8a with SMTP id
 y20-20020a05600c365400b003fbb3aa1c8amr4260905wmq.16.1688732842067; 
 Fri, 07 Jul 2023 05:27:22 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b003fbb06af219sm2363613wml.32.2023.07.07.05.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:27:21 -0700 (PDT)
Date: Fri, 7 Jul 2023 14:27:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 04/12] drm/tegra: Set fbdev FBINFO_VIRTFB flag
Message-ID: <ZKgEqBVCkCpGyFI7@orome>
References: <20230707083422.18691-1-tzimmermann@suse.de>
 <20230707083422.18691-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ts1b/mYBCw25ZidD"
Content-Disposition: inline
In-Reply-To: <20230707083422.18691-5-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, mripard@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ts1b/mYBCw25ZidD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2023 at 10:31:55AM +0200, Thomas Zimmermann wrote:
> Mark the framebuffer with FBINFO_VIRTFB. The framebuffer range is
> in DMA-able memory and should be accessed with the CPU's regular
> memory ops.
>=20
> v2:
> 	* drop FBINFO_DEFAULT
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--ts1b/mYBCw25ZidD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoBKcACgkQ3SOs138+
s6GeKg//UisIKLJ5ssVJTPCXmJuMbWZch/UGKG7Zu3f04RzbsdSVXFaPDCOgDyQJ
gBZafMU0tRBU7fDa+0HCqcD9ojEDAz1QvsrjSrkmONRrh6LrOHCt4LUsia7jvXq/
dk4apSMa5apZSxNpDj8JxQtKjuYSu6kyZRHU7xLskuZf+Tm/YfxQUeKcVhgCRWWf
s3Gwnpzb5dORUnYa24l3mZYkCv2aXmv+C4/dBd3nYZ7HwWFlIr+TLKLo765BbEKe
8BUA0uQYTK5hrJap32b6x6r+Qr9LYInwYFfFqucXc2L8f36kpDJtLGbMetYKWsXK
YKI+gXRtYD/BvPf2BlPNKx4fpSrrHnv91U71pcsY1Y2N+dj2PSt3gZbuRH/q2IYa
sqmFaDKfm+Y9asUP6oZ5IrKOK4Z1Jy8jy/RN3ll06elD6EFlF9gYchuJ6b0dx40u
hNiLSOI0yQ8h1S+8D1NdeFJ8WtExkLuImoIf/I/h2Aw8zp3pnl+if2tRzm5k2UmH
3w/QpxbkqzRGmKnfQIPPQQnFJ3h7JtBX1i+EE0BxOBm0oXDPUJFUmU/rTeHWy6PI
joVQF8R7AJhj08s+7d/jJVbVn1QHV9v1ff40XD6V+5Ankg48cKlwEJCeOL0GEYoR
QbknvsvKNaGObh+/1LOkqr1qOj+jhXr1WLEhZdEzN0W9OrUDULU=
=vRiE
-----END PGP SIGNATURE-----

--ts1b/mYBCw25ZidD--
