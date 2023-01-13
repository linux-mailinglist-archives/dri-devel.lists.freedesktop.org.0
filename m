Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940366A538
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1423310E206;
	Fri, 13 Jan 2023 21:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDF110E04F;
 Fri, 13 Jan 2023 21:39:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DLSQ93024659; Fri, 13 Jan 2023 21:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wPywwakcFVP2GMJ5LwTY3OYN/nFeCJVvQ7uCFerMsrs=;
 b=mGpSFSAiLzs6y8pWz7np9m2hAC6BNHRHHctfSKHZ8Xy+p7FTQ99/cW92E8X9Iz27Agy4
 AdoMYS8U2bqMjxiVo6u4QPG2/GuZaHTlXtsqQIKmYoacHt+Vdw+K0RbQTlYxBqN9ulpj
 OFQVlbpzyjQNGVsq1XT7/prQBjZ309yGOrkEnXbzJRnk9nFHKkq94h2cJBZjaEY71Zqi
 rniM8PrvvrNuH+2NeO3m1y+y/sMP35OQDugtTuVqBGL7FImoXLu55yYiUF14gPCtfjrS
 EmD6Ls16/jrQfe3GJ28tipntLKBJCpSejJcvREYVqoxN5IdjArr+M/UC5TVRD+ue9RSj sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2wqw29rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:39:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DLdlV0005480
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:39:47 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 13:39:46 -0800
Message-ID: <fb1e1aa6-fac6-975d-c30a-80520467ba80@quicinc.com>
Date: Fri, 13 Jan 2023 13:39:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/4] drm/msm/mdss: correct the ubwc version for sm6115
 platform
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
 <20221208000850.312548-3-dmitry.baryshkov@linaro.org>
 <eae9b5ee-3bf3-8fd4-6d8f-6ac265859ec6@quicinc.com>
 <CAA8EJpopVvFfvrb0rPNhodichLSKsRWo=TOmfXLH38u32hYPoA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpopVvFfvrb0rPNhodichLSKsRWo=TOmfXLH38u32hYPoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FltoiDtDLR4r-WD8trvM9cvWXDfcetES
X-Proofpoint-ORIG-GUID: FltoiDtDLR4r-WD8trvM9cvWXDfcetES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130148
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/2023 1:16 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Jan 2023 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 12/7/2022 4:08 PM, Dmitry Baryshkov wrote:
>>> According to the vendor DT, sm6115 has UBWC 1.0, not 2.0.
>>>
>>
>> Can you please point me to which file you are referring to?
>>
>> The internal docs I have are still showing 2.0.
> 
> If I understood correctly sm6115 = bengal, thus:
> 
> https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-sde.dtsi#103

Ok, so the cause of discrepancy was that the overall recommendation 
across sub-systems was to use UWBC 1.0. Thats why the DTSI has 1.0.

Hence, this change LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>> index 2219c1bd59a9..4401f945b966 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -532,7 +532,7 @@ static const struct msm_mdss_data sm8150_data = {
>>>    };
>>>
>>>    static const struct msm_mdss_data sm6115_data = {
>>> -     .ubwc_version = UBWC_2_0,
>>> +     .ubwc_version = UBWC_1_0,
>>>        .ubwc_swizzle = 7,
>>>        .ubwc_static = 0x11f,
>>>    };
> 
> 
> 
