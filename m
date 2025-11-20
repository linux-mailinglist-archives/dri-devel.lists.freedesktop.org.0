Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF27C72B15
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 09:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3293510E705;
	Thu, 20 Nov 2025 08:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bNDwayjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251A910E705
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:01:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D2DA44218;
 Thu, 20 Nov 2025 08:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F14DC4CEF1;
 Thu, 20 Nov 2025 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763625676;
 bh=As/jvSL3IOMOesT4YT8FTUNl6qTIMobi3j/9Q/djVfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bNDwayjqMBaNQq6I0g3hF1/1k3CoTowwwwDKr1LcY42MtGFeq/wvfmUNbEu44GrW5
 lOqKEcJlJTOk0kZITBBI/CpANTBv8wl0C+dpdsA+wXjjaYntwtaEgGUx38HEMOJlEL
 JdFqnELLhVW61FQPJZDZ69OciW49jsIzWCB0Q4eo+O0vc+IET/yvPmHRB4e5vu4m74
 68fx64bLHc3h2z9/efhNFRcWia/iYiS7rphoqDYH9rcN1beVqRvT3j7CYqzm8YhJYv
 b/kqY5NQsgEHSsXoSeDHMZcmUpATkzTR0ENABAdp3LUDrnny++JISLjfS0uq0toLPy
 cFHijzXBruLwA==
Date: Thu, 20 Nov 2025 09:01:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: robh@kernel.org, Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, conor+dt@kernel.org, devarsht@ti.com,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, 
 sjakhade@cadence.com, tzimmermann@suse.de, u-kumar1@ti.com,
 yamonkar@cadence.com, pthombar@cadence.com, nm@ti.com
Subject: Re: [PATCH v2] dt-bindings: drm/bridge: Update reg-name and reg
 description list for cdns,mhdp8546 compatible
Message-ID: <20251120-groovy-violet-tamarin-7ae42c@kuoka>
References: <20251119122447.514729-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119122447.514729-1-h-shenoy@ti.com>
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

On Wed, Nov 19, 2025 at 05:54:47PM +0530, Harikrishna Shenoy wrote:
> Remove j721e-intg register name from reg-name list for cdns,mhdp8546
> compatible. The j721e-integ registers are specific to TI SoCs, so they
> are not required for compatibles other than ti,j721e-mhdp8546.
> 
> Move the register name constraints and reg description list to the
> appropriate compatibility sections to ensure the correct register
> names are used with each compatible value also adding the DSC register
> to make bindings align with what the hardware supports.
> 
> Fixes: 7169d082e7e6 ("dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP")
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
> 
> Links to some discussions pointing to need for a fixes patch: 
> https://lore.kernel.org/all/20250903220312.GA2903503-robh@kernel.org/
> https://lore.kernel.org/all/d2367789-6b54-4fc2-bb7c-609c0fe084d3@ti.com/
> 
> Link to v1:
> <https://lore.kernel.org/all/20251107131535.1841393-1-h-shenoy@ti.com/>
> 
> Changelog v1 --> v2:
> -Update the reg description list for each compatible and add register space
> for dsc to make the bindings reflect what hardware supports although 
> the driver doesn't support dsc yet.
> 
> Note: j721e-integ are not optional registers for ti-compatible.
> 
>  .../display/bridge/cdns,mhdp8546.yaml         | 46 ++++++++++++-------
>  1 file changed, 29 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e2..6de4330d13f95 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -18,22 +18,9 @@ properties:
>  
>    reg:
>      minItems: 1
> -    items:
> -      - description:
> -          Register block of mhdptx apb registers up to PHY mapped area (AUX_CONFIG_P).
> -          The AUX and PMA registers are not part of this range, they are instead
> -          included in the associated PHY.
> -      - description:
> -          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> -      - description:
> -          Register block of mhdptx sapb registers.

You just removed completely upper constraint, so 20 items are valid...
This is exactly explained in writing schema. I expect here either oneOf
with two lists or maxItems.


>  
>    reg-names:
>      minItems: 1
> -    items:
> -      - const: mhdptx
> -      - const: j721e-intg
> -      - const: mhdptx-sapb

Please read writing schema and writing bindings.

Best regards,
Krzysztof

