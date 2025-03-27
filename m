Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92582A72EAC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 12:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172C110E324;
	Thu, 27 Mar 2025 11:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PJX7wNb5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697F310E324
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:19:07 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BA6F291;
 Thu, 27 Mar 2025 12:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743074234;
 bh=KZO+2Da5kS84MYHDYMQJGZhB4fjPxRyYiXXBr04R47Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PJX7wNb53K94q2jmt1TOLrGl6/QWK6i2witqBGBWb4kjdU/HbaXBebnqyIHMP4kcR
 UgeeJW0e2Xonk6JCcfDfHZJa/1MhSXw2QcbwsBHbpD5hsFuwDNGfWkgtKKC8nhvany
 x33/S9FboOd8MB1FHBaoszIWiVaLtkHDEZp7s3R0=
Message-ID: <b16761e5-be8a-42f6-8fc9-b84455716382@ideasonboard.com>
Date: Thu, 27 Mar 2025 13:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Devarsh Thakkar <devarsht@ti.com>
Cc: praneeth@ti.com, vigneshr@ti.com, aradhya.bhatia@linux.dev,
 s-jain1@ti.com, r-donadkar@ti.com, j-choudhary@ti.com, h-shenoy@ti.com,
 jyri.sarha@iki.fi, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250326145736.3659670-1-devarsht@ti.com>
 <20250326145736.3659670-3-devarsht@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250326145736.3659670-3-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/03/2025 16:57, Devarsh Thakkar wrote:
> SoCs like AM62Lx support cut-down version of K3 DSS where although same
> register space is supported as in other K3 DSS supported SoCs such as
> AM65x, AM62x, AM62Ax but some of the resources such as planes and
> corresponding register spaces are truncated.
> 
> For e.g. AM62Lx has only single VIDL pipeline supported, so corresponding
> register spaces for other video pipelines need to be skipped.
> 
> To add a generic support for future SoCs where one or more video pipelines
> can get truncated from the parent register space, move the video plane
> related information to vid_info struct which will also have a field to
> indicate hardware index of each of the available video planes, so that
> driver only maps and programs those video pipes and skips the unavailable
> ones.
> 
> While at it, also change the num_planes field in the features structure to
> num_vid so that all places in code which use vid_info structure are
> highlighted in the code.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V4:
> - Create vid_info struct only for instantiated planes
> - s/num_planes/num_vids
> - s/vid_lite/is_lite
> - Add hw_id member in vid_info struct and remove is_present
> 
> V2->V3:
> - No change (patch introduced in V3)
> 
>   drivers/gpu/drm/tidss/tidss_crtc.c  |   8 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c | 135 ++++++++++++++++++++--------
>   drivers/gpu/drm/tidss/tidss_dispc.h |  11 ++-
>   drivers/gpu/drm/tidss/tidss_kms.c   |   2 +-
>   drivers/gpu/drm/tidss/tidss_plane.c |   2 +-
>   5 files changed, 114 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index 94f8e3178df5..6db100b81482 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -130,7 +130,7 @@ static void tidss_crtc_position_planes(struct tidss_device *tidss,
>   	    !to_tidss_crtc_state(cstate)->plane_pos_changed)
>   		return;
>   
> -	for (layer = 0; layer < tidss->feat->num_planes; layer++) {
> +	for (layer = 0; layer < tidss->feat->num_vids ; layer++) {
>   		struct drm_plane_state *pstate;
>   		struct drm_plane *plane;
>   		bool layer_active = false;
> @@ -271,9 +271,9 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
>   	 * another videoport, the DSS will report sync lost issues. Disable all
>   	 * the layers here as a work-around.
>   	 */
> -	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++)
> -		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, layer,
> -				       false);
> +	for (u32 layer = 0; layer < tidss->feat->num_vids; layer++)
> +		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport,
> +				       tidss->feat->vid_info[layer].hw_id, false);
>   
>   	dispc_vp_disable(tidss->dispc, tcrtc->hw_videoport);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index cacb5f3d8085..6f0255d65a06 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -103,9 +103,16 @@ const struct dispc_features dispc_k2g_feats = {
>   		},
>   	},
>   
> -	.num_planes = 1,
> -	.vid_name = { "vid1" },
> -	.vid_lite = { false },
> +	.num_vids = 1,
> +
> +	.vid_info = {
> +		{
> +			.name = "vid1",
> +			.is_lite = false,
> +			.hw_id = 0,
> +		},
> +	},
> +
>   	.vid_order = { 0 },
>   };
>   
> @@ -178,11 +185,22 @@ const struct dispc_features dispc_am65x_feats = {
>   		},
>   	},
>   
> -	.num_planes = 2,
> +	.num_vids = 2,
>   	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> -	.vid_name = { "vid", "vidl1" },
> -	.vid_lite = { false, true, },
> -	.vid_order = { 1, 0 },
> +	.vid_info = {
> +		{
> +			.name = "vid",
> +			.is_lite = false,
> +			.hw_id = 0,
> +		},
> +		{
> +			.name = "vidl1",
> +			.is_lite = true,
> +			.hw_id = 1,
> +		},
> +	},
> +
> +	.vid_order = {1, 0},
>   };
>   
>   static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
> @@ -267,9 +285,32 @@ const struct dispc_features dispc_j721e_feats = {
>   			.gamma_type = TIDSS_GAMMA_10BIT,
>   		},
>   	},
> -	.num_planes = 4,
> -	.vid_name = { "vid1", "vidl1", "vid2", "vidl2" },
> -	.vid_lite = { 0, 1, 0, 1, },
> +
> +	.num_vids = 4,
> +
> +	.vid_info = {
> +		{
> +			.name = "vid1",
> +			.is_lite = false,
> +			.hw_id = 0,
> +		},
> +		{
> +			.name = "vidl1",
> +			.is_lite = true,
> +			.hw_id = 1,
> +		},
> +		{
> +			.name = "vid2",
> +			.is_lite = false,
> +			.hw_id = 2,
> +		},
> +		{
> +			.name = "vidl2",
> +			.is_lite = true,
> +			.hw_id = 3,
> +		},
> +	},
> +
>   	.vid_order = { 1, 3, 0, 2 },
>   };
>   
> @@ -315,11 +356,23 @@ const struct dispc_features dispc_am625_feats = {
>   		},
>   	},
>   
> -	.num_planes = 2,
> +	.num_vids = 2,
> +
>   	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> -	.vid_name = { "vid", "vidl1" },
> -	.vid_lite = { false, true, },
> -	.vid_order = { 1, 0 },
> +	.vid_info = {
> +		{
> +			.name = "vid",
> +			.is_lite = false,
> +			.hw_id = 0,
> +		},
> +		{
> +			.name = "vidl1",
> +			.is_lite = true,
> +			.hw_id = 1,
> +		}
> +	},
> +
> +	.vid_order = {1, 0},
>   };
>   
>   const struct dispc_features dispc_am62a7_feats = {
> @@ -369,11 +422,22 @@ const struct dispc_features dispc_am62a7_feats = {
>   		},
>   	},
>   
> -	.num_planes = 2,
> -	/* note: vid is plane_id 0 and vidl1 is plane_id 1 */
> -	.vid_name = { "vid", "vidl1" },
> -	.vid_lite = { false, true, },
> -	.vid_order = { 1, 0 },
> +	.num_vids = 2,
> +
> +	.vid_info = {
> +		{
> +			.name = "vid",
> +			.is_lite = false,
> +			.hw_id = 0,
> +		},
> +		{
> +			.name = "vidl1",
> +			.is_lite = true,
> +			.hw_id = 1,
> +		}
> +	},
> +
> +	.vid_order = {1, 0},
>   };
>   
>   static const u16 *dispc_common_regmap;
> @@ -788,7 +852,8 @@ void dispc_k3_clear_irqstatus(struct dispc_device *dispc, dispc_irq_t clearmask)
>   		if (clearmask & DSS_IRQ_VP_MASK(i))
>   			dispc_k3_vp_write_irqstatus(dispc, i, clearmask);
>   	}
> -	for (i = 0; i < dispc->feat->num_planes; ++i) {
> +
> +	for (i = 0; i < dispc->feat->num_vids; ++i) {
>   		if (clearmask & DSS_IRQ_PLANE_MASK(i))
>   			dispc_k3_vid_write_irqstatus(dispc, i, clearmask);

How did you test this?

With the changes in this patch, the index (i here) can really only be 
used to reference the vid_info array. Any other use is most likely an 
error, like here.

>   	}
> @@ -809,8 +874,8 @@ dispc_irq_t dispc_k3_read_and_clear_irqstatus(struct dispc_device *dispc)
>   	for (i = 0; i < dispc->feat->num_vps; ++i)
>   		status |= dispc_k3_vp_read_irqstatus(dispc, i);
>   
> -	for (i = 0; i < dispc->feat->num_planes; ++i)
> -		status |= dispc_k3_vid_read_irqstatus(dispc, i);
> +	for (i = 0; i < dispc->feat->num_vids; ++i)
> +		status |= dispc_k3_vid_read_irqstatus(dispc, dispc->feat->vid_info[i].hw_id);

I think here and probably in almost all the cases it makes sense to use 
a helper variable "hw_id".

>   
>   	dispc_k3_clear_irqstatus(dispc, status);
>   
> @@ -825,8 +890,8 @@ static dispc_irq_t dispc_k3_read_irqenable(struct dispc_device *dispc)
>   	for (i = 0; i < dispc->feat->num_vps; ++i)
>   		enable |= dispc_k3_vp_read_irqenable(dispc, i);
>   
> -	for (i = 0; i < dispc->feat->num_planes; ++i)
> -		enable |= dispc_k3_vid_read_irqenable(dispc, i);
> +	for (i = 0; i < dispc->feat->num_vids; ++i)
> +		enable |= dispc_k3_vid_read_irqenable(dispc, dispc->feat->vid_info[i].hw_id);
>   
>   	return enable;
>   }
> @@ -849,10 +914,11 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
>   			main_enable |= BIT(i);		/* VP IRQ */
>   		else
>   			main_disable |= BIT(i);		/* VP IRQ */
> +
>   	}
>   
> -	for (i = 0; i < dispc->feat->num_planes; ++i) {
> -		dispc_k3_vid_set_irqenable(dispc, i, mask);
> +	for (i = 0; i < dispc->feat->num_vids; ++i) {
> +		dispc_k3_vid_set_irqenable(dispc, dispc->feat->vid_info[i].hw_id, mask);
>   		if (mask & DSS_IRQ_PLANE_MASK(i))
>   			main_enable |= BIT(i + 4);	/* VID IRQ */

And here.

>   		else
> @@ -861,7 +927,6 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
>   
>   	if (main_enable)
>   		dispc_write(dispc, DISPC_IRQENABLE_SET, main_enable);
> -
>   	if (main_disable)
>   		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
>   
> @@ -2025,7 +2090,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
>   		      const struct drm_plane_state *state,
>   		      u32 hw_videoport)
>   {
> -	bool lite = dispc->feat->vid_lite[hw_plane];
> +	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>   	u32 fourcc = state->fb->format->format;
>   	bool need_scaling = state->src_w >> 16 != state->crtc_w ||
>   		state->src_h >> 16 != state->crtc_h;
> @@ -2096,7 +2161,7 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
>   		       const struct drm_plane_state *state,
>   		       u32 hw_videoport)
>   {
> -	bool lite = dispc->feat->vid_lite[hw_plane];
> +	bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>   	u32 fourcc = state->fb->format->format;
>   	u16 cpp = state->fb->format->cpp[0];
>   	u32 fb_width = state->fb->pitches[0] / cpp;
> @@ -2210,7 +2275,7 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
>   	/* MFLAG_START = MFLAGNORMALSTARTMODE */
>   	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>   
> -	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
> +	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>   		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);

And here.

Maybe there's more, please check each of the cases where the index is used.

  Tomi

>   		u32 thr_low, thr_high;
>   		u32 mflag_low, mflag_high;
> @@ -2226,7 +2291,7 @@ static void dispc_k2g_plane_init(struct dispc_device *dispc)
>   
>   		dev_dbg(dispc->dev,
>   			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
> -			dispc->feat->vid_name[hw_plane],
> +			dispc->feat->vid_info[hw_plane].name,
>   			size,
>   			thr_high, thr_low,
>   			mflag_high, mflag_low,
> @@ -2265,7 +2330,7 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
>   	/* MFLAG_START = MFLAGNORMALSTARTMODE */
>   	REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>   
> -	for (hw_plane = 0; hw_plane < dispc->feat->num_planes; hw_plane++) {
> +	for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>   		u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>   		u32 thr_low, thr_high;
>   		u32 mflag_low, mflag_high;
> @@ -2281,7 +2346,7 @@ static void dispc_k3_plane_init(struct dispc_device *dispc)
>   
>   		dev_dbg(dispc->dev,
>   			"%s: bufsize %u, buf_threshold %u/%u, mflag threshold %u/%u preload %u\n",
> -			dispc->feat->vid_name[hw_plane],
> +			dispc->feat->vid_info[hw_plane].name,
>   			size,
>   			thr_high, thr_low,
>   			mflag_high, mflag_low,
> @@ -2898,8 +2963,8 @@ int dispc_init(struct tidss_device *tidss)
>   	if (r)
>   		return r;
>   
> -	for (i = 0; i < dispc->feat->num_planes; i++) {
> -		r = dispc_iomap_resource(pdev, dispc->feat->vid_name[i],
> +	for (i = 0; i < dispc->feat->num_vids; i++) {
> +		r = dispc_iomap_resource(pdev, dispc->feat->vid_info[i].name,
>   					 &dispc->base_vid[i]);
>   		if (r)
>   			return r;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 086327d51a90..72a0146e57d5 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -46,6 +46,12 @@ struct dispc_features_scaling {
>   	u32 xinc_max;
>   };
>   
> +struct dispc_vid_info {
> +	const char *name; /* Should match dt reg names */
> +	u32 hw_id;
> +	bool is_lite;
> +};
> +
>   struct dispc_errata {
>   	bool i2000; /* DSS Does Not Support YUV Pixel Data Formats */
>   };
> @@ -82,9 +88,8 @@ struct dispc_features {
>   	const char *vpclk_name[TIDSS_MAX_PORTS]; /* Should match dt clk names */
>   	const enum dispc_vp_bus_type vp_bus_type[TIDSS_MAX_PORTS];
>   	struct tidss_vp_feat vp_feat;
> -	u32 num_planes;
> -	const char *vid_name[TIDSS_MAX_PLANES]; /* Should match dt reg names */
> -	bool vid_lite[TIDSS_MAX_PLANES];
> +	u32 num_vids;
> +	struct dispc_vid_info vid_info[TIDSS_MAX_PLANES];
>   	u32 vid_order[TIDSS_MAX_PLANES];
>   };
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index f371518f8697..19432c08ec6b 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -115,7 +115,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>   
>   	const struct dispc_features *feat = tidss->feat;
>   	u32 max_vps = feat->num_vps;
> -	u32 max_planes = feat->num_planes;
> +	u32 max_planes = feat->num_vids;
>   
>   	struct pipe pipes[TIDSS_MAX_PORTS];
>   	u32 num_pipes = 0;
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 116de124bddb..ff71370cad8b 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -200,7 +200,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
>   	struct tidss_plane *tplane;
>   	enum drm_plane_type type;
>   	u32 possible_crtcs;
> -	u32 num_planes = tidss->feat->num_planes;
> +	u32 num_planes = tidss->feat->num_vids;
>   	u32 color_encodings = (BIT(DRM_COLOR_YCBCR_BT601) |
>   			       BIT(DRM_COLOR_YCBCR_BT709));
>   	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |

