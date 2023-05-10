Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994586FE746
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4218D10E55B;
	Wed, 10 May 2023 22:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1F310E0EA;
 Wed, 10 May 2023 22:35:32 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AMKmEk013886; Wed, 10 May 2023 22:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xZbuByYVk9HqmU6RT+EkIoUYWKwcElDJWynY8YMTrDE=;
 b=lfxiYo/JxT5b2I+39XHIUYp+Q2BozT2jIpteNrcKOmo6YueXuS9WDjjyYRpkqlRo7JER
 zLyCkQSZk06RvsWFr1MxE0HhyaK6iJRJrQt3SNZcRJB81JY5w8OzGQepmn9OtRlTLD4B
 FYRcljBqwmM7Oc3zX+lVwHDEmkB2ED54HudU5XL9pnHSOrDNxjlU6oju8W1rjT6BZzDs
 VaASz96JESuQjm9BVB5MLYoFsOHW0Wj2KJ7D0cubIxMlia0Vz8QVM47UfIRDcpylj/M7
 n9dn+2DkFBSVwbfkiPw9++t6jRstBNTJ9t7bxz3Hj3gc4XEBd1wbxX1JzuFGk+LH2NzQ 8g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg5mpsv48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:35:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMZTNl009190
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:35:29 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 15:35:28 -0700
Message-ID: <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
Date: Wed, 10 May 2023 15:35:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: _UNKHk6bxrIlUffp5g54piGQNe_AKAJj
X-Proofpoint-GUID: _UNKHk6bxrIlUffp5g54piGQNe_AKAJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100187
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/2023 11:29 PM, Marijn Suijten wrote:
> On 2023-05-09 15:06:48, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Add a helper setting config values which are typically constant across
>> operating modes (table E-4 of the standard) and mux_word_size (which is
>> a const according to 3.5.2).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Same question about ordering.

Hi Marijn,

This patch was authored by Dmitry and originally part of his DRM DSC 
helpers series [1], but was removed from that series for mergeability 
reasons.

Looking over the kernel documentation, the last Signed-off-by should be 
from the patch submitter [2], so I think my s-o-b tag should be at the 
bottom.

As for the order in the previous patch, I can add a duplicate s-o-b 
before Dmitry's so that it reflects the history of the patch.

Thanks,

Jessica Zhang

[1] https://patchwork.freedesktop.org/patch/530512/?series=114472&rev=4
[2] 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> 
> Reviewed-by:  Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/display/drm_dsc_helper.c | 22 ++++++++++++++++++++++
>>   include/drm/display/drm_dsc_helper.h     |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>> index 65e810a54257..b9c4e10ced41 100644
>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> @@ -270,6 +270,28 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>>   }
>>   EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
>>   
>> +/**
>> + * drm_dsc_set_const_params() - Set DSC parameters considered typically
>> + * constant across operation modes
>> + *
>> + * @vdsc_cfg:
>> + * DSC Configuration data partially filled by driver
>> + */
>> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg)
>> +{
>> +	if (!vdsc_cfg->rc_model_size)
>> +		vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
>> +	vdsc_cfg->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
>> +	vdsc_cfg->rc_tgt_offset_high = DSC_RC_TGT_OFFSET_HI_CONST;
>> +	vdsc_cfg->rc_tgt_offset_low = DSC_RC_TGT_OFFSET_LO_CONST;
>> +
>> +	if (vdsc_cfg->bits_per_component <= 10)
>> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
>> +	else
>> +		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>> +}
>> +EXPORT_SYMBOL(drm_dsc_set_const_params);
>> +
>>   /* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
>>   static const u16 drm_dsc_rc_buf_thresh[] = {
>>   	896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index 422135a33d65..bfa7f3acafcb 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -21,6 +21,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
>>   int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
>>   void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>>   			      const struct drm_dsc_config *dsc_cfg);
>> +void drm_dsc_set_const_params(struct drm_dsc_config *vdsc_cfg);
>>   void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>
>> -- 
>> 2.40.1
>>
