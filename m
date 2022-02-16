Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 045504B94B9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 00:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C026D10E669;
	Wed, 16 Feb 2022 23:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7211910E669
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 23:52:20 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id p11so1075294ils.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 15:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b/JXIitbDZ9HoqIJQDyG8ELeQOdY8UCMjKhFkXYelkw=;
 b=cA1Sbx6x+/LuVSA3nWEzD66/z5dUFbqhRq1CgEJ6LwYNXspJrbCTTiYJsdXj3458t1
 JaP0/gqWO998phexV7lpjBme8rpvd4LFjI3+XORR9CycQf4svMMVTZZ/v2mqmJLQpEtm
 s7vF2weAiit5xt/W4vdaaY41V4ETMtwT8hIcc82zkQhSJHd1ILWy22cQe390WYeMYG17
 fmiGWDXj5l9vVaUhz/a0ErOlHom1U6kDS48VHxAe2vXVNknzyWZzhRqyaDL580EX/yyf
 pEdSH0DGwIdwTl0Y4qdXiOoaoDAot25+9N7YcZGz5NKDClOIhKRGR4MKkNgHIq8GLoPP
 bvIA==
X-Gm-Message-State: AOAM5313U5KWX/sa4zdp69eolDIG/ACcfa3Swt/HbIz6hFlJr80UZ6sd
 dFIYP9b1HxbIlvOC90xS5g==
X-Google-Smtp-Source: ABdhPJzMeZBEmpkyBZ0DqYIbANVj7AN2XmgRUWyZkypg6ORTBG7lSLroGnVPeDY/yrX1DtGyrr1CDQ==
X-Received: by 2002:a92:c567:0:b0:2b8:b4d1:ba3c with SMTP id
 b7-20020a92c567000000b002b8b4d1ba3cmr202018ilj.50.1645055539773; 
 Wed, 16 Feb 2022 15:52:19 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id i13sm800285ila.46.2022.02.16.15.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 15:52:18 -0800 (PST)
Received: (nullmailer pid 1918923 invoked by uid 1000);
 Wed, 16 Feb 2022 23:52:16 -0000
Date: Wed, 16 Feb 2022 17:52:16 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Message-ID: <Yg2OMADV6GLG6a4/@robh.at.kernel.org>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
 <YgaE06Ktabpf2dJC@robh.at.kernel.org>
 <20220214234517.121e1167@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214234517.121e1167@aktux>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 josua.mayer@jm0.eu, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 11:45:17PM +0100, Andreas Kemnade wrote:
> Hi Rob,
> 
> On Fri, 11 Feb 2022 09:46:27 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Sun, Feb 06, 2022 at 09:00:11AM +0100, Andreas Kemnade wrote:
> > > Add a binding for the Electrophoretic Display Controller found at least
> > > in the i.MX6.  
> > 
> > The first version was in i.MX50 (I helped design the register 
> > interface). Is that version compatible?
> > 
> it has some differences, but that could be detected by EPDC_VERSION
> register. I do not own such a device, so I cannot fully check. I have
> not seen any driver with devicetree for IMX5. For now I am rejecting
> anything which has a EPDC version which I cannot check. 
> 
> > > The timing subnode is directly here to avoid having display parameters
> > > spread all over the plate.
> > > 
> > > Supplies are organized the same way as in the fbdev driver in the
> > > NXP/Freescale kernel forks. The regulators used for that purpose,
> > > like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> > > start a bunch of regulators of higher or negative voltage with a
> > > well-defined timing. VCOM can be handled separately, but can also be
> > > incorporated into that single bit.
> > > 
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > > ---
> > >  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
> > >  1 file changed, 159 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > > new file mode 100644
> > > index 000000000000..7e0795cc3f70
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > > @@ -0,0 +1,159 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/imx/fsl,mxc-epdc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale i.MX6 EPDC
> > > +
> > > +maintainers:
> > > +  - Andreas Kemnade <andreas@kemnade.info>
> > > +
> > > +description: |
> > > +  The EPDC is a controller for handling electronic paper displays found in
> > > +  i.MX6 SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx6sl-epdc
> > > +      - fsl,imx6sll-epdc  
> > 
> > Not compatible with each other?
> > 
> differences are detectable by EPDC_VERSION register, so probably so
> problem. NXP/Freescale kernel uses
> fsl,imx6dl-epdc
> and 
> fsl,imx7d-epdc (used also by imx6 devices with EPDC_VERSION = 3.0)
> in their drivers.
> 
> fsl,imx6dl-epdc
> fsl,imx6sl-epdc
> fsl,imx6sll-epdc
> fsl,imx7d-epdc
> in their dtsis.
> 
> But the general rule is to use as less as possible compatible strings
> if differences can be probed properly, so only one should be
> sufficient? Which one?

If you can probe all the differences, then just 'fsl,imx-epdc' is 
sufficient. Just document that so the next time around I don't forget 
and tell you it needs to be specific.

Rob
