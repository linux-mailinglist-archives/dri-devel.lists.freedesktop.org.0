Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD76684CC41
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4811327C;
	Wed,  7 Feb 2024 14:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JRulxDwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363D911327C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 14:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D5445CE1903;
 Wed,  7 Feb 2024 14:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7FAC43399;
 Wed,  7 Feb 2024 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707314493;
 bh=g3Z88DUNdFcDu+TkPwpM/lXAN8LWu5w+gBGr1EpmKz8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JRulxDwtEBTvF/i1yphRDtxYZsJHZ3RoXyDmR0n20YayYd3ONvQFTdgJXhRAxzmGZ
 gy7IYcUWCGcjxAT9YcYGMYu3IT0be4Xt0Ye8/E/6JxJ7t40YjKGCSgwmQsLaMlHQLs
 UPWeFhafDy9VRlvQBtYE3hBGYj1aqYQqh+O1WERtnIG+TprXL/ih29DUpbrroPOb6k
 hJ0KVsG0fgj0CYAQrhScp5mdH3ZpXQTQrWaRIP6osmTy3FZ+VArt5vsPnNB8C2U0Rp
 YLnhKpBJClH5KwYXXFi52cG1cOhAKb+Lxj9+bfwUGtraZPN26DgOMngx/knYXongCD
 D8EvOFZVgV+xQ==
From: Vinod Koul <vkoul@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240111101738.468916-1-jstephan@baylibre.com>
References: <20240111101738.468916-1-jstephan@baylibre.com>
Subject: Re: [PATCH v5 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Message-Id: <170731448892.147119.12389092200889790020.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 15:01:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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


On Thu, 11 Jan 2024 11:17:30 +0100, Julien Stephan wrote:
> This is a new driver that supports the MIPI CSI CD-PHY version 0.5
> 
> The number of PHYs depend on the SoC.
> Each PHY can support D-PHY only or CD-PHY configuration.
> The driver supports only D-PHY mode, so CD-PHY
> compatible PHY are configured in D-PHY mode.
> 
> [...]

Applied, thanks!

[2/2] phy: mtk-mipi-csi: add driver for CSI phy
      commit: 673d70cb3c652ad6d97594e03225bbdf20226216

Best regards,
-- 
~Vinod


