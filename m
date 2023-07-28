Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E1767648
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 21:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5CB10E0F0;
	Fri, 28 Jul 2023 19:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DDC10E783;
 Fri, 28 Jul 2023 19:25:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SBRXRY022444; Fri, 28 Jul 2023 19:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+Ox4KhuAeFu3Cb2wUfhlkU/clsgNuOPkhPdip6aU90c=;
 b=B9U/AmWHEV/PS97PxrlCK5eEdxtOu8sdinP0QJWBG3LIKhfafQk51BKpiQPZ6QFRZWu0
 9a58WeQikv0iCdXJk9QR/P0XlI8+Phoh4I9mTp1qPncn3uYa6Qv1Pp44ed+BoKzUsstt
 LAED7QV1Nlo4YVJ6v1XzGSS5H+6q1EDw/upekDAEm5nfmIweHdPlb6Frangp2SOlO/S1
 /kn+4/w60TxVLTcGsqINcWt7TLlmS3PNlS6BGk76wRwVpZub7SCr+co1MF2Q0tNJh1+N
 swhIEGbWoJgXt79tHSAeXG5nxUwVYPmAoHLplFsIEbp07xHU3l4bizARdKd3SeLezWws jg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s403vjc6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 19:24:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SJOvO2007774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 19:24:57 GMT
Received: from [10.110.77.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 12:24:56 -0700
Message-ID: <e9f9c27d-e3a1-0e47-6fc0-27d3755b853c@quicinc.com>
Date: Fri, 28 Jul 2023 12:24:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org>
 <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
 <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
 <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
 <ddb70b1e-57bb-a72f-018a-75da62cedb3a@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ddb70b1e-57bb-a72f-018a-75da62cedb3a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _OO-jVoWVbeoPUyJt6eXQOTlyeBcC_jU
X-Proofpoint-ORIG-GUID: _OO-jVoWVbeoPUyJt6eXQOTlyeBcC_jU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280176
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2023 8:26 AM, Dmitry Baryshkov wrote:
> On 27/07/2023 18:24, Abhinav Kumar wrote:
>>
>>
>> On 7/27/2023 1:39 AM, Dmitry Baryshkov wrote:
>>> On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar 
>>> <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
>>>>> Switch to using data from MDSS driver to program the SSPP fetch and 
>>>>> UBWC
>>>>> configuration.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>>>>>    6 files changed, 36 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> index cf70a9bd1034..bfd82c2921af 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>>> @@ -8,6 +8,8 @@
>>>>>    #include "dpu_hw_sspp.h"
>>>>>    #include "dpu_kms.h"
>>>>>
>>>>> +#include "msm_mdss.h"
>>>>> +
>>>>>    #include <drm/drm_file.h>
>>>>>
>>>>>    #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>>>> @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct 
>>>>> dpu_sw_pipe *pipe,
>>>>>                DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>>>>>                        DPU_FETCH_CONFIG_RESET_VALUE |
>>>>>                        ctx->ubwc->highest_bank_bit << 18);
>>>>
>>>> Does this needs to be protected with if ctx->ubwc check?
>>>
>>> Yes... And it should have been already.
>>>
>>>>
>>>>> -             switch (ctx->ubwc->ubwc_version) {
>>>>> -             case DPU_HW_UBWC_VER_10:
>>>>> +             switch (ctx->ubwc->ubwc_enc_version) {
>>>>> +             case UBWC_1_0:
>>>>
>>>> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
>>>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in 
>>>> the
>>>> catalog for the encoder version in the first place? Because looking at
>>>> the registers UBWC_x_x is the correct value.
>>>>
>>>> If we cannot find the reason why, it should be noted in the commit text
>>>> that the values we are using did change.
>>>
>>> Huh? This is just an enum. It isn't a part of uABI, nor it is written
>>> to the hardware.
>>>
>>
>> The reason is that, this switch case is moving from comparing one set 
>> of values to totally different ones. So atleast that should be noted.
>>
>> First thing that struck me was this point because the enums UBWC_x_x 
>> and DPU_HW_UBWC_VER_xx dont match.
>>
> 
> Do you have any proposed text in mind?
> 

I was doing some checking about this. The issue was that when this enum 
was made, it missed using the SDE_HW_UBWC_VER macro


75 enum {
76 	DPU_HW_UBWC_VER_10 = 0x100,
77 	DPU_HW_UBWC_VER_20 = 0x200,
78 	DPU_HW_UBWC_VER_30 = 0x300,
79 	DPU_HW_UBWC_VER_40 = 0x400,
80 };
81

so something like this:

183  */
184 enum {
185 	SDE_HW_UBWC_VER_10 = SDE_HW_UBWC_VER(0x100),
186 	SDE_HW_UBWC_VER_20 = SDE_HW_UBWC_VER(0x200),
187 	SDE_HW_UBWC_VER_30 = SDE_HW_UBWC_VER(0x300),
188 	SDE_HW_UBWC_VER_40 = SDE_HW_UBWC_VER(0x400),
189 	SDE_HW_UBWC_VER_43 = SDE_HW_UBWC_VER(0x431),
190 };

This macro handles that conversion under the hood.

So I would write something like this

"This also corrects the usage of UBWC version which was incorrect from 
the beginning because of the enum storing the DPU_HW_UBWC_*** missed out 
the conversion to the full UBWC version"
