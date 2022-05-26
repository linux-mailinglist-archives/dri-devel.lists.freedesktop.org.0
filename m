Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899C534D3B
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CD510ED44;
	Thu, 26 May 2022 10:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538C110EBE2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:21:37 +0000 (UTC)
X-UUID: ab0ea9fc6ee54cb3a76822d40887aca9-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:009eb02e-ede3-409f-b892-9b2fbdb185ec, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:659c9447-4fb1-496b-8f1d-39e733fed1ea,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: ab0ea9fc6ee54cb3a76822d40887aca9-20220526
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 711455987; Thu, 26 May 2022 18:21:28 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 26 May 2022 18:21:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 18:21:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v22 0/5] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Thu, 26 May 2022 18:21:21 +0800
Message-ID: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chnage in v22:
- fix build fail in mtk_drm_drv.c:190

Change in v21:
- rebase on next-20220525

Change in v20:
- split binding patch to another series 'MediaTek MT8195 display binding':
  https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=295669
- fix io_start type from u32 to resource_size_t
- fix some commit message for DITHER enum

Change in v19:
- fix checking condition for the return vaule of platform resource
- drm/mediatek fix build waning for [-Wunused-const-variable]

Change in v18:
- change get driver data by io_start and wrap mmsys driver data into
  mmsys match data structure to support identifying multi mmsys driver
  data with the same compatible name
- change DDP_COMPONENT_DITHER to DDP_CONPONENT_DITHER0

Change in v17:
- change compatible name from 2 vdosys to 1 mmsys
- add get driver data by clk name function to get corresponding
  driver data for mt8195 vdosys0
- add all routing table setting for mt8195 vdosys0
- remove useless mutex define

Change in v16:
- rebase on linu-next tag: 'next-20220303'
- rebase on series: 'Fix MediaTek display dt-bindings issues'

Change in v15:
- remove mt8195-mmsys.h comment for mux settings
- define the mask macro to replace using value as mask
  to fix zero mask problem
- add EOF setting comment for MUTEX sof register

Change in v14:
- rebase on mediatek-drm-next-5.17
- rebase on "Add mmsys and mutex support for MDP" series
- rebase on "media: mediatek: support mdp3 on mt8183 platform" series

Change in v13:
- remove dts patch
- rebase on kernel-5.16-rc1
- rebase on mediatek-drm-next

Change in v12:
- add clock-names property to merge yaml
- using BIT(nr) macro to define the settings of mmsys routing table
- fix clk_get and clk_prepare_enable error handling issue

Change in v11:
- rebase on kernel-5.15-rc1
- change mbox label to gce0 for dts node of vdosys0
- change ovl compatibale to mt8192 to set smi_id_en=true in driver data
- move common module from display folder to common folder,
  such as AAL, COCLOR, CCORR and MUTEX

Change in v10:
- rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
- rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
- fix some typo and "mediatek" start with capital in every dt-bindings
- move mutex yaml from dfisplay folder to soc folder
- separate merge additional propoerties to an individual dt-bindings patch

Change in v9:
- separate power and gce properties of mmsys into another dt-binding patch
- rebase on "Separate aal module" series
- keep mtk_ddp_clk_enable/disable in the same place
- change mtk_dsc_start config register to mtk_drm_ddp_write_mask
- remove the 0 setting of merge fifo config function
- add CCORR driver data for mt8195

Change in v8:
- add DP_INTF0 mux into mmsys routing table
- add DP_INTF0 mutex mod and enum into add/remove comp function
- remove bypass DSC enum in mtk_ddp_comp_init

Change in v7:
- add dt=binding of mmsys and disp path into this series
- separate th modidfication of alphabetic order, remove unused define and
  rename the define of register offset to individual patch
- add comment for MERGE ultra and preultra setting

Change in v6:
- adjust alphabetic order for mediatek-drm
- move the patch that add mt8195 support for mediatek-drm as
  the lastest patch
- add MERGE define for const varriable 

Change in v5:
- add power-domain property into vdosys0 and vdosys1 dts node.
- add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h

Change in v4:
- extract dt-binding patches to another patch series
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (5):
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  drm/mediatek: add suffix 0 to DDP_COMPONENT_DITHER for mt8195 vdosys0
  soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 246 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  65 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 162 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 +
 include/linux/soc/mediatek/mtk-mmsys.h      |   3 +-
 9 files changed, 483 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c

-- 
2.18.0

