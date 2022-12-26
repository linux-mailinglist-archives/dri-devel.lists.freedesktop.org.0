Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B46563AA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 15:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84F310E120;
	Mon, 26 Dec 2022 14:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEB910E120
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 14:56:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05DD374C;
 Mon, 26 Dec 2022 15:56:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672066566;
 bh=iRvGe7PN64w4/wi6OhpkJghApwcdiWZpKZJWzgXnu5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vqTLOwopoX+Q4p6hM57USSoPSLN8K/RoomKwkqUcXmBy9uwGMsyyrPu7QCgd+TYBC
 kU43F8HlL9mVZ8WM/MTnnpxwKu8Paw7o2wXEbqWdc/B2Hlip/omjLooUVejmLAUZy2
 JRn7qT69ELlbQmWwiUNwSz91zyIRM9mTu8ZtiGU0=
Date: Mon, 26 Dec 2022 16:56:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Message-ID: <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

(CC'ing Daniel and Dave)

On Wed, Dec 21, 2022 at 11:24:41AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Hi,
> 
> These add new pixel formats for Renesas V3U and V4H SoCs.
> 
> As the display pipeline is split between DRM and V4L2 components, this
> series touches both subsystems. I'm sending all these together to
> simplify review. If needed, I can later split this to V4L2 and DRM
> parts, of which the V4L2 part needs to be merged first.

As the changes on the DRM side are small and shouldn't conflict with
anything else queued for v6.3, it would be easier to merge the whole
series through the media tree. Daniel, Dave, would you be OK with that ?
If so, could you please ack patches 6/7 and 7/7 ?

> Changes in v3:
> - Addressed all the review comments
> - Added Y212
> - Updated the kernel docs for the new formats
> - Changed the RGB format names to match the DRM's format names
> - Updated RPF register field macros according to the comments
> 
>  Tomi
> 
> Tomi Valkeinen (7):
>   media: Add 2-10-10-10 RGB formats
>   media: Add Y210, Y212 and Y216 formats
>   media: renesas: vsp1: Change V3U to be gen4
>   media: renesas: vsp1: Add V4H SoC version
>   media: renesas: vsp1: Add new formats (2-10-10-10 ARGB, Y210, Y212)
>   drm: rcar-du: Bump V3U to gen 4
>   drm: rcar-du: Add new formats (2-10-10-10 ARGB, Y210)
> 
>  .../media/v4l/pixfmt-packed-yuv.rst           |  49 ++++-
>  .../userspace-api/media/v4l/pixfmt-rgb.rst    | 194 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  30 +++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  50 ++++-
>  .../media/platform/renesas/vsp1/vsp1_drv.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_hgo.c    |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |   1 +
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  18 ++
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  26 ++-
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  64 +++++-
>  .../media/platform/renesas/vsp1/vsp1_video.c  |   4 +-
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    |   4 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   6 +
>  include/uapi/linux/videodev2.h                |  11 +
>  15 files changed, 447 insertions(+), 20 deletions(-)

-- 
Regards,

Laurent Pinchart
