Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD199EB979
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 19:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596EE10E153;
	Tue, 10 Dec 2024 18:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="LZELpwG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3F10E153
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 18:40:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733856018; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eLJVeQYFPMFmIItBqw+iC3duBThTFKhy7qlLZqlBdIU+QgFxFRfrjF5IP8IoeUjJLJlIeIagNF4wBbn6cTCfihdaenCWHQfWPIEEWhqsABEYYGoxuChoTUuaWDv9sDTwId9YDeW2H7yPFSmw5b4zBYkN/6s/5QF2EGrdhe4shaw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733856018;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=S6TU7l55Y0mdZ5Q3U4WL8dWps5L9M05F3suGGbIWtgw=; 
 b=hTLXIKCaSIFGbIMfggLJZhU7NVYsgfCzxi/uJ6Ui4OlECzwHsZYl6nhw6chgxOsMaGd4f0qLM8D8OvpmZrSi4ntJdzPdgH3t9LQBuAdPNUAkU0zsvUwsYmTFuSsn2JuDaDzaPgm+Dlou7lVxKKUt8d9LRsn1dMwWr6lKjdEQX5M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733856018; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=S6TU7l55Y0mdZ5Q3U4WL8dWps5L9M05F3suGGbIWtgw=;
 b=LZELpwG5YCjb+W0kzThoZ7BmxJl1jkkHLx8U5ntvirtepwV6dLYCkEHPcf+wQ4Ye
 HIAkjXa8s+snIddoOFA0SLqdENEE7uw368T1a62qyAQjo4Nh0Ha4Dqa0pnnoRn5BxTb
 K2BcZD5DA49FKQYAbt39eq1FPMNUv/x5hfwAnCkE=
Received: by mx.zohomail.com with SMTPS id 1733856016248872.700989510731;
 Tue, 10 Dec 2024 10:40:16 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com
Subject: Re: [PATCH v5 05/18] drm/rockchip: vop2: Set AXI id for rk3588
Date: Tue, 10 Dec 2024 13:40:14 -0500
Message-ID: <5839604.DvuYhMxLoT@trenzalore>
In-Reply-To: <20241209122943.2781431-9-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-9-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hi Andy,

On Monday, 9 December 2024 07:29:18 EST Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> There are two AXI bus in vop2, windows attached on the same bus must
> have a unique channel YUV and RGB channel ID.
> 
> The default IDs will conflict with each other on the rk3588, so they
> need to be reassigned.
> 
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Derek Foreman <derek.foreman@collabora.com>
> 
> ---
> 
> Changes in v5:
> - Added in V5
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  9 +++++++
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 26 +++++++++++++++++++-
>  3 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c index
> dc4edd65bc9e..8b9ca046eeeb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1426,6 +1426,12 @@ static void vop2_plane_atomic_update(struct drm_plane
> *plane, &fb->format->format,
>  		afbc_en ? "AFBC" : "", &yrgb_mst);
> 
> +	if (vop2->data->soc_id > 3568) {

Shouldn't this be done only for rk3588, as specified in the comments below ? 
The test we did before showed that it is failing on rk3576 and 3576 is > 3588.

I suggest

	if (vop2->data->soc_id == 3588) {

Regards,
Detlev

> +		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data-
>axi_bus_id);
> +		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data-
>axi_yrgb_r_id);
> +		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data-
>axi_uv_r_id);
> +	}
> +
>  	if (vop2_cluster_window(win))
>  		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, 
half_block_en);
> 
> @@ -3354,6 +3360,10 @@ static struct reg_field
> vop2_cluster_regs[VOP2_WIN_MAX_REG] = { [VOP2_WIN_Y2R_EN] =
> REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 8, 8),
>  	[VOP2_WIN_R2Y_EN] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 9, 9),
>  	[VOP2_WIN_CSC_MODE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 10, 11),
> +	[VOP2_WIN_AXI_YRGB_R_ID] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL2, 0, 
3),
> +	[VOP2_WIN_AXI_UV_R_ID] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL2, 5, 8),
> +	/* RK3588 only, reserved bit on rk3568*/
> +	[VOP2_WIN_AXI_BUS_ID] = REG_FIELD(RK3568_CLUSTER_CTRL, 13, 13),
> 
>  	/* Scale */
>  	[VOP2_WIN_SCALE_YRGB_X] = 
REG_FIELD(RK3568_CLUSTER_WIN_SCL_FACTOR_YRGB, 0,
> 15), @@ -3446,6 +3456,10 @@ static struct reg_field
> vop2_esmart_regs[VOP2_WIN_MAX_REG] = { [VOP2_WIN_YMIRROR] =
> REG_FIELD(RK3568_SMART_CTRL1, 31, 31),
>  	[VOP2_WIN_COLOR_KEY] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 0, 
29),
>  	[VOP2_WIN_COLOR_KEY_EN] = REG_FIELD(RK3568_SMART_COLOR_KEY_CTRL, 
31, 31),
> +	[VOP2_WIN_AXI_YRGB_R_ID] = REG_FIELD(RK3568_SMART_CTRL1, 4, 8),
> +	[VOP2_WIN_AXI_UV_R_ID] = REG_FIELD(RK3568_SMART_CTRL1, 12, 16),
> +	/* RK3588 only, reserved register on rk3568 */
> +	[VOP2_WIN_AXI_BUS_ID] = REG_FIELD(RK3588_SMART_AXI_CTRL, 1, 1),
> 
>  	/* Scale */
>  	[VOP2_WIN_SCALE_YRGB_X] = 
REG_FIELD(RK3568_SMART_REGION0_SCL_FACTOR_YRGB,
> 0, 15), diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h index
> 8786c2ba48df..0a3b22e8d14e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -78,6 +78,9 @@ enum vop2_win_regs {
>  	VOP2_WIN_COLOR_KEY,
>  	VOP2_WIN_COLOR_KEY_EN,
>  	VOP2_WIN_DITHER_UP,
> +	VOP2_WIN_AXI_BUS_ID,
> +	VOP2_WIN_AXI_YRGB_R_ID,
> +	VOP2_WIN_AXI_UV_R_ID,
> 
>  	/* scale regs */
>  	VOP2_WIN_SCALE_YRGB_X,
> @@ -149,6 +152,10 @@ struct vop2_win_data {
>  	unsigned int layer_sel_id;
>  	uint64_t feature;
> 
> +	uint8_t axi_bus_id;
> +	uint8_t axi_yrgb_r_id;
> +	uint8_t axi_uv_r_id;
> +
>  	unsigned int max_upscale_factor;
>  	unsigned int max_downscale_factor;
>  	const u8 dly[VOP2_DLY_MODE_MAX];
> @@ -319,6 +326,7 @@ enum dst_factor_mode {
> 
>  #define RK3568_CLUSTER_WIN_CTRL0		0x00
>  #define RK3568_CLUSTER_WIN_CTRL1		0x04
> +#define RK3568_CLUSTER_WIN_CTRL2		0x08
>  #define RK3568_CLUSTER_WIN_YRGB_MST		0x10
>  #define RK3568_CLUSTER_WIN_CBR_MST		0x14
>  #define RK3568_CLUSTER_WIN_VIR			0x18
> @@ -341,6 +349,7 @@ enum dst_factor_mode {
>  /* (E)smart register definition, offset relative to window base */
>  #define RK3568_SMART_CTRL0			0x00
>  #define RK3568_SMART_CTRL1			0x04
> +#define RK3588_SMART_AXI_CTRL			0x08
>  #define RK3568_SMART_REGION0_CTRL		0x10
>  #define RK3568_SMART_REGION0_YRGB_MST		0x14
>  #define RK3568_SMART_REGION0_CBR_MST		0x18
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c index
> f7d3350594fa..37c65138012d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -395,7 +395,7 @@ static const struct vop2_video_port_data
> rk3588_vop_video_ports[] = { * AXI1 is a read only bus.
>   *
>   * Every window on a AXI bus must assigned two unique
> - * read id(yrgb_id/uv_id, valid id are 0x1~0xe).
> + * read id(yrgb_r_id/uv_r_id, valid id are 0x1~0xe).
>   *
>   * AXI0:
>   * Cluster0/1, Esmart0/1, WriteBack
> @@ -415,6 +415,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .layer_sel_id = 0,
>  		.supported_rotations = DRM_MODE_ROTATE_90 | 
DRM_MODE_ROTATE_270 |
>  				       DRM_MODE_REFLECT_X | 
DRM_MODE_REFLECT_Y,
> +		.axi_bus_id = 0,
> +		.axi_yrgb_r_id = 2,
> +		.axi_uv_r_id = 3,
>  		.max_upscale_factor = 4,
>  		.max_downscale_factor = 4,
>  		.dly = { 4, 26, 29 },
> @@ -431,6 +434,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
> DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_PRIMARY,
> +		.axi_bus_id = 0,
> +		.axi_yrgb_r_id = 6,
> +		.axi_uv_r_id = 7,
>  		.max_upscale_factor = 4,
>  		.max_downscale_factor = 4,
>  		.dly = { 4, 26, 29 },
> @@ -446,6 +452,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
> DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_PRIMARY,
> +		.axi_bus_id = 1,
> +		.axi_yrgb_r_id = 2,
> +		.axi_uv_r_id = 3,
>  		.max_upscale_factor = 4,
>  		.max_downscale_factor = 4,
>  		.dly = { 4, 26, 29 },
> @@ -461,6 +470,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .supported_rotations = DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270 |
> DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_PRIMARY,
> +		.axi_bus_id = 1,
> +		.axi_yrgb_r_id = 6,
> +		.axi_uv_r_id = 7,
>  		.max_upscale_factor = 4,
>  		.max_downscale_factor = 4,
>  		.dly = { 4, 26, 29 },
> @@ -475,6 +487,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .layer_sel_id = 2,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.axi_bus_id = 0,
> +		.axi_yrgb_r_id = 0x0a,
> +		.axi_uv_r_id = 0x0b,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 23, 45, 48 },
> @@ -488,6 +503,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .layer_sel_id = 3,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.axi_bus_id = 0,
> +		.axi_yrgb_r_id = 0x0c,
> +		.axi_uv_r_id = 0x01,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 23, 45, 48 },
> @@ -501,6 +519,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .layer_sel_id = 6,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.axi_bus_id = 1,
> +		.axi_yrgb_r_id = 0x0a,
> +		.axi_uv_r_id = 0x0b,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 23, 45, 48 },
> @@ -514,6 +535,9 @@ static const struct vop2_win_data rk3588_vop_win_data[]
> = { .layer_sel_id = 7,
>  		.supported_rotations = DRM_MODE_REFLECT_Y,
>  		.type = DRM_PLANE_TYPE_OVERLAY,
> +		.axi_bus_id = 1,
> +		.axi_yrgb_r_id = 0x0c,
> +		.axi_uv_r_id = 0x0d,
>  		.max_upscale_factor = 8,
>  		.max_downscale_factor = 8,
>  		.dly = { 23, 45, 48 },




