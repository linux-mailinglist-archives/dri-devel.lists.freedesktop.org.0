Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FF8814B3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D931710E5C4;
	Wed, 20 Mar 2024 15:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="abSMw8WC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2B610F024
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A5296100C;
 Wed, 20 Mar 2024 15:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2401C433C7;
 Wed, 20 Mar 2024 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710949047;
 bh=fmLM09aW3YMSQUrUIHkdieapEFOUqgns1Zezwr2fW5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=abSMw8WCvv/cRC1zXjoJEzMk+LxTZ7NCQqlpkGarPVeeMTqrG30+9LUHHk5+M4lqK
 Qgj2QSrZLK23wcbpLpb1A1T3vEBy08/EAgtQYDrAxLdigXL1dmZXfgr7NoZ2u3mUBy
 T6Mei1P5bZrRO8uk8K+ZMJ7jRnF6+o5mR6gkhyIUxcSCsBrKRGGRTiAWxJqidiLdo0
 NQA/YDRHd9ccTWHBy4dLgp0LFWn/A3aA+BirQ0Oun8nL0vYn9nwL9JzAq1emPemesx
 AnTJd2KX/aZd5N2+dzNOmFd7EeRzhd/n1F3Qo8+JUjUT9/bP845TrqCFmJ1/vJTThR
 +5/QHr5JEJ1wQ==
Date: Wed, 20 Mar 2024 10:37:25 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: display/xlnx/zynqmp-dpsub: Add audio
 DMAs
Message-ID: <20240320153725.GA1771730-robh@kernel.org>
References: <20240319-xilinx-dp-audio-v2-0-92d6d3a7ca7e@ideasonboard.com>
 <20240319-xilinx-dp-audio-v2-2-92d6d3a7ca7e@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319-xilinx-dp-audio-v2-2-92d6d3a7ca7e@ideasonboard.com>
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

On Tue, Mar 19, 2024 at 10:22:37AM +0200, Tomi Valkeinen wrote:
> The DP subsystem for ZynqMP support audio via two channels, and the DP
> DMA has dma-engines for those channels. For some reason the DT binding
> has not specified those channels, even if the picture included in
> xlnx,zynqmp-dpsub.yaml shows "2 x aud" DMAs.

New required entries is an ABI change. This message kind of indicates it 
was a mistake, but should be a lot more explicit. Are things broken 
without the entries? Need 'Fixes'?

> 
> Add the two audio DMAs to the binding.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> index 554f9d5809d4..6b754d4f260e 100644
> --- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> +++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
> @@ -100,12 +100,16 @@ properties:
>        - description: Video layer, plane 1 (U/V or U)
>        - description: Video layer, plane 2 (V)
>        - description: Graphics layer
> +      - description: Audio channel 0
> +      - description: Audio channel 1
>    dma-names:
>      items:
>        - const: vid0
>        - const: vid1
>        - const: vid2
>        - const: gfx0
> +      - const: aud0
> +      - const: aud1
>  
>    phys:
>      description: PHYs for the DP data lanes
> @@ -194,11 +198,13 @@ examples:
>          power-domains = <&pd_dp>;
>          resets = <&reset ZYNQMP_RESET_DP>;
>  
> -        dma-names = "vid0", "vid1", "vid2", "gfx0";
> +        dma-names = "vid0", "vid1", "vid2", "gfx0", "aud0", "aud1";
>          dmas = <&xlnx_dpdma 0>,
>                 <&xlnx_dpdma 1>,
>                 <&xlnx_dpdma 2>,
> -               <&xlnx_dpdma 3>;
> +               <&xlnx_dpdma 3>,
> +               <&xlnx_dpdma 4>,
> +               <&xlnx_dpdma 5>;
>  
>          phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
>                 <&psgtr 0 PHY_TYPE_DP 1 3>;
> 
> -- 
> 2.34.1
> 
