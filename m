Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F5A59299E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 08:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356AEACB46;
	Mon, 15 Aug 2022 06:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4281ACB22
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 06:34:36 +0000 (UTC)
X-UUID: f44872fa9cdb4dc4989cfcf68ac57b0d-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9tgsfVD7JzXCij0I6PTzM0jBVxw+WRwR4OTXvbHVvMY=; 
 b=tYDzgbKIF5GM2z4zKgHK4XKljq70s5WTr0MSV4ELGeeJZY62gccCBerE6WB5hENmuJ61PCfumjqamECrRJJUieLYWRDC6MW5bqJ8Wh2rwEwJsIygstXdTzToUg2aLqP2gNtuqK+xtImzGVXL9DSQkPX1fIYrA3ARcsVlvEpuslI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9, REQID:e4361ad3-c451-4e35-828f-948bcb387de4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:51
X-CID-INFO: VERSION:1.1.9, REQID:e4361ad3-c451-4e35-828f-948bcb387de4, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ha
 m,ACTION:release,TS:51
X-CID-META: VersionHash:3d8acc9, CLOUDID:aeead2ae-9535-44a6-aa9b-7f62b79b6ff6,
 C
 OID:ab0f6c612549,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f44872fa9cdb4dc4989cfcf68ac57b0d-20220815
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 999824249; Mon, 15 Aug 2022 14:34:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 14:34:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 15 Aug 2022 14:34:28 +0800
Message-ID: <2279a329adcc8703837e8c3db68fc6d89eb47802.camel@mediatek.com>
Subject: Re: [PATCH v25 00/10] Add MediaTek SoC(vdosys1) support for mt8195
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Mon, 15 Aug 2022 14:34:28 +0800
In-Reply-To: <20220711075245.10492-1-nancy.lin@mediatek.com>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-07-11 at 15:52 +0800, Nancy.Lin wrote:
> The hardware path of vdosys1 with DPTx output need to go through by
> several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add mmsys and mutex modules support by the patches below:
> 
> Changes in v25:
> - fix reviewer comment
>   - refine mtk_mmsys_reset_update func
> - rebase to next-20220708
> 
> Changes in v24:
> - fix reviewer comment
>   - refine mtk_mmsys_reset_update func
> - rebase to next-20220622
> 
> Changes in v23:
> - separate[7] mmsys/mutex and drm patches into two series
> 
> Changes in v22:
> - rebase to next-20220525
> - rebase to vdosys0 series v22
> - separate dts to a new patch
> 
> Changes in v21:
> - fix reviewer comment
>   - fix rdma and ethdr binding doc and dts
> 
> Changes in v20:
> - fix reviewer comment
>   - update mmsys update bit api name
>   - add mtk_mmsys_update_bits error message if lose gce property
>   - list all mt8195 vdosys1 reset bits
> 
> Changes in v19:
> - fix reviewer comment
>   - separate mt8195 mmsys component to a new patch
>   - separate mt8195 vdo0 and vdo1 routing table
>   - separate mmsys_write_reg api to a new patch and simplify write
> reg code
>   - separate mmsys 64 bit reset to a new patch
>   - separate mtk-mutex dp_intf1 component to a new patch
> 
> Changes in v18:
> - fix reviewer comment
>   - fix rdma binding doc
>   - fix ethdr binding doc
>   - refine mmsys config cmdq support
>   - refine merge reset control flow, get reset control in probe
> function
>   - add ethdr reset control error handling and remove dbg log
> - rebase to vdosys0 series v20 (ref [5])
> 
> Changes in v17:
> - fix reviewer comment in v16
>   - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
>   - separate mmsys config API
>   - move mdp_rdma binding yaml
> - fix ovl adaptor pm runtime get sync timing issue
> - rebase to vdosys0 series v19 (ref [5])
> - rebase to [7] for modify vblank register change
> 
> Changes in v16:
> - fix reviewer comment in v 15
>   - fix mtk_drm_ddp_comp.c alignment
>   - fix vdosys0 mmsys num before adding vdosys1 patch
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
>   - fix rdma dt-binding format
>   - fix dts node naming
> - fix 32 bit build error
>   - modify 64bit dependency for mtk-mmsys
> - rebase to vdosys0 series v16. (ref [5])
> 
> Changes in v12:
> - fix reviewer comment in v11
>   - modify mbox index
>   - refine dma dev for ovl_adaptor sub driver
> 
> Changes in v11:
> - remove ethdr vblank spin lock
> - refine ovl_adaptor print message
> 
> Changes in v10:
> - refine ethdr reset control using
> devm_reset_control_array_get_optional_exclusive
> - fix ovl_adaptor mtk_ovl_adaptor_clk_enable error handle issue
> 
> Changes in v9:
> - rebase on kernel-5.16-rc1
> - rebase on vdosys0 series v13. (ref [5])
> - fix ovl_adaptor sub driver is brought up unintentionally
> - fix clang build test fail- duplicate ethdr/mdp_rdma
> init_module/cleanup_module symbol issue 
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
> - modify rdma binding doc location.
> (Documentation/devicetree/bindings/arm/)
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
>     20220112114724.1953-4-tinghan.shen@mediatek.com
> [2] arm64: dts: mt8195: add IOMMU and smi nodes
>     20210615173233.26682-15-tinghan.shen@mediatek.com
> [3] arm64: dts: mt8195: add gce node
>     20220126090109.32143-1-jason-jh.lin@mediatek.com
> [4] [v2] arm64: dts: mt8195: add display node for vdosys0
>     20220225021535.2655-1-jason-jh.lin@mediatek.com
> [5] Add MediaTek SoC DRM (vdosys0) support for mt8195 - v22 series
>     20220526102126.19756-1-jason-jh.lin@mediatek.com
> [6] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>     20220407075726.17771-2-yong.wu@mediatek.com
> [7] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     20220526110233.20080-1-nancy.lin@mediatek.com
> 
> Nancy.Lin (10):
>   dt-bindings: reset: mt8195: add vdosys1 reset control bit
>   soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
>   soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
>   soc: mediatek: add mtk_mmsys_update_bits API
>   soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
>   soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
>     vdosys1
>   soc: mediatek: mmsys: add mmsys for support 64 reset bits
>   soc: mediatek: mmsys: add reset control for MT8195 vdosys1
>   soc: mediatek: add mtk-mutex component - dp_intf1
>   soc: mediatek: add mtk-mutex support for mt8195 vdosys1
> 
>  drivers/soc/mediatek/mt8195-mmsys.h       | 146
> ++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          | 132 ++++++++++++++-----
>  drivers/soc/mediatek/mtk-mmsys.h          |   1 +
>  drivers/soc/mediatek/mtk-mutex.c          |  37 ++++++
>  include/dt-bindings/reset/mt8195-resets.h |  45 +++++++
>  include/linux/soc/mediatek/mtk-mmsys.h    |  25 ++++
>  6 files changed, 355 insertions(+), 31 deletions(-)

Hello Matthias,

Because Kernel 6.0-rc1 is released, I re-test this series.
I use dp series [1] to test this mmsys series because this series is
used to control external display.

In my test, I can do modtest of these mode for DP and it passed.
Whole series again for 6.0-rc1:
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

  #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500
flags: phsync, pvsync; type: preferred, driver
  #1 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352
flags: phsync, pvsync; type: driver
  #2 1920x1080 50.00 1920 2448 2492 2640 1080 1084 1089 1125 148500
flags: phsync, pvsync; type: driver
  #3 1680x1050 59.95 1680 1784 1960 2240 1050 1053 1059 1089 146250
flags: nhsync, pvsync; type: driver
  #4 1600x900 60.00 1600 1624 1704 1800 900 901 904 1000 108000 flags:
phsync, pvsync; type: driver
  #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000
flags: phsync, pvsync; type: driver
  #6 1280x800 59.81 1280 1352 1480 1680 800 803 809 831 83500 flags:
nhsync, pvsync; type: driver
  #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags:
phsync, pvsync; type: driver
  #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags:
phsync, pvsync; type: driver
  #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags:
phsync, pvsync; type: driver
  #10 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:
nhsync, nvsync; type: driver
  #11 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags:
phsync, pvsync; type: driver
  #12 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags:
nhsync, nvsync; type: driver
  #13 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags:
nhsync, nvsync; type: driver
  #14 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags:
nhsync, nvsync; type: driver
  #15 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags:
nhsync, nvsync; type: driver
  #16 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags:
nhsync, nvsync; type: driver

[1]:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=665597

BRs,
Bo-Chen

