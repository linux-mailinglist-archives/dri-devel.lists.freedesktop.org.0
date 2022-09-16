Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8775BAC27
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1223610EC12;
	Fri, 16 Sep 2022 11:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9D010EC12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:16:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EF5347C;
 Fri, 16 Sep 2022 13:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663326998;
 bh=qf43DBOHuD2K091EFmnV/XQkVCYOUGhK5HT3RchMd9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rogM9BKorpJ0Lry8lWaHv85s+JkQfCuPsDvwNBdJiE+6igqrgVc240rM7xie1TubV
 BFtQwaqrfyTjf32QHbpJgqQuPD0baGMQN7qdJR5oifvyUmDNf9xmMqXoiTbiQlXGrV
 XZDfUIGX3tEotvl9cXJ2B0K+gKvwhG/YolregTas=
Date: Fri, 16 Sep 2022 14:16:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL FOR v6.1] R-Car DU changes
Message-ID: <YyRbA5pZFMbhWczy@pendragon.ideasonboard.com>
References: <YxkL+tRI8uXDCvj9@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YxkL+tRI8uXDCvj9@pendragon.ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle ping. I know it's conference time, but I'd appreciate if this
could be merged in time for v6.1.

I also forgot to mention explicitly in the pull request that patch
"media: vsp1: Add premultiplied alpha support" has Mauro's approval for
merge through the DRM tree (the patch has his ack, but being explicit is
better). It's a small change that we didn't consider worth a shared
stable branch as there's no conflict with V4L2.

On Thu, Sep 08, 2022 at 12:24:10AM +0300, Laurent Pinchart wrote:
> Hi Dave, Daniel,
> 
> The following changes since commit 8284bae723f025cb6a8431566757a3854a3c53eb:
> 
>   Merge tag 'drm-misc-next-2022-08-20-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-09-06 10:56:04 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/du-next-20220907
> 
> for you to fetch changes up to cee3e5839cedcc71be755580dc9c0b87fd129116:
> 
>   dt-bindings: display: bridge: renesas,dw-hdmi: Add resets property (2022-09-07 23:50:03 +0300)
> 
> ----------------------------------------------------------------
> - Misc fixes and improvements to the R-Car DU driver
> - Synopsys DW HDMI bridge DT bindings update
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       drm: rcar-du: Drop unused encoder header files
>       drm: rcar-du: Use %p4cc to print 4CC format
> 
> Lad Prabhakar (1):
>       dt-bindings: display: bridge: renesas,dw-hdmi: Add resets property
> 
> Laurent Pinchart (1):
>       drm: rcar-du: Drop leftovers variables from Makefile
> 
> Takanari Hayama (3):
>       media: vsp1: Add premultiplied alpha support
>       drm: rcar-du: Add DRM_MODE_BLEND_PREMULTI support
>       drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support
> 
> Tomi Valkeinen (7):
>       drm: rcar-du: Remove unnecessary include
>       drm: rcar-du: Fix r8a779a0 color issue
>       drm: rcar-du: lvds: Rename pclk enable/disable functions
>       drm: rcar-du: dsi: Properly stop video mode TX
>       drm: rcar-du: dsi: Improve DSI shutdown
>       drm: rcar-du: Fix DSI enable & disable sequence
>       drm: rcar-du: dsi: Fix VCLKSET write
> 
>  .../bindings/display/bridge/renesas,dw-hdmi.yaml   |  5 ++
>  drivers/gpu/drm/rcar-du/Makefile                   |  7 ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 30 +++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |  3 +
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  9 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c            | 16 +++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c              | 26 +++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |  4 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |  8 +--
>  drivers/gpu/drm/rcar-du/rcar_lvds.h                | 10 ++--
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c            | 69 +++++++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h            | 31 ++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c     |  2 +
>  include/media/vsp1.h                               |  2 +
>  16 files changed, 188 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h

-- 
Regards,

Laurent Pinchart
