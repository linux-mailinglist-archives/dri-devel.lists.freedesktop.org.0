Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F03122C17
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 13:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832A36E9D1;
	Tue, 17 Dec 2019 12:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7906E9D1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:43:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p17so3010738wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kT8yEFRCQ1Vv8xVOXQrPXkixwHGJBe9YfGIRsoRAchY=;
 b=YWIMI0gJGUB+F1SP1m1nCnLeqp0nM7WZKzswbKrk3h4EucFRNz5PjlEH4+Hk4XLVqh
 2RI7xQ1Y9kv2NC28zQWeskGb8FFVpL1y3sVatg6Z5wKF7Ymrh2x2AC39wkudWAxoi7EU
 g7Vgay6BqBVA90w3wsdhK62ihv18gBlFVH/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kT8yEFRCQ1Vv8xVOXQrPXkixwHGJBe9YfGIRsoRAchY=;
 b=kBdo/itxnyLI1n4r3YeEsCEtXx+SLGQ2RldsER21CJILv1sh5Z+EwEOwgbnYDZsOtv
 iioGrrgGHFw2n9koDbs15WhzoqcWAt4J4tT+YxqEAsmvFVoHQ0+xK8MmXo9f7UXhrvhD
 jDbhSZLNdtz7GYg2NpUV+Uiy9Sl1qxm1vFFx+dm5KkgesUnEAwboW+mp3558W49rRJqV
 Y6Fxo9BXIDTChRMHlc6SpvVmtziUvsdm6vnnC/gKlayWSCeq1d1PES5edMU8n/4KwblO
 /7V44Oh/KsQ7tQMhTuozCWZpwY7OQ2GxLj//dHQjrwQz+dMzg3G3fE6qTktcgd1MPaNy
 NC3w==
X-Gm-Message-State: APjAAAXKfxNKGMLmcIxq+IK3u74GCJgAmWNP8QeonGBE67FQEOD5xz0D
 kCJh4OG3em1wzvOavJBfXcUsJQ==
X-Google-Smtp-Source: APXvYqyHKi3sst+0Tkeklow38hLviouFjnSslwC2cIkX0dO5lyJ5Lq/ERP/cZCHiicH94tW/jLseKw==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr5220274wmg.170.1576586627223; 
 Tue, 17 Dec 2019 04:43:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q68sm3285583wme.14.2019.12.17.04.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 04:43:46 -0800 (PST)
Date: Tue, 17 Dec 2019 13:43:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT PULL FOR v5.6] R-Car DU & LVDS decoder
Message-ID: <20191217124344.GS624164@phenom.ffwll.local>
References: <20191128024524.GC13942@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128024524.GC13942@pendragon.ideasonboard.com>
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

On Thu, Nov 28, 2019 at 04:45:24AM +0200, Laurent Pinchart wrote:
> Hi Dave,
> 
> The following changes since commit acc61b8929365e63a3e8c8c8913177795aa45594:
> 
>   Merge tag 'drm-next-5.5-2019-11-22' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-11-26 08:40:23 +1000)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/pinchartl/media.git tags/du-next-20191128
> 
> for you to fetch changes up to c43bcd64c7c703ff7196f74cb6bfc67e35b562d9:
> 
>   dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a (2019-11-28 03:55:56 +0200)
> 
> ----------------------------------------------------------------
> - R-Car DU Color Management Module support
> - LVDS decoder support
> 
> ----------------------------------------------------------------
> Fabrizio Castro (9):
>       dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema
>       dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios
>       dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
>       dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83"
>       drm/bridge: Repurpose lvds-encoder.c
>       drm/bridge: lvds-codec: Add "lvds-decoder" support
>       drm/bridge: lvds-codec: Simplify panel DT node localisation
>       dt-bindings: display: bridge: Repurpose lvds-encoder
>       dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a

Why bridge stuff not in drm-misc?

Also, and the reason I've not pulled this:

dim: c43bcd64c7c7 ("dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a"): committer Signed-off-by missing.
dim: bb29b64ac196 ("dt-bindings: display: bridge: Repurpose lvds-encoder"): committer Signed-off-by missing.
dim: 5db8ae664da4 ("drm/bridge: lvds-codec: Simplify panel DT node localisation"): committer Signed-off-by missing.
dim: e94bb2bf88e2 ("drm/bridge: lvds-codec: Add "lvds-decoder" support"): committer Signed-off-by missing.
dim: b6fafff0c335 ("drm/bridge: Repurpose lvds-encoder.c"): committer Signed-off-by missing.
dim: 1c060450177f ("dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83""): committer Signed-off-by missing.
dim: d2f2a148ba7c ("dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt"): committer Signed-off-by missing.
dim: 07e5c8731999 ("dt-bindings: display: bridge: lvds-transmitter: Document powerdown-gpios"): committer Signed-off-by missing.
dim: 0fa9d2323ed3 ("dt-bindings: display: bridge: Convert lvds-transmitter binding to json-schema"): committer Signed-off-by missing.
dim: ERROR: issues in commits detected, aborting

*insert small sermon about if you do your own maintainer, pls do it right ...

Cheers, Daniel

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
>  .../bindings/display/bridge/lvds-codec.yaml        | 132 +++++++++++++
>  .../bindings/display/bridge/lvds-transmitter.txt   |  66 -------
>  .../bindings/display/bridge/ti,ds90c185.txt        |  55 ------
>  .../devicetree/bindings/display/renesas,cmm.yaml   |  67 +++++++
>  .../devicetree/bindings/display/renesas,du.txt     |  15 +-
>  drivers/gpu/drm/bridge/Kconfig                     |   8 +-
>  drivers/gpu/drm/bridge/Makefile                    |   2 +-
>  drivers/gpu/drm/bridge/lvds-codec.c                | 151 ++++++++++++++
>  drivers/gpu/drm/bridge/lvds-encoder.c              | 155 ---------------
>  drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
>  drivers/gpu/drm/rcar-du/Makefile                   |   1 +
>  drivers/gpu/drm/rcar-du/rcar_cmm.c                 | 217 +++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_cmm.h                 |  58 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  71 +++++++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.c            |  10 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.h            |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  93 ++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   5 +
>  20 files changed, 829 insertions(+), 291 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
>  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_cmm.h
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
