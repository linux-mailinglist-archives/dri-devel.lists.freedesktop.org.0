Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D454D4F6D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 17:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4351810E285;
	Thu, 10 Mar 2022 16:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCF410E285
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 16:35:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4045491;
 Thu, 10 Mar 2022 17:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646930149;
 bh=H/rScwjhv6h4uAEVs0m6qTExsU33rCuexQYAnXBvt/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0q2CNfvbL9OZM/GMoGCtTsu4c0wPkWgBXb7U0F4V7JhU+5WxJAE1X6LqEs2outIm
 9j3REsnvTfLYtC6N7P4xgW9XskNfG+WboemKYOY0FEaLwm4z3qPMU23uJ2aHC7RLzn
 hbBgY5PGYlTqt7dDar2Ru3kGT7V9Jnu6pA9myyGs=
Date: Thu, 10 Mar 2022 18:35:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Message-ID: <Yioo1Wgo1eC6IIvf@pendragon.ideasonboard.com>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Wed, Mar 09, 2022 at 03:11:08PM +0000, Biju Das wrote:
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
> lower frequencies causes display instability. On such platforms, it
> is better to avoid switching lanes from 4 to 3 as it needs different
> set of PLL parameter constraints to make the display stable with 3
> lanes.

Is this because the PLL calculation code doesn't work properly, or
because the hardware can't support this ?

> This patch introduces 'adi,disable-lanes-override' property to disable
> lane switching at lower frequencies.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..2dc378039d21 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -84,6 +84,11 @@ properties:
>        timings for HDMI output.
>      type: boolean
>  
> +  adi,disable-lanes-override:
> +    description:
> +      Disables the overriding lanes at lower frequencies.
> +    type: boolean
> +
>    adi,dsi-lanes:
>      description: Number of DSI data lanes connected to the DSI host.
>      $ref: /schemas/types.yaml#/definitions/uint32

-- 
Regards,

Laurent Pinchart
