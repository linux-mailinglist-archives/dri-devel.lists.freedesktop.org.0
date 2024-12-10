Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735999EBD7C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EDF10E075;
	Tue, 10 Dec 2024 22:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rHc4Fdum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5EC10E075
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 22:15:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 344C55C5B5E;
 Tue, 10 Dec 2024 22:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351F7C4CED6;
 Tue, 10 Dec 2024 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733868910;
 bh=3x4SgvgxpD/lcEUf3nJ+mjH3qTFRRg7PIFRh0uDdLlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHc4FdumgPQ+I6A2FJ6RnWwGc0HaSnQsLrVKxDly7JbPsBhnwWvn72/Nn689Wuqkm
 obCpEtWZitbcfbR65XcrDV/ZhF9KBPAoEvHEQ0gvmNkSJCwGbxyACOTAAc/sCcWNlD
 nFZSD0zH2HLB+8Yv6/0Yh4Ie4n/whG3Nb3x/j2pxJdYenYJHFhg5TO2ufhJQRvGA4Q
 +UFz8q5+HJMcMI66JctRNjv809VrNHAfyNTEDNrP3aUSdghd/CE2os5bhRmPMO/E15
 6cTTsq0ykol5TEDftvEIQmGtULteXOkL2wj2Y4Eq1SfoRbPQ5x0XXoSTYOuunzSJwo
 0B2TTlBlYVglA==
Date: Tue, 10 Dec 2024 16:15:08 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Message-ID: <20241210221508.GA550635-robh@kernel.org>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209033923.3009629-2-victor.liu@nxp.com>
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

On Mon, Dec 09, 2024 at 11:39:05AM +0800, Liu Ying wrote:
> Freescale i.MX8qxp Display Controller is implemented as construction set of
> building blocks with unified concept and standardized interfaces.  Document
> all existing processing units.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6:
> * No change.
> 
> v5:
> * Document aliases for processing units which have multiple instances in
>   the Display Controller.  Drop Rob's previous R-b tag. (Maxime)
> 
> v4:
> * Collect Rob's R-b tag.
> 
> v3:
> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
> * Document all processing units. (Rob)
> 
> v2:
> * Drop fsl,dc-*-id DT properties. (Krzysztof)
> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
> * Fix register range sizes in examples.
> 
>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
>  .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
>  17 files changed, 1042 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> new file mode 100644
> index 000000000000..7f800e72c3f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Display Controller Blit Blend Unit
> +
> +description: |
> +  Combines two input frames to a single output frame, all frames having the
> +  same dimension.
> +
> +  Each Blit Blend Unit device should have an alias in the aliases node, in the
> +  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
> +  Controller instance and <y> is an integer specifying the Blit Blend Unit
> +  device instance.

That's really an abuse of aliases. If you need to describe connections 
between components, use the graph binding like everyone else does for 
display path components.

Rob
