Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAD8KaQKemk82AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:09:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB54A1DA0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB210E6BC;
	Wed, 28 Jan 2026 13:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d0JE3igs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E9910E6BC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 13:09:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BC45F3A2;
 Wed, 28 Jan 2026 14:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769605752;
 bh=eoWm0ODiCGoFxKKdpMxGg0dhmOyGV9mLi7ccTk7hYhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0JE3igs1aAkx8tTKYunUcwa5HGRUqwAaegZobA8/4BagIN//NM+JKH9b33RrPVW7
 rhHcGFUSMesbBA/XaYoXFoeYsSHV1NeokLyZnK6WtzOV/2kmZshRhZp0p1NLNloOyy
 OtGCMGgxXwEivE0yu+soTAVK7M+SkWfFHZNkbaCw=
Date: Wed, 28 Jan 2026 15:09:48 +0200
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
 Pekka Paalanen <ppaalanen@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20260128130948.GA3210848@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-3-1e1558adfefc@ideasonboard.com>
 <20260128114941.GF2558360@killaraus>
 <6bf4347b-ce70-4325-965f-40f81b24a0d1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6bf4347b-ce70-4325-965f-40f81b24a0d1@ideasonboard.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,m:pekka.paalanen@collabora.com,m:lumag@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com,collabora.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 0BB54A1DA0
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:31:57PM +0200, Tomi Valkeinen wrote:
> On 28/01/2026 13:49, Laurent Pinchart wrote:
> > On Mon, Dec 01, 2025 at 02:18:45PM +0200, Tomi Valkeinen wrote:
> >> Add greyscale Y8 format.
> > 
> > I would explain here why we need a new format and can't just use
> > DRM_FORMAT_R8. You don't need to convince me, but I think it's important
> > to summarize the rationale should someone later wonder why we introduced
> > this.
> 
> Good point. I can take the text from the cover letter to this commit's
> description.
> 
> Would this be fine:
> 
> ==
> 
> Add greyscale Y8 format.
> 
> The 8-bit greyscale format has been discussed before, and the
> earlier guidance was to use DRM_FORMAT_R8, as a single-channel 8-bit pixel.
> 
> However, adding DRM_FORMAT_Y8 makes sense, as:
> 
> 1) We can mark it as 'is_yuv' in the drm_format_info, and this can help
>    the drivers handle e.g. full/limited range. Probably some hardware
>    handles grayscale as a value used for all RGB components, in which case
>    R8 makes sense, but when the hardware handles the Y-only pixels as YCbCr,
>    where Cb and Cr are "neutral", it makes more sense to consider the
>    format as an YUV format rather than RGB.
> 
> 2) We can have the same fourcc as in v4l2. While not strictly necessary,
>    it's a constant source of confusion when the fourccs differ.

I wouldn't consider that as a goal (see my comment below about the 4CC
value). V4L2 and DRM 4CCs differ, and applications must handle them
separately. Implying we can take shortcuts for a subset of formats will
in my opinion generate more harm than good.

> 3) It (possibly) makes more sense for the user to use Y8/GREY format
>    instead of R8, as, in my experience, the documentation usually refers
>    to gray(scale) format or Y-only format.
> 
> 4) We have other Y-only formats, like the Y10_P32 added in the following
>    patches, with "Y" in the fourcc name.

If those two were the only reasons, I'd tell you to use R8 :-) I would
drop 2-4 and only document 1, that's the real reason.

> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/drm_fourcc.c  |  1 +
> >>  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
> >>  2 files changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >> index b22ef86428a1..a39b9d7a5b62 100644
> >> --- a/drivers/gpu/drm/drm_fourcc.c
> >> +++ b/drivers/gpu/drm/drm_fourcc.c
> >> @@ -275,6 +275,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>  		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >> +		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 6c786701238e..5cfc188c4e72 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -459,6 +459,16 @@ extern "C" {
> >>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> >>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> >>  
> >> +/*
> >> + * Y-only (greyscale) formats
> >> + *
> >> + * The Y-only formats are handled similarly to the YCbCr formats in the display
> >> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
> >> + * also means that COLOR_RANGE property applies to the Y-only formats.
> >> + *
> > 
> > Extra blank line.
> > 
> >> + */
> >> +
> >> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > 
> > I would have gone for 'Y', '8', ' ', ' '
> > 
> >>  
> >>  /*
> >>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart
