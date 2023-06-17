Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F906734344
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 21:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EDC10E055;
	Sat, 17 Jun 2023 19:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABC810E055
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 19:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1687029219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmqt6yb4ErstxdwxN6vUxbNPTZ5Zr6NGJzRsFUvY+v0=;
 b=OOz00nZQdMdd+W7ZBoXpmcmR97VRcm6Dl09QACAoOMdZdGwp4s9b45sCa1oemF92GyHf5O
 Tx2u9VE6o1n45/JodiQtehRsHqnsVKHBcEHK2CERDVpOlQ9HqHyg/MrGDvhC1XO4SBnnad
 /d7zT+NIi02oaTZsIhlGCxPp6CNid/g=
Message-ID: <c70cb3cb326439a5868beb54d720538923f653d1.camel@crapouillou.net>
Subject: Re: [PATCH v2] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
From: Paul Cercueil <paul@crapouillou.net>
To: Sui Jingfeng <suijingfeng@loongson.cn>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 17 Jun 2023 21:13:37 +0200
In-Reply-To: <20230607110650.569522-1-suijingfeng@loongson.cn>
References: <20230607110650.569522-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mercredi 07 juin 2023 =C3=A0 19:06 +0800, Sui Jingfeng a =C3=A9crit=C2=
=A0:
> Otherwise its failed to pass basic compile test on platform without
> REGMAP_MMIO selected by defconfig
>=20
> make -j$(nproc) ARCH=3Dmips CROSS_COMPILE=3Dmips64el-linux-gnuabi64-
>=20
> =C2=A0 SYNC=C2=A0=C2=A0=C2=A0 include/config/auto.conf.cmd
> =C2=A0 Checking missing-syscalls for N32
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 Checking missing-syscalls for O32
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 MODPOST Module.symvers
> ERROR: modpost: "__devm_regmap_init_mmio_clk"
> [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> make: *** [Makefile:1978: modpost] Error 2
>=20
> V2: Order alphabetically
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

The patch looks good to me. But I need an ACK from someone else to
apply to drm-misc-next.

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/ingenic/Kconfig | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ingenic/Kconfig
> b/drivers/gpu/drm/ingenic/Kconfig
> index a53f475d33df..b440e0cdc057 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -9,6 +9,8 @@ config DRM_INGENIC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_PANEL_BRIDGE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_KMS_HELPER
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_GEM_DMA_HELPER
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select REGMAP
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select REGMAP_MMIO
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select VT_HW_CONSOLE_BIND=
ING if FRAMEBUFFER_CONSOLE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option=
 for DRM support for the Ingenic SoCs.

