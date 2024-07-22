Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41D9396D5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 01:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A010E378;
	Mon, 22 Jul 2024 23:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C3il9FYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BAE10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 23:09:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59F4E60B33;
 Mon, 22 Jul 2024 23:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339C4C116B1;
 Mon, 22 Jul 2024 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721689782;
 bh=NGlE/zK3V8uU4SAbTwuzZ3cIuKp+b5xQHGxqVgK0RKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C3il9FYo6wStywXVPl8yU57lWzdCYNYl4/jUfDVPP3/tWLAESEHiwAlOtnRbvmcRm
 nagASD7zR+VkU8RDuvFUMUkIfG2dYhkEbyuUqYbImi/Ec9B12Cp415sWUnSm95Q214
 ol1FtEwWHwTsNXsAwzJSryPP9/pEdsva0p+H4XAdCq0rcl3dmy6IJHMHiZrN6LHj5e
 2JelYGpV4iJwiGGsmo/KvrtkPYjym/YkVFUjzlySGeYyRekvUtg3AW+Bv945Vh/nJE
 LHGBNnwZRxhGzH5Hg0i/tghY8hjJSm0zlKpIhXgigd8/gDZUy3s+KiwZw7UmYdt1VN
 iB8EdYy9z6rtA==
Date: Mon, 22 Jul 2024 17:09:34 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [DO NOT MERGE PATCH v2 11/16] dt-bindings: phy:
 mixel,mipi-dsi-phy: Allow assigned-clock* properties
Message-ID: <20240722230934.GA233475-robh@kernel.org>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-12-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-12-victor.liu@nxp.com>
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

On Fri, Jul 12, 2024 at 05:32:38PM +0800, Liu Ying wrote:
> assigned-clock* properties can be used by default now, so allow them.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * New patch as needed by MIPI/LVDS subsystems device tree.

Seems like this could go on its own, but if you don't want it merged 
then I don't need to review it.
> 
>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> index 3c28ec50f097..286a4fcc977d 100644
> --- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
> @@ -72,11 +72,6 @@ allOf:
>            contains:
>              const: fsl,imx8qxp-mipi-dphy
>      then:
> -      properties:
> -        assigned-clocks: false
> -        assigned-clock-parents: false
> -        assigned-clock-rates: false
> -
>        required:
>          - fsl,syscon
>  
> -- 
> 2.34.1
> 
