Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AC955379
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F83710E850;
	Fri, 16 Aug 2024 22:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FBgBKNyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116DD10E850
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:43:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 321D6CE2016;
 Fri, 16 Aug 2024 22:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E24CC32782;
 Fri, 16 Aug 2024 22:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723848233;
 bh=gG10md2RbDIZ1lWzCtyZyAMAPeUvAi0J/ZffRkMvvv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FBgBKNySTRq/4kgHL3EXUf/cn2I3TuDvyylObzVXzO3ebexdY4amhCIvTfg5Jk80v
 o0eXYWbo6L9gGKHRIh+jJ/qsJpoJseduxUHNHKERSoKTOisVaZEudHHtRjGI3bjg81
 y7wkDOK/0qZZ1SYapU2r27hUZT894D+b1djKlvtEkgIFdSIdrwwYz7C6IwnDgHmlcJ
 1ltjhyjTDP894mKLmZz7yEbWNTO9bytpMmzZuZ+u5rBZEwAwbcuH8aAgOWXQbKXD9u
 DyyYuGcWEP7QFPOvllztBdpNp5yPspQ0MKsNFm/Tnr3Ayp0NWvgAwS+Fr9I9qThRds
 lgfkL6BNUsr9w==
Date: Fri, 16 Aug 2024 16:43:52 -0600
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
Subject: Re: [PATCH v3 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
Message-ID: <20240816224352.GE2394350-robh@kernel.org>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-2-victor.liu@nxp.com>
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

On Wed, Jul 24, 2024 at 05:29:32PM +0800, Liu Ying wrote:
> Freescale i.MX8qxp Display Controller is implemented as construction set of
> building blocks with unified concept and standardized interfaces.  Document
> all existing processing units.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
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
>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 +++++
>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++++++
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++++++
>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++++++
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++++++++
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 ++++++++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++++++
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++++++++
>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 ++++
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 +++++
>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++++++
>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++++++
>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 +++++
>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++++++++++
>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 +++++++
>  .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 ++++++++++++
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++++++
>  17 files changed, 963 insertions(+)
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
