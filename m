Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD718388EE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 09:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8835A10E133;
	Tue, 23 Jan 2024 08:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C808810E133
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 08:29:42 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi
 [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4907D6E0;
 Tue, 23 Jan 2024 09:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705998508;
 bh=zP6goYK8fOIIlbvFyRrRiK6C1sBPUxkmjqGK+EwSpYU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J6gm/dVIXXJWQjy75//ntfl/KL0yhc9N71HvPODxSQ0Nf6s/RXs8nloyraTCa5gWW
 jYx2eOuDGBeZjsW5FTXxUElNPv71/TPw4j8TRjhcXbWf8RqfujvzMfR1sDepyyPx09
 k9bPNHE7Y61qVDZl4G3tKZXkGcADy6piFbqqMZ1k=
Message-ID: <e452c6ae-e889-44a9-9fbf-99527f5c50b9@ideasonboard.com>
Date: Tue, 23 Jan 2024 10:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: ti: k3-am62x: Add overlay to use DSS
 in display sharing mode
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-4-devarsht@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20240116134142.2092483-4-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, j-luthra@ti.com, tzimmermann@suse.de,
 a-bhatia1@ti.com, praneeth@ti.com, airlied@gmail.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, jyri.sarha@iki.fi,
 kristo@kernel.org, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16/01/2024 15:41, Devarsh Thakkar wrote:
> This overlay needs to be used with display sharing supported device
> manager firmware only.
> 
> Remote core running this firmware has write access to "common" register
> space, VIDL pipeline, OVR1 overlay and VP1 videoport.
> 
> The processing core running Linux is provided write access to VID
> pipeline and "common1" register space.
> 
> The VP1 video port is shared between Linux and remote core with remote
> core configuring the overlay manager to set Zorder 1 for VID pipeline
> and Zorder 2 for VIDL pipeline.
> 
> Add reserved memory region for framebuffer region used by remote core in
> dss shared mode overlay file so that Linux does not re-use the same
> while allocating memory.

I don't understand this one. Why is RAM used by RTOS accessible by Linux 
in the first place?

  Tomi

> Also add a label for reserved memory region in base device-tree file so
> that it can be referred back in overlay file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |  1 +
>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
>   .../dts/ti/k3-am62x-sk-dss-shared-mode.dtso   | 33 +++++++++++++++++++
>   3 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 52c1dc910308..ff832741b367 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -35,6 +35,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-tevi-ov5640.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
> +dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-dss-shared-mode.dtbo
>   
>   # Boards with AM64x SoC
>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> index 33768c02d8eb..8b55ca10102f 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
> @@ -34,7 +34,7 @@ memory@80000000 {
>   		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
>   	};
>   
> -	reserved-memory {
> +	reserved_memory: reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>   		ranges;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
> new file mode 100644
> index 000000000000..02153748a5c2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * DT overlay to enable display sharing mode for AM62P DSS0
> + * This is compatible with custom AM62 Device Manager firmware
> + *
> + * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&dss0 {
> +	ti,dss-shared-mode;
> +	ti,dss-shared-mode-vp = "vp1";
> +	ti,dss-shared-mode-vp-owned = <0>;
> +	ti,dss-shared-mode-common = "common1";
> +	ti,dss-shared-mode-planes = "vid";
> +	ti,dss-shared-mode-plane-zorder = <0>;
> +	interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&reserved_memory {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	rtos_framebuffer_memory_region: rtos-framebuffer-memory@94800000 {
> +		compatible = "shared-dma-pool";
> +		reg = <0x00 0x94800000 0x00 0x08000000>;
> +		no-map;
> +	};
> +};

