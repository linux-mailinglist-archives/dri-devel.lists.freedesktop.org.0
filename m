Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B16D7171
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF110E7FE;
	Wed,  5 Apr 2023 00:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AC810E80D;
 Wed,  5 Apr 2023 00:40:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334JkUcj003362; Wed, 5 Apr 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QJO4DngT+iLD6zzhwDFciOSDpgE3gaqmJ7bKsl5+X7o=;
 b=DrG9VCLlpjlkUBF/esAMW1B+NuACCKxV2bMfqMsP/0UmURVLLwvMUnLYJOloQ1eLrDIW
 dQb9gs6cLvnDbosCQU3E9ggXa/mcyD2BiwpC4SUYqvj+Cz0RVwMX5dPqTOyxtstymNVv
 pPrKKtYTm+zsqKUGmWHr5ADlZCzWjpsPMkMTitRkmgiTOS96Jtsvkzcd3x5ActR9CWtD
 sT4ww1oFWpUUyL4H/mK5SbRSw/zgbTGypP98rO+t/oGJBQnB+PWkn+QCldchW4t0B3Ug
 DfURC5KvG0/A3Kswi+tFv5fwv83AovkGhpltlbGX3yF7bTJI5D7ooljZ0zom2bxfBHbd Og== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prg8wtdtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 00:40:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3350eCsb022280
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 00:40:12 GMT
Received: from [10.110.66.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 17:39:46 -0700
Message-ID: <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
Date: Tue, 4 Apr 2023 17:39:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
 <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3PD2lLDAMi9C0kwkohjOl_px2GEPXBTG
X-Proofpoint-ORIG-GUID: 3PD2lLDAMi9C0kwkohjOl_px2GEPXBTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_14,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050004
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/4/2023 5:33 PM, Dmitry Baryshkov wrote:
> On 05/04/2023 01:12, Abhinav Kumar wrote:
>>
>>
>> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
>>> so switch it to CTL_SC7280_MASK too.
>>>
>>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
>>> for SM8450") had all (relevant at that time) bit spelled individually.
>>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>>> despite being a mismerge, correctly changed all other CTL entries to use
>>> CTL_SC7280_MASK, except CTL_0.
>>>
>>
>> I think having it spelled individually is better. If we start using 
>> one chipset's mask for another, we are again going down the same path 
>> of this becoming one confused file.
>>
>> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to 
>> hw catalog") corrected the mask to re-use sc7280, with the individual 
>> catalog file, its better to have it separate and spelled individually.
>>
>> This change is not heading in the direction of the rest of the series.
> 
> I didn't create duplicates of all the defines. This is done well in the 
> style of patch37. I'm not going to add all per-SoC feature masks.
> 

Yes, I was actually going to comment even on patch 37.

We are again trying to generalize a CTL's caps based on DPU version, the 
same mistake which led us down this path.

So today you have CTL_DPU_0_MASK , CTL_DPU_5_MASK , CTL_DPU_7_MASK  and 
CTL_DPU_9_MASK and this builds on an assumption that you can get 5 by 
ORing ACTIVE_CFG with 0.

+#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | \
+			BIT(DPU_CTL_ACTIVE_CFG))
+

This is again moving towards that problematic pattern.

Why dont we stick to CTL features individually spelling it then work 
towards generalizing as we discussed.

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 6840b22a4159..83f8f83e2b29 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>>       {
>>>       .name = "ctl_0", .id = CTL_0,
>>>       .base = 0x15000, .len = 0x204,
>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) 
>>> | BIT(DPU_CTL_FETCH_ACTIVE),
>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>       },
>>>       {
> 
