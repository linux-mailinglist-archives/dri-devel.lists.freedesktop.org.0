Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6FD3A789
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 12:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6112810E167;
	Mon, 19 Jan 2026 11:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EfhulzcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150AE10E167
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768823886;
 bh=jTsRQd9AGY63xLGQjAR5MzI8ActOiX3EAiNvmnftFQs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EfhulzcFLtZYOZ0m0LmHUskUL8m/ch1z3bxJdaM9p/rUkGha6yndCy/wyVjOiWsDW
 E1NZHLLiWKtISCmc+9pm4BxoSiI6xjsy6yCuFmNEHr7AwH1DIL5X1XmflDM9TS68sD
 OOxN6zPEyolfCKTFiJzKCq4WCzgoKSMVzAQVfalmjp8oIOyXBTZZW9zPAWCWkd8Saj
 BFCW7QgWJWMsLYurQhwFb8jBrMPKV11p+Mi3oFhcSG5Ml24EPqdv1BCmQZpwI/Vh5q
 0HV4GwLUv6A35IMt8EoNIp0cAoNDPheLy0eTNoj6mYYt8Vw0AGoZhb0ZzET7B04qAR
 qP8Oys6/HXtNA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BBF7817E0117;
 Mon, 19 Jan 2026 12:58:05 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
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
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Message-Id: <176882388570.29723.2273368189503773750.b4-ty@collabora.com>
Date: Mon, 19 Jan 2026 12:58:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Fri, 31 Oct 2025 23:56:28 +0800, Jason-JH Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>   1. [Fixes] Refine DMA address handling for the command buffer
>   - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>   2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>   3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>   4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>   5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v6.19-next/soc, thanks!

[2/9] mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
      commit: 266f35701b6f7ddd9521310eb5add01001d4a614
[3/9] mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      commit: 7005b7cb2fff9081a6b1738b84a8ea12a6781fb3
[4/9] mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      commit: 1c1874843bc43d9f333d441af00f61ece2373e5d
[5/9] mailbox: mtk-cmdq: Add driver data to support for MT8196
      commit: 5ea617e818333a2078dadc11e5734886e39901d0
[6/9] soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
      commit: c775b23b1f78626daca804bd26f1460368f20406
[7/9] soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
      commit: 4bf783d8415cc397334b375a05f0b2321fc6c319
[8/9] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without subsys ID
      commit: 40dc5bbad63b5f60dd2e69a32def1a2673cba09e
[9/9] soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses
      commit: 22ce09ce1af574747fce072c3f62c29c440538d7

Cheers,
Angelo


