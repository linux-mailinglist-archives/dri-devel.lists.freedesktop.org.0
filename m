Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309986E8644
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EB510E255;
	Thu, 20 Apr 2023 00:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DB710E255;
 Thu, 20 Apr 2023 00:17:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JNhJeV014575; Thu, 20 Apr 2023 00:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OcdfFnt5Qn8j1rG0aZRC6dVyQQ5vYCY5c3ZiCnlIc08=;
 b=BGkt/Yx0TUlDxzG9nysX1aUXM23CI1amr2yt3B9aNoxKo9qDUxXAZzokQVzSlH7ZV7/W
 vEqK+pEhfd0jv2E0KTL0wykwkHfdsyOvGCcr1rejpbDebq+ZXNW1lfDaEucZNx4DhTFM
 j+vrFv9aSl9KZ6uauKaTgbu+Xl1SPr51tAUrAFcLNZm7XRkhIjqlXlNmVTUdhBujrmgz
 LRUb2VVIr6KSmo92in8zt9k0bSCYpjpWxSuPQDu2OGFTLnbDOoN39iGkdeXZqKKMPGlw
 NM4kJaMtkU2KOi8btddonE//LsF3jt97e/EvsJ5TE/wVGm0usinFPtZcow5rIqWmw5sM 8Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2fn59nhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 00:17:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33K0HJKb001699
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 00:17:19 GMT
Received: from [10.110.74.190] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 19 Apr
 2023 17:17:18 -0700
Message-ID: <5014976f-3026-9fef-e1ec-270d421df078@quicinc.com>
Date: Wed, 19 Apr 2023 17:17:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/4] drm/msm: add some cec register bitfield details
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnaud Vrac
 <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sean Paul <sean@poorly.run>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
 <9d7f81fc-945e-9704-4eb2-d2e5cb31297e@linaro.org>
 <5797c537-fe70-27be-ef1d-f4c8b19806f5@quicinc.com>
 <639b264b-08e5-b84e-1933-ed768b6d1512@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <639b264b-08e5-b84e-1933-ed768b6d1512@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6Zvj11_P47IPDw4G8ZZbhCQQ7KE5SY8V
X-Proofpoint-GUID: 6Zvj11_P47IPDw4G8ZZbhCQQ7KE5SY8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_15,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/2023 5:11 PM, Dmitry Baryshkov wrote:
> On 20/04/2023 03:10, Abhinav Kumar wrote:
>>
>>
>> On 4/19/2023 4:53 PM, Dmitry Baryshkov wrote:
>>> On 18/04/2023 21:10, Arnaud Vrac wrote:
>>>> The register names and bitfields were determined from the downstream
>>>> msm-4.4 driver.
>>>>
>>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>>> ---
>>>>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62 
>>>> ++++++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 61 insertions(+), 1 deletion(-)
>>>
>>> I have opened MR against Mesa at 
>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22588.
>>>
>>> The patch is:
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Minor nit below
>>>
>>
>> Also, shouldnt the register updates be done using rnn tool instead of 
>> manual edits?
> 
> We usually update the rnn and ask Rob to pull it at the beginning of the 
> cycle.
> 

Sorry, I didnt get this. So you are saying, we will accept manual edits 
and then replace it with the tool generated xml later? I was not aware 
of that, because previously I was always asked by Rob to use the tool to 
generate the xml and push that.

>>
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h 
>>>> b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>> index 973b460486a5a..b4dd6e8cba6b7 100644
>>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
>>>> @@ -76,6 +76,13 @@ enum hdmi_acr_cts {
>>>>       ACR_48 = 3,
>>>>   };
>>>> +enum hdmi_cec_tx_status {
>>>> +    CEC_TX_OK = 0,
>>>> +    CEC_TX_NACK = 1,
>>>> +    CEC_TX_ARB_LOSS = 2,
>>>> +    CEC_TX_MAX_RETRIES = 3,
>>>> +};
>>>> +
>>>>   #define REG_HDMI_CTRL                        0x00000000
>>>>   #define HDMI_CTRL_ENABLE                    0x00000001
>>>>   #define HDMI_CTRL_HDMI                        0x00000002
>>>> @@ -476,20 +483,73 @@ static inline uint32_t 
>>>> HDMI_DDC_REF_REFTIMER(uint32_t val)
>>>>   #define REG_HDMI_HDCP_SW_LOWER_AKSV                0x00000288
>>>>   #define REG_HDMI_CEC_CTRL                    0x0000028c
>>>> +#define HDMI_CEC_CTRL_ENABLE                    0x00000001
>>>> +#define HDMI_CEC_CTRL_SEND_TRIGGER                0x00000002
>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__MASK                0x000001f0
>>>> +#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT                4
>>>> +static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & 
>>>> HDMI_CEC_CTRL_FRAME_SIZE__MASK;
>>>> +}
>>>> +#define HDMI_CEC_CTRL_LINE_OE                    0x00000200
>>>>   #define REG_HDMI_CEC_WR_DATA                    0x00000290
>>>> +#define HDMI_CEC_WR_DATA_BROADCAST                0x00000001
>>>> +#define HDMI_CEC_WR_DATA_DATA__MASK                0x0000ff00
>>>> +#define HDMI_CEC_WR_DATA_DATA__SHIFT                8
>>>> +static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & 
>>>> HDMI_CEC_WR_DATA_DATA__MASK;
>>>> +}
>>>> -#define REG_HDMI_CEC_CEC_RETRANSMIT                0x00000294
>>>> +#define REG_HDMI_CEC_RETRANSMIT                    0x00000294
>>>> +#define HDMI_CEC_RETRANSMIT_ENABLE                0x00000001
>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__MASK                0x000000fe
>>>> +#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT            1
>>>> +static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & 
>>>> HDMI_CEC_RETRANSMIT_COUNT__MASK;
>>>> +}
>>>>   #define REG_HDMI_CEC_STATUS                    0x00000298
>>>> +#define HDMI_CEC_STATUS_BUSY                    0x00000001
>>>> +#define HDMI_CEC_STATUS_TX_FRAME_DONE                0x00000008
>>>> +#define HDMI_CEC_STATUS_TX_STATUS__MASK                0x000000f0
>>>> +#define HDMI_CEC_STATUS_TX_STATUS__SHIFT            4
>>>> +static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum 
>>>> hdmi_cec_tx_status val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & 
>>>> HDMI_CEC_STATUS_TX_STATUS__MASK;
>>>> +}
>>>>   #define REG_HDMI_CEC_INT                    0x0000029c
>>>> +#define HDMI_CEC_INT_TX_DONE                    0x00000001
>>>> +#define HDMI_CEC_INT_TX_DONE_MASK                0x00000002
>>>> +#define HDMI_CEC_INT_TX_ERROR                    0x00000004
>>>> +#define HDMI_CEC_INT_TX_ERROR_MASK                0x00000008
>>>> +#define HDMI_CEC_INT_MONITOR                    0x00000010
>>>> +#define HDMI_CEC_INT_MONITOR_MASK                0x00000020
>>>> +#define HDMI_CEC_INT_RX_DONE                    0x00000040
>>>> +#define HDMI_CEC_INT_RX_DONE_MASK                0x00000080
>>>>   #define REG_HDMI_CEC_ADDR                    0x000002a0
>>>>   #define REG_HDMI_CEC_TIME                    0x000002a4
>>>> +#define HDMI_CEC_TIME_ENABLE                    0x00000001
>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK            0x0000ff80
>>>> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT            7
>>>> +static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & 
>>>> HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
>>>> +}
>>>>   #define REG_HDMI_CEC_REFTIMER                    0x000002a8
>>>> +#define HDMI_CEC_REFTIMER_ENABLE                0x00010000
>>>
>>> I think this should come after the REFTIMER field.
>>>
>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__MASK            0x0000ffff
>>>> +#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT            0
>>>> +static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
>>>> +{
>>>> +    return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & 
>>>> HDMI_CEC_REFTIMER_REFTIMER__MASK;
>>>> +}
>>>>   #define REG_HDMI_CEC_RD_DATA                    0x000002ac
>>>>
>>>
> 
