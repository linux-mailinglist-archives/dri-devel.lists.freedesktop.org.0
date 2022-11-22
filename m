Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C810633386
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 03:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62810E1BD;
	Tue, 22 Nov 2022 02:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5E10E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 02:45:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DB03890;
 Tue, 22 Nov 2022 03:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669085144;
 bh=IWXNReiz1TRWKNgbQ27rJS7fAMeC1xGSH1ji+MbB/n8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P9VY/IyWBvju0Bqzr6Q2Y84i6lxIQ2TYu8Lml/tZaMGvuoYfrUew403XEz6e6R5LF
 K7R9jxKKR/7mXXJkZ0cyLqN3yWrl2lPTfQD5GB1B73nbDG2zZQeLhLWvLvoBCNwRFV
 6MhoFRteaAU2oQNwHGB1MqZ65OAnxBkLvqpS2tIY=
Date: Tue, 22 Nov 2022 04:45:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge:
 renesas,dsi-csi2-tx: Add r8a779g0
Message-ID: <Y3w3yZewtTjLDvUJ@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
 <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 04:14:21PM +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 17, 2022 at 1:26 PM Tomi Valkeinen wrote:
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > index afeeb967393d..bc3101f77e5a 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > @@ -11,13 +11,14 @@ maintainers:
> >
> >  description: |
> >    This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > -  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > +  R-Car V3U/V4H SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> 
> Perhaps "R-Car Gen4 SoCs", so we stay within 80 chars, and don't have
> to update this when the next member of the family is around the block?

Sounds good.

> Is there anything that might be SoC-specific?
> If not, perhaps the time is ripe for a family-specific compatible value?

That's hard to tell, I have little visibility into what surprises other
SoCs will bring :-S

> >    to four data lanes.
> >
> >  properties:
> >    compatible:
> >      enum:
> >        - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> > +      - renesas,r8a779g0-dsi-csi2-tx    # for V4H

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >
> >    reg:
> >      maxItems: 1

-- 
Regards,

Laurent Pinchart
