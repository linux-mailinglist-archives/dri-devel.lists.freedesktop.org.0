Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895963FBD9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595610E68A;
	Thu,  1 Dec 2022 23:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0710E68A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:19:38 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id t62so3663515oib.12
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GnbnfIwAM1UBElWd+eLU8pdL/dphftoMctGcclLKzw=;
 b=dkIOJKCrwKwHm58UnUxrF8RzxbBC3hFqISzB04JQDOgDSeyT3OaO99rdfVI6X57qQ1
 31R9mQ0j6cf44BVa7iV6rZl+0CI0o7EqPcNcn20q8YdXSTdy/hAFgPyX98YIthT7c44b
 zqIrhaj4OrtLRFxMFx84dBbktP1NIuvzgNXgacYJmG8fU8IB2Vem6Fu5SDKBZjpabmJK
 lEmEvEDXXaG5kNEsUb7YUpFzFX1vXOiU1hP5rM0u4zbhP08kVZTChOa/6tZu0RZpp5tV
 Y+8GUdl2mnI1Og8CiAKsu1MU58D3KTz3B5BiEsAB4ofo6VKEF7p8BApVablShpv2Swd7
 FtvQ==
X-Gm-Message-State: ANoB5pmao6UkhSo4vlq/F7e7LZhSj6NZhUruseijparcKqkcG5uc8pxI
 huGgM823dVU5viri4ZI/yyTnUaJ3sQ==
X-Google-Smtp-Source: AA0mqf6LUacexCNxfUGxQ17BkFB08L9QiNMNHe0Eg9i7cd8dUW4mlTa6hPo0iYXWKDpyFut5cKRJHA==
X-Received: by 2002:a05:6808:2188:b0:35b:d987:bcf5 with SMTP id
 be8-20020a056808218800b0035bd987bcf5mr4203652oib.101.1669936777539; 
 Thu, 01 Dec 2022 15:19:37 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 124-20020a4a0d82000000b0049fcedf1899sm2296342oob.3.2022.12.01.15.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:19:36 -0800 (PST)
Received: (nullmailer pid 1667342 invoked by uid 1000);
 Thu, 01 Dec 2022 23:19:36 -0000
Date: Thu, 1 Dec 2022 17:19:36 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Message-ID: <20221201231936.GB1660613-robh@kernel.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-2-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128152336.133953-2-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 04:23:16PM +0100, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
> - remove redundant "bindings" from subject line
> - remove $nodename
> - add channel@0 description
> - add reg: const: 0
> ---
>  .../display/tegra/nvidia,tegra20-vip.yaml     | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> new file mode 100644
> index 000000000000..44be2e16c9b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra VIP (parallel video capture) controller
> +
> +maintainers:
> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-vip
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  channel@0:

Kind of odd there is only 1 channel with a unit-address. Are more 
channels coming? Please make the binding as complete as possible even if 
no driver support yet.


> +    description: parallel video capture interface for the VI
> +    type: object
> +
> +    properties:
> +      reg:
> +        const: 0
> +
> +      ports:
> +        $ref: /schemas/graph.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port receiving the video stream from the sensor
> +
> +          port@1:
> +            $ref: /schemas/graph.yaml#/properties/port
> +            description:
> +              Port sending the video stream to the VI
> +
> +        required:
> +          - port@0
> +          - port@1
> +
> +    additionalProperties: false

A bit easier to read the indented cases if this is above 'properties'.

> +
> +    required:
> +      - reg
> +      - ports
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - channel@0
> +
> +# see nvidia,tegra20-vi.yaml for an example
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69565ac0c224..92c762f85f17 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20315,6 +20315,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>  F:	drivers/staging/media/tegra-video/
>  
> +TEGRA VIDEO DRIVER FOR TEGRA20 VIP (PARALLEL VIDEO CAPTURE)
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-tegra@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> +
>  TEGRA XUSB PADCTL DRIVER
>  M:	JC Kuo <jckuo@nvidia.com>
>  S:	Supported
> -- 
> 2.34.1
> 
> 
