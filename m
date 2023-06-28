Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B585974196E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87A10E389;
	Wed, 28 Jun 2023 20:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6181E10E389;
 Wed, 28 Jun 2023 20:28:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35SJgoqi001742; Wed, 28 Jun 2023 20:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TjnP3jpnMUMxwLyS7IxgsYElJNAIPiqDmCAH8VXYyFA=;
 b=UKMMRXcY45XfWbInEoUFJare+tR1zUyb5rkNHyG93pDNh4ooT3qLSMAB71TqAhEuGGrz
 gT5lDrCC/FlP2cD2cOQFnpoHJenExeucodKMrOJYZg0grRAHkNBDjcl5p2nACgmfXdE5
 45qmbdRoaRw+bY9OyTK7CT7JkKrdONVEEfYEM+sD+WIifCPUuQ8t8kEC7AVfTgNPB9iF
 8lXLVOczE5QtymLJvOMxJ65xoVR4CRfJKgszo+uGwlmdS+rsEccfVDQV220RdaXCiXJ8
 HzgC8wRcncGveFh0B9VuB+VlGLl3pmY2jQWx9hZuw0ZMGe+G8RQWNUmJSlrmCZRFKVj1 Hw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rgnxr8ua7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 20:28:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35SKRxXx031657
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jun 2023 20:27:59 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Wed, 28 Jun
 2023 13:27:56 -0700
Message-ID: <1cb2b1d0-86d4-3f8f-d4cc-73d29c454619@quicinc.com>
Date: Wed, 28 Jun 2023 13:27:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu:
 Describe SM6125
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Andy Gross <agross@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
 <631728c5-9e4f-fa5d-e954-d4ba35f6fd19@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <631728c5-9e4f-fa5d-e954-d4ba35f6fd19@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fPaDk9QNB_nXzD0ZMgDpFTVb88rTyAjC
X-Proofpoint-GUID: fPaDk9QNB_nXzD0ZMgDpFTVb88rTyAjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280180
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Lux
 Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/26/2023 7:04 AM, Dmitry Baryshkov wrote:
> On 24/06/2023 03:41, Marijn Suijten wrote:
>> SM6125 is identical to SM6375 except that while downstream also defines
>> a throttle clock, its presence results in timeouts whereas SM6375
>> requires it to not observe any timeouts.
> 
> I see that the vendor DTS still references this clock.
> 
> Abhinav, Tanya, do possibly know what can be wrong here?
> 

 From display side, we just enable it without any specific vote. Seeing 
timeouts without it makes sense but not with it.

I dont have experience with this family of chipsets and this clock is 
specific to this family of chipsets.

Will reach out to folks who might have a better idea about this clock 
and update with possible suggestions.

Unless ... tanya has more suggestions.

>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml | 
>> 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml 
>> b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> index 630b11480496..6d2ba9a1cca1 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>> @@ -15,6 +15,7 @@ properties:
>>     compatible:
>>       enum:
>>         - qcom,sc7180-dpu
>> +      - qcom,sm6125-dpu
>>         - qcom,sm6350-dpu
>>         - qcom,sm6375-dpu
>>
> 
