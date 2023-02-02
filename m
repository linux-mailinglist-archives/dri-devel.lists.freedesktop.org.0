Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9E687909
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291BE10E4AE;
	Thu,  2 Feb 2023 09:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275710E4AE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:38:29 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DFF46602EDA;
 Thu,  2 Feb 2023 09:38:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675330708;
 bh=T3a1RTmc7bqKNC8RsSYzoSMpeLuyxvbNktMrz/S6qn4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q6ulCjWSaQLtba9oozrUKNMaf1CBo+th5cIQ5Pu60QJBsjyOnlAWVbJh+IeyClX3Y
 g3J/nYick4sWvVJp14IKidxBAc7eGKQ3Nepb036iriz/xfCTedVmmeWI/u4RujDypo
 0lZBZ7b4uvXgkH9DkAbOHethjfueAlVAU5VDol2UCCL0UGcumzFR9SZaRwZYDSqLkw
 r1s3qoHs9bFdSUrVWBLhwqae1sV1CKPvnDvV6SDlszHs9W5SILzmxBuBgqOTMjNSfn
 edNO601DMyA2eJvAefQDpKujnDBWD/7grDKZzUHrKSldKocwQ6LCXzCicxCcXOcWwl
 Dg8qa0Su3mRig==
Message-ID: <ddf75149-e5ec-8093-2d36-55b6f2341d6a@collabora.com>
Date: Thu, 2 Feb 2023 10:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v29 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221227081011.6426-1-nancy.lin@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/12/22 09:10, Nancy.Lin ha scritto:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add DRM and these modules support by the patches below:
> 

Hello Chun-Kuang,

This series reached version 29 and was tested for a long time.
Is there anything else to fix in here, or can it be finally picked?

Its soc/mediatek counterpart was already picked by Matthias.

Thanks,
Angelo

> Changes in v29:
> - rebase to next-20221226
> - fix reviewer comment in v28
>    - keep original flow if comp node not found in mtk_drm_crtc_create()
> 
> Changes in v28:
> - rebase to next-20221107
> - fix reviewer comment in v27
>    - extra new line at the end mtk_ethdr.h
> 
> Changes in v27:
> - rebase to next-20221102
> - change mmsys compatible for mt8195 vdosys1
>    - base on jason's series[ref 1]
> - fix reviewer comment
>    - add error return code if no ovl_adaptor's comp found
> 
> Changes in v26:
> - rebase to next-20220819
> - resend for patch corrupted in v25
> 
> Changes in v25:
> - rebase to next-20220803
> 
> Changes in v24:
> - fix ovl_adaptor binding issue (mtk_disp_ovl_adaptor.c)
>    - Since ovl_adaptor is an aggregated component, it should be bounded after
>      all its child components are bounded.
> - rebase to next-20220708
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
>    - fix rdma and ethdr binding doc and dts
> 
> Changes in v20:
> - fix reviewer comment
>    - update mmsys update bit api name
>    - add mtk_mmsys_update_bits error message if lose gce property
>    - list all mt8195 vdosys1 reset bits
> 
> Changes in v19:
> - fix reviewer comment
>    - separate mt8195 mmsys component to a new patch
>    - separate mt8195 vdo0 and vdo1 routing table
>    - separate mmsys_write_reg api to a new patch and simplify write reg code
>    - separate mmsys 64 bit reset to a new patch
>    - separate mtk-mutex dp_intf1 component to a new patch
> 
> Changes in v18:
> - fix reviewer comment
>    - fix rdma binding doc
>    - fix ethdr binding doc
>    - refine mmsys config cmdq support
>    - refine merge reset control flow, get reset control in probe function
>    - add ethdr reset control error handling and remove dbg log
> - rebase to vdosys0 series v20 (ref [5])
> 
> Changes in v17:
> - fix reviewer comment in v16
>    - separate ovl adaptor comp in mtk-mmsys and mtk-mutex
>    - separate mmsys config API
>    - move mdp_rdma binding yaml
> - fix ovl adaptor pm runtime get sync timing issue
> - rebase to vdosys0 series v19 (ref [5])
> - rebase to [7] for modify vblank register change
> 
> Changes in v16:
> - fix reviewer comment in v 15
>    - fix mtk_drm_ddp_comp.c alignment
>    - fix vdosys0 mmsys num before adding vdosys1 patch
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
> [1] Change mmsys compatible for mt8195 mediatek-drm
>      20221126101220.18179-1-jason-jh.lin@mediatek.com
> [2] Add MediaTek SoC(vdosys1) support for mt8195
>      20221103032512.9144-1-nancy.lin@mediatek.com
> 
> Nancy.Lin (7):
>    dt-bindings: mediatek: add ethdr definition for mt8195
>    drm/mediatek: add ETHDR support for MT8195
>    drm/mediatek: add ovl_adaptor support for MT8195
>    drm/mediatek: add dma dev get function
>    drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
>    drm/mediatek: add drm ovl_adaptor sub driver for MT8195
>    drm/mediatek: add mediatek-drm of vdosys1 support for MT8195
> 
>   .../display/mediatek/mediatek,ethdr.yaml      | 188 ++++++
>   drivers/gpu/drm/mediatek/Makefile             |   2 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  26 +
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 533 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  85 ++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   6 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 129 +++--
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  58 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 366 ++++++++----
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  24 +-
>   drivers/gpu/drm/mediatek/mtk_ethdr.c          | 370 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ethdr.h          |  25 +
>   12 files changed, 1624 insertions(+), 188 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
> 



