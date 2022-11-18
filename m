Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F01630EC5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F021210E0B1;
	Sat, 19 Nov 2022 12:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B66710E1F7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:08:10 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A6901BF207;
 Fri, 18 Nov 2022 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668762486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hk4AOBalIifEeElfq46iL3XmVWZkthoRP4j/dELNq74=;
 b=PYaFvwIBT1fZvme+y7/XZhypZc3UGJ3ePCvBZDeMt2zQO1MUbe0YBjbLrxU0sCOC0e5JF5
 Fbyffoq9cAiim1MkYGqDT2ReFThFRTBY16CeKQ7N0oNXL2lXwTFwauHUmgEtbxhHwaw1uR
 IcWwAVz1wE+Rs2xHOy0PPNZk8T9c6ab9Xg09GRCJenTNtguS0VyW4VWvyrGHZG66g9xAkA
 wvcqxvJPvXP0OYmTXe9yYhryfScr61gXbfi5llscfY1ci7Jref8RW5UzkRXPGnGll9iy2R
 rnBq6epnoqVkVxsKa40UFORjMIP9xFhEhdv/O6admiHsdEFYJ9ZLuuuQJJU9Pg==
Date: Fri, 18 Nov 2022 10:08:00 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 01/23] dt-bindings: display: tegra: add bindings for
 Tegra20 VIP
Message-ID: <20221118100800.4950aec0@booty>
In-Reply-To: <ca5f3b54-25bd-4dd5-799f-c7bda08cdef6@linaro.org>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-2-luca.ceresoli@bootlin.com>
 <ca5f3b54-25bd-4dd5-799f-c7bda08cdef6@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Nov 2022 12:39:05 +0000
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

thanks for the review. I'm glad my error rate on bindings is lower than
it used to be before I attended your ELCE talk! ;)

On Tue, 15 Nov 2022 13:12:44 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > VIP is the parallel video capture component within the video input
> > subsystem of Tegra20 (and other Tegra chips, apparently).  
> 
> Subject: drop second, redundant "bindings".
> 
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-vip.yaml     | 64 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 ++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> > new file mode 100644
> > index 000000000000..934dabfd2307
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra VIP (parallel video capture) controller
> > +
> > +maintainers:
> > +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> > +
> > +properties:
> > +  $nodename:
> > +    const: vip  
> 
> No need to enforce names in device schemas, especially that this does
> not look like a generic name.
> 
> > +
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra20-vip
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  channel@0:  
> 
> Missing description.

OK, I think this should do:

  description: parallel video capture interface for the VI

> > +    type: object  
> 
> Do you expect it to grow to more channels?

Not on Tegra20, it has one input only, but for other SoCs it's likely.
Definitely some (including Tegra20 itself) have multiple CSI-2 inputs,
and it's reasonable that this can apply to parallel input too.

Is this enough motivation to make room for more channels, or should I
remove it since I have no plans to introduce support for other Tegra
chips?

> > +
> > +    properties:
> > +      reg: true  
> 
> const: 0
> 
> > +
> > +      ports:
> > +        $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +        properties:
> > +          port@0:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description:
> > +              Port receiving the video stream from the sensor
> > +
> > +          port@1:
> > +            $ref: /schemas/graph.yaml#/properties/port
> > +            description:
> > +              Port sending the video stream to the VI
> > +
> > +        required:
> > +          - port@0
> > +          - port@1
> > +
> > +    additionalProperties: false
> > +
> > +    required:
> > +      - reg
> > +      - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - channel@0
> > +
> > +# see nvidia,tegra20-vi.yaml for an example  
> 
> That file does not have this compatible. At least not on next-20221109.

It's added in patch 2. It's a chicken-egg problem, should I add a third
patch that adds this line only?

ACK for all other comments you wrote.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
