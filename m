Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6AB42C74
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818CF10E94F;
	Wed,  3 Sep 2025 22:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IHY5IunM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC2D10E94F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 22:03:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1233E44977;
 Wed,  3 Sep 2025 22:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7DBC4CEF5;
 Wed,  3 Sep 2025 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756936994;
 bh=p/Vtnd9ExQcigtXvkp2n8XfYOV0CyJI9pZ18oK00OI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHY5IunMb9W5aL4RZhex31VnQbVSXjrttHqnVv5/FUuIG53MvtQGYW687uggHUP36
 zeQtz45hZGXgk0zUFHFGFU0tg3AeB/BUIeJrEllB+c1JVdjT4vIeGyab3I8GgWnGXp
 yQYXjBVEWXFjaZTq8cVxfvG8+StPttUoQztLdwy0FsIu5wMexNy+FtAbDCuXGRL3q2
 MdX7AkITz2ADPA0m6AiM/RQKFeTJF7tmoLCN88razpECpNPZjIckTY8pV8h5RMwEPb
 kkjJXIKPXciUhzsZw56MjSq1gHaBwcUnzWYZ3UiR71UdVbMWh25YZlltfpyO+cYtlF
 IDf+aBcDX0CMg==
Date: Wed, 3 Sep 2025 17:03:12 -0500
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
Subject: Re: [PATCH v2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for DSC
Message-ID: <20250903220312.GA2903503-robh@kernel.org>
References: <20250903111357.2605199-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903111357.2605199-1-h-shenoy@ti.com>
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

On Wed, Sep 03, 2025 at 04:43:57PM +0530, Harikrishna Shenoy wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add binding changes for DSC(Display Stream Compression) in the MHDP8546
> DPI/DP bridge.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8546.yaml        | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e..6e749c002669 100644
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
> +      - const: mhdptx-dsc

'mhdptx' is redundant. Don't continue that pattern. Just 'dsc'.

>  
>    clocks:
>      maxItems: 1
> @@ -100,18 +103,18 @@ allOf:
>        properties:
>          reg:
>            minItems: 2
> -          maxItems: 3
> +          maxItems: 4
>          reg-names:
>            minItems: 2
> -          maxItems: 3
> +          maxItems: 4
>      else:
>        properties:
>          reg:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3
>          reg-names:
>            minItems: 1
> -          maxItems: 2
> +          maxItems: 3

Have you tested this works? While it might work for TI with the 
j721e-intg registers in the middle, it won't work for platforms without 
them. You're going to have to have 2 lists of reg-names.

Rob

