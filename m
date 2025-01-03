Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A99A0072D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 10:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34F10E1A6;
	Fri,  3 Jan 2025 09:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GL+kYDBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE4E10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735897254;
 bh=5vztbglS15xfKUbDC0vnLnilTZgDf+eQTTloOlJ6PzY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GL+kYDBxGaj2JbhB31ScE3ZtMIvO1L52hieMQmb4KxB+BjlshE5t4oUSGDjoEGglY
 3p+zpaULxfHftzj2Zx+N8v6ZjqDkbLX2Vs35/02d6kPK0q+xLJ3g9NV5WUqCl0Qwla
 Rr0GAaSKGs0FMigIsaNc1Lx++qE8aQzMzldn0+Wu+3hUO9zM3JWXhl5iLrFgRzUkRR
 CDdMWBdCGENkraKEFyBK8kkum7w1Le3ZnNlIZieV7KFBJIdB6zfqpV/qu8XNAhmopj
 lomCwAamuJoNIP/qAQAvA0++VB0yGzGeIzRQV0azedbx3jwk7RXNsLXmy5zH1W3LpE
 o+p8kVDiHYvxQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EB1E17E1541;
 Fri,  3 Jan 2025 10:40:53 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
In-Reply-To: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v3 0/4] Update MT8188 OVL compatible from MT8183 to MT8195
Message-Id: <173589725358.61653.1284687133545128429.b4-ty@collabora.com>
Date: Fri, 03 Jan 2025 10:40:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Fri, 20 Dec 2024 02:15:27 +0800, Jason-JH.Lin wrote:
> This patch series updates the compatible strings for the MediaTek OVL
> in the MT8188 dts and the corresponding dt-binding.
> The changes ensure that the MT8188 OVL device is correctly identified
> and managed by the appropriate drivers.
> 
> The first patch is adding the MT8188 compatible strings, refer to:
> - https://lore.kernel.org/all/20241218105320.38980-2-angelogioacchino.delregno@collabora.com/
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/4] dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188 MDP3
      commit: eb27e8d75b83c0781eb330f356d4442177674e74
[2/4] dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
      commit: 5ecd1e700b67b33fac1a48d86fea124b6c19d052
[3/4] dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to MT8195
      commit: 7c791dc2cb62f8ec523872108c8a8c718512c218
[4/4] dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
      commit: f72561bf756baba4ab300bfc728fefd85c67913e

Cheers,
Angelo


