Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7021473EEFE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 01:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32BB10E26C;
	Mon, 26 Jun 2023 23:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458410E263;
 Mon, 26 Jun 2023 23:03:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35QMq0U9031309; Mon, 26 Jun 2023 23:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fFeTeWRYheGaZKtiwdcSE9sxNccYnt4v3bn+JZZYuIU=;
 b=R++/dw0MqqRFqrpvpIwvKVnikcy6ESq/Dw6ECbJDepBOtbrWolkR1Zu5g+hLwhX7T4jz
 VTZnSg9k5icIkxfze+7PpPjPdoBmpZgwf1w9ORw7Z/0YPQ4ByJUf9jqEiVD+uiYdObjl
 l3UI9+grmTSIKM09kDmDGpw7fUO93Kvy6UEyjYQGkJzSQKpa/6rglDRHDT3C0LIk2BKj
 UawOVY6NzoSapG7OXQ9dPAQDsfK8d61P/R7FJKQP3DAavURgFKH8RRNmksC6oCeDXSBk
 uj4kdT/tSFdoNmaqmyL5eWlmsz5BtoEIQvfpcl71wAFNM1qzOs/s1algqnky1CVquUQs 3w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rfart97gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jun 2023 23:02:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35QN2pxF004204
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jun 2023 23:02:51 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 26 Jun
 2023 16:02:50 -0700
Message-ID: <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
Date: Mon, 26 Jun 2023 16:02:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
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
X-Proofpoint-GUID: A0A23PZqVGD2O0rjxr3MnFSRgnzW0ctl
X-Proofpoint-ORIG-GUID: A0A23PZqVGD2O0rjxr3MnFSRgnzW0ctl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260214
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
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
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

Reviving this thread as this was the initial comment suggesting to 
implement pixel_source as an enum.

I think the issue with having pixel_source as an enum is how to decide 
what counts as a NULL commit.

Currently, setting the FB to NULL will disable the plane. So I'm 
guessing we will extend that logic to "if there's no pixel_source set 
for the plane, then it will be a NULL commit and disable the plane".

In that case, the question then becomes when to set the pixel_source to 
NONE. Because if we do that when setting a NULL FB (or NULL solid_fill 
blob), it then forces userspace to set one property before the other.

Because of that, I'm thinking of having pixel_source be represented by a 
bitmask instead. That way, we will simply unset the corresponding 
pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in 
order to detect whether a commit is NULL or has a valid pixel source, we 
can just check if pixel_source == 0.

Would be interested in any feedback on this.

Thanks,

Jessica Zhang

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
