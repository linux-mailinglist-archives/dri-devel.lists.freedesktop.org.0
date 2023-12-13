Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57481084B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 03:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024910E23F;
	Wed, 13 Dec 2023 02:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195D510E23F;
 Wed, 13 Dec 2023 02:37:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCNxLTA013353; Wed, 13 Dec 2023 02:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=GH7d3b3O5n+iS8TUgWJ4YhWeM/IfUOQCdp64CsAQ4PU=; b=Iw
 1rxKZz6PGDH+5HpuFHwYbnPDSUSbotdpkqhjNEWPAoftLQl0U+1MaYous2wXzBcf
 kbB/3xjtT8bO2WVAWUKKCIc51zchOz/C0EOrERt7wz1fcMilR5ZHeqwP5Yp29pC2
 HWuYDXwtOQ7/pzKcS35KiOC7onek+Ro6E4TTEH0OcD17Zq9HzGe4hhASPwBYRiZV
 TJcNhvsPETbiaoXXlZf+kOInLPND0kcuJyhCPcq/jZfKYubdZsY+FZbS8R/f72jU
 OEG3Q9igha4GXAwKYrsiYYuomRlUns8dpywltsx3gCUqC+YuHdiPcx8yzJfqHwRj
 S3uA92rb00ciFWR6xLdw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux65341fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 02:37:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD2bBJk011457
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 02:37:11 GMT
Received: from [10.110.0.246] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 18:37:09 -0800
Message-ID: <27423c14-bdcb-4053-a7c3-b2c9d6c4e771@quicinc.com>
Date: Tue, 12 Dec 2023 18:37:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH 0/2] drm/msm/dpu: INTF CRC configuration
 cleanups and fix
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231130-encoder-fixup-v1-0-585c54cd046e@quicinc.com>
 <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpof5LO7pyXaqgtbL=sL2a2Te2tzLF-NrTFT7n58pB3iww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0jf2xS-RJCDQoDu-F6Vv1z690TgLCCND
X-Proofpoint-GUID: 0jf2xS-RJCDQoDu-F6Vv1z690TgLCCND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130017
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 11:39 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:31, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> This series drops the frame_count and enable parameters (as they're always
>> set to the same value). It also sets input_sel=0x1 for INTF.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>> Jessica Zhang (2):
>>        drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
>>        drm/msm/dpu: Set input_sel bit for INTF
> 
> Please change the order of the commits: fix (input_sel) comes first,
> then comes the improvement.
> Otherwise if one needs to backport this fix, they either need to pick
> up the irrelevant patch, or they have to rework the fix.

Acked.

Thanks,

Jessica Zhang

> 
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 18 +++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 11 +++++------
>>   8 files changed, 26 insertions(+), 30 deletions(-)
>> ---
>> base-commit: 4047f50eb64d980fcd581a19bbe6164dab25ebc7
>> change-id: 20231122-encoder-fixup-61c190b16085
>>
>> Best regards,
>> --
>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>
> 
> 
> -- 
> With best wishes
> Dmitry
