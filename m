Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D2E4B9E99
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 12:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997510E137;
	Thu, 17 Feb 2022 11:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4210E137
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XSxGqHqB4CD4ItwJiT094IbgEYiep/ZGxuAGK8hdbFM=; b=YeqARtQqVs/62u66byIearze8r
 IE4wuo5lqu2F8ITDkDR5OCNYH1cs8gMHNndNEPY2TfwZkLCO2zhKSl/sAr4oNL1q8eDVZf/TDaxeP
 k9ZllKSSEZRWRJY3+ukIdU5ynnBZl4oifiNPFAi3PmkX4RtRmRIlhewWGCzV98Kw9KY8=;
Received: from p200300ccff1474001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff14:7400:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nKf0D-0006cT-8F; Thu, 17 Feb 2022 12:31:13 +0100
Date: Thu, 17 Feb 2022 12:31:12 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Message-ID: <20220217123112.3ba70000@aktux>
In-Reply-To: <36445c86-036e-0942-a9a4-919595886c67@canonical.com>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
 <36445c86-036e-0942-a9a4-919595886c67@canonical.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 josua.mayer@jm0.eu, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 10:21:15 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:

> On 06/02/2022 09:00, Andreas Kemnade wrote:
> > Add a binding for the Electrophoretic Display Controller found at least
> > in the i.MX6.
> > The timing subnode is directly here to avoid having display parameters
> > spread all over the plate.
> > 
> > Supplies are organized the same way as in the fbdev driver in the
> > NXP/Freescale kernel forks. The regulators used for that purpose,
> > like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
> > start a bunch of regulators of higher or negative voltage with a
> > well-defined timing. VCOM can be handled separately, but can also be
> > incorporated into that single bit.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
> >  1 file changed, 159 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
> > 
[..]

> > +
> > +  DISPLAY-supply:
> > +    description:
> > +      A couple of +/- voltages automatically powered on in a defintive order  
> 
> Typo, definitive?
> 
yes, of course.

> > +
> > +  VCOM-supply:
> > +    description: compensation voltage
> > +
> > +  V3P3-supply:  
> 
> All of supplies names - lowercase.
> 
> > +    description: V3P3 supply
> > +
> > +  epd-thermal-zone:
> > +    description:
> > +      Zone to get temperature of the EPD from, practically ambient temperature.  
> 
> Is it a phandle?
> 
a string used in
       of_property_read_string(priv->drm.dev->of_node,
                                "epd-thermal-zone", &thermal);
        if (thermal) {
                priv->thermal = thermal_zone_get_zone_by_name(thermal);
                if (IS_ERR(priv->thermal))
                        return dev_err_probe(priv->drm.dev, PTR_ERR(priv->thermal),
                                             "unable to get thermal");
        }

[...]
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx6sl-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    epdc: epdc@20f4000 {  
> 
> Generic node name, e.g. display-controller
> 
hmm, does IHMO not make too much sense here. E.g. in the imx6sll.dtsi
we have lcd-controller next to it. So having epd-controller? But that
is exactly what epdc stands for.

Regards,
Andreas
