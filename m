Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C4264B81E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F6B10E342;
	Tue, 13 Dec 2022 15:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1832F10E32C;
 Tue, 13 Dec 2022 15:10:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BD6HbKM008632; Tue, 13 Dec 2022 15:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=jsojyRLw4w5K9zAAMLQwxivFnFJ40MIyRXCntUwBhrI=;
 b=EwsW1JEfCOB0NPafw/VGHb7+gUQol4gLu+vcmgdcucameMNZh6K5EAPXLjkvLHM1MCEu
 6rM+OaBiZTaqU39fN1qWdLTm5O7A5BmxEoXZwhYpMb4MuHauzXMmytjR1Dcu5Ak+Y0fC
 0FjWBhDilPKYVAYCemsmiF8SPiLElQ9D3HIMKSucCiML+e0AmPCGtqdKWjTP6N772kVY
 a4m8GAN0ZGu9TkD3xLUeFDYyjW/T7vylkaAzzkbMXVeroV09BPempTi18DNwZvPgXN7e
 rqi2vyTIEHjW0XWE0SsE/p0vA6dEhk6BEVdh4zcdEShu08XqcAi528J77vSWe7HfWdQA MA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3me83skbsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 15:10:17 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BDFAGFN015123
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 15:10:16 GMT
Received: from core-thresher1.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 13 Dec 2022 07:10:15 -0800
Date: Tue, 13 Dec 2022 07:10:14 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5 11/12] arm64: dts: qcom: sc8280xp-crd: Enable EDP
Message-ID: <20221213151012.GB16520@core-thresher1.qualcomm.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-12-quic_bjorande@quicinc.com>
 <Y5MPa9l4btcDG9GP@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y5MPa9l4btcDG9GP@hovoldconsulting.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Zf8NCvhJeKGhnxna95V2MZcRY3ZZPs7y
X-Proofpoint-ORIG-GUID: Zf8NCvhJeKGhnxna95V2MZcRY3ZZPs7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130134
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 09, 2022 at 11:35:23AM +0100, Johan Hovold wrote:
> On Wed, Dec 07, 2022 at 02:00:11PM -0800, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > The SC8280XP CRD has a EDP display on MDSS0 DP3, enable relevant nodes
> > and link it together with the backlight control.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> > 
> > Changes since v4:
> > - None
> > 
> >  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 72 ++++++++++++++++++++++-
> >  1 file changed, 71 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > index f09810e3d956..a7d2384cbbe8 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> > @@ -20,7 +20,7 @@ aliases {
> >  		serial0 = &qup2_uart17;
> >  	};
> >  
> > -	backlight {
> > +	backlight: backlight {
> >  		compatible = "pwm-backlight";
> >  		pwms = <&pmc8280c_lpg 3 1000000>;
> >  		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
> > @@ -34,6 +34,22 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	vreg_edp_3p3: regulator-edp-3p3 {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "VREG_EDP_3P3";
> 
> Please use the net name from the schematics here (i.e. "VCC3LCD").
> 

This is the name used in the CRD schematics.

> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&edp_reg_en>;
> > +
> > +		regulator-boot-on;
> > +	};
> > +
> >  	vreg_edp_bl: regulator-edp-bl {
> >  		compatible = "regulator-fixed";
> >  
> > @@ -230,6 +246,54 @@ vreg_l9d: ldo9 {
> >  	};
> >  };
> >  
> > +&dispcc0 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss0 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss0_dp3 {
> > +	compatible = "qcom,sc8280xp-edp";
> > +	status = "okay";
> 
> Please move the status property last (i.e. after data-lanes).
> 

Sorry for missing that.

> > +
> > +	data-lanes = <0 1 2 3>;
> > +
> > +	aux-bus {
> > +		panel {
> > +			compatible = "edp-panel";
> > +			power-supply = <&vreg_edp_3p3>;
> > +
> > +			backlight = <&backlight>;
> > +
> > +			ports {
> > +				port {
> > +					edp_panel_in: endpoint {
> > +						remote-endpoint = <&mdss0_dp3_out>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	ports {
> > +		port@1 {
> > +			reg = <1>;
> > +			mdss0_dp3_out: endpoint {
> > +				remote-endpoint = <&edp_panel_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss0_dp3_phy {
> > +	status = "okay";
> 
> Same here.
> 

Ditto.

> > +
> > +	vdda-phy-supply = <&vreg_l6b>;
> > +	vdda-pll-supply = <&vreg_l3b>;
> > +};
> > +
> >  &pcie2a {
> >  	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> >  	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> > @@ -496,6 +560,12 @@ hastings_reg_en: hastings-reg-en-state {
> >  &tlmm {
> >  	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
> >  
> > +	edp_reg_en: edp-reg-en-state {
> > +		pins = "gpio25";
> > +		function = "gpio";
> > +		output-enable;
> 
> 'output-enable' is not valid for tlmm and causes the settings to be
> rejected:
> 
> 	sc8280xp-tlmm f100000.pinctrl: pin_config_group_set op failed for group 25
> 	reg-fixed-voltage regulator-edp-3p3: Error applying setting, reverse things back
> 

Thanks for spotting that, it doesn't seem to be needed for the gpio-regulator
driver anyways...

Regards,
Bjorn

> > +	};
> > +
> >  	kybd_default: kybd-default-state {
> >  		disable-pins {
> >  			pins = "gpio102";
> 
> Johan
