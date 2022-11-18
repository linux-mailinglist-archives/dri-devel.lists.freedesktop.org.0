Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1458462FDD5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 20:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3029910E239;
	Fri, 18 Nov 2022 19:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B2610E7B2;
 Fri, 18 Nov 2022 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1668798970; x=1700334970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4c0RnUr6SOsHxsYhuejWyDU/paf7akST0jijN6gV6T4=;
 b=sdApPgKux3ZsVrX7F2se8jXeb+BItYD1njI1BChK5Yj+FQ6zvtHuQ7kI
 FlinFYxus/RnJx29kj9mhBsJFUdSpFASgW6XMLMfotTQxjAWWw21U8DgJ
 8RaLtdl7EMRp2+u9HrAgwr+wWo/2uHSd76CiF06mr+P2jFhSnUOm4YTHk E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2022 11:16:09 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 11:16:09 -0800
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 11:16:08 -0800
Message-ID: <fd363264-8f91-6155-6a74-1dd3b12e7cdd@quicinc.com>
Date: Fri, 18 Nov 2022 11:15:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
To: Daniel Vetter <daniel@ffwll.ch>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
 <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
 <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
 <1f291321-1319-f6d8-b2cb-85ddbe970766@quicinc.com>
 <Y24ZsAhAscVJd4Uf@phenom.ffwll.local>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Y24ZsAhAscVJd4Uf@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/11/2022 1:45 AM, Daniel Vetter wrote:
> On Wed, Nov 09, 2022 at 05:44:37PM -0800, Jessica Zhang wrote:
>>
>>
>> On 11/9/2022 5:59 AM, Daniel Vetter wrote:
>>> On Wed, Nov 09, 2022 at 04:53:45PM +0300, Dmitry Baryshkov wrote:
>>>> On 09/11/2022 16:52, Daniel Vetter wrote:
>>>>> On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
>>>>>> On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>>>>
>>>>>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>>>>>
>>>>>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>>>>>> drm_plane. In addition, add support for setting and getting the values
>>>>>>>> of these properties.
>>>>>>>>
>>>>>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>>>>>> represents the format of the color fill. Userspace can set enable solid
>>>>>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>>>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>>>>>> framebuffer to NULL.
>>>>>>>
>>>>>>> I suppose that COLOR_FILL should override framebuffer rather than
>>>>>>> requiring that FB is set to NULL. In other words, if color_filL_format
>>>>>>> is non-zero, it would make sense to ignore the FB. Then one can use the
>>>>>>> color_fill_format property to quickly switch between filled plane and
>>>>>>> FB-backed one.
>>>>>>
>>>>>> That would be inconsistent with the rest of the KMS uAPI. For instance,
>>>>>> the kernel will error out if CRTC has active=0 but a connector is still
>>>>>> linked to the CRTC. IOW, the current uAPI errors out if the KMS state
>>>>>> is inconsistent.
>>>>>
>>>>> So if the use-case here really is to solid-fill a plane (and not just
>>>>> provide a background color for the crtc overall), then I guess we could
>>>>> also extend addfb to make that happen. We've talked in the past about
>>>>> propertery-fying framebuffer objects, and that would sort out this uapi
>>>>> wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
>>>>>
>>>>> But if the use-cases are all background color then just doing the crtc
>>>>> background color would be tons simpler (and likely also easier to support
>>>>> for more hardware).
>>>>
>>>> No. The hardware supports multiple color-filled planes, which do not have to
>>>> cover the whole CRTC.
>>>
>>> The use case here means the userspace use-case. What the hw can do on any
>>> given chip kinda doesnt matter, which is why I'm asking. KMD uapi is not
>>> meant to reflect 100% exactly what a specific chip can do, but instead:
>>> - provide features userspace actually needs. If you want per-plane fill,
>>>     you need userspace that makes use of per-plane fill, and if all you have
>>>     is crtc background, then that's it.
>>
>> Hey Daniel,
>>
>> The userspace use case we're trying to support is the Android HWC SOLID_FILL
>> hint here [1], which is specifying per-plane fill.
> 
> Does surfaceflinger actually use this for more than background fills? Yes
> I'm annoying, but if we can simplify the kernel driver implementation
> burden by asking compositors to do the math and simplify things, then I
> think we should.

AFAIK surfaceflinger allows apps to use this for cases beyond just 
background fill -- an app, for example, can pass the hint for a plane 
that only partially covers a screen and the driver would be expected to 
fill just that ROI.

> 
> We also need an open source implementation for this that works and is
> tested end-to-end. There's the drm_hwc project, but last time I've checked
> there's really not much happpening there unfortunately.

FWIW, Simon mentioned in a separate reply that Wayland supports a 1x1 FB 
support protocol [1] for a similar purpose as this RFC series. I can 
also create an IGT test meanwhile showing an example of E2E usage.

Thanks,

Jessica

[1] 
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104

> -Daniel
> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>> [1] https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52
>>
>>> - we should create uapi with an eye towards what's actually possible on a
>>>     reasonable set of drivers and hw. Sometimes that means a slightly more
>>>     restricted set so that it's possible to implement in more places,
>>>     especially if that restricted feature set still gets the job done for
>>>     userspace.
>>>
>>> Cheers, Daniel
>>> -- 
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
