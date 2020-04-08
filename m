Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AF1A2A41
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5E26EAE7;
	Wed,  8 Apr 2020 20:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36CF6EAE7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:22:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DA9F780516;
 Wed,  8 Apr 2020 22:22:32 +0200 (CEST)
Date: Wed, 8 Apr 2020 22:22:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: David Lu <david.lu@bitland.com.cn>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-n16: extend LCD support list
Message-ID: <20200408202231.GC612@ravnborg.org>
References: <20200324075734.1802-1-david.lu@bitland.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324075734.1802-1-david.lu@bitland.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=iKCrp2iyAAAA:8
 a=e5mUnYsNAAAA:8 a=he46yxwc6qcuFeRiDoMA:9 a=CjuIK1q_8ugA:10
 a=6dnM-gFdnRAg0d82BWIM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, jungle.chiang@bitland.com.cn,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David.

On Tue, Mar 24, 2020 at 03:57:34PM +0800, David Lu wrote:
> Add entries for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel.
> 
> Signed-off-by: David Lu <david.lu@bitland.com.cn>
> Change-Id: I5b1cef259de5fb498220dcc47baa035083c41667
Deleted Change-Id, and updated subject as suggested by Nicholas.
Applied to drm-misc-next and pushed out.

	Sam

> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 48a164257d18..f89861c8598a 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -696,6 +696,34 @@ static const struct panel_desc auo_b101uan08_3_desc = {
>  	.init_cmds = auo_b101uan08_3_init_cmd,
>  };
>  
> +static const struct drm_display_mode boe_tv105wum_nw0_default_mode = {
> +	.clock = 159260,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 80,
> +	.hsync_end = 1200 + 80 + 24,
> +	.htotal = 1200 + 80 + 24 + 60,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 10,
> +	.vsync_end = 1920 + 10 + 2,
> +	.vtotal = 1920 + 10 + 2 + 14,
> +	.vrefresh = 60,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc boe_tv105wum_nw0_desc = {
> +	.modes = &boe_tv105wum_nw0_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 141,
> +		.height_mm = 226,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = boe_init_cmd,
> +};
> +
>  static int boe_panel_get_modes(struct drm_panel *panel,
>  			       struct drm_connector *connector)
>  {
> @@ -834,6 +862,9 @@ static const struct of_device_id boe_of_match[] = {
>  	{ .compatible = "auo,b101uan08.3",
>  	  .data = &auo_b101uan08_3_desc
>  	},
> +	{ .compatible = "boe,tv105wum-nw0",
> +	  .data = &boe_tv105wum_nw0_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> -- 
> 2.24.1
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
