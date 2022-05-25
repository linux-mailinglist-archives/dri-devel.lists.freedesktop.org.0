Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431C533A3F
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 11:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4A10F4F9;
	Wed, 25 May 2022 09:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69710F4F9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 09:50:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 71BAF1F44B84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653472204;
 bh=syTUXEsw9/n/6NDfW7WVBL7ZaRtUq32UuldrTBYAPc4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cUME8Mii9tR0Tu01mYdGkHp05qEJkOXwdrQIlvvfG38MQrP5H3GB6ASGPt9iwDqgv
 d1mRtNNHL1u+o4bjHckBdvy5LqcIiLNB/+TGq8Zt2paL3/AO0a7XCsF1e5I04EVCvn
 KDTyX8xJHIT1GYRk7c6lh+jl8fnPDZDeJEOak7bxJwGPv/sph7p+SHf8EGqGZYT3Tb
 cMLALx0Bg0h25UbxIml54g7j5SnPiPH5ZAT5Dp7DFGV3CHcFAJSDpWBxTZlAh3H2gN
 /6Du8ufh33EOgXlIgWtnnVhCMXYJ7X3BEkwRZgFyrGfd+d5BWEmIGYUL1kB7yJ9fD0
 RFYnM0I0gTxeg==
Message-ID: <43a102cf-6971-8083-d24f-629d6d39810f@collabora.com>
Date: Wed, 25 May 2022 11:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v20 0/8] Add Mediatek Soc DRM (vdosys0) support for mt8195
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
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
 jason-jhlin <jason-jh.lin@mediatek.corp-partner.google.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/04/22 11:41, jason-jh.lin ha scritto:
> From: jason-jhlin <jason-jh.lin@mediatek.corp-partner.google.com>
> 

Hello Jason,

this series does not apply cleanly anymore on next-20220525, can you please
rebase and resend?

I hope that with a bit of coordination, we can get the entire display stack
finally upstreamed in v5.19... it's been quite a while... :-)

Cheers,
Angelo

> Change in v20:
> - split binding patch to another series 'MediaTek MT8195 display binding':
>    https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=295669
> - fix io_start type from u32 to resource_size_t
> - fix some commit message for DITHER enum
> 
> Change in v19:
> - fix checking condition for the return vaule of platform resource
> - drm/mediatek fix build waning for [-Wunused-const-variable]
> 
> Change in v18:
> - change get driver data by io_start and wrap mmsys driver data into
>    mmsys match data structure to support identifying multi mmsys driver
>    data with the same compatible name
> - change DDP_COMPONENT_DITHER to DDP_CONPONENT_DITHER0
> 
> Change in v17:
> - change compatible name from 2 vdosys to 1 mmsys
> - add get driver data by clk name function to get corresponding
>    driver data for mt8195 vdosys0
> - add all routing table setting for mt8195 vdosys0
> - remove useless mutex define
> 
> Change in v16:
> - rebase on linu-next tag: 'next-20220303'
> - rebase on series: 'Fix MediaTek display dt-bindings issues'
> 
> Change in v15:
> - remove mt8195-mmsys.h comment for mux settings
> - define the mask macro to replace using value as mask
>    to fix zero mask problem
> - add EOF setting comment for MUTEX sof register
> 
> Change in v14:
> - rebase on mediatek-drm-next-5.17
> - rebase on "Add mmsys and mutex support for MDP" series
> - rebase on "media: mediatek: support mdp3 on mt8183 platform" series
> 
> Change in v13:
> - remove dts patch
> - rebase on kernel-5.16-rc1
> - rebase on mediatek-drm-next
> 
> Change in v12:
> - add clock-names property to merge yaml
> - using BIT(nr) macro to define the settings of mmsys routing table
> - fix clk_get and clk_prepare_enable error handling issue
> 
> Change in v11:
> - rebase on kernel-5.15-rc1
> - change mbox label to gce0 for dts node of vdosys0
> - change ovl compatibale to mt8192 to set smi_id_en=true in driver data
> - move common module from display folder to common folder,
>    such as AAL, COCLOR, CCORR and MUTEX
> 
> Change in v10:
> - rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
> - rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
> - fix some typo and "mediatek" start with capital in every dt-bindings
> - move mutex yaml from dfisplay folder to soc folder
> - separate merge additional propoerties to an individual dt-bindings patch
> 
> Change in v9:
> - separate power and gce properties of mmsys into another dt-binding patch
> - rebase on "Separate aal module" series
> - keep mtk_ddp_clk_enable/disable in the same place
> - change mtk_dsc_start config register to mtk_drm_ddp_write_mask
> - remove the 0 setting of merge fifo config function
> - add CCORR driver data for mt8195
> 
> Change in v8:
> - add DP_INTF0 mux into mmsys routing table
> - add DP_INTF0 mutex mod and enum into add/remove comp function
> - remove bypass DSC enum in mtk_ddp_comp_init
> 
> Change in v7:
> - add dt=binding of mmsys and disp path into this series
> - separate th modidfication of alphabetic order, remove unused define and
>    rename the define of register offset to individual patch
> - add comment for MERGE ultra and preultra setting
> 
> Change in v6:
> - adjust alphabetic order for mediatek-drm
> - move the patch that add mt8195 support for mediatek-drm as
>    the lastest patch
> - add MERGE define for const varriable
> 
> Change in v5:
> - add power-domain property into vdosys0 and vdosys1 dts node.
> - add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h
> 
> Change in v4:
> - extract dt-binding patches to another patch series
> - squash DSC module into mtk_drm_ddp_comp.c
> - add coment and simplify MERGE config function
> 
> Change in v3:
> - change mmsys and display dt-bindings document from txt to yaml
> - add MERGE additional description in display dt-bindings document
> - fix mboxes-cells number of vdosys0 node in dts
> - drop mutex eof convert define
> - remove pm_runtime apis in DSC and MERGE
> - change DSC and MERGE enum to alphabetic order
> 
> Change in v2:
> - add DSC yaml file
> - add mt8195 drm driver porting parts in to one patch
> - remove useless define, variable, structure member and function
> - simplify DSC and MERGE file and switch threre order
> 
> jason-jh.lin (8):
>    soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
>    soc: mediatek: add mtk-mutex support for mt8195 vdosys0
>    drm/mediatek: add DSC support for mediatek-drm
>    drm/mediatek: add MERGE support for mediatek-drm
>    drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
>    soc: mediatek: add DDP_DOMPONENT_DITHER0 enum for mt8195 vdosys0
>    drm/mediatek: add suffix 0 to DDP_COMPONENT_DITHER for mt8195 vdosys0
>    soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
> 
>   drivers/gpu/drm/mediatek/Makefile           |   1 +
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>   drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 246 +++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |   6 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  65 +++-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 151 +++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 +
>   drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
>   drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mt8195-mmsys.h         | 370 ++++++++++++++++++++
>   drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
>   drivers/soc/mediatek/mtk-mmsys.c            | 152 +++++++-
>   drivers/soc/mediatek/mtk-mmsys.h            |   6 +
>   drivers/soc/mediatek/mtk-mutex.c            |  95 ++++-
>   include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
>   18 files changed, 1098 insertions(+), 40 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>   create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h
> 


