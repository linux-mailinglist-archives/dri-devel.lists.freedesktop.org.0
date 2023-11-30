Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6731B7FFE97
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 23:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CE910E05B;
	Thu, 30 Nov 2023 22:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC2E10E05A;
 Thu, 30 Nov 2023 22:41:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AUMRq33024023; Thu, 30 Nov 2023 22:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Vexax5Lwygt2DRmCytzPYqLZ+7assqLIoKPkyKRQ7aM=;
 b=Z9eIZFd2WMiD98YStG9Nf9TvaTl+y/KTHpI3re6kt6/rkLbALcbw4C/NcDxHKCWDQwZ5
 GXaCa2G3RTIfcckNqEOiBu4EyV4Cdg7ijN+w5FxxGLYTtGhQ5DJeVzSmrDSePJYrViw9
 JKxtmZDOQVCY62BeINGvsjtbXQmdqITzMnqh2K6wbe7lDkkDHIq57RhTMF5ZnY3gtscU
 1REs90aLxt+3GTXPPgsDwzoiH83I/RbZG4spCNRreEVK/GzU/acne136s1TL8br8kM4s
 JRpCpH68wZHI9TmoZVOHkd+2hYC57wGU7vQuvQ3AXLtF+/CcEkUoimWtCDHpCW3NpHdQ Wg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upv4818t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 22:41:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUMfHVw016661
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 22:41:17 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 14:41:17 -0800
Message-ID: <f990043a-eb17-dc5d-3257-ed95efcee8e3@quicinc.com>
Date: Thu, 30 Nov 2023 14:41:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-5-quic_abhinavk@quicinc.com>
 <CAA8EJpoQ0L_b=KDQxuXEL4KbaP1DACq1Qpw6m_ot6m+UYsHZWg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoQ0L_b=KDQxuXEL4KbaP1DACq1Qpw6m_ot6m+UYsHZWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dbBQUbkUqIScm6kbF2VdY5kc44p9WIKO
X-Proofpoint-ORIG-GUID: dbBQUbkUqIScm6kbF2VdY5kc44p9WIKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300167
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



On 8/30/2023 3:57 PM, Dmitry Baryshkov wrote:
> On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
>> YUV format output from writeback block.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>>   3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 3b5061c4402a..5252170f216d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -251,10 +251,19 @@ static const struct dpu_mdss_version sc7280_mdss_ver = {
>>          .core_minor_ver = 2,
>>   };
>>
>> +static const struct dpu_cdm_cfg sc7280_cdm = {
>> +       .name = "cdm_0",
>> +       .id = CDM_0,
>> +       .len = 0x228,
>> +       .base = 0x79200,
>> +       .features = 0,
> 
> No need to.
> Also, as the CDM block seems to be common to all existing platforms,
> what about moving this definition to dpu_hw_catalog.c next to VBIF
> settings?
> 

Thanks for the feedback and sorry for the delay in getting back to this 
feature.

Ack. Yes lets move it to dpu_hw_catalog.c and remove explicit 0 
assignment for features.

>> +};
>> +
>>   const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>          .mdss_ver = &sc7280_mdss_ver,
>>          .caps = &sc7280_dpu_caps,
>>          .mdp = &sc7280_mdp,
>> +       .cdm = &sc7280_cdm,
>>          .ctl_count = ARRAY_SIZE(sc7280_ctl),
>>          .ctl = sc7280_ctl,
>>          .sspp_count = ARRAY_SIZE(sc7280_sspp),
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 6c9634209e9f..4ea7c3f85a95 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -693,6 +693,17 @@ struct dpu_vbif_cfg {
>>          u32 memtype[MAX_XIN_COUNT];
>>   };
>>
>> +/**
>> + * struct dpu_cdm_cfg - information of chroma down blocks
>> + * @name               string name for debug purposes
>> + * @id                 enum identifying this block
>> + * @base               register offset of this block
>> + * @features           bit mask identifying sub-blocks/features
>> + */
>> +struct dpu_cdm_cfg {
>> +       DPU_HW_BLK_INFO;
>> +};
>> +
>>   /**
>>    * Define CDP use cases
>>    * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
>> @@ -816,6 +827,8 @@ struct dpu_mdss_cfg {
>>          u32 wb_count;
>>          const struct dpu_wb_cfg *wb;
>>
>> +       const struct dpu_cdm_cfg *cdm;
>> +
>>          u32 ad_count;
>>
>>          u32 dspp_count;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> index d85157acfbf8..4d6dba18caf0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>> @@ -185,6 +185,11 @@ enum dpu_dsc {
>>          DSC_MAX
>>   };
>>
>> +enum dpu_cdm {
>> +       CDM_0 = 1,
>> +       CDM_MAX
>> +};
>> +
>>   enum dpu_pingpong {
>>          PINGPONG_NONE,
>>          PINGPONG_0,
>> --
>> 2.40.1
>>
> 
> 
