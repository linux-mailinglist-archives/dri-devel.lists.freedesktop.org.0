Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096112386C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 22:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FD66E13C;
	Tue, 17 Dec 2019 21:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475BF6E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 21:09:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 338B09BF;
 Tue, 17 Dec 2019 22:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576616942;
 bh=set410rg1fxlrjKjEAO/LAirOCf3CR8LsfjCbaj9Rng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPvApZZit2plXhCZ9RS4XUV3rzreDwfgeNrgolAYFE0Jt9cZ2kvK2llREQygHtHPL
 44HVD5xvz/hY20zaxuiwsH1JMLMSxulVjTGu78AxurXnuK2UiHl6OATmFZOBpUDfsd
 y++WWm28IHW9Zl0pc31FCA37pdcdEZiCP96p0NBE=
Date: Tue, 17 Dec 2019 23:08:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL FOR v5.6] R-Car DU & LVDS decoder
Message-ID: <20191217210851.GD4874@pendragon.ideasonboard.com>
References: <20191128024524.GC13942@pendragon.ideasonboard.com>
 <20191217124344.GS624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217124344.GS624164@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Dec 17, 2019 at 01:43:44PM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:45:24AM +0200, Laurent Pinchart wrote:
> > Hi Dave,
> > 
> > The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
> > 
> >   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-11-26 08:40:23 +1000)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/pinchartl/media.git tags/du-next-20191128
> > 
> > for you to fetch changes up to c43bcd64c7c703ff7196f74cb6bfc67e35b562d9:
> > 
> >   dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a (2019-11-28 03:55:56 +0200)
> > 
> > ----------------------------------------------------------------
> > - R-Car DU Color Management Module support
> > - LVDS decoder support
> > 
> > ----------------------------------------------------------------
> > Fabrizio Castro (9):
> >       dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema
> >       dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios
> >       dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
> >       dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83"
> >       drm/bridge: Repurpose lvds-encoder.c
> >       drm/bridge: lvds-codec: Add "lvds-decoder" support
> >       drm/bridge: lvds-codec: Simplify panel DT node localisation
> >       dt-bindings: display: bridge: Repurpose lvds-encoder
> >       dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
> 
> Why bridge stuff not in drm-misc?

This was submitted as part of a Renesas-related series, so I've grouped
all the Renesas-related patches in a single pull request.

> Also, and the reason I've not pulled this:
> 
> dim: c43bcd64c7c7 ("dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a"): committer Signed-off-by missing.
> dim: bb29b64ac196 ("dt-bindings: display: bridge: Repurpose lvds-encoder"): committer Signed-off-by missing.
> dim: 5db8ae664da4 ("drm/bridge: lvds-codec: Simplify panel DT node localisation"): committer Signed-off-by missing.
> dim: e94bb2bf88e2 ("drm/bridge: lvds-codec: Add "lvds-decoder" support"): committer Signed-off-by missing.
> dim: b6fafff0c335 ("drm/bridge: Repurpose lvds-encoder.c"): committer Signed-off-by missing.
> dim: 1c060450177f ("dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83""): committer Signed-off-by missing.
> dim: d2f2a148ba7c ("dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt"): committer Signed-off-by missing.
> dim: 07e5c8731999 ("dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios"): committer Signed-off-by missing.
> dim: 0fa9d2323ed3 ("dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema"): committer Signed-off-by missing.
> dim: ERROR: issues in commits detected, aborting
> 
> *insert small sermon about if you do your own maintainer, pls do it right ...

Sorry, I'll fix it and make sure it doesn't happen again.

> > Geert Uytterhoeven (2):
> >       dt-bindings: display: renesas: du: Add vendor prefix to vsps property
> >       drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"
> > 
> > Jacopo Mondi (6):
> >       dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
> >       dt-bindings: display: renesas,du: Document cmms property
> >       drm: rcar-du: Add support for CMM
> >       drm: rcar-du: kms: Initialize CMM instances
> >       drm: rcar-du: crtc: Control CMM operations
> >       drm: rcar-du: crtc: Register GAMMA_LUT properties
> > 
> >  .../bindings/display/bridge/lvds-codec.yaml        | 132 +++++++++++++
> >  .../bindings/display/bridge/lvds-transmitter.txt   |  66 -------
> >  .../bindings/display/bridge/ti,ds90c185.txt        |  55 ------
> >  .../devicetree/bindings/display/renesas,cmm.yaml   |  67 +++++++
> >  .../devicetree/bindings/display/renesas,du.txt     |  15 +-
> >  drivers/gpu/drm/bridge/Kconfig                     |   8 +-
> >  drivers/gpu/drm/bridge/Makefile                    |   2 +-
> >  drivers/gpu/drm/bridge/lvds-codec.c                | 151 ++++++++++++++
> >  drivers/gpu/drm/bridge/lvds-encoder.c              | 155 ---------------
> >  drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
> >  drivers/gpu/drm/rcar-du/Makefile                   |   1 +
> >  drivers/gpu/drm/rcar-du/rcar_cmm.c                 | 217 +++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_cmm.h                 |  58 ++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  71 +++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_group.c            |  10 +
> >  drivers/gpu/drm/rcar-du/rcar_du_group.h            |   2 +
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  93 ++++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   5 +
> >  20 files changed, 829 insertions(+), 291 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
> >  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
> >  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
> >  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
