Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6864B75E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF7E10E324;
	Tue, 13 Dec 2022 14:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357B610E31E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:30:30 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 v62-20020a4a7c41000000b004a0a214dfbaso2384056ooc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 06:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mM9kRLYMidEhJ9aWws+5SH1yRO1DfKGfusCzNc46Kb8=;
 b=e2BVUEYn1yVuEFMXHYcoZlnQdQkUfzqAJRA34wgiGbSLEirK5uDZGNU1mX+U8iCG+6
 VJhWwgGBF8PN+XC7yhMG0KpTcfIpKPTSQ+1x/p2L9s8+i18R09Hzn1m9RZvzCdsDPuES
 NnZHawUaOjsWrC3TJGP5xo2QUOAGU2xaaxJHq81zaBpStJ1b4jgv4p4uIDFimWpXPdvW
 cxLFHWGGXrDdBdyOhSs+jwD2jm9o3JBRxzlnrfX8/TZb0uZvkRzCSMxuNrFqb/vOfu0x
 TF6eFe8+Wrup1CfuhfoYZGDGBFtyGBxDYdLr9NFfLwic3r88uZ68JG2Lto03oEzOcUoB
 VEuw==
X-Gm-Message-State: ANoB5pl9oSdQKaEg3W6lP8FLN9m/hIgifyOLfSxkSuMfDCssXMTPPDu6
 +jpoOxrbA7GHN9OxEMgGQSjqV7Us3Q==
X-Google-Smtp-Source: AA0mqf7AEpvMIx/aOAPpbyv8k7VDkIuEE1vd0lhL7EyoXfww/93yf9Y+fuCDWDAFlrfpuOfPbODjrA==
X-Received: by 2002:a4a:e046:0:b0:4a3:f16e:3d0c with SMTP id
 v6-20020a4ae046000000b004a3f16e3d0cmr3969209oos.0.1670941829039; 
 Tue, 13 Dec 2022 06:30:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f9-20020a4aeb09000000b0049fcedf1899sm1207639ooj.3.2022.12.13.06.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:30:28 -0800 (PST)
Received: (nullmailer pid 968949 invoked by uid 1000);
 Tue, 13 Dec 2022 14:30:27 -0000
Date: Tue, 13 Dec 2022 08:30:27 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display/panel: Add AUO A030JTN01
Message-ID: <20221213143027.GA967686-robh@kernel.org>
References: <20221213081034.14226-1-cbranchereau@gmail.com>
 <20221213081034.14226-2-cbranchereau@gmail.com>
 <167093911506.912834.5336090745245447936.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167093911506.912834.5336090745245447936.robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 07:46:32AM -0600, Rob Herring wrote:
> 
> On Tue, 13 Dec 2022 09:10:34 +0100, Christophe Branchereau wrote:
> > Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> > 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> > interface.
> > 
> > Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> >  .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dts:22.11-21: Warning (reg_format): /example-0/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dtb: panel@0: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml

You need a minimal spi bus node in your example.
