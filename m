Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3669B2095
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 21:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5910E058;
	Sun, 27 Oct 2024 20:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EEzL4258";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007010E058
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 20:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0AAD05C589D;
 Sun, 27 Oct 2024 20:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C105C4CEC3;
 Sun, 27 Oct 2024 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730062324;
 bh=YQvA8AaVapsjmTVTAY2FtWHoPIl3pWww+615y5P3MVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEzL4258ubi7gLAucsKes8CpIkt/0PJUde2W0lNeLxNeYwAvkwEj6ml8A1lXS/l64
 11G430dKvGGQyQNTK8z0QlGR8QvcdQi82gcIP5Aey1ZzlKGGpWy6VF6Nw7j+A+zgtJ
 WRh4hhPnsY5xoNfwUmOiuQbAXQhSyBIj8pMrLeCikpZqu59DAeW1ALwZLjFSaVbuqL
 BttcfwHQLxxHclh2wq4Ci+WD3q6ABNtl4EJsZMdQ5YY2hYz8fI+DFVU8glTznoVnDb
 aZmJ/kqWVwMQzUVhp6taLq0in7zgRqxNx3OAO49fU9c0OqeE8EAuCSFrAINoQL/2cN
 iYX5BYYX2Ik/Q==
Date: Sun, 27 Oct 2024 21:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jitao shi <jitao.shi@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells
 property
Message-ID: <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
References: <20241025104310.1210946-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025104310.1210946-1-fshao@chromium.org>
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

On Fri, Oct 25, 2024 at 06:42:45PM +0800, Fei Shao wrote:
> The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
> property is required to describe DAI links and audio routing.
> 
> Add "#sound-dai-cells" property to the binding and filter out non-DP
> compatibles, as MediaTek eDP doesn't support audio.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> index 2aef1eb32e11..c05c2b409780 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -42,6 +42,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  "#sound-dai-cells":
> +    const: 0
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> @@ -87,6 +90,19 @@ required:
>  

You need to reference dai-common instead, since this is DAI.

>  additionalProperties: false

and this becomes unevaluatedProperties: false

Best regards,
Krzysztof

