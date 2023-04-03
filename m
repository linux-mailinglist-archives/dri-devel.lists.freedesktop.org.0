Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C16D52FA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 23:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B610E19C;
	Mon,  3 Apr 2023 21:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AC510E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 21:01:20 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 m6-20020a4ae846000000b0053b9059edd5so4845023oom.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 14:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680555679;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JCDaBQRSXHLW/mJme9G/ZIzduYV5CrqCyRVX3szS1jY=;
 b=ztdrUKY8mOfb4G6lVHUKKTjPxpaZrsPslSioTULK6yusDe3v5RFwtiDA0etKk1npHs
 HdP4bUcX3HYGTtP5MMxH6y1hF0CDs8k0pr9wSbc3M+hq6hLuc9win2297LdCHxY9MFMC
 EsLN6tCbORfa03aJar1DR/aQiACF+2eYzovG8n/a1DBg5oX9Pnc2GMQ2WWPGqPMzHz7I
 taBQ8FxpwU2QsGOP21OWIrsHf8Ca7tfccndJU0Zzymp/kJC+OM94ahz7xFX54NYO1Zk9
 Ij6sb5CMZBtLlQxPh74RFYpZ16Zp76kRjDyLBckxOcvrAvbgpZtdpMmAW2GtnbSAggEE
 3faQ==
X-Gm-Message-State: AAQBX9csNZKr36EkxWphrvRhAoKgq2axWx4hYzLGZmNNjCJgw/giJO4U
 P3Uoy+t/J3EVh6lVGd0uWg==
X-Google-Smtp-Source: AKy350ackiyEDTt+D1XtvQPTabYuwW3Y/IJA7Dqu3JjJI6vR/mCOOFCCAUCt1uCycV6wRI9n15xdnw==
X-Received: by 2002:a4a:370b:0:b0:53b:700e:378c with SMTP id
 r11-20020a4a370b000000b0053b700e378cmr400482oor.9.1680555679352; 
 Mon, 03 Apr 2023 14:01:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y70-20020a4a4549000000b0053e56135a1esm4510087ooa.45.2023.04.03.14.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:01:18 -0700 (PDT)
Received: (nullmailer pid 1739713 invoked by uid 1000);
 Mon, 03 Apr 2023 21:01:17 -0000
Date: Mon, 3 Apr 2023 16:01:17 -0500
From: Rob Herring <robh@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: bridge: toshiba,tc358768:
 add parallel input mode
Message-ID: <20230403210117.GA1722054-robh@kernel.org>
References: <20230330095941.428122-1-francesco@dolcini.it>
 <20230330095941.428122-4-francesco@dolcini.it>
 <a924186c-31d3-b7f0-085f-97b849a4d751@linaro.org>
 <ZCaqcaq02VDsqCPJ@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCaqcaq02VDsqCPJ@francesco-nb.int.toradex.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 11:40:01AM +0200, Francesco Dolcini wrote:
> On Fri, Mar 31, 2023 at 10:48:15AM +0200, Krzysztof Kozlowski wrote:
> > On 30/03/2023 11:59, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > 
> > > Add new toshiba,input-rgb-mode property to describe the actual signal
> > > connection on the parallel RGB input interface.
> > > 
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > >  .../bindings/display/bridge/toshiba,tc358768.yaml | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > index 8f22093b61ae..2638121a2223 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> > > @@ -42,6 +42,21 @@ properties:
> > >    clock-names:
> > >      const: refclk
> > >  
> > > +  toshiba,input-rgb-mode:
> > > +    description: |
> > > +      Parallel Input (RGB) Mode.
> > > +
> > > +      RGB inputs (PD[23:0]) color arrangement as documented in the datasheet
> > > +      and in the table below.
> > > +
> > > +      0 = R[7:0], G[7:0], B[7:0]
> > 
> > RGB888?
> 
> Or anything else - like a RGB666 - just connecting to GND the unused
> pins.

If the bridge is configured for RGB666, then that's fine. If not, the 
unused pins should be driven with either the MSB of each component. 
Otherwise, you'd can't fully saturate the colors.

> > > +      1 = R[1:0], G[1:0], B[1:0], R[7:2], G[7:2], B[7:2]
> > > +      2 = 8’b0, R[4:0], G[5:0], B[4:0]
> > 
> > Isn't this RGB565?
> > 
> > Don't we have already properties like this? e.g. colorspace?
> 
> It's not really the colorspace this property.
> 
> tc358768 is a parallel RGB to DSI bridge, it has 24 bit parallel input
> line.
> 
> The way this lines are connected is configurable with this parameter, if you
> look at mode 0 and 1 they all allow to have a RGB888 or a RGB666 or a
> RGB565 mapping. This just configure some internal mux, it's not strictly
> about the RGB mode.

This is the same as other cases. There's a need for describing the 
interface. It keeps coming up and I keep saying to go create something 
common.

Rob
