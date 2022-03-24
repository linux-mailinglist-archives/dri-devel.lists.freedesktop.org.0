Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0044E63A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 13:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73F710E977;
	Thu, 24 Mar 2022 12:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0C10E977
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 12:51:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0DDD23200F72;
 Thu, 24 Mar 2022 08:51:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 08:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=aWC+KLJ/QqIPERdjUhA4LBP2Tm/D1WXxZnjiQ0
 EPcew=; b=ieUTR1YmqzB4Pemnlmi0V/QXqIRYmRNHze63/oK623/C+HLpzDE2lt
 dtesLI3M3dFYurnDIe0VX1b/Rwmoe1j5oGJXRQdsx5QpCrXmYaf7S+NDa0dS42RG
 4qOB923KRyvNoq3+hr2ztvID1LTbRvH4MZfPFklKJpDSpJs8hcORFb0g9Aqv0YsN
 B4OskrAy3/dMht4SSAN81wCaZqP3TH96FKrfde65Um/kMVidxYIQvPXMH6KxpX6u
 l9LYANF4ularOBwSftZ2J1JEUXuFIxlJXJavfAvrid/JckHeb2D0+ZjVLg83UHL5
 8MsdOJkW6ajmeBEHA+YYHQpdMhwUD8Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aWC+KLJ/QqIPERdjU
 hA4LBP2Tm/D1WXxZnjiQ0EPcew=; b=YY6Lh1sQlX8ytSrGIPRgnRPDivUFCHfo0
 w9YawLeQZLWNePOuNOxDDmkCoFsK2lu+piRj1YGLszu02aYvzDkr0RdQFZlwEz5u
 sJKcwX2rhhOFSjqfHVdUu2BjV/Ljm4Qn88MHdnbm40jfk4bEtSuP+CZ8gL2gyHdZ
 SdL2hAzxE5YUi8LnDKcUppa1Le7Mm7jKw2TD7+s7Ok/cVBWAykq8xy/cXyTz1eUc
 wkSfizk1rIU+MYO3ZyDeE06YOiG5EZvAW9CmEHMZgSG8NQg87esg1Zv0K08ryLc6
 MJoWFM24K9bZleYOtb9H7NoCIjD+OgDqrKF38wAR2eDhk/SePo72g==
X-ME-Sender: <xms:UGk8YgZ8tqIA0aVevueCO0fU5PhZiLdNpcVlKdyV3NuLnSPIYMKqtw>
 <xme:UGk8YrZOngzdK3QqFOgPC2DJP112vbUTX-gdlPsrBEZhFLIHJpV6YjYJ2FQtzkTgT
 e7tvJR9OOKpeBzdpsE>
X-ME-Received: <xmr:UGk8Yq9fR_UbjrEKUVGya8hdYeeIE3bzmruieKX1i173agFgtuQOnMd7Ubu0283Q-m_Vt4ABG8a3w2hkpFWgzQNcsPn8jLmhRmIRCE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UGk8YqpjksuN7xvz5sEIcZCkqvPbStTS3tjT_1lbO8SfLdusoEG0Aw>
 <xmx:UGk8Yrrv2rthS2TTYK82X-5cDo9Nmowi8QBBiSKKRBFC6O5uZy1BDA>
 <xmx:UGk8YoTK93tdydxeqsnbt9u3DLe4s9YurI4vKGMYTDGX3fQane7WHA>
 <xmx:UGk8Ysfuctt2exq-kztrDUoODO2NH8r8GnME39A5zqy4R-DrPNqPMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 08:51:27 -0400 (EDT)
Date: Thu, 24 Mar 2022 13:51:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH -next] drm/vc4: Fix build error when CONFIG_DRM_VC4=y &&
 CONFIG_RASPBERRYPI_FIRMWARE=m
Message-ID: <20220324125126.bycrcx7b2j76xagd@houat>
References: <20220324072542.1238122-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u4tiddmcamrazvhr"
Content-Disposition: inline
In-Reply-To: <20220324072542.1238122-1-zhengbin13@huawei.com>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tangyizhou@huawei.com,
 limingming.li@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u4tiddmcamrazvhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 03:25:42PM +0800, Zheng Bin wrote:
> If CONFIG_DRM_VC4=3Dy, CONFIG_RASPBERRYPI_FIRMWARE=3Dm, CONFIG_COMPILE_TE=
ST=3Dn,
> bulding fails:
>=20
> drivers/gpu/drm/vc4/vc4_drv.o: In function `vc4_drm_bind':
> vc4_drv.c:(.text+0x320): undefined reference to `rpi_firmware_get'
> vc4_drv.c:(.text+0x320): relocation truncated to fit: R_AARCH64_CALL26 ag=
ainst undefined symbol `rpi_firmware_get'
> vc4_drv.c:(.text+0x34c): undefined reference to `rpi_firmware_property'
> vc4_drv.c:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL26 ag=
ainst undefined symbol `rpi_firmware_property'
> vc4_drv.c:(.text+0x354): undefined reference to `rpi_firmware_put'
> vc4_drv.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 ag=
ainst undefined symbol `rpi_firmware_put'
>=20
> Make DRM_VC4 depends on RASPBERRYPI_FIRMWARE to fix this.
>=20
> Fixes: c406ad5e4a85 ("drm/vc4: Notify the firmware when DRM is in charge")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/vc4/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index de3424fed2fc..640907945b5b 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_VC4
>  	tristate "Broadcom VC4 Graphics"
> -	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
> +	depends on ((ARCH_BCM || ARCH_BCM2835) && \
> +		    RASPBERRYPI_FIRMWARE) || COMPILE_TEST
>  	depends on DRM
>  	depends on SND && SND_SOC
>  	depends on COMMON_CLK

Wouldn't it make more sense to add it as an additional depends on there?
It doesn't look related to the architecture, and we'll still have that
dependency for COMPILE_TEST.

Maxime

--u4tiddmcamrazvhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjxpTgAKCRDj7w1vZxhR
xZWMAP4trCaIrBddC/7hYw+ymxIe51WRUWaq0AxzoIR5KPrIzQEA+s/qi9bCpsEo
1D0WWfBORkna8n4LKVscBPQYWUfWOQs=
=Lko9
-----END PGP SIGNATURE-----

--u4tiddmcamrazvhr--
