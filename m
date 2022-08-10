Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA858F1E8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4C81120A2;
	Wed, 10 Aug 2022 17:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE310E152
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:48:13 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id g15so6252338iob.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 10:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=+N6oE2+z+9jwTNAaSVyxqcqUp5JuLCFc7tr+Z6FAGws=;
 b=WYGZtxq1M1tQCEa9hUNSYw5SJmvWZkWTyA207fC4aMaseKdp2Idlzy2+5dBz7t9CCh
 B4j6IyM+79Fr4b9CUelja2+HRN/MaFQvCen3KutJ7HKW0U4MhpBNXVX5hxtr0DehWTAk
 canhGYfm2SAcv28+g4fhM95oZ3RI4buEnsMLmLAtdB0J+4W25zf0FpsoKxSc9XJ2w+z7
 WswZLWTSRNV2HOrPIEnN0ffdVokiVtZhInQiLCZSpyD0oiEWEsDgPGMbBmTiwPm27783
 x80l4FEXR4IniTzy979sFW8+4MyrC2GwU55spOMRX2LDe4VLRMz+DUpsQtNBtd96p+dU
 BuIA==
X-Gm-Message-State: ACgBeo3E2RapP7I+cYNKfHqn9n6ABwd/MARDF7jimZEK6M7p9u8z2rJ0
 LBWpL0fFXnLcAsy7SpCsMQ==
X-Google-Smtp-Source: AA6agR79rHhKYr5RzkGcMvA3P9iJe8YVNwuun47x0eShM+Vw1kbLR7EV9dZX7F59f9epoBEIufX+yQ==
X-Received: by 2002:a02:664a:0:b0:33f:5310:35e1 with SMTP id
 l10-20020a02664a000000b0033f531035e1mr13120728jaf.214.1660153692739; 
 Wed, 10 Aug 2022 10:48:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a029702000000b0034274a116f1sm7736516jai.20.2022.08.10.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 10:48:12 -0700 (PDT)
Received: (nullmailer pid 223548 invoked by uid 1000);
 Wed, 10 Aug 2022 17:48:10 -0000
Date: Wed, 10 Aug 2022 11:48:10 -0600
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: ti,am65x-dss: Add port
 properties for DSS
Message-ID: <20220810174810.GA200295-robh@kernel.org>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-2-a-bhatia1@ti.com>
 <20220720232845.GA4164694-robh@kernel.org>
 <a2e5037c-22c0-8424-4031-0bf587120990@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e5037c-22c0-8424-4031-0bf587120990@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Krunal Bhargav <k-bhargav@ti.com>, Darren Etheridge <detheridge@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Rahul T R <r-ravikumar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 04:56:15PM +0530, Aradhya Bhatia wrote:
> 
> 
> On 21-Jul-22 04:58, Rob Herring wrote:
> > On Tue, Jul 19, 2022 at 01:38:38PM +0530, Aradhya Bhatia wrote:
> > > Add "ti,oldi-mode" property to indicate the tidss driver the OLDI output
> > > mode. The 2 OLDI TXes on am625-dss allow a 3 different types of panel
> > > connections with the board.
> > > 
> > > 1. Single Link / Single Mode on OLDI TX 0 OR 1.
> > > 2. Single Link / Duplicate Mode on OLDI TX 0 and 1.
> > > 3. Dual Link / Single Mode on OLDI TX 0 and 1.
> > > 
> > > Add "ti,rgb565-to-888" property to override 16bit output from a videoport
> > > for a bridge that only accepts 24bit RGB888 DPI input.
> > > 
> > > On some boards the HDMI bridge takes a 24bit DPI input, but only 16 data
> > > pins are actually enabled from the SoC.  This new property forces the
> > > output to be RGB565 on a specific video port if the bridge requests a
> > > 24bit RGB color space.
> > > 
> > > This assumes that the video port is connected like so:
> > > 
> > > SoC : Bridge
> > > R0 ->   R3
> > > R1 ->   R4
> > > R2 ->   R5
> > > R3 ->   R6
> > > R4 ->   R7
> > > G0 ->   G2
> > > G1 ->   G3
> > > G2 ->   G4
> > > G3 ->   G5
> > > G4 ->   G6
> > > G5 ->   G7
> > > B0 ->   B3
> > > B1 ->   B4
> > > B2 ->   B5
> > > B3 ->   B6
> > > B4 ->   B7
> > > 
> > > On the bridge side R0->R2, G0->G1, B0->B2 would be tied to ground.
> > > The bridge sees 24bits of data,  but the lsb's are always zero.
> > 
> > Unless the bridge ignores the LSBs, that's not the right way to do 16 to
> > 24 bit. The LSBs should be connected to the MSB of the color component
> > to get full color range.
> > 
> > > 
> > > Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> > > ---
> > >   .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++++++--
> > >   1 file changed, 23 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > index 6bbce921479d..11d9b3821409 100644
> > > --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> > > @@ -80,15 +80,35 @@ properties:
> > >       properties:
> > >         port@0:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > >           description:
> > >             The DSS OLDI output port node form video port 1
> > > +        properties:
> > > +          ti,oldi-mode:
> > > +            description: TI specific property to indicate the mode the OLDI TXes
> > > +              and the display panel are connected in.
> > > +              0 -> OLDI TXes OFF (driver default for am625-dss)
> > > +              1 -> Single link, Single Mode (OLDI0) (driver default for am65x-dss)
> > > +              2 -> Single link, Single Mode (OLDI1)
> > > +              3 -> Single link, Duplicate Mode
> > > +              4 -> Dual link (Only Single Mode)
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1, 2, 3, 4]
> > 
> > Wouldn't 'data-lanes' property work for this purpose.
> > 
> > Generally, we don't put properties in port nodes.
> > 
> Thank you for the suggestions Rob!
> 
> I looked into the "data-lanes" property and it seems that the property
> alone would not be able to help distinguish between the "Single link,
> Duplicate mode" (Mode 3) and "Dual link, Single mode" (Mode 4). For both
> the cases, the property will look like "data-lanes = <0 1>;" in the DT
> node.
> 
> I have an idea on what the driver could use along with the data-lanes
> property to ascertain the OLDI mode.
> 
> By means of number of remote-endpoints in DTS.
> The OLDI output port of DSS can be made to have 2 remote endpoints when
> 2 panels are connected as "Single link, Duplicate Mode" vs only 1 remote
> endpoint for "Dual Link, Single Mode". Based on the count, the driver
> can distinguish between the two when both the data-lanes are activated
> in DT node.

You can only have 1 'remote-endpoint'. However, you can have multiple 
endpoint nodes which is generally used for fanout (output) or muxed 
(input) cases. Your case is fanout as it is the same data sent to 
multiple connections.

data-lanes would be kind of redundant in that case since it would be 1 
lane per endpoint.

> 
> Let me know if you think this method would be appropriate.
> > > +
> > >         port@1:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > >           description:
> > >             The DSS DPI output port node from video port 2
> > > +        properties:
> > > +          ti,rgb565-to-888:
> > > +            description:
> > > +              property to override DPI output to 16bit for 24bit bridge
> > > +            type: boolean
> > 
> > There's work underway for standard way to handle interface formats[1].
> > Please help/comment on that to make sure it works for you.
> > 
> > Rob
> > 
> > [1] https://lore.kernel.org/all/20220628181838.2031-3-max.oss.09@gmail.com/
> 
> I also followed what this patch series is implementing. This seems to be
> applicable for cases where the DPI pins are drawn and forwarded towards
> a simple panel capable of accepting the raw parallel data.
> 
> It does not cover for the bridges with lesser number of formats to
> support.

Not sure what you mean here, but raise it on that thread.

Rob
