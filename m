Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443ACCE859B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 00:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BEB10E775;
	Mon, 29 Dec 2025 23:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="icO1QuhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E7B10E775
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 23:39:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACFE56000A;
 Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25287C4CEF7;
 Mon, 29 Dec 2025 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767051566;
 bh=EmSJ5RDGVomtHdjap3p2iZ3idrkRaL1n89LOHs60OJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=icO1QuhOjcRTRYphaT9ckAEZt0a0F+8OshHNBctrUvrJXtiiy7JaMhapPmNeMdbbH
 FxF/OsXFQt969xNxNdQtlo2E5D0g43ylTD/qTFQf8pfELCjts7u+xl9lxFMgFc4nwb
 XH+1qzLXwx6wQKy7+NXrxQpJD0N6Rp+NTLaKPtkzC3tlxnQns8GrJjZ2HWgNdHOrbH
 nP+wLabskLg8g0/SDbxwZvpG9xIbWVosokA3/pdLKS4HKzoGwB4WAVYe9XXZS+TkdB
 mrRMRwFEn5eHYbKrCWo402kuwyHMpxP6G8soqrjfkKkummYcTTccAb4cTtNqcbZrSf
 zdJXogqnZM0gw==
Date: Mon, 29 Dec 2025 17:39:25 -0600
From: Rob Herring <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
Message-ID: <20251229233925.GA2796847-robh@kernel.org>
References: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
 <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
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

On Thu, Dec 18, 2025 at 07:44:49PM +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 34147127192f..ccaa2d0a2669 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -27,11 +27,14 @@ properties:
>        - const: mclk
>  
>    dmas:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    dma-names:
>      items:
>        - const: tx
> +      - const: mdma_tx
> +    minItems: 1
>  
>    resets:
>      maxItems: 1
> @@ -40,6 +43,14 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandles to a reserved SRAM region which is used as temporary

phandle to...

> +      storage memory between DMA and MDMA engines.

> +      The region should be defined as child nodes of the AHB SRAM node
> +      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml

Drop this sentence.

Rob
