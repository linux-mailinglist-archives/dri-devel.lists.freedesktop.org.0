Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6272501C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 00:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F60E10E3FA;
	Tue,  6 Jun 2023 22:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BF610E3E6;
 Tue,  6 Jun 2023 22:47:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356Mdo4Z007357; Tue, 6 Jun 2023 22:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+gflad8UPgoW1+J14poH26V7H9IeuBoLu8eewq7ENQc=;
 b=VY/CMEpX3ZWLHVWTcHvM4mi6MFg0mOj5FRArFZmTq+qNBxUe/Ha0J6/ZSQPtt4byiB/6
 YxtmNGg0R9C3c+jNMzx1607wOpP+acn60GdMhsgVFUOJKSZSslx4MoR2uQZf8Ay+/qFL
 9zG8g+vyFOVJ5osfhjKgog0j13hUzc7jHw1VJi3bPlvh2+ihSQIU0Ju2jH8i2ZWVmvTt
 n3ZQv6XMRQTHSv/MCtuWZVjuEHs3AhMYf/VYamj3m4AiPk4NOnFL8531g5DTJPXc1tkL
 MC9eJTApylQDawOTc7tUhptD4ukNIGXYOzZehGJkE34zNcJNoW3YtOqVjwoGo2sYdERT AA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a768d0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 22:47:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356Ml4pq015710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 22:47:04 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 15:47:03 -0700
Message-ID: <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
Date: Tue, 6 Jun 2023 15:47:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats
 to the DPU caps
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: I7WwUQCDepaGqnJnj6jE2Vb1BSBlhu5_
X-Proofpoint-GUID: I7WwUQCDepaGqnJnj6jE2Vb1BSBlhu5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_16,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306060190
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



On 6/6/2023 2:52 PM, Dmitry Baryshkov wrote:
> On 07/06/2023 00:47, Abhinav Kumar wrote:
>>
>>
>> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>>> As we are going to add virtual planes, add the list of supported 
>>>>>>> formats
>>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>>> planes, with
>>>>>>> later selecting a pipe depending on whether the YUV format is 
>>>>>>> used for
>>>>>>> the framebuffer.
>>>>>>>
>>>>>>
>>>>>> If your usage of format_list is going to be internal to 
>>>>>> dpu_plane.c, I
>>>>>> can think of another idea for this change.
>>>>>>
>>>>>> This essentially translates to if (num_vig >= 1)
>>>>>>
>>>>>> If we can just have a small helper to detect that from the catalog 
>>>>>> can
>>>>>> we use that instead of adding formats to the dpu caps?
>>>>>
>>>>> I'd prefer to be explicit here. The list of supported formats might
>>>>> vary between generations, might it not? Also we don't have a case of
>>>>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>>>>> have CSC) lists YUV as supported.
>>>>>
>>>>
>>>> the list of formats is tied to the sspps the dpu generation has and 
>>>> the capabilities of those sspps.
>>>>
>>>> qcm2290 is really an interesting case. It has one vig sspp but no 
>>>> csc block for that vig sspp, hence it cannot support non-RGB formats.
>>>>
>>>> I have confirmed that downstream is incorrect to populate yuv 
>>>> formats for qcm2290.
>>>>
>>>> I still think that having atleast one vig sspp with csc sub-blk is 
>>>> the right condition to check if we want to decide if the dpu for 
>>>> that chipset supports yuv formats. Extra csc-blk check to handle 
>>>> qcm2290.
>>>>
>>>> Having a small helper in dpu_plane.c is good enough for that because 
>>>> with virtual planes, you only need to know "if such a plane exists 
>>>> and not which plane" and a full catalog change isnt needed IMO
>>>
>>> This goes down to the question: is the list of YUV and non-YUV 
>>> formats static or not? Do all DPU devices support the same set of YUV 
>>> and non-YUV formats? If it is static, we might as well drop 
>>> dpu_sspp_sub_blks::format_list.
>>>
>>
>> I would say yes based on the below reference:
>>
>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
>>
>> We always add the same set of YUV formats for all Vig SSPPs 
>> irrespective of the chipsets.
> 
> Well, as your example pointed out, few lines below it starts adding 
> formats to the list, so the format list is not static and depends on the 
> generation.
> 

No, the DPU revision checks are there to add P010 UBWC formats on top of 
the Vig formats.

At the moment, the latest downstream code (code which is not on CLO 
hence I cannot share) has dropped all that and just checks if P010 UBWC 
is supported for the Vig SSPP and adds all those.

So its still tied to the feature bit whether P010 UBWC is supported in 
the Vig SSPP and not at the chipset level.

>>
>>> Note to myself: consider 
>>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either 
>>> migrate dpu_sspp_sub_blks::format_list users to these fields or drop 
>>> them.
>>>
>>
>> Yes, I agree. There is no need to have format list in the sub_blk as 
>> for one type of SSPP, it supports the same format across DPU generations.
>>
>>>>
>>>>
>>>>> Note: I think at some point we should have a closer look at the list
>>>>> of supported formats and crosscheck that we do not have either
>>>>> unsupported formats being listed, or missing formats which are not
>>>>> listed as supported.
>>>>>
>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 
>>>>>>> +++++++++++++++++++
>>>>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
>>>>>>>    2 files changed, 30 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> index 212d546b6c5d..2d6944a9679a 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> @@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps 
>>>>>>> = {
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps qcm2290_dpu_caps = {
>>>>>>> @@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps 
>>>>>>> = {
>>>>>>>        .has_idle_pc = true,
>>>>>>>        .max_linewidth = 2160,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sdm845_dpu_caps = {
>>>>>>> @@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sc7180_dpu_caps = {
>>>>>>> @@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
>>>>>>>        .has_idle_pc = true,
>>>>>>>        .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm6115_dpu_caps = {
>>>>>>> @@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
>>>>>>>        .has_idle_pc = true,
>>>>>>>        .max_linewidth = 2160,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm8150_dpu_caps = {
>>>>>>> @@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sc8180x_dpu_caps = {
>>>>>>> @@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps 
>>>>>>> = {
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sc8280xp_dpu_caps = {
>>>>>>> @@ -404,6 +418,8 @@ static const struct dpu_caps 
>>>>>>> sc8280xp_dpu_caps = {
>>>>>>>        .has_3d_merge = true,
>>>>>>>        .max_linewidth = 5120,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm8250_dpu_caps = {
>>>>>>> @@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>>>>>>        .has_3d_merge = true,
>>>>>>>        .max_linewidth = 900,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm8350_dpu_caps = {
>>>>>>> @@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
>>>>>>>        .has_3d_merge = true,
>>>>>>>        .max_linewidth = 4096,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm8450_dpu_caps = {
>>>>>>> @@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>>>>>        .has_3d_merge = true,
>>>>>>>        .max_linewidth = 5120,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sm8550_dpu_caps = {
>>>>>>> @@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
>>>>>>>        .has_3d_merge = true,
>>>>>>>        .max_linewidth = 5120,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_caps sc7280_dpu_caps = {
>>>>>>> @@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
>>>>>>>        .has_idle_pc = true,
>>>>>>>        .max_linewidth = 2400,
>>>>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>>>> +     .format_list = plane_formats_yuv,
>>>>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>>>>    };
>>>>>>>
>>>>>>>    static const struct dpu_mdp_cfg msm8998_mdp[] = {
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> index 89b372cdca92..4847aae78db2 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>>> @@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
>>>>>>>     * @pixel_ram_size     size of latency hiding and de-tiling 
>>>>>>> buffer in bytes
>>>>>>>     * @max_hdeci_exp      max horizontal decimation supported 
>>>>>>> (max is 2^value)
>>>>>>>     * @max_vdeci_exp      max vertical decimation supported (max 
>>>>>>> is 2^value)
>>>>>>> + * @format_list: Pointer to list of supported formats
>>>>>>> + * @num_formats: Number of supported formats
>>>>>>>     */
>>>>>>>    struct dpu_caps {
>>>>>>>        u32 max_mixer_width;
>>>>>>> @@ -419,6 +421,8 @@ struct dpu_caps {
>>>>>>>        u32 pixel_ram_size;
>>>>>>>        u32 max_hdeci_exp;
>>>>>>>        u32 max_vdeci_exp;
>>>>>>> +     const u32 *format_list;
>>>>>>> +     u32 num_formats;
>>>>>>>    };
>>>>>>>
>>>>>>>    /**
>>>>>
>>>>>
>>>>>
>>>
> 
