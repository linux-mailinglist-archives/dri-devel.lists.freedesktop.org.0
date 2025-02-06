Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99943A2A6E4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 12:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774010E818;
	Thu,  6 Feb 2025 11:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CZOj5nDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0510E818
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738840125;
 bh=8iUqAlvy20/ugHD4XAj0Q41lxITTOI+gRyQEhcW7HYE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CZOj5nDpAp1zv5PZljzdV/FMlXFlD4v3Zb21YEOCZYH8SwwK1RMWv6skvvcp+rs3x
 IAwmpG89URgjHBJppYniq8fjNyKVN8ZC4Dp6r5XEySURd+4gT5TuXtFz7rug+7SUfj
 HYmnU8jzGNbEkijGY3BSh0bYiq8SnH5UzSGGSp47zjDk2z3uAeb21fk3nDy9M6wN4/
 /94x3YHscS4uLMrCOFt1h3RKKvzpDr/WjLTK5Kj/Dn/ohZAlUX5GWs3bAVZbWfue3o
 PjV5TjHdfugGkqgWe60+8NOAdWg/StUtwX/bSVa/uKnI0YDKhVMXm8bDa+ah4iYzNV
 JIvftXuxIoGtg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B615617E0FCC;
 Thu,  6 Feb 2025 12:08:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 amergnat@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Subject: Re: (subset) [PATCH v7 0/6] Add display support for the MT8365-EVK
 board
Message-Id: <173884012467.110657.7286906897029273506.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:44 +0100
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

On Fri, 10 Jan 2025 14:31:10 +0100, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>   - HDMI
>   - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>   - OVL0 (Overlay)
>   - RDMA0 (Data Path Read DMA)
>   - Color0
>   - CCorr0 (Color Correction)
>   - AAL0 (Adaptive Ambient Light)
>   - GAMMA0
>   - Dither0
>   - DSI0 (Display Serial Interface)
>   - RDMA1 (Data Path Read DMA)
>   - DPI0 (Display Parallel Interface)
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[5/6] arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      commit: ec207ea7f6f9abb5b0c50394b02f434aa1ca7e52
[6/6] arm64: dts: mediatek: add display support for mt8365-evk
      commit: b7b5052f6b13061db179cf2f0f16c3334e27239c

Cheers,
Angelo


