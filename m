Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710736E119
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB4C89D39;
	Wed, 28 Apr 2021 21:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF5889D39
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:42:14 +0000 (UTC)
Received: from [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15] (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D0AAD1F42C94;
 Wed, 28 Apr 2021 22:42:11 +0100 (BST)
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
 <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
 <20210426103656.0a212089@eldfell>
 <UucmifK8H9QRiWjD9XezmvdKmY-gXYG2c5LcJlAtmZDvpmvX3dqiNqzng6EPm6Kj_1_1nKi4S2vzFPTpKYoou_ARj-27xlxSoeMtrcpxLUk=@emersion.fr>
 <550b87d0-d180-32cb-349e-1ff000c0530f@collabora.com>
 <20210427104024.4e8aa086@eldfell> <YIfSqPq6J4sI6PyI@phenom.ffwll.local>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <818eeecf-591b-dae8-8565-3f6214c343c6@collabora.com>
Date: Wed, 28 Apr 2021 18:42:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIfSqPq6J4sI6PyI@phenom.ffwll.local>
Content-Language: en-US
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/27/21 6:00 AM, Daniel Vetter wrote:
> On Tue, Apr 27, 2021 at 10:40:24AM +0300, Pekka Paalanen wrote:
>> On Mon, 26 Apr 2021 14:30:53 -0300
>> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
>>
>>> On 4/26/21 7:58 AM, Simon Ser wrote:
>>>> On Monday, April 26th, 2021 at 9:36 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>>>   
>>>>>>> This should probably explain what the bits in the mask correspond to.
>>>>>>> As in, which CRTC does bit 0 refer to, and so on.  
>>>>>>
>>>>>> What about:
>>>>>>
>>>>>> "possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
>>>>>> created and they receive an index, which corresponds to their position
>>>>>> in the bitmask. CRTC with index 0 will be in bit 0, and so on."  
>>>>>
>>>>> This would still need to explain where can I find this index.  
>>>>   
>>>
>>> What do you mean?
>>>
>>>> This closed merge request had some docs about possible CRTCs:
>>>>
>>>> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/102
>>>>   
>>> I'm afraid I don't know exactly what you expect to be documented here
>>> that is still missing. Could you please elaborate?
>>>
>>> Thanks a lot!
>>
>> The documentation you add is talking about "CRTC index". What defines a
>> CRTC object's index? How do I determine what index a CRTC object has?
>>
>> The answer is, AFAIK, that the index is never stored explicitly
>> anywhere. You have to get the DRM resources structure, which has an
>> array for CRTC IDs. The index is the index to that array, IIRC. So if
>> one does not already know this, it is going to be really hard to figure
>> out what the "index" is. It might even be confused with the object ID,
>> which it is not but the ID might by complete accident be less than 32
>> so it would look ok at first glance.
>>
>> If the index is already explained somewhere else, a reference to that
>> documentation would be enough.
> 
> I think if we do this we should have a DOC: section in the drm_mode.h uapi
> header which explains how the index is computed, and then we reference
> that everywhere. Because otherwise there's going to be a _lot_ of
> duplication of this all over. Kernel-internally we solve this by just
> referencing drm_foo_index() family of functions, but for the uapi there's
> really nothing, so needs text.
> 
> -Daniel
>
Ok, I've sent a v3 with a small section to document how to get the index
of a CRTC object from userspace perspective. But I could only find two
comments that would benefit from it (at least in "Userland interfaces"
page).

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
