Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D5183D25
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952B6EB55;
	Thu, 12 Mar 2020 23:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF696EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 23:14:48 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6984B20637;
 Thu, 12 Mar 2020 23:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584054888;
 bh=9wDFf+oPT1U99O9sM6O9KnkAPcMBEuhgp2SaIbrm4eE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eBjMpPYNRMtMMOO+Je+Uv9X+IIIE/u9hx+i+qeMpUqYR0USWNjiHUCPdOnXJmifhY
 8CEgsN6jvV0Xl1MU+3wXgqt6Nh6+OKLhkwAiSoR9Zx7XJ6fycaasZgA5tueX31XFWb
 kPu34sZ/q/rBoiU42hawDEleNmQOjM4HUqz/sdWU=
MIME-Version: 1.0
In-Reply-To: <20200225181654.GA694@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <9166f3acdc2a64e3f3ca1cd2e283005ee2df37c9.1582533919.git-series.maxime@cerno.tech>
 <20200225181654.GA694@bogus>
Subject: Re: [PATCH 06/89] dt-bindings: clock: Add a binding for the RPi
 Firmware clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh@kernel.org>
Date: Thu, 12 Mar 2020 16:14:47 -0700
Message-ID: <158405488765.149997.7323586314054590516@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Herring (2020-02-25 10:16:54)
> On Mon, Feb 24, 2020 at 10:06:08AM +0100, Maxime Ripard wrote:
> > The firmare running on the RPi VideoCore can be used to discover and
> > change the various clocks running in the BCM2711. Since devices will
> > need to use them through the DT, let's add a pretty simple binding.
> > 
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> > new file mode 100644
> > index 000000000000..d37bc311321d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/raspberrypi,firmware-clocks.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/raspberrypi,firmware-clocks.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RaspberryPi Firmware Clocks Device Tree Bindings
> > +
> > +maintainers:
> > +  - Maxime Ripard <mripard@kernel.org>
> > +
> > +properties:
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  compatible:
> > +    const: raspberrypi,firmware-clocks
> > +
> > +  raspberrypi,firmware:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: >
> > +      Phandle to the mailbox node to communicate with the firmware.
> 
> Can't this be a child node of the phandle instead? Or just add 
> '#clock-cells' to the firmware node.

Yeah, just add the clock-cells to the firmware node unless that doesn't
work for some reason?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
