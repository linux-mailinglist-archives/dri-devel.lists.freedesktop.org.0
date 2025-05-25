Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215EAC36A5
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 21:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30BF10E217;
	Sun, 25 May 2025 19:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jdcjEzRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638410E217
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 19:43:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a374f727dbso1483645f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748202228; x=1748807028; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=88qsrhlyktyQjtClNmk24chYTTwZKFSByLFBhnAi48k=;
 b=jdcjEzRGu8dzEeQJNKhcfDtJyX11kVBwjsnnAJkjVA1l9i/pbUfmrlNc4n/DmiUNCw
 udZWkmuWNZzWqrZc5G3YojOyOxdS0oaeB1iUt9hvnlDmGq1sSe6MdjWDinnsHqMYh0Mb
 UGOdeE6kvDjv+EReSyIoHnZdSfi2VYpOW8eA8S3ZrpCoZqFfP259DajHkI1HKsrnUpba
 D0UDee12Us0cRNdcraznDw+dieycuRdiUR7pLVAxPKhTXKCaBxIcxnuj9lvtvtZEfU/2
 SrIAnmeNJKd9UHjfAzANscNUsM6t07sVoEdjTu+nYYrA/rM5qGl8+uuR/tooJ3cMsQJ1
 H+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748202228; x=1748807028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=88qsrhlyktyQjtClNmk24chYTTwZKFSByLFBhnAi48k=;
 b=KwWnkM+fF7Qvc+JE8DihpI75NUtaW1adWY2P6K7gINgDtvLop1UMmzMqIO8rHbs/5+
 vxbVrc+25BgwgTeZahCEJppzu/3FbqFSL7sid6Gzl2unvogf3EUOw+Raj7bfJqJidHvh
 QkxtBylnli03+zR64ws72DuReFx9Kb2o7Edo4fOmkvF3auGKHAnVcXoe/hiBDUwMOeye
 cweZC/izy1ZjC2htsYmMJLEO94DUtX0qrMj4NLBRE0w4GxGe/n8HU6UdzFv2hnz0jPcc
 XsYwTVGjcp0BF19oEO5Dr2ncv9KHHWRAXU+tFcGg7XexP9YuJQUv57vSR4PfL8WWTLiI
 YIhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4yid4j23S0NQWR2NxcngmWy1RkjUl6ILCRLexWce0qnxaiHVjEg/g0Z6V1M04MoSeeyq37pLGEbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTiKXnhta87EElcNr3ro1IwKPt7QxW3tM/MbCmM6NZxkLv4YgN
 Zahy2Vf2+e+7XNy/gC1Xa7azm3fupr34d+QKGdA6rB00vPWxu9c8StndrsL6cDVtO6IOq5aL0qa
 LcVXzDfjlkECrc7big8Kpfkc5cHlq3w==
X-Gm-Gg: ASbGncsv4IsNfkJO3PWNRT+S1Puz/WMMtlvuWM5C6qULeStjJel6ck6NvefjkQGMb6n
 5c5NXKY7LsMkb9NP1X5Kw/iHGKqK1BIibmdfX6XQekUEgRDmINrxljCH5qAMcINgFgmAAHEqKrp
 TOycOiULMs+qOqASLULwXRscrY5xOCDwuLinw27QgFMRY=
X-Google-Smtp-Source: AGHT+IFYH64+G/WgGBJUcy1Uow1OzLEcXe+1afwTJqAVj6Yn78C5vXN8nGC1PJYIHVP2a0hJap0PeqLu2y5C0XKjlaE=
X-Received: by 2002:a05:6000:178d:b0:3a0:b8b0:43ff with SMTP id
 ffacd0b85a97d-3a4cb448fb9mr5461119f8f.14.1748202227836; Sun, 25 May 2025
 12:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
In-Reply-To: <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sun, 25 May 2025 21:43:36 +0200
X-Gm-Features: AX0GCFtIrEdQcMw-yUrjcvSdT47PSo_i9ZsP-0fOJmL5nZhM5IZoJxzKs6sG-xE
Message-ID: <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
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

On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> > On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > >
> > > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > > >
> > > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> > > >
> > > > Supported features:
> > > >
> > > > - USB type-c and type-a ports
> > > > - Keyboard
> > > > - Touchpad (all that are described in the dsdt)
> > > > - Touchscreen (described in the dsdt, no known SKUss)
> > > > - Display including PWM backlight control
> > > > - PCIe devices
> > > > - nvme
> > > > - SDHC card reader
> > > > - ath12k WCN7850 Wifi and Bluetooth
> > > > - ADSP and CDSP
> > > > - GPIO keys (Lid switch)
> > > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > > - DP Altmode with 2 lanes (as all of these still do)
> > > > - Integrated fingerprint reader (FPC)
> > > > - Integrated UVC camera
> > > >
> > > > Not supported yet:
> > > >
> > > > - HDMI port.
> > > > - EC and some fn hotkeys.
> > > >
> > > > Limited support yet:
> > > >
> > > > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > > > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > > > but not UHS-I (SD104) and UHS-II.
> > > >
> > > > - The GPU is not yet supported. Graphics is only software rendered.
> > > >
> > > > This work was done without any schematics or non-public knowledge of the device.
> > > > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > > > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > > > @43).
> > > >
> > > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> > > >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> > > >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> > > >  3 files changed, 1659 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> > > >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> > > >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > > > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > > > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > > > +
> > >
> > > No need for an extra empty line.
> > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > > @@ -170,7 +170,7 @@ trip1 {
> > > >                       };
> > > >               };
> > > >
> > > > -             pm8010-thermal {
> > > > +             pm8010_thermal: pm8010-thermal {
> > > >                       polling-delay-passive = <100>;
> > > >
> > > >                       thermal-sensors = <&pm8010_temp_alarm>;
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > > @@ -0,0 +1,1655 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + * Copyright (c) 2024, Linaro Limited
> > > > + * Copyright (c) 2025, Jens Glathe
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > +#include <dt-bindings/input/input.h>
> > > > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > > +
> > > > +#include "x1p42100.dtsi"
> > > > +#include "x1e80100-pmics.dtsi"
> > > > +
> > > > +/delete-node/ &pmc8380_6;
> > > > +/delete-node/ &pmc8380_6_thermal;
> > > > +/delete-node/ &pm8010;
> > > > +/delete-node/ &pm8010_thermal;
> > > > +
> > > > +/ {
> > > > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > > > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > > > +     chassis-type = "laptop";
> > > > +
> > > > +     aliases {
> > > > +             serial0 = &uart21;
> > > > +             serial1 = &uart14;
> > > > +     };
> > > > +
> > > > +     wcd938x: audio-codec {
> > > > +             compatible = "qcom,wcd9385-codec";
> > > > +
> > > > +             pinctrl-names = "default";
> > > > +             pinctrl-0 = <&wcd_default>;
> > > > +
> > > > +             qcom,micbias1-microvolt = <1800000>;
> > > > +             qcom,micbias2-microvolt = <1800000>;
> > > > +             qcom,micbias3-microvolt = <1800000>;
> > > > +             qcom,micbias4-microvolt = <1800000>;
> > > > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > > > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > > > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > > > +             qcom,rx-device = <&wcd_rx>;
> > > > +             qcom,tx-device = <&wcd_tx>;
> > > > +
> > > > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > > > +
> > > > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > > > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > > > +
> > > > +             #sound-dai-cells = <1>;
> > > > +     };
> > > > +
> > > > +     backlight: backlight {
> > > > +             compatible = "pwm-backlight";
> > > > +             pwms = <&pm8550_pwm 3 500000>;
> > > > +
> > > > +             power-supply = <&vreg_edp_bl>;
> > > > +     };
> > > > +
> > > > +     camera {
> > > > +             compatible = "usb5986,1198";
> > > > +
> > > > +             vdd-supply = <&vreg_cam_5p0>;
> > > > +
> > > > +             status = "okay";
> > >
> > > This is default, please drop.
> > >
> > > > +     };
> > >
> > > Camera isn't randomly wire to the board, it is on the USB bus. Please
> > > follow DT bindings and put it accordingly, describing topology of the
> > > bus.
> > >
> > > > +
> > > > +     gpio-keys {
> > > > +             compatible = "gpio-keys";
> > > > +
> > > > +             pinctrl-0 = <&hall_int_n_default>;
> > > > +             pinctrl-names = "default";
> > > > +
> > > > +             switch-lid {
> > > > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > > +                     linux,input-type = <EV_SW>;
> > > > +                     linux,code = <SW_LID>;
> > > > +                     wakeup-source;
> > > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > > +             };
> > > > +     };
> > > > +
> > > > +     pmic-glink {
> > > > +             compatible = "qcom,x1e80100-pmic-glink",
> > > > +                             "qcom,sm8550-pmic-glink",
> > > > +                             "qcom,pmic-glink";
> > >
> > > Align vertically on the double-quote
> > >
> > > > +             #address-cells = <1>;
> > > > +             #size-cells = <0>;
> > > > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
> > >
> > > And such lists should be aligned on the opening angle bracket.
> > >
> > > > +
> > > > +             /* Display-adjacent port */
> > > > +             connector@0 {
> > > > +                     compatible = "usb-c-connector";
> > > > +                     reg = <0>;
> > > > +                     power-role = "dual";
> > > > +                     data-role = "dual";
> > >
> > > Is it actually dual-role? What does UCSI report for it?
> > >
> > > > +
> > > > +                     ports {
> > > > +                             #address-cells = <1>;
> > > > +                             #size-cells = <0>;
> > > > +
> > > > +                             port@0 {
> > > > +                                     reg = <0>;
> > > > +
> > > > +                                     pmic_glink_ss0_hs_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@1 {
> > > > +                                     reg = <1>;
> > > > +
> > > > +                                     pmic_glink_ss0_ss_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@2 {
> > > > +                                     reg = <2>;
> > > > +
> > > > +                                     pmic_glink_ss0_sbu: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > > > +                                     };
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             /* User-adjacent port */
> > > > +             connector@1 {
> > > > +                     compatible = "usb-c-connector";
> > > > +                     reg = <1>;
> > > > +                     power-role = "dual";
> > > > +                     data-role = "dual";
> > > > +
> > > > +                     ports {
> > > > +                             #address-cells = <1>;
> > > > +                             #size-cells = <0>;
> > > > +
> > > > +                             port@0 {
> > > > +                                     reg = <0>;
> > > > +
> > > > +                                     pmic_glink_ss1_hs_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@1 {
> > > > +                                     reg = <1>;
> > > > +
> > > > +                                     pmic_glink_ss1_ss_in: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > > > +                                     };
> > > > +                             };
> > > > +
> > > > +                             port@2 {
> > > > +                                     reg = <2>;
> > > > +
> > > > +                                     pmic_glink_ss1_sbu: endpoint {
> > > > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > > > +                                     };
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     reserved-memory {
> > > > +             linux,cma {
> > >
> > > What for?
> > >
> > > > +                     compatible = "shared-dma-pool";
> > > > +                     size = <0x0 0x8000000>;
> > > > +                     reusable;
> > > > +                     linux,cma-default;
> > > > +             };
> > > > +     };
> > > > +
> > >
> > > [...]
> > >
> > > > +
> > > > +&gpu {
> > > > +     status = "okay";
> > >
> > > I think that you wrote that GPU isn't supported (yet).
> >
> > GPU is not supported on SoC level (x1p42100/purwa), not device
> > specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
> > as per discussion abou purwa GPU and purwa firmware in general [1]: to
> > already include correct filename and firmware path (since these are
> > known) such that once SoC lands the GPU support laptops with that SoC
> > will gain GPU support 'automatically'. As nothing consumes this
> > property (on purwa) just yet, adding it already does not cause any
> > harm.
>
>
> Not quite. A14 specified the firmware name, but didn't enable the GPU.
> This patch actually enables the GPU device. Which means, that we are
> going to probe a driver on an unsupported device, using invalid GPU ids.
>

A14 also enables the GPU, just in the .dsti, not in the purwa .dts.
Though now looking at it, perhaps it's a bit misleading.
Yes you are right, it does give GPU-related error in dmesg, which
appear to be otherwise harmless. Perhaps because `x1p42100.dtsi`
deletes the compatible of the GPU, hence no driver is probing it?

```
[    3.085697] msm_dpu ae01000.display-controller: no GPU device was found
```

Otherwise, if you still say GPU should be disabled regardless, shall I
also disable it on A14's purwa variant?

Alex


> >
> > Jens, as per the same discussion [1] the path is wrong here,
> > s/x1e80100/x1p42100/ for all purwa-specifc firmware. Unless the
> > decision about firmware paths was re-evaluated in Linaro/Qcom?
> >
> > >
> > > > +
> > > > +     zap-shader {
>
> Please use &gpu_zap_shader {} instead.
>
> > > > +             firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
> > > > +     };
> > > > +};
> > > > +
> > > Dmitry
>
> --
> With best wishes
> Dmitry
