Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720091CE776
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 23:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58212880C6;
	Mon, 11 May 2020 21:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835226E5A2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 21:31:11 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 72so8856686otu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 14:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kPA8XGO7yNv52UhCsPudyrmEJijL7uMi7QSa8Mydd9k=;
 b=J2Nq3qzg2pD8RlKM7W/yhJJ/QJUyxPNm8Htb3Z44+OF7vWYSM/VG0cPHhYWCkSFtZ6
 uY4Po5wvm2uxG9N9kfvatedesEOjgzSVy0TEruvG5TRrRfQzQ8VUvA2e7C89QFHh04Lc
 kinOOrxIIMbhvQYRL+oy1nYpepKK4dKkfKElVydx3tSo28ranYTrBGdstCjIRzOClMJW
 BiPZgPzRA95STOQ7I/HVhddMRKXqYr7qQidfOGxzLyYTzQgwEQyShs3zwNnSXYsQj/sj
 kRSYcuT/DW6iAx1lcGgbBhAZIvauYMPojJPm7mhqVyYZHHXlQHNfbx0aizov6Hd0I0CU
 J9bg==
X-Gm-Message-State: AGi0PuZunLXxkAxNxxTbzo7HIWR/YaAn73pcdu+CJGiL4g5TP6oq8M9M
 FHx1rmjVTnRDSaawbFHXjg==
X-Google-Smtp-Source: APiQypL4+opiwGiUpyi/On/i50F4N6Thq7Tn9+S3jk6cgVHzZLF/gMehnGeEgdQ48kw05CUcBwcQbw==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr14793398otr.318.1589232670619; 
 Mon, 11 May 2020 14:31:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v8sm3177795oos.0.2020.05.11.14.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:31:09 -0700 (PDT)
Received: (nullmailer pid 13715 invoked by uid 1000);
 Mon, 11 May 2020 21:31:08 -0000
Date: Mon, 11 May 2020 16:31:08 -0500
From: Rob Herring <robh@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
Message-ID: <20200511213108.GA3374@bogus>
References: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, ykk@rock-chips.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 01:26:34PM +0200, Ricardo Ca=F1uelo wrote:
> This converts the DT binding for the Analogix DP bridge used in
> the Exynos 5 and Rockchip RK3288/RK3399 SoCs to yaml.
> =

> Changes from the original binding:
> - phy and phy-names aren't defined as 'required' (rk3399-evb.dts doesn't
>   define them)
> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> ---
> This binding is meant to be used in conjunction with
> Documentation/bindings/display/rockchip/analogix_dp-rockchip.txt
> and
> Documentation/bindings/display/exynos/exynos_dp.txt
> =

> I was careful to define the bindings to be flexible enough for both
> cases, since the properties might be slightly different depending
> on the SoC.

They need to be converted all at once to schema.

> =

> Tested with
> make dt_binding_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<...analogix_dp.yaml>
> make dtbs_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<...analogix_dp.yaml>
> =

>  .../bindings/display/bridge/analogix_dp.txt   |  51 --------
>  .../bindings/display/bridge/analogix_dp.yaml  | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix_dp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix_dp.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp=
.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> deleted file mode 100644
> index 027d76c27a41..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Analogix Display Port bridge bindings
> -
> -Required properties for dp-controller:
> -	-compatible:
> -		platform specific such as:
> -		 * "samsung,exynos5-dp"
> -		 * "rockchip,rk3288-dp"
> -		 * "rockchip,rk3399-edp"
> -	-reg:
> -		physical base address of the controller and length
> -		of memory mapped region.
> -	-interrupts:
> -		interrupt combiner values.
> -	-clocks:
> -		from common clock binding: handle to dp clock.
> -	-clock-names:
> -		from common clock binding: Shall be "dp".
> -	-phys:
> -		from general PHY binding: the phandle for the PHY device.
> -	-phy-names:
> -		from general PHY binding: Should be "dp".
> -
> -Optional properties for dp-controller:
> -	-force-hpd:
> -		Indicate driver need force hpd when hpd detect failed, this
> -		is used for some eDP screen which don't have hpd signal.
> -	-hpd-gpios:
> -		Hotplug detect GPIO.
> -		Indicates which GPIO should be used for hotplug detection
> -	-port@[X]: SoC specific port nodes with endpoint definitions as defined
> -		in Documentation/devicetree/bindings/media/video-interfaces.txt,
> -		please refer to the SoC specific binding document:
> -		* Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> -		* Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockc=
hip.txt
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -------------------------------------------------------------------------=
-------
> -
> -Example:
> -
> -	dp-controller {
> -		compatible =3D "samsung,exynos5-dp";
> -		reg =3D <0x145b0000 0x10000>;
> -		interrupts =3D <10 3>;
> -		interrupt-parent =3D <&combiner>;
> -		clocks =3D <&clock 342>;
> -		clock-names =3D "dp";
> -
> -		phys =3D <&dp_phy>;
> -		phy-names =3D "dp";
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp=
.yaml b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
> new file mode 100644
> index 000000000000..a29a79d92c4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/analogix_dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix Display Port bridge bindings
> +
> +maintainers:
> +  - Yakir Yang <ykk@rock-chips.com>
> +
> +description: |
> +  The Samsung Exynos eDP and Rockchip RK3288 eDP controllers share the
> +  same IP. This binding describes the nodes and properties that are
> +  common to both SoCs.
> +
> +  Please, read this together with
> +  Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> +  and
> +  Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchi=
p.txt
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos5-dp
> +      - rockchip,rk3288-dp
> +      - rockchip,rk3399-edp
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Physical base address of the controller and length of memory
> +      mapped region.

That's all 'reg' properties, drop.

> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt combiner values.
> +
> +  clocks:
> +    description: Phandles to dp clocks.

Need:

minItems: 1
maxItems: 3

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +    additionalItems: true
> +    items:
> +      - const: dp
> +    description: Must define at least "dp".

That's what the schema says.

> +
> +  phys:
> +    maxItems: 1
> +    description: Phandle for the PHY device.

Drop

> +
> +  phy-names:
> +    const: dp
> +
> +  force-hpd: true
> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      Hotplug Detect GPIO. Indicates which GPIO should be used for
> +      hotplug detection.

This should be marked deprecated because this belongs in a connector =

node.

> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing SoC-specific port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +      Please, refer to
> +      Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
> +      and
> +      Documentation/devicetree/bindings/display/rockchip/analogix_dp-roc=
kchip.txt
> +      for SoC-specific information about port and endpoint definitions.

Is the port numbering different? If so, probably should just have 2 =

separate schema files.

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object

Needs 'description' to say what data each port is.

> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +      port@1:
> +        type: object
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    dp: dp-controller@145b0000 {
> +        compatible =3D "samsung,exynos5-dp";
> +        reg =3D <0x145b0000 0x10000>;
> +        interrupts =3D <10 3>;
> +        interrupt-parent =3D <&combiner>;
> +        clocks =3D <&clock 342>;
> +        clock-names =3D "dp";
> +
> +        phys =3D <&dp_phy>;
> +        phy-names =3D "dp";
> +    };
> +
> +...
> -- =

> 2.18.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
