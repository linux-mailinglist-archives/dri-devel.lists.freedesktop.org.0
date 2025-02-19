Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23201A3C324
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9C510E833;
	Wed, 19 Feb 2025 15:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PCBXk/A3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0018810E833
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:08:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 008C8169;
 Wed, 19 Feb 2025 16:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739977653;
 bh=4hH0ogfs3FxS01zx8vZqEEqA9ajbUWe7JPdrJDjl/cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCBXk/A361zRuHfO14ueJVpPe1SKovsqAJpph7O9XWBCj4scQ/ibc7GwSrNakXkvR
 GFt+BfI+1exlxpJM2rSY/78i5jt8skVIJNKf2sASzuQ9uFDT3HDLReLnSEJMQkCYRy
 B+Wh05X/wsGSzqzT1mqV2Oah+pQciYQPHoxZ/A3A=
Date: Wed, 19 Feb 2025 17:08:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Message-ID: <20250219150840.GA31825@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-6-90d0fe106995@ideasonboard.com>
 <bdpw2g65uor77tijlhpabodog7haqvdcemnr3wzqkooerzuib5@hfdn5zsrbkgg>
 <7674314f-d95a-433a-81d2-ca78bc199359@ideasonboard.com>
 <naw67daoyb2lfmq4jovlwanz5niaolptwnug3c3kkrtlfoh6dd@trkctqyzvtb5>
 <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <23e71045-1ae2-4e02-9780-aa11a338d481@ideasonboard.com>
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

On Wed, Feb 19, 2025 at 04:47:26PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 18/02/2025 05:26, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 10:27:56PM +0200, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 17/02/2025 22:15, Dmitry Baryshkov wrote:
> >>> On Wed, Feb 12, 2025 at 04:56:10PM +0200, Tomi Valkeinen wrote:
> >>>> Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
> >>>> container.
> >>>
> >>> Is there a more common name for this format? Otherwise googling for it
> >>> reveals only your series.
> >>
> >> In the cover letter I mention the gstreamer names where available (this
> >> particular format is not in gstreamer). AMD has these in their zynqmp
> >> documentation (https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/Video-Packer-Format).
> >>
> >> XVUY2101010 is YUV444_10BPC in AMD docs.
> >>
> >> X403 is Y444_10LE32 in gstreamer, and YV24_10BPC in AMD docs.
> >>
> >> I'm not sure you'll have much more luck googling with those names, though
> >> =).
> > 
> > I'm asking, because include/uapi/drm/drm_fourcc.h has a pretty explicit
> > waiver: GL, Vulkan or other open standards. Otherwise normal
> > requirements apply and it's required to have an open-source usespace
> > implementation, etc.
> 
> I can drop DRM_FORMAT_XVUY2101010 until we get it to gstreamer. I just 
> had it ready, so I thought it's better to include it than leave out.
> 
> Is the current gstreamer support enough for the other formats to fulfill 
> the userspace requirement?

We've received a green light in the past to add formats to drm_fourcc.h
that would be used by cameras only. There's no open formal standard there, but
we have libcamera as a de-facto standard. I would assume GStreamer to be
enough for a scanout format.

-- 
Regards,

Laurent Pinchart
