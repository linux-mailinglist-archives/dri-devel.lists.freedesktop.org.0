Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A994A984507
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC6210E6A7;
	Tue, 24 Sep 2024 11:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TYUC6mb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06710E6A7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727178122;
 bh=+fsK5xp17nTvCAyZ/wFo8VTI8Bqp558Z+p7y9KUbR8I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TYUC6mb1OIjY9Tr4ZxGTLJPC5ICHePECuoh+hbdqqWwlnd3qgZaJRM5v6doRGjr4E
 JssL9RyNYt5kthsIhU+xnWA8wxsQ6HgsAnsCTr+on15AtWym1LAfL3QFAEJQV3UIrE
 jgNHeU0+9wT2d0+AOn4Nl3kHCb5I+pYYMbBoMiS8MnkGipijHC222pyGsy8wf+DwVy
 3prdbZ1y6xMH2um7supv3bRfkkPU/FYWqq28nvEfAq2GQMDTmVqFcnBfQgS8SluzAz
 epQ8kO5TXXkI0TPtiJfC0P4bjNw7dh1f5uRGmP0LAr0Fm2Hb/aerekXUorzNzFbX9S
 LU2kNeswr0z4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAC317E107A;
 Tue, 24 Sep 2024 13:42:01 +0200 (CEST)
Message-ID: <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
Date: Tue, 24 Sep 2024 13:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>    display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, add "maxItems: 3" to the 'clocks' property in
> the DT schema.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..42d2d483cc29 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,7 @@ properties:
>     clocks:
>       items:
>         - description: SPLIT Clock

That's at least confusing (granted that it works) - either add a description for
each clock and then set `minItems: 1` (preferred), or remove this "SPLIT Clock"
description and allow a maximum of 3 clocks.

Removing the description can be done - IMO - because "SPLIT Clock" is, well,
saying that the SPLIT block gets a SPLIT clock ... stating the obvious, anyway.

Cheers,
Angelo

> +    maxItems: 3
>   
>   required:
>     - compatible

