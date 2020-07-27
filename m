Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271622F75F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 20:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EDA89F6E;
	Mon, 27 Jul 2020 18:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3351589F6E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 18:10:35 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l17so3685044ilq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 11:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jRzTHR+VUU5DFiybjijCTcymNwc6WwfSJ1wj6lSvSl4=;
 b=qwhgPyhx3I8YRuEqAO73ZVLBrTi+lEWIDFsezZeBAtQ3514+qqUTkR616IIG7i0BmO
 8+sf277tdtblvT5eiNaG7v3Ye29+r8GHLXsOBuIGeqFO9JkRIyKmLLPWHNKxy23ut9x9
 yXAw7EXDAAfXPhIX1uv84KIIBLsRd6BNoRV/XysP6NttlUt6kw0n1I3Ke+svP5CYPW04
 5btXWpdLmspRFckOx/GlfYu0z9XsXyvXqKT85Cd+xZgHoDyZiYSzFX9rJxFTyiKC+yb1
 3Csl0CpHOh/2uEg32lFyieoHqtLPU5xnHP9DUcBjY8BKRqWyWurH1l3vlya7V569oDhV
 lj9g==
X-Gm-Message-State: AOAM531hSt4prSZEoTFBA7X/3ra9fR32KumIl8CEGFBZa+FhS2vPK2Lz
 lsDVpJcHQqV2vPOW5wvqsw==
X-Google-Smtp-Source: ABdhPJw1a3yQdlRw7bOiSeDh/nd8Gh2ukbCWk8IYLKoeUc7WnO6thQ/sgeWWEpYf2f0YkxeHe4+Odg==
X-Received: by 2002:a92:cc4d:: with SMTP id t13mr17986305ilq.283.1595873433143; 
 Mon, 27 Jul 2020 11:10:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q70sm4862762ili.49.2020.07.27.11.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:10:32 -0700 (PDT)
Received: (nullmailer pid 634067 invoked by uid 1000);
 Mon, 27 Jul 2020 18:10:32 -0000
Date: Mon, 27 Jul 2020 12:10:32 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
Message-ID: <20200727181032.GB633248@bogus>
References: <20200725211457.5772-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200725211457.5772-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jul 2020 23:14:56 +0200, Marek Vasut wrote:
> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
> one is used in the Raspberry Pi 7" touchscreen display unit.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> To: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../display/bridge/toshiba,tc358762.yaml      | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dts:20.13-23: Warning (reg_format): /example-0/bridge@0:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: example-0: bridge@0:reg:0: [0] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: bridge@0: '#address-cells', '#size-cells', 'port@0', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.example.dt.yaml: bridge@0: 'ports' is a required property


See https://patchwork.ozlabs.org/patch/1336337

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
