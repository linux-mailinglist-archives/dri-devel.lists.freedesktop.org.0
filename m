Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B86A237F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F8410E23C;
	Fri, 24 Feb 2023 21:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5242010E09C;
 Fri, 24 Feb 2023 21:09:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OKY53F022876; Fri, 24 Feb 2023 21:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/IoXJe8XyjYluWekzt7MCy9knazuwG+FxGkiZk/M+ls=;
 b=WB9irxc8V1ekAEbv3v+OFeektmoNz02UWWXza1PakwlkV3EQofBOj0rRwx3zxtkANcmb
 +vG8W2AsHGznrZeaBP6rND+rBoQ+k29l8aPpnh7WfJtQA8/GpAT30xHDc/khp1aKaxhc
 0HlSudJM0AJ70piPyvKOAJjzvGPoqMHyKLCh9hmurH3CYGdXMVmNUlHOtzBPqPId032n
 uADu0JuLEINShzdMExUNyoQGvmnrKerMZlpbmEE8w/usny0oZzeLCfr+HfdUsOwCS6Oa
 xkIBjaGBLbRcXB6gLU+91rsIy4ztmch2GUWW0yJGWRDNTGXyZRtl+ta/4VojVVz4LIXE 1w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxuu11myc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 21:09:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OL9NxK008523
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 21:09:23 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 13:09:22 -0800
Message-ID: <21623a6d-7f83-5d2c-068c-f600a1834ac9@quicinc.com>
Date: Fri, 24 Feb 2023 13:09:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 2/2] drm/msm/dsi: use new dpu_dsc_populate_dsc_config()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>
 <525078f5-44be-9a75-a737-ddcc6e097700@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <525078f5-44be-9a75-a737-ddcc6e097700@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0lxBen9CYwzmuB3XWXpBbC68Eug5A8wO
X-Proofpoint-ORIG-GUID: 0lxBen9CYwzmuB3XWXpBbC68Eug5A8wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_15,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240169
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/24/2023 1:04 PM, Dmitry Baryshkov wrote:
> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>> use new introduced dpu_dsc_populate_dsc_config() to calculate
>> and populate drm_dsc_info instead of hard code value.
> 
> DPU is an optional component, so DSI driver should not depend on the DPU 
> driver.
> 

Today, the implicit dependency is already there. Without the DPU DSC 
blocks, the DSI cannot operate in compressed mode.

But, from a SW standpoint I agree we can separate this.

We can move this one level up to the disp/ or msm/ folder

What do you think about that?

>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 78 
>> ++++++--------------------------------
>>   1 file changed, 12 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 31ad193..5f3f84f 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights 
>> reserved
>>    */
>>   #include <linux/clk.h>
>> @@ -21,7 +22,6 @@
>>   #include <video/mipi_display.h>
>> -#include <drm/display/drm_dsc_helper.h>
>>   #include <drm/drm_of.h>
>>   #include "dsi.h"
>> @@ -31,6 +31,7 @@
>>   #include "msm_kms.h"
>>   #include "msm_gem.h"
>>   #include "phy/dsi_phy.h"
>> +#include "dpu_dsc_helper.h"
>>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>> @@ -1819,29 +1820,8 @@ static int dsi_host_parse_lane_data(struct 
>> msm_dsi_host *msm_host,
>>       return -EINVAL;
>>   }
>> -static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>> -    0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
>> -    0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>> -};
>> -
>> -/* only 8bpc, 8bpp added */
>> -static char min_qp[DSC_NUM_BUF_RANGES] = {
>> -    0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
>> -};
>> -
>> -static char max_qp[DSC_NUM_BUF_RANGES] = {
>> -    4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
>> -};
>> -
>> -static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>> -    2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
>> -};
>> -
>>   static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, 
>> struct drm_dsc_config *dsc)
>>   {
>> -    int i;
>> -    u16 bpp = dsc->bits_per_pixel >> 4;
>> -
>>       if (dsc->bits_per_pixel & 0xf) {
>>           DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support 
>> fractional bits_per_pixel\n");
>>           return -EINVAL;
>> @@ -1852,50 +1832,16 @@ static int dsi_populate_dsc_params(struct 
>> msm_dsi_host *msm_host, struct drm_dsc
>>           return -EOPNOTSUPP;
>>       }
>> -    dsc->rc_model_size = 8192;
>> -    dsc->first_line_bpg_offset = 12;
>> -    dsc->rc_edge_factor = 6;
>> -    dsc->rc_tgt_offset_high = 3;
>> -    dsc->rc_tgt_offset_low = 3;
>> -    dsc->simple_422 = 0;
>> -    dsc->convert_rgb = 1;
>> -    dsc->vbr_enable = 0;
>> -
>> -    /* handle only bpp = bpc = 8 */
>> -    for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
>> -        dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
>> -
>> -    for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>> -        dsc->rc_range_params[i].range_min_qp = min_qp[i];
>> -        dsc->rc_range_params[i].range_max_qp = max_qp[i];
>> -        /*
>> -         * Range BPG Offset contains two's-complement signed values 
>> that fill
>> -         * 8 bits, yet the registers and DCS PPS field are only 6 
>> bits wide.
>> -         */
>> -        dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i] & 
>> DSC_RANGE_BPG_OFFSET_MASK;
>> -    }
>> -
>> -    dsc->initial_offset = 6144;        /* Not bpp 12 */
>> -    if (bpp != 8)
>> -        dsc->initial_offset = 2048;    /* bpp = 12 */
>> -
>> -    if (dsc->bits_per_component <= 10)
>> -        dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
>> -    else
>> -        dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>> -
>> -    dsc->initial_xmit_delay = 512;
>> -    dsc->initial_scale_value = 32;
>> -    dsc->first_line_bpg_offset = 12;
>> -    dsc->line_buf_depth = dsc->bits_per_component + 1;
>> -
>> -    /* bpc 8 */
>> -    dsc->flatness_min_qp = 3;
>> -    dsc->flatness_max_qp = 12;
>> -    dsc->rc_quant_incr_limit0 = 11;
>> -    dsc->rc_quant_incr_limit1 = 11;
>> -
>> -    return drm_dsc_compute_rc_parameters(dsc);
>> +    /*
>> +     * NOTE:
>> +     * dsc->dsc_version_major, dsc->dsc_version_minor
>> +     * dsc->bits_per_pixel,
>> +     * dsc->bits_per_component,
>> +     * dsc->native_422, dsc->native_420
>> +     *
>> +     * above parameters must be populated
> 
> Comments
> In Yoda style
> written should be not.
> 
>> +     */
>> +    return dpu_dsc_populate_dsc_config(dsc, 0);
>>   }
>>   static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
> 
