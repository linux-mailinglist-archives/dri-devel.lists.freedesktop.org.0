Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA842B50B1D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 04:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2C10E356;
	Wed, 10 Sep 2025 02:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L325wlde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157610E356
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 02:36:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BA84540838;
 Wed, 10 Sep 2025 02:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE81C4CEF4;
 Wed, 10 Sep 2025 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757471769;
 bh=0H7itlJ0+/GdkQTyOfCGv/vZ5r2kkd58PNJCMOwIJPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L325wlde+o9ZmWvmWairncEVADIUea2Ju4p99hajBelDi4xgT8RXcWrQ18nHr605C
 neIKMSh6yiUwpoa7wXFDhWs+hSrRsgTOtn+CMgE2f1IvdZUxg2phyOJ1Etep3TDC/N
 8oq4iepC9MpB13hUVhyoewHxAENJ3VAKOWtZSXRHXvEGNWcZxQfGU13yno1lFhpM+7
 iZWNmoroilSgZblXLW0sjd8ri5tgw1k6eUDzTeG+DS71qYKkmb34Ye22AuAZKgjrvr
 n8J3YJDEnBg2JmeChRY97rnOQW1PBOr8C8Mp9Z0YfCXDRNdup40K58GCxidGOH87lt
 0yYLSMmwuX4qA==
Date: Tue, 9 Sep 2025 21:36:08 -0500
From: Rob Herring <robh@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 sjakhade@cadence.com, yamonkar@cadence.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com
Subject: Re: [PATCH v4] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
Message-ID: <20250910023608.GA3662482-robh@kernel.org>
References: <20250909054622.1439487-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909054622.1439487-1-h-shenoy@ti.com>
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

On Tue, Sep 09, 2025 at 11:16:22AM +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
> DPI/DP bridge.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
> Changelog v3 -> v4:
> -Remove maxItems as item list is mentioned for reg-names, resolves 
> dt_bindings_check warning.
> Log link- <https://gist.github.com/h-shenoy/5391ea514bb58a6cba3f39248d20916b>
> Link to v3- https://lore.kernel.org/all/20250908054609.1113360-1-h-shenoy@ti.com/
> 
>  .../bindings/display/bridge/cdns,mhdp8546.yaml | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e..b40630de6d89 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -27,6 +27,8 @@ properties:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>        - description:
>            Register block of mhdptx sapb registers.
> +      - description:
> +          Register block for mhdptx DSC encoder registers.
>  
>    reg-names:
>      minItems: 1
> @@ -34,6 +36,7 @@ properties:
>        - const: mhdptx
>        - const: j721e-intg
>        - const: mhdptx-sapb
> +      - const: dsc
>  
>    clocks:
>      maxItems: 1
> @@ -100,18 +103,25 @@ allOf:
>        properties:
>          reg:
>            minItems: 2
> -          maxItems: 3
> +          maxItems: 4
>          reg-names:
>            minItems: 2
> -          maxItems: 3
> +          items:
> +            - const: mhdptx
> +            - const: j721e-intg
> +            - const: mhdptx-sapb
> +            - const: dsc
>      else:
>        properties:
>          reg:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3
>          reg-names:
>            minItems: 1
> -          maxItems: 2
> +          items:
> +            - const: mhdptx
> +            - const: mhdptx-sapb
> +            - const: dsc

Still obviously not tested with a DT having this. Because this 
contradicts the top-level schema. Both cannot be true.

Rob
