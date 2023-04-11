Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74D6DD7FB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1201710E096;
	Tue, 11 Apr 2023 10:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B44C10E096
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:34:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2ef1e98d6bfso382533f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681209268; x=1683801268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I00mnwr030X+et6YWjpBcS7r+cVDcxfdrqBbP1jIoBM=;
 b=lm4SAcep/XKl1DZtHx5RTnpfJ2QZ0uSgLV/tMXtRo6yNSY+5ouhTp3b1ztrR1Zz5y4
 Fpgs8z/yS9ASMTVO4mGxJKV3KX/P9UZQVFCYF2OPh9rN8nEiIft0NgpawA/KrD4bkfCV
 AP08oczleELGSTIr3+96GC3S+9J7wEM7pN1r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681209268; x=1683801268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I00mnwr030X+et6YWjpBcS7r+cVDcxfdrqBbP1jIoBM=;
 b=ZWXpRSl1iIKHLRkUi8dhhT19EY6iEZzeJqDAO3t7lvJz758lAvokA7xxJ50wQlZxvc
 jIVILeTZpbVew2SypmgX+BMNklgswyBK+BOrx2KS85Rlcc58x/1k6c684QA2RiKt4wam
 YfyQ8No52RFho7DG7uzsMUuduKQmlLph92x0pTdPvKMYa+o6xQ+7Lm1rW/9B2+XmCxQf
 kVzB8JyVrl3e/3dVn7PJYlG56+f410TvUNe0Ys9ENqPCOmwNfc8RS2debmDW/Wq00MUU
 Uhh8W8m3su9b3yx1hU7Z/oRQyk5aKTJNMZCA+ikpvuwExM9oa9AqlW6lGgb+I+dirtEA
 JaQg==
X-Gm-Message-State: AAQBX9fgRcbPPPfguPsG5tX/CTIYHJwiIQgAFGko7fmqXKPl075412LD
 gzinkekL53CWyDDnTAjoEVlS4oUxk5r9PEdwhAY=
X-Google-Smtp-Source: AKy350ZFqsZmlLAPU6QHNMV5/R/+jpvUG7up53DzrKvTEPAhfUGJeW9YvXZUQC8obhZoatB+t3AEbA==
X-Received: by 2002:a05:6000:c7:b0:2ef:bb5d:adf8 with SMTP id
 q7-20020a05600000c700b002efbb5dadf8mr5043209wrx.2.1681209268492; 
 Tue, 11 Apr 2023 03:34:28 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b2-20020adff242000000b002d322b9a7f5sm14286203wrp.88.2023.04.11.03.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 03:34:28 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:34:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm next for 6.4
Message-ID: <ZDU3sqNGhNFwbINx@phenom.ffwll.local>
References: <20230410233005.2572-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410233005.2572-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Justin Green <greenjustin@chromium.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, David Airlie <airlied@linux.ie>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 11:30:05PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 
> 1. Add support for 10-bit overlays
> 2. Add MediaTek SoC DRM (vdosys1) support for mt8195
> 3. Change mmsys compatible for mt8195 mediatek-drm
> 4. Only trigger DRM HPD events if bridge is attached
> 5. Change the aux retries times when receiving AUX_DEFER
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.4
> 
> for you to fetch changes up to 9243d70e05c5989f84f840612965f96b524da925:
> 
>   drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER (2023-04-03 16:49:49 +0000)

Pulled, thanks

> 
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.4
> 
> 1. Add support for 10-bit overlays
> 2. Add MediaTek SoC DRM (vdosys1) support for mt8195
> 3. Change mmsys compatible for mt8195 mediatek-drm
> 4. Only trigger DRM HPD events if bridge is attached
> 5. Change the aux retries times when receiving AUX_DEFER
> 
> ----------------------------------------------------------------
> Alexandre Mergnat (1):
>       dt-bindings: display: mediatek: clean unnecessary item
> 
> Chen-Yu Tsai (1):
>       drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached
> 
> Jason-JH.Lin (1):
>       drm/mediatek: Change mmsys compatible for mt8195 mediatek-drm
> 
> Justin Green (3):
>       drm/mediatek: Refactor pixel format logic
>       drm/mediatek: Add support for AR30 and BA30 overlays
>       drm/mediatek: Enable AR30 and BA30 overlays on MT8195
> 
> Nancy.Lin (9):
>       dt-bindings: mediatek: add ethdr definition for mt8195
>       drm/mediatek: Add ETHDR support for MT8195
>       drm/mediatek: Add ovl_adaptor support for MT8195
>       drm/mediatek: Add dma dev get function
>       drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support
>       drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
>       drm/mediatek: Add mediatek-drm of vdosys1 support for MT8195
>       drm/mediatek: Add mdp_rdma get format function
>       drm/mediatek: Add ovl_adaptor get format function
> 
> Nathan Lu (1):
>       drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188
> 
> Xinlei Lee (1):
>       drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER
> 
>  .../bindings/display/mediatek/mediatek,ccorr.yaml  |   5 +-
>  .../bindings/display/mediatek/mediatek,ethdr.yaml  | 182 +++++++
>  drivers/gpu/drm/mediatek/Makefile                  |   2 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  35 ++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  94 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 547 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  38 ++
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |  15 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  89 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 135 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  78 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 475 ++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  30 +-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h           |   3 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               | 370 ++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h               |  25 +
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  24 +
>  19 files changed, 1858 insertions(+), 319 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
