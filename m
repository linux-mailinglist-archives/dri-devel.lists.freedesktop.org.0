Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4726AB49
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DAE6E122;
	Tue, 15 Sep 2020 17:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6D6E122
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:58:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E977FD8;
 Tue, 15 Sep 2020 19:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600192679;
 bh=XH4Stnb+Rin+YDKJkhMfdLwRltypIjsxSrOd0oEYBLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PyG9lXVtaferjwo5+oPTSpIzmsCZDu4g0PtNLD74w5LCDqzPkdQWzFtaBn/fas/4x
 T2ggRaZNJYWoNngReicNHNBdEqORNdqm+w9YiUKFV1kC7imcfaN3hqN5TrgbukAeiw
 Yx+QOIbp+hQ/9TDCIVbGQXH213NfdkfOR+mCQ920=
Date: Tue, 15 Sep 2020 20:57:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [GIT PULL FOR v5.10] R-Car display drivers miscellaneous changes
Message-ID: <20200915175730.GA28219@pendragon.ideasonboard.com>
References: <20200908160336.GA20954@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908160336.GA20954@pendragon.ideasonboard.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Is there anything blocking this ?

On Tue, Sep 08, 2020 at 07:03:36PM +0300, Laurent Pinchart wrote:
> Hi Dave and Daniel,
> 
> The following changes since commit ce5c207c6b8dd9cdeaeeb2345b8a69335c0d98bf:
> 
>   Merge tag 'v5.9-rc4' into drm-next (2020-09-08 14:41:40 +1000)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/du-next-20200908
> 
> for you to fetch changes up to 2a7d2463be82554578185dbb61caa01aaf504156:
> 
>   drm: rcar-du: Fix crash when enabling a non-visible plane (2020-09-08 18:55:04 +0300)
> 
> ----------------------------------------------------------------
> Miscellaneous R-Car display driver changes:
> 
> - R8A7742, R8A774E1 and R8A77961 support
> - Fixes for pitch of YUV planar foamts and non-visible plane handling
> - Kconfig fix to avoid displaying disabled options in .config
> 
> ----------------------------------------------------------------
> Biju Das (2):
>       dt-bindings: display: bridge: lvds-codec: Document power-supply property
>       drm/bridge: lvds-codec: Add support for regulator
> 
> Kuninori Morimoto (4):
>       dt-bindings: display: renesas: du: Document the r8a77961 bindings
>       dt-bindings: display: renesas: dw-hdmi: Tidyup example compatible
>       dt-bindings: display: renesas: dw-hdmi: Add R8A77961 support
>       drm: rcar-du: Add r8a77961 support
> 
> Lad Prabhakar (4):
>       dt-bindings: display: renesas,du: Document the r8a7742 bindings
>       drm: rcar-du: Add r8a7742 support
>       dt-bindings: display: renesas,lvds: Document r8a7742 bindings
>       drm: rcar-du: lvds: Add r8a7742 support
> 
> Laurent Pinchart (2):
>       drm: rcar-du: Fix pitch handling for fully planar YUV formats
>       drm: rcar-du: Fix crash when enabling a non-visible plane
> 
> Marian-Cristian Rotariu (5):
>       dt-bindings: display: renesas,du: Document r8a774e1 bindings
>       drm: rcar-du: Add support for R8A774E1 SoC
>       dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
>       dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
>       drm: rcar-du: lvds: Add support for R8A774E1 SoC
> 
> Qian Cai (1):
>       drm: rcar-du: Make DRM_RCAR_WRITEBACK depends on DRM_RCAR_DU
> 
>  .../bindings/display/bridge/lvds-codec.yaml     |  3 ++
>  .../bindings/display/bridge/renesas,dw-hdmi.txt |  4 +-
>  .../bindings/display/bridge/renesas,lvds.yaml   |  2 +
>  .../devicetree/bindings/display/renesas,du.txt  |  6 +++
>  drivers/gpu/drm/bridge/lvds-codec.c             | 29 ++++++++++
>  drivers/gpu/drm/rcar-du/Kconfig                 |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 37 ++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 54 ++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.h           |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c             |  2 +
>  11 files changed, 135 insertions(+), 6 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
