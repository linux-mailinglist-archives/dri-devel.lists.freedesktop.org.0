Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBLvCjxRemnk5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:11:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D7A78B3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1683610E754;
	Wed, 28 Jan 2026 18:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qcq7Fqk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCAA10E754
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 18:11:04 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5BD2C581;
 Wed, 28 Jan 2026 19:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769623826;
 bh=EMvDSrhLuJYUdTt6x5YZzNaZ5Ae30vVVs3RJ1+GHQ7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qcq7Fqk8tFogFaa1gePWNLDgONDKPHtXc8LhrdeHuIYcKDJ0uGyg6M/PdJ4doFD/W
 FcXymOgG3nC9wZV5D1agQgOpocVMQARjvte5dR71hBImv/hMGmkAfFV/lTKkcvhkz5
 XxNvyvFpPV7BQV3PQppY65gm2PoVHzjt4z+VzXiY=
Date: Wed, 28 Jan 2026 20:11:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v8 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
Message-ID: <20260128181101.GE3225981@killaraus>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
 <20260128-xilinx-formats-v8-9-9ea8adb70269@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-xilinx-formats-v8-9-9ea8adb70269@ideasonboard.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BA4D7A78B3
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:25:34PM +0200, Tomi Valkeinen wrote:
> Add support for Y8 and Y10_P32 formats. We also need to add new csc
> matrices for the y-only formats.
> 
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 1dc77f2e4262..57bb6d1dd10a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y8,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
> +		.swap		= false,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y10_P32,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>  	},
>  };
>  
> @@ -697,6 +707,17 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
>  	0x0, 0x1800, 0x1800
>  };
>  
> +/* In Y-only mode the single Y channel is on the third column  */
> +static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +};
> +
> +static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
> +	0x0, 0x0, 0x0
> +};
> +
>  /**
>   * zynqmp_disp_blend_set_output_format - Set the output format of the blender
>   * @disp: Display controller
> @@ -846,7 +867,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
>  				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
>  				val);
>  
> -	if (layer->drm_fmt->is_yuv) {
> +	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
> +	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
> +		coeffs = csc_sdtv_to_rgb_yonly_matrix;
> +		offsets = csc_sdtv_to_rgb_yonly_offsets;
> +	} else if (layer->drm_fmt->is_yuv) {
>  		coeffs = csc_sdtv_to_rgb_matrix;
>  		offsets = csc_sdtv_to_rgb_offsets;
>  	} else {

-- 
Regards,

Laurent Pinchart
