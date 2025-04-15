Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF23A89544
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 09:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E748E10E361;
	Tue, 15 Apr 2025 07:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jcmq4Usi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41F10E361
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744702690;
 bh=voe72fPOWYDOgKbHC5pT7xXAC4bwfo9UuMDzcL8nkW4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jcmq4UsiCrCdB57TvR1j9uL06+uNAWSu32krqKm+keC4y0zXQLoMjN0x06AZAD5WG
 pbg9rRGMBM2YLbv+qADCCpO7E+OBB8H/iFh8c5S5Xhgi8XzS8+Sfrm5N+BniqBFuCx
 DXoOd0zYqfWuSjpZCQPSXJ5K7eJw9Kpf7Z56v1AudCc/jyizzfXtw3eJncl/rcySMJ
 7MkUPGTFis/mCv+LrGeQBM0S2orCbfLrdw0XDdSz38O3lARniX8hdB6Pw4oMNH5vxj
 dl9MWULi1K6pHVsYuOpNZRQWVC4Jbp6ZHFWWXyPjo7jcUaVJjgUp3nOpA+4l9UaD/D
 uOr8Cnz534Lhg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AF36017E0CA7;
 Tue, 15 Apr 2025 09:38:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, sebastian.fricke@collabora.com, 
 macpaul.lin@mediatek.com
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Message-Id: <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
Date: Tue, 15 Apr 2025 09:38:09 +0200
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

On Wed, 18 Dec 2024 11:53:17 +0100, AngeloGioacchino Del Regno wrote:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>   dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>   arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      commit: 2971de063fa56c18b2720ab19bdebca23cd96471
[2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      commit: cfb00dfa1b778a8037faf6973cca226e5ad4f45a
[3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      commit: f0935480253ede5405045a4e733f4476343cbb91

Cheers,
Angelo


