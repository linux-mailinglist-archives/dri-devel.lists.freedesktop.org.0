Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E775C452
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566C310E64F;
	Fri, 21 Jul 2023 10:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D432E10E64A;
 Fri, 21 Jul 2023 10:15:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso281087166b.0; 
 Fri, 21 Jul 2023 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689934536; x=1690539336;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xtjou4bw3TzoaU4pkxO6dL/R//dx1dOT1P8B0FqrHKA=;
 b=Tfm+30DQEJ60lYnGshB1LHllAG8vV6tZJlWJu8MaEzgnMoMC4s8xR3p8apQLvVNXrU
 SsCdfj06a4f9s62gn1+m13FZeT8JIaTbP/QLsdb58Wl+Bx3Sk7VWJYPoYNaVX5mC3+q0
 Rs2KjsZnmNUozrNcZGl15QnXalxAHlU6ZCHrH5lsGabvw9HEXfz1EAYPQdbs9ZtUgGmu
 ODgtKVUF0wY54I/IMZWbmr8tof5c0D/hfoTkIzmRnUg+uw27Hm23MiuKX3PpzfRWwdpX
 JSpcBybDwjUfvHgOaPY78806miQgOTtCRT1cm5IQNhbaumSj/5htxDsdm3D+hUCmwISK
 gyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689934536; x=1690539336;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xtjou4bw3TzoaU4pkxO6dL/R//dx1dOT1P8B0FqrHKA=;
 b=OS1vCrZ/y/yZJ34Nyf8r7LvjjD3pdLjqUMbO0qy+6LK3uLMn41A7D86TMBM6MXwfMG
 2xJyxCVBb2LUtnG00UhF18cp/5+ZePdfvczSI6NbVAEwK4fVFqAQAWzyhebmi5CH/o67
 iRtDe8YE6wWOpb3/vfj9uQQRxxph93yBazpDCOgLBV006Dn9jzhemXcQw3WMTVKRf61H
 N/e1hNDx0PvvrM0B335/mCyxygER8H4HxdAnEcIGUk4PTLgcN4cEDcFSr5zgJI/KGE55
 0BVlSBF47PV2xghC7ULQtrSTZZRzLr+uh+3Gk7WINv95H7IH32hbbXi2PxyV+YoKuCOj
 TKTw==
X-Gm-Message-State: ABy/qLaVWGvroAQvwgduDE35GTIXLdS+OtUnJQLg6fGgpl5IpnjOa0Go
 5Ht7xZGXciBtkxrDer3VPsU=
X-Google-Smtp-Source: APBJJlFMSTNXVoDP1pttaZXsGetq1EYUvcvS8mVgRKzhexw1wKgMd76fhF1INGqDgTxi6Ne6bb3VQA==
X-Received: by 2002:a17:906:7691:b0:991:c566:979 with SMTP id
 o17-20020a170906769100b00991c5660979mr1229678ejm.36.1689934535180; 
 Fri, 21 Jul 2023 03:15:35 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090608d300b0098d2f703408sm1960285eje.118.2023.07.21.03.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 03:15:34 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:15:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
Message-ID: <ZLpaYPUI5gPd4jK_@orome>
References: <20230714174545.4056287-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qaVvuRtXrCn2kCOF"
Content-Disposition: inline
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qaVvuRtXrCn2kCOF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:45:34AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

[Trimming the recipient list so that Google will let me send this]

Test builds were fine, so I've pushed this to drm-misc now.

Thierry

--qaVvuRtXrCn2kCOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6WsQACgkQ3SOs138+
s6HK1A//QgDGQj/2Xez0LhGk60CphNT160FLxq+/4O2qQdzBoldz2WfYizMz+Qyv
OCph/RC4Vp2VJEySeVU8jjojJZtqnu3iVQ9LGC/L7EFFJQOwaNlGusy3FoWAp5i1
tAMhZUBH/QCvLjoc7kQXt+MjZGx/ccGHcmckwnjP1DVERdSUqXtq8VU1FHDxiQ2Q
WfE9WhlNsXzJzcGXKC9qEKcn/OdrvPHgmAMJ7ypyjQ9z1x1/oEsJH6Bj0oIaiF2+
R1Lt+KO5tvnL4ozutwZoHX4rPL9qQ9NvBwvk3DdxxaDs4R5Hhin5rkKhs6SvVbBX
8bOTy7u1WaKQWaGEhGnnQzpaK3bp1n9L9Ooc/VtUaBx1iRZ8EsJmVfdNC8527L14
0pH0DNOHHZDuTKd14C/W8JKsSrMtqPml41UClQC8AQ69iSfq95AbcajnFXcpamF6
nYbTpBL+EOukFj5EJppNc0Bg3R0HdXvz9DmBx0qMt9cFAbq05D+4ke/aTKCDv0nM
eQij9GV8h4g7wsmXWfFYqnbVk2K8G8KqsjEZakqkbUYE0i4tUs+O8g1piw1aXQis
gX6QIVmBbi4PjPh2TWik5FCLogKMIqVDCuUfG/LJIQzypr/7QnSP6XpvyqjWiWua
t1LWo/rbraFTe/hnaRqOUgOfKnfXRN3fZFxHW5CHGIwET0BUK9s=
=UVD4
-----END PGP SIGNATURE-----

--qaVvuRtXrCn2kCOF--
