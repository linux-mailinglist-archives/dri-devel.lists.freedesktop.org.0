Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026112DC19B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 14:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2626D6E1B2;
	Wed, 16 Dec 2020 13:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7A76E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 13:52:10 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2B3EF20007;
 Wed, 16 Dec 2020 13:52:06 +0000 (UTC)
Date: Wed, 16 Dec 2020 14:52:17 +0100
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas, lvds: RZ/G2E needs
 renesas,companion too
Message-ID: <20201216135217.gzhb7cllyr745jhc@uno.localdomain>
References: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, Fabrizio

On Wed, Dec 16, 2020 at 12:59:27AM +0200, Laurent Pinchart wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Document RZ/G2E support for property renesas,companion.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
> Changes since v1:
>
> - Slight reword of SoC list in description
> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index e5b163951b91..7eddcdb666dc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -83,9 +83,9 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        phandle to the companion LVDS encoder. This property is mandatory
> -      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> -      the second encoder to be used as a companion in dual-link mode. It
> -      shall not be set for any other LVDS encoder.
> +      for the first LVDS encoder on R-Car D3 and E3, and RZ/G2E SoCs, and shall
> +      point to the second encoder to be used as a companion in dual-link mode.
> +      It shall not be set for any other LVDS encoder.
>
>  required:
>    - compatible
> --
> Regards,
>
> Laurent Pinchart
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
