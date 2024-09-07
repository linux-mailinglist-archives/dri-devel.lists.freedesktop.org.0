Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DE96FEAF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 02:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469010EB53;
	Sat,  7 Sep 2024 00:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vw6K4qWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D010EB53
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 00:18:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D420BE71;
 Sat,  7 Sep 2024 02:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1725668223;
 bh=8Orc6XQW99MatC1Qxg4QrMczZ3+NG6gNkj2PD97jIMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vw6K4qWBfcx69WBSCt7CxeBthqF1L+ndbXRStpfMqPJarOqOLenQJ5YEvFXPGZ4M9
 HpeDl6WgCf4f6miRVDrWZ0h5WV+9rVr7rT2jrUTl8/72SrMCAweq5u3Y9/1Fn3rDp0
 gOwVeLk+HQMXi5um4+erzBYBAd07Ca7vCMJ+jDW0=
Date: Sat, 7 Sep 2024 03:18:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL FOR v6.12] Miscellaneous small fixes for Renesas DRM
 drivers
Message-ID: <20240907001813.GA8212@pendragon.ideasonboard.com>
References: <20240822234445.GA23541@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822234445.GA23541@pendragon.ideasonboard.com>
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

Did this one fall through the cracks ? :-(

On Fri, Aug 23, 2024 at 02:44:45AM +0300, Laurent Pinchart wrote:
> Hello Dave, Sima,
> 
> The following changes since commit 11df68c265460d4dff5d19a1313f0fff69470f98:
> 
>   Merge tag 'drm-misc-next-2024-08-16' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-08-22 09:42:23 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/drm-next-20240823
> 
> for you to fetch changes up to caef454889d150d7267992f0d95fbc25dfb621a4:
> 
>   drm: renesas: cmm: Remove unused function rcar_cmm_write (2024-08-23 02:30:26 +0300)
> 
> ----------------------------------------------------------------
> Miscellaneous small fixes for Renesas DRM drivers
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment in rzg2l_mipi_dsi_start_video()
>       drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
> 
> Jiapeng Chong (1):
>       drm: renesas: cmm: Remove unused function rcar_cmm_write
> 
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c       |  5 -----
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c    | 10 ++++------
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c |  2 +-
>  3 files changed, 5 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart
