Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458319472D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 20:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B0F6E91A;
	Thu, 26 Mar 2020 19:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EBF6E919
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 19:10:15 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id v3so7201818iot.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 12:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mqe+qvLDL0F5QFPzzY/Qw513N/CcmkZu3+KJVjBKe00=;
 b=VTXko/s22Qef6AEbecSg9f891kZaD/FOUmahUdqMFZADPWCKxDenhKTJ60YaXT2vj5
 YxqocvQrGXAnJEYzWVQqL5N0f32A9kePJ4kv/0btUIDFlt4t1GoBxSr/ptbuOTlY454T
 1m+lqRhmicsccuFsDk6YfphJotV4BYwrNrAKS9vbSIWIEhdlsJN6sUuRo6uMQ/YY6wnm
 CKMyex79+AgWH3YgBblxVcOLu39o4jVvZnpe0XhZEWOaBJ1Y02gEWJabBlLcDZh+u2u+
 v1jXFtp3iGszRQeTc/aSENGwSEmp0biuz6524lnAgtD+Ycv2oHH2ZA5kaZhyUJ5PZuGg
 iUSQ==
X-Gm-Message-State: ANhLgQ2X+MdCTT50FUUZNTtAayJOLydmT+mE+6xPYXgPhrvUVL63ckjR
 ENdaNKawslJOcB6qy5r10Q==
X-Google-Smtp-Source: ADFU+vvEhHo6vdvVrVDVz6G66I3+pxBn28EjTel9PRtmA3bkLU64mCh8uH8O0U//+UVR8Wkx0lqxpA==
X-Received: by 2002:a02:94cb:: with SMTP id x69mr8851315jah.19.1585249813647; 
 Thu, 26 Mar 2020 12:10:13 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id c88sm1084825ill.15.2020.03.26.12.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:10:13 -0700 (PDT)
Received: (nullmailer pid 26827 invoked by uid 1000);
 Thu, 26 Mar 2020 19:10:12 -0000
Date: Thu, 26 Mar 2020 13:10:12 -0600
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH v8 2/3] dt-bindings: Add binding for IT6505.
Message-ID: <20200326191012.GB15606@bogus>
References: <1584941015-20541-1-git-send-email-allen.chen@ite.com.tw>
 <1584941015-20541-3-git-send-email-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584941015-20541-3-git-send-email-allen.chen@ite.com.tw>
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

On Mon, Mar 23, 2020 at 01:21:53PM +0800, allen wrote:
> Add a DT binding documentation for IT6505.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
> cros-ec does not have an associated driver that uses the standard Linux USB-C driver class.
> extcon is used to model the Type-C connector.(crbug.com/982932)

That's nice, but doesn't matter for upstream. And sounds like a driver 
problem, not a binding issue.

> ---
>  .../bindings/display/bridge/ite,it6505.yaml        | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> new file mode 100644
> index 00000000..13feeef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

Think I said this already, but don't use extcon and define an output 
port to a DP or USB connector.

> +    maxItems: 1
> +    description: extcon specifier for the Power Delivery
> +
> +  port:
> +    type: object
> +    description: A port node pointing to DPI host port node
> +
> +required:
> +  - compatible
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
