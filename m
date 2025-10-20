Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF632BF0643
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B22710E3AF;
	Mon, 20 Oct 2025 10:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DRiBjE+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D741A10E394
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760954695;
 bh=VBCX/ItB0EIHTgqrUHuePoEoaOPJI7L4EOIA3Eaw0bg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DRiBjE+clR5+w6T4S11A8d7n78b1kXOEQgG9PoTAefEwttNUSUP8YFdDj+80iPr0X
 lKlK+rbERo48+A2Q0CjjvJbQLvyJrsOdmVWgRdUnl0F29WwE88CSrK22EiUcYKZkh4
 rPXE9S0v6VX+691uvebc0dZXL5c974/rmA4IQdw2BisERxM7LTNn8U5tshESEpJDwI
 J7Ya3W1Ag7Y0W5QBxXwT1Lvgc6Vfabb4nmn+F2TnEXgzXKvF19ZTqttrGNqg5wBDMN
 Y89c2rsmJV7b4PGlRbGjXPmQTlB1FS7/5Grr4UuVKfgsTwOq2J+RMuGGE2TbILlD4N
 0c0tNEs4fr3uQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A28F917E1278;
 Mon, 20 Oct 2025 12:04:54 +0200 (CEST)
Message-ID: <f0cccd9a-21fe-4496-b6e3-6f4a8beec158@collabora.com>
Date: Mon, 20 Oct 2025 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/20] Add GCE support for MT8196
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
> driver and related subsystems. The changes include adding compatible
> names and iommus property, updating driver data to accommodate hardware
> changes, and modifying the usage of CMDQ APIs to support non-subsys ID
> hardware.
> 

OK - after applying some last small changes as I pointed out in each patch,
the code is ready IMO.

To ease merging, though, I'd like you to split this series in multiple series:
  1. Addition of new functions and support for MT8196
  2. Migration of drm-mediatek, mailbox, mdp3 to the new functions
  3. Removal of the temporary functions that were introduced only for migration

This gives everyone the opportunity of getting just the relevant parts for each
merge cycle, avoiding possible confusion on what to pick and what not to.

Keep in mind that soc/mediatek and mailbox are from two different maintainers,
and you may need to split this in more than 3 series.

I believe that we might at least get a mailbox immutable branch if we want to
do this in 3 kernel versions, otherwise it's going to be four, I think.

Cheers,
Angelo


> ---
> Change in v8:
> 1. Use function pointer to select the correct CMDQ APIs when checking
>     subsys is support for the HW component.
> 
> Change in v7:
> 1. Rename cmdq_reg_shift_addr() and cmdq_reg_revert_addr() to
>     cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
> 2. Change cmdq_vm_toggle to cmdq_vm_init().
> 
> Change in v6:
> 1. Move the removal patches to the end of series.
> 2. Fix build error for cmdq_pkt_jump_rel_temp patch.
> 
> Change in RESEND v5:
> 1. Separate the removal of cmdq_get_shift_pa() from [PATCH v5 03/19] to a
>     single patch [PATCH RESEND v5 10/20].
> 
> Change in v5:
> 1. Rebase on tag: next-20250424 + patch [1].
> 2. Split adding driver data for MT8196 patch to 3 independent patch
>     and add more detail commit message to each patch.
> 3. Refine passing shift_pa as the parameter in API to storing it into
>     the cmdq_pkt.
> 4. Refine DMA address potential issue in cmdq mailbox driver.
> 5. Change the mminfra_offset related mbox API to passing it by cmdq_pkt.
> 6. Add new cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() APIs to
>     replace the cmdq_pkt_write().
> 
> [1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20250421035650.441383-1-jason-jh.lin@mediatek.com/
> 
> Change in v4:
> 1. Remove dt-binding header and add a gce header in dts folder.
> 2. Remove dot in sign-off name.
> 3. Change addr type from u32 to dma_addr_t for cmdq_reg_shift_addr() and
>     cmdq_reg_revert_addr().
> 
> Change in v3:
> 1. Merge 2 dt-bindings pathes together and add more detail commit message.
> 2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
> 3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
> 4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
>     cmdq_subsys_is_invalid().
> 5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
> 6. Rebase on the new MACRO in mtk-mdp3-comp.h.
> 
> Change in v2:
> 1. Remove the constant and fix warning in dt-bindings.
> 2. Remove the pa_base parameter of CMDQ APIs and related modification.
> 3. Move subsys checking to client drivers and use 2 alternative
>     CMDQ APIs to achieve the same functionality.
> 
> ---
> 
> Jason-JH Lin (20):

Series 1 start

>    arm64: dts: mediatek: Add GCE header for MT8196
>    mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
>    mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
>      instruction
>    soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
>    soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
>      shift_pa
>    mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
>    mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
>      transaction
>    mailbox: mtk-cmdq: Add driver data to support for MT8196
>    soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
>      subsys ID support
>    soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without
>      subsys ID
>    soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
>      addresses
>    soc: mediatek: Use reg_write function pointer for subsys ID
>      compatibility
>    drm/mediatek:Use reg_write function pointer for subsys ID
>      compatibility
>    media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
>    media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
>      cmdq_pkt_jump_rel_temp()
>    soc: mediatek: mtk-cmdq: Remove shift_pa parameter from
>      cmdq_pkt_jump()
>    media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa
>    soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
>      cmdq_pkt_jump_rel_temp()
>    soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
>      cmdq_pkt_write_mask()
>    mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
> 
>   arch/arm64/boot/dts/mediatek/mt8196-gce.h     | 612 ++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  12 +-
>   drivers/mailbox/mtk-cmdq-mailbox.c            | 113 +++-
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |   6 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |   6 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   2 -
>   .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   1 -
>   drivers/soc/mediatek/mtk-cmdq-helper.c        |  82 ++-
>   drivers/soc/mediatek/mtk-mmsys.c              |   8 +-
>   drivers/soc/mediatek/mtk-mutex.c              |   5 +-
>   include/linux/mailbox/mtk-cmdq-mailbox.h      |  19 +-
>   include/linux/soc/mediatek/mtk-cmdq.h         |  87 ++-
>   12 files changed, 879 insertions(+), 74 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
> 

