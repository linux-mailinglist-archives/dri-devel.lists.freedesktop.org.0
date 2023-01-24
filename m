Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9267A57E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 23:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A8D10E70B;
	Tue, 24 Jan 2023 22:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3810E708
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:15:28 +0000 (UTC)
Received: from [192.168.2.197] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CB086602E22;
 Tue, 24 Jan 2023 22:15:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674598527;
 bh=U5pqxjSVWv1r+xzfhDscJlEQYLqcxSfkvxxI5A+J+wc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hQ9YDjUqA9i+uEX6M+UnrsXmKUlOrQLOWtHywTGb4RrDNIX+2wbZDf/cI3jxKkrVs
 Mo8KSjrlrcX0jJGlHRO7u9jLOuziokRNkSv1JRniKACDb1MqA1xK16xIHe6YIrzgI+
 pWv3acwe+COWFCC/mKFz8Sc/cObnBsokEctFFnNTp3F9c0AF1kaz99FChTV2bdiCNB
 VWkfkq0rDO2FRDlZHpf9uhKAK9Rsmr0UZK83FgMkTCHXTQbp/DLMvbmtKFn3U8F5vL
 BE+WUxmoJaKjGpPcCrMX26rkviFdm/KaUKRAfpVNtAZSlfGIUUnSBDT/IIOWDT4rA8
 9yFBmCBE/8VHA==
Message-ID: <e426497b-0421-1bc1-2a72-871b0e2d48a4@collabora.com>
Date: Wed, 25 Jan 2023 01:15:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-2-luca.ceresoli@bootlin.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221229133205.981397-2-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/29/22 16:31, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changed in v3:
>  - remove channel@0 node (Krzysztof, Rob, Dmitry)
>  - add myself as a maintainer of the whole Tegra video driver (Dmitry)
> 
> Changed in v2 (suggested by Krzysztof Kozlowski):
>  - remove redundant "bindings" from subject line
>  - remove $nodename
>  - add channel@0 description
>  - add reg: const: 0
> ---
>  .../display/tegra/nvidia,tegra20-vip.yaml     | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> new file mode 100644
> index 000000000000..c23fd02dd18e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
> @@ -0,0 +1,49 @@
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
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port receiving the video stream from the sensor
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Port sending the video stream to the VI
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ports
> +
> +# see nvidia,tegra20-vi.yaml for an example
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61eb221415b..4feb2e1258ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20563,10 +20563,12 @@ TEGRA VIDEO DRIVER
>  M:	Thierry Reding <thierry.reding@gmail.com>
>  M:	Jonathan Hunter <jonathanh@nvidia.com>
>  M:	Sowjanya Komatineni <skomatineni@nvidia.com>
> +M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-tegra@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
>  F:	drivers/staging/media/tegra-video/
>  
>  TEGRA XUSB PADCTL DRIVER

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Please feel free to add my r-b to the rest of the patches. I looked
though them and haven't noticed anything suspicious.

-- 
Best regards,
Dmitry

