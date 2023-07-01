Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBC7445D8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 03:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2797610E510;
	Sat,  1 Jul 2023 01:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81B910E510;
 Sat,  1 Jul 2023 01:26:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3611GMMM022340; Sat, 1 Jul 2023 01:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=c8MoAoczUZ26WVq/Ok65mivZoU6UEi5l4mI5lWL/c9c=;
 b=TkCL+vjk67AFvnDVagB242aMkp6rC3DtHSYA9juIZhuKoP/ZOJ+vHoaF3yiFle22xaJE
 5YIdQIfXc/+vyNblVZ50YOHab8Z2oIFMYgmvhOkdl62HAnllaAWdHuvc6NtR0dUohTMh
 chbov+Xmag3xBmbsnW/99VujUifbB2xPaep0/S2n6u2yaL8uyhaOrTHnw3B4dvm9jxVH
 Jcvwwwii9waalyFSxOku7Y5E+QB+QnzP0Xu14EB1Bp0XKpkKNYLgFOjsodkTJi6xTVXM
 XXE/0iF2m+ZvdqQGcGvJtU4xnJGTeNEVNdgV1NMG92b25S7MyfA8G67kvaD2Vs9BzWZW RA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rj6y30d2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 Jul 2023 01:26:16 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3611QGmA016207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 1 Jul 2023 01:26:16 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 18:26:15 -0700
Message-ID: <f77c33eb-2696-2aa4-9f70-f783a04cf1cc@quicinc.com>
Date: Fri, 30 Jun 2023 18:26:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
 <572ecc01-71c1-6f64-d26c-145b870584d1@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <572ecc01-71c1-6f64-d26c-145b870584d1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 13yQYUmfowmd0yPAk9jK4uyF3GvcDY2-
X-Proofpoint-GUID: 13yQYUmfowmd0yPAk9jK4uyF3GvcDY2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_14,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307010012
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/29/2023 5:59 PM, Dmitry Baryshkov wrote:
> On 30/06/2023 03:25, Jessica Zhang wrote:
>> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
>> determine if the plane is solid fill. In addition drop the DPU plane
>> color_fill field as we can now use drm_plane_state.solid_fill instead,
>> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
>> allow userspace to configure the alpha value for the solid fill color.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Minor suggestion below.
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 4476722f03bb..11d4fb771a1f 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -42,7 +42,6 @@
>>   #define SHARP_SMOOTH_THR_DEFAULT    8
>>   #define SHARP_NOISE_THR_DEFAULT    2
>> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
>>   #define DPU_ZPOS_MAX 255
>>   /*
>> @@ -82,7 +81,6 @@ struct dpu_plane {
>>       enum dpu_sspp pipe;
>> -    uint32_t color_fill;
>>       bool is_error;
>>       bool is_rt_pipe;
>>       const struct dpu_mdss_cfg *catalog;
>> @@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct 
>> dpu_plane_state *pstate,
>>       _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, 
>> pstate->rotation);
>>   }
>> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill 
>> solid_fill)
> 
> Please consider accepting drm_plane_state instead and handling alpha 
> here. Then _dpu_color_fill can accept rgba colour instead of separate 
> RGB and alpha values.

Hi Dmitry,

Do you mean adding a patch to refactor _dpu_plane_color_fill() to accept 
an RGBA8888 color?

Since, currently, the `color` parameter gets truncated to a BGR888 value 
and OR'd with the `alpha` parameter [1].

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L682

> 
>> +{
>> +    uint32_t ret = 0;
>> +
>> +    ret |= ((uint8_t) solid_fill.b) << 16;
>> +    ret |= ((uint8_t) solid_fill.g) << 8;
>> +    ret |= ((uint8_t) solid_fill.r);
>> +
>> +    return ret;
>> +}
>> +
>>   /**
>>    * _dpu_plane_color_fill - enables color fill on plane
>>    * @pdpu:   Pointer to DPU plane object
>> @@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>>       if (pdpu->is_error)
>>           /* force white frame with 100% alpha pipe output on error */
>>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>> -        /* force 100% alpha */
>> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>> +    else if (drm_plane_solid_fill_enabled(plane->state))
>> +        _dpu_plane_color_fill(pdpu, 
>> _dpu_plane_get_fill_color(plane->state->solid_fill),
>> +                plane->state->alpha);
>>       else {
>>           dpu_plane_flush_csc(pdpu, &pstate->pipe);
>>           dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
>> @@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct 
>> drm_plane *plane,
>>       }
>>       /* override for color fill */
>> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>> +    if (drm_plane_solid_fill_enabled(plane->state)) {
>>           _dpu_plane_set_qos_ctrl(plane, pipe, false);
>>           /* skip remaining processing on color fill */
>>
> 
> -- 
> With best wishes
> Dmitry
> 
