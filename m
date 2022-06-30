Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D60560ECE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 03:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22010E54B;
	Thu, 30 Jun 2022 01:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BC210E54B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 01:50:48 +0000 (UTC)
X-UUID: af02c130b27343bea2a30a4dc4f2efc1-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:06d0a0c6-db55-4d0d-acf2-28cefda74fd5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:87442a2, CLOUDID:3d0e0163-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: af02c130b27343bea2a30a4dc4f2efc1-20220630
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2093601085; Thu, 30 Jun 2022 09:50:43 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 09:50:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 30 Jun 2022 09:50:42 +0800
Message-ID: <e9d0f85c09fc92c8e1c8876169c672769f4e16e9.camel@mediatek.com>
Subject: Re: [PATCH v24 00/10] Add MediaTek SoC(vdosys1) support for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "linux@roeck-us.net"
 <linux@roeck-us.net>
Date: Thu, 30 Jun 2022 09:50:41 +0800
In-Reply-To: <20220622130824.29143-1-nancy.lin@mediatek.com>
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 David Airlie <airlied@linux.ie>,
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>,
 Singo Chang =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?=
 <Singo.Chang@mediatek.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Nathan
 Chancellor <nathan@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?=
 <yongqiang.niu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-22 at 21:08 +0800, Nancy.Lin wrote:
> The hardware path of vdosys1 with DPTx output need to go through by
> several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add mmsys and mutex modules support by the patches below:
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
>  drivers/soc/mediatek/mtk-mmsys.c          | 134 +++++++++++++++-----
>  drivers/soc/mediatek/mtk-mmsys.h          |   1 +
>  drivers/soc/mediatek/mtk-mutex.c          |  37 ++++++
>  include/dt-bindings/reset/mt8195-resets.h |  45 +++++++
>  include/linux/soc/mediatek/mtk-mmsys.h    |  25 ++++
>  6 files changed, 354 insertions(+), 34 deletions(-)
> 
> -- 
> 2.18.0
> 

Hello Matthias,

This series is about mmsys configuration of external display path.

It is in version *24*, and it is reviewed by many reviewers, like CK
and Angelo.
The reset.h is also reviewed by Krzysztof.

This series is also well tested by me and Angelo.
I tested this series with modetest successfully using 5.19-rc2 mainline
kernel with dp/dpintf/dp phy series.([1])

Could you kindly take a look for this series and give us some comments
or feedback? We really need this series being accepted.

Thanks for your big support!

[1]:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=654074
https://patchwork.kernel.org/project/linux-mediatek/list/?series=653448
https://patchwork.kernel.org/project/linux-mediatek/list/?series=653410

BRs,
Bo-Chen

