Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3741230763
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 12:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB22489C0A;
	Tue, 28 Jul 2020 10:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F9889C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:12:58 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id v21so7218793otj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aof/IkstdyaZKoWfuNk92GZBDQ6ckAiOA/sCuGsGL6I=;
 b=NbU2aWgthvUPJhAzSvTiPxT0ZOtU5G2eG2AdSnSK87IEZE9sylk5eLW3u2WDqK696N
 H1yoSq2fFkTuIlergwQ23t0hSiiau8ecXjqCO+U8bWuxEGZJhZORLMV5itNtN7oLxk0C
 v88fbxM9EAd2WMRfPC1SPS8cFcCm1+KtbaLDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aof/IkstdyaZKoWfuNk92GZBDQ6ckAiOA/sCuGsGL6I=;
 b=qWxJr+97XLY/sm1bdpbpsDXS+NvwL9rq04QHT+HwSHDBxI9Kt5TMW+HQTFYOUWg8FC
 IXqQgZvlQhxxDH4lkLVKkNPwaxD9iE2NvbwPWJphfqIKJuiH4mS7V7F3BVEzAydoqEHD
 Xily/TLfpqGEKsWFVvltmXEw3B8LJx0W4PkFiR1WRUN3LmwWAU5G1b7vjQaSFCs5+BRA
 lD3ouqpOwLbN/p+OIv53gZQJcFNBi2iVNEX+m2jDtDWMtg8LURFH7loujLmVR46YUP2J
 Io8bv1ViIWOvrgEDG5k3Wm6PDnv9zN8azyWzGLmC4gIW8G4b+AOKOiZNpn6OOlzMi7qy
 ZbjQ==
X-Gm-Message-State: AOAM531ysdPopRADAXvuVlQXlJSG6ybuXTMSz4rnbIvgAymjWkOnFgDv
 +whaslS1WQDs6Xy6xetmgEa/pPJIAM2AffO8HuQHLcnSba4=
X-Google-Smtp-Source: ABdhPJxjWsA5TxdUKIBtwP1CV/sLUp8Xiogs4lFtBgtOp4T0DZIsVMl3W3hfllsLWeGSY9fjOn2BS1PqFgUdigcvARI=
X-Received: by 2002:a05:6830:1e71:: with SMTP id
 m17mr10486878otr.188.1595931177953; 
 Tue, 28 Jul 2020 03:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 28 Jul 2020 12:12:47 +0200
Message-ID: <CAKMK7uH+=gpJriMct8x_tiexRqf1vBuP9d+7eWsMFWm1ccYjkQ@mail.gmail.com>
Subject: Re: [PATCH RFC v6 0/6] Add Unisoc's drm kms module
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Airlie <airlied@linux.ie>,
 zhang.lyra@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 orsonzhai@gmail.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 12:08 PM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>

Hm still no ack for dt bindings? We need that for merging.

Also what's the maintainer plan here? Imo best would be to put this
into the drm-misc group maintainer model, with commit rights and all:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

MAINTAINERS patch to do that would be good.
-Daniel

>
> ChangeList:
> v1:
> 1. only upstream modeset and atomic at first commit.
> 2. remove some unused code;
> 3. use alpha and blend_mode properties;
> 3. add yaml support;
> 4. remove auto-adaptive panel driver;
> 5. bugfix
>
> v2:
> 1. add sprd crtc and plane module for KMS, preparing for multi crtc&encoder
> 2. remove gem drivers, use generic CMA handlers
> 3. remove redundant "module_init", all the sub modules loading by KMS
>
> v3:
> 1. multi crtc&encoder design have problem, so rollback to v1
>
> v4:
> 1. update to gcc-linaro-7.5.0
> 2. update to Linux 5.6-rc3
> 3. remove pm_runtime support
> 4. add COMPILE_TEST, remove unused kconfig
> 5. "drm_dev_put" on drm_unbind
> 6. fix some naming convention issue
> 7. remove semaphore lock for crtc flip
> 8. remove static variables
>
> v5:
> 1. optimize encoder and connector code implementation
> 2. use "platform_get_irq" and "platform_get_resource"
> 3. drop useless function return type, drop unless debug log
> 4. custom properties should be separate, so drop it
> 5. use DRM_XXX replase pr_xxx
> 6. drop dsi&dphy hal callback ops
> 7. drop unless callback ops checking
> 8. add comments for sprd dpu structure
>
> v6:
> 1. Access registers via readl/writel
> 2. Checking for unsupported KMS properties (format, rotation, blend_mode, etc) on plane_check ops
> 3. Remove always true checks for dpu core ops
>
> Kevin Tang (6):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
>
>  .../devicetree/bindings/display/sprd/dphy.yaml     |   75 +
>  .../devicetree/bindings/display/sprd/dpu.yaml      |   82 ++
>  .../devicetree/bindings/display/sprd/drm.yaml      |   36 +
>  .../devicetree/bindings/display/sprd/dsi.yaml      |   98 ++
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/sprd/Kconfig                       |   12 +
>  drivers/gpu/drm/sprd/Makefile                      |   13 +
>  drivers/gpu/drm/sprd/disp_lib.c                    |   57 +
>  drivers/gpu/drm/sprd/disp_lib.h                    |   16 +
>  drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
>  drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
>  drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  473 +++++++
>  drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  201 +++
>  drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h          |   22 +
>  drivers/gpu/drm/sprd/dpu/Makefile                  |    3 +
>  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  503 +++++++
>  drivers/gpu/drm/sprd/dsi/Makefile                  |    8 +
>  drivers/gpu/drm/sprd/dsi/core/Makefile             |    4 +
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      |  964 +++++++++++++
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1477 ++++++++++++++++++++
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  328 +++++
>  drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h  |   32 +
>  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  590 ++++++++
>  drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   26 +
>  drivers/gpu/drm/sprd/sprd_dphy.c                   |  209 +++
>  drivers/gpu/drm/sprd/sprd_dphy.h                   |   50 +
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |  668 +++++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h                    |  190 +++
>  drivers/gpu/drm/sprd/sprd_drm.c                    |  227 +++
>  drivers/gpu/drm/sprd/sprd_drm.h                    |   18 +
>  drivers/gpu/drm/sprd/sprd_dsi.c                    |  571 ++++++++
>  drivers/gpu/drm/sprd/sprd_dsi.h                    |  108 ++
>  33 files changed, 7074 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.yaml
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
>  create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
>  create mode 100644 drivers/gpu/drm/sprd/dphy/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dphy/pll/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
>  create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
>  create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h
>  create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
>  create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
>  create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
>  create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
>  create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h
>  create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
>  create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
>
> --
> 2.7.4
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
