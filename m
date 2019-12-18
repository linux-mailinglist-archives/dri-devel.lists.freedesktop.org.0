Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7598124B80
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B366E0EC;
	Wed, 18 Dec 2019 15:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF286E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:23:27 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 20so2214036wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qTNQxqPh+CztJ/0ga3ZibukVVQS6Z4+0uawIDPg0fDw=;
 b=HVjGDAFVJbb5+Ix09yrfCHWrCaRRC8mdMEolTksxrOKOMv6DkpnmrsBWiArjktZo0P
 wwt2WgtJRcEx6AZ4aoiGi0JXVV0BhYF0jbhCoBtSqKV+Km5nPLfhCVHrHj/YvAh+MZxO
 chlEPa5/N8Qu+aIh3BzClgDNbp3q5kRg5Kx00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qTNQxqPh+CztJ/0ga3ZibukVVQS6Z4+0uawIDPg0fDw=;
 b=Tvuh9/HBbxSQ4sU/kBMPhXlISgtkB6HiJdWxC0ue6iVZFdsSrzK6z3kZ5+6VjOiu3O
 slwfQxPujz4KyJME7ehtXJKpP7JGXB12Mf+2iXECMzpJ6R8xY9lZ8JSMIqX4m7I5vlYU
 hQ/4PdhwTOmiy4ukwymDA0wbblU0ylXneiE4BVSVYgA0fvwwo0nU3VodDY9Oy8yvIffa
 5aRBNtxbBw4QrTMgPnvMICbxcY+RVx6JFgkIkotb0WZFgIy87b/9XXfIj1eC3G/W24J/
 +fA+ETn/oGrcmESZNomSF9Z7Ns3Z5v9FyYCtIW6dk2I8/LkV2qpWOKbLp+vmmKnaqkjO
 WsuA==
X-Gm-Message-State: APjAAAWczmN/dnka7i5O39HJZFeE0qaqXkoJ0fRD69e17WcVfWja3MfD
 y00jbPabLpJpljGTklv5oadXsw==
X-Google-Smtp-Source: APXvYqwoNnld8KS6RyhLpy+e0ZtFiCc39Gs2GBCEBRtFhS92bW6GkRFaMAu1GJ7KA1Mp9RTtlzbcIA==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr4044954wmj.58.1576682605713;
 Wed, 18 Dec 2019 07:23:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id l2sm2725196wmi.5.2019.12.18.07.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:23:24 -0800 (PST)
Date: Wed, 18 Dec 2019 16:23:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.6] R-Car DU new features
Message-ID: <20191218152322.GE624164@phenom.ffwll.local>
References: <20191218151710.GA13830@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218151710.GA13830@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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

On Wed, Dec 18, 2019 at 05:17:10PM +0200, Laurent Pinchart wrote:
> Hi Dave and Daniel,
> 
> The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:
> 
>   Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/du-next-20191218
> 
> for you to fetch changes up to c267782c5f0efbd20c560101738e68bb30d4fad5:
> 
>   drm: rcar-du: Add r8a77980 support (2019-12-18 02:40:29 +0200)
> 
> ----------------------------------------------------------------
> R-Car Display Unit changes:
> 
> - Color Management Module support
> - LVDS encoder dual-link support enhancements
> - R8A77980 support

Thanks for respinning, applied to drm-next.
-Daniel

> 
> ----------------------------------------------------------------
> Fabrizio Castro (4):
>       drm: of: Add drm_of_lvds_get_dual_link_pixel_order
>       drm: rcar-du: lvds: Improve identification of panels
>       drm: rcar-du: lvds: Get dual link configuration from DT
>       drm: rcar-du: lvds: Allow for even and odd pixels swap
> 
> Geert Uytterhoeven (2):
>       dt-bindings: display: renesas: du: Add vendor prefix to vsps property
>       drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"
> 
> Jacopo Mondi (6):
>       dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
>       dt-bindings: display: renesas,du: Document cmms property
>       drm: rcar-du: Add support for CMM
>       drm: rcar-du: kms: Initialize CMM instances
>       drm: rcar-du: crtc: Control CMM operations
>       drm: rcar-du: crtc: Register GAMMA_LUT properties
> 
> Kieran Bingham (1):
>       drm: rcar-du: Add r8a77980 support
> 
> Laurent Pinchart (1):
>       drm: rcar-du: lvds: Get mode from state
> 
> (with all patches properly signed this time)
> 
>  .../devicetree/bindings/display/renesas,cmm.yaml   |  67 +++++
>  .../devicetree/bindings/display/renesas,du.txt     |  15 +-
>  drivers/gpu/drm/drm_of.c                           | 116 ++++++++
>  drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
>  drivers/gpu/drm/rcar-du/Makefile                   |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c                 | 217 ++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h                 |  58 ++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  71 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   6 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c            |  10 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.h            |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  93 +++++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   5 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 318 +++++++++++----------
>  include/drm/drm_of.h                               |  20 ++
>  17 files changed, 856 insertions(+), 155 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
