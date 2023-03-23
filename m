Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42B6C6A32
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FAF10EAA0;
	Thu, 23 Mar 2023 13:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0D610EAA0;
 Thu, 23 Mar 2023 13:58:46 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-177ca271cb8so22786252fac.2; 
 Thu, 23 Mar 2023 06:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579925;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SgjfEAnWY41f5fkLXCumSlVAx8CUNHqcQf+FKLmQIIA=;
 b=Te0+iLIlQuwYj8wkry7rVTiG7tWu6Ll6DpvHu8XaduTGM/T5ca3IhM2agFD0XgjTZR
 Oc5iKgo9mBLzeZB+c+GbSruksO9YARM5BkRmAcMaBvINYkHlkqde1SN8HAuuj12LmVqF
 IzwBop4yNOepYOWB5aBVMeucMOhmgTWZUdUX5/Aj+eEGW0YCcE0Oo9M5B5gwmwTpex1H
 B85S6E3hgWNWyPjpmyPFgzhAPgqICUXVD82aR2qp/9Ot8IaQBwyYr5C8WiNvbSVcwaL9
 KdTTRFOiKBkNIdZN1EhcqTccYVz77/jGRJeUmt8RAwbARTAMGdo1Am249BGI/FFN3ckJ
 lR/Q==
X-Gm-Message-State: AAQBX9c6uWuZNSTGIjkUZhPZaudBnU4BBbrFE5GTbRH5//DJcE4uDrhd
 M3ofFd8Jh+FeUw6LrQe231w7orxEJA==
X-Google-Smtp-Source: AKy350aN/CIwe29eBM4pcs+gj6oe2TXbdpn8u7vD7SIzCadV+FVVou4++AJZJR3zf8eeJyDpdhNPww==
X-Received: by 2002:a05:6870:1fcf:b0:177:9add:6513 with SMTP id
 gp15-20020a0568701fcf00b001779add6513mr2530774oac.58.1679579925271; 
 Thu, 23 Mar 2023 06:58:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 sz4-20020a056871860400b00172428894e0sm6180097oab.28.2023.03.23.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:58:44 -0700 (PDT)
Received: (nullmailer pid 3103746 invoked by uid 1000);
 Thu, 23 Mar 2023 13:58:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org>
Message-Id: <167957966839.3096549.2217534591461775107.robh@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: qcom,spmi-pmic: document pm8450 pmic
Date: Thu, 23 Mar 2023 08:58:37 -0500
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 23 Mar 2023 11:25:17 +0100, Neil Armstrong wrote:
> Add a compatible for PM8450, commonly found with SM8450.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-2-3ead1e418fe4@linaro.org


pm8941@0: gpio@c000: 'otg' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dtb

pm8941@0: 'pwrkey@800' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8074-dragonboard.dtb
	arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dtb
	arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dtb
	arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dtb
	arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dtb
	arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-honami.dtb

pma8084@0: 'pwrkey@800' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	arch/arm/boot/dts/qcom-apq8084-ifc6540.dtb
	arch/arm/boot/dts/qcom-apq8084-mtp.dtb
	arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dtb

pmic@0: 'extcon@1300' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
	arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb
	arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb
	arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb
	arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb
	arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb
	arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb
	arch/arm64/boot/dts/qcom/msm8916-mtp.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb
	arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb
	arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb
	arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb
	arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb
	arch/arm/boot/dts/qcom-apq8016-sbc.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-e5.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-e7.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-grandmax.dtb
	arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dtb

pmic@2: adc@3100:adc-chan@8:qcom,pre-scaling: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb

pmic@2: adc@3100: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb

pmic@2: adc@4500:compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb

pmic@2: adc@4500: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dtb

pmic@2: gpio@c000:button-backlight-state: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb

pmic@3: leds@d800:interrupt-names:0: 'ovp' was expected
	arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb
	arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb

pmic@3: leds@d800:interrupt-names: ['ovp'] is too short
	arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb
	arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb
	arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb
	arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb

pmic@3: leds@d800:interrupt-names: ['short'] is too short
	arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb
	arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb

pmic@3: leds@d800:interrupts: [[3, 216, 1, 1]] is too short
	arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dtb
	arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dtb
	arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dtb
	arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb
	arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb

pmic@3: leds@d800:interrupts: [[3, 216, 2, 1]] is too short
	arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dtb
	arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-suzu.dtb
	arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb

pmic@3: leds@d800: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
	arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dtb
	arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dtb
	arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dtb

pmic@3: regulators: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 's2@1700' were unexpected)
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb

pmic@3: regulators: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@3: wled@d800:interrupt-names:0: 'ovp' was expected
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@3: wled@d800:interrupt-names: ['short'] is too short
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@3: wled@d800:interrupts: [[3, 216, 2, 1]] is too short
	arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb
	arch/arm64/boot/dts/qcom/apq8096-db820c.dtb
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dtb
	arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb
	arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb
	arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb
	arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb
	arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb
	arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@3: wled@d800: 'label' is a required property
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@3: wled@d800: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
	arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb
	arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb

pmic@5: 'led-controller@d300' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	arch/arm64/boot/dts/qcom/sc7180-idp.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb

pmic@5: leds@d800:interrupt-names: ['ovp'] is too short
	arch/arm64/boot/dts/qcom/sc7180-idp.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb

pmic@5: leds@d800:interrupts: [[5, 216, 1, 1]] is too short
	arch/arm64/boot/dts/qcom/sc7180-idp.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-auo.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360-wifi.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-parade.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-ti.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb
	arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb

