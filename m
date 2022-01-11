Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686548AE25
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 14:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E269C10E6BE;
	Tue, 11 Jan 2022 13:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C30510E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:05:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86777CC;
 Tue, 11 Jan 2022 14:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641906321;
 bh=NSx4F+zr58+4S8iLThDYBkgZKhVFhldOeS3yZlZi9wQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tOR5dzV67x+IVOG22DYuatLvq8HxL5ND2d11qVNb2hKP01gSFUectUkj/ecSI2+c2
 2z9GzTrFqT14R8Jd2Xio/WDD2uqahc8F6+wsKtPTshK8Vv2zdefnbCe9ATWqm3RfDu
 qurPJBnKqtn1GD7vUdFKhJj2x8F2PhAMUgEFWfCg=
Date: Tue, 11 Jan 2022 15:05:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 2/2] dt-bindings: panel: Introduce a panel-lvds binding
Message-ID: <Yd2Ahn3+FVv/Aks7@pendragon.ideasonboard.com>
References: <20220111110635.804371-1-maxime@cerno.tech>
 <20220111110635.804371-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111110635.804371-2-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Tue, Jan 11, 2022 at 12:06:35PM +0100, Maxime Ripard wrote:
> Following the previous patch, let's introduce a generic panel-lvds
> binding that documents the panels that don't have any particular
> constraint documented.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v2:
>   - Added a MAINTAINERS entry
> 
> Changes from v1:
>   - Added missing compatible
>   - Fixed lint
> ---
>  .../bindings/display/panel/panel-lvds.yaml    | 57 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> new file mode 100644
> index 000000000000..fcc50db6a812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic LVDS Display Panel Device Tree Bindings
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: panel-lvds
> +
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - advantech,idk-1110wr
> +            - advantech,idk-2121wr
> +            - innolux,ee101ia-01d
> +            - mitsubishi,aa104xd12
> +            - mitsubishi,aa121td01
> +            - sgd,gktw70sdae4se

I still don't like this :-( Couldn't we instead do

select:
  properties:
    compatible:
      contains:
        enum:
          - auo,b101ew05
          - tbs,a711-panel

?

> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - auo,b101ew05
> +          - tbs,a711-panel
> +
> +      - const: panel-lvds
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - data-mapping
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +  - port
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 368072da0a05..02001455949e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6080,6 +6080,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/panel/panel-lvds.c
>  F:	Documentation/devicetree/bindings/display/lvds.yaml
> +F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>  
>  DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
>  M:	Guido Günther <agx@sigxcpu.org>

-- 
Regards,

Laurent Pinchart
