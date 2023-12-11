Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2980DD27
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 22:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022D10E4FF;
	Mon, 11 Dec 2023 21:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A83310E4FD;
 Mon, 11 Dec 2023 21:32:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBLWlcw025025; Mon, 11 Dec 2023 21:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=R0T3Sr76zrL+MByRwH2Ku+XEsLnwjnllAC7E/OWtj1Y=; b=CA
 h4t83aOAmM2nFt0AlDn5ETVS+yHMQAuaE0DtyNYKaxzSEso0evu7KWZJlZXNsFXS
 YRDq3uEyG6vQCWMBW2g/XinIwLtxzDtod52SZ/Kr+sBdREFTSuAZJZDdB3z1PavS
 EKjYlVNKhMlPP/ACeLAgcpclDFMkGgi/UmRlSfa3fe8Nu418YOGOaNPVAyPEiHwc
 XFb4LORHivwifKcA1nNsQpB+fyShtj76nuSSUXccdh2IB7DT1/eIT2ms4wkKhgkz
 H8ZA+2Xep1sOxM0NYHS+yvI7Hu/a0MZJu0NrTVkeuNqvxgZW2hT7ROfppV39wiaP
 iDBU6HvMrTnHa4lKpwsA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxaawg0dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 21:32:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBLWk1q023962
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Dec 2023 21:32:46 GMT
Received: from [10.110.62.164] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 13:32:45 -0800
Message-ID: <e9634306-dbc4-fe5d-3227-321a492c73cb@quicinc.com>
Date: Mon, 11 Dec 2023 13:32:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280
 dpu_hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
 <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
 <4966bfa0-ef50-a02d-a917-86d82429e45e@quicinc.com>
 <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqu42b0AP8Ar2LoFcrS51iKTUM1Qr++j7MYjv4WCx=tCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RjOzYs8LSyvtvVV5ttmZDKysQ0Ew54lw
X-Proofpoint-GUID: RjOzYs8LSyvtvVV5ttmZDKysQ0Ew54lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=975 mlxscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110178
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
 quic_parellan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/11/2023 1:31 PM, Dmitry Baryshkov wrote:
> On Mon, 11 Dec 2023 at 23:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/8/2023 3:19 AM, Dmitry Baryshkov wrote:
>>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Add CDM blocks to the sc7280 dpu_hw_catalog to support
>>>> YUV format output from writeback block.
>>>>
>>>> changes in v2:
>>>>           - remove explicit zero assignment for features
>>>>           - move sc7280_cdm to dpu_hw_catalog from the sc7280
>>>>             catalog file as its definition can be re-used
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>>>>    4 files changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> index 209675de6742..19c2b7454796 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>>> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>>>>           .mdss_ver = &sc7280_mdss_ver,
>>>>           .caps = &sc7280_dpu_caps,
>>>>           .mdp = &sc7280_mdp,
>>>> +       .cdm = &sc7280_cdm,
>>>>           .ctl_count = ARRAY_SIZE(sc7280_ctl),
>>>>           .ctl = sc7280_ctl,
>>>>           .sspp_count = ARRAY_SIZE(sc7280_sspp),
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index d52aae54bbd5..1be3156cde05 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>>>>           .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>>>>    };
>>>>
>>>> +/*************************************************************
>>>> + * CDM sub block config
>>>
>>> Nit: it is not a subblock config.
>>>
>>
>> Ack.
>>
>>>> + *************************************************************/
>>>> +static const struct dpu_cdm_cfg sc7280_cdm = {
>>>
>>> I know that I have r-b'ed this patch. But then one thing occurred to
>>> me. If this definition is common to all (or almost all) platforms, can
>>> we just call it dpu_cdm or dpu_common_cdm?
>>>
>>>> +       .name = "cdm_0",
>>>> +       .id = CDM_0,
>>>> +       .len = 0x228,
>>>> +       .base = 0x79200,
>>>> +};
>>
>> hmmm .... almost common but not entirely ... msm8998's CDM has a shorter
>> len of 0x224 :(
> 
> Then sdm845_cdm?
> 

That also has a shorter cdm length.

BTW, sdm845 is not in this series. It will be part of RFT as we discussed.

>>
>>>> +
>>>>    /*************************************************************
>>>>     * VBIF sub blocks config
>>>>     *************************************************************/
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index e3c0d007481b..ba82ef4560a6 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
>>>>           u32 memtype[MAX_XIN_COUNT];
>>>>    };
>>>>
>>>> +/**
>>>> + * struct dpu_cdm_cfg - information of chroma down blocks
>>>> + * @name               string name for debug purposes
>>>> + * @id                 enum identifying this block
>>>> + * @base               register offset of this block
>>>> + * @features           bit mask identifying sub-blocks/features
>>>> + */
>>>> +struct dpu_cdm_cfg {
>>>> +       DPU_HW_BLK_INFO;
>>>> +};
>>>> +
>>>>    /**
>>>>     * Define CDP use cases
>>>>     * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
>>>> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
>>>>           u32 wb_count;
>>>>           const struct dpu_wb_cfg *wb;
>>>>
>>>> +       const struct dpu_cdm_cfg *cdm;
>>>> +
>>>>           u32 ad_count;
>>>>
>>>>           u32 dspp_count;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> index a6702b2bfc68..f319c8232ea5 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
>>>> @@ -185,6 +185,11 @@ enum dpu_dsc {
>>>>           DSC_MAX
>>>>    };
>>>>
>>>> +enum dpu_cdm {
>>>> +       CDM_0 = 1,
>>>> +       CDM_MAX
>>>> +};
>>>> +
>>>>    enum dpu_pingpong {
>>>>           PINGPONG_NONE,
>>>>           PINGPONG_0,
>>>> --
>>>> 2.40.1
>>>>
>>>
>>>
> 
> 
> 
