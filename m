Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33295AC30DF
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 19:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708C10E11A;
	Sat, 24 May 2025 17:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gr5OgtBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829C010E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:58:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so4970795e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748109506; x=1748714306; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JpbcXuiKIIJw5D+MoRAeAeJs8T9f5wJFlXCgJ+Rk/hc=;
 b=gr5OgtBAjreVfGs4S0sP3fmNRIiWI8dknoRg7j9wKaYzjKa1ypT3tCfrMhV5Q/mKdj
 jQO2n4V2ngV3/f7M1H1/TbKtd1UzaNxWV4696n/EZ2Q5rwbji/q7pAcwnLSkX7jP3Wae
 mkzFmRVHbYF4EAY0FWWxbzNA2DKGoOFB9b1dZu+5/5ehKURqaFuDHMXCl0PnlcTdMZLk
 kxZL5hT2X1A6ceih2Mu48yWV0o4Bf12vQm6NNeIa+zBS5OxWhj0lUwhTNMIsRQhO9Vcd
 W5h+GCPy46LFjfHl7pyrh4kdt2u3J/AYzhg40BiZlBVSN6kfG/EDxjd3jyeAYLwFoxOU
 DVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748109506; x=1748714306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpbcXuiKIIJw5D+MoRAeAeJs8T9f5wJFlXCgJ+Rk/hc=;
 b=Ke6Yc4ZnB6n0eXvO1925Im6ks9w3GuCMw7g3qyFgTw/iY6KeBRdLHp6d+uERXuZZ36
 /+jaRZMn+TBY2nsmr8kSC++wFGSVMbpdWXdd13UdHA4xJzVZMP69AAkOyjfEWIU0GPYB
 gxgpDWD/4zpTYX5Hau9eldu12VYo8M39btWiCAuIVZrhI1C8otBDgWexH+pexYpeYHM2
 xymx4TLCAq8S6YTd/OhvIziV1vfvH+gKfQGhpjQoJLAwqlcCrlHcxAIAJLPMCqb76XR3
 BMZyklAypi/lWbJe0m5YVuLtS5sUryEVPfBOkH1CFHX/EPr91vPgHKRSggY0q4uPgVCC
 VXaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtTqrcO5imIt6YIwTKoDNI7Ll1v/Xi0WTivGg4kKUDrmeYaZM9Yco6mt2kUtLRK95H7NGWdzCao3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK3TblE1jXHw6WIUPJd77bfbo6qo90kO6RZm7i9C119qPVYyQs
 05kCB0CkP0BPYV/0CCiULLIuiqRolsYVrY096Y/RuArS1gUU1VTu8mET76eiEuvbTWbYDFN3ifb
 GPvS/j8B4bICUv6WyA6omNaG3W3qNMw==
X-Gm-Gg: ASbGncvfJXNUUYZot3Kx8dhq+fJGXgCYIAJ7wmf5BEbjRg/T7NoYqb0+nnxllQZ/Hox
 ANtyEO/ymPjoT1RjCAOcYStTDiIF+zWF0Bt6uvfHWVltwJy19NbM79pr87deKnEjwwSR55x/mX8
 oJanw8d2UZG3Bi3HKXB8tgD6UsCRPVMqP3
X-Google-Smtp-Source: AGHT+IEJkbFTLhLPByxhkxHUveNxIK88ufqBmQ16laKt3iokyO8tWTi8qUbqRjGlr3WVhruM+FugzlUbwxopi4Ot16s=
X-Received: by 2002:a5d:64ea:0:b0:3a3:7753:20ff with SMTP id
 ffacd0b85a97d-3a4cb45f1f4mr3232295f8f.35.1748109505171; Sat, 24 May 2025
 10:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
In-Reply-To: <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sat, 24 May 2025 19:58:13 +0200
X-Gm-Features: AX0GCFsG_alMF1pdvWcQUvRQFwuTzB11t-rBcYRl2wvQbcSJtw1oawetOfEHu40
Message-ID: <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >
> > Device tree for the Lenovo Thinkbook 16 G7 QOY
> >
> > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> >
> > Supported features:
> >
> > - USB type-c and type-a ports
> > - Keyboard
> > - Touchpad (all that are described in the dsdt)
> > - Touchscreen (described in the dsdt, no known SKUss)
> > - Display including PWM backlight control
> > - PCIe devices
> > - nvme
> > - SDHC card reader
> > - ath12k WCN7850 Wifi and Bluetooth
> > - ADSP and CDSP
> > - GPIO keys (Lid switch)
> > - Sound via internal speakers / DMIC / USB / headphone jack
> > - DP Altmode with 2 lanes (as all of these still do)
> > - Integrated fingerprint reader (FPC)
> > - Integrated UVC camera
> >
> > Not supported yet:
> >
> > - HDMI port.
> > - EC and some fn hotkeys.
> >
> > Limited support yet:
> >
> > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > but not UHS-I (SD104) and UHS-II.
> >
> > - The GPU is not yet supported. Graphics is only software rendered.
> >
> > This work was done without any schematics or non-public knowledge of the device.
> > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > @43).
> >
> > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> >  3 files changed, 1659 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > +
>
> No need for an extra empty line.
>
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > @@ -170,7 +170,7 @@ trip1 {
> >                       };
> >               };
> >
> > -             pm8010-thermal {
> > +             pm8010_thermal: pm8010-thermal {
> >                       polling-delay-passive = <100>;
> >
> >                       thermal-sensors = <&pm8010_temp_alarm>;
> > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > @@ -0,0 +1,1655 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > + * Copyright (c) 2024, Linaro Limited
> > + * Copyright (c) 2025, Jens Glathe
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/gpio-keys.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "x1p42100.dtsi"
> > +#include "x1e80100-pmics.dtsi"
> > +
> > +/delete-node/ &pmc8380_6;
> > +/delete-node/ &pmc8380_6_thermal;
> > +/delete-node/ &pm8010;
> > +/delete-node/ &pm8010_thermal;
> > +
> > +/ {
> > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > +     chassis-type = "laptop";
> > +
> > +     aliases {
> > +             serial0 = &uart21;
> > +             serial1 = &uart14;
> > +     };
> > +
> > +     wcd938x: audio-codec {
> > +             compatible = "qcom,wcd9385-codec";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wcd_default>;
> > +
> > +             qcom,micbias1-microvolt = <1800000>;
> > +             qcom,micbias2-microvolt = <1800000>;
> > +             qcom,micbias3-microvolt = <1800000>;
> > +             qcom,micbias4-microvolt = <1800000>;
> > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > +             qcom,rx-device = <&wcd_rx>;
> > +             qcom,tx-device = <&wcd_tx>;
> > +
> > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > +
> > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > +
> > +             #sound-dai-cells = <1>;
> > +     };
> > +
> > +     backlight: backlight {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&pm8550_pwm 3 500000>;
> > +
> > +             power-supply = <&vreg_edp_bl>;
> > +     };
> > +
> > +     camera {
> > +             compatible = "usb5986,1198";
> > +
> > +             vdd-supply = <&vreg_cam_5p0>;
> > +
> > +             status = "okay";
>
> This is default, please drop.
>
> > +     };
>
> Camera isn't randomly wire to the board, it is on the USB bus. Please
> follow DT bindings and put it accordingly, describing topology of the
> bus.
>
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +
> > +             pinctrl-0 = <&hall_int_n_default>;
> > +             pinctrl-names = "default";
> > +
> > +             switch-lid {
> > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > +                     linux,input-type = <EV_SW>;
> > +                     linux,code = <SW_LID>;
> > +                     wakeup-source;
> > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > +             };
> > +     };
> > +
> > +     pmic-glink {
> > +             compatible = "qcom,x1e80100-pmic-glink",
> > +                             "qcom,sm8550-pmic-glink",
> > +                             "qcom,pmic-glink";
>
> Align vertically on the double-quote
>
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
>
> And such lists should be aligned on the opening angle bracket.
>
> > +
> > +             /* Display-adjacent port */
> > +             connector@0 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <0>;
> > +                     power-role = "dual";
> > +                     data-role = "dual";
>
> Is it actually dual-role? What does UCSI report for it?
>
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     pmic_glink_ss0_hs_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     pmic_glink_ss0_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > +                                     };
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> > +
> > +                                     pmic_glink_ss0_sbu: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             /* User-adjacent port */
> > +             connector@1 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <1>;
> > +                     power-role = "dual";
> > +                     data-role = "dual";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     pmic_glink_ss1_hs_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     pmic_glink_ss1_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > +                                     };
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg = <2>;
> > +
> > +                                     pmic_glink_ss1_sbu: endpoint {
> > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     reserved-memory {
> > +             linux,cma {
>
> What for?
>
> > +                     compatible = "shared-dma-pool";
> > +                     size = <0x0 0x8000000>;
> > +                     reusable;
> > +                     linux,cma-default;
> > +             };
> > +     };
> > +
>
> [...]
>
> > +
> > +&gpu {
> > +     status = "okay";
>
> I think that you wrote that GPU isn't supported (yet).

GPU is not supported on SoC level (x1p42100/purwa), not device
specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
as per discussion abou purwa GPU and purwa firmware in general [1]: to
already include correct filename and firmware path (since these are
known) such that once SoC lands the GPU support laptops with that SoC
will gain GPU support 'automatically'. As nothing consumes this
property (on purwa) just yet, adding it already does not cause any
harm.

Jens, as per the same discussion [1] the path is wrong here,
s/x1e80100/x1p42100/ for all purwa-specifc firmware. Unless the
decision about firmware paths was re-evaluated in Linaro/Qcom?

>
> > +
> > +     zap-shader {
> > +             firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     clock-frequency = <400000>;
> > +
> > +     pinctrl-0 = <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;
>
> If keyboard doesn't share pinctrl with other devices, you can move it to the keyboard DT node.
>
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     /* ELAN06FA */
> > +     touchpad@15 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x15>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l12b_1p2>;
> > +
> > +             wakeup-source;
> > +     };
> > +
> > +     /* CIRQ1080 or SYNA2BA6 */
> > +     touchpad@2c {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x2c>;
> > +
> > +             hid-descr-addr = <0x20>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l12b_1p2>;
> > +
> > +             wakeup-source;
> > +     };
> > +
> > +     /* FTCS0038 */
> > +     touchpad@38 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x38>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l12b_1p2>;
> > +
> > +             wakeup-source;
> > +     };
> > +
> > +     keyboard@3a {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x3a>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l12b_1p2>;
> > +
> > +             wakeup-source;
> > +     };
> > +
> > +     /* GXTP5100 */
> > +     touchpad@5d {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x5d>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l12b_1p2>;
> > +
> > +             wakeup-source;
> > +     };
> > +};
> > +
> > +&i2c5 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     eusb5_repeater: redriver@43 {
> > +             compatible = "nxp,ptn3222";
> > +             reg = <0x43>;
> > +             #phy-cells = <0>;
> > +
> > +             vdd3v3-supply = <&vreg_l13b_3p0>;
> > +             vdd1v8-supply = <&vreg_l4b_1p8>;
> > +     };
> > +
> > +     eusb3_repeater: redriver@47 {
> > +             compatible = "nxp,ptn3222";
> > +             reg = <0x47>;
> > +             #phy-cells = <0>;
> > +
> > +             vdd3v3-supply = <&vreg_l13b_3p0>;
> > +             vdd1v8-supply = <&vreg_l4b_1p8>;
> > +
> > +             reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> > +
> > +             pinctrl-0 = <&eusb3_reset_n>;
> > +             pinctrl-names = "default";
> > +     };
> > +
> > +     eusb9_repeater: redriver@4b {
> > +             compatible = "nxp,ptn3222";
> > +             reg = <0x4b>;
> > +             #phy-cells = <0>;
> > +
> > +             vdd3v3-supply = <&vreg_l13b_3p0>;
> > +             vdd1v8-supply = <&vreg_l4b_1p8>;
> > +
> > +             reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> > +
> > +             pinctrl-0 = <&eusb9_reset_n>;
> > +             pinctrl-names = "default";
> > +     };
> > +
> > +     eusb6_repeater: redriver@4f {
> > +             compatible = "nxp,ptn3222";
> > +             reg = <0x4f>;
> > +             #phy-cells = <0>;
> > +
> > +             vdd3v3-supply = <&vreg_l13b_3p0>;
> > +             vdd1v8-supply = <&vreg_l4b_1p8>;
> > +
> > +             reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> > +
> > +             pinctrl-0 = <&eusb6_reset_n>;
> > +             pinctrl-names = "default";
> > +     };
> > +};
> > +
> > +&i2c8 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     /* ILIT2911 or GTCH1563 */
> > +     touchscreen@10 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x10>;
> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vdd-supply = <&vreg_misc_3p3>;
> > +             vddl-supply = <&vreg_l15b_1p8>;
> > +
> > +             pinctrl-0 = <&ts0_default>;
> > +             pinctrl-names = "default";
> > +     };
> > +};
> > +
> > +&lpass_tlmm {
> > +     spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> > +             pins = "gpio12";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> > +};
> > +
> > +&lpass_vamacro {
> > +     pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
> > +     pinctrl-names = "default";
> > +
> > +     vdd-micb-supply = <&vreg_l1b_1p8>;
> > +     qcom,dmic-sample-rate = <4800000>;
> > +};
> > +
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_dp0 {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +     data-lanes = <0 1>;
> > +     link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +};
> > +
> > +&mdss_dp1 {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_dp1_out {
> > +     data-lanes = <0 1>;
> > +     link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +};
> > +
> > +&mdss_dp3 {
> > +     /delete-property/ #sound-dai-cells;
> > +
> > +     status = "okay";
> > +
> > +     aux-bus {
> > +             panel {
> > +                     compatible = "edp-panel";
> > +
> > +                     backlight = <&backlight>;
> > +
> > +                     enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > +                     pinctrl-0 = <&edp_bl_en>;
> > +                     pinctrl-names = "default";
> > +
> > +                     power-supply = <&vreg_edp_3p3>;
> > +
> > +                     port {
> > +                             edp_panel_in: endpoint {
> > +                                     remote-endpoint = <&mdss_dp3_out>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     ports {
> > +             port@1 {
> > +                     reg = <1>;
> > +
> > +                     mdss_dp3_out: endpoint {
> > +                             data-lanes = <0 1 2 3>;
> > +                             link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +
> > +                             remote-endpoint = <&edp_panel_in>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dp3_phy {
>
> What about DP0 / DP1 PHYs?
>
> > +     vdda-phy-supply = <&vreg_l3j_0p8>;
> > +     vdda-pll-supply = <&vreg_l2j_1p2>;
> > +
> > +     status = "okay";
> > +};
> > +
>
> [...]
>
> > +
> > +&qupv3_0 {
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_1 {
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_2 {
> > +     status = "okay";
> > +};
>
> Don't you also wan to enable corresponding GPI DMA devices?
>
> > +
> > +&remoteproc_adsp {
> > +     firmware-name = "qcom/x1e80100/LENOVO/21NH/qcadsp8380.mbn",
> > +                     "qcom/x1e80100/LENOVO/21NH/adsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};

And here, s/x1e80100/x1p42100/

> > +
> > +&remoteproc_cdsp {
> > +     firmware-name = "qcom/x1e80100/LENOVO/21NH/qccdsp8380.mbn",
> > +                     "qcom/x1e80100/LENOVO/21NH/cdsp_dtbs.elf";
> > +
> > +     status = "okay";
> > +};

And here, s/x1e80100/x1p42100/

Regards,
Alex

[1] https://lore.kernel.org/all/93f916d1-83b9-41c0-bb05-a785fb730088@oss.qualcomm.com/

> > +
> > +&sdhc_2 {
> > +     cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> > +     pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> > +     pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> > +     pinctrl-names = "default", "sleep";
> > +     vmmc-supply = <&vreg_l9b_2p9>;
> > +     vqmmc-supply = <&vreg_l6b_1p8>;
> > +     status = "okay";
> > +};
> > +
> > +&smb2360_0 {
> > +     status = "okay";
> > +};
> > +
> > +&smb2360_0_eusb2_repeater {
> > +     vdd18-supply = <&vreg_l3d_1p8>;
> > +     vdd3-supply = <&vreg_l2b_3p0>;
> > +};
> > +
> > +&smb2360_1 {
> > +     status = "okay";
> > +};
> > +
> > +&smb2360_1_eusb2_repeater {
> > +     vdd18-supply = <&vreg_l3d_1p8>;
> > +     vdd3-supply = <&vreg_l14b_3p0>;
> > +};
> > +
> > +&swr0 {
> > +     status = "okay";
> > +
> > +     pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> > +     pinctrl-names = "default";
> > +
> > +     /* WSA8845, Left Speaker */
> > +     left_spkr: speaker@0,0 {
> > +             compatible = "sdw20217020400";
> > +             reg = <0 0>;
> > +             reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> > +             #sound-dai-cells = <0>;
> > +             sound-name-prefix = "SpkrLeft";
> > +             vdd-1p8-supply = <&vreg_l15b_1p8>;
> > +             vdd-io-supply = <&vreg_l12b_1p2>;
> > +             qcom,port-mapping = <1 2 3 7 10 13>;
> > +     };
> > +
> > +     /* WSA8845, Right Speaker */
> > +     right_spkr: speaker@0,1 {
> > +             compatible = "sdw20217020400";
> > +             reg = <0 1>;
> > +             reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> > +             #sound-dai-cells = <0>;
> > +             sound-name-prefix = "SpkrRight";
> > +             vdd-1p8-supply = <&vreg_l15b_1p8>;
> > +             vdd-io-supply = <&vreg_l12b_1p2>;
> > +             qcom,port-mapping = <4 5 6 7 11 13>;
> > +     };
> > +};
> > +
> > +&swr1 {
> > +     status = "okay";
> > +
> > +     /* WCD9385 RX */
> > +     wcd_rx: codec@0,4 {
> > +             compatible = "sdw20217010d00";
> > +             reg = <0 4>;
> > +             qcom,rx-port-mapping = <1 2 3 4 5>;
> > +     };
> > +};
> > +
> > +&swr2 {
> > +     status = "okay";
> > +
> > +     /* WCD9385 TX */
> > +     wcd_tx: codec@0,3 {
> > +             compatible = "sdw20217010d00";
> > +             reg = <0 3>;
> > +             qcom,tx-port-mapping = <2 2 3 4>;
> > +     };
> > +};
> > +
> > +&tlmm {
> > +     gpio-reserved-ranges = <34 2>, /* Unused */
> > +             <72 2>, /* Secure EC I2C connection (?) */
> > +             <238 1>; /* UFS Reset */
> > +
> > +     cam_reg_en: cam-reg-en-state {
> > +             pins = "gpio44";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +     };
> > +
> > +     eusb3_reset_n: eusb3-reset-n-state {
> > +             pins = "gpio6";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> > +
> > +     eusb6_reset_n: eusb6-reset-n-state {
> > +             pins = "gpio184";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> > +
> > +     eusb9_reset_n: eusb9-reset-n-state {
> > +             pins = "gpio7";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> > +
> > +     edp_reg_en: edp-reg-en-state {
> > +             pins = "gpio70";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +     };
> > +
> > +     hall_int_n_default: hall-int-n-state {
> > +             pins = "gpio92";
> > +             function = "gpio";
> > +             bias-disable;
> > +     };
> > +
> > +     kybd_default: kybd-default-state {
> > +             pins = "gpio67";
> > +             function = "gpio";
> > +             bias-disable;
> > +     };
> > +
> > +     nvme_reg_en: nvme-reg-en-state {
> > +             pins = "gpio18";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     pcie4_default: pcie4-default-state {
> > +             clkreq-n-pins {
> > +                     pins = "gpio147";
> > +                     function = "pcie4_clk";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             perst-n-pins {
> > +                     pins = "gpio146";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +             };
> > +
> > +             wake-n-pins {
> > +                     pins = "gpio148";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +     };
> > +
> > +     pcie6a_default: pcie6a-default-state {
> > +             clkreq-n-pins {
> > +                     pins = "gpio153";
> > +                     function = "pcie6a_clk";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             perst-n-pins {
> > +                     pins = "gpio152";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +             };
> > +
> > +             wake-n-pins {
> > +                     pins = "gpio154";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-pull-up;
> > +             };
> > +     };
> > +
> > +     sdc2_card_det_n: sdc2-card-det-state {
> > +             pins = "gpio71";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-pull-up;
> > +     };
> > +
> > +     tpad_default: tpad-default-state {
> > +             pins = "gpio3";
> > +             function = "gpio";
> > +             bias-pull-up;
> > +     };
> > +
> > +     ts0_default: ts0-default-state {
> > +             int-n-pins {
> > +                     pins = "gpio51";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +             };
> > +
> > +             reset-n-pins {
> > +                     pins = "gpio48";
> > +                     function = "gpio";
> > +                     output-high;
> > +                     drive-strength = <16>;
> > +             };
> > +     };
> > +
> > +     usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
> > +             mode-pins {
> > +                     pins = "gpio166";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +                     output-high;
> > +             };
> > +
> > +             oe-n-pins {
> > +                     pins = "gpio168";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +             };
> > +
> > +             sel-pins {
> > +                     pins = "gpio167";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +             };
> > +
> > +     };
> > +
> > +     usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> > +             mode-pins {
> > +                     pins = "gpio177";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +                     output-high;
> > +             };
> > +
> > +             oe-n-pins {
> > +                     pins = "gpio179";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +             };
> > +
> > +             sel-pins {
> > +                     pins = "gpio178";
> > +                     function = "gpio";
> > +                     bias-disable;
> > +                     drive-strength = <2>;
> > +             };
> > +     };
> > +
> > +     wcd_default: wcd-reset-n-active-state {
> > +             pins = "gpio191";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> > +
> > +     wcn_bt_en: wcn-bt-en-state {
> > +             pins = "gpio116";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             output-low;
> > +             bias-pull-down;
> > +     };
> > +
> > +     wcn_sw_en: wcn-sw-en-state {
> > +             pins = "gpio214";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +     };
> > +
> > +     wcn_wlan_en: wcn-wlan-en-state {
> > +             pins = "gpio117";
> > +             function = "gpio";
> > +             drive-strength = <16>;
> > +             bias-disable;
> > +     };
> > +};
> > +
> > +&uart14 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn7850-bt";
> > +             max-speed = <3200000>;
> > +
> > +             vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +             vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> > +     };
> > +};
> > +
> > +&usb_1_ss0_hsphy {
> > +     vdd-supply = <&vreg_l3j_0p8>;
> > +     vdda12-supply = <&vreg_l2j_1p2>;
> > +
> > +     phys = <&smb2360_0_eusb2_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0_qmpphy {
> > +     vdda-phy-supply = <&vreg_l3e_1p2>;
> > +     vdda-pll-supply = <&vreg_l1j_0p8>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss0_dwc3 {
> > +     dr_mode = "host";
>
> So pmic-glink declares corresponding port as dual-role, but USB
> controller is host-only?
>
> > +};
> > +
> > +&usb_1_ss0_dwc3_hs {
> > +     remote-endpoint = <&pmic_glink_ss0_hs_in>;
> > +};
> > +
> > +&usb_1_ss0_qmpphy_out {
> > +     remote-endpoint = <&pmic_glink_ss0_ss_in>;
> > +};
> > +
> > +&usb_1_ss1_hsphy {
> > +     vdd-supply = <&vreg_l3j_0p8>;
> > +     vdda12-supply = <&vreg_l2j_1p2>;
> > +
> > +     phys = <&smb2360_1_eusb2_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1_qmpphy {
> > +     vdda-phy-supply = <&vreg_l2j_1p2>;
> > +     vdda-pll-supply = <&vreg_l2d_0p9>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss1_dwc3 {
> > +     dr_mode = "host";
>
> And this one...
>
> > +};
> > +
> > +&usb_1_ss1_dwc3_hs {
> > +     remote-endpoint = <&pmic_glink_ss1_hs_in>;
> > +};
> > +
> > +&usb_1_ss1_qmpphy_out {
> > +     remote-endpoint = <&pmic_glink_ss1_ss_in>;
> > +};
> > +
> > +&usb_1_ss2 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_ss2_dwc3 {
> > +     dr_mode = "host";
> > +     maximum-speed = "high-speed";
> > +     phys = <&usb_1_ss2_hsphy>;
> > +     phy-names = "usb2-phy";
> > +};
> > +
> > +&usb_1_ss2_hsphy {
> > +     vdd-supply = <&vreg_l3j_0p8>;
> > +     vdda12-supply = <&vreg_l2j_1p2>;
> > +
> > +     phys = <&eusb5_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_2 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_2_dwc3 {
> > +     dr_mode = "host";
> > +};
> > +
> > +&usb_2_hsphy {
> > +     vdd-supply = <&vreg_l2e_0p8>;
> > +     vdda12-supply = <&vreg_l3e_1p2>;
> > +
> > +     phys = <&eusb9_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_mp {
> > +     status = "okay";
> > +};
> > +
> > +&usb_mp_hsphy0 {
> > +     vdd-supply = <&vreg_l2e_0p8>;
> > +     vdda12-supply = <&vreg_l3e_1p2>;
> > +
> > +     phys = <&eusb6_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_mp_qmpphy0 {
> > +     vdda-phy-supply = <&vreg_l3e_1p2>;
> > +     vdda-pll-supply = <&vreg_l3c_0p8>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_mp_hsphy1 {
> > +     vdd-supply = <&vreg_l2e_0p8>;
> > +     vdda12-supply = <&vreg_l3e_1p2>;
> > +
> > +     phys = <&eusb3_repeater>;
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_mp_qmpphy1 {
> > +     vdda-phy-supply = <&vreg_l3e_1p2>;
> > +     vdda-pll-supply = <&vreg_l3c_0p8>;
> > +
> > +     status = "okay";
> > +};
> >
> > --
> > 2.48.1
> >
> >
>
> --
> With best wishes
> Dmitry
