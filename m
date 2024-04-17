Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D78A8B80
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 20:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3784611376B;
	Wed, 17 Apr 2024 18:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fSHNArYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112FD11376B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 18:48:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8144261681;
 Wed, 17 Apr 2024 18:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ECDC32781;
 Wed, 17 Apr 2024 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713379722;
 bh=vQJuYu8n6tKRsxdPMUC68Q9FqABjhqR4vGFq0S3iuzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSHNArYJs5xOZGB0K0u7Tpp3XYM0KQpcIr8ol9MM0hAKFrG6mp1bcx/JpDfvdqYoQ
 l0yGgmbsUzw9xMZW2i61pR+pFfs8kpXWexlx6KReXrAwvAgJaPaemXxhrnNh34YWSY
 QUQLvhkqEczRD3cP+tIGCjYm1JzozVAj2YN6oc9giSdYLTP16ocmbXVtzvKORjrrM4
 KNYk/Re9IRy8RR0ygmPkxj2i1oOjFzmEwqfHZp8Lwe9CDUXVQZ0au0u3Kr92lVWDTk
 XvXaiZZmEwtRlvDRx9kfv7DGnbHFXaJ20+EMv/Yt1hQA7dRO9z52evtibPPfc5wPxo
 dZZqIjE0y+sDA==
Date: Wed, 17 Apr 2024 13:48:40 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-pwm@vger.kernel.org,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-mediatek@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 10/18] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
Message-ID: <171337955722.3078087.17269259484648392876.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
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


On Tue, 16 Apr 2024 17:53:11 +0200, Alexandre Mergnat wrote:
> Document the display Data Path Read DMA on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

