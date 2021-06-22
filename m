Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128C3B08ED
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBCE6E5A0;
	Tue, 22 Jun 2021 15:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9682C6E59D;
 Tue, 22 Jun 2021 15:26:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2E9031B;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D102D3F718;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 938E46850D7; Tue, 22 Jun 2021 16:26:32 +0100 (BST)
Date: Tue, 22 Jun 2021 16:26:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/22] drm/malidp: Don't set struct
 drm_device.irq_enabled
Message-ID: <20210622152632.647akpp5nqcdfozk@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622141002.11590-7-tzimmermann@suse.de>
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
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 04:09:46PM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in malidp.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index de59f3302516..78d15b04b105 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -847,8 +847,6 @@ static int malidp_bind(struct device *dev)
>  	if (ret < 0)
>  		goto irq_init_fail;
>  
> -	drm->irq_enabled = true;
> -
>  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to initialise vblank\n");
> @@ -874,7 +872,6 @@ static int malidp_bind(struct device *dev)
>  vblank_fail:
>  	malidp_se_irq_fini(hwdev);
>  	malidp_de_irq_fini(hwdev);
> -	drm->irq_enabled = false;
>  irq_init_fail:
>  	drm_atomic_helper_shutdown(drm);
>  	component_unbind_all(dev, drm);
> @@ -909,7 +906,6 @@ static void malidp_unbind(struct device *dev)
>  	drm_atomic_helper_shutdown(drm);
>  	malidp_se_irq_fini(hwdev);
>  	malidp_de_irq_fini(hwdev);
> -	drm->irq_enabled = false;
>  	component_unbind_all(dev, drm);
>  	of_node_put(malidp->crtc.port);
>  	malidp->crtc.port = NULL;
> -- 
> 2.32.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
