Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C776F5ED0
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 21:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD9310E349;
	Wed,  3 May 2023 19:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC74110E331;
 Wed,  3 May 2023 19:03:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343IihEo005010; Wed, 3 May 2023 19:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oISPQxluqbl4On+7YmfQeoS+KkWVMHPZzfr99WKe0Wk=;
 b=dab2iOfMDxQFghfBkLaIJIddBluZ0miuiCNVmWwQ8TbYJqe5Dc/i8ZtZuNQVLIPl5w/S
 skKRcOCZIELDXk0AxtkFvb6s4PWi/pWkHUsyWjLYOKQvE9/aodb7cdfbimBG0mux2VoH
 j3MugV8GaQHv0nrVbB87jM73dZle55Zl0Xl8zeShJ6VU2hPknoCC1H1cyiP/gDvWd0dy
 AZ/p5VtccFRmVvq8PwC+cn/DOdctetKPT8GsYhi6E0sdigTf9SIj48HP0H4hHAfrXTW2
 B4b1P04paPi9TcUiEMICjzTdTMrtlp+5Y0CtLInN3f3UpoqymjUTAiaYWTq+o9v8OEwE hw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbmy496pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 19:03:43 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343J3grO032249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 19:03:42 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 12:03:41 -0700
Message-ID: <7117aadb-0289-01ff-6eb9-8bfc358eca63@quicinc.com>
Date: Wed, 3 May 2023 12:03:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] drm/msm/dpu: Add has_data_compress to dpu_caps
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-3-6bc6f03ae735@quicinc.com>
 <v5hmqtjwd3syqwo5nqru7xgpt3rv5ubfbzt6pssriyb7cuprkf@7zdvwsil67nc>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <v5hmqtjwd3syqwo5nqru7xgpt3rv5ubfbzt6pssriyb7cuprkf@7zdvwsil67nc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qouUC3jHjn1ltASM3U2HMI0tBlp5UiOg
X-Proofpoint-GUID: qouUC3jHjn1ltASM3U2HMI0tBlp5UiOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_13,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=927 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030163
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 12:07 AM, Marijn Suijten wrote:
> On 2023-05-02 18:19:14, Jessica Zhang wrote:
>> Add data_compress feature to DPU HW catalog.
>>
>> In DPU 7.x and later, there is a DATA_COMPRESS register that must be set
>> within the DPU INTF block for DSC to work.
>>
>> As core_rev (and related macros) was removed from the dpu_kms struct, the
>> most straightforward way to indicate the presence of this register would be
>> to have a flag in dpu_caps.
> 
> This is a very generic name to have in the global dpu_caps for a very
> specific register on the INTF block since DPU >= 7.0.0, and I doubt any
> new catalog contributor will know how to fill this field.  After all,
> DPU < 7.0.0 also has DCE but it is controlled via the PINGPONG block.
> 
> Instead, how about having it as a DPU_INTF_DATA_COMPRESS (or similar)
> feature flag on the INTF block?  We do the same for other (register
> related) features on the INTF block, and you did the same to disable DSC
> callbacks on PP in [1].

Hi Marijn,

Sounds good.

> 
> In fact it seems that the DSC/DCE (enablement) registers have been moved
> from PINGPONG to INTF in DPU 7.0.0.  Can you clarify in the patch
> message for v2 that this is the case, and do the same in the linked
> PINGPONG patch?  Perhaps these patches should be part of the same series
> as they do not seem DSI-specific.

Will make a note of the PP to INTF change in the commit message.

I would prefer to keep this patch in this series is because it is needed 
for DSI over command mode to work and the subsequent patch is 
specifically for command mode.

Thanks,

Jessica Zhang

> 
> [1]: https://lore.kernel.org/linux-arm-msm/1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com/
> 
> - Marijn
> 
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 ++
>>   6 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> index f98c2a5b0e87..4160a35ff20f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
>>   	.has_dim_layer = true,
>>   	.has_idle_pc = true,
>>   	.has_3d_merge = true,
>> +	.has_data_compress = true,
>>   	.max_linewidth = 4096,
>>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> index 3fd0498ab420..23230841a0d1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>>   	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>>   	.has_dim_layer = true,
>>   	.has_idle_pc = true,
>> +	.has_data_compress = true,
>>   	.max_linewidth = 2400,
>>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index ce583eb14b06..c990406e4bca 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>>   	.has_dim_layer = true,
>>   	.has_idle_pc = true,
>>   	.has_3d_merge = true,
>> +	.has_data_compress = true,
>>   	.max_linewidth = 5120,
>>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> index 3950e7b946a5..7094640e2fbf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>   	.has_dim_layer = true,
>>   	.has_idle_pc = true,
>>   	.has_3d_merge = true,
>> +	.has_data_compress = true,
>>   	.max_linewidth = 5120,
>>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> index 1b3f5424aea8..970049559e02 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
>>   	.has_dim_layer = true,
>>   	.has_idle_pc = true,
>>   	.has_3d_merge = true,
>> +	.has_data_compress = true,
>>   	.max_linewidth = 5120,
>>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index b410a85c109c..c5bbd4ad6da8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -380,6 +380,7 @@ struct dpu_rotation_cfg {
>>    * @has_dim_layer      dim layer feature status
>>    * @has_idle_pc        indicate if idle power collapse feature is supported
>>    * @has_3d_merge       indicate if 3D merge is supported
>> + * @has_data_compress  indicate if data compression is supported
>>    * @max_linewidth      max linewidth for sspp
>>    * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>>    * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
>> @@ -393,6 +394,7 @@ struct dpu_caps {
>>   	bool has_dim_layer;
>>   	bool has_idle_pc;
>>   	bool has_3d_merge;
>> +	bool has_data_compress;
>>   	/* SSPP limits */
>>   	u32 max_linewidth;
>>   	u32 pixel_ram_size;
>>
>> -- 
>> 2.40.1
>>
