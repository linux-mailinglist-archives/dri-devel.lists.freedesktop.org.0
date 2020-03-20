Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6218C46C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 01:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E046E0E2;
	Fri, 20 Mar 2020 00:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659CB6E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 00:55:26 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id h3so4129355ils.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hTX9N2of5jhjNnF3uYbcSwV8OolqfVP3rpImPzcroQ8=;
 b=Ua8YHp8od8Mml9+6a61/GvcnFYUNm4aaYCEEwC7UtpX3VqMiG2xQcJ2d7INlDioU3j
 nw9GLDgpvLjiulcTWXx4e008R7V6YnUgvIsII7/CUpd3YQWIMoeU0irgL8/9wTFuBRz0
 6BdhAL2rnvvHmdnYIel7ESriY6qwLTftMkbnfFkz53wITVofxnlMC/ZKaRdxJDv+o9GI
 /c2XP8M/C0A9qTGpYtgiOlLo+N4yfJvAeNs6acA4tGcTNNR3XxtH4iMY3/Qnk3bNSPJx
 um8TN6vfg4IjlkRFxd0GBKMWdVyWvDjbagPYSkKF7uMaHDd2yz//G3bicULD4NvhTKlf
 QrxQ==
X-Gm-Message-State: ANhLgQ3JnaL+a9pkun4++yd0dY3cZV9gKX5/+dgEXzDGLndQx7QJLhQu
 nMtm70YQc6YTz4rep1dnyA==
X-Google-Smtp-Source: ADFU+vvqztuZ1j2SOs3GaEwUpbB7sr5FIKsud65mVDnuJzJr2tFN1mpQMD0yWc3GzSp4Oy4AZSyONw==
X-Received: by 2002:a92:d0c1:: with SMTP id y1mr5794271ila.125.1584665725641; 
 Thu, 19 Mar 2020 17:55:25 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id w5sm1456074ilm.69.2020.03.19.17.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 17:55:24 -0700 (PDT)
Received: (nullmailer pid 8024 invoked by uid 1000);
 Fri, 20 Mar 2020 00:55:22 -0000
Date: Thu, 19 Mar 2020 18:55:22 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v7 2/3] dt-bindings: Add binding for IT6505.
Message-ID: <20200320005522.GA31982@bogus>
References: <1583735298-19266-1-git-send-email-allen.chen@ite.com.tw>
 <1583735298-19266-3-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583735298-19266-3-git-send-email-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 02:26:48PM +0800, allen wrote:
> Add a DT binding documentation for IT6505.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml        | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> new file mode 100644
> index 00000000..e9f6b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE it6505 Device Tree Bindings
> +
> +maintainers:
> +  - Allen Chen <allen.chen@ite.com.tw>
> +
> +description: |
> +  The IT6505 is a high-performance DisplayPort 1.1a transmitter,
> +  fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications.
> +  The IT6505 supports color depth of up to 36 bits (12 bits/color)
> +  and ensures robust transmission of high-quality uncompressed video
> +  content, along with uncompressed and compressed digital audio content.
> +
> +  Aside from the various video output formats supported, the IT6505
> +  also encodes and transmits up to 8 channels of I2S digital audio,
> +  with sampling rate up to 192kHz and sample size up to 24 bits.
> +  In addition, an S/PDIF input port takes in compressed audio of up to
> +  192kHz frame rate.
> +
> +  Each IT6505 chip comes preprogrammed with an unique HDCP key,
> +  in compliance with the HDCP 1.3 standard so as to provide secure
> +  transmission of high-definition content. Users of the IT6505 need not
> +  purchase any HDCP keys or ROMs.
> +
> +properties:
> +  compatible:
> +    const: ite,it6505
> +
> +  reg:
> +    maxItems: 1
> +    description: i2c address of the bridge

Can drop the description as there's nothing specific to this device.

> +
> +  ovdd-supply:
> +    maxItems: 1
> +    description: I/O voltage
> +
> +  pwr18-supply:
> +    maxItems: 1
> +    description: core voltage
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt specifier of INT pin
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: gpio specifier of RESET pin
> +
> +  extcon:
> +    maxItems: 1
> +    description: extcon specifier for the Power Delivery

Drop this. You should be using the usb-connector binding instead which 
means you should have a OF graph port to the connector. For TypeC, 
there's a defined port for DP.

> +
> +  port:
> +    type: object
> +    description: A port node pointing to DPI host port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - ovdd-supply
> +  - pwr18-supply
> +  - interrupts
> +  - reset-gpios
> +  - extcon
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c3 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dp-bridge@5c {
> +            compatible = "ite,it6505";
> +            interrupts = <152 IRQ_TYPE_EDGE_FALLING 152 0>;
> +            reg = <0x5c>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&it6505_pins>;
> +            ovdd-supply = <&mt6358_vsim1_reg>;
> +            pwr18-supply = <&it6505_pp18_reg>;
> +            reset-gpios = <&pio 179 1>;
> +            extcon = <&usbc_extcon>;
> +
> +            port {
> +                it6505_in: endpoint {
> +                    remote-endpoint = <&dpi_out>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 1.9.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
