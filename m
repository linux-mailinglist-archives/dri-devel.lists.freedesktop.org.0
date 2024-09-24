Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745649844E9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AB710E887;
	Tue, 24 Sep 2024 11:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qVNGk8xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAD610E887
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727177853;
 bh=ZNGj3fXHWNs2Yk3ko4od30ZdDG3zCz60t4Vi+H2gtZ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qVNGk8xh/0Dq8GQ1/4BfpatCqrWfmnwGhgki469IObqRc1ZnyDbIcn/WzoW9Re2XM
 Cik24nKD3FoGA7erHPx3DnbbQB3e2j44+TyCO3QqK/huM+IJe2jsHF/GRt6OJ22q6s
 /X9QVoJfvia1Bv3ViHSspzXUBQVvVnszIS1zHqfzqKE0121iX9TBNGcAeOO7AkNUt2
 EJdfXhhPdsJ3ttI2HYIe/KbBEbuDqtgcKoy80NWUa3ilGESyvJ26YtnqqDgqOdy779
 ztzFuV6IuT/UPFz9ULNu3iFh3eEl5aygmOVZgK/iiZLeQPDwoi4zpLZ8AI84126DZZ
 HL+FLuJvQn2AQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 971C417E1245;
 Tue, 24 Sep 2024 13:37:32 +0200 (CEST)
Message-ID: <459b17d4-439d-4f09-aa0e-f18f9cc184b3@collabora.com>
Date: Tue, 24 Sep 2024 13:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: mt8195: Fix dtbs_check error for
 infracfg_ao node
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-1-macpaul.lin@mediatek.com>
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> The infracfg_ao node in mt8195.dtsi was causing a dtbs_check error.
> The error message was:
> 
> syscon@10001000: compatible: ['mediatek,mt8195-infracfg_ao', 'syscon',
>                   'simple-mfd'] is too long
> 
> To resolve this, remove 'simple-mfd' from the 'compatible' property of the
> infracfg_ao node.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


