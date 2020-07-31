Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11060234176
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0D6EA18;
	Fri, 31 Jul 2020 08:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146B86EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B3116FB03;
 Fri, 31 Jul 2020 10:46:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vohb_geD2LhT; Fri, 31 Jul 2020 10:46:25 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4408F4537D; Fri, 31 Jul 2020 10:46:25 +0200 (CEST)
Date: Fri, 31 Jul 2020 10:46:25 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v9 1/5] drm/imx: compile imx directory by default
Message-ID: <20200731084625.GA12560@bogon.m.sigxcpu.org>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
 <20200731081836.3048-2-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731081836.3048-2-laurentiu.palcu@oss.nxp.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 lukas@mntmn.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 31, 2020 at 11:18:29AM +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> =

> Currently the drm/imx/ directory is compiled only if DRM_IMX is set. Addi=
ng a
> new IMX related IP in the same directory would need DRM_IMX to be set, wh=
ich would
> bring in also IPUv3 core driver...
> =

> The current patch would allow adding new IPs in the imx/ directory withou=
t needing
> to set DRM_IMX.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2f31579f91d4..81569009f884 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -100,7 +100,7 @@ obj-$(CONFIG_DRM_MSM) +=3D msm/
>  obj-$(CONFIG_DRM_TEGRA) +=3D tegra/
>  obj-$(CONFIG_DRM_STM) +=3D stm/
>  obj-$(CONFIG_DRM_STI) +=3D sti/
> -obj-$(CONFIG_DRM_IMX) +=3D imx/
> +obj-y 			+=3D imx/
>  obj-$(CONFIG_DRM_INGENIC) +=3D ingenic/
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek/
>  obj-$(CONFIG_DRM_MESON)	+=3D meson/
> -- =

> 2.23.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
