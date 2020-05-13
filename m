Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A481D1F8B
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 21:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE996E27F;
	Wed, 13 May 2020 19:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5155C6E27F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 19:45:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so27873105wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fktKk3VPkbByxMnUb2lfcrz6WyYgwRfNuZOH8M/MI6s=;
 b=XU7gRL4veiPTn8LeZV5Zw4H2p6P7rlb5zDm8t+QfU+x+JYQaZEDpZ/Vfkz/Nc2gZ6E
 SE43C+CrySsjUtl1JrIdNDCnpevmncgZ00eLbEO5I83zIFEyGRssaE50HHfzjROVzofl
 S2YmeuRpI2bGvYTCKG9NKJIU5dmuFeOzpUWS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fktKk3VPkbByxMnUb2lfcrz6WyYgwRfNuZOH8M/MI6s=;
 b=X868yuNpEWnR5o4f0atARepLT0e+VvCCjFSOmgNTS+QRU7WT5LMqoCAaRQpCy2U9XF
 819Ee1x+R7tB42g0dGhkXRBt5Up2Yho4svvMie/aLnR6rxDhskAbt7dHIS7KTpg+LbmE
 f4SKsPKnH6usSfoekm2jGtKqTRXKbyHW8H0+AOvnbaqQNnx1cnxVNMo82jTvDE7ix8sc
 MWE6/zOFQMVw4nj/8jgyfO0LMiLFflSNKo7revfGkK1vL9l4r+vw/SBKfSpZf2mB9sQJ
 MhV5CJLm0t7bWUNCI57fjhfarO+hHE2MvHAhhh9p1jLXFoyeaGRvllyRpwNcUnbsC2h+
 ePwg==
X-Gm-Message-State: AGi0PuZA1LGavuTAbBUuDsE0Q2voeCz5aqiHeS+slwn/nHBq8v90NdMy
 yWJFg/Ztkn5vPoif6K/S2u2xKA==
X-Google-Smtp-Source: APiQypLjLvOuunRYTd+SxcqMzVtW21yRmTzyCEgDimY0GhpGnBTQLazCjnaLb8wyQ2nIQMGEY2kHXA==
X-Received: by 2002:a1c:f207:: with SMTP id s7mr17333901wmc.14.1589399120838; 
 Wed, 13 May 2020 12:45:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm657575wrg.84.2020.05.13.12.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 12:45:20 -0700 (PDT)
Date: Wed, 13 May 2020 21:45:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm next for 5.8
Message-ID: <20200513194518.GN206103@phenom.ffwll.local>
References: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_8gJNpWXcMnHiZzg_sgyiJ6BDsBYRxaLX0OXWRuLF1NCg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, YueHaibing <yuehaibing@huawei.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 12:16:59AM +0800, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This include dpi pin mode swap, config mipi_tx current and impedance,
> convert mtk-dpi to drm_bridge API, and some fixup.
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> are available in the Git repository at:
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git
> tags/mediatek-drm-next-5.8

Your pull request is badly line wrapped, and I don't have an ssh account
on that machine ... Maybe airlied has, not sure. http:// or git:// would
be a bunch easier, and then signed that. Plus if your pull isn't
linewrapped we can stuff it directly into scripts.

All I quickly wanted to quickly check is your new bridge driver.
- was that reviewed/acked by bridge maintainers? There's a lot of rework
  going on right now, need to make sure we're not adding new bridge
  drivers that use old style

- why is this bridge driver not in drm/bridge/ directory?

Cheers, Daniel

> for you to fetch changes up to 23b29ff9f13a8fb5a12be9fedb8b614b9dede46a:
>   drm/mediatek: Eliminate the magic number in array size (2020-05-10
> 09:08:30 +0800)
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 5.8
> ----------------------------------------------------------------
> Anand K Mistry (1):
>       drm/mediatek: Stop iterating dma addresses when sg_dma_len() == 0
> Bernard Zhao (2):
>       drm/mediatek: Cleanup coding style in mediatek a bit
>       drm/mediatek: Eliminate the magic number in array size
> Chun-Kuang Hu (1):
>       Merge tag 'v5.7-next-drm-stable' of
> ssh://gitolite.kernel.org/.../matthias.bgg/linux into
> mediatek-drm-next
> Enric Balletbo i Serra (7):
>       dt-bindings: mediatek: Update mmsys binding to reflect it is a
> system controller
>       soc / drm: mediatek: Move routing control to mmsys device
>       soc / drm: mediatek: Fix mediatek-drm device probing
>       drm/mediatek: Remove debug messages for function calls
>       drm/mediatek: mtk_dpi: Rename bridge to next_bridge
>       drm/mediatek: mtk_dpi: Convert to bridge driver
>       drm/mediatek: mtk_dpi: Use simple encoder
> Hsin-Yi Wang (1):
>       drm/mediatek: Fix device passed to cmdq
> Jitao Shi (6):
>       dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
>       drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
>       dt-bindings: display: mediatek: add property to control mipi tx
> drive current
>       dt-bindings: display: mediatek: get mipitx calibration data from nvmem
>       drm/mediatek: add the mipitx driving control
>       drm/mediatek: config mipitx impedance with calibration data
> Matthias Brugger (2):
>       drm/mediatek: Omit warning on probe defers
>       clk / soc: mediatek: Move mt8173 MMSYS to platform driver
> YueHaibing (1):
>       drm/mediatek: Fix Kconfig warning
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt   |   7 +-
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt |   6 +
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt |  10 ++
>  drivers/clk/mediatek/Kconfig                                        |   7 +
>  drivers/clk/mediatek/Makefile                                       |   1 +
>  drivers/clk/mediatek/clk-mt8173-mm.c                                |
> 146 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8173.c                                   |
> 104 --------------
>  drivers/gpu/drm/mediatek/Kconfig                                    |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_color.c                           |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c                             |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c                            |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                                  |
> 127 ++++++++++-------
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c                             |  27 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c                              |
> 259 +---------------------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h                              |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                              |
>  50 +++----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h                              |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c                              |   3 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                                  |   8 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                                 |  22 ++-
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.c                              |
>  54 +++++++
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.h                              |   4 +
>  drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c                       |  28 ++++
>  drivers/soc/mediatek/Kconfig                                        |   8 ++
>  drivers/soc/mediatek/Makefile                                       |   1 +
>  drivers/soc/mediatek/mtk-mmsys.c                                    |
> 337 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h                              |  20 +++
>  27 files changed, 778 insertions(+), 476 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
