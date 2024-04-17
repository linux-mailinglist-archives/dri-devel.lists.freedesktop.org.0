Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34DB8A8B53
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5010F79A;
	Wed, 17 Apr 2024 18:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rW1Ay7cc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6595C10F79A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:43:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8920E61655;
 Wed, 17 Apr 2024 18:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77C2C072AA;
 Wed, 17 Apr 2024 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379411;
 bh=dFYWzHQ5XhOLNcLBWopk7yt+oDCScDnJkVXbAbyCzQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rW1Ay7ccX1KEO4VVvbsYKxiFm5kp1rXQq6OTSarcxSyYeD5R6JxicGVX0yM9cGnEb
 tmUCi7sq9lwhOcyLl4KuGDQmXYcvjNe+B0uYmDWCOweZwbhosal+utYl8ydaJ7i9AB
 ZgJ/qXnsqAqHGD5L/+vkWBlLwW1owqK0i2+6xgErjZyxEWkhdv8MbZ5PcHsh8XkWJF
 bBIPEiF4omhN+HCw6K3LwcLFRBU5Saj37GqGZ2yDInEpNuJcEv52XYqE/9/LRYDdBH
 VuHGuZIUHT+jIDUW8jWZYBnY8Sb2YFiqjusN9R53+z+BL2ypemRsNnNFib8NCnQm4m
 /UalqQQPIgfMQ==
Date: Wed, 17 Apr 2024 13:43:28 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Will Deacon <will@kernel.org>,
 CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
Message-ID: <171337929795.3072251.7033355429164409851.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-3-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:04 +0200, Alexandre Mergnat wrote:
> Document the display Color on MT8365, which is compatible
> with that of the MT8173.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

