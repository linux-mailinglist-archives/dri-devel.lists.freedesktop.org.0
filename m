Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641986D1C5E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7198B10F14E;
	Fri, 31 Mar 2023 09:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3710F14E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:30:59 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id ED7712078C;
 Fri, 31 Mar 2023 11:30:56 +0200 (CEST)
Date: Fri, 31 Mar 2023 11:30:52 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/6] dt-bindings: display: bridge: toshiba,tc358768:
 Add TC9594
Message-ID: <ZCaoTDjvAUZJYP3s@francesco-nb.int.toradex.com>
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-3-francesco@dolcini.it>
 <ff88e5d3-4c31-7698-b8d1-8a03b9fea643@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff88e5d3-4c31-7698-b8d1-8a03b9fea643@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 10:42:40AM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2023 11:59, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add TC9594, from the software point of view this is identical to
> > TC358768 with the main difference being automotive qualified.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > index d6dac186ac59..8f22093b61ae 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > @@ -4,19 +4,20 @@
> >  $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358768.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Toshiba TC358768/TC358778 Parallel RGB to MIPI DSI bridge
> > +title: Toshiba TC358768/TC358778/TC9594 Parallel RGB to MIPI DSI bridge
> >  
> >  maintainers:
> >    - Peter Ujfalusi <peter.ujfalusi@ti.com>
> >  
> >  description: |
> > -  The TC358768/TC358778 is bridge device which converts RGB to DSI.
> > +  The TC358768/TC358778/TC9594 is bridge device which converts RGB to DSI.
> >  
> >  properties:
> >    compatible:
> >      enum:
> >        - toshiba,tc358768
> >        - toshiba,tc358778
> > +      - toshiba,tc9594
> 
> If it is the same, why they are not compatible?

I assume I am not understanding something very basic ...

The register description and SW functionality of all these 3 parts is
identical.

How should be the compatible described in the DT schema in this case?


> I got only three patches out of six, thus I cannot check by myself.

Here the whole series: https://lore.kernel.org/all/20230330095941.428122-1-francesco@dolcini.it/

Do you want to me to send the whole series and not just the DT binding
next time? Happy to do it, if you prefer.

Francesco

