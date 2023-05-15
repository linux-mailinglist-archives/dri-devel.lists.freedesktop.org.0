Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38979703F1C
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 22:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E0D10E274;
	Mon, 15 May 2023 20:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D884E10E274;
 Mon, 15 May 2023 20:58:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FKVeKl006742; Mon, 15 May 2023 20:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4lsTkDA2uOZkNjsnRFWj6bpzU280j0xCKZgtmGKlSbA=;
 b=fhIx1SVoXxz1CY72y7N6MDk7kTNYuBYczkF3tM9RU0OFthoQ169bAInE2zOEnr/RjreU
 1QYxkXCtDqb2cidoBd32Ulfkdvz/OSas4ZovwQw+Sl/vB6Wr4YmE24wO8Enrmj2h2wNe
 j3jKWsTB2c+pgAKYBO3oY5FBT4JGeNBoqUhIxF28CHg59BKSzwiobls/jIi5BnMut5n5
 tTMFkEE19pQWefU9mFtwLWjr9x0X3VLGK/8bazj6KwoNqogHZz2n83YNAylchScgtKji
 K5RinUx+Oh0BkiwmpBrhYtBGvUwEB20NDDWBNuI1b/pc267MHvaBoZceVBklFeFvIVx0 eQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjwdsjqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 20:58:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FKwiCG008189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 20:58:44 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 13:58:43 -0700
Message-ID: <d10da0ce-a22e-24e9-e895-fae4c3a35222@quicinc.com>
Date: Mon, 15 May 2023 13:58:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 1/8] drm/msm/dpu: add dsc blocks for remaining chipsets
 in catalog
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Konrad Dybcio
 <konrad.dybcio@somainline.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-2-git-send-email-quic_khsieh@quicinc.com>
 <4tmuqrz3du7pwwih3gzp6zveyfvwxj3meeksgxkbg2v5mdtyu3@e5xxuoe64rvv>
 <69538f77-ff08-c3ce-3d4a-9f7250ee2505@quicinc.com>
 <u47xthqfjxpbbzjbvnrz4qa2f2m3aip4iose7cwuhzg4raf7db@qxbos7u55wko>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <u47xthqfjxpbbzjbvnrz4qa2f2m3aip4iose7cwuhzg4raf7db@qxbos7u55wko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: URn_Ij42Bf-gxD26DsWNA0FAOsRcqdsS
X-Proofpoint-GUID: URn_Ij42Bf-gxD26DsWNA0FAOsRcqdsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_18,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150173
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/2023 1:07 PM, Marijn Suijten wrote:
> On 2023-05-15 11:20:02, Abhinav Kumar wrote:
>>
>>
>>
>> On 5/14/2023 2:39 PM, Marijn Suijten wrote:
>>> DSC*, and mention 1.1 explicitly (since this skips the 1.2 blocks, while
>>> the series is clearly aimed at 1.1...).  This was done for the DSC 1.2
>>> HW block patch after all.
>>>
>>> in catalog -> to catalog
>>>
>>> But it's just two platforms, you can fit MSM8998 and SC8180X in the
>>> title.
>>>
>>> On 2023-05-12 11:00:16, Kuogee Hsieh wrote:
>>>>
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> There are some platforms has DSC blocks but it is not declared at catalog.
>>>
>>> Some platforms have DSC blocks which have not yet been declared in the
>>> catalog.*
>>>
>>>> For completeness, this patch adds DSC blocks for platforms which missed
>>>> them.
>>>
>>> Drop "this patch":
>>>
>>>       Complete DSC 1.1 support for all platforms by adding the missing
>>>       blocks to MSM8998 and SC8180X.
>>>
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 +++++++++++
>>>
>>> How about SC7180, and any other DPU 6.x revision?
>>>
>>
>> Will let kuogee respond to the other nits. There is no DSC in sc7180 /
>> sm6115 / qcm2290. So this patch is complete.
> 
> Thank you for checking as I didn't have the DTS close (and it seems
> SC7180 would have supported this, but no).  I did check other SoCs in
> the DPU 6.x range that are currently floating in my tree and on the
> list, which do need their DSC 1.1 block added (both a single block at
> 0x81000 downstream, 0x80000 upstream), if you can in a resend Konrad:
> 
> DPU 6.4 in SM6350: https://lore.kernel.org/linux-arm-msm/20230411-topic-straitlagoon_mdss-v3-6-9837d6b3516d@linaro.org/
> DPU 6.9 in SM6375: https://lore.kernel.org/linux-arm-msm/20230411-topic-straitlagoon_mdss-v3-8-9837d6b3516d@linaro.org/
> 

If these are still on the list, can Konrad add them to his change as 
that way his catalog change will be complete? Otherwise I would prefer 
to add them in a follow up change because marking this change as 
dependent on a catalog change which adds a new chipset is not right.

> Thanks!
> 
> - Marijn
