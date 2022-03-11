Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68814D5ED1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 10:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974310E863;
	Fri, 11 Mar 2022 09:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E93110E863
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:51:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DB1A01F464A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646992315;
 bh=XYlPfMnG3552vPBh7tbShbIhYT9WuL/8qXG4yzJ+K/A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X7Ng/TM9R21WVEboKTJzkCNWYqAcfNJuS8ZDqKZ0gMXnYR36OA495SNyx0CLaU71s
 FizynJi8uJlzJ0Jka+zDHdcZOzgUf8cBKh6LNXgkRTFfsgOZf5N3feO3Co3nEOkl65
 lsZ29ue4mmwW6YpG75X9+MbL1jKAuf9XsVooZAcDfROpO5Jjv9OFnEThwrSkBDCc9Y
 jY7wWYjx4jwa1EvLbLXaZRoR3JCNGeHWusW0zkxD5Fk7VRzq1/ZsIPvONhIxS5O+4Y
 dBIiBtmChKw+45YWBGYmpbVl021fLvUu/+6EOqgXdcgywUWH6A7IgnPRNqs0Hj/EwG
 o481Wqn08V3MA==
Message-ID: <2f30b300-34a9-936b-2970-d9607c65f42f@collabora.com>
Date: Fri, 11 Mar 2022 10:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v15 00/22] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220311015506.11232-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/03/22 02:54, Nancy.Lin ha scritto:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add DRM and these modules support by the patches below:


Hello maintainers,

I have tested this series (and its dependencies - where [1] is needed to even
be able to apply this one) on multiple machines featuring different MediaTek
SoCs and everything works as expected on both oldies and new ones.

I want to make sure you know that series [1] is also fine and has R-b tags,
apart from the first commit (1/8) that in my opinion should be removed (or
simply ignored while applying, as it's not impacting on any other change in
that series, nor in this one).

In my opinion, the two (vdosys0 and 1) series are ready to be picked.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=620795

Thank you all,
Angelo

> 
> Changes in v15:
> - fix ethdr uppercase hex number in dts
> 
> Changes in v14:
> - remove MTK_MMSYS 64 bit dependency
> - add ethdr.yaml back and fix dt_schema check fail
> 
> Resend v13
> - add related maintainer in maillist
> 
> Changes in v13:
> - fix reviewer comment in v12
>    - fix rdma dt-binding format
>    - fix dts node naming
> - fix 32 bit build error
>    - modify 64bit dependency for mtk-mmsys
> - rebase to vdosys0 series v16. (ref [5])
> 
> Changes in v12:
> - fix reviewer comment in v11
>    - modify mbox index
>    - refine dma dev for ovl_adaptor sub driver
> 
> Changes in v11:
> - remove ethdr vblank spin lock
> - refine ovl_adaptor print message
> 
> Changes in v10:
> - refine ethdr reset control using devm_reset_control_array_get_optional_exclusive
> - fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue
> 
> Changes in v9:
> - rebase on kernel-5.16-rc1
> - rebase on vdosys0 series v13. (ref [5])
> - fix ovl_adaptor sub driver is brought up unintentionally
> - fix clang build test fail- duplicate ethdr/mdp_rdma init_module/cleanup_module symbol issue
> 
> Changes in v8:
> - separate merge async reset to new patch.
> - separate drm ovl_adaptor sub driver to new patch.
> - fix reviewer comment in v7.
> 
> Changes in v7:
> - rebase on vdosys0 series v12 (ref[5])
> - add dma description in ethdr binding document.
> - refine vdosys1 bit definition of mmsys routing table.
> - separate merge modification into 3 pathces.
> - separate mutex modification into 2 patches.
> - add plane color coding for mdp_rdma csc.
> - move mdp_rdma pm control to ovl_adaptor.
> - fix reviewer comment in v6.
> 
> Changes in v6:
> - rebase on kernel-5.15-rc1.
> - change mbox label to gce0 for dts node of vdosys1.
> - modify mmsys reset num for mt8195.
> - rebase on vdosys0 series v10. (ref [5])
> - use drm to bring up ovl_adaptor driver.
> - move drm iommu/mutex check from kms init to drm bind.
> - modify rdma binding doc location. (Documentation/devicetree/bindings/arm/)
> - modify for reviewer's comment in v5.
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
> [1] arm64: dts: Add mediatek SoC mt8195 and evaluation board
>      https://patchwork.kernel.org/project/linux-mediatek/patch/20220112114724.1953-4-tinghan.shen@mediatek.com/
> [2] arm64: dts: mt8195: add IOMMU and smi nodes
>      https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
> [3] arm64: dts: mt8195: add gce node
>      https://patchwork.kernel.org/project/linux-mediatek/patch/20220126090109.32143-1-jason-jh.lin@mediatek.com/
> [4] [v2] arm64: dts: mt8195: add display node for vdosys0
>      https://patchwork.kernel.org/project/linux-mediatek/patch/20220225021535.2655-1-jason-jh.lin@mediatek.com/
> [5] Add MediaTek SoC DRM (vdosys0) support for mt8195
>      https://patchwork.kernel.org/project/linux-mediatek/list/?series=620795
> [6] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>      https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/
> 
> Nancy.Lin (22):
>    dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
>    dt-bindings: reset: mt8195: add vdosys1 reset control bit
>    dt-bindings: mediatek: add ethdr definition for mt8195
>    soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
>    soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
>    soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
>      vdosys1
>    soc: mediatek: mmsys: modify reset controller for MT8195 vdosys1
>    soc: mediatek: change the mutex defines and the mutex_mod type
>    soc: mediatek: add mtk-mutex support for mt8195 vdosys1
>    drm/mediatek: add display MDP RDMA support for MT8195
>    drm/mediatek: add display merge advance config API for MT8195
>    drm/mediatek: add display merge start/stop API for cmdq support
>    drm/mediatek: add display merge mute/unmute support for MT8195
>    drm/mediatek: add display merge async reset control
>    drm/mediatek: add ETHDR support for MT8195
>    drm/mediatek: add mediatek-drm plane color encoding info
>    drm/mediatek: add ovl_adaptor support for MT8195
>    drm/mediatek: add dma dev get function
>    drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
>    drm/mediatek: add drm ovl_adaptor sub driver for MT8195
>    drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
>    arm64: dts: mt8195: add display node for vdosys1
> 
>   .../arm/mediatek/mediatek,mdp-rdma.yaml       |  86 ++++
>   .../display/mediatek/mediatek,ethdr.yaml      | 158 +++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 223 +++++++++
>   drivers/gpu/drm/mediatek/Makefile             |   5 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 ++
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  89 +++-
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 443 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  55 ++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   4 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  31 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   9 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 329 +++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h      |   1 +
>   drivers/gpu/drm/mediatek/mtk_ethdr.c          | 376 +++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ethdr.h          |  23 +
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 315 +++++++++++++
>   drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  20 +
>   drivers/soc/mediatek/mt8195-mmsys.h           | 199 ++++++++
>   drivers/soc/mediatek/mtk-mmsys.c              |  79 +++-
>   drivers/soc/mediatek/mtk-mmsys.h              |  11 +
>   drivers/soc/mediatek/mtk-mutex.c              | 318 +++++++------
>   include/dt-bindings/reset/mt8195-resets.h     |  12 +
>   include/linux/soc/mediatek/mtk-mmsys.h        |  22 +
>   25 files changed, 2596 insertions(+), 255 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdp-rdma.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
> 

