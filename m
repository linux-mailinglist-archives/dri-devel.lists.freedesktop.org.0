Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DB620133
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D83810E4EE;
	Mon,  7 Nov 2022 21:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EEE10E4EC;
 Mon,  7 Nov 2022 21:32:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A7L54Lm017148; Mon, 7 Nov 2022 21:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n0MtKCqgCZPTTHdwvoDW28aXczL3Y97P+T5hstBuv+Y=;
 b=PBUmvMH+sel9IRbSLVuvAFFD9S5DHIGNkdjB/3utQKdP8a9RMYCisZpm1C6xPR6p9d1P
 nb4QCgSCIAL/qQKzzXGTc8WkNo2EUoQ1jroCBRlNYyZ+atEWlxGK9WiZ4zGrMB0fMPwS
 fwe2T4VXq+ATQ9+kWvnP2R84qVFMhAtbel9MAbdV1qfSATGcXoEp/v4yefPnRgza0g55
 w0nO3U2dVEtMluxtKjHU4KV+gd2uSl60DBr3kAwwJoMmMg9XxNJSTCkgTI/9zWKSHZqj
 keBAkx4/g/0gz4A2hfzRif4oNlCOp3jQcVrwa6A0IJD+7QhcbUFVxhZwADgOql9DkTCV TQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kq5s38ne8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 21:32:34 +0000
Received: from nasanex01b.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A7LWXEU013334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 21:32:33 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 7 Nov 2022
 13:32:32 -0800
Message-ID: <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
Date: Mon, 7 Nov 2022 13:32:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Y2leZDfLj/5963wl@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: K_5ldbP5KL4wEZ3XaH9FsZL7DGs0UBiq
X-Proofpoint-ORIG-GUID: K_5ldbP5KL4wEZ3XaH9FsZL7DGs0UBiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxlogscore=831
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070165
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
Cc: daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>> properties. When the color fill value is set, and the framebuffer is set
>> to NULL, memory fetch will be disabled.
> 
> Thinking a bit more universally I wonder if there should be
> some kind of enum property:
> 
> enum plane_pixel_source {
> 	FB,
> 	COLOR,
> 	LIVE_FOO,
> 	LIVE_BAR,
> 	...
> }

Hi Ville,

Makes sense -- this way, we'd also lay some groundwork for cases where 
drivers want to use other non-FB sources.

> 
>> In addition, loosen the NULL FB checks within the atomic commit callstack
>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>> methods where the FB was previously assumed to be non-NULL.
>>
>> Finally, have the DPU driver use drm_plane_state.color_fill and
>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
>> and add extra checks in the DPU atomic commit callstack to account for a
>> NULL FB in cases where color_fill is set.
>>
>> Some drivers support hardware that have optimizations for solid fill
>> planes. This series aims to expose these capabilities to userspace as
>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>> hardware composer HAL) that can be set by apps like the Android Gears
>> app.
>>
>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
>> DRM format, setting COLOR_FILL to a color fill value, and setting the
>> framebuffer to NULL.
> 
> Is there some real reason for the format property? Ie. why not
> just do what was the plan for the crttc background color and
> specify the color in full 16bpc format and just pick as many
> msbs from that as the hw can use?

The format property was added because we can't assume that all hardware 
will support/use the same color format for solid fill planes. Even for 
just MSM devices, the hardware supports different variations of RGB 
formats [1].

Thanks,

Jessica Zhang

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L697

> 
>>
>> Jessica Zhang (3):
>>    drm: Introduce color fill properties for drm plane
>>    drm: Adjust atomic checks for solid fill color
>>    drm/msm/dpu: Use color_fill property for DPU planes
>>
>>   drivers/gpu/drm/drm_atomic.c              | 68 ++++++++++++-----------
>>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>   drivers/gpu/drm/drm_plane.c               |  8 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>>   include/drm/drm_atomic_helper.h           |  5 +-
>>   include/drm/drm_blend.h                   |  2 +
>>   include/drm/drm_plane.h                   | 28 ++++++++++
>>   10 files changed, 188 insertions(+), 76 deletions(-)
>>
>> -- 
>> 2.38.0
> 
> -- 
> Ville Syrjälä
> Intel
