Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D28A8B77
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70D10E1C8;
	Wed, 17 Apr 2024 18:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZPhq6wed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F1410E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:47:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C74B86168B;
 Wed, 17 Apr 2024 18:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC3FC4AF09;
 Wed, 17 Apr 2024 18:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379669;
 bh=c9Av6o+YhLzxWvGJbvdnDzM0A1WFzVOKqpppzIkYBew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPhq6wedeLHOrrwuCBotkgaK2YQvNJkASflMHQybFwz3oRVCTQ2VNF87Xk0H3mVgR
 ZAEyYaP51ItqOxFXP22SY2c+JHzneUkXlpeeG5Aq7pSrmwVG5pkjEd0L3qhfwfsTQT
 R/s1KIS7YafuNt7vFR9HvdvJYjjrbzpVw4tc6QVMpYesYDJ4SNZMK0J/UghzaiaXKD
 yxQI7ZqC1Ot+26HRMyJeyd0aWKKNW7xS4reJTEaFDzezQYIjMiw9Tk/tH0+m2IfoEk
 vFGQGoyzyFzyKyQUISfXQQNAGfPL4m0Y0CgxRaOPmi6PBsTlYaGMoodE9Odx5PuKtJ
 4AhlKSpugNDYg==
Date: Wed, 17 Apr 2024 13:47:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Will Deacon <will@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 09/18] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
Message-ID: <171337954796.3077788.17153176697074002741.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-9-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:10 +0200, Alexandre Mergnat wrote:
> Document the display Overlay on MT8365, which is compatible
> with that of the MT8192.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

