Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF195824EB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 12:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE712B6C8;
	Wed, 27 Jul 2022 10:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F662C4CE5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 10:56:07 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-31f41584236so62715137b3.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mjMQ0qRmU/1310NaK/npYXdjbft/2ciVTDMOLmcd6d8=;
 b=M8QtHoMHT2ZX/IH5wwfN5DQ9TffusGMKt7Z5VS1LtP+1VSYyULbXG8MLI+9pPzsxAR
 vsVBKofvOIKJuMj/HB6tm3QmUhTaNCLhGh3jyyWDJXhJP7Dyw4YvsCnlOaT9GD5b0++5
 dRCNEQqLLrj2TebpxxTY6wb+COSk8wb8sSq+aONXVthgNOMojdjeNG6cqWSiduyhXRwL
 asXaSfGVXtKqQhkY6P4qzFyKbJCxieDQMFh6h7MBaSGO4Eu3091YgHb3Kw4nmsHc8tUM
 CeP0G0DNRlV1m787Ut0iUYEHKS519RxYRaG/PI4MX5Pb1hcic29Q7Z/hMj0xqBxUNhqe
 FKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mjMQ0qRmU/1310NaK/npYXdjbft/2ciVTDMOLmcd6d8=;
 b=mfrHcZ+6ygCOrUo3UL2+iuQMObNuf8dLgmYqHgXmNWD5VIDs5mNFjL2r/UBH+2JT82
 tXUWqdhnSKXJCMx/mkbPNoXCV3cfKVte8YQtVYn2IxCuO93OamVtUK/lQ+y+XwTT82LL
 7JjXMpdvW5A+1P+5zLpmjltO6y2vuBCm63n4FacYxM2kt3tO0aJsvy0VcCHhXQYkFBVx
 SJs1DaAMKTju2V76ND0Cz1jD0nBnaUjbpIrxaAAcsRIR7pxflflpwP4533gKwVLWLplC
 +fXlrNzspHGUs6QQz3jD7dEYZzDcSUaFljdQNxFekDKkPhO/w12zxrOmwyNihLFzo7hh
 ul0w==
X-Gm-Message-State: AJIora8E9lPUUjK5ovCAV1UiwwkfxuZvwBnu8q+P35Tx41Phb9y/z81b
 6sAXrsSXtgn0eZYQGFfc+EZJANiFysJUtOyJzhGRzA==
X-Google-Smtp-Source: AGRyM1ujYGNIUfU1QaFIC51t34swwopyalb/klZZWdFzTpEVJfLEprpxfCk7YVEhEmKFeD8+cY45TZZMucLdgoY6y/U=
X-Received: by 2002:a0d:f6c5:0:b0:31d:af7d:5d4f with SMTP id
 g188-20020a0df6c5000000b0031daf7d5d4fmr18685619ywf.187.1658919366004; Wed, 27
 Jul 2022 03:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
 <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
In-Reply-To: <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 27 Jul 2022 16:25:29 +0530
Message-ID: <CAMi1Hd3tWco7xbwb2aaHNj3eoJsJbNPkFyfcd0Ct51dA1e22fQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel 3)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

n Tue, 19 Jul 2022 at 03:43, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 19/07/2022 00:30, Caleb Connolly wrote:
> > From: Amit Pundir <amit.pundir@linaro.org>
> >
> > This adds an initial dts for the Blueline (Pixel 3). Supported
> > functionality includes display, Debug UART, UFS, USB-C (peripheral), WiFi,
> > Bluetooth and modem.
> >
> > Bootloader compatible board and msm IDs are needed for the kernel to boot
> > with Pixel3 bootloader, so those are added.
> >
> > GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
> > from the application CPUs, so we mark them as reserved to allow the Pixel 3
> > to boot.
> >
> > The reserved-memory locations where obtained from downstream using
> > kernel logs:
> > https://gist.github.com/calebccff/090d10bfac3cb9e9bd98dda30b054c96
> >
> > The rmtfs region is allocated with UIO, making it technically "dynamic".
> > It's address and size can be read from sysfs:
> >
> > blueline:/ # cat /sys/class/uio/uio0/name
> > rmtfs
> > at /sys/class/uio/uio0/maps/map0/addr
> > 0x00000000f2701000
> > blueline:/ # cat /sys/class/uio/uio0/maps/map0/size
> > 0x0000000000200000
> >
> > Like the OnePlus 6, it needs 1kB reserved on either side of the rmtfs
> > memory to workaround some XPU bug which would otherwise cause erroneous
> > XPU violations when accessing the rmtfs_mem region.
> >
> > For wifi, the pixel 3 reports a board-id of 0xFF, and downstream
> > only includes a single bdwlan file. The qcom,ath10k-calibration-variant
> > property is set to ensure that the correct calibration data is used.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > [AmitP: Cherry-picked and refactored from Bjorn's db845c dts
> >          ("arm64: dts: qcom: Add Dragonboard 845c") https://lkml.org/lkml/2019/6/6/7]
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > [sumits: merged commits to add board and msm ids, gpio range reservation,
> >    ufs device-reset gpio and adaptation to v5.5+ changes]
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > [vinod: Add display nodes]
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > [caleb: remove db845c bits, cleanup, add reserved-memory for modem/wifi]
> > Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>
> Thanks for your patch, few minor items to improve.
>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >   .../boot/dts/qcom/sdm845-google-blueline.dts  | 652 ++++++++++++++++++
> >   2 files changed, 653 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 2f8aec2cc6db..c151e17e6eb7 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -100,6 +100,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sdm845-cheza-r1.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-cheza-r2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-cheza-r3.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-db845c.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      += sdm845-google-blueline.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-mtp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-oneplus-enchilada.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     += sdm845-oneplus-fajita.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> > new file mode 100644
> > index 000000000000..dec979ad9209
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> > @@ -0,0 +1,652 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/dma/qcom-gpi.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "sdm845.dtsi"
> > +#include "pm8998.dtsi"
> > +#include "pmi8998.dtsi"
> > +
> > +/delete-node/ &mpss_region;
> > +/delete-node/ &venus_mem;
> > +/delete-node/ &cdsp_mem;
> > +/delete-node/ &mba_region;
> > +/delete-node/ &slpi_mem;
> > +/delete-node/ &spss_mem;
> > +/delete-node/ &rmtfs_mem;
> > +
> > +/ {
> > +     model = "Google Pixel 3";
> > +     compatible = "google,blueline", "qcom,sdm845";
> > +     qcom,board-id = <0x00021505 0>;
> > +     qcom,msm-id = <321 0x20001>;
> > +
> > +     aliases {
> > +             serial0 = &uart9;
> > +             serial1 = &uart6;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     volume-keys {
> > +             compatible = "gpio-keys";
> > +             label = "Volume keys";
> > +             autorepeat;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&volume_up_gpio>;
> > +
> > +             vol-up {
> > +                     label = "Volume Up";
> > +                     linux,code = <KEY_VOLUMEUP>;
> > +                     gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> > +                     debounce-interval = <15>;
> > +             };
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
>
> These properties are already part of the sdm845.dtsi, so no need to have
> them here.
>
> > +
> > +             mpss_region: memory@8e000000 {
> > +                     reg = <0 0x8e000000 0 0x9800000>;
> > +                     no-map;
> > +             };
> > +
> > +             venus_mem: venus@97800000 {
> > +                     reg = <0 0x97800000 0 0x500000>;
> > +                     no-map;
> > +             };
> > +
> > +             cdsp_mem: cdsp-mem@97D00000 {
> > +                     reg = <0 0x97D00000 0 0x800000>;
> > +                     no-map;
> > +             };
> > +
> > +             mba_region: mba@98500000 {
> > +                     reg = <0 0x98500000 0 0x200000>;
> > +                     no-map;
> > +             };
> > +
> > +             slpi_mem: slpi@98700000 {
> > +                     reg = <0 0x98700000 0 0x1400000>;
> > +                     no-map;
> > +             };
> > +
> > +             spss_mem: spss@99B00000 {
> > +                     reg = <0 0x99B00000 0 0x100000>;
> > +                     no-map;
> > +             };
> > +
> > +             /* rmtfs lower guard */
> > +             memory@f2700000 {
> > +                     reg = <0 0xf2700000 0 0x1000>;
> > +                     no-map;
> > +             };
> > +
> > +             rmtfs_mem: memory@f2701000 {
> > +                     compatible = "qcom,rmtfs-mem";
> > +                     reg = <0 0xf2701000 0 0x200000>;
> > +                     no-map;
> > +
> > +                     qcom,client-id = <1>;
> > +                     qcom,vmid = <15>;
> > +             };
> > +
> > +             /* rmtfs upper guard */
> > +             memory@f2901000 {
> > +                     reg = <0 0xf2901000 0 0x1000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     vph_pwr: vph-pwr-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vph_pwr";
> > +             regulator-min-microvolt = <3700000>;
> > +             regulator-max-microvolt = <3700000>;
> > +     };
> > +
> > +     vreg_s4a_1p8: vreg-s4a-1p8 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vreg_s4a_1p8";
> > +
> > +             regulator-min-microvolt = <1800000>;
> > +             regulator-max-microvolt = <1800000>;
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +
> > +             vin-supply = <&vph_pwr>;
> > +     };
> > +};
> > +
> > +&adsp_pas {
> > +     status = "okay";
> > +
> > +     firmware-name = "qcom/sdm845/pixel3/adsp.mbn";
>
> What about using "qcom/sdm845/blueline/adsp.mbn" instead?
>
> Bjorn, Amit?

qcom/sdm845/blueline/adsp.mbn seems more apt.

>
> > +};
> > +
> > +&apps_rsc {
> > +     pm8998-rpmh-regulators {
> > +             compatible = "qcom,pm8998-rpmh-regulators";
> > +             qcom,pmic-id = "a";
> > +             vdd-s1-supply = <&vph_pwr>;
> > +             vdd-s2-supply = <&vph_pwr>;
> > +             vdd-s3-supply = <&vph_pwr>;
> > +             vdd-s4-supply = <&vph_pwr>;
> > +             vdd-s5-supply = <&vph_pwr>;
> > +             vdd-s6-supply = <&vph_pwr>;
> > +             vdd-s7-supply = <&vph_pwr>;
> > +             vdd-s8-supply = <&vph_pwr>;
> > +             vdd-s9-supply = <&vph_pwr>;
> > +             vdd-s10-supply = <&vph_pwr>;
> > +             vdd-s11-supply = <&vph_pwr>;
> > +             vdd-s12-supply = <&vph_pwr>;
> > +             vdd-s13-supply = <&vph_pwr>;
> > +             vdd-l1-l27-supply = <&vreg_s7a_1p025>;
> > +             vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> > +             vdd-l3-l11-supply = <&vreg_s7a_1p025>;
> > +             vdd-l4-l5-supply = <&vreg_s7a_1p025>;
> > +             vdd-l6-supply = <&vph_pwr>;
> > +             vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> > +             vdd-l9-supply = <&vreg_bob>;
> > +             vdd-l10-l23-l25-supply = <&vreg_bob>;
> > +             vdd-l13-l19-l21-supply = <&vreg_bob>;
> > +             vdd-l16-l28-supply = <&vreg_bob>;
> > +             vdd-l18-l22-supply = <&vreg_bob>;
> > +             vdd-l20-l24-supply = <&vreg_bob>;
> > +             vdd-l26-supply = <&vreg_s3a_1p35>;
> > +             vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
> > +
> > +             vreg_s3a_1p35: smps3 {
> > +                     regulator-min-microvolt = <1352000>;
> > +                     regulator-max-microvolt = <1352000>;
> > +             };
> > +
> > +             vreg_s5a_2p04: smps5 {
> > +                     regulator-min-microvolt = <1904000>;
> > +                     regulator-max-microvolt = <2040000>;
> > +             };
> > +
> > +             vreg_s7a_1p025: smps7 {
> > +                     regulator-min-microvolt = <900000>;
> > +                     regulator-max-microvolt = <1028000>;
> > +             };
> > +
> > +             vdda_mipi_dsi0_pll:
>
> Do we need this alias?
>
> > +             vreg_l1a_0p875: ldo1 {
> > +                     regulator-min-microvolt = <880000>;
> > +                     regulator-max-microvolt = <880000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> > +             };
> > +
> > +             vreg_l5a_0p8: ldo5 {
> > +                     regulator-min-microvolt = <800000>;
> > +                     regulator-max-microvolt = <800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l12a_1p8: ldo12 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l7a_1p8: ldo7 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l13a_2p95: ldo13 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <2960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l14a_1p88: ldo14 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> > +                     /*
> > +                      * We can't properly bring the panel back if it gets turned off
> > +                      * so keep it's regulators always on for now.
> > +                      */
>
> Any idea, what is the issue here? Do you have the datasheet for the panel?
>
> > +                     regulator-always-on;
> > +             };
> > +
> > +             vreg_l17a_1p3: ldo17 {
> > +                     regulator-min-microvolt = <1304000>;
> > +                     regulator-max-microvolt = <1304000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l19a_3p3: ldo19 {
> > +                     regulator-min-microvolt = <3300000>;
> > +                     regulator-max-microvolt = <3312000>;
> > +                     qcom,init-voltage = <3300000>;
> > +                     qcom,initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     /*
> > +                      * The touchscreen needs this to be 3.3v, which is apparently
> > +                      * quite close to the hardware limit for this LDO (3.312v)
> > +                      * It must be kept in high power mode to prevent TS brownouts
> > +                      */
> > +                     regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l20a_2p95: ldo20 {
> > +                     regulator-min-microvolt = <2960000>;
> > +                     regulator-max-microvolt = <2968000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l21a_2p95: ldo21 {
> > +                     regulator-min-microvolt = <2960000>;
> > +                     regulator-max-microvolt = <2968000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l24a_3p075: ldo24 {
> > +                     regulator-min-microvolt = <3088000>;
> > +                     regulator-max-microvolt = <3088000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vreg_l25a_3p3: ldo25 {
> > +                     regulator-min-microvolt = <3300000>;
> > +                     regulator-max-microvolt = <3312000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +             };
> > +
> > +             vdda_mipi_dsi0_1p2:
>
> Do we need this alias?
>
> > +             vreg_l26a_1p2: ldo26 {
> > +                     regulator-min-microvolt = <1200000>;
> > +                     regulator-max-microvolt = <1200000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> > +             };
> > +
> > +             vreg_l28a_3p0: ldo28 {
> > +                     regulator-min-microvolt = <2856000>;
> > +                     regulator-max-microvolt = <3008000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> > +                     /*
> > +                      * We can't properly bring the panel back if it gets turned off
> > +                      * so keep it's regulators always on for now.
> > +                      */
> > +                     regulator-always-on;
> > +             };
> > +     };
> > +
> > +     pmi8998-rpmh-regulators {
> > +             compatible = "qcom,pmi8998-rpmh-regulators";
> > +             qcom,pmic-id = "b";
> > +
> > +             vdd-bob-supply = <&vph_pwr>;
> > +
> > +             vreg_bob: bob {
> > +                     regulator-min-microvolt = <3312000>;
> > +                     regulator-max-microvolt = <3600000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> > +                     regulator-allow-bypass;
> > +             };
> > +     };
> > +
> > +     pm8005-rpmh-regulators {
> > +             compatible = "qcom,pm8005-rpmh-regulators";
> > +             qcom,pmic-id = "c";
> > +
> > +             vdd-s1-supply = <&vph_pwr>;
> > +             vdd-s2-supply = <&vph_pwr>;
> > +             vdd-s3-supply = <&vph_pwr>;
> > +             vdd-s4-supply = <&vph_pwr>;
> > +
> > +             vreg_s3c_0p6: smps3 {
> > +                     regulator-min-microvolt = <600000>;
> > +                     regulator-max-microvolt = <600000>;
> > +             };
> > +     };
> > +};
> > +
> > +&cdsp_pas {
> > +     status = "okay";
> > +     firmware-name = "qcom/sdm845/pixel3/cdsp.mbn";
> > +};
> > +
> > +&dsi0 {
> > +     status = "okay";
> > +     vdda-supply = <&vdda_mipi_dsi0_1p2>;
> > +
> > +     ports {
> > +             port@1 {
> > +                     endpoint {
> > +                             remote-endpoint = <&lg_sw43408_in_0>;
> > +                             data-lanes = <0 1 2 3>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     panel@0 {
> > +             compatible = "lg,sw43408";
> > +             reg = <0>;
> > +
> > +             vddi-supply = <&vreg_l14a_1p88>;
> > +             vpnl-supply = <&vreg_l28a_3p0>;
> > +
> > +             reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins>;
> > +
> > +             ports {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     port@0 {
> > +                             reg = <0>;
> > +                             lg_sw43408_in_0: endpoint {
> > +                                     remote-endpoint = <&dsi0_out>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&dsi0_out {
> > +     remote-endpoint = <&lg_sw43408_in_0>;
> > +     data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&dsi0_phy {
> > +     status = "okay";
> > +     vdds-supply = <&vdda_mipi_dsi0_pll>;
> > +};
> > +
> > +&gcc {
> > +     protected-clocks = <GCC_QSPI_CORE_CLK>,
> > +                        <GCC_QSPI_CORE_CLK_SRC>,
> > +                        <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
> > +};
> > +
> > +&gmu {
> > +     status = "okay";
> > +};
> > +
> > +&gpi_dma0 {
> > +     status = "okay";
> > +};
> > +
> > +&gpu {
> > +     status = "okay";
> > +
> > +     zap-shader {
> > +             memory-region = <&gpu_mem>;
> > +             firmware-name = "qcom/sdm845/pixel3/a630_zap.mbn";
> > +     };
> > +};
> > +
> > +&ipa {
> > +     status = "okay";
> > +
> > +     firmware-name = "qcom/sdm845/pixel3/ipa_fws.mbn";
> > +};
> > +
> > +&mss_pil {
> > +     status = "okay";
> > +     firmware-name = "qcom/sdm845/pixel3/mba.mbn", "qcom/sdm845/pixel3/modem.mbn";
> > +};
> > +
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_mdp {
> > +     status = "okay";
> > +};
>
> Not necessary, it is a default state since the commit 4a5622c1d975
> ("arm64: dts: qcom: sdm845: Don't disable MDP explicitly")
>
> > +
> > +&pm8998_gpio {
> > +     volume_up_gpio: vol-up-active {
> > +             pins = "gpio6";
> > +             function = "normal";
> > +             input-enable;
> > +             bias-pull-up;
> > +             qcom,drive-strength = <0>;
> > +     };
> > +
> > +     panel_pmgpio_pins: panel-pmgpio-active {
> > +             pins = "gpio2", "gpio5";
> > +             function = "normal";
> > +             input-enable;
> > +             bias-disable;
> > +             power-source = <0>;
> > +     };
> > +};
> > +
> > +&pm8998_pon {
> > +     resin {
> > +             compatible = "qcom,pm8941-resin";
> > +             interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> > +             debounce = <15625>;
> > +             bias-pull-up;
> > +             linux,code = <KEY_VOLUMEDOWN>;
> > +     };
>
> Please move the (disabled, labelled) resin device to pm8998.dtsi and
> just add status = "okay" here.
>
> > +};
> > +
> > +&qupv3_id_0 {
> > +     status = "okay";
> > +};
> > +
> > +&qupv3_id_1 {
> > +     status = "okay";
> > +};
> > +
> > +&qup_uart6_default {
> > +     pinmux {
> > +             pins = "gpio45", "gpio46", "gpio47", "gpio48";
> > +             function = "qup6";
> > +     };
> > +
> > +     cts {
> > +             pins = "gpio45";
> > +             bias-disable;
> > +     };
> > +
> > +     rts-tx {
> > +             pins = "gpio46", "gpio47";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     rx {
> > +             pins = "gpio48";
> > +             bias-pull-up;
> > +     };
> > +};
> > +
> > +&qup_uart9_default {
> > +     pinconf-tx {
> > +             pins = "gpio4";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +
> > +     pinconf-rx {
> > +             pins = "gpio5";
> > +             drive-strength = <2>;
> > +             bias-pull-up;
> > +     };
> > +};
> > +
> > +&tlmm {
> > +     gpio-reserved-ranges = <0 4>, <81 4>;
> > +
> > +     panel_te_pin: panel-te {
> > +             mux {
> > +                     pins = "gpio12";
> > +                     function = "mdp_vsync";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +                     input-enable;
> > +             };
> > +     };
> > +
> > +     panel_reset_pins: panel-active {
> > +             mux {
> > +                     pins = "gpio6", "gpio52";
> > +                     function = "gpio";
> > +                     drive-strength = <8>;
> > +                     bias-disable = <0>;
> > +             };
> > +     };
> > +
> > +     panel_suspend: panel-suspend {
> > +             mux {
> > +                     pins = "gpio6", "gpio52";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-pull-down;
> > +             };
> > +     };
> > +
> > +     touchscreen_reset: ts-reset {
> > +             mux {
> > +                     pins = "gpio99";
> > +                     function = "gpio";
> > +                     drive-strength = <8>;
> > +                     bias-pull-up;
> > +                     //output-high;
>
> debug, can be removed?
>
> > +             };
> > +     };
> > +
> > +     touchscreen_pins: ts-pins {
> > +             mux {
> > +                     pins = "gpio125";
> > +                     function = "gpio";
> > +                     drive-strength = <2>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     touchscreen_i2c_pins: qup-i2c2-gpio {
> > +             pins = "gpio27", "gpio28";
> > +             function = "gpio";
> > +
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +     };
> > +};
> > +
> > +&uart6 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             compatible = "qcom,wcn3990-bt";
> > +
> > +             vddio-supply = <&vreg_s4a_1p8>;
> > +             vddxo-supply = <&vreg_l7a_1p8>;
> > +             vddrf-supply = <&vreg_l17a_1p3>;
> > +             vddch0-supply = <&vreg_l25a_3p3>;
> > +             max-speed = <3200000>;
> > +     };
> > +};
> > +
> > +&uart9 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1 {
> > +     status = "okay";
> > +};
> > +
> > +&usb_1_dwc3 {
> > +     dr_mode = "peripheral";
> > +};
> > +
> > +&usb_1_hsphy {
> > +     status = "okay";
> > +
> > +     vdd-supply = <&vreg_l1a_0p875>;
> > +     vdda-pll-supply = <&vreg_l12a_1p8>;
> > +     vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> > +
> > +     qcom,imp-res-offset-value = <8>;
> > +     qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> > +     qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> > +     qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> > +};
> > +
> > +&usb_1_qmpphy {
> > +     status = "okay";
> > +
> > +     vdda-phy-supply = <&vreg_l26a_1p2>;
> > +     vdda-pll-supply = <&vreg_l1a_0p875>;
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
> > +     status = "okay";
> > +
> > +     vdd-supply = <&vreg_l1a_0p875>;
> > +     vdda-pll-supply = <&vreg_l12a_1p8>;
> > +     vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
> > +
> > +     qcom,imp-res-offset-value = <8>;
> > +     qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
> > +};
> > +
> > +&usb_2_qmpphy {
> > +     status = "okay";
> > +
> > +     vdda-phy-supply = <&vreg_l26a_1p2>;
> > +     vdda-pll-supply = <&vreg_l1a_0p875>;
> > +};
> > +
> > +&ufs_mem_hc {
> > +     status = "okay";
> > +
> > +     reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> > +
> > +     vcc-supply = <&vreg_l20a_2p95>;
> > +     vcc-max-microamp = <800000>;
> > +};
> > +
> > +&ufs_mem_phy {
> > +     status = "okay";
> > +
> > +     vdda-phy-supply = <&vreg_l1a_0p875>;
> > +     vdda-pll-supply = <&vreg_l26a_1p2>;
> > +};
> > +
> > +&venus {
> > +     status = "okay";
> > +     firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
>
> Why are you using the oneplus6 here?
>
> > +};
> > +
> > +&wifi {
> > +     status = "okay";
> > +
> > +     vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> > +     vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> > +     vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> > +     vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> > +
> > +     qcom,snoc-host-cap-8bit-quirk;
> > +     qcom,ath10k-calibration-variant = "google_blueline";
>
> Ideally Kalle Valo should bless this string, added him to the Cc list.
> Could you please submit the board file to the ath10k (see [1] for the
> description and [2] for an example).
>
>
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles
> [2]
> https://lore.kernel.org/ath10k/CAA8EJpphUrxr5gtW0=-tZh-DrKXmHkfFxWMvYRpTUGuCesGCbw@mail.gmail.com/T/#u
>
> > +};
>
>
> --
> With best wishes
> Dmitry
