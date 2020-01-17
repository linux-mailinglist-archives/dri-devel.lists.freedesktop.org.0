Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70F1410C9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439A36F898;
	Fri, 17 Jan 2020 18:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B6A6F898
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:30:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8300420026;
 Fri, 17 Jan 2020 19:30:20 +0100 (CET)
Date: Fri, 17 Jan 2020 19:30:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 1/5] dt-bindings: display: panel: Add boe tv101wum-n16
 panel bindings
Message-ID: <20200117183019.GA14298@ravnborg.org>
References: <20200116021511.22675-1-jitao.shi@mediatek.com>
 <20200116021511.22675-2-jitao.shi@mediatek.com>
 <20200117180817.GA17294@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117180817.GA17294@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=mpaa-ttXAAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=EqPL98zj1DO2ifNQ5WsA:9 a=jVGOFjz3VEg0wm82:21
 a=U5ioJVc0Wqf7HXB5:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=6heAxKwa5pAsJatQ0mat:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

On Fri, Jan 17, 2020 at 07:08:17PM +0100, Sam Ravnborg wrote:
> Hi Jitao.
> 
> Looks good, much better than the individual files.
> Rob Herring is still listed as maintainer which I questioned in last
> feedback.
> 
> With this resolved (kept only if Rob confirms), this is
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Rob confirmed on irc that he is not a dedicated reviewer of this
binding. And furhtermore that it was OK I committed trivial panel
bindings.
Dropepd Rob and applied to drm-misc-next.

	Sam

> 
> On Thu, Jan 16, 2020 at 10:15:07AM +0800, Jitao Shi wrote:
> > Add documentation for "boe,tv101wum-n16", "auo,kd101n80-45na",
> > "boe,tv101wum-n53" and "auo,b101uan08.3" panels.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/boe,tv101wum-nl6.yaml       | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > new file mode 100644
> > index 000000000000..cc4e058f5eee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-nl6.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: BOE TV101WUM-NL6 DSI Display Panel
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Sam Ravnborg <sam@ravnborg.org>
> > +  - Rob Herring <robh+dt@kernel.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +        # BOE TV101WUM-NL6 10.1" WUXGA TFT LCD panel
> > +      - boe,tv101wum-nl6
> > +        # AUO KD101N80-45NA 10.1" WUXGA TFT LCD panel
> > +      - auo,kd101n80-45na
> > +        # BOE TV101WUM-N53 10.1" WUXGA TFT LCD panel
> > +      - boe,tv101wum-n53
> > +        # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
> > +      - auo,b101uan08.3
> > +
> > +  reg:
> > +    description: the virtual channel number of a DSI peripheral
> > +
> > +  enable-gpios:
> > +    description: a GPIO spec for the enable pin
> > +
> > +  pp1800-supply:
> > +    description: core voltage supply
> > +
> > +  avdd-supply:
> > +    description: phandle of the regulator that provides positive voltage
> > +
> > +  avee-supply:
> > +    description: phandle of the regulator that provides negative voltage
> > +
> > +  backlight:
> > +    description: phandle of the backlight device attached to the panel
> > +
> > +  port: true
> > +
> > +required:
> > + - compatible
> > + - reg
> > + - enable-gpios
> > + - pp1800-supply
> > + - avdd-supply
> > + - avee-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel@0 {
> > +            compatible = "boe,tv101wum-nl6";
> > +            reg = <0>;
> > +            enable-gpios = <&pio 45 0>;
> > +            avdd-supply = <&ppvarn_lcd>;
> > +            avee-supply = <&ppvarp_lcd>;
> > +            pp1800-supply = <&pp1800_lcd>;
> > +            backlight = <&backlight_lcd0>;
> > +            status = "okay";
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint = <&dsi_out>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.21.0
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
