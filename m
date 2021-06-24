Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA53B2E81
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55CD6EB66;
	Thu, 24 Jun 2021 12:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256EA6EB62;
 Thu, 24 Jun 2021 12:02:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso3354776wmj.4; 
 Thu, 24 Jun 2021 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=A4ZJSYnWcvNDaAGkscckQ1T0JedTdFDVSuL2YBNdwwF7acWK0AZcsU5zvsVBjaEnE0
 vsxLXeiOkPXV0sDkt5mf5/o226lI7HBeiLI3sEq1aMRGbypsf6Bch2Kg62wRL1La4pDI
 oGZydtxItkAsfL83TfuEmUWoDMxV7rufPNivK3ryBzWPLuL+5usBc6MglcCUM6IzelM8
 Nz6qtrU0C9W4JeYrs7rwBFAjukEAoFywD8y16Q8wkRFeIXm2GbxrFHrfjHBLNTda9rqV
 SY0IiWXgH48K8ZPh9MWtQ5Dh1jLdaybwti7HCY0TZjkN9TbYA/yL3MNnHzS9FYivGbwv
 lUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+SpIYl8f+mm4xc/wATx8xxQwIh7YjYdlE5uQ7ip0aaU=;
 b=JwWySRSrae4yzNjJApTF+dyBb/ry5QMyc5FX9Gs7VMLVeq2opPzH4XBMDl1zDWjjHz
 g37f5TqkI6MvaBltty5I6jbf0yntrWB1LL6m9k8hwYv8WfzY6yN4v4Y7Xyx/wpWNrYrS
 v6YzNQaP9MnpeGePd69weFmQ6neEjyMffX49wU63ITn2TZ/hy5xvij2wGXBszdVIi7+R
 Fx1g0hogWCGW2WfhxhWb5wxmrDgCIng5d61bww+y/tA8qVh65+PpChymZWI/Z1XiilnI
 ror5YAfJ4wXlKtImnq8WyWptlZsum8nz/ouB5RHf7Yf5ie5EvQ1q1oXs1MpLDrpazPar
 ojAw==
X-Gm-Message-State: AOAM533p+aQZdEogF92aEXcnwOBQ7fuyOJRmxR+k91oLFOL+fGQFL8pz
 ZoLGYNXcaUgJraFWfdfexyg=
X-Google-Smtp-Source: ABdhPJwnAQpQT/2sEz7viSMJ7t/+2zmdWLWtmPK9rh67Szq5oWv4lL/lZy1xAEGpP06+iHH3w5wUNg==
X-Received: by 2002:a05:600c:4a19:: with SMTP id
 c25mr3844668wmp.125.1624536148907; 
 Thu, 24 Jun 2021 05:02:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c12sm2972417wrw.46.2021.06.24.05.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:02:27 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:04:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 21/27] drm/tegra: Don't set struct
 drm_device.irq_enabled
Message-ID: <YNR0zpVzMxQauzet@orome.fritz.box>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-22-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ENqalYeZVO/RAx3+"
Content-Disposition: inline
In-Reply-To: <20210624072916.27703-22-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
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
Cc: hamohammed.sa@gmail.com, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 linux@armlinux.org.uk, mihail.atanassov@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, Daniel Vetter <daniel.vetter@ffwll.ch>,
 rodrigosiqueiramelo@gmail.com, laurentiu.palcu@oss.nxp.com,
 matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ENqalYeZVO/RAx3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 09:29:10AM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/drm.c | 7 -------
>  1 file changed, 7 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ENqalYeZVO/RAx3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDUdM4ACgkQ3SOs138+
s6Ed0A/5ASxTJhpMIfL1u/g0kk5pjZX8ukNK72+ftE+sJWJhxDmTGuM+EzcPNaNg
sKT+65FK2YsGeoA5fnN9QKWuUyS+bpExys5n39Aty+YN4tI4CV7CbU9OJeYm9Iru
i+Ziu6gkJl2SYom/+cxuU42UkUDkQkWofYRel+HJZeDMogSRAIhiiQy5/fadGiJc
36fJrXjueiB3EZjkg7CubNsLgy08qblR+sZGpuq4RIc3aVe6j6U8QxHiZ1eA7tMD
ki2Nmub5WThcAUGn/ky+FD9m/yfieoI9sPkVWRpAF0oa6SDp6YO/oPFf2hJzl4jk
HPXABfAWIYFTEzjFkGdRHjOfGgahPAXvwd1ku5zjBuFSH3vM9kNaNRuIQe2Rg9ti
p3+b5RfPlO/1fiVRkuzXwROpjWNW44Y+eVVyee84h813aqYh9OOLJVrmxmrzZ1Xx
mzDTvyZXuxtVb79T4XSkb0LnRw3wrraylMLP1X4/QTqttUBoWgYeKM5MwDgy+6zH
Bx1VWtnjn9NmwEPfRmPpwIQNByNJ2DG/E8wZmEfeqJAEHo1SLOYaBixh9W7DUlWC
e9mZFcD+tYSTurqcg0mS5T1mSPJGyCjcZFP27RkFRSc9JbRAQt2uuKcr1R54mjTh
gAJ6mf8hPIWA8Q6ro+2TgW8p0X/wbPsnZdXjZrTGBsV1QA84k+M=
=pLLR
-----END PGP SIGNATURE-----

--ENqalYeZVO/RAx3+--
