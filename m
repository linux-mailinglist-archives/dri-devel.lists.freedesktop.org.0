Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E167A250CA7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 01:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A46E7D4;
	Mon, 24 Aug 2020 23:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B27C6E7D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 23:57:49 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u126so10608304iod.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 16:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2clxok4AT1thROfwSbp1ZaG/t9IqMzKpuWHCwXIuuw8=;
 b=QJIiNm3HADH15eGenE31DWYfK0NbwvbcZKd5kSAX9Dsmmb78FDHbvPCklJqruqMN5g
 Se/YJvnJpcEJ77xLHxoNtJBpg6p5o38LPbNsUsWXzV7RC1pK+bI/4oubWRfhb27nhmHv
 pZ7TkmjEPB5GBwUl35G8AmUaV1VwM12aMaDuwordU4k72gBTA4nczpmuG3fHv7rmVqpZ
 ne38YwX+UgYUPSXSfWCjjZu3p1N9BbR1CIWxHflxlcIss65IfOWyRm4Qj97Z7UbBX5Su
 70dRutpfGHa5RyfUIrd6qSv1SSBFVBNwvwgAwDKZvVJfkwblmmZ6Smds86+kDlUc1e2O
 c9UA==
X-Gm-Message-State: AOAM5339Y9eoNhYqgHsbI7JKUketNDj88StyXOB56qy56P6ZI84j0zkS
 UaM+QbtH93pae2RcutrWD1Tdio5c0BHn
X-Google-Smtp-Source: ABdhPJw6gpTNfKL44uq2crG2J2o6tmfpSN21xd0JhIWEBKjVjxayb3fOGQQZo8l8xCU91noaKdmQng==
X-Received: by 2002:a02:8e:: with SMTP id 136mr8157636jaa.111.1598313468506;
 Mon, 24 Aug 2020 16:57:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id e6sm7550534iod.53.2020.08.24.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 16:57:47 -0700 (PDT)
Received: (nullmailer pid 3582064 invoked by uid 1000);
 Mon, 24 Aug 2020 23:57:45 -0000
Date: Mon, 24 Aug 2020 17:57:45 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/8] dt-bindings: display: mxsfb: Add and fix compatible
 strings
Message-ID: <20200824235745.GA3579749@bogus>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
 <20200813012910.13576-3-laurent.pinchart@ideasonboard.com>
 <20200816063933.GC1201814@ravnborg.org>
 <20200817000406.GC7729@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817000406.GC7729@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 03:04:06AM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> On Sun, Aug 16, 2020 at 08:39:33AM +0200, Sam Ravnborg wrote:
> > On Thu, Aug 13, 2020 at 04:29:04AM +0300, Laurent Pinchart wrote:
> > > Additional compatible strings have been added in DT source for the
> > > i.MX6SL, i.MX6SLL, i.MX6UL and i.MX7D without updating the bindings.
> > > Most of the upstream DT sources use the fsl,imx28-lcdif compatible
> > > string, which mostly predates the realization that the LCDIF in the
> > > i.MX6 and newer SoCs have extra features compared to the i.MX28.
> > > 
> > > Update the bindings to add the missing compatible strings, with the
> > > correct fallback values. This fails to validate some of the upstream DT
> > > sources. Instead of adding the incorrect compatible fallback to the
> > > binding, the sources should be updated separately.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../devicetree/bindings/display/mxsfb.yaml     | 18 +++++++++++++-----
> > >  1 file changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > index 202381ec5bb7..ec6533b1d4a3 100644
> > > --- a/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > +++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
> > > @@ -15,11 +15,19 @@ description: |
> > >  
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - fsl,imx23-lcdif
> > > -      - fsl,imx28-lcdif
> > > -      - fsl,imx6sx-lcdif
> > > -      - fsl,imx8mq-lcdif
> > > +    oneOf:
> > > +      - enum:
> > > +          - fsl,imx23-lcdif
> > > +          - fsl,imx28-lcdif
> > > +          - fsl,imx6sx-lcdif
> >
> > Indent correct.
> > 
> > > +      - items:
> > > +        - enum:
> > > +          - fsl,imx6sl-lcdif
> > > +          - fsl,imx6sll-lcdif
> > > +          - fsl,imx6ul-lcdif
> > > +          - fsl,imx7d-lcdif
> > > +          - fsl,imx8mq-lcdif
> >
> > Indent shall be two more spaces like above.
> > (This is at least my best uderstanding)
> 
> I think you're right. I wonder why dt_binding_check doesn't complain.
> I'll fix it anyway.

Because I haven't integrated yamllint yet. I do have a config file at 
least.

> 
> > > +        - const: fsl,imx6sx-lcdif
> > 
> > With the above the following compatibles are supported:
> > 
> > 	"fsl,imx23-lcdif"
> > 	"fsl,imx28-lcdif"
> > 	"fsl,imx6sx-lcdif"
> > 	"fsl,imx8mq-lcdif"
> > 
> > 	"fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx7d-lcdif", "fsl,imx6sx-lcdif"
> > 	"fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif"
> > 
> > So the fallback value is the later "fsl,imx6sx-lcdif" which looks ok.
> > 
> > With indent fixed (or explained why I am wrong):
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > >  
> > >    reg:
> > >      maxItems: 1
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
