Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D9E4E73E9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF08710E70A;
	Fri, 25 Mar 2022 13:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30010E70A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 13:05:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A222A5C0200;
 Fri, 25 Mar 2022 09:05:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 25 Mar 2022 09:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Idy/YwK8Gz35JVHlk1OJlpdd3YjWzocHKKLo63
 P4k+M=; b=S+A/SPYoZoZmYkUUHacMFVfp8njh6gNXVmftAtC+yPunyT9oMr74dg
 TNtdS9U0Jc2X+vrbgHUF+oHln6CGMBn1vZfihOv4cfWFn+ujT8sG/ds48FS3lz0Z
 1JTxcrUYbZXABMYRK9B5VTpPkTvwyB5edyzA7TGW6AcLxaMEbKDULoeeKYQtN0cs
 2431QaNMzHx9Ap2uw3rA/zfrNSUzKVLNZlr+EKPcG7Wm6Yp8EvfSsWjALSq5Ofb/
 mJu6E828lrylR3jdbnzxdZNsk8majbeYdwB27temvRpuflH5eXY/0XYcFqQkX3eJ
 fEM4NqEjqpVRf+7Z1gN21TlXtIGTfatg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Idy/YwK8Gz35JVHlk
 1OJlpdd3YjWzocHKKLo63P4k+M=; b=b/2mz8x9Q9REMUu01t2QR67KoMZ0MBhVP
 rW0QGd+0+GmeAzxTM3mJcgI26HHrms2K/X8i/dkoIrGo9EAh87PvzkCdlzU2qFtv
 Y5YbLJA3KNUWVs7FgbUtSL/sZE5t/nZg2WRNG1E2BDTyTZz66AoG6+4kX/7Ve/N+
 cRFPlgae1THL7CdcRJZ/g2Ope5lRRtePDXDdpBOlaEt6HbVAne7iylTpubgsB9hh
 F5NWH2Jmy4g2M50WjnORppkSo0L6KYyHwUEBQvVnCg5KzXyo+wnD3AfB8l/FEG/T
 s3R2jns2X1LgZOVy+5eUoUuEDX2n7TsomSjOyCN8FgNDVIBhte6VQ==
X-ME-Sender: <xms:J749Yufx9XzPE7PtRL2Ck0ZFXZyjvZSU8OxV63tQSxIj1erX7t6hlQ>
 <xme:J749YoOl98Y4z_XdbLczoA5I5BDNPTBQC8dsBNtFpmTZTXmEdB4nnDYMPriwllp5C
 mFio7_2q597SNjDrso>
X-ME-Received: <xmr:J749YviCSVyih9zUDvFf_HdK0OaT7r_eUWcLIg2AhOvH4PDk-4kmJFOb2cjlYMVQe_ee97lubQNe22qCEIR8YG6t-F9BYBRxmiPJFdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J749Yr__emgP0n8AOMItzUEQ9hrBuOU-kWA8NVncIKQoDvnjquCVlg>
 <xmx:J749YqtCfKAS2JclBb13t7f6mT4PJHG4Jf2hbMjNrixFM_VSPFMSaA>
 <xmx:J749YiGhWDkW-VH0oNqu4LRyu4qIadMM6oNio6ygOj94L1h6eS3pJw>
 <xmx:KL49YsWUtaL2lnwD5jce_KxEasDOWPqQObGXuaT_JoOj9o_m-t9vmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 09:05:42 -0400 (EDT)
Date: Fri, 25 Mar 2022 14:05:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH v2 -next] drm/vc4: Fix build error when CONFIG_DRM_VC4=y
 && CONFIG_RASPBERRYPI_FIRMWARE=m
Message-ID: <20220325130541.tjxq4kjgmkaz32en@houat>
References: <20220325021831.2812735-1-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cktuawm74fajoliw"
Content-Disposition: inline
In-Reply-To: <20220325021831.2812735-1-zhengbin13@huawei.com>
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
 dri-devel@lists.freedesktop.org, tangyizhou@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cktuawm74fajoliw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 25, 2022 at 10:18:31AM +0800, Zheng Bin wrote:
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
> Make DRM_VC4 depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST to fix this.
>=20
> Fixes: c406ad5e4a85 ("drm/vc4: Notify the firmware when DRM is in charge")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
> v2: follow Maxime's advise, add RASPBERRYPI_FIRMWARE as an additional dep=
ends
>  drivers/gpu/drm/vc4/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index de3424fed2fc..92d74ba7c449 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -2,6 +2,7 @@
>  config DRM_VC4
>  	tristate "Broadcom VC4 Graphics"
>  	depends on ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST
> +	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST

Why do we need the || COMPILE_TEST here?

The rpi_firmware_get, _property and _put functions aren't define if
RASPBERRYPI_FIRMWARE, so we need that dependency every time, even if
COMPILE_TEST is set?

Maxime

--cktuawm74fajoliw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYj2+JQAKCRDj7w1vZxhR
xY08AQDp0dejhhEhJ7JaH2YJjl3qWSNDo+WzUe0l0nhL7tLGwAEAj+WhPDpz4fdF
WnLgjbtukPwaV0djbTrWfhCssxAFpAE=
=EW3z
-----END PGP SIGNATURE-----

--cktuawm74fajoliw--
