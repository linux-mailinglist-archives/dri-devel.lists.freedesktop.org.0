Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B6614BEC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 14:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7381110E270;
	Tue,  1 Nov 2022 13:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DDE10E3CE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 13:41:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oprWS-0007ZC-EL; Tue, 01 Nov 2022 14:41:44 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oprWS-001geW-5m; Tue, 01 Nov 2022 14:41:43 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1oprWQ-0009cc-BU; Tue, 01 Nov 2022 14:41:42 +0100
Message-ID: <f8f5479739acd3bded9f06f8678ca42b77a0a0ef.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: Kconfig: Remove duplicated 'select
 DRM_KMS_HELPER' line
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Nov 2022 14:41:42 +0100
In-Reply-To: <20221009023527.3669647-1-victor.liu@nxp.com>
References: <20221009023527.3669647-1-victor.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: tzimmermann@suse.de, s.hauer@pengutronix.de, linux-imx@nxp.com,
 kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On So, 2022-10-09 at 10:35 +0800, Liu Ying wrote:
> A duplicated line 'select DRM_KMS_HELPER' was introduced in Kconfig file
> by commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option"),
> so remove it.
>=20
> Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> =C2=A0drivers/gpu/drm/imx/Kconfig | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 975de4ff7313..fd5b2471fdf0 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -4,7 +4,6 @@ config DRM_IMX
> =C2=A0	select DRM_KMS_HELPER
> =C2=A0	select VIDEOMODE_HELPERS
> =C2=A0	select DRM_GEM_DMA_HELPER
> -	select DRM_KMS_HELPER
> =C2=A0	depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
> =C2=A0	depends on IMX_IPUV3_CORE
> =C2=A0	help

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

and pushed to drm-misc-fixes.

regards
Philipp
