Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFEB2E533
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C8C10E7D7;
	Wed, 20 Aug 2025 18:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CozULjtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38B10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 18:55:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED15B601D7;
 Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD47C4CEE7;
 Wed, 20 Aug 2025 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755716109;
 bh=KrxBI4bw6u84H4zKkUEDYwKmV2iNFMyZmZhqsrfdtV8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CozULjtI87ezxw30qO0tiBXmd/B+a0DtFD8O0r1Ijt8QQQx8BThbtwW8QWNFZ8zwn
 GDhVSyvd/eTXNDvmuoKLP8gZbzIqwAavVeNAJTL9AD4T+oq9JD211sXJ3A9jIHdBe9
 oby2P2YVBQ3I8r9mQM/Lwt2RVdfRe2sGJcP/c1x3u1vg+xkh+l09/RNCiQufnL+vjh
 GyhWNZepnUHlVO7AOBcuUpAEM08nIs4SZGmNIG29XplZsZ5MYKbpImtIHpbPRBy/n6
 J3D2v1i3GLEYxCZCXE+oRmNdlWlQrHy63msQ03IsVrcWk7mI62sGbw7/ZkfMSJmtPd
 X3jYiXs/0WZXQ==
Date: Wed, 20 Aug 2025 13:55:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de,
 yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek,jpeg: Fix jpeg
 encoder/decoder ranges
Message-ID: <20250820185508.GA273751-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-15-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-15-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:13:02PM -0300, Ariel D'Alessandro wrote:
> Commit 14176e94bb35d ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg

That commit is not in any upstream tree.

> enc/decoder nodes") redefined jpeg encoder/decoder children node ranges.
> Update the related device tree binding yaml definition to match
> mediatek/mt8195.dtsi, as this is currently the only one using it.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../media/mediatek,mt8195-jpegdec.yaml        | 31 ++++++++++---------
>  .../media/mediatek,mt8195-jpegenc.yaml        | 15 ++++-----
>  2 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index e5448c60e3eb5..b1f3df258dc87 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -36,7 +36,7 @@ properties:
>  
>  # Required child node:
>  patternProperties:
> -  "^jpgdec@[0-9a-f]+$":
> +  "^jpgdec@[0-9],[0-9a-f]+$":

This is wrong unless 0-9 is a separate, distinct address (like a chip 
select #).

Rob

