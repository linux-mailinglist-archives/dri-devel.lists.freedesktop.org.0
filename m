Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CFE1648A2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 16:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE736EC26;
	Wed, 19 Feb 2020 15:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AFD6EC26
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 15:30:22 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id z2so24166199oih.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 07:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JzcGItIJYGsl2cZdeJy9RWrhUYytz4QlrMkMbEGYVto=;
 b=ZW9U7WP2KeyJHNb9YCiFiRqwS0mXkVQrNBipPQmCVWe1trPhDpnJhVulqV0o42bkt4
 4xNEHoYQ6uYbTJarX0eQCf4eKGAecabgDHG+ZcMXSerj/UwsLZnDL4ZK7y8fzMfClcP5
 SjFLXQc3MtFUG2mSsyux6CdE43sMGUThjXgfI7O70LrO47rzEO+IMwr7J9e/L485fyhA
 TsaE8Hym1iRG7um62BZ+LQ15WdEH6eYcR4YI6cxzwDHJ8YV/4ymUXieJfEzzXkcg4o0G
 ltA7BYPXBjp1hkty8wryH404H00FwspGIyLHdDztghgCxQu1OqPGyENm+sR6Auf+GT91
 GmQA==
X-Gm-Message-State: APjAAAVyfI+mDqSKAZN/3RzJROzkRNDpebPReWBFIxXwsdaf1zi3yGlt
 itx4hwxlYTL7qOAYUBB95A==
X-Google-Smtp-Source: APXvYqzgdNvRS6k2NroirQrsz+VuIisaXtV513aooiJzs49WDEhynFy2ewrvEpl6PVO4/ZyO6EK6kw==
X-Received: by 2002:a05:6808:45:: with SMTP id v5mr4765338oic.90.1582126221379; 
 Wed, 19 Feb 2020 07:30:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l207sm74554oih.25.2020.02.19.07.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 07:30:20 -0800 (PST)
Received: (nullmailer pid 24733 invoked by uid 1000);
 Wed, 19 Feb 2020 15:30:19 -0000
Date: Wed, 19 Feb 2020 09:30:19 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 1/2] Documentation: bindings: Add ANX7688 HDMI to DP
 bridge binding
Message-ID: <20200219153019.GA19271@bogus>
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213145416.890080-1-enric.balletbo@collabora.com>
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
 drinkcat@chromium.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 03:54:15PM +0100, Enric Balletbo i Serra wrote:
> From: Nicolas Boichat <drinkcat@chromium.org>

'dt-bindings: ....' for the subject please.

> 
> Add documentation for DT properties supported by anx7688 HDMI-DP
> converter.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2:
> - Improve a bit the descriptions using the info from the datasheet.
> - Convert binding to yaml.
> - Use dual licensing.
> 
>  .../bindings/display/bridge/anx7688.yaml      | 79 +++++++++++++++++++

Use the full compatible string: analogix,anx7688.yaml

>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> new file mode 100644
> index 000000000000..c1b4b5191d44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#

Don't forget to update this too.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX7688 HDMI to USB Type-C Bridge (Port Controller with MUX)
> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
> +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> +
> +description: |
> +  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
> +  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
> +  resolution from a smartphone or tablet with full function USB-C.
> +
> +  This binding only describes the HDMI to DP display bridge.
> +
> +properties:
> +  compatible:
> +    const: analogix,anx7688
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device

That's every reg, you can drop 'description'.

> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for HDMI input
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Video port for DP output
> +
> +    required:
> +      - port@0

IMO, port@1 should be required too. If not a fixed panel, then it should 
have a connector node.

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        anx7688: dp-bridge@2c {
> +            compatible = "analogix,anx7688";
> +            reg = <0x2c>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    anx7866_in: endpoint {
> +                        remote-endpoint = <&hdmi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    anx7866_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                   };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.25.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
