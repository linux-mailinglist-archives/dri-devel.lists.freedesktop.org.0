Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D106D53DD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 23:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF9F10E59C;
	Mon,  3 Apr 2023 21:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C60210E59C;
 Mon,  3 Apr 2023 21:46:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 333IxxDu031153; Mon, 3 Apr 2023 21:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1A8mAgNQ9fS0dXOIiNiPmQRDXgTAJ4CHRyV8P0+Hzj4=;
 b=OYRM6E5YrXgcYIREyqAft0KoiL00NWQ46+aZMyjW9NDFcLD3h45YVYWdHz6LI1tYdObh
 qOT5U+uC+dGD0GW1pHrucrAH1alDtxHDeeSjqPGkJ8OD3YvBaFmK+XrUaF4vhSGQgqMb
 JUO6J7fHEDkEX6FQwv98rRZ/oS6tKeCbGmBH/G8n8zkT0qhW2js6IKZ4G6eUXV9aZ5/e
 z37Yo6/ir/SVT9bXUoB1Vn3hRgXcAVyWpG/lOWYwzQ9srA6aCrrZKNyY27lgPCsolfE1
 V5ZT1nhxlBJHjeL6LgNUdQRYBRk6AA7atzaXEbuGPiMo31Dg7BDSuc3kBNgN71/utmU/ og== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pr4jm89w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 21:46:21 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333LkK2K027308
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Apr 2023 21:46:20 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 14:46:20 -0700
Message-ID: <66d8e3e1-b1b1-e1b5-4590-ebccde03a6be@quicinc.com>
Date: Mon, 3 Apr 2023 14:46:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v2 5/6] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-5-3c13ced536b2@quicinc.com>
 <deb5c8d2-2766-82ec-e116-f353fcb331f3@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <deb5c8d2-2766-82ec-e116-f353fcb331f3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0Ey4M2AMtZzCZaOjLliDToIXPqxkHw4o
X-Proofpoint-GUID: 0Ey4M2AMtZzCZaOjLliDToIXPqxkHw4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_17,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304030172
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/2/2023 4:29 AM, Dmitry Baryshkov wrote:
> On 31/03/2023 21:49, Jessica Zhang wrote:
>> Use MSM and DRM DSC helper methods to configure DSC for DSI.
>>
>> Changes in V2:
>> - *_calculate_initial_scale_value --> *_set_initial_scale_value
>> - Split pkt_per_line and eol_byte_num changes to a separate patch
>> - Moved pclk_per_line calculation to hdisplay adjustment in `if (dsc)`
>>    block of dsi_update_dsc_timing()
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 74d38f90398a..b7ab81737473 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -28,6 +28,7 @@
>>   #include "dsi.xml.h"
>>   #include "sfpb.xml.h"
>>   #include "dsi_cfg.h"
>> +#include "msm_dsc_helper.h"
>>   #include "msm_kms.h"
>>   #include "msm_gem.h"
>>   #include "phy/dsi_phy.h"
>> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct 
>> msm_dsi_host *msm_host, bool is_cmd_mod
>>       /* first calculate dsc parameters and then program
>>        * compress mode registers
>>        */
>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>       /*
>>        * If slice_count is greater than slice_per_intf
>> @@ -951,7 +952,11 @@ static void dsi_timing_setup(struct msm_dsi_host 
>> *msm_host, bool is_bonded_dsi)
>>            * pulse width same
>>            */
>>           h_total -= hdisplay;
>> -        hdisplay /= 3;
>> +        if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>> +            hdisplay = msm_dsc_get_uncompressed_pclk_per_line(dsc, 
>> hdisplay,
>> +                    dsi_get_bpp(msm_host->format)) / 3;
>> +        else
>> +            hdisplay /= 3;
>>           h_total += hdisplay;
>>           ha_end = ha_start + hdisplay;
> 
> This chunk changes the calculated value (two other are mere updates to 
> use new functions). Please move it to a separate patch, add proper 
> description/justification and possibly a Fixes tag, if the original code 
> was incorrect.

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>>       }
>> @@ -1759,7 +1764,7 @@ static int dsi_populate_dsc_params(struct 
>> msm_dsi_host *msm_host, struct drm_dsc
>>           return ret;
>>       }
>> -    dsc->initial_scale_value = 32;
>> +    drm_dsc_set_initial_scale_value(dsc);
>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>>       return drm_dsc_compute_rc_parameters(dsc);
>>
> 
> -- 
> With best wishes
> Dmitry
> 
