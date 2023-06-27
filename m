Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FBF73EFD7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 02:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7040710E272;
	Tue, 27 Jun 2023 00:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594010E26F;
 Tue, 27 Jun 2023 00:45:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35R0hQs3006089; Tue, 27 Jun 2023 00:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qTb48BcmlziyIws7Zt/lwTT9YOGz66PpgYQ4i1u7+Vs=;
 b=nxU2rkqGR18mRrof4YZAIMNCIXRlMVPpIYpW+E2JQPXSKkg2aJH6N5sVMpdvtmn6rZq7
 AYcwmzzb8fqiBqb/xUrlCbqMWtvgr+kDo1UQJrcjhZF+VFxBQyXHmRivH+5rkmwknr83
 5PHtzMsLjSUaYvD9/PS1UUpYTLdPcBdUYU2XhH3f+8hyPnDxmmZRPqcaVkw7GCaSH/fp
 +Q9KMxNtnop5vFC+2nAwTHrpdVTo5uW0ZE4hIjlGdZwpaCR0JZgXsv/g32kqeBzo+sK5
 W3inBQRFQWG9GeVeggouvCByKiG0qdZxNhHuXcZMlpZlhSEjl5olA0dhnpfsvvp3JcsU iw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rfbfc9942-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jun 2023 00:45:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35R0j1KH026594
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jun 2023 00:45:01 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 26 Jun
 2023 17:45:01 -0700
Message-ID: <5879e5c1-3f78-995b-b5ef-bbdf31019693@quicinc.com>
Date: Mon, 26 Jun 2023 17:45:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH 0/3] Support for Solid Fill Planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <d0b5abdc-85ad-fee2-9760-866c32bab111@quicinc.com>
 <d8b1e910-6943-d7b7-5433-71f8b350bfcb@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d8b1e910-6943-d7b7-5433-71f8b350bfcb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TU4H4CJqOFOm7w7qFs44yO35n91a7CZD
X-Proofpoint-GUID: TU4H4CJqOFOm7w7qFs44yO35n91a7CZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_20,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306270003
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
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/26/2023 5:06 PM, Dmitry Baryshkov wrote:
> On 27/06/2023 02:02, Jessica Zhang wrote:
>>
>>
>> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
>>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
>>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
>>>> properties. When the color fill value is set, and the framebuffer is 
>>>> set
>>>> to NULL, memory fetch will be disabled.
>>>
>>> Thinking a bit more universally I wonder if there should be
>>> some kind of enum property:
>>>
>>> enum plane_pixel_source {
>>>     FB,
>>>     COLOR,
>>>     LIVE_FOO,
>>>     LIVE_BAR,
>>>     ...
>>> }
>>
>> Reviving this thread as this was the initial comment suggesting to 
>> implement pixel_source as an enum.
>>
>> I think the issue with having pixel_source as an enum is how to decide 
>> what counts as a NULL commit.
>>
>> Currently, setting the FB to NULL will disable the plane. So I'm 
>> guessing we will extend that logic to "if there's no pixel_source set 
>> for the plane, then it will be a NULL commit and disable the plane".
>>
>> In that case, the question then becomes when to set the pixel_source 
>> to NONE. Because if we do that when setting a NULL FB (or NULL 
>> solid_fill blob), it then forces userspace to set one property before 
>> the other.
> 
> Why? The userspace should use atomic commits and as such it should all 
> properties at the same time.

Correct, userspace will set all the properties within the same atomic 
commit. The issue happens when the driver iterates through each property 
within the MODE_ATOMIC ioctl [1].

For reference, I'm thinking of an implementation where we're setting the 
pixel_source within drm_atomic_plane_set_property().

So something like:

drm_atomic_plane_set_property( ... )
{
     if (property == config->prop_fb_id) {
         if (fb)
             state->pixel_source = FB;
         else
             state->pixel_source = NONE;
     } else if (property == config->prop_solid_fill) {
         if (solid_fill_blob)
             state->pixel_source = SOLID_FILL;
     }

     // ...
}

If userspace sets solid_fill to a valid blob and FB to NULL, it's 
possible for driver to first set the solid_fill property then set the 
fb_id property later. This would cause pixel_source to be set to NONE 
after all properties have been set.

I've also considered an implementation without the `pixel_source = NONE` 
line in the prop_fb_id case, but we would still need to find somewhere 
to set the pixel_source to NONE in order to allow userspace to disable a 
plane.

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_atomic_uapi.c#L1385

> 
>> Because of that, I'm thinking of having pixel_source be represented by 
>> a bitmask instead. That way, we will simply unset the corresponding 
>> pixel_source bit when passing in a NULL FB/solid_fill blob. Then, in 
>> order to detect whether a commit is NULL or has a valid pixel source, 
>> we can just check if pixel_source == 0.
>>
>> Would be interested in any feedback on this.
> 
> This is an interesting idea. Frankly speaking, I'd consider it 
> counter-intuitive at the first glance.
> 
> Consider it to act as a curtain. Setup the curtain (by writing the fill 
> colour property). Then one can close the curtain (by switching source to 
> colour), or open it (by switching to any other source). Bitmask wouldn't 
> complicate this.

So if I'm understanding your analogy correctly, pixel_source won't 
necessarily be set whenever the FB or solid_fill properties are set. So 
that way we can have both FB *and* solid_fill set at the same time, but 
only the source that pixel_source is set to would be displayed.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>
>>>> In addition, loosen the NULL FB checks within the atomic commit 
>>>> callstack
>>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
>>>> methods where the FB was previously assumed to be non-NULL.
>>>>
>>>> Finally, have the DPU driver use drm_plane_state.color_fill and
>>>> drm_plane_state.color_fill_format instead of 
>>>> dpu_plane_state.color_fill,
>>>> and add extra checks in the DPU atomic commit callstack to account 
>>>> for a
>>>> NULL FB in cases where color_fill is set.
>>>>
>>>> Some drivers support hardware that have optimizations for solid fill
>>>> planes. This series aims to expose these capabilities to userspace as
>>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
>>>> hardware composer HAL) that can be set by apps like the Android Gears
>>>> app.
>>>>
>>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT 
>>>> to a
>>>> DRM format, setting COLOR_FILL to a color fill value, and setting the
>>>> framebuffer to NULL.
>>>
>>> Is there some real reason for the format property? Ie. why not
>>> just do what was the plan for the crttc background color and
>>> specify the color in full 16bpc format and just pick as many
>>> msbs from that as the hw can use?
>>>
>>>>
>>>> Jessica Zhang (3):
>>>>    drm: Introduce color fill properties for drm plane
>>>>    drm: Adjust atomic checks for solid fill color
>>>>    drm/msm/dpu: Use color_fill property for DPU planes
>>>>
>>>>   drivers/gpu/drm/drm_atomic.c              | 68 
>>>> ++++++++++++-----------
>>>>   drivers/gpu/drm/drm_atomic_helper.c       | 34 +++++++-----
>>>>   drivers/gpu/drm/drm_atomic_uapi.c         |  8 +++
>>>>   drivers/gpu/drm/drm_blend.c               | 38 +++++++++++++
>>>>   drivers/gpu/drm/drm_plane.c               |  8 +--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++--------
>>>>   include/drm/drm_atomic_helper.h           |  5 +-
>>>>   include/drm/drm_blend.h                   |  2 +
>>>>   include/drm/drm_plane.h                   | 28 ++++++++++
>>>>   10 files changed, 188 insertions(+), 76 deletions(-)
>>>>
>>>> -- 
>>>> 2.38.0
>>>
>>> -- 
>>> Ville Syrjälä
>>> Intel
> 
> -- 
> With best wishes
> Dmitry
> 
