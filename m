Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A98725055
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AF210E403;
	Tue,  6 Jun 2023 22:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5A310E402;
 Tue,  6 Jun 2023 22:57:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356MtBhq013523; Tue, 6 Jun 2023 22:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DtFR4UWcu3jE/MpopxTm0rceRVXtAT6CkZSIsOKkrR8=;
 b=JQf5KkA+Y0Pn5kRmJqf1yIkoIWLe7iSJB3m9y9ydSZxp7GqYWwSGtzPpfbbxajYPOcJQ
 bVEUSCVcHOabmeuIT8fVMtTGCaf8PuBzWAX5Z0dk3wzN8YacvQ7bPJt93OKTB2t5tRsd
 KZVHEkYymS0XlNjbK/vC9Z3aANZiESXQczIxmjTxn4wWoLAmJSDsxa6g67q7a2xx7zDS
 aBAz7mN28QXt1vtXkw/eq1H74hK4tNc5GCsNqHSQ3XlkingHa1fbiRpaw5MKP9jcf0Db
 wxN5WWxS3wfyqAT5zHgLvO0qQFKzxJVE83u8GeI9ULBjVrlu5w2PMdiTk7gQCzOuul6b yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a718dvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 22:57:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356MvI9w026821
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 22:57:18 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 15:57:16 -0700
Message-ID: <9addd6fc-460a-0bb6-d6d1-b2b51354c695@quicinc.com>
Date: Tue, 6 Jun 2023 15:57:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 10/13] drm/msm/dpu: add list of
 supported formats to the DPU caps
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
 <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
 <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
 <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
 <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
 <12aacfc4-8ed5-1c85-8c1c-abd0aed7f8a9@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <12aacfc4-8ed5-1c85-8c1c-abd0aed7f8a9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ab7KMWy5UbCbE5_3wc45nBHcC_TdwAVT
X-Proofpoint-ORIG-GUID: ab7KMWy5UbCbE5_3wc45nBHcC_TdwAVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_16,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060191
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/6/2023 3:50 PM, Dmitry Baryshkov wrote:
> On 07/06/2023 01:47, Abhinav Kumar wrote:
>>
>>
>> On 6/6/2023 2:52 PM, Dmitry Baryshkov wrote:
>>> On 07/06/2023 00:47, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>>>>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>>>>> As we are going to add virtual planes, add the list of 
>>>>>>>>> supported formats
>>>>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>>>>> planes, with
>>>>>>>>> later selecting a pipe depending on whether the YUV format is 
>>>>>>>>> used for
>>>>>>>>> the framebuffer.
>>>>>>>>>
>>>>>>>>
>>>>>>>> If your usage of format_list is going to be internal to 
>>>>>>>> dpu_plane.c, I
>>>>>>>> can think of another idea for this change.
>>>>>>>>
>>>>>>>> This essentially translates to if (num_vig >= 1)
>>>>>>>>
>>>>>>>> If we can just have a small helper to detect that from the 
>>>>>>>> catalog can
>>>>>>>> we use that instead of adding formats to the dpu caps?
>>>>>>>
>>>>>>> I'd prefer to be explicit here. The list of supported formats might
>>>>>>> vary between generations, might it not? Also we don't have a case of
>>>>>>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>>>>>>> have CSC) lists YUV as supported.
>>>>>>>
>>>>>>
>>>>>> the list of formats is tied to the sspps the dpu generation has 
>>>>>> and the capabilities of those sspps.
>>>>>>
>>>>>> qcm2290 is really an interesting case. It has one vig sspp but no 
>>>>>> csc block for that vig sspp, hence it cannot support non-RGB formats.
>>>>>>
>>>>>> I have confirmed that downstream is incorrect to populate yuv 
>>>>>> formats for qcm2290.
>>>>>>
>>>>>> I still think that having atleast one vig sspp with csc sub-blk is 
>>>>>> the right condition to check if we want to decide if the dpu for 
>>>>>> that chipset supports yuv formats. Extra csc-blk check to handle 
>>>>>> qcm2290.
>>>>>>
>>>>>> Having a small helper in dpu_plane.c is good enough for that 
>>>>>> because with virtual planes, you only need to know "if such a 
>>>>>> plane exists and not which plane" and a full catalog change isnt 
>>>>>> needed IMO
>>>>>
>>>>> This goes down to the question: is the list of YUV and non-YUV 
>>>>> formats static or not? Do all DPU devices support the same set of 
>>>>> YUV and non-YUV formats? If it is static, we might as well drop 
>>>>> dpu_sspp_sub_blks::format_list.
>>>>>
>>>>
>>>> I would say yes based on the below reference:
>>>>
>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
>>>>
>>>> We always add the same set of YUV formats for all Vig SSPPs 
>>>> irrespective of the chipsets.
>>>
>>> Well, as your example pointed out, few lines below it starts adding 
>>> formats to the list, so the format list is not static and depends on 
>>> the generation.
>>>
>>
>> No, the DPU revision checks are there to add P010 UBWC formats on top 
>> of the Vig formats.
>>
>> At the moment, the latest downstream code (code which is not on CLO 
>> hence I cannot share) has dropped all that and just checks if P010 
>> UBWC is supported for the Vig SSPP and adds all those.
>>
>> So its still tied to the feature bit whether P010 UBWC is supported in 
>> the Vig SSPP and not at the chipset level.
> 
> So, what is the difference? This means that depending on some conditions 
> either we can support P010 UBWC or we can not. So the list of all 
> suppored formats is not static.
> 

The difference is SSPP level vs chipset level. This patch was made with 
chipset level in mind and had to expand the format list for each chipset.

What I am suggesting is its a SSPP level decision. Please note its not 
just P010 UBWC but P010 UBWC FOR Vig SSPP.

So expanding each chipset's format list is not needed when the decision 
can be made just on the basis of the SSPP's feature flag OR the presence 
of the csc blk.

>>
>>>>
>>>>> Note to myself: consider 
>>>>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either 
>>>>> migrate dpu_sspp_sub_blks::format_list users to these fields or 
>>>>> drop them.
>>>>>
>>>>
>>>> Yes, I agree. There is no need to have format list in the sub_blk as 
>>>> for one type of SSPP, it supports the same format across DPU 
>>>> generations.
>>>>
>>>>>>
>>>>>>
>>>>>>> Note: I think at some point we should have a closer look at the list
>>>>>>> of supported formats and crosscheck that we do not have either
>>>>>>> unsupported formats being listed, or missing formats which are not
>>>>>>> listed as supported.
>>>>>>>
> 
