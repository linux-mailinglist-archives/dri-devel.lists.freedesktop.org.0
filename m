Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D8724F02
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 23:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB7410E3CE;
	Tue,  6 Jun 2023 21:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D53210E3CE;
 Tue,  6 Jun 2023 21:48:57 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356LgTXp002720; Tue, 6 Jun 2023 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Dup6Sn3Ee73dXIJOK9wTvQhxLryIo4XSmfEySws+h24=;
 b=mGHie9sa18IfEAEvxF4iD8saVfOF+iOXeqzg40Kho6PBu/zRhgsrzlNOu3qf7rIWOmlc
 rBbG3TZiJFS7EU15n0p7XP6nipQULxTuJmRkXxGOBc10YRyXJ+7DZyUi7+G2mHJpn20l
 Lm1oHEyjnng13H97zJeOCDjlpH/fnQ8uE9uxGA3sXYqOOhvku68WQb4dZ9+Y/KtdN2Oz
 dMHoRPziQWhw4qfcCPjFLvyKFx5GXqxTAb02EeYx7ca5hbPDgTMGmHXjd5OoHmLAE4HU
 nDqIkl6ej6IHIFZBYXFoRJz+PLw9lFuNtg9+0CdXDPsoMPpeH1QUScZnYJ3jljCl1SVE 1Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a7k0ae2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 21:48:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356LmoSg023685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 21:48:50 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 6 Jun 2023
 14:48:47 -0700
Message-ID: <868e6966-1e3a-fcc1-3710-d9c5ad96d259@quicinc.com>
Date: Tue, 6 Jun 2023 14:48:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v17] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>,
 <marijn.suijten@somainline.org>
References: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
 <a5e25f3e-1b66-8a66-7e16-9d5c22a53e66@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a5e25f3e-1b66-8a66-7e16-9d5c22a53e66@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: o7VfX28WqfGAdsaeMJN6F4O1NGxTflnC
X-Proofpoint-ORIG-GUID: o7VfX28WqfGAdsaeMJN6F4O1NGxTflnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_16,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060181
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On 6/6/2023 1:21 PM, Dmitry Baryshkov wrote:
> On 06/06/2023 23:11, Kuogee Hsieh wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Some platforms have DSC blocks which have not been declared in the 
>> catalog.
>> Complete DSC 1.1 support for all platforms by adding the missing 
>> blocks to
>> MSM8998.
> 
> 'Some platforms' doesn't make sense if we are talking about a single 
> poor msm8998.
> 

If you dont mind, can you please fix this while applying? Thanks for 
consideration.

>>
>> Changes in v9:
>> -- add MSM8998 and SC8180x to commit title
>>
>> Changes in v10:
>> -- fix grammar at commit text
>>
>> Changes in v12:
>> -- fix "titil" with "title" at changes in v9
>>
>> Changes in v14:
>> -- "dsc" tp "DSC" at commit title
>>
>> Changes in v15:
>> -- fix merge conflicts at dpu_5_1_sc8180x.h
>>
>> Changes in v16
>> -- fix cherry-pick error by deleting both redundant .dsc and .dsc_count
>>     assignment from dpu_5_1_sc8180x.h
>>
>> Changes in v17
>> -- remove sc8180x from both commit title and text
>> -- remove Reviewed-by
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> index 3c732a0..7d0d0e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] 
>> = {
>>               DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>>   };
>> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
>> +    DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>> +    DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>> +};
>> +
>>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>>       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>>            &msm8998_dspp_sblk),
>> @@ -199,6 +204,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>       .dspp = msm8998_dspp,
>>       .pingpong_count = ARRAY_SIZE(msm8998_pp),
>>       .pingpong = msm8998_pp,
>> +    .dsc_count = ARRAY_SIZE(msm8998_dsc),
>> +    .dsc = msm8998_dsc,
>>       .intf_count = ARRAY_SIZE(msm8998_intf),
>>       .intf = msm8998_intf,
>>       .vbif_count = ARRAY_SIZE(msm8998_vbif),
> 
