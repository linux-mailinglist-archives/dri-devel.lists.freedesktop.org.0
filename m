Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0357E7DC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 22:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CC59366E;
	Fri, 22 Jul 2022 20:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C4C93665
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Tzxqv/Uzh1JY+W5mrWl4jc5taDT0DwDxhpbR/ngIxKE=;
 b=ngrCl12iS9dbWrzbb+yEVsi8jv2WhoHn8h0y9wimb9qK6AQJueW3fERGcoV1yQw/zIu9/G9RbA5rn
 Yeao89uDhxCdUU5TDF4dvTf1L8nKnVo4mzuoBwGD5Dadd7gh75WPUVCXUKWNXcGaxVQPXTOxZugSm9
 VWZAr3/FVedqQpwGfjkIu8WXd5CjNSidAL1L98VCqUhv8d8F9wHWj0xnSGdAi0RQPytjlWGTuY27sC
 l3b7xbTydwxittImeDVjIEGHOm30MmaaUXI3b5kgas7FKOtIlKX9c8sZwz019clzsw1JXTfXeFPw6d
 TDnKeTLqrjdmFX7N8EmCZHlGRAUlamg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Tzxqv/Uzh1JY+W5mrWl4jc5taDT0DwDxhpbR/ngIxKE=;
 b=mUvzipy2Q9Z8BIwDUwrCH/RmGe9aq0BuTkWEuXGc/CvysRYAcStZnN/aLKjysmkL/TPnREZ33sp9u
 08MztDcDg==
X-HalOne-Cookie: 5935a94967758038358233096c6ddf6e78c687d9
X-HalOne-ID: 90b086e4-09f9-11ed-a6c8-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 90b086e4-09f9-11ed-a6c8-d0431ea8a283;
 Fri, 22 Jul 2022 20:05:00 +0000 (UTC)
Date: Fri, 22 Jul 2022 22:04:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: Document RZ/G2L
 MIPI DSI TX bindings
Message-ID: <YtsC6p7yy86Dr95H@ravnborg.org>
References: <20220722191924.544869-1-biju.das.jz@bp.renesas.com>
 <20220722191924.544869-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722191924.544869-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Robert Foss <robert.foss@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Fri, Jul 22, 2022 at 08:19:23PM +0100, Biju Das wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * No change.
> v2->v3:
>  * Added Rb tag from Geert and Laurent
>  * Fixed the typo "Receive" -> "transmit"
>  * Added accepible values for data-lanes
>  * Sorted Header file in the example
>  * Added SoC specific compaible along with generic one.
> v1->v2:
>  * Added full path for dsi-controller.yaml
>  * Modeled DSI + D-PHY as single block and updated reg property
>  * Fixed typo D_PHY->D-PHY
>  * Updated description
>  * Added interrupts and interrupt-names and updated the example 
> RFC->v1:
>  * Added a ref to dsi-controller.yaml.
> RFC:-
>  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-22-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 182 ++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> new file mode 100644
> index 000000000000..131d5b63ec4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
> +  up to four data lanes.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +      - const: renesas,rzg2l-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Sequence operation channel 0 interrupt
> +      - description: Sequence operation channel 1 interrupt
> +      - description: Video-Input operation channel 1 interrupt
> +      - description: DSI Packet Receive interrupt
> +      - description: DSI Fatal Error interrupt
> +      - description: DSI D-PHY PPI interrupt
> +      - description: Debug interrupt
This is an awful lot of interrupts.
Is this really individual interrupts or status bits in a single
interrupt? If it is the latter then there should be only one interrupt
defined.

Note: I looked at the driver, but it does not use interrupt so it did
not answer my question.

	Sam
