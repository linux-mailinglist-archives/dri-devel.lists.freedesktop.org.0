Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356973A84D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77F810E097;
	Thu, 22 Jun 2023 18:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD510E097;
 Thu, 22 Jun 2023 18:33:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MER6qE013156; Thu, 22 Jun 2023 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k/2KjtUkCTlnzexn8wa+BLiuKLkbtU1GdqoVpiiv8W0=;
 b=MFyuJM16/g5d/JGU0X7ChoD9VoUBfelGT9L2S8r0KIXuDv/7abpTKwbO7086Y2Cej5gQ
 9hCSy34C+4rmRsncM6x0oHJcfanIGiWwZVHaGTn2eo571jIdJzLxJqraQzMTZ0nsUqNS
 2RLxIiyaAF60/TH4sr71mrSpblVtiKkPdn3pX0yQRrV1d9d5WuTllg5AOVWeAlJsqTNa
 eSdrJRjOjy1Z9A3/UeiJyhbgOiV+5dz4Q3xNZ0RxKTjG2c+SGrLA+KN53rywfRmD3Pnd
 V+V9UMB6aYwP/rsoQEL25MOJzUj7DyIsDZaAIKh/iwV4lGvfZ/YlvTjzTW8yoKUzHPnw yQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc2rckgm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 18:32:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35MIWpFD014960
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 18:32:51 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 22 Jun
 2023 11:32:51 -0700
Message-ID: <add6f941-284e-7c38-b536-14541e518bcc@quicinc.com>
Date: Thu, 22 Jun 2023 11:32:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: retrieve DSI DSC struct through
 priv->dsi[0]
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1687364298-29430-1-git-send-email-quic_khsieh@quicinc.com>
 <1687364298-29430-2-git-send-email-quic_khsieh@quicinc.com>
 <a73ea5f4-310d-23c8-e686-decc3e59d602@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a73ea5f4-310d-23c8-e686-decc3e59d602@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FuO0yvdrooMIookhBtRsvla40XuOQjaE
X-Proofpoint-GUID: FuO0yvdrooMIookhBtRsvla40XuOQjaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_14,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=808
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220158
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
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/22/2023 7:00 AM, Dmitry Baryshkov wrote:
> On 21/06/2023 19:18, Kuogee Hsieh wrote:
>> Currently DSI DSC struct is populated at display setup during
>> system bootup. This mechanism works fine with embedded display
>> but not for pluggable displays as the DSC struct will become
>> stale once external display unplugged.
>>
>> Move storing of DSI DSC struct to both atomic_mode_set() and
>> atomic_enable() so that same mechanism will work for both
>> embedded display and pluggable displays.
>>
>> Changes in v4:
>> -- fix checkpatch.pl warning
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 
>> +++++++++++++++++++++++++----
>>   1 file changed, 26 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 2e1873d..367d374 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct 
>> drm_encoder *drm_enc)
>>       return (num_dsc > 0) && (num_dsc > intf_count);
>>   }
>> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct 
>> drm_encoder *drm_enc)
>> +{
>> +    struct msm_drm_private *priv = drm_enc->dev->dev_private;
>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +    int index = dpu_enc->disp_info.h_tile_instance[0];
>> +
>> +    if (dpu_enc->disp_info.intf_type == INTF_DSI)
>> +        return msm_dsi_get_dsc_config(priv->dsi[index]);
>> +
>> +    return NULL;
>> +}
>> +
>>   static struct msm_display_topology dpu_encoder_get_topology(
>>               struct dpu_encoder_virt *dpu_enc,
>>               struct dpu_kms *dpu_kms,
>>               struct drm_display_mode *mode,
>> -            struct drm_crtc_state *crtc_state)
>> +            struct drm_crtc_state *crtc_state,
>> +            struct drm_dsc_config *dsc)
>>   {
>>       struct msm_display_topology topology = {0};
>>       int i, intf_count = 0;
>> @@ -579,7 +592,7 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>       topology.num_intf = intf_count;
>> -    if (dpu_enc->dsc) {
>> +    if (dsc) {
>>           /*
>>            * In case of Display Stream Compression (DSC), we would use
>>            * 2 DSC encoders, 2 layer mixers and 1 interface
>> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>>       struct drm_display_mode *adj_mode;
>>       struct msm_display_topology topology;
>>       struct dpu_global_state *global_state;
>> +    struct drm_dsc_config *dsc;
>>       int i = 0;
>>       int ret = 0;
>> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>>           }
>>       }
>> -    topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>> crtc_state);
>> +    dsc = dpu_encoder_get_dsc_config(drm_enc);
>> +
>> +    topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>> crtc_state, dsc);
>>       /*
>>        * Release and Allocate resources on every modeset
>> @@ -1056,6 +1072,8 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>       trace_dpu_enc_mode_set(DRMID(drm_enc));
>> +    dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>> +
>>       /* Query resource that have been reserved in atomic check step. */
>>       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>           drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
>> @@ -1187,6 +1205,8 @@ static void 
>> dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>       dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +    dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> 
> Let's have a single place where dpu_enc->dsc is set. I have slight 
> preference for atomic_enable, but atomic_mode_set is fine too.
> 

Yes, it was in a single place in v3. Then some mistake happened and it 
got dropped in v4. Now, it has been added back for v5.

Sorry for the confusion.
