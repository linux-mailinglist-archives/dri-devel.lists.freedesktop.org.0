Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729BF126F16
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 21:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336486EB88;
	Thu, 19 Dec 2019 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DE66EB88
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 20:45:28 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id p8so8773801oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 12:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QEdi/9BuWv68+yRkoA3WGe3MPqpNQsr5gKwCLiu+7aE=;
 b=mXDxlVlhPIQsv3VwVftJTz6vwc/TKSxBXyeWVznvHVPA/6ugPAgMvFRm9w4qDgw2yf
 66qd0ajxLvRezNxPdHOn/l8Ouw4m8uncAJ9LQe4OftULJJOpNeBO1RtK8NMQDI0IFTrp
 CXftKpHjZyjzCXxPyrUX/X4+waEwN8a7P7R1GHH4BTM0Nxw+fAvt+TCeb76W71zylXt0
 ETON2/+S/O/9o2hAtEvwS8QQoJ8w3hWFWFdA15gPUDAs8xWNksJxob3IamxzNuvEvfnU
 XmMW5SIAxxJ+1udlcXe2TO6aQvg/XrVvp0WRpxXJjrV+qkFD+5P2nEhNJQH5At5MJBlj
 j8Cg==
X-Gm-Message-State: APjAAAUzhbng3yEp9VCDKjnO6B3wKUFr9q3Ihc9lqgi49V9iIAdx5cEl
 hpbfZir8ID3Ic1qv6SXd8A==
X-Google-Smtp-Source: APXvYqxb/DX+sti/X1j7P3N+qjVkbNkerswgHzEY3dYk7v6gSucevN2LN9Hfh/8ZnQcAC3TCXUj3rg==
X-Received: by 2002:a9d:6acd:: with SMTP id m13mr8096032otq.313.1576788328038; 
 Thu, 19 Dec 2019 12:45:28 -0800 (PST)
Received: from localhost (ip-184-205-110-29.ftwttx.spcsdns.net.
 [184.205.110.29])
 by smtp.gmail.com with ESMTPSA id t203sm2392233oig.39.2019.12.19.12.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 12:45:27 -0800 (PST)
Date: Thu, 19 Dec 2019 14:45:24 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688:
 Add ANX7688 transmitter binding
Message-ID: <20191219204524.GA7841@bogus>
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211061911.238393-2-hsinyi@chromium.org>
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <mbrugger@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 02:19:08PM +0800, Hsin-Yi Wang wrote:
> From: Nicolas Boichat <drinkcat@chromium.org>
> 
> Add support for analogix,anx7688
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change from RFC to v1:
> - txt to yaml
> ---
>  .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> new file mode 100644
> index 000000000000..cf79f7cf8fdf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
> +
> +maintainers:
> +  - Nicolas Boichat <drinkcat@chromium.org>
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
> +          Video port for eDP output
> +
> +    required:
> +      - port@0

Sometimes you have no output?

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports

The example will have errors because it is missing 'ports'. Run 'make 
dt_binding_check'.

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    anx7688: anx7688@2c {
> +      compatible = "analogix,anx7688";
> +      reg = <0x2c>;
> +
> +      port {
> +        anx7688_in: endpoint {
> +          remote-endpoint = <&hdmi0_out>;
> +        };
> +      };
> +    };
> -- 
> 2.24.0.525.g8f36a354ae-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
