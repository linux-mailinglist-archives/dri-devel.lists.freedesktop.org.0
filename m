Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C4265C4CA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 18:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC2510E270;
	Tue,  3 Jan 2023 17:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852BB10E270;
 Tue,  3 Jan 2023 17:11:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303GkE13032564; Tue, 3 Jan 2023 17:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=r7DQyXh5gAucigmedJ3yha+lh4GmJ5T3l2qn9I7r4KE=;
 b=Ire6fu8w+NwlSEnZKlA1hBoe2/3JZgYUjlJMqatOErGi8/X8P8dBDxeiAGrhoamBoE+x
 qQyWzThSIRWrS6KbsNfVqkjHWVT+ix6qEObgHIHUBL2bSGb/hKlLZvmiYqNaLXMEjGsF
 1KPb/Q0YC8eEdD/tViF8Q8n6nlLMaRslf21uWJIOKNcusNXSDqTiBFwk4vzymQlKe+TA
 fvpw3eyeBhSazBzl484DyIgFkOjoQkpJnEGtHyycJcJSWjP4HVCwHq5Xl4bvYbsk67K2
 L1gyXLaOOq7oudt5HDaordr7mr+ZpGZxmg70RD0puNZbc9673k2MB7U3LhnOsDHdzaed dA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvqrp83ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:11:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 303HBa6W009687
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Jan 2023 17:11:36 GMT
Received: from [10.110.6.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 09:11:35 -0800
Message-ID: <e5e8a6ae-29cf-beb2-e2b2-1875cb3a84e1@quicinc.com>
Date: Tue, 3 Jan 2023 09:11:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v16 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
 <airlied@gmail.com>
References: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
 <1672163103-31254-2-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1672163103-31254-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZjAL-29wo2191xPuriAZaZuRWO6NsmsO
X-Proofpoint-GUID: ZjAL-29wo2191xPuriAZaZuRWO6NsmsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030147
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof/Dmitry,

Would you please review this patch.

Thanks,


On 12/27/2022 9:44 AM, Kuogee Hsieh wrote:
> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> add link-frequencies property into dp_out endpoint as well. The last
> frequency specified at link-frequencies will be the max link rate
> supported by DP.
>
> Changes in v5:
> -- revert changes at sc7180.dtsi and sc7280.dtsi
> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>
> Changes in v6:
> -- add data-lanes and link-frequencies to yaml
>
> Changes in v7:
> -- change 160000000 to 1620000000
> -- separate yaml to different patch
>
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
>
> Changes in v9:
> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
>
> Changes in v13:
> -- delete an extra space at data-lanes
>
> Changes in v15:
> -- replace space with tab at sc7180-trogdor.dtsi
>
> Changes in v16:
> -- rename dp_out with mdss_dp_Out and keep the order
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 4 ++++
>   arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 +-
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi           | 2 +-
>   4 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index eae22e6..21fbaff 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dp_hot_plug_det>;
> +};
> +
> +&mdss_dp_out {
>   	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>   };
>   
>   &pm6150_adc {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 58976a1b..0a90cce 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3119,7 +3119,7 @@
>   
>   					port@1 {
>   						reg = <1>;
> -						dp_out: endpoint { };
> +						mdss_dp_out: endpoint { };
>   					};
>   				};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index c11e371..3f6f1c9 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dp_hot_plug_det>;
> +};
> +
> +&mdss_dp_out {
>   	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>   };
>   
>   &mdss_mdp {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 2125803..43ef6dc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4135,7 +4135,7 @@
>   
>   					port@1 {
>   						reg = <1>;
> -						dp_out: endpoint { };
> +						mdss_dp_out: endpoint { };
>   					};
>   				};
>   
