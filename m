Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17A3FAC59
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 17:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F6989DA4;
	Sun, 29 Aug 2021 14:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E4E89DA4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 14:59:56 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso15004015ots.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 07:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=1fbltw3MLBuOoS98NmW+6rPgiO3mlgpEY5SYN5XgMR8=;
 b=hBfPeOcZLx8EadmyWFswuG+2pgWG9s//molQOariA3ntwuyRbTtS0jVknI9t2QC7lz
 wXtNU6Pm4zwyzB7pJ8CnaB2MIeMw8h7oI1I8FJ8Tk1L2HEn4IpAKV83AlDlSpEK4gwO7
 ZE+bqcf7OncU/HS0ZeY8aE7NPvVQTd0rDCr2ePZULO7P6UnJVpJj1PxOF95bsaqqQIoD
 xjtV1uUkc0EAPhyHr0JZy16rGQdSmnCaZGuFVP6INi1R9iMvZ/ILl+9Q1fy3wVLirKBN
 gksYsTpVzhNPWaGhhcy/3eTzMcd/UEvOnF7RjrJzW+GicpGsPoTFVxoMqzFBMk4bq07f
 pjoQ==
X-Gm-Message-State: AOAM533g328cPy0akHLtjqsmNFbsDWsz9cMzTjc0nfJZHf+fsCvRz0gx
 X9Qeux4UHQYFXlEyqE6SLj3+TWb0TQ==
X-Google-Smtp-Source: ABdhPJxgcPYAiARJ2IljUopanOwJB3/pN9yqy+Hw6MMqIPWV6xS/IL+dLOJvOskwmzg8jAA0ePJMhA==
X-Received: by 2002:a9d:7ccc:: with SMTP id r12mr16609743otn.350.1630249195481; 
 Sun, 29 Aug 2021 07:59:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j125sm2402835oif.53.2021.08.29.07.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 07:59:53 -0700 (PDT)
Received: (nullmailer pid 3944982 invoked by uid 1000);
 Sun, 29 Aug 2021 14:59:52 -0000
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20210828112640.7248-1-paul@crapouillou.net>
References: <20210828112640.7248-1-paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add AUO A030JTN01
Date: Sun, 29 Aug 2021 09:59:52 -0500
Message-Id: <1630249192.491326.3944981.nullmailer@robh.at.kernel.org>
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

On Sat, 28 Aug 2021 12:26:39 +0100, Paul Cercueil wrote:
> Add binding for the AUO A030JTN01 panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/auo,a030jtn01.yaml | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dts:23.11-21: Warning (reg_format): /example-0/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/auo,a030jtn01.example.dt.yaml: example-0: panel@0:reg:0: [0] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1521878

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

