Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B558BBF062C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6C110E3A6;
	Mon, 20 Oct 2025 10:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g2rBO0NM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE5610E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760954677;
 bh=x2mWF27zYDCpuMWgQWiHXG23FvxacWyah9lAcsG8EKc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g2rBO0NMHkK12kQUBh2/MnJcHSUsh7lgw5QWOV+xgsnebkOZih6VBCXL5zzG19MLI
 iSNorhpODz3CLPibaT0EJ7HBGNlun+xrfOi+1sQkJO1cImEtv+329Sf9OI1+vjHZ4O
 OLRAy32YUeWHalsEc1F5zVmicF9CAPtqIruVKPzv2aEmMZz1593P2RXgj6ushgb1jF
 xK5NoGNoEY6IdFNBaByYjwhJ9Yic+oMVBGVQP0wK+t8xdHmYrRv1V6ygr0Ht6jqqpx
 89HhIVA7BTRQiAvzbMQukFK0BdFqPx5VFf1c30g2CdDGPxRHL/IyvnyUFgme/ZlQOJ
 i6tM5ozWapRzw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B25EF17E0FAD;
 Mon, 20 Oct 2025 12:04:36 +0200 (CEST)
Message-ID: <336e7154-b618-466c-a9b5-cc15f0f62a27@collabora.com>
Date: Mon, 20 Oct 2025 12:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-8-jason-jh.lin@mediatek.com>
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
> The GCE in MT8196 is placed in MMINFRA and requires all addresses
> in GCE instructions for DRAM transactions to be IOVA.
> 
> Due to MMIO, if the GCE needs to access a hardware register at
> 0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
> the MMINFRA will not know whether to write to the hardware register or
> the DRAM.
> To solve this, MMINFRA treats addresses greater than 2G as data paths
> and those less than 2G as config paths because the DRAM start address
> is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
> DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
> less than 2G.
> For example, if the DRAM start address 0x8000_0000 is mapped to
> IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
> the address in the GCE instruction. MMINFRA will then see it as a
> data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.
> 
> Since the MMINFRA remap subtracting 2G is done in hardware and cannot
> be configured by software, the address of DRAM in GCE instruction must
> always add 2G to ensure proper access. After that, the shift functions
> do more than just shift addresses, so the APIs were renamed to
> cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
> 
> This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
> CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
> cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
> instructions.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


