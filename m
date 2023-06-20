Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA77370A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 17:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A91E10E18A;
	Tue, 20 Jun 2023 15:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6D410E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:37:48 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-341daf315b3so24200915ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687275467; x=1689867467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sJbkvA8psBZvCbiZz79+0aLmkyZYgwDhRQ2jJ0L/Xc=;
 b=fisuLPy4NoG6ZRniCJpvz+mPdmlOGqJvKCC8aoLtHwL4h0+8a5bJaJ2nZZm5mLe3jy
 T4bqf+d8P3s3NIaJvFYQIBj7GNAkeRBL4o2ZoIsw3ghKe+Rr7dl+zGBzMe7E7T8MAYhl
 kvakflqvoDi/e2Xk3fd5sD23TxK9URMPVxHTToQAHX+4oeOygXKtutvF14yY0Rrf7I7r
 spji7k3sIirdpxlExrv+6tBMzIr7v2EIHLFXD+iUpEr+KplwvVzUmpa8eN1srPfViDA2
 nk/kSdEDsrB+rUd0kr2WEvAliXjX70/2UTjsfJexKUQISiuvTqmWoDZ1dN0+2U/1tEg3
 7pzg==
X-Gm-Message-State: AC+VfDyhZvFahs/VDHxmvZ5YdRbFFfzaeuSFzWAunrIcOeQuhxj2pDny
 dr8Mh0kbzABJX3jGGkvEDA==
X-Google-Smtp-Source: ACHHUZ5u+D4bbGxsP6bC+gdajHPXjGwM+AGf0+Hh4eLKoobenWPCJtpJM8Pm4EeQsdQZBZHPQ2GHEg==
X-Received: by 2002:a92:a30e:0:b0:33d:1735:fd79 with SMTP id
 a14-20020a92a30e000000b0033d1735fd79mr8830286ili.20.1687275467410; 
 Tue, 20 Jun 2023 08:37:47 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a92d9cd000000b0033b2a123254sm656797ilq.61.2023.06.20.08.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 08:37:46 -0700 (PDT)
Received: (nullmailer pid 3641003 invoked by uid 1000);
 Tue, 20 Jun 2023 15:37:43 -0000
Date: Tue, 20 Jun 2023 09:37:43 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501 HDMI and DP
Message-ID: <20230620153743.GA3637514-robh@kernel.org>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
 <3439354.PYKUYFuaPT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3439354.PYKUYFuaPT@steina-w>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, Sandor.yu@nxp.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 oliver.brown@nxp.com, neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 11:31:43AM +0200, Alexander Stein wrote:
> Hi Sandor,
> 
> Am Donnerstag, 15. Juni 2023, 03:38:12 CEST schrieb Sandor Yu:
> > Add bindings for Cadence MHDP8501 DisplayPort and HDMI driver.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >  .../display/bridge/cdns,mhdp8501.yaml         | 105 ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml new
> > file mode 100644
> > index 000000000000..a54756815e6f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cadence MHDP8501 Displayport bridge
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandor.yu@nxp.com>
> > +
> > +description:
> > +  The Cadence MHDP8501 Displayport/HDMI TX interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - cdns,mhdp8501-dp
> > +      - cdns,mhdp8501-hdmi
> > +      - fsl,imx8mq-mhdp8501-dp
> > +      - fsl,imx8mq-mhdp8501-hdmi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: MHDP8501 DP/HDMI APB clock.
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Hotplug cable plugin.
> > +      - description: Hotplug cable plugout.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: plug_in
> > +      - const: plug_out
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input port from display controller output.
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port to DP/HDMI connector.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> 
> You mark these ports as required, but apparently the drivers do not use them, 
> AFAICT. E.g. missing port@1 is not resulting in an error, at lease for HDMI 
> one.

A connector node should be required whether a particular OS requires it 
or not. The bindings without predate defining a connector node.

Rob
