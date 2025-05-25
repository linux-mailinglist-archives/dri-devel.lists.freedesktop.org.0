Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC9AC34F5
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 15:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CC910E0E3;
	Sun, 25 May 2025 13:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe7OBZkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110010E0E3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:33:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P6V4nw009151
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sr1TsSZVLIMUajNCFZZmPhaJ
 dSRDwjHf764TrKM8owI=; b=Pe7OBZkOEpjQwUXTxBxkuSUFMIZa1FnAlnsQNi0H
 TMe8jBEyRCqQOj53WGaJBQKhRHbRb/7v44/miRjhbVSF1+cQe1wJnr5bcHeLuU6J
 VSgUhzy+dCHiX/gkRdFhLuv1xXIT/IpgGOTkvCd+SoJzDZZVizzDl1/IjdmjCwFm
 zosk78EHlDy30o0w0Eir1IBc98+kinWLoopGYz4m+Zk5hsLHjLAHCj5FLJU4WND4
 8rBRMgpu/9Bm9IqNr1xcIi2szKJmt8upJSPaPzQ7YDy63BQw2yNUauAjF5Ymi+uB
 fEujLGgWRotPuIErS8LQnW1j6SU9crYnMZXF55oOBoRWEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52ut4mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 13:33:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8e7b78eebso39539096d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 06:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748180005; x=1748784805;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sr1TsSZVLIMUajNCFZZmPhaJdSRDwjHf764TrKM8owI=;
 b=ZYMIlEigWkJeZQn5mMV+rsCWCk3thIPojJCvZ0xXQvviRUEivQIkco5RuBbVdXmqzA
 ZaS6F/5znEj74MZBb+iOXH+6kUYIy0X6wV0EnV4WPNTLUYAtCgWqzdDkBs8A+lZV8xGz
 bBBlFH4rSNjr+v4VMMG3DjOTW32RuncN9xlbmScpK2x/D1dW8ceAtVtOeGtSkha8PCyB
 wbkl0zuHVoTCyIAijU4NLnY+WdteZTJeNqL06P8p87W2lHFXGH0x2brKF/JxsYgHlRhE
 DYA4VuhAl7bhoT3R0sez432m9wUhhM9zwEe9MzN7AGbnW1GAAGuq1NkZix6ofAA4AmWK
 BQOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbksBzyTs5rDS40JWhioB3cEK5B6fWnoq0NGzyTvK5GPOa9Tqc0Uz/e7KRjm6u8eogsL5VNdOL/wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOUM0XoKLRJzXe5RSPg8nNeFGpDWfMcTrGTMtVNbG5WLzZyNw1
 RfpHiEZgTlEwWxwz06T/1ClUvMJrzq96jVcy31gc+qzuM8eqMWOASBC3pjS+j0/LuXdehHERNXn
 ZcCRjZ+uuivGnrE/PKAOSqaSAUd42zL1yO2PjUez2sFjNsGpbb3rcnKd6v+RnDI5URrG+T9I=
X-Gm-Gg: ASbGncuvQMqk9CuPScQTUmWIOK1BzEc+0PcK+LVs+RkcjqKGt9ZfQ7NyNAJ/n8NHywj
 gLaGui66YPplpM/aiF4ESFsAtIzr2qtQ6m+mUd49rpubmGnP77aF+fWqRjjIk9Uk7qznlTNfox+
 uOWM3ZcohxRdlGTWTN0ezGJlhIOZBTe0bP8Eg9mFIwmqkp1NtgF5IgvAx8+27fXt2oLsABYAKGC
 w8tmAG1x1fKywVTNiZUdt361xOpyd1/QM+KF/YrJsZgPOr3KfdMfthbql7FNRkEz/HnOt1iV3rt
 gOZowe2jD/GyHPEyTm8KTVTHP6+03dpMdFidlJhWhdSkmZ2HwrIbmAS85t6suZh0cT0aetsLklg
 =
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id
 6a1803df08f44-6fa9d2b220dmr90231186d6.42.1748180005055; 
 Sun, 25 May 2025 06:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+LZAYnSbnaUqWwjG/6ouEnWc4XME/bGtrC+FYOjd6420KUE0SJpeIOfIR6bCBRvvvIOAYuw==
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id
 6a1803df08f44-6fa9d2b220dmr90230616d6.42.1748180004539; 
 Sun, 25 May 2025 06:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702bb0csm4649021e87.166.2025.05.25.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 06:33:23 -0700 (PDT)
Date: Sun, 25 May 2025 16:33:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyNSBTYWx0ZWRfX6B0yq8NXvGEM
 zbdcx/EIMe38C1XDm6D3ocwfkTTPOfB9FgvvRLohm5gto0ZzZ+29cNXi4z5RY7731ohgamILons
 rmm2h/1H1oBw33lMdJZd4/YZrS1h4JNXSMgaTqOrBpq4tWX9hjDQT8KynNZcFmePM1FGPvh2k6+
 fCsQQYUvWn3lIHwYcU15ADbtagdgD7oPXwXUJNf5y2soMcRZ0zNCMUXk4FirNrNo0jY72eFUeHk
 UyPObPN7G74K9X/jAUFjg+am3TDlAaGU41VL+pfvIZCcb1vlQcykkgZNHcBXcKd+hhAswY6jm8F
 1fQ6OJK6/uKa8dswAWXdShRpRio2YHeAmSQIPujOgcnNWlaxkKNZOmoMUXBrhY4rDadT60oMjSO
 Sw5lkGe5Y//tEoYLU4pk4VglQrxGi9w7amEFoHKVUAUJpuD9z98iPO3ST3v8kwdk8zVnqfsE
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=68331c26 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=LE4hBVKD_bKaGKlX-QQA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: Y5CB9T5AcGgHlFv22VfCpiAbrcaZeq8o
X-Proofpoint-GUID: Y5CB9T5AcGgHlFv22VfCpiAbrcaZeq8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250125
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

On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > >
> > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > >
> > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> > >
> > > Supported features:
> > >
> > > - USB type-c and type-a ports
> > > - Keyboard
> > > - Touchpad (all that are described in the dsdt)
> > > - Touchscreen (described in the dsdt, no known SKUss)
> > > - Display including PWM backlight control
> > > - PCIe devices
> > > - nvme
> > > - SDHC card reader
> > > - ath12k WCN7850 Wifi and Bluetooth
> > > - ADSP and CDSP
> > > - GPIO keys (Lid switch)
> > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > - DP Altmode with 2 lanes (as all of these still do)
> > > - Integrated fingerprint reader (FPC)
> > > - Integrated UVC camera
> > >
> > > Not supported yet:
> > >
> > > - HDMI port.
> > > - EC and some fn hotkeys.
> > >
> > > Limited support yet:
> > >
> > > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > > but not UHS-I (SD104) and UHS-II.
> > >
> > > - The GPU is not yet supported. Graphics is only software rendered.
> > >
> > > This work was done without any schematics or non-public knowledge of the device.
> > > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > > @43).
> > >
> > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> > >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> > >  3 files changed, 1659 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> > >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> > >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> > >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > > +
> >
> > No need for an extra empty line.
> >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > @@ -170,7 +170,7 @@ trip1 {
> > >                       };
> > >               };
> > >
> > > -             pm8010-thermal {
> > > +             pm8010_thermal: pm8010-thermal {
> > >                       polling-delay-passive = <100>;
> > >
> > >                       thermal-sensors = <&pm8010_temp_alarm>;
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > @@ -0,0 +1,1655 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2024, Linaro Limited
> > > + * Copyright (c) 2025, Jens Glathe
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/gpio-keys.h>
> > > +#include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > +
> > > +#include "x1p42100.dtsi"
> > > +#include "x1e80100-pmics.dtsi"
> > > +
> > > +/delete-node/ &pmc8380_6;
> > > +/delete-node/ &pmc8380_6_thermal;
> > > +/delete-node/ &pm8010;
> > > +/delete-node/ &pm8010_thermal;
> > > +
> > > +/ {
> > > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > > +     chassis-type = "laptop";
> > > +
> > > +     aliases {
> > > +             serial0 = &uart21;
> > > +             serial1 = &uart14;
> > > +     };
> > > +
> > > +     wcd938x: audio-codec {
> > > +             compatible = "qcom,wcd9385-codec";
> > > +
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&wcd_default>;
> > > +
> > > +             qcom,micbias1-microvolt = <1800000>;
> > > +             qcom,micbias2-microvolt = <1800000>;
> > > +             qcom,micbias3-microvolt = <1800000>;
> > > +             qcom,micbias4-microvolt = <1800000>;
> > > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > > +             qcom,rx-device = <&wcd_rx>;
> > > +             qcom,tx-device = <&wcd_tx>;
> > > +
> > > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > > +
> > > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > > +
> > > +             #sound-dai-cells = <1>;
> > > +     };
> > > +
> > > +     backlight: backlight {
> > > +             compatible = "pwm-backlight";
> > > +             pwms = <&pm8550_pwm 3 500000>;
> > > +
> > > +             power-supply = <&vreg_edp_bl>;
> > > +     };
> > > +
> > > +     camera {
> > > +             compatible = "usb5986,1198";
> > > +
> > > +             vdd-supply = <&vreg_cam_5p0>;
> > > +
> > > +             status = "okay";
> >
> > This is default, please drop.
> >
> > > +     };
> >
> > Camera isn't randomly wire to the board, it is on the USB bus. Please
> > follow DT bindings and put it accordingly, describing topology of the
> > bus.
> >
> > > +
> > > +     gpio-keys {
> > > +             compatible = "gpio-keys";
> > > +
> > > +             pinctrl-0 = <&hall_int_n_default>;
> > > +             pinctrl-names = "default";
> > > +
> > > +             switch-lid {
> > > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > +                     linux,input-type = <EV_SW>;
> > > +                     linux,code = <SW_LID>;
> > > +                     wakeup-source;
> > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > +             };
> > > +     };
> > > +
> > > +     pmic-glink {
> > > +             compatible = "qcom,x1e80100-pmic-glink",
> > > +                             "qcom,sm8550-pmic-glink",
> > > +                             "qcom,pmic-glink";
> >
> > Align vertically on the double-quote
> >
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
> >
> > And such lists should be aligned on the opening angle bracket.
> >
> > > +
> > > +             /* Display-adjacent port */
> > > +             connector@0 {
> > > +                     compatible = "usb-c-connector";
> > > +                     reg = <0>;
> > > +                     power-role = "dual";
> > > +                     data-role = "dual";
> >
> > Is it actually dual-role? What does UCSI report for it?
> >
> > > +
> > > +                     ports {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +
> > > +                                     pmic_glink_ss0_hs_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg = <1>;
> > > +
> > > +                                     pmic_glink_ss0_ss_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@2 {
> > > +                                     reg = <2>;
> > > +
> > > +                                     pmic_glink_ss0_sbu: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             /* User-adjacent port */
> > > +             connector@1 {
> > > +                     compatible = "usb-c-connector";
> > > +                     reg = <1>;
> > > +                     power-role = "dual";
> > > +                     data-role = "dual";
> > > +
> > > +                     ports {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +
> > > +                                     pmic_glink_ss1_hs_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg = <1>;
> > > +
> > > +                                     pmic_glink_ss1_ss_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@2 {
> > > +                                     reg = <2>;
> > > +
> > > +                                     pmic_glink_ss1_sbu: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     reserved-memory {
> > > +             linux,cma {
> >
> > What for?
> >
> > > +                     compatible = "shared-dma-pool";
> > > +                     size = <0x0 0x8000000>;
> > > +                     reusable;
> > > +                     linux,cma-default;
> > > +             };
> > > +     };
> > > +
> >
> > [...]
> >
> > > +
> > > +&gpu {
> > > +     status = "okay";
> >
> > I think that you wrote that GPU isn't supported (yet).
> 
> GPU is not supported on SoC level (x1p42100/purwa), not device
> specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
> as per discussion abou purwa GPU and purwa firmware in general [1]: to
> already include correct filename and firmware path (since these are
> known) such that once SoC lands the GPU support laptops with that SoC
> will gain GPU support 'automatically'. As nothing consumes this
> property (on purwa) just yet, adding it already does not cause any
> harm.


Not quite. A14 specified the firmware name, but didn't enable the GPU.
This patch actually enables the GPU device. Which means, that we are
going to probe a driver on an unsupported device, using invalid GPU ids.

> 
> Jens, as per the same discussion [1] the path is wrong here,
> s/x1e80100/x1p42100/ for all purwa-specifc firmware. Unless the
> decision about firmware paths was re-evaluated in Linaro/Qcom?
> 
> >
> > > +
> > > +     zap-shader {

Please use &gpu_zap_shader {} instead.

> > > +             firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
> > > +     };
> > > +};
> > > +
> > Dmitry

-- 
With best wishes
Dmitry
