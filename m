Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86888ACE7E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61144112AED;
	Mon, 22 Apr 2024 13:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iixz3cF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E40112AED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CCFE0CE01B7;
 Mon, 22 Apr 2024 13:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBABC113CC;
 Mon, 22 Apr 2024 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713793149;
 bh=aT4PQ5lC5s45eaoHkuUwSZZpTi8/HgCpiBvJiq65H6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iixz3cF+UZtX6hXDhGzB1/f/S2pBWT0Kx4vtFTQirpEOhjL/QuJJa7YPp5tS4wu39
 f8qunA41uat41G3IvI6voh6PBMZAF49UtYI1X0M5Dy+xzyHF0vRVhXAogd0pPI3rjX
 qzp5xaxRJgFigyl6IzetX8GCLxZzD2UuiTj9hpSP6mnSetZH4TSqW0i4KkimezbfzT
 3HG6xQNbITqhszhY1MdSB8AqMAghqh+T8mdwwIrq3WyozrjKcWmReNGQDj8BzpUbyi
 3nMcDiq36+siQ6Dfo3jn6P36uNwoWNRq5uxE0dhKEHtbbROeZoFvT78eG5vvb6Mo+v
 zalyiQF9eBElQ==
Date: Mon, 22 Apr 2024 08:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 07/17] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
Message-ID: <171379313275.1132930.2620391532022388821.robh@kernel.org>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
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


On Thu, 18 Apr 2024 16:16:55 +0200, Alexandre Mergnat wrote:
> Add dt-binding documentation of dpi for MediaTek MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

