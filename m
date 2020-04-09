Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E61A3CB1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 01:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771E46EC33;
	Thu,  9 Apr 2020 23:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622A6EC33
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 23:01:47 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t11so367921ils.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 16:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q7Zpp/CoGVKLdpn/4KBo3lndlt2F9/4wcPUKZ05F4Xk=;
 b=aU7Q4bRwEvIwr2YxphObVRhnBY6ZC5gDobgTvq6O/hp7d3DmUp7Y+89lW1ne2I7FS+
 og5UM0uDlGpC3t1b3Q9gabIf8fUL6a0O4KaBxwE1wmYX2ZufLNEjmexx0qy+mbcibHni
 RKlUem9aCEp/7ohBXDIp31ywKXcykHFpf6oY6U3ldF4BtMsiqAjKQ1RB3jCdGFXjhNlJ
 h/FcRHw6LcaPBBaME6shMS1+4KKr0ujNaf8Z+QfnsHeFJdi+pult0jwqZOsEWN4X0Yu6
 GeNrq+H/mJhpkQona57wYyLgFYBYvkO9qS9nLsWKQYUPeAUocmr+a2z/bzf2aVueCJCI
 b4kg==
X-Gm-Message-State: AGi0Pub+2c4kqt2xDH7NqDElxLIwovSeq7/rTzD83jO0vicL469RqqRF
 b+fuieVVYa1ehUI2PiJKIg==
X-Google-Smtp-Source: APiQypLtYA6H2vEC2MYLE3ZA2qIw2dOIhyc/2W7XmVLMNJYf2n3Ryze9W89syNbMU3qrPnXjbic96Q==
X-Received: by 2002:a92:2544:: with SMTP id l65mr2487739ill.286.1586473306685; 
 Thu, 09 Apr 2020 16:01:46 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id c4sm141266ilk.75.2020.04.09.16.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 16:01:46 -0700 (PDT)
Received: (nullmailer pid 13647 invoked by uid 1000);
 Thu, 09 Apr 2020 23:01:43 -0000
Date: Thu, 9 Apr 2020 17:01:43 -0600
From: Rob Herring <robh@kernel.org>
To: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: Add IPK DSI subsystem
 bindings
Message-ID: <20200409230143.GA12884@bogus>
References: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
 <e32fdd83d135da8617ba46d53eb95329589ae07d.1586174459.git.angelo.ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e32fdd83d135da8617ba46d53eb95329589ae07d.1586174459.git.angelo.ribeiro@synopsys.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Joao.Pinto@synopsys.com, airlied@linux.ie, Gustavo.Pimentel@synopsys.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  6 Apr 2020 15:24:11 +0200, Angelo Ribeiro wrote:
> Add dt-bindings for Synopsys DesignWare MIPI DSI Host and VPG (Video
> Pattern Generator) support in the IPK display subsystem.
> 
> The Synopsys DesignWare IPK display video pipeline is composed by a DSI
> controller (snps,dw-ipk-dsi) and a VPG (snps,dw-ipk-vpg) as DPI
> stimulus. Typically is used the Raspberry Pi
> (raspberrypi,7inch-touchscreen-panel) as DSI panel that requires a
> I2C controller (snps,designware-i2c).
> 
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> ---
>  .../bindings/display/snps,dw-ipk-dsi.yaml          | 162 +++++++++++++++++++++
>  .../bindings/display/snps,dw-ipk-vpg.yaml          |  75 ++++++++++
>  2 files changed, 237 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dts:60.17-30: Warning (reg_format): /example-0/i2c@0x01000/lcd@45:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dts:49.21-68.11: Warning (i2c_bus_bridge): /example-0/i2c@0x01000: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dts:49.21-68.11: Warning (i2c_bus_bridge): /example-0/i2c@0x01000: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dts:58.20-67.15: Warning (avoid_default_addr_size): /example-0/i2c@0x01000/lcd@45: Relying on default #address-cells value
Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dts:58.20-67.15: Warning (avoid_default_addr_size): /example-0/i2c@0x01000/lcd@45: Relying on default #size-cells value
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.example.dt.yaml: example-0: 'dw-dsi-vpg@0x03000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.example.dt.yaml: dw-dsi-vpg@0x03000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: example-0: 'dw-ipk-dsi@0x02000', 'i2c@0x01000' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: dw-ipk-dsi@0x02000: clock-names: ['pclk', 'ref'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.example.dt.yaml: dw-ipk-dsi@0x02000: 'reset' is a required property

See https://patchwork.ozlabs.org/patch/1266879

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
