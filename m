Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9CAFAB33
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 07:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135EE10E3FE;
	Mon,  7 Jul 2025 05:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CYuD4PVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575A310E3FE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 05:47:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52CE05C3A6B;
 Mon,  7 Jul 2025 05:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE30C4CEE3;
 Mon,  7 Jul 2025 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751867261;
 bh=RUg14gaLugN27TRVwpe1/3n2sC7iFkyWvPiH9pWUG9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CYuD4PVbP0qSkgXbrQHODHCo9u5/BJOYbdMDgQAtUvpp2B7ucekEBv+AksbJPBRpP
 8WzKchoYO8ih/2WNgc2BwGMjbSbLRwZ/JDRgyJsSvEou+QHFaGG7Pp42YtVaL9voaQ
 kBelBtaSmUfBb78jf2ZgxiaJXUE6eY2u4as2WPBoweekJjLif26ZHZFpdZGmkbsR2A
 5So4v0MbtIcuNnu9GpJ7MbMizRRgiAQP+PDGT3HAyciWBrofZBaOo15KBhvqAmvELw
 qjRYUCqb0Hri3Irx1cCLavkraaTQ8IQwYewBq0Nf3IWVsF0/ymbURtoBJer16JV7lW
 c4I+0Tiy/AY5A==
Date: Mon, 7 Jul 2025 07:47:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shangyao lin <shangyao.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 04/13] dt-bindings: media: mediatek: add cam-yuv binding
Message-ID: <20250707-fiery-conscious-squirrel-e0fa1e@krzk-bin>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
 <20250707013154.4055874-5-shangyao.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707013154.4055874-5-shangyao.lin@mediatek.com>
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

On Mon, Jul 07, 2025 at 09:31:45AM +0800, shangyao lin wrote:
> From: "shangyao.lin" <shangyao.lin@mediatek.com>
> 
> Add camera isp7x module device document.
> 
> ---
> 
> Changes in v2:
>   - Rename binding file to mediatek,mt8188-cam-yuv.yaml
>   - Various fixes per review comments
>   - Update maintainers list

Where did you post v1?

Please use standard email subjects, so with the PATCH keyword in the
title. 'git format-patch -vX' helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +properties:
> +  compatible:
> +    const: mediatek,mt8188-cam-yuv
> +
> +  reg:
> +    minItems: 1

What, why?

Look at other bindings.

> +    maxItems: 2
> +    description:
> +      Base address and optional inner base address of the cam-yuv hardware block.

Why are you stating obvious? From where did you take it?

> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: inner_base
> +    minItems: 1
> +    maxItems: 2

No, really no. You did not follow any existing patterns and this binding
does not look at all as anything else. Why making this things up? Just
use recently reviewed binding as starting point.

Best regards,
Krzysztof

