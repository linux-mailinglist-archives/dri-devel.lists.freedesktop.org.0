Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB71A4935
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 19:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987076ED26;
	Fri, 10 Apr 2020 17:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D396ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 17:38:15 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b10so1979498oic.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xMUIst4uwZNit/kezR50BEXwVLAD+7IMlqqlt2PZF4M=;
 b=chdQRRmdZpV8qAqXAQAMpSAGyVSHTWg2Hhlt6Qa317lil6fkIdz7OMs8x5QSSmBoBe
 KsPxkwrD1TkB/tkTRMplof6spcF22VW4JeY4NUVUOLvWuLTS/HaJ5c9kJ3k/vNwAyNf6
 VSOhccsOxDRADn9jyYrPXVvUVb/jlecYxtiYSIKi86k64kI/tJ4cSj7fPED6uhpMQZ9M
 NhcjJrJ11nevSQz+1Q7OQ8Q4Z96Qv7KxtwdvLqRWATV74E5onHoRRIRxmzSdLqXnmlFF
 1xvlW8Y0Ss2zEvIxFNZ/6BsCBuIstc3nqtBA4rUAw6z+Ibb9GTdFwrU3FGQmrNWSrxEi
 ZCyQ==
X-Gm-Message-State: AGi0PuZU/xlHhs7cGt8CYTTtpgEExUpvyGqeRIrDhmD1z0i89pJh2Jfc
 8inIidpotosqE3QRiR3ZHA==
X-Google-Smtp-Source: APiQypJwusuEqgU1CYkOWOgcrzLL32tqNKeweZKcGAtisZ1kThdf4338Sn41hKMfM5QqP5/sISiZCg==
X-Received: by 2002:aca:891:: with SMTP id 139mr4109648oii.137.1586540295214; 
 Fri, 10 Apr 2020 10:38:15 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id 89sm1469196otj.66.2020.04.10.10.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:38:14 -0700 (PDT)
Received: (nullmailer pid 12197 invoked by uid 1000);
 Fri, 10 Apr 2020 16:52:01 -0000
Date: Fri, 10 Apr 2020 11:52:01 -0500
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination
 GPUs
Message-ID: <20200410165201.GA9521@bogus>
References: <cover.1585503505.git.hns@goldelico.com>
 <000359713a45bb1a1adc0b609e4e659aedf99e6c.1585503505.git.hns@goldelico.com>
 <0E273453-861D-45A2-8FA4-D5EC4B78F490@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0E273453-861D-45A2-8FA4-D5EC4B78F490@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Philipp Rossak <embed3d@gmail.com>, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, James Hogan <jhogan@kernel.org>,
 OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 09:00:48AM +0200, H. Nikolaus Schaller wrote:
> 
> > Am 29.03.2020 um 19:38 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > The Imagination PVR/SGX GPU is part of several SoC from
> > multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
> > Allwinner A83 and others.
> > 
> > With this binding, we describe how the SGX processor is
> > interfaced to the SoC (registers, interrupt etc.).
> > 
> > In most cases, Clock, Reset and power management is handled
> > by a parent node or elsewhere (e.g. code in the driver).
> > 
> > Tested by make dt_binding_check dtbs_check
> > 
> > Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> > ---
> > .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 109 ++++++++++++++++++
> > 1 file changed, 109 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > new file mode 100644
> > index 000000000000..aadfb2d9b012
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Imagination PVR/SGX GPU
> > +
> > +maintainers:
> > +  - H. Nikolaus Schaller <hns@goldelico.com>
> > +
> > +description: |+
> > +  This binding describes the Imagination SGX5 series of 3D accelerators which
> > +  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
> > +  Allwinner A83, and Intel Poulsbo and CedarView and more.
> > +
> > +  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
> > +
> > +  The SGX node is usually a child node of some DT node belonging to the SoC
> > +  which handles clocks, reset and general address space mapping of the SGX
> > +  register area.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: SGX530-121 based SoC
> > +        items:
> > +          - enum:
> > +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
> > +          - const: img,sgx530-121
> > +          - const: img,sgx530
> > +
> > +      - description: SGX530-125 based SoC
> > +        items:
> > +          - enum:
> > +            - ti,am3352-sgx530-125 # BeagleBone Black
> > +            - ti,am3517-sgx530-125
> > +            - ti,am4-sgx530-125
> > +            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
> > +            - ti,ti81xx-sgx530-125
> > +          - const: ti,omap3-sgx530-125
> > +          - const: img,sgx530-125
> > +          - const: img,sgx530
> > +
> > +      - description: SGX535-116 based SoC
> > +        items:
> > +          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
> > +          - const: img,sgx535-116
> > +          - const: img,sgx535
> > +
> > +      - description: SGX540-116 based SoC
> > +        items:
> > +          - const: intel,medfield-gma-sgx540 # Atom Z24xx
> > +          - const: img,sgx540-116
> > +          - const: img,sgx540
> > +
> > +      - description: SGX540-120 based SoC
> > +        items:
> > +          - enum:
> > +            - ingenic,jz4780-sgx540-120 # CI20
> > +            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
> > +          - const: img,sgx540-120
> > +          - const: img,sgx540
> > +
> > +      - description: SGX544-112 based SoC
> > +        items:
> > +          - const: ti,omap4-sgx544-112
> > +          - const: img,sgx544-112
> > +          - const: img,sgx544
> > +
> > +      - description: SGX544-116 based SoC
> > +        items:
> > +          - enum:
> > +            - allwinner,sun8i-a83t-sgx544-116 # Banana-Pi-M3 (Allwinner A83T) and similar
> 
> Philipp Rossak reported on a different list [1] that the a83t tells to have a sgx544-115 inside.
> 
> So it needs a separate entry.

Okay, it looks fine otherwise.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
