Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3BD387FB9
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503F6EC6E;
	Tue, 18 May 2021 18:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1E76EC6E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 18:38:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i17so11299108wrq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Huc21UOdwPm7LAcMF6IDLuI3qr/CzsjN0hTgKyze11c=;
 b=pbeTfT/zAWAbrjMc3KD6Gzn44cNIr2HWhd/h4jEOEDiAKnA1jNwbNxzq3c+yPkuqiO
 EV+UhtlP7sMyOQLLG+DDeVOypX6sqKdQMyERYUwEX8oOpAfv4rULeWo2Zz/ZwylS6h+7
 zJj2PK9IuFIyJqGMGehkGvvL/ZVyDOY4OYpI8IdibzlIkSRxBgGrNRw9nDeO5ZUEI/Zu
 UjWWnDebmzljIs+V154G0HncayJW78gM5BMlO4TJWBkf5yCrs/zVkHiXeHW09z8Rhu7+
 ljgHDRtTChGqOXB0dGbidywt8MXbfSIuN1BnoB7Ojfv3YkgtsMLACcWN99FsEc/f2lGR
 zNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Huc21UOdwPm7LAcMF6IDLuI3qr/CzsjN0hTgKyze11c=;
 b=tstIpgz5VC5O8rc/YPL+JRuPEojNUZZUbFt7TwBvjEAt71YA10NmKnYyzjFGGXjlna
 mObCaxXzMK6xmctWWu2KUrIkEiBJq4qgyD+Qjeki+jyyx38YW+daq9/DsaErs7FmIUPZ
 cQhgcJTcNkem4ggn+pY+1pRlXvYix7WCGNPNWu2PfB3iQRtxJMbyphXxBk5v+effHVEU
 CrPjOSt3ZsOpIxT5AZ4XB2VEE2YjzaVeHtuNMWnNBdSRB51jyyg64JhJ5K5/Nv4GQHPg
 n59GkAJ6bZrhgj5VqOWEBu/kjRonsesw2X4qKnc7wS/O11ilO5QSPePH5a5V9i6qGhYK
 Qgyw==
X-Gm-Message-State: AOAM533pq53453bAS4/EeGihx3PfmxbHDKpdFG84mg6LVbtYBaftonsF
 s324MdAF/hQIyqeznWP7r15NUw==
X-Google-Smtp-Source: ABdhPJxEzSm2dA9aDTl991lTkKDfsxON+bT2vLdlUOLnICU65XUyaEVNHQyr+Z2Bn2OQ+ltXRjcWHg==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr9057975wre.140.1621363089108; 
 Tue, 18 May 2021 11:38:09 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id b12sm23051343wro.28.2021.05.18.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:08 -0700 (PDT)
Date: Tue, 18 May 2021 20:38:06 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Rob Herring <robh@kernel.org>, linus.walleij@linaro.org
Subject: Re: [PATCH] dt-bindings: display: convert faraday,tve200 to YAML
Message-ID: <YKQJjrlTB0RZYNOK@Red>
References: <20210511165448.422987-1-clabbe@baylibre.com>
 <20210518002624.GA3346846@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210518002624.GA3346846@robh.at.kernel.org>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le Mon, May 17, 2021 at 07:26:24PM -0500, Rob Herring a écrit :
> On Tue, May 11, 2021 at 04:54:48PM +0000, Corentin Labbe wrote:
> > Converts display/faraday,tve200.txt to yaml.
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  .../bindings/display/faraday,tve200.txt       | 54 -----------
> >  .../bindings/display/faraday,tve200.yaml      | 92 +++++++++++++++++++
> >  2 files changed, 92 insertions(+), 54 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/faraday,tve200.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.txt b/Documentation/devicetree/bindings/display/faraday,tve200.txt
> > deleted file mode 100644
> > index 82e3bc0b7485..000000000000
> > --- a/Documentation/devicetree/bindings/display/faraday,tve200.txt
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -* Faraday TV Encoder TVE200
> > -
> > -Required properties:
> > -
> > -- compatible: must be one of:
> > -	"faraday,tve200"
> > -	"cortina,gemini-tvc", "faraday,tve200"
> > -
> > -- reg: base address and size of the control registers block
> > -
> > -- interrupts: contains an interrupt specifier for the interrupt
> > -	line from the TVE200
> > -
> > -- clock-names: should contain "PCLK" for the clock line clocking the
> > -	silicon and "TVE" for the 27MHz clock to the video driver
> > -
> > -- clocks: contains phandle and clock specifier pairs for the entries
> > -	in the clock-names property. See
> > -	Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -
> > -Optional properties:
> > -
> > -- resets: contains the reset line phandle for the block
> > -
> > -Required sub-nodes:
> > -
> > -- port: describes LCD panel signals, following the common binding
> > -	for video transmitter interfaces; see
> > -	Documentation/devicetree/bindings/media/video-interfaces.txt
> > -	This port should have the properties:
> > -	reg = <0>;
> > -	It should have one endpoint connected to a remote endpoint where
> > -	the display is connected.
> > -
> > -Example:
> > -
> > -display-controller@6a000000 {
> > -	#address-cells = <1>;
> > -	#size-cells = <0>;
> > -	compatible = "faraday,tve200";
> > -	reg = <0x6a000000 0x1000>;
> > -	interrupts = <13 IRQ_TYPE_EDGE_RISING>;
> > -	resets = <&syscon GEMINI_RESET_TVC>;
> > -	clocks = <&syscon GEMINI_CLK_GATE_TVC>,
> > -		 <&syscon GEMINI_CLK_TVC>;
> > -	clock-names = "PCLK", "TVE";
> > -
> > -	port@0 {
> > -		reg = <0>;
> > -		display_out: endpoint {
> > -			remote-endpoint = <&panel_in>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/faraday,tve200.yaml b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
> > new file mode 100644
> > index 000000000000..3ab51e7e72af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/faraday,tve200.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/faraday,tve200.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Faraday TV Encoder TVE200
> > +
> > +maintainers:
> > +  - Linus Walleij <linus.walleij@linaro.org>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: faraday,tve200
> > +      - items:
> > +          - const: cortina,gemini-tvc
> > +          - const: faraday,tve200
> > +
> > +  reg:
> > +    minItems: 1
> 
> maxItems: 1
> 
> They evaluate the same, but maxItems seems a bit more logical. 
> 
> > +
> > +  interrupts:
> > +    minItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: PCLK
> > +      - const: TVE
> > +
> > +  clocks:
> > +    minItems: 2
> > +
> > +  resets:
> > +    minItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^port@[0-9]+$":
> 
> Should be just 'port' or 'port@0', but really the former is preferred 
> when only 1. 
> 
> Use the graph binding:
> 
> $ref: /schemas/graph.yaml#/properties/port
> 

I have a problem:

I get the following warning:
/usr/src/linux-next/arch/arm/boot/dts/gemini.dtsi:410.31-423.5: Warning (graph_child_address): /soc/display-controller@6a000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
  also defined at /usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:492.31-501.5

But if I remove them!
/usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:496.5-15: Warning (reg_format): /soc/display-controller@6a000000/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:495.11-500.6: Warning (avoid_default_addr_size): /soc/display-controller@6a000000/port@0: Relying on default #address-cells value
/usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:495.11-500.6: Warning (avoid_default_addr_size): /soc/display-controller@6a000000/port@0: Relying on default #size-cells value
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
arch/arm/boot/dts/gemini-dlink-dir-685.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:495.11-500.6: Warning (graph_port): /soc/display-controller@6a000000/port@0: graph node '#address-cells' is -1, must be 1
/usr/src/linux-next/arch/arm/boot/dts/gemini-dlink-dir-685.dts:495.11-500.6: Warning (graph_port): /soc/display-controller@6a000000/port@0: graph node '#size-cells' is -1, must be 0

The only solution is to remove "reg = <0>;" and calling the node "port".
Does it is acceptable ?

