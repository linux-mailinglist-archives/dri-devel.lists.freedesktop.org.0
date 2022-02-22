Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E072A4C0015
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833910EB40;
	Tue, 22 Feb 2022 17:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CC410EB40
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 17:26:25 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id j2so15294541oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WgiR2YpZmAw/hGpP8OM/4uHNuAr+9BK7vpKRyeZvptc=;
 b=mfXu87+wgCor10qMw4u6kQ6RlIJKINQc7/TkDIvLr6r8EpfEQio0aHPzgdwvKtuGCB
 Qxn9fIZc6yOk55wzpvTZHWE78ubal8hQzXF961rLe0rfsXCrqOmev713eZ4wJo0lny9O
 4cmOaFVZoSVQavb/VdK9xtszIuYhW6qmtb89hovlvfNfLxz7ZpBNxHAh6cfTStd3HizO
 xD6oBRhoh7KR4ZgAEKKRYe66W20HVPrPbHzh/9pXTfZbw7uW0z2W6dUk4GC4rUCDOeWC
 ZgQw41aXHM/QXuFoDJBrQVcQdI8UbbX2ixFdoUYNKXGi8/YdLf/D9hS01DCKIgr7MzC8
 tFTw==
X-Gm-Message-State: AOAM531de+II8CmIFi/bYBWccIwpUxbDXnAV7g3jmHpR4j/ifNMqlXO4
 BJCBYwx9ftx4Eodf89xdsZ5y6xk8Mw==
X-Google-Smtp-Source: ABdhPJzNdA7WFfoLObV6kc4dOY5eAP+fmcgHshKuVrH/45LJLJErYvDHO2c906gBVR6KUKEHsmopwg==
X-Received: by 2002:aca:f203:0:b0:2d0:706c:8d69 with SMTP id
 q3-20020acaf203000000b002d0706c8d69mr2515752oih.125.1645550784113; 
 Tue, 22 Feb 2022 09:26:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s14sm14221734oae.21.2022.02.22.09.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:26:23 -0800 (PST)
Received: (nullmailer pid 3264192 invoked by uid 1000);
 Tue, 22 Feb 2022 17:26:22 -0000
Date: Tue, 22 Feb 2022 11:26:22 -0600
From: Rob Herring <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Message-ID: <YhUcvtbkz8tykLe7@robh.at.kernel.org>
References: <20220218151110.11316-1-noralf@tronnes.org>
 <20220218151110.11316-2-noralf@tronnes.org>
 <d9ccc11c-0af6-717e-cb3f-514934894180@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9ccc11c-0af6-717e-cb3f-514934894180@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, maxime@cerno.tech, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 12:31:08PM +0100, Noralf Trønnes wrote:
> 
> 
> Den 18.02.2022 16.11, skrev Noralf Trønnes:
> > Add binding for MIPI DBI compatible SPI panels.
> > 
> > v4:
> > - There should only be two compatible (Maxime)
> > - s/panel-dbi-spi/panel-mipi-dbi-spi/in compatible
> > 
> > v3:
> > - Move properties to Device Tree (Maxime)
> > - Use contains for compatible (Maxime)
> > - Add backlight property to example
> > - Flesh out description
> > 
> > v2:
> > - Fix path for panel-common.yaml
> > - Use unevaluatedProperties
> > - Drop properties which are in the allOf section
> > - Drop model property (Rob)
> > 
> > Acked-by: Maxime Ripard <maxime@cerno.tech>
> > Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> > ---
> >  .../display/panel/panel-mipi-dbi-spi.yaml     | 125 ++++++++++++++++++
> >  1 file changed, 125 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> > new file mode 100644
> > index 000000000000..748c09113168
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - {} # Panel Specific Compatible
> > +      - const: panel-mipi-dbi-spi
> > +
> 
> Rob's bot uses a -m flag I didn't use, and with that the compatible fails:
> 
> $ make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>   DTEX
> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dts
>   DTC
> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml
>   CHECK
> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml
> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml:0:0:
> /example-0/spi/display@0: failed to match any schema with compatible:
> ['sainsmart18', 'panel-mipi-dbi-spi']
> 
> How can I write the compatible property to make the checker happy?

You need to partition the schemas as I outlined before. Given the DBI 
spec does define power and reset, maybe you can get away with 1 schema 
just by changing the '- {}' entry above to an enum with a list of 
compatibles. But as soon as there is a panel with extra or different 
properties, this schema will have to be split. 

Rob
