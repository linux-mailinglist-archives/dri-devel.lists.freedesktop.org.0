Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2D74FBFD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3D710E122;
	Wed, 12 Jul 2023 00:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED9F10E122;
 Wed, 12 Jul 2023 00:01:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36BNgCZt016694; Wed, 12 Jul 2023 00:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jTeqAFlCLv+oA4IEJ6lncMyInSn/hwY65e4xFEskncs=;
 b=eEFiOkbIvJwmFZVvX8HrtUagIs/ZFjwMRereS5FHcSN07k4CyNXYMkrSMXV9riZ8DEZl
 SygegICUqKTVY5dvIqe8aLRUA09c8VfxQY8VbC1bCiiUh7XlUupM0nM76C747f3X90SL
 mHw/OLebApUBZeUGI/YgNskRR1b0O4V3Is5Zmg6uLaVsYDWKMmQ7aPgqU2ed18i9U4Rp
 cSbQlqxTflg4XXvMfDXInR+s4OsMJzS1h+15U+W4tHOutbAVOxtXzZrfRzHd4g/Iicvc
 jt1Xbrx5rSmQm/tCPfcJDxJ81pZv3ruPQ4F4ujTBxOSEWfAZvwpgLd6hvHLmkN0EI0Ux PA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsgar82ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:01:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C01hC3006897
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:01:43 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 11 Jul
 2023 17:01:42 -0700
Message-ID: <f2a50fb0-f9d3-d884-8f67-28591413e935@quicinc.com>
Date: Tue, 11 Jul 2023 17:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RFC v4 7/7] drm/msm/dpu: Use DRM solid_fill property
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-7-f4ec0caa742d@quicinc.com>
 <20230630112649.263331b4@eldfell> <20230703104246.7226953a@eldfell>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230703104246.7226953a@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oFwOyZwqsZYVkYdAEu2o9Yhp6v4rLfha
X-Proofpoint-ORIG-GUID: oFwOyZwqsZYVkYdAEu2o9Yhp6v4rLfha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_13,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110219
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>, Sean
 Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/3/2023 12:42 AM, Pekka Paalanen wrote:
> On Fri, 30 Jun 2023 11:26:49 +0300
> Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
>> On Thu, 29 Jun 2023 17:25:06 -0700
>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>> Drop DPU_PLANE_COLOR_FILL_FLAG and check the DRM solid_fill property to
>>> determine if the plane is solid fill. In addition drop the DPU plane
>>> color_fill field as we can now use drm_plane_state.solid_fill instead,
>>> and pass in drm_plane_state.alpha to _dpu_plane_color_fill_pipe() to
>>> allow userspace to configure the alpha value for the solid fill color.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 +++++++++++++++------
>>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 4476722f03bb..11d4fb771a1f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -42,7 +42,6 @@
>>>   #define SHARP_SMOOTH_THR_DEFAULT	8
>>>   #define SHARP_NOISE_THR_DEFAULT	2
>>>   
>>> -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>>>   #define DPU_ZPOS_MAX 255
>>>   
>>>   /*
>>> @@ -82,7 +81,6 @@ struct dpu_plane {
>>>   
>>>   	enum dpu_sspp pipe;
>>>   
>>> -	uint32_t color_fill;
>>>   	bool is_error;
>>>   	bool is_rt_pipe;
>>>   	const struct dpu_mdss_cfg *catalog;
>>> @@ -606,6 +604,17 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>>>   	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
>>>   }
>>>   
>>> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)
>>> +{
>>> +	uint32_t ret = 0;
>>> +
>>> +	ret |= ((uint8_t) solid_fill.b) << 16;
>>> +	ret |= ((uint8_t) solid_fill.g) << 8;
>>> +	ret |= ((uint8_t) solid_fill.r);
>>
>> solid_fill.r, g and b are uint32_t, yes?
>>
>> What's the value encoding in the UAPI? That doc was missing.

Hi Pekka,

The solid fill blob will accept an RGB323232 value -- will document this 
in the drm_solid_fill_info struct

>>
>> I wouldn't expect the UAPI to use 32-bit variables if it was
>> essentially 8-bit, so this conversion looks wrong.
>>
>> Nominal color value 1.0 in u8 is 0xff. The same in u32 is probably
>> 0xffffffff? So a simple cast to u8 won't work. You'd want to take the
>> upper 8 bits instead.

Acked.

>>
>>
>> Thanks,
>> pq
>>
>>> +
>>> +	return ret;
> 
> Btw. if your driver format is ABGR, then this function leaves alpha as
> zero. That's confusing.
> 
> It would be nice to mention the exact pixel format in the function name
> so the consistency is easier to check in both here and in callers.

Acked.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
> 
>>> +}
>>> +
>>>   /**
>>>    * _dpu_plane_color_fill - enables color fill on plane
>>>    * @pdpu:   Pointer to DPU plane object
>>> @@ -977,9 +986,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>>>   	if (pdpu->is_error)
>>>   		/* force white frame with 100% alpha pipe output on error */
>>>   		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>>> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>>> -		/* force 100% alpha */
>>> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>>> +	else if (drm_plane_solid_fill_enabled(plane->state))
>>> +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
>>> +				plane->state->alpha);
>>>   	else {
>>>   		dpu_plane_flush_csc(pdpu, &pstate->pipe);
>>>   		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
>>> @@ -1024,7 +1033,7 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>>>   	}
>>>   
>>>   	/* override for color fill */
>>> -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>>> +	if (drm_plane_solid_fill_enabled(plane->state)) {
>>>   		_dpu_plane_set_qos_ctrl(plane, pipe, false);
>>>   
>>>   		/* skip remaining processing on color fill */
>>>    
>>
> 
