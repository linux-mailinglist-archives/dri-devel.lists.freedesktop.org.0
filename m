Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E867462C3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 20:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C8E10E237;
	Mon,  3 Jul 2023 18:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6E210E230;
 Mon,  3 Jul 2023 18:52:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363IUN48009031; Mon, 3 Jul 2023 18:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=csNP9c2aG625Io+27ednYajBoBH5BOUigTeoyhKjbtM=;
 b=D6s54uBY7FzAMwQfRteQNATap6mDuvnygn9+CznE+CxFB7WH8Nj/9Notd/Hh5MidDiPL
 xl07S5T3j4lqVXHk1t6qle7+tp/G01jb9TNR7VY24OOlvT8n+Y2AqD6MPPgnnOOeY1HN
 3W0SZ3Q9U8rYsQhielQxpwItnGmX0yY/P6het5QEtLrP8jj5yAE2IpAYKM2vKzjXrrRr
 L+j91r0eUX9g75dIL6latnYob98QH0v3M1q63OxJMs17Qbpbm2JdUUZ6whmteuTWphHR
 m9wmW4EfBWvFLaAxPJfmhTLETJR72Uc/0w6auOZswRRWWBsJHvzexy67q4iUXF9vl+L+ 0g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkw8s10mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 18:52:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363IqHm2006276
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 18:52:17 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 11:52:16 -0700
Message-ID: <1dd5bf62-d935-fbcd-156f-f81a839b32bc@quicinc.com>
Date: Mon, 3 Jul 2023 11:52:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 13/19] drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
 macros
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-14-dmitry.baryshkov@linaro.org>
 <vcya62ftwhsc5yj4d6swlw5skzie57pwf3govmb2chlnwx5oi5@f3uqa5aimxr4>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <vcya62ftwhsc5yj4d6swlw5skzie57pwf3govmb2chlnwx5oi5@f3uqa5aimxr4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LA875uvqIslux1lBsAxewqsfDHzZ3tb-
X-Proofpoint-GUID: LA875uvqIslux1lBsAxewqsfDHzZ3tb-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030171
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



On 6/27/2023 1:29 AM, Marijn Suijten wrote:
> On 2023-06-20 00:25:13, Dmitry Baryshkov wrote:
>> To simplify making changes to the hardware block definitions, expand
>> corresponding macros. This way making all the changes are more obvious
>> and visible in the source files.
>>
>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> You still have two 0x1800's that should be 0x140.  Diffing the
> disassembly:
> 
>      diff --git a/baseline.dis b/dpu_hw_catalog.dis
>      index 5a45280..04df183 100644
>      --- a/baseline.dis
>      +++ b/dpu_hw_catalog.dis
>      @@ -1,5 +1,5 @@
> 
>      -baseline.o:     file format elf64-littleaarch64
>      +dpu_hw_catalog.o:     file format elf64-littleaarch64
> 
> 
>       Disassembly of section .data:
>      @@ -2808,7 +2808,7 @@ Disassembly of section .rodata:
>              ...
>           3b18:      00000001        udf     #1
>           3b1c:      00080000        .inst   0x00080000 ; undefined
>      -    3b20:      00000140        udf     #320
>      +    3b20:      00001800        udf     #6144
>           3b24:      00000000        udf     #0
>           3b28:      00000002        udf     #2
>              ...
>      @@ -3112,7 +3112,7 @@ Disassembly of section .rodata:
>              ...
>           43a8:      00000001        udf     #1
>           43ac:      00080000        .inst   0x00080000 ; undefined
>      -    43b0:      00000140        udf     #320
>      +    43b0:      00001800        udf     #6144
>           43b4:      00000000        udf     #0
>           43b8:      00000002        udf     #2
>              ...
> 
> These are the freshly added SM6350/75, see below.
> 

Yup. Thats right. Nice catch !

Tough to catch that visually with all the numbers moving around.

>> ---
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  9 ++++-
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 17 +++++++--
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 21 +++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 31 +++++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 21 +++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 ++-
>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 ++-
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 25 +++++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 +++-
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 37 ++++++++++++++++---
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 25 +++++++++++--
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 25 +++++++++++--
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 15 --------
>>   13 files changed, 189 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index a07c68744b29..d5111f3782a2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -200,8 +200,13 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg msm8998_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x140,
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x140,
>> +	},
>>   };
>>   
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> index 786263ed1ef2..b6f52b3864ce 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>> @@ -224,10 +224,19 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sdm845_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x140,
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x140,
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x140,
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x140,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sdm845_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> index 6b9bfeac6e0a..9b2de5986e82 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm8150_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8150_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index 414f0db3306c..683602e54c0e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -244,12 +244,31 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_4", .id = DSC_4,
>> +		.base = 0x81000, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_5", .id = DSC_5,
>> +		.base = 0x81400, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sc8180x_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> index db3a65b011ca..a98d63f6c47c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>> @@ -245,10 +245,23 @@ static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm8250_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
>> -	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_1", .id = DSC_1,
>> +		.base = 0x80400, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_2", .id = DSC_2,
>> +		.base = 0x80800, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	}, {
>> +		.name = "dsc_3", .id = DSC_3,
>> +		.base = 0x80c00, .len = 0x140,
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8250_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> index a996c39b7b1f..a9907010a4a2 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -136,7 +136,11 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm6350_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
> 
> Here.
> 
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm6350_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> index 0cdb77599583..e42f0dc3b2ab 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>> @@ -90,7 +90,11 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
>>   };
>>   
>>   static const struct dpu_dsc_cfg sm6375_dsc[] = {
>> -	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>> +	{
>> +		.name = "dsc_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x1800,
> 
> And here.
> 
> - Marijn
> 
>> +		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm6375_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index e08b29e9e146..8a9bfc4af72a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -248,10 +248,27 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8350_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8350_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index d5faa1816cb3..9c0beccce282 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -146,7 +146,12 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>>   
>>   /* NOTE: sc7280 only has one DSC hard slice encoder */
>>   static const struct dpu_dsc_cfg sc7280_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	},
>>   };
>>   
>>   static const struct dpu_wb_cfg sc7280_wb[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index 8e4299be2b1c..b676819db42c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -246,12 +246,37 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_2_0", .id = DSC_4,
>> +		.base = 0x82000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_2_1", .id = DSC_5,
>> +		.base = 0x82000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index bbee3c621943..568523abc1d0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -259,10 +259,27 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8450_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8450_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index ea7bffe252a5..419624948e83 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -273,10 +273,27 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>>    * its own different sub block address.
>>    */
>>   static const struct dpu_dsc_cfg sm8550_dsc[] = {
>> -	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
>> -	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
>> -	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
>> +	{
>> +		.name = "dce_0_0", .id = DSC_0,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_0_1", .id = DSC_1,
>> +		.base = 0x80000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2),
>> +		.sblk = &dsc_sblk_1,
>> +	}, {
>> +		.name = "dce_1_0", .id = DSC_2,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_0,
>> +	}, {
>> +		.name = "dce_1_1", .id = DSC_3,
>> +		.base = 0x81000, .len = 0x29c,
>> +		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
>> +		.sblk = &dsc_sblk_1,
>> +	},
>>   };
>>   
>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6ef0dc2e1a5d..ee24402bf253 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -495,21 +495,6 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>   	.ctl = {.base = 0xF80, .len = 0x10},
>>   };
>>   
>> -#define DSC_BLK(_name, _id, _base, _features) \
>> -	{\
>> -	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x140, \
>> -	.features = _features, \
>> -	}
>> -
>> -#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>> -	{\
>> -	.name = _name, .id = _id, \
>> -	.base = _base, .len = _len, \
>> -	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>> -	.sblk = &_sblk, \
>> -	}
>> -
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -- 
>> 2.39.2
>>
