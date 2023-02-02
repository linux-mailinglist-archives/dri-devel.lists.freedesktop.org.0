Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F168733D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 03:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161810E1BF;
	Thu,  2 Feb 2023 02:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195610E0EF;
 Thu,  2 Feb 2023 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675303616; x=1706839616;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zP6cZeQbRqQo0oBq/eg3pij2npt8bVl1qApyNAD2kSo=;
 b=dG3XDRqPvH4/6tFSGgUGJjNaF1b59fIF6tuH5b8oyDT8k3AaQ1Nc1TCx
 auzz6sVn52mDGgZLg7i+jeqs15lppf74agNxPCzV2RtJtQTyeSBUGg0F7
 Ws6NkLVY9Zxk1sfJWZERlZWhsyeHHGyRoJOSZVMfXQQZOO2ggkDr0OrPf g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Feb 2023 18:06:54 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 18:06:54 -0800
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 1 Feb 2023
 18:06:54 -0800
Message-ID: <5376994b-99f6-0f48-139f-6e622a8b0778@quicinc.com>
Date: Wed, 1 Feb 2023 18:06:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
 <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com>
 <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com>
 <Y7hrWDpg8msuefgZ@phenom.ffwll.local>
 <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com>
 <20230131112527.32ab8ba5@eldfell>
 <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
 <20230131131326.75b43152@eldfell>
 <x3f8jyn_QDj34hYn9rgumw2uhFTpWzOw2E-715WYVOfwNOpthv26sefM6ePtwqbuHH54ATupqQzzz9qIWqAbDvMpb06bhdiU5BJlMjsaCdo=@emersion.fr>
 <20230131144913.5ff840dd@eldfell>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230131144913.5ff840dd@eldfell>
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
Cc: sebastian.wick@redhat.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/31/2023 4:49 AM, Pekka Paalanen wrote:
> On Tue, 31 Jan 2023 11:21:18 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
>> On Tuesday, January 31st, 2023 at 12:13, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>> On Tue, 31 Jan 2023 10:06:39 +0000
>>> Simon Ser <contact@emersion.fr> wrote:
>>>    
>>>> On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>    
>>>>> indeed, what about simply using a 1x1 framebuffer for real? Why was that
>>>>> approach rejected?
>>>>
>>>> Ideally we don't want to allocate any GPU memory for the solid-fill
>>>> stuff. And if we special-case 1x1 FB creation to not be backed by real
>>>> GPU memory then we hit several situations where user-space expects a
>>>> real FB but there isn't: for instance, GETFB2 converts from FB object
>>>> ID to GEM handles. Even if we make GETFB2 fail and accept that this
>>>> breaks user-space, then there is no way for user-space to recover the
>>>> FB color for flicker-free transitions and such.
>>>>
>>>> This is all purely from a uAPI PoV, completely ignoring the potential
>>>> issues with the internal kernel abstractions which might not be suitable
>>>> for this either.
>>>
>>> I mean a real 1x1 buffer: a dumb buffer.
>>>
>>> It would be absolutely compatible with anything existing, because it is
>>> a real FB. As a dumb buffer it would be trivial to write into and read
>>> out. As 1x1 it would be tiny (one page?). Even if something needs to
>>> raw-access uncached memory over 33 MHz PCI bus or whatever the worst
>>> case is, it's just one pixel, so it's fast enough, right? And it only
>>> needs to be read once when set, like USB display drivers do. The driver
>>> does not need to manually apply any color operations, because none are
>>> supported in this special case.
>>>
>>> One can put all these limitations and even pixel format in the plane
>>> property that tells userspace that a 1x1 FB works here.
>>>
>>> To recap, the other alternatives under discussion I see right now are:
>>>
>>> - this proposal of dedicated fill color property
>>> - stuffing something new into FB_ID property
>>>
>>> There is also the question of other kinds of plane content sources like
>>> live camera feeds where userspace won't be shovelling each frame
>>> individually like we do now.
>>>
>>> 1x1 dumb buffer is not as small and lean as a dedicated fill color
>>> property, but the UAPI design questions seem to be much less. What's
>>> the best trade-off and for whom?
>>
>> By "real memory" yes I mean the 1 page.
>>
>> Using a real buffer also brings back other discussions, e.g. the one about
>> which pixel formats to accept.
> 
> Yeah, which is why I wrote: "One can put all these limitations and even
> pixel format in the plane property". It doesn't even need to be a
> variable in the UAPI, it can be hardcoded in the UAPI doc.
> 
> Please, do not understand this as me strongly advocating for the real FB
> approach! I just don't want that option to be misunderstood.
> 
> I don't really care which design is chosen, but I do care about
> documenting why other designs were rejected. If the rejection reasons
> were false, they should be revised, even if the decision does not
> change.

Hi Pekka/Daniel,

Looks like the general sentiment is to keep solid fill as a separate 
property, so I will stick with that implementation for v4.

I can document the reason why we chose this approach over 1x1 FB in the 
cover letter, but to summarize here:

Allocating an FB for solid_fill brings in unnecessary overhead (ex. 
having to allocate memory for the FB). In addition, since memory fetch 
is disabled when solid fill is enabled, having a separate property that 
doesn't do any memory allocation for solid fill better reflects the 
behavior of this feature within driver.

We also wanted to avoid having FB_ID accept a property blob as it would 
involve loosening some drm_property checks, which could cause issues 
with other property ioctls.



Also, re: other plane sources -- FWIW, I have tried implementing a 
source enum as Ville suggested, but ultimately dropped the change as it 
would require userspace to set properties in a specific order (i.e. to 
enable solid_fill, userspace would have to first set FB_ID to NULL then 
set SOLID_FILL).

I'm not sure how much of a can of worms that would be for userspace, but 
if you're fine with having that as a requirement the I can re-add the code.

Thanks,

Jessica Zhang

> 
> 
> Thanks,
> pq
