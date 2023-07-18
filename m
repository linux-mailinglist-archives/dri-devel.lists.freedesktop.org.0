Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6EB7573F6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 08:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59AD10E2D0;
	Tue, 18 Jul 2023 06:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFE610E2D0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 06:20:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA1A36145E;
 Tue, 18 Jul 2023 06:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3520C433C9;
 Tue, 18 Jul 2023 06:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689661205;
 bh=s3/iQuhgSYfy1+JjML0H0p/t+NfvmlRk8Z5WWqYfGA4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ldit87PAmPbM8W98FjAJgQRjHMFdWvmwgger/x0e14VfB5LTy92JKXCGEJ7zLc2rF
 aYs0osRaBmC1SSptqg6Le3kRQ9gT/uIvIyR1dxug51LwIa4qHnc2lqdXf8ePZptLAX
 j6y5btldLhl/sg49v4I27Xib7hy+83K9Gy68LAMb45tICJLK0eywb5rui2Xnm12QrF
 8t8CVZXnNtSPKA0TYa9KwJDkcGRzGEmLFeRkG7KD+d30ysKCQ15hFB9phkeGZ28JJQ
 I1nxCq/3tB4BXZn5C2rq+jXTPbjcuyFLPAx3tuHFoRXVkVZJDYgie9hApFuQaJbXzW
 cFsBQG0AdRe9Q==
Message-ID: <de9ebb36-d0e9-3ec1-92ff-d9b3d4b2fedc@kernel.org>
Date: Tue, 18 Jul 2023 08:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 17/17] arm64: dts: ti: k3-am62-main: Add GPU device
 node [DO NOT MERGE]
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230714143033.112624-1-sarah.walker@imgtec.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230714143033.112624-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, hns@goldelico.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, afd@ti.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, tzimmermann@suse.de, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 16:30, Sarah Walker wrote:
> Add the Series AXE GPU node to the AM62 device tree.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index b3e4857bbbe4..ad13414acf18 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -892,4 +892,17 @@ mcasp2: audio-controller@2b20000 {
>  		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  	};
> +
> +        gpu: gpu@fd00000 {
> +                compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
> +                reg = <0 0x0fd00000 0 0x20000>;
> +                power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +                clocks = <&k3_clks 187 0>;
> +                clock-names = "core";
> +                interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "gpu";
> +                #cooling-cells = <2>;
> +                #cooling-min-level = <0>;
> +                #cooling-max-level = <3>;

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

