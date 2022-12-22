Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4E654507
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 17:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769B510E16B;
	Thu, 22 Dec 2022 16:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FF010E168;
 Thu, 22 Dec 2022 16:22:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMDRVQ5002035; Thu, 22 Dec 2022 16:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=85s9GL61Q+5hGLd8vqh8/LD4aIYTGuvpAcdjzwURrfw=;
 b=GNnCaFwT5fCH+LeDz52aKLFdn51FT6vSb9sUXdUGe3UFR8PWmaqWjD4Ge7h8hkVsPIXj
 nIf7vjZpQb8W58eMoX606M+8CwJ59cIqTz5tF9Xbk4Rf/yswFvqxZdPBSkrKyvtNQWuM
 jpYfxA2i/fIuIiFj1hiqPI6bK7TlMxOGcK5G9fTQcce6fEt9bMIcyodd+NN581Rujbx+
 tJKDA3AbswvfEPee/Mjs99OXQAxvV8zub9vJ0u7MCHzK7CRItmvzRFbQ3EzOCFrARONF
 97QjXViKiWmnSwKm1PRvFTTyHXoqlSMqRn5HyXeZcRmdZ1mwzLgTfMu5en72S7nG3R9K kA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mmn3n8te7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 16:22:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMGMTHY032570
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 16:22:29 GMT
Received: from [10.110.68.133] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 22 Dec
 2022 08:22:28 -0800
Message-ID: <54bd8b85-8b68-4b28-ec68-28edf9a8a097@quicinc.com>
Date: Thu, 22 Dec 2022 08:22:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 <konrad.dybcio@somainline.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
 <airlied@gmail.com>
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-2-git-send-email-quic_khsieh@quicinc.com>
 <1a5cc3d3-ac2d-52c8-79f4-b13252a4bb86@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1a5cc3d3-ac2d-52c8-79f4-b13252a4bb86@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6vrkoX9hfurY3YRHajdQGM6tw57oWLfA
X-Proofpoint-ORIG-GUID: 6vrkoX9hfurY3YRHajdQGM6tw57oWLfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_09,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220139
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


On 12/22/2022 2:47 AM, Krzysztof Kozlowski wrote:
> On 16/12/2022 20:11, Kuogee Hsieh wrote:
>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>> add link-frequencies property into dp_out endpoint as well. The last
>> frequency specified at link-frequencies will be the max link rate
>> supported by DP.
>>
>> Changes in v5:
>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>
>> Changes in v6:
>> -- add data-lanes and link-frequencies to yaml
>>
>> Changes in v7:
>> -- change 160000000 to 1620000000
>> -- separate yaml to different patch
>>
>> Changes in v8:
>> -- correct Bjorn mail address to kernel.org
>>
>> Changes in v9:
>> -- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor.dtsi
>>
>> Changes in v13:
>> -- delete an extra space at data-lanes
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index eae22e6..e2783dd 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
>>   	status = "okay";
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&dp_hot_plug_det>;
>> -	data-lanes = <0 1>;
>> +};
>> +
>> +&dp_out {
>> +    data-lanes = <0 1>;
>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
> Messed order of nodes.

can you please give me more details and how should i fixed it?

Thanks,

>>   };
>>   
>>   &pm6150_adc {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> index c11e371..3f363f8 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> @@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
>>   	status = "okay";
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&dp_hot_plug_det>;
>> +};
>> +
>> +&dp_out {
> Same problem here.
>
>
> Best regards,
> Krzysztof
>
