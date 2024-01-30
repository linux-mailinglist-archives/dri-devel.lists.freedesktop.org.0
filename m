Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FD8427C1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 16:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4316A1131C2;
	Tue, 30 Jan 2024 15:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5081131C2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 15:14:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C50E460DCB;
 Tue, 30 Jan 2024 15:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454D2C43390;
 Tue, 30 Jan 2024 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706627670;
 bh=gAg8cpP+XJBiM4/rqOBN5Esq/wRJ9lIQmGQX2ctCfRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQa56v56VzaqeY0atCPHBrESYKWr6KaJO9cgg4jX+INNfhWltGeJgTb6pfBKMR+9L
 1MQFzeinTyMzvOw6v0hynWEEXlwLh5AfZgxdm41piwc6nrS5pI8Crks9spKnw4j48y
 cwNI2BVFkjxHyoR/7GuikRJLfrE07Wj0fnNg86n3Z2U2JfddcUJjLqK6E68nAfK6Si
 AS72I8/FPYSNtnVQ/x3cVBJQ3kjN4MYAZT8SMCsn8eNRJkDtIkDmc1aJoexnt35VMp
 a0dO16WknmiyTRXbjTtPW4jZlgEG42y3tr+Q8lgNs+oRaDcIIKZ3MTnZsp0gBb1rZI
 Qce9UWtyh1Rng==
Date: Tue, 30 Jan 2024 09:14:28 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [drm-drm-misc:drm-misc-next] dt-bindings: nt35510: document
 'port' property
Message-ID: <20240130151428.GA1629184-robh@kernel.org>
References: <20240127152821.65744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240127152821.65744-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 27, 2024 at 04:28:08PM +0100, Dario Binacchi wrote:
> Allow 'port' property (coming from panel-common.yaml) to be used in DTS:
> 
>   st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> ---
> 
>  .../display/panel/novatek,nt35510.yaml        | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> index a4afaff483b7..72913719df23 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
> @@ -31,6 +31,22 @@ properties:
>    vddi-supply:
>      description: regulator that supplies the vddi voltage
>    backlight: true
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port

Just 'port: true'

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - frida,frd400b25025
> +then:
> +  required:
> +    - port
> +
> +else:
> +  properties:
> +    port: false

No need for this. 'port' should be allowed for everyone.

>  
>  required:
>    - compatible
> @@ -54,5 +70,23 @@ examples:
>              backlight = <&gpio_bl>;
>          };
>      };
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "frida,frd400b25025", "novatek,nt35510";
> +            vddi-supply = <&vcc_3v3>;
> +            vdd-supply = <&vcc_3v3>;
> +            reg = <0>; /* dsi virtual channel (0..3) */
> +            reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
>  
> +            port {
> +                dsi_panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.43.0
> 
