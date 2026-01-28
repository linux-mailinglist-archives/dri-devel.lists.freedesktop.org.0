Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMpSGGD/eWm71QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:21:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1DA1238
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C1010E6BA;
	Wed, 28 Jan 2026 12:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gcqvJK7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F357810E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:21:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C9662581;
 Wed, 28 Jan 2026 13:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769602869;
 bh=2axliNpoULUQoNZ2ZhdfpnOgCYY4/D4ykB/mSQ+pVLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcqvJK7jB3w8awg8In8+nCPY+C1RSZy7fkEfAfbbvc/oGOEeBZ+hAEe0XgsuIUfbq
 GoY2ApTTE8q66nKkQMCLX/q9DKkQty3d9PrMmPLHvBZbVA8/0hePJCEzoIZdOVXbiY
 n3Zpkr2tLUqzkamuHdFOZePsdtMDrlJfdp7ORWgc=
Date: Wed, 28 Jan 2026 14:21:44 +0200
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
 Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <20260128122144.GJ2558360@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-2-1e1558adfefc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-xilinx-formats-v7-2-1e1558adfefc@ideasonboard.com>
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
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,m:lumag@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,linaro.org:email,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6DA1DA1238
X-Rspamd-Action: no action

Hi Tomi,

On Mon, Dec 01, 2025 at 02:18:44PM +0200, Tomi Valkeinen wrote:
> Add two new pixel formats:
> 
> DRM_FORMAT_XV15 ("XV15")
> DRM_FORMAT_XV20 ("XV20")
> 
> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> subsampled whereas XV20 is 2x1 subsampled.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e662aea9d105..b22ef86428a1 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -381,6 +381,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_S416,            .depth = 0,  .num_planes = 3,
>  		  .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 },
>  		  .hsub = 1, .vsub = 1, .is_yuv = true},
> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 2, .is_yuv = true },

Given the horizontal subsampling, don't we have 6 pixels in 8 bytes ?

> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index e527b24bd824..6c786701238e 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -322,6 +322,14 @@ extern "C" {
>  #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
>  #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
>  
> +/*
> + * 2 plane 10 bit per component YCrCb
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> + */
> +#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
> +#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
> +
>  /*
>   * 2 plane YCbCr
>   * index 0 = Y plane, [7:0] Y

-- 
Regards,

Laurent Pinchart
