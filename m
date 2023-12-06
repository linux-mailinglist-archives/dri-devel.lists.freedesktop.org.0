Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486528079F5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C510E7B7;
	Wed,  6 Dec 2023 21:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981C10E7B4;
 Wed,  6 Dec 2023 21:02:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B6KMuXZ004301; Wed, 6 Dec 2023 21:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A/TdFogqS98WsB2VdzA9zHOz7vrXoiXkxMW3XDsQTvA=;
 b=J/s/eqVVWUmM7wih7vlBzxjMHzaBK1yrcf8WioWBdJDspIa6XqwQCdCUv2CemfdBS05b
 7cZ9JB50VhWneVhHwksqu210JFLn+PPBZ7DHNqxniX3qtquncBM1RNzr2Xsp3TKTjQbw
 3QtFkLCka/GDxq/A826FsjoOQWlK+FTuCHAg1n0/T8/j3QOjaFoK/+xY3owVg+bwy5j2
 mbUc4jUkIDfKaTYNa2xpjjegq59r+38gjIKYbe40wCcowjCZ0uM4IRz3Iu3aF2N4/UDS
 wArkWUJeqotDIAVc3yFsUYzKaqD5FLTiGb8L5Oz3LTDfsNV3CR+JjHnvX+9iDEP417bP 8A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd0qk3ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Dec 2023 21:02:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6L24s6028235
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Dec 2023 21:02:04 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 13:02:03 -0800
Message-ID: <27074b58-25ed-dbcc-1048-dbd9ba3135c9@quicinc.com>
Date: Wed, 6 Dec 2023 13:02:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-8-quic_abhinavk@quicinc.com>
 <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
 <5bcbb092-1d29-f795-3be4-5ab1c708cba0@quicinc.com>
In-Reply-To: <5bcbb092-1d29-f795-3be4-5ab1c708cba0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Uh0pt5t0JoG5-gBSUVzKlZjor24-Zu7e
X-Proofpoint-ORIG-GUID: Uh0pt5t0JoG5-gBSUVzKlZjor24-Zu7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_14,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=981 lowpriorityscore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060140
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/30/2023 3:47 PM, Abhinav Kumar wrote:
> 
> 
> On 8/30/2023 4:48 PM, Dmitry Baryshkov wrote:
>> On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>> Add the RM APIs necessary to initialize and allocate CDM
>>> blocks by the rest of the DPU pipeline.
>>
>> ... to be used by the rest?
>>
> 
> Yes, thanks.
> 
> 
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>>>   2 files changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f9215643c71a..7b6444a3fcb1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -8,6 +8,7 @@
>>>   #include "dpu_kms.h"
>>>   #include "dpu_hw_lm.h"
>>>   #include "dpu_hw_ctl.h"
>>> +#include "dpu_hw_cdm.h"
>>>   #include "dpu_hw_pingpong.h"
>>>   #include "dpu_hw_sspp.h"
>>>   #include "dpu_hw_intf.h"
>>> @@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>>                  }
>>>          }
>>>
>>> +       if (rm->cdm_blk)
>>> +               dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
>>> +
>>>          for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
>>>                  dpu_hw_wb_destroy(rm->hw_wb[i]);
>>>
>>> @@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>                  rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
>>>          }
>>>
>>> +       if (cat->cdm) {
>>> +               struct dpu_hw_cdm *hw;
>>> +
>>> +               hw = dpu_hw_cdm_init(cat->cdm, mmio);
>>> +               /* CDM is optional so no need to bail out */
>>> +               if (IS_ERR(hw)) {
>>> +                       rc = PTR_ERR(hw);
>>> +                       DPU_DEBUG("failed cdm object creation: err 
>>> %d\n", rc);
>>
>> No. If it is a part of the catalog, we should fail here as we do in 
>> other cases.
>>
> 
> I guess, the only reason for not failing here was other hw blocks are 
> needed even for basic display to come up but cdm is only for YUV formats.
> 
> Thats the only reason to mark this a failure which is "OK" to ignore.
> 
> But I see your point that if someone is listing this in the catalog but 
> still RM fails thats an error.
> 
> Hence, ack.
> 
>>
>>> +               } else {
>>> +                       rm->cdm_blk = &hw->base;
>>> +               }
>>> +       }
>>> +
>>>          return 0;
>>>
>>>   fail:
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index 2b551566cbf4..29b221491926 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -22,6 +22,7 @@ struct dpu_global_state;
>>>    * @hw_wb: array of wb hardware resources
>>>    * @dspp_blks: array of dspp hardware resources
>>>    * @hw_sspp: array of sspp hardware resources
>>> + * @cdm_blk: cdm hardware resource
>>>    */
>>>   struct dpu_rm {
>>>          struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>>> @@ -33,6 +34,7 @@ struct dpu_rm {
>>>          struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>>>          struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>>>          struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
>>> +       struct dpu_hw_blk *cdm_blk;
>>
>> struct dpu_hw_cdm *cdm (or cdm_blk), please.
> 
> Ack.
> 

I was going through this more. I think its better we leave this as a 
dpu_hw_blk because if you see the other blks in struct dpu_rm, all the 
blocks which are allocated dynamically / can change dynamically are of 
dpu_hw_blk type. That way the dpu_rm_get_assigned_resources() remains 
generic. Hence I would prefer to leave it this way.

>>
>>>   };
>>>
>>>   /**
>>> -- 
>>> 2.40.1
>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
