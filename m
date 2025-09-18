Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D587DB82870
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 03:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432F210E61A;
	Thu, 18 Sep 2025 01:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UP62X561";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273910E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 01:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA4866000A;
 Thu, 18 Sep 2025 01:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E853C4CEE7;
 Thu, 18 Sep 2025 01:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758159022;
 bh=IaCfp+f16H/Nhx85vEiEZ5gnjsJOfVdzE/53S5Y1PQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UP62X56180FV91VCsOM2cQ8SpBTs5wf1d20hB/IXItXZOJ/vQsCV4r3/xzU5LuYMe
 KemOAZBJKwxU3Huo/b5U46YCaj9KcwI8/HuRyiJ8mRWRO+zqgIR8oQFr/3f4A0eB3i
 2nnTITiI6/eDGZ2iw6MJIGMBFeoJ/gq2Rx2ZTYa2fFdWpTYZ93/8jw2/IfnKD93YL2
 n3RPdgj7OBcs0zBDR4uK0GJNezGHObunsIhFdmN0gtmts3Y1g8alN5Cnq/ffSbJsMt
 MNK2riV3r5ZhX9m2eYuy8iZtoK4qRNIAU4LtKlVE2E0BhRAUmSijh5hChIMqIuvplx
 KxQFRlcGDgIQQ==
Date: Thu, 18 Sep 2025 10:30:20 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 sjakhade@cadence.com, yamonkar@cadence.com, lumag@kernel.org,
 dianders@chromium.org, 
 jani.nikula@intel.com, luca.ceresoli@bootlin.com, andy.yan@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 devarsht@ti.com, u-kumar1@ti.com, s-jain1@ti.com,
 tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
Message-ID: <20250918-dandelion-guan-of-storm-fa2051@kuoka>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
 <20250915103041.3891448-2-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915103041.3891448-2-h-shenoy@ti.com>
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

On Mon, Sep 15, 2025 at 04:00:40PM +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
> DPI/DP bridge.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../display/bridge/cdns,mhdp8546.yaml         | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e..2a05a7d5847f 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -27,13 +27,12 @@ properties:
>            Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
>        - description:
>            Register block of mhdptx sapb registers.
> +      - description:
> +          Register block for mhdptx DSC encoder registers.
>  
>    reg-names:
> -    minItems: 1
> -    items:
> -      - const: mhdptx
> -      - const: j721e-intg
> -      - const: mhdptx-sapb
> +    description:
> +      Names corresponding to entries in the reg property.

No, top-level should have broadest constraints. In your case it is
min/maxItems.

Description is completely redundant. Wasn't here before, so why adding
it?

>  
>    clocks:
>      maxItems: 1
> @@ -100,18 +99,25 @@ allOf:
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

This is wrong. Previously CDNS variant had two items means it had
"j721e-intg". Now it's something else.

First, this is an ABI break.

Second, there is no explanation at all for it in the commit msg! Looks
like random change.

Read carefully writing-bindings doc.

Best regards,
Krzysztof

