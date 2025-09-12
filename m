Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC0B5427A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7E710E442;
	Fri, 12 Sep 2025 06:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jROHFO4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCB10E442
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:07:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33471407F5;
 Fri, 12 Sep 2025 06:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A93C4CEF4;
 Fri, 12 Sep 2025 06:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757657265;
 bh=Orb+VsfkJaRzsj41NR7vEo3YY27Pbey1RakvGK1RuKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jROHFO4OhNFjQA0LwB4XzJQ1Bald5dpNoHBInnMm4SwxCfSU/DOyUefTNvHSwsi7b
 p5mlc7/j808w2wwrozVhRth2bXxKv/bUg7GFFDKqiFeQl1qI37ZezJKqBvSBVEc39g
 FK7NmcUk6O7jMlm9okELv7RVWi6xNjI6nGP+JzEuSH1+HFLYnmhwHntwYzLDuJqtRQ
 CMKzglUBwGwWTzMHuor4H7BMfN8gsx/hhYIMcFqyqyT1tYiWwKIZd+ZZXYDKdRQvnB
 PpJOjZUXx3ep7XTHxtXpBJZqPi7f9E1veLLM2f7vG6o4k+O/J0kyASYvGMOxW3kXz8
 3hZtAOwZjqXLQ==
Date: Fri, 12 Sep 2025 08:07:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, 
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, 
 houlong.wei@mediatek.com, jeesw@melfas.com, kernel@collabora.com,
 krzk+dt@kernel.org, 
 kuba@kernel.org, lgirdwood@gmail.com, linus.walleij@linaro.org, 
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, 
 marcel@holtmann.org, matthias.bgg@gmail.com, mchehab@kernel.org, 
 minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de,
 pabeni@redhat.com, 
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
 support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 02/12] dt-bindings: media: Convert MediaTek mt8173-vpu
 bindings to DT schema
Message-ID: <20250912-unselfish-quiet-hound-46689b@kuoka>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911151001.108744-3-ariel.dalessandro@collabora.com>
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

On Thu, Sep 11, 2025 at 12:09:51PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 Video
> Processor Unit to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-vpu.yaml   | 74 +++++++++++++++++++
>  .../bindings/media/mediatek-vpu.txt           | 31 --------
>  2 files changed, 74 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

