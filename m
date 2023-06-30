Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E474450D
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 01:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C4F10E1CF;
	Fri, 30 Jun 2023 23:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1519210E1CA;
 Fri, 30 Jun 2023 23:15:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35UESarO009393; Fri, 30 Jun 2023 23:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fek3r6JbPOfPf/KuO5cIRxThw/Pivq2Iwcwz/5/g+Ok=;
 b=BS5TfcznCmA5LEXekTc3TphzorXL4NgFwljWom3u57lUkFZ3LS8gXsrRKFeZfOx2Jf1p
 4dIpfi24qsRhulmWXp+7hic1FzSHskP7PALvoTNZRbzV/qu8P158ERmBtvBg33/GSO5x
 pRFNvyO/SnKjU2Yv16rH9d/COoTKfbsbTzazEksDdb5VATywfMhqap/BD8eOBtMLnYJP
 ST+7gKYe+nQ7T/gJUCz7nn46zKNpY7x3nK+lmh1jDqgkl+tgIeAcGlQRH9IPdaYTRylU
 riYdPEYb0xZPbzPQk6t0YO64QsKLZug0fY1TNXg15FKkc7BgG4wPLt+5bwYZmTRvRPfP ZA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhfewb6sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 23:15:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UNF7MJ007051
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 23:15:07 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 16:15:06 -0700
Message-ID: <f8fa50fb-40a6-cec9-c0ba-9dc98bc85b1f@quicinc.com>
Date: Fri, 30 Jun 2023 16:15:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/6] Add support to print sub block registers in dpu hw
 catalog
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Ryan McCann
 <quic_rmccann@quicinc.com>
References: <20230622-devcoredump_patch-v1-0-3b2cdcc6a576@quicinc.com>
 <nywovdd4op22ylnrntqx2f6x2plmfrxsgsirq6vmqu2eemulzq@z5sc2kmypl74>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <nywovdd4op22ylnrntqx2f6x2plmfrxsgsirq6vmqu2eemulzq@z5sc2kmypl74>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0_Kc7ni3azEfnesga67iYZIaUlBeY4S9
X-Proofpoint-GUID: 0_Kc7ni3azEfnesga67iYZIaUlBeY4S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300204
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/23/2023 12:10 AM, Marijn Suijten wrote:
> It is nice if cover letters also include the subsystem:
> 
> drm/msm: Add support to print DPU sub-block registers
> 
> On 2023-06-22 16:48:52, Ryan McCann wrote:
>> The purpose of this patch series is to add support to print the registers
>> of sub blocks in the dpu hardware catalog and fix the order in which all

Hey Marijn,

Sorry for the late response -- had to shift focus onto another feature 
for a bit.

> 
> Global nit: I think we previously settled on "sblk" or "sub-block(s)",
> not "sub blocks".
> 
> And capitalize DPU.

Acked.

> 
>> hardware blocks are dumped for a device core dump. This involves:
>>
>> 1. Changing data structure from stack to queue to fix the printing order
>> of the device core dump.
>>
>> 2. Removing redundant suffix of sub block names.
>>
>> 3. Removing redundant prefix of sub block names.
>>
>> 4. Eliminating unused variable from relevant macros.
> 
> Dmitry has been doing that in one of his DPU catalog reworks.

Got it. Is there a specific one that's making similar changes? IIRC, I 
didn't see one that was changing the *_SBLK macro.

> 
>> 5. Defining names for sub blocks that have not yet been defined.
> 
> Let's see what this means, because the code logic should already be able
> to figure this out (and in some places we can perhaps delete the name
> entirely).
> 
>> 6. Implementing wrapper function that prints the registers of sub blocks
>> when there is a need.
> 
> Thought this could be rather automated, but let me see what it means in
> the patches.
> 
>> Sample Output of the sspp_0 block and its sub blocks for devcore dump:
>> ======sspp_0======
>> ...registers
>> ...
>> ====sspp_0_scaler====
> 
> My suggestion would be to put less emphasis on this header with:
> 
>      ----sspp_0_scaler----
> 
> So that it becomes obvious that this is a sblk of the ====sspp_0====
> above.

FWIW, I think having the main block name prefix in the sblk header makes 
it clear which blocks are main block and which ones are sblks.

In addition, I'd like to keep this change within DPU (aside from the fix 
in the first patch) since implementing this change would require 
changing the *_add_block() parameters, and DSI/DP don't seem to have a 
need for conditional header formatting.

Thanks,

Jessica Zhang

> 
>> ...
>> ...
>> ====sspp_0_csc====
>> ...
>> ...
>> ====next_block====
>> ...
>>
>> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> 
> No need for sign-off in cover letters.
> 
> - Marijn
> 
>> ---
>> Ryan McCann (6):
>>        drm/msm: Update dev core dump to not print backwards
>>        drm/msm/dpu: Drop unused num argument from relevant macros
>>        drm/msm/dpu: Define names for unnamed sblks
>>        drm/msm/dpu: Remove redundant suffix in name of sub blocks
>>        drm/msm/disp: Remove redundant prefix in name of sub blocks
>>        drm/msm/dpu: Update dev core dump to dump registers of sub blocks
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  90 +++++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 194 +++++++++++++++++++---
>>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |   2 +-
>>   3 files changed, 214 insertions(+), 72 deletions(-)
>> ---
>> base-commit: 710025fdedb3767655823c3a12d27d404d209f75
>> change-id: 20230622-devcoredump_patch-df7e8f6fd632
>>
>> Best regards,
>> -- 
>> Ryan McCann <quic_rmccann@quicinc.com>
>>
