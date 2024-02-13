Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B43852A7C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43BD10E2C7;
	Tue, 13 Feb 2024 08:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="uFon58O1";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="T0PjJTTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB210E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D6A6AFB06;
 Tue, 13 Feb 2024 09:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811538; bh=KRuuw7YzU7/CW38+mXRnIoY4ogV8wheL/KaqE7yovF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFon58O1DvfPx32KLoXpPxq4qeeHDGEBv8gniIc2KoFx93xU61/OkOxtb0pxN7/Ti
 2eVnPfUU+V8jqxIUP8aG+Xu/GPxQ5mFFQtiMJPHlP29VsyZSCK8Oxpfo7AG7yq5/1C
 Q1SpvL6Zp6Xumt+KlhpVkOnNDb3A/r+nEgrWKI/IaXRxTlBoJIybl2UuFtzYavQwyh
 1r2yWNnPLTKIagBbHAOn/ICBvcQCQd058F0fT9ALftdcZNn+3dPTt1Zae9EExRuuGe
 oNNOrzvm7C7qzHWMv4YCFV2F6hmF62hqLepyAcKHPaQWXdjGKsu3VIj6RzcSP9Eg+f
 rCzCGMJJ1iWEA==
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdovbXp8vkH5; Tue, 13 Feb 2024 09:05:36 +0100 (CET)
Date: Tue, 13 Feb 2024 09:05:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707811536; bh=KRuuw7YzU7/CW38+mXRnIoY4ogV8wheL/KaqE7yovF0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T0PjJTTCKwcEYxG9bEmKTWBhYhtb6RilEBkrOc0r3g1HzDvG7AZWWhJk3vJJMwbG2
 +VOBuz8jpvi64umw4MDceS409oBwx043J2SrfkBnulQ4oI/4eH1cfIYkR5UdqKM1QB
 xhIB0Aqa2YeARY95cJRrO8UiVYc+hzSHELyyJNpab8xxHMUSntGQAlvXptd6hMbLKQ
 3+dIuQWYG15rFGjEQhzizsMHk4cJoOd/DghYrgd1wR7D6voA1btw9iE10kk2Appa/R
 QAYJY1eslbduDQRlkU/yBlN5a/hRDPBxe+nAZiakbu+pedWvWcD4ejeoOVt700mGZB
 ZnSnDAoptc3LA==
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/7] drm/panel: st7703: Add Panel Rotation Support
Message-ID: <ZcsizkRuBPdmG_Qy@qwark.sigxcpu.org>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
 <20240212184950.52210-5-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212184950.52210-5-macroalpha82@gmail.com>
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

Hi,
On Mon, Feb 12, 2024 at 12:49:47PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for panel rotation to ST7703 based devices.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 939ba05c9b58..a3e142f156d5 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -62,6 +62,7 @@ struct st7703 {
>  
>  	struct dentry *debugfs;
>  	const struct st7703_panel_desc *desc;
> +	enum drm_panel_orientation orientation;
>  };
>  
>  struct st7703_panel_desc {
> @@ -743,12 +744,20 @@ static int st7703_get_modes(struct drm_panel *panel,
>  	return 1;
>  }
>  
> +static enum drm_panel_orientation st7703_get_orientation(struct drm_panel *panel)
> +{
> +	struct st7703 *st7703 = panel_to_st7703(panel);
> +
> +	return st7703->orientation;
> +}
> +
>  static const struct drm_panel_funcs st7703_drm_funcs = {
>  	.disable   = st7703_disable,
>  	.unprepare = st7703_unprepare,
>  	.prepare   = st7703_prepare,
>  	.enable	   = st7703_enable,
>  	.get_modes = st7703_get_modes,
> +	.get_orientation = st7703_get_orientation,
>  };
>  
>  static int allpixelson_set(void *data, u64 val)
> @@ -817,6 +826,10 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
>  		return dev_err_probe(dev, PTR_ERR(ctx->iovcc),
>  				     "Failed to request iovcc regulator\n");
>  
> +	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &ctx->orientation);
> +	if (ret < 0)
> +		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
> +
>  	drm_panel_init(&ctx->panel, dev, &st7703_drm_funcs,
>  		       DRM_MODE_CONNECTOR_DSI);

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Cheers,
 -- Guido

>  
> -- 
> 2.34.1
> 
