Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07ED01DE3
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0310E6C8;
	Thu,  8 Jan 2026 09:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Fy6ON4kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7FE10E6C9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767865056;
 bh=+QUCh+BiJaBruD2vdyKisViWbUs5fQdsky3TtckYH1s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Fy6ON4kUwZ7sOCvN0m9+ZwtFwRLoUBghzLMyZb0KTCNefUJkRsK7HOn8Xf3WgbnAY
 C6FFfzKThnYDfrm4/5X8yMkPsqch0SBLOJFWEv02DmIfTFcAH5R5ay6keNlJtRjsM2
 q3Tb87mS6hBwW3rsM1IlSMDVJK8jRb0BQt6PgkScPQP7DUIPN5x2kSGstiJmWxz/bU
 zFXXp3CBjoAIeke4xIvKlGVAFsAImrQCygWhaOp2Q/fJkx78c5UnxErlkKgC/Itlu8
 NIo58fwbwhOxxjRh7jpPlt3PDVxK05cPDj4Z4eqwnT+8f2mACjYBSDlGvrLtpzc9s2
 kttCq8N/OwYfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C4B4A17E11FB;
 Thu,  8 Jan 2026 10:37:35 +0100 (CET)
Message-ID: <e6c2c86d-71bd-453c-847c-1eff2be88be7@collabora.com>
Date: Thu, 8 Jan 2026 10:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
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
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
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

Il 31/10/25 16:56, Jason-JH Lin ha scritto:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>    1. [Fixes] Refine DMA address handling for the command buffer
>    - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>    2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>    3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>    4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>    5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> Please apply this series after the DMA address handling Fixes patch[1],
> and before the following series.
> 

Jassi, since this is touching both mailbox and soc/mediatek, can we avoid to create
immutable branches to pick this entire thing?

If you wish, I'm fine with you picking the soc/mediatek commits as well as the
mailbox ones, or I can pick the mailbox ones instead if you're okay with that.

Whole series is, of course...

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> 
> Jason-JH Lin (9):
>    arm64: dts: mediatek: Add GCE header for MT8196
>    mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
>      instruction
>    mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
>    mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
>      transaction
>    mailbox: mtk-cmdq: Add driver data to support for MT8196
>    soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
>    soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
>      subsys ID support
>    soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without
>      subsys ID
>    soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
>      addresses
> 
>   arch/arm64/boot/dts/mediatek/mt8196-gce.h | 612 ++++++++++++++++++++++
>   drivers/mailbox/mtk-cmdq-mailbox.c        |  74 ++-
>   drivers/soc/mediatek/mtk-cmdq-helper.c    |  77 ++-
>   include/linux/mailbox/mtk-cmdq-mailbox.h  |  19 +
>   include/linux/soc/mediatek/mtk-cmdq.h     |  93 ++++
>   5 files changed, 869 insertions(+), 6 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
> 



