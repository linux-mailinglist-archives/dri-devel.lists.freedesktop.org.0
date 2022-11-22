Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD96333AD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 04:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C66C10E367;
	Tue, 22 Nov 2022 03:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EF910E367
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 03:05:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03279890;
 Tue, 22 Nov 2022 04:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669086336;
 bh=OP7Y7hsHz9XtzH4OrAc1DG1nsm5BYY0TnHJs66LwpeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ksEO7afwDfYQYLJcky9l5GiNb3FvnZiznXhKNyHfvPS+3j7Wy/APE98cIlCvCFA8G
 URnoxdxXbXbeqdZ9BqABrFKnQUNm0HiyvAd0CCFNt43PkZgDUcA5r9BqJzIlNbHewe
 /O5dUMsFzRHTQC3towY+Wt6Wty4luAbWXpoTk8aA=
Date: Tue, 22 Nov 2022 05:05:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v1 6/8] drm: rcar-du: Add r8a779g0 support
Message-ID: <Y3w8cBh0uVaSPonO@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-7-tomi.valkeinen@ideasonboard.com>
 <166869771876.50677.1905794243575000038@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <166869771876.50677.1905794243575000038@Monstersaurus>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 03:08:38PM +0000, Kieran Bingham wrote:
> Quoting Tomi Valkeinen (2022-11-17 12:25:45)
> > From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > 
> > Add support for DU on r8a779g0, which is identical to DU on r8a779a0.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index d003e8d9e7a2..b1761d4ec4e5 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -524,6 +524,27 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
> >         .dsi_clk_mask =  BIT(1) | BIT(0),
> >  };
> >  
> > +static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
> > +       .gen = 3,
> 
> Given that this is the V4H ... I wonder if this should be bumped
> already. I guess that has knock on effects through the driver though...

rcar_du_group_setup_didsr() would need to be fixed to test gen >= 3
instead of gen == 3. That seems to be the only problematic location. It
could thus fairly easily be done in v2, but we can also delay it.

> Aside from that, Which may need more work to handle correctly:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +       .features = RCAR_DU_FEATURE_CRTC_IRQ
> > +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> > +                 | RCAR_DU_FEATURE_NO_BLENDING,
> > +       .channels_mask = BIT(1) | BIT(0),
> > +       .routes = {
> > +               /* R8A779G0 has two MIPI DSI outputs. */
> > +               [RCAR_DU_OUTPUT_DSI0] = {
> > +                       .possible_crtcs = BIT(0),
> > +                       .port = 0,
> > +               },
> > +               [RCAR_DU_OUTPUT_DSI1] = {
> > +                       .possible_crtcs = BIT(1),
> > +                       .port = 1,
> > +               },
> > +       },
> > +       .num_rpf = 5,
> > +       .dsi_clk_mask =  BIT(1) | BIT(0),
> > +};
> > +
> >  static const struct of_device_id rcar_du_of_table[] = {
> >         { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> >         { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> > @@ -549,6 +570,7 @@ static const struct of_device_id rcar_du_of_table[] = {
> >         { .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
> >         { .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
> >         { .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
> > +       { .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> >         { }
> >  };
> >  

-- 
Regards,

Laurent Pinchart
