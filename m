Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C6714B4F
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F5810E2B4;
	Mon, 29 May 2023 13:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C8210E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:59:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f60b3f32b4so21113695e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685368770; x=1687960770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oazLT5BoRo6P0OAkqDnaATq3SHdxnGOsyqxxTgo0/fk=;
 b=Yr9UREVC5MVPBvfc95ZNhA42fYbaK1DSNtGyVx1whY4H/m5XQ7zYjdwpgrakzzaJLd
 q0FAVIoycIYEy8ZPPmY2Ckg5WNX/F/ZnyM4dGU97je+EIcK/dnwyZiJMEuu7SHpWWYzk
 04sd7jnEcZux32/nUGrp/AoED1BfcM/9r0akQsOQQD8AZKqxrHz0QVAQYUzdlHgfCLuv
 bTeEBWckjLVw4U8jzHhStKmDCn04e+Xlv+ICWjhvvGG72I2X7CJ5/1HASsxWvu9JCefD
 lcKc5l14g7GD8c4oOPZL1XRBrLsDSwkUz0JGqTJHfape5aU/gzShejRz6HLh/XzQZhzf
 PclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368770; x=1687960770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oazLT5BoRo6P0OAkqDnaATq3SHdxnGOsyqxxTgo0/fk=;
 b=WsgeIVK3OscY87HJNQZtkf+5c/ydJz/T57WqH/JXMaYrp8JkR2P3jTn32E8GibwRO7
 rbTH4+7sfI1+VtudtVChtLuNPB2fZmHGfJbyOpDAcw1KAaGIpv2T043ndxVq+PA7T4ld
 8wUM28eF662WuwH4z3v6D1ePE7nwvUJhSdgUEBB17AcZC7ybIMTxb9tqZ1PyL5TuWQXm
 rTB6aHnpwYsACVGyVL1Ou1ExVPgvwQ7AdLNchZVJZIEpI662qDKs3i1XyS3qKDhGAWEq
 pfz2t2nUPUfARgDnzPjXckhXP7IQA+882S/Q9+19vlQvxsOidIsWW+MXPnuaghJBlrcg
 9AKQ==
X-Gm-Message-State: AC+VfDwiBxpjjouWEA/QH0URR9PWGjPzZG8cjDSxCDt+z1jzCG380/wY
 oVasft0zafocy98Jts6EA/Q=
X-Google-Smtp-Source: ACHHUZ4RDCeonMwGzDh6NAp931ShLAMt6/ZxYuWux62+rLsp2JN9Aml4izb+ej1Vg383g8EUUJJ+fw==
X-Received: by 2002:a05:600c:2196:b0:3f6:3da:1603 with SMTP id
 e22-20020a05600c219600b003f603da1603mr11566428wme.26.1685368769840; 
 Mon, 29 May 2023 06:59:29 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b0030af15d7e41sm86803wrt.4.2023.05.29.06.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 06:59:28 -0700 (PDT)
Message-ID: <740d6471-b71c-3c3b-73e3-60fb5573c88e@gmail.com>
Date: Mon, 29 May 2023 15:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 23/27] arm64: dts: mediatek: Add MT6331 PMIC devicetree
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-24-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-24-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> MT6331 is the primary PMIC for the MediaTek Helio X10 MT6795 smartphone
> platforms: add a devicetree describing its regulators, Real Time Clock
> and PMIC-keys.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks


> ---
>   arch/arm64/boot/dts/mediatek/mt6331.dtsi | 284 +++++++++++++++++++++++
>   1 file changed, 289 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6331.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> new file mode 100644
> index 000000000000..fcec8c07fe39
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2023 Collabora Ltd.
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +#include <dt-bindings/input/input.h>
> +
> +&pwrap {
> +	pmic: mt6331 {
> +		compatible = "mediatek,mt6331";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		mt6331regulator: mt6331regulator {
> +			compatible = "mediatek,mt6331-regulator";
> +
> +			mt6331_vdvfs11_reg: buck-vdvfs11 {
> +				regulator-name = "vdvfs11";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1493750>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vdvfs12_reg: buck-vdvfs12 {
> +				regulator-name = "vdvfs12";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1493750>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vdvfs13_reg: buck-vdvfs13 {
> +				regulator-name = "vdvfs13";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1493750>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vdvfs14_reg: buck-vdvfs14 {
> +				regulator-name = "vdvfs14";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1493750>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vcore2_reg: buck-vcore2 {
> +				regulator-name = "vcore2";
> +				regulator-min-microvolt = <700000>;
> +				regulator-max-microvolt = <1493750>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vio18_reg: buck-vio18 {
> +				regulator-name = "vio18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <0>;
> +				regulator-allowed-modes = <0 1>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vtcxo1_reg: ldo-vtcxo1 {
> +				regulator-name = "vtcxo1";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vtcxo2_reg: ldo-vtcxo2 {
> +				regulator-name = "vtcxo2";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_avdd32_aud_reg: ldo-avdd32aud {
> +				regulator-name = "avdd32_aud";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3200000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vauxa32_reg: ldo-vauxa32 {
> +				regulator-name = "vauxa32";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <3200000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vcama_reg: ldo-vcama {
> +				regulator-name = "vcama";
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vio28_reg: ldo-vio28 {
> +				regulator-name = "vio28";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vcamaf_reg: ldo-vcamaf {
> +				regulator-name = "vcam_af";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vmc_reg: ldo-vmc {
> +				regulator-name = "vmc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vmch_reg: ldo-vmch {
> +				regulator-name = "vmch";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vemc33_reg: ldo-vemc33 {
> +				regulator-name = "vemc33";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vgp1_reg: ldo-vgp1 {
> +				regulator-name = "vgp1";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vsim1_reg: ldo-vsim1 {
> +				regulator-name = "vsim1";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vsim2_reg: ldo-vsim2 {
> +				regulator-name = "vsim2";
> +				regulator-min-microvolt = <1700000>;
> +				regulator-max-microvolt = <3100000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vmipi_reg: ldo-vmipi {
> +				regulator-name = "vmipi";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vibr_reg: ldo-vibr {
> +				regulator-name = "vibr";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vgp4_reg: ldo-vgp4 {
> +				regulator-name = "vgp4";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vcamd_reg: ldo-vcamd {
> +				regulator-name = "vcamd";
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vusb10_reg: ldo-vusb10 {
> +				regulator-name = "vusb";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vcamio_reg: ldo-vcamio {
> +				regulator-name = "vcam_io";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <0>;
> +			};
> +
> +			mt6331_vsram_reg: ldo-vsram {
> +				regulator-name = "vsram";
> +				regulator-min-microvolt = <1012500>;
> +				regulator-max-microvolt = <1012500>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vgp2_reg: ldo-vgp2 {
> +				regulator-name = "vgp2";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			mt6331_vgp3_reg: ldo-vgp3 {
> +				regulator-name = "vgp3";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vrtc_reg: ldo-vrtc {
> +				regulator-name = "vrtc";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +
> +			mt6331_vdig18_reg: ldo-vdig18 {
> +				regulator-name = "dvdd18_dig";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-ramp-delay = <0>;
> +				regulator-always-on;
> +			};
> +		};
> +
> +		mt6331rtc: mt6331rtc {
> +			compatible = "mediatek,mt6331-rtc";
> +		};
> +
> +		mt6331keys: mt6331keys {
> +			compatible = "mediatek,mt6331-keys";
> +			power {
> +				linux,keycodes = <KEY_POWER>;
> +				wakeup-source;
> +			};
> +			home {
> +				linux,keycodes = <KEY_HOME>;
> +			};
> +		};
> +	};
> +};
