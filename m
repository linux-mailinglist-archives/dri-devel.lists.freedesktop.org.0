Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583D3D10F7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107A46E30C;
	Wed, 21 Jul 2021 14:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55216E30C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:14:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0ef14bbc-ea2e-11eb-8d1a-0050568cd888;
 Wed, 21 Jul 2021 14:15:10 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 994B3194B81;
 Wed, 21 Jul 2021 16:15:12 +0200 (CEST)
Date: Wed, 21 Jul 2021 16:14:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
Message-ID: <YPgr3jjBoUgRD0Ko@ravnborg.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-11-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-11-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,
On Wed, Jul 21, 2021 at 04:03:40PM +0200, Maxime Ripard wrote:
> The binding mentions that all the drivers using that driver must use a
> vendor-specific compatible but never enforces it, nor documents the
> vendor-specific compatibles.
> 
> Let's make we document all of them, and that the binding will create an
> error if we add one that isn't.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 49460c9dceea..d1513111eb48 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -31,12 +31,18 @@ allOf:
>  
>  properties:
>    compatible:
> -    contains:
> -      const: panel-lvds
> -    description:
> -      Shall contain "panel-lvds" in addition to a mandatory panel-specific
> -      compatible string defined in individual panel bindings. The "panel-lvds"
> -      value shall never be used on its own.
> +    items:
> +      - enum:
> +          - advantech,idk-1110wr
> +          - advantech,idk-2121wr
> +          - auo,b101ew05
> +          - innolux,ee101ia-01d
> +          - mitsubishi,aa104xd12
> +          - mitsubishi,aa121td01
> +          - sgd,gktw70sdae4se
> +          - sharp,lq150x1lg11
> +          - tbs,a711-panel
> +      - const: panel-lvds

I can see there is already a dedicated binding for sharp,lq150x1lg11
I picked this randomly - did not check the rest.

I think we are in for troubles if we have two bindings with the same
compatible...

	Sam
