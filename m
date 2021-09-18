Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306141052B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 10:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB76E0FC;
	Sat, 18 Sep 2021 08:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099586E0FC
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 08:34:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id e26so9039493wmk.2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 01:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pFcc9WAGqyomWIoyD49E5eVk/YeBgM3zvrN9msiW5gc=;
 b=r8Og99nmoPT4i2wT5RquZ2u2nsKJmGjfJ6dKxM7eOVn6kWt0T/f/5NogDLz03bVmsx
 Fpf1x848Ze00op8o7nBIS5HdkAoBLUeeUkb3fGgzaqPUU5CTJrDvrkGWsU8X87VtpkQH
 n3vtgbvGAMLyCudeOSDyq5x3JohS+JaY7b+mXwSkPAJj/qhHLB7MReHrAX7nugBTnrU5
 dUJz186SHZtst1xBOXer18ATT+udLnKZPNfTVVOX3ojSLphzjwpeAWP/EXYE1JzXayr/
 T4unb1ywUoSgKrY8uukb3BokJIGPXuPHjAKB5slxL39aerF5X4J6ekXX2TxoWKjZ2hnj
 m9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pFcc9WAGqyomWIoyD49E5eVk/YeBgM3zvrN9msiW5gc=;
 b=uBb4FvnU6StbJUdYErv2noEC2h+LDg8WOcRk3RGe4Da0BXwqe3ZEaVhCfrtXBeZ5a1
 ZoORgw0FgwYo7rGKb2KSX7yUxbgzDYQEmXqPMpfYHLffrquWefbYF7yJY7FxUeypSUVx
 ftPN1hOnBd10VtSBc4dt0/hGbiw8p5oTwZSPEFWLHliGBcJ/NvoOcbGwiR6a0doIjRaG
 jS4yFjGN5232q8DGCqfIiEfdBsJ/cKemfjOcbXuM+187BBDch6+ZZw0Vy72XOqJ2Rjeb
 uM2K33EWi/iZ4ZmurhzMADV8rrndhXSdCOvVAsnaY/j4Fr45dPsqSUjT6xf7IWm0NOBl
 EEYA==
X-Gm-Message-State: AOAM533QZFIFeGCK9jDcql9MdrIH3RHFT5nJsuFJ5tRuh7/m5xkKTikM
 LdqMgRqPbxDGR1Rudhbv/cGXcQ==
X-Google-Smtp-Source: ABdhPJzwjBH6Ns6wyf7JVwbKOwYh8OPJZnugUk7OyyBJFpLuaaDHeQJcxXa/ERsKaqzR8nm8CNfnoA==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr13972272wma.175.1631954050329; 
 Sat, 18 Sep 2021 01:34:10 -0700 (PDT)
Received: from blmsp (p5097f82a.dip0.t-ipconnect.de. [80.151.248.42])
 by smtp.gmail.com with ESMTPSA id b16sm9199690wrp.82.2021.09.18.01.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 01:34:09 -0700 (PDT)
Date: Sat, 18 Sep 2021 10:34:08 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, singo.chang@mediatek.com,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH v5 00/16] Add MediaTek SoC DRM (vdosys1) support for mt8195
Message-ID: <20210918083408.rdkovu2r5j5lvrog@blmsp>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210906071539.12953-1-nancy.lin@mediatek.com>
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

Hi Nancy,

On Mon, Sep 06, 2021 at 03:15:23PM +0800, Nancy.Lin wrote:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add DRM and these modules support by the patches below:
> 
> Changes in v5:
> - add mmsys reset controller reference.
> 
> Changes in v4:
> - use merge common driver for merge1~4.
> - refine ovl_adaptor rdma driver.
> - use ovl_adaptor ddp_comp function instead of ethdr.
> - modify for reviewer's comment in v3.
> 
> Changes in v3:
> - modify for reviewer's comment in v2.
> - add vdosys1 2 pixels align limit.
> - add mixer odd offset support.
> 
> Changes in v2:
> - Merge PSEUDO_OVL and ETHDR into one DRM component.
> - Add mmsys config API for vdosys1 hardware setting.
> - Add mmsys reset control using linux reset framework.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> 
> This series are based on the following patch:
> [1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
> [2] arm64: dts: mt8195: add IOMMU and smi nodes
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
> [3] [01/24] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210630023504.18177-2-yong.wu@mediatek.com/
> [4] Add gce support for mt8195
>     https://patchwork.kernel.org/project/linux-mediatek/list/?series=537069
> [5] Add MediaTek SoC DRM (vdosys0) support for mt8195
>     https://patchwork.kernel.org/project/linux-mediatek/list/?series=537225
> [6] [v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller header file
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210806023606.16867-2-Christine.Zhu@mediatek.com/
> [7] [v3,2/7] dt-bindings: mediatek: Add #reset-cells to mmsys system controller
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210825122613.v3.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid/
> [8] [v3,6/7] soc: mediatek: mmsys: Add reset controller support
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid/

My work is currently based on this patch series. Unfortunately with 5.15
I have a bit of trouble picking all the dependencies and run into many
merge conflicts (probably I am missing pieces). I am trying to pick
everything so that I have a good base for my patch. Do you by any chance
have a public git branch with your patch series vdosys1 and all its
dependencies on 5.15? That would make it a lot easier for me to work on
top of it.

Thanks,
Markus

> 
> Nancy.Lin (16):
>   dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
>   dt-bindings: mediatek: add vdosys1 MERGE property for mt8195
>   dt-bindings: mediatek: add ethdr definition for mt8195
>   dt-bindings: reset: mt8195: add vdosys1 reset control bit
>   arm64: dts: mt8195: add display node for vdosys1
>   soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
>   soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
>   soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
>     vdosys1
>   soc: mediatek: mmsys: modify reset controller for MT8195 vdosys1
>   soc: mediatek: add mtk-mutex support for mt8195 vdosys1
>   drm/mediatek: add display MDP RDMA support for MT8195
>   drm/mediatek: add display merge api support for MT8195
>   drm/mediatek: add ETHDR support for MT8195
>   drm/mediatek: add ovl_adaptor support for MT8195
>   drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
>   drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
> 
>  .../display/mediatek/mediatek,ethdr.yaml      | 144 ++++++
>  .../display/mediatek/mediatek,mdp-rdma.yaml   |  77 ++++
>  .../display/mediatek/mediatek,merge.yaml      |   3 +
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 221 +++++++++
>  drivers/gpu/drm/mediatek/Makefile             |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  78 +++-
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 408 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  25 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  15 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 377 +++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   9 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          | 424 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  25 ++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 301 +++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  37 ++
>  drivers/soc/mediatek/mt8195-mmsys.h           | 199 ++++++++
>  drivers/soc/mediatek/mtk-mmsys.c              |  76 +++-
>  drivers/soc/mediatek/mtk-mmsys.h              |  11 +
>  drivers/soc/mediatek/mtk-mutex.c              | 270 ++++++-----
>  include/dt-bindings/reset/mt8195-resets.h     |  12 +
>  include/linux/soc/mediatek/mtk-mmsys.h        |  22 +
>  24 files changed, 2574 insertions(+), 198 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> 
> -- 
> 2.18.0
> 
