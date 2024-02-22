Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0413B85F033
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 04:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6251710E86A;
	Thu, 22 Feb 2024 03:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nOWL5E2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87410E869;
 Thu, 22 Feb 2024 03:51:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M3P4kg023077; Thu, 22 Feb 2024 03:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=bBrRt8+UcRRQOmueHEAeP
 jB5q/POTrKdOmEwEWV+9mc=; b=nOWL5E2HFx2aZP4RUQ1ReMiFa9AyBE7F8QQLa
 DHQDGbbmgGlQ79L/RzberhIjyZpY4S4E2DE+MUv9Gv5J8CLQHW9UcGzc5Q49u66w
 JY+H0XitAA8jWMDbkQPXnSZGPRu7SXT9dqZFCx/vERMMbXXIIDQfOHo8Jmes/GZ9
 Iim3tkQ9XL5XUg4EMr1spChf2IChTA+iYMoovdmKXkvt8ItehLo7dSItJ93F6EsO
 tOdFTbfnrr99fcOFDhf17lnKirF09/ZErmGm3oBSbCAZmUnOkMJaRjW1xSIY1am5
 SFGCCm4n0QDsxQkgnwsoA4OXoIxSqg7p2zTrK6KN5CBhZDH4w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdpe6s0jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:51:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M3pkdD006448
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 03:51:46 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 21 Feb 2024 19:51:45 -0800
Date: Wed, 21 Feb 2024 19:51:44 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, <cros-qcom-dts-watchers@chromium.org>, "Bjorn
 Andersson" <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB role
 switching
Message-ID: <20240222035144.GH2936378@hu-bjorande-lv.qualcomm.com>
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-6-dc0964ef7d96@quicinc.com>
 <CAA8EJppAVehWUeLAqEAq8A3nq-o2g=8GK--XRVWtDV7-0BCskA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJppAVehWUeLAqEAq8A3nq-o2g=8GK--XRVWtDV7-0BCskA@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JXx_JMRckSe4prl6xmUmKQSKHx8TnlNv
X-Proofpoint-ORIG-GUID: JXx_JMRckSe4prl6xmUmKQSKHx8TnlNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_01,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220027
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

On Thu, Feb 22, 2024 at 01:50:12AM +0200, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > With the ADSP remoteproc loaded pmic_glink can be introduced and wired
> > up to provide role and orientation switching signals.
> >
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 +++++++++++++++++++++++++++-
> >  1 file changed, 47 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > index ab498494caea..079bf43b14cc 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > @@ -121,6 +121,41 @@ debug_vm_mem: debug-vm@d0600000 {
> >                 };
> >         };
> >
> > +       pmic-glink {
> > +               compatible = "qcom,qcm6490-pmic-glink", "qcom,pmic-glink";
> > +
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               connector@0 {
> > +                       compatible = "usb-c-connector";
> > +                       reg = <0>;
> > +                       power-role = "dual";
> > +                       data-role = "dual";
> > +
> > +                       ports {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               port@0 {
> > +                                       reg = <0>;
> > +
> > +                                       pmic_glink_hs_in: endpoint {
> > +                                               remote-endpoint = <&usb_1_dwc3_hs>;
> > +                                       };
> > +                               };
> > +
> > +                               port@1 {
> > +                                       reg = <1>;
> > +
> > +                                       pmic_glink_ss_in: endpoint {
> > +                                               remote-endpoint = <&usb_1_dwc3_ss>;
> 
> This should be connected to the QMP PHY rather than to the USB host.
> 

Ahh, you're right, otherwise the orientation-switch below isn't of much
use.

> Also it might be better to squash this patch with the patch 8. Or at
> least to get redriver into the picture in this patch (and keep only
> display-related parts in that patch).
> 

The idea was to only bring in the pmic-glink here and then do the
plumbing between all the components separately, but I guess the
orientation-switch in the redriver means that it should go here as
well...

I'll shuffle this into something that makes sense.

Thanks,
Bjorn

> 
> > +                                       };
> > +                               };
> > +                       };
> > +               };
> > +       };
> > +
> >         vph_pwr: vph-pwr-regulator {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "vph_pwr";
> > @@ -476,7 +511,16 @@ &usb_1 {
> >  };
> >
> >  &usb_1_dwc3 {
> > -       dr_mode = "peripheral";
> > +       dr_mode = "otg";
> > +       usb-role-switch;
> > +};
> > +
> > +&usb_1_dwc3_hs {
> > +       remote-endpoint = <&pmic_glink_hs_in>;
> > +};
> > +
> > +&usb_1_dwc3_ss {
> > +       remote-endpoint = <&pmic_glink_ss_in>;
> >  };
> >
> >  &usb_1_hsphy {
> > @@ -491,6 +535,8 @@ &usb_1_qmpphy {
> >         vdda-phy-supply = <&vreg_l6b_1p2>;
> >         vdda-pll-supply = <&vreg_l1b_0p912>;
> >
> > +       orientation-switch;
> > +
> >         status = "okay";
> >  };
> >
> >
> > --
> > 2.25.1
> >
> 
> 
> --
> With best wishes
> Dmitry
