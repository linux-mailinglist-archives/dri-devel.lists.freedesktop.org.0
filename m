Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B88A8B58
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA009113756;
	Wed, 17 Apr 2024 18:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q8axs5js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DF8113756
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:43:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFBE760905;
 Wed, 17 Apr 2024 18:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B3FC072AA;
 Wed, 17 Apr 2024 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379429;
 bh=GoGburzh7FkizELo7yYYyqndy8Qgc/VgEIB9/YUTE2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8axs5jsyp6NQNvyM01T71kH7P0f0QJZ+LV7l/ImxNglfR042hbt8sGgOV2EVzD2y
 HvkEo7+f/FI4a1BpPOkI4N//5cmxMWTBud2fgfYIOLLAiuHOGUCeoizCi9lDu8a2y0
 X7k2e9zsheh/M5ChuNRQ1tG/Zy0okVw5zN21hVNr8bnJrbshUyRtI78R6b1XlST6+z
 baVFDACFXcfvCj3zWIyWi32iNlwmkraiAgecgIkusovSOtGitaOZ6zttCvK8Jw7tO3
 tyYAksQ3kqNNVVv7jyVGufKVlUDo06kWgkwaeBRXTDn+J9vD6836WVvsFydNhXfEN+
 f7qGp3x2fhLSg==
Date: Wed, 17 Apr 2024 13:43:47 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 CK Hu <ck.hu@mediatek.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jitao Shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/18] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
Message-ID: <171337930720.3072538.14983399612920659729.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-4-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:05 +0200, Alexandre Mergnat wrote:
> Document the display Dither on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

