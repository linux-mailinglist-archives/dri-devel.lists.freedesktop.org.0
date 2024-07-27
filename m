Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A929D93E0A1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 20:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A3210E094;
	Sat, 27 Jul 2024 18:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Blq8QLe/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1251210E094
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 18:54:45 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b06e63d288so9536046d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722106484; x=1722711284; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9b2EluIDdwCbEMT9V2F6Mpy73Q0qmkww/Qaik2t/B+w=;
 b=Blq8QLe/r079ZmkCrM3x8vDPoPyhF29klJLddjzLwESSUE0Qb0kx8AxZscYxHT9UsK
 pXGHCD4H4ygIaXx0UynH9iorNq2hNso0BZIMDTmPBX2XE7ze69bvN55JhBkbIFVuFILU
 ACR/LaY/AaOcq5qDAMGUU9CLhnqNUkMjIFr0BhvsgcGQ0lFYZbBiNeI/O/KTOs3kAAs6
 8gEGp0dMPF2mdCk36s5886RznahwQ/AOkiX3y/6t8r6072Vw9ufvdwjfUu/x9z0Na+jn
 GxhsU+CL/gwPo6J/2XGe/M3cloYnYpg1x3TTpqz3x/Ua+5jGkrDwyRwnyULpBGhRvGhE
 VmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722106484; x=1722711284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9b2EluIDdwCbEMT9V2F6Mpy73Q0qmkww/Qaik2t/B+w=;
 b=G5evcruAlBwXVyZDh4FV9V8jAlMOycKrt28tPnk2Gp8KGQeZgaDU5SONzB97QbAX2L
 6MVJXE79uXODtU86oo5smlfTzkwvTveCJR43k/RUsvcPoA3/qU6qUjr/fTNldLQ5U8Nz
 Up+MC7tAro587VzrUqP4ObbeOx5M139Td/nrjb/alIo+HZpaVZ+mtJ/IB0JFFWLPz++q
 kpIajRu34/1ktvedO92DzMJTaiV0AbR/YQ2eS63lNPUUKlf+CKAn/AHHsDcc83WdWT1c
 ZhUQvpNktqBvg7na4iBNrnGnO8lTsu3fcA1b3WDM+RfYtRpA/h4YE8iJ1xlbrLb+QHcu
 6xPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOIhxhUt5PDyk+JmnocIFYlv4JV0iMSrLAxT/HXT7PCnJXC7F0KxoUPMOybJgNqr6EbkxkytLcnBxDc1H/EHUUFEjL6ubJHainb3TgpOwX
X-Gm-Message-State: AOJu0YwITs3tvs1cOqDVU0WeC5j3kydolsRTYEE3c9pkTNbloLv2Y4bW
 bAi9od5z/CPvmTRoiszdz7x0/Q8RCERtGbyO2LCbNRkNGW+Lc5zV
X-Google-Smtp-Source: AGHT+IHtqR5DOIyMv177rcxe4AjeaR9AX0+sk4521t4XZ+FIkJi22ahOIfLiRVbkdFsi5DkCJu+geg==
X-Received: by 2002:ad4:5943:0:b0:6b7:9c52:db53 with SMTP id
 6a1803df08f44-6bb55ac596fmr51596386d6.48.1722106483720; 
 Sat, 27 Jul 2024 11:54:43 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8f83c9sm32265646d6.38.2024.07.27.11.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 11:54:43 -0700 (PDT)
Date: Sat, 27 Jul 2024 14:54:40 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, christophe.jaillet@wanadoo.fr, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <4jzq2jvezh6kcb2gxbyicveiaetn2drybi2wlrzmwziud6hcy3@gdqoo7bxmlba>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-2-lanzano.alex@gmail.com>
 <52bf1aa6-449f-4f77-992e-45e510fe6e7f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52bf1aa6-449f-4f77-992e-45e510fe6e7f@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 27, 2024 at 11:06:05AM GMT, Krzysztof Kozlowski wrote:
> On 26/07/2024 21:44, Alex Lanzano wrote:
> > Add device tree bindings for the monochrome Sharp Memory LCD
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> 
> The order of tags is incorrect. Who developed it first? Please read at
> Submitting patches - it explained this case quite precisely.
> 

Will fix!

> > ---
> >  .../bindings/display/sharp,ls010b7dh04.yaml   | 94 +++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
> > new file mode 100644
> > index 000000000000..79bde7bf0d7d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sharp,ls010b7dh04.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sharp Memory LCD panels
> > +
> > +maintainers:
> > +  - Alex Lanzano <lanzano.alex@gmail.com>
> > +
> > +description:
> > +  Sharp Memory LCDs are a series of monochrome displays that operate over
> > +  a SPI bus when the chip select is high. The displays require a signal (VCOM)
> > +  to be generated to prevent DC bias build up resulting in pixels being
> > +  unable to change. Three modes can be used to provide the VCOM signal
> > +  ("software", "external", "pwm").
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sharp,ls010b7dh04
> > +      - sharp,ls011b7dh03
> > +      - sharp,ls012b7dd01
> > +      - sharp,ls013b7dh03
> > +      - sharp,ls013b7dh05
> > +      - sharp,ls018b7dh02
> > +      - sharp,ls027b7dh01
> > +      - sharp,ls027b7dh01a
> > +      - sharp,ls032b7dd02
> > +      - sharp,ls044q7dh01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  spi-cs-high: true
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>
> 

My apologies! I must've missed the comment on this line. I replied to this
on the v1 thread

> > +
> > +  spi-max-frequency:
> > +    maximum: 2000000
> > +
> > +  sharp,vcom-mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: |
> > +      software - This mode relies on a software operation to send a
> > +      "maintain display" message to the display, toggling the vcom
> > +      bit on and off with each message
> > +
> > +      external - This mode relies on an external clock to generate
> > +      the signal on the EXTCOMM pin
> 
> External clock? Then you might be missing clocks property.

This is to handle the case where a clock IC or other signal generator IC is provided
on the display module itself. So I don't believe the clocks property would be 
needed.

> > +
> > +      pwm - This mode relies on a pwm device to generate the signal
> > +      on the EXTCOMM pin
> 
> That's an enum. Otherwise why "pony" would be a correct vcom-mode?
> 

Will fix!

> > +
> > +  enable-gpios: true
> > +
> > +  pwms:
> > +    maxItems: 1
> > +    description: External VCOM signal
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spi-cs-high
> > +  - sharp,vcom-mode
> > +
> > +allOf:
> > +  - $ref: panel/panel-common.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        sharp,vcom-mode:
> > +          const: pwm
> > +    then:
> > +      required:
> > +        - pwms
> > +
> > +additionalProperties: false
> 
> Instead:
> unevaluatedProperties: false
> 

Will fix!

> > +
> > +examples:
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        display@0{
> 
> Missing space (see DTS coding style or any DTS)
> 

Will Fix!

> > +            compatible = "sharp,ls013b7dh03";
> > +            reg = <0>;
> > +            spi-cs-high;
> > +            spi-max-frequency = <1000000>;
> > +            sharp,vcom-mode = "software";
> > +        };
> > +    };
> > +...
> 
> Best regards,
> Krzysztof
> 

Again, thank you for taking the time to review.

Best regards,
Alex
