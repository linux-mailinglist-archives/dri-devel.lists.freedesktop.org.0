Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AB3AEBEDA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 20:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0E10E0F4;
	Fri, 27 Jun 2025 18:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CHNpQ+aV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4657710E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 18:05:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D4FC07E1;
 Fri, 27 Jun 2025 20:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751047498;
 bh=2p+3T+jX3u1dt4arf1dj1Ca9BY88qtk4/dhlHJij/bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CHNpQ+aV9HocvQHE45HahhiYwPMAFaSFU4nZODtXIS6GC+x+ObAhDAP0YEgYXqhu4
 QvMyH4gItXIWufrbxkS9SRAdhAmZTvBrukqEJjG1ohu+Mbbqk7QLt6hKYsQ+8d/lgO
 n93M6GV4n6VgsqkjgIsuBk5uYJqHN89Xp35RLYJA=
Date: Fri, 27 Jun 2025 21:04:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naushir Patuck <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
Message-ID: <20250627180454.GD24912@pendragon.ideasonboard.com>
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
 <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
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

On Fri, Jun 27, 2025 at 09:39:37AM -0700, Rob Clark wrote:
> On Mon, Feb 26, 2024 at 5:43 AM Jacopo Mondi wrote:
> >
> > Add FourCC definitions for the 48-bit RGB/BGR formats to the
> > DRM/KMS uapi.
> >
> > The format will be used by the Raspberry Pi PiSP Back End,
> > supported by a V4L2 driver in kernel space and by libcamera in
> > userspace, which uses the DRM FourCC identifiers.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Resurrecting this, as it appears to have not ever landed upstream

What are the rule is for patches that touch core code like this one, can
they be pushed to drm-misc by anyone with commit access, or do they need
to be collected by a drm-misc maintainer ?

> Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> > ---
> >  drivers/gpu/drm/drm_fourcc.c  | 8 ++++++++
> >  include/uapi/drm/drm_fourcc.h | 4 ++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 193cf8ed7912..908f20b96fd5 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -210,6 +210,14 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >                 { .format = DRM_FORMAT_ABGR2101010,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_RGBA1010102,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_BGRA1010102,     .depth = 30, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > +               { .format = DRM_FORMAT_RGB161616,       .depth = 0,
> > +                 .num_planes = 1, .char_per_block = { 6, 0, 0 },
> > +                 .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> > +                 .hsub = 1, .vsub = 1, .has_alpha = false },
> > +               { .format = DRM_FORMAT_BGR161616,       .depth = 0,
> > +                 .num_planes = 1, .char_per_block = { 6, 0, 0 },
> > +                 .block_w = { 1, 0, 0 }, .block_h = { 1, 0, 0 },
> > +                 .hsub = 1, .vsub = 1, .has_alpha = false },
> >                 { .format = DRM_FORMAT_ARGB8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_ABGR8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_RGBA8888,        .depth = 32, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 84d502e42961..00db00083175 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -210,6 +210,10 @@ extern "C" {
> >  #define DRM_FORMAT_RGBA1010102 fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
> >  #define DRM_FORMAT_BGRA1010102 fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
> >
> > +/* 48 bpp RGB */
> > +#define DRM_FORMAT_RGB161616 fourcc_code('R', 'G', '4', '8') /* [47:0] R:G:B 16:16:16 little endian */
> > +#define DRM_FORMAT_BGR161616 fourcc_code('B', 'G', '4', '8') /* [47:0] B:G:R 16:16:16 little endian */
> > +
> >  /* 64 bpp RGB */
> >  #define DRM_FORMAT_XRGB16161616        fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
> >  #define DRM_FORMAT_XBGR16161616        fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */

-- 
Regards,

Laurent Pinchart
