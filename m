Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8C1F34F9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141716E27F;
	Tue,  9 Jun 2020 07:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A7A6E1F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 10:38:19 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id o5so17980207iow.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFGDEiFCI8TsMWMIzZyvQUxGXy/3QcSkytw+qRIuNg0=;
 b=mgEYIJu9CycDnuVvMb2HkAkKQHsierheTRAAn+r8uyQYd5AYnrd+4kzO1xnrMylkfS
 aIgGqaj1S6y5ywsoiD9XFNvYYumLCj16bBPehuP1S9htxMOdqkVvQpCtr0Gb3xHCi9vo
 cVcsu8ukum6yw7tVfNZviKPEOuAREGTaoyUf0R9SpdRdZlfg9KqgA0w8vv7vz4/Q6LEz
 RG06wTVCmMSWFGG2WRcyGzaKcScXDEW4nONoZqtfqUo7zyBjBdWcodm3CUCwS0cqQEWh
 yIUip9TFhEQFQN7/pxWjwXYQeR1Si6h90ElwnojQba4pCtedrDrXr5LPdjvIJz5YCKkw
 8SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFGDEiFCI8TsMWMIzZyvQUxGXy/3QcSkytw+qRIuNg0=;
 b=Xx3+2eHMK5NYwQQRl5z8cPx7fVk/BXdy6meihXR8VmnQdLh/CVw84+Fox19Y2Yu0Pi
 uFDbMpU+gvJuXC3SuUT7ubS9sfBgM3L+ZMKeiYP0lotw0OICNzoP5Ad/HSoZ1mqCTVkF
 5RpW5MTP+F+uiRZXo7z7UCzqwmmRDBJk/zDLH7Nndoc8dwwA5ZV0Fg0dIi8Ba0jgQmQo
 71t2MPMJH6gu8voYcKOFF4GaLQn876VqUhdhMdhuwbb2wrOfFnGHH6dSyEYjW6Oj2tbN
 NQWqyG/ijBsytnyMXnOJ9chak3uRb3Z1vhaoxFQ17QBn0k79ZpSwuWwKXMcLXaGI0hNV
 WAHg==
X-Gm-Message-State: AOAM530+6li/unurKQYlQwEQRk+sHWFBCf928tVc4o+a4kAhBPdcY+Na
 MzpOyIaZwsmu3YfMrhZVSPaFcyky2NW/euN94aw=
X-Google-Smtp-Source: ABdhPJxQvsGmDayuQnB3yzpdYEuEcsrE4hiOH+fuLClO9hFRqWUQ9X2/WU/ZE9TmBVXvUl4AO6vXuZ7wXv64lY/hiIg=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr10428987iow.147.1591612698290; 
 Mon, 08 Jun 2020 03:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <1583920112-2680-1-git-send-email-simhavcs@gmail.com>
 <20200312151752.GA7490@bogus>
 <CAGWqDJ7DP3DuR7EWT6Ni8YxN3Adg3RgJZut6+AtpAak_HB=QCQ@mail.gmail.com>
 <CAGWqDJ4cAU98_xMk6f-bsT5LF5cD2JJk8_JCykwM=cd6CCfWtw@mail.gmail.com>
 <20200317142702.GA16338@ravnborg.org>
In-Reply-To: <20200317142702.GA16338@ravnborg.org>
From: Vinay Simha B N <simhavcs@gmail.com>
Date: Mon, 8 Jun 2020 16:08:06 +0530
Message-ID: <CAGWqDJ6MP0gEpL3FTXPH4jGaqM4PBOhZCQ=h99FJCPxVcVdWBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add DSI/LVDS tc358775 bridge bindings
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sam,

This is my latest yaml file
https://github.com/vinaysimhabn/kernel-msm/blob/5.6.0-rc3-d2l-wip/Documentation/devicetree/bindings/display/bridge/toshiba%2Ctc358775.yaml

 make CROSS_COMPILE=$TC64 ARCH=arm64
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
dt_binding_check
i am getting these errors
Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.example.dt.yaml:
lvds-out: 'data-mapping', 'height-mm', 'panel-timing', 'width-mm' do
not match any of the regexes: 'pinctrl-[0-9]+'
Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.example.dt.yaml:
lvds-out: compatible: Additional items are not allowed ('panel-lvds'
was unexpected)
Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.example.dt.yaml:
lvds-out: compatible: ['auo,b101xtn01', 'panel-lvds'] is too long

Please suggest how to add the references of panel/lvds.yaml or
panel/panel-common.yaml and panel/advantech,idk-2121wr.yaml in my yaml
file.

On Tue, Mar 17, 2020 at 7:57 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Vinay.
>
> On Tue, Mar 17, 2020 at 12:25:42PM +0530, Vinay Simha B N wrote:
> > sam,
> >
> > i need some inputs on the below  error. I had created this file
> > Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> > by using vim editor. Do we have any tool to create yaml file?
>
> I use vim myself, but is careful to follow the right syntax.
>
> >
> > i do not get the error when running 'make dt_binding_check' in my
> > build environment
> > Documentation/devicetree/bindings/display/bridge/toshiba-tc358775.yaml
> >
> > is there any tool available similar to  scripts/checkpatch.pl -f
> > <file> , for yaml files?
>
> Please read Documentation/devicetree/writing-schema.
> Here you can find general info + instruction how to install the tools
> required for "make dt_binding_check".
>
> I could reproduce the error reported by Rob.
> I gave your binding file a shot - there were a lot of smaller issues:
>
> - do not use tabs in yaml files
> - be consistent in indent
> - vendor prefixed properties needed some extra care
> - example was full of bugs
>   - "..."
>   - no need for status = "okay";
>   - properties spelled wrong
>
> For the example I adjusted it to use indent of 4 spaces, which IMO
> is more readable than the two spaces used in the other parts of the
> file.
>
> I have attached the updated binding file - please review and fix.
> This is just a quick shot, I did not do a proper review.
>
> Please rename the file, other files in same dir are named "toshiba,xxx",
> so replace '-' with ','.
>
> And try to introduce bugs in the example - and check that the tooling
> catches the bug.
>
> hint:
>
>     make DT=.../foo.yaml dt_binding_check
>
> is a qucik way to check only your binding.
>
> And for new bindings the preferred license is: (GPL-2.0-only OR BSD-2-Clause)
>
>         Sam
>
> # SPDX-License-Identifier: GPL-2.0
> %YAML 1.2
> ---
> $id: http://devicetree.org/schemas/display/bridge/toshiba-tc358775.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>
> title: Toshiba TC358775 DSI to LVDS bridge bindings
>
> maintainers:
>   - Vinay Simha BN <simhavcs@gmail.com>
>
> description: |
>   This binding supports DSI to LVDS bridge TC358775
>
> properties:
>   compatible:
>     const: toshiba,tc358775
>
>   reg:
>     maxItems: 1
>     description: i2c address of the bridge, 0x0f
>
>   toshiba,dsi-lanes:
>     allOf:
>       - $ref: /schemas/types.yaml#/definitions/uint32
>       - minimum: 1
>         maximum: 4
>         default: 1
>     description: bla bla
>
>   toshiba,dual-link:
>     $ref: /schemas/types.yaml#definitions/flag
>     description: bla bla
>
>   vdd-supply:
>     maxItems: 1
>     description: 1.2V LVDS Power Supply
>
>   vddio-supply:
>     maxItems: 1
>     description: 1.8V IO Power Supply
>
>   stby-gpios:
>     maxItems: 1
>     description: Standby pin, Low active
>
>   reset-gpios:
>     maxItems: 1
>     description: Hardware reset, Low active
>
>   ports:
>     type: object
>
>     properties:
>       port@0:
>         type: object
>         description: |
>           DSI Input. The remote endpoint phandle should be a
>           reference to a valid mipi_dsi_host device node.
>       port@1:
>         type: object
>         description: |
>           Video port for LVDS output (panel or connector).
>
>     required:
>       - port@0
>       - port@1
>
> required:
>  - compatible
>  - reg
>  - tc,dsi-lanes
>  - vdd-supply
>  - vddio-supply
>  - stby-gpios
>  - reset-gpios
>  - ports
>
> examples:
>   - |+
>     #include <dt-bindings/gpio/gpio.h>
>
>     i2c@78b8000 {
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         /* On High speed expansion */
>         label = "HS-I2C2";
>         status = "okay";
>
>         tc_bridge: bridge@f {
>             compatible = "toshiba,tc358775";
>             reg = <0x0f>;
>
>             tc,dsi-lanes = <4>;
>             tc,dual-link = <0>;
>
>             vdd-supply = <&pm8916_l2>;
>             vddio-supply = <&pm8916_l6>;
>
>             stby-gpios = <&msmgpio 99 GPIO_ACTIVE_LOW>;
>             reset-gpios = <&msmgpio 72 GPIO_ACTIVE_LOW>;
>
>             ports {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 port@0 {
>                     reg = <0>;
>                     d2l_in: endpoint {
>                         remote-endpoint = <&dsi0_out>;
>                     };
>                 };
>
>                 port@1 {
>                     reg = <1>;
>                     d2l_out: endpoint {
>                         remote-endpoint = <&panel_in>;
>                     };
>                 };
>             };
>         };
>     };
>
>     panel: auo,b101xtn01 {
>         status = "okay";
>         compatible = "auo,b101xtn01", "panel-lvds";
>         power-supply = <&pm8916_l14>;
>
>         width-mm = <223>;
>         height-mm = <125>;
>
>         data-mapping = "jeida-24";
>
>         panel-timing {
>             /* 1366x768 @60Hz */
>             clock-frequency = <72000000>;
>             hactive = <1366>;
>             vactive = <768>;
>             hsync-len = <70>;
>             hfront-porch = <20>;
>             hback-porch = <0>;
>             vsync-len = <42>;
>             vfront-porch = <14>;
>             vback-porch = <0>;
>         };
>
>         port {
>             panel_in: endpoint {
>                 remote-endpoint = <&d2l_out>;
>             };
>         };
>     };
>
>     mdss {
>         dsi@1a98000 {
>             ports {
>                 port@1 {
>                     dsi0_out: endpoint {
>                         remote-endpoint = <&d2l_in>;
>                         data-lanes = <0 1 2 3>;
>                     };
>                 };
>             };
>         };
>     };
>
> ...



-- 
regards,
vinaysimha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
