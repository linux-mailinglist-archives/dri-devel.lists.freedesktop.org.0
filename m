Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F673E4A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B35B10E23B;
	Mon, 26 Jun 2023 16:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506710E257;
 Mon, 26 Jun 2023 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slu41Trq4O3Esbd8wXKLjEegsdREKhu6+OYesH7zUvE=; b=l5Y50eFH5nYELas6XCTzOMOTNB
 moOFu9+7uvrHyyOZFt1mH+dn9ySUNCSHk1bt0Vx8HCsuIsDLwoTHlw7by3AN+k+J0h/QtLhpgyrme
 /9qEYlm1PSf/Zk+sqGitx+kbQeW2nCUYS7K5XQwaCldm2w8ew++bvsZP0UtnpmSZK5WXa4BVs+OoQ
 ZKQM+O5umiam0Eenb0f4jn6MMeEtLNST3y1r/lMOK1NWddvrvaN+kUubd5zvwVTZx1YJEdkuqQ7W8
 6ktZsoleWB1oz8Jzn+wa8ILNylfgRhn0RttNaKDrkopf98VS1jWaC64DC9Zn4EX2bXTeU8ueumySf
 hXLwPllg==;
Received: from [179.113.218.86] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qDosH-0044gc-Di; Mon, 26 Jun 2023 18:15:33 +0200
Message-ID: <46eec220-5bed-cf7f-7bd7-0491883ef4fd@igalia.com>
Date: Mon, 26 Jun 2023 13:15:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v3 1/4] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-2-andrealmeid@igalia.com>
 <20230621105842.0c21b161@eldfell>
 <26a4f7f3-33fa-c28e-dd71-e44e61ffa229@igalia.com>
 <20230622111234.71820ff8@eldfell>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230622111234.71820ff8@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 22/06/2023 05:12, Pekka Paalanen escreveu:
> On Wed, 21 Jun 2023 13:28:34 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
> 
>> Em 21/06/2023 04:58, Pekka Paalanen escreveu:
>>> On Tue, 20 Jun 2023 21:57:16 -0300
>>> André Almeida <andrealmeid@igalia.com> wrote:
>>>    
>>>> Create a section that specifies how to deal with DRM device resets for
>>>> kernel and userspace drivers.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>
>>> Hi André,
>>>
>>> nice to see this! I ended up giving lots of grammar comments, but I'm
>>> not a native speaker. Generally it looks good to me.
>>
>> Thank you for your feedback :)
>>
>>>    
>>>> ---
>>>>    Documentation/gpu/drm-uapi.rst | 65 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 65 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>>> index 65fb3036a580..da4f8a694d8d 100644
>>>> --- a/Documentation/gpu/drm-uapi.rst
>>>> +++ b/Documentation/gpu/drm-uapi.rst
>>>> @@ -285,6 +285,71 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>>>>    mmapped regular files. Threads cause additional pain with signal
>>>>    handling as well.
>>>>    
>>>> +Device reset
>>>> +============
>>>> +
>>>> +The GPU stack is really complex and is prone to errors, from hardware bugs,
>>>> +faulty applications and everything in between the many layers. To recover
>>>> +from this kind of state, sometimes is needed to reset the device. This section
>>>
>>> It seems unclear what "this kind of state" refers to, so maybe just write "errors"?
>>>
>>> Maybe:
>>>
>>> 	Some errors require resetting the device in order to make the
>>> 	device usable again.
>>>
>>> I presume that recovery does not mean that the failed job could recover.
>>>    
>>>> +describes what's the expectations for DRM and usermode drivers when a device
>>>> +resets and how to propagate the reset status.
>>>> +
>>>> +Kernel Mode Driver
>>>> +------------------
>>>> +
>>>> +The KMD is responsible for checking if the device needs a reset, and to perform
>>>> +it as needed. Usually a hung is detected when a job gets stuck executing. KMD
>>>
>>> s/hung/hang/ ?
>>>    
>>>> +then update it's internal reset tracking to be ready when userspace asks the
>>>
>>> updates its
>>>
>>> "update reset tracking"... do you mean that KMD records information
>>> about the reset in case userspace asks for it later?
>>
>> Yes, kernel drivers do annotate whenever a reset happens, so it can
>> report to userspace when it asks about resets.
>>
>> For instance, this is the amdgpu implementation of
>> AMDGPU_CTX_OP_QUERY_STATE2:
>>
>> https://elixir.bootlin.com/linux/v6.3.8/source/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c#L548
>>
>>
>> You can see there stored information about resets.
> 
> Hi André,
> 
> right. What I mean is, if I have to ask this, then that implies that
> the wording could be more clear.
> 
> I don't know if "reset tracking" is some sub-system that is turned on
> and off as needed or what updating it would mean.
> 

Understood, I'll rewrite it to be more clear.

>>>    
>>>> +kernel about reset information. Drivers should implement the DRM_IOCTL_GET_RESET
>>>> +for that.
>>>
>>> At this point, I'm not sure what "reset tracking" or "reset
>>> information" entails. Could something be said about those?
>>>   >> +
>>>> +User Mode Driver
>>>> +----------------
>>>> +
>>>> +The UMD should check before submitting new commands to the KMD if the device has
>>>> +been reset, and this can be checked more often if it requires to. The
>>>> +DRM_IOCTL_GET_RESET is the default interface for those kind of checks. After
>>>> +detecting a reset, UMD will then proceed to report it to the application using
>>>> +the appropriated API error code, as explained in the bellow section about
>>>
>>> s/bellow/below/
>>>    
>>>> +robustness.
>>>> +
>>>> +Robustness
>>>> +----------
>>>> +
>>>> +The only way to try to keep an application working after a reset is if it
>>>> +complies with the robustness aspects of the graphical API that is using.
>>>
>>> that it is using.
>>>    
>>>> +
>>>> +Graphical APIs provide ways to application to deal with device resets. However,
>>>
>>> provide ways for applications to deal with
>>>    
>>>> +there's no guarantee that the app will be correctly using such features, and UMD
>>>> +can implement policies to close the app if it's a repeating offender, likely in
>>>> +a broken loop. This is done to ensure that it doesn't keeps blocking the user
>>>
>>> does not keep
>>>
>>> I think contractions are usually avoided in documents, but I'm not
>>> bothering to flag them all.
>>>    
>>>> +interface to be correctly displayed.
>>>
>>> interface from being correctly displayed.
>>>    
>>>> +
>>>> +OpenGL
>>>> +~~~~~~
>>>> +
>>>> +Apps using OpenGL can rely on ``GL_ARB_robustness`` to be robust. This extension
>>>> +tells if a reset has happened, and if so, all the context state is considered
>>>> +lost and the app proceeds by creating new ones. If robustness isn't in use, UMD
>>>> +will terminate the app when a reset is detected, giving that the contexts are
>>>> +lost and the app won't be able to figure this out and recreate the contexts.
>>>
>>> What about GL ES? Is GL_ARB_robustness implemented or even defined there?
>>>    
>>
>> I found this:
>> https://registry.khronos.org/OpenGL/extensions/EXT/EXT_robustness.txt
>>
>> "Since this is intended to be a version of ARB_robustness for OpenGL ES,
>> it should be named accordingly."
>>
>> I can add this to this paragraph.
> 
> Yes, please!
> 
> I suppose there could be even more extensions with similar benefits, so
> maybe these extension should be mentioned as examples. Right now the
> wording sounds like these are the chosen extensions, and if you don't
> use one, the process will be terminated.
> 
>>
>>> What about EGL returning errors like EGL_CONTEXT_LOST, would handling that not
>>> be enough from the app? The documented expectation is: "The application
>>> must destroy all contexts and reinitialise OpenGL ES state and objects
>>> to continue rendering."
>>
>> I couldn't find the spec for EGL_CONTEXT_LOST, but I found for
>> GL_CONTEXT_LOST, which I assume is similar.
> 
> EGL Version 1.5 - August 27, 2014
> 
> Section 2.7 Power Management
> 
> 	Following a power management event, calls to eglSwapBuffers,
> 	eglCopyBuffers, or eglMakeCurrent will indicate failure by
> 	returning EGL_FALSE. The error EGL_CONTEXT_LOST will be
> 	returned if a power management event has occurred.
> 
> 	On detection of this error, the application must destroy all
> 	contexts (by calling eglDestroyContext for each context). To
> 	continue rendering the application must recreate any contexts
> 	it requires, and subsequently restore any client API state and
> 	objects it wishes to use.
> 
> It is talking about power management which is not quite GPU reset, but
> I see so much similarity that I'd say it doesn't matter which one
> actually happened. The only difference is that power management events
> are not caused by application bugs, which means that the application
> will simply re-initialize and retry, which may result in a reset loop.
> 
> You already wrote provision to handle reset loops, and I'm not sure
> applications handling EGL_CONTEXT_LOST would/could ever infer that they
> are the culprit without using robustness extensions.
> 
> I can see how EGL_CONTEXT_LOST could be deemed unsuitable for resets,
> too.
> 

Indeed, this is tricky. However, I believe that the complex nature of 
the stack can lead to situations where an app is causing the hardware to 
change it's power management settings. Even though the app isn't doing 
it on purpose, as stated in the introduction of this section, resets can 
be caused by hardware bugs, so unfortunately apps might not be able to 
run correctly and will get reset notifications, and even get terminate.

>>
>> GL_CONTEXT_LOST is only returned in some specific commands (that might
>> cause a polling application to block indefinitely), so I don't think
>> it's enough, given that the we can't guarantee that the application will
>> call such commands after a reset, thus not being able to notice a reset.
>>
>> https://registry.khronos.org/OpenGL-Refpages/gl4/html/glGetGraphicsResetStatus.xhtml
> 
> Ok, another API for a similar thing.
> 
> So in that case, the app does not need to use a robustness extension if
> it uses OpenGL 4.5 and bothers to check.
> 
> This makes the wording "If robustness is not in use" problematic,
> because it seems complicated to determine if robusteness is in use in
> any particular application. I suppose Mesa would track if the app ever
> called glGetGraphicsResetStatus() before drawing after reset?
> 
> 

I agree, I think tracking glGetGraphicsResetStatus() should be enough, 
but I will let this part of the documentation as this for now:

If it's _possible to guarantee_ that robustness is not in use [...]

> Thanks,
> pq
> 
>>>    
>>>> +
>>>> +Vulkan
>>>> +~~~~~~
>>>> +
>>>> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
>>>> +This error code means, among other things, that a device reset has happened and
>>>> +it needs to recreate the contexts to keep going.
>>>> +
>>>> +Reporting resets causes
>>>> +-----------------------
>>>> +
>>>> +Apart from propagating the reset through the stack so apps can recover, it's
>>>> +really useful for driver developers to learn more about what caused the reset in
>>>> +first place. DRM devices should make use of devcoredump to store relevant
>>>> +information about the reset, so this information can be added to user bug
>>>> +reports.
>>>> +
>>>>    .. _drm_driver_ioctl:
>>>>    
>>>>    IOCTL Support on Device Nodes
>>>
>>> What about VRAM contents? If userspace holds a dmabuf handle, can a GPU
>>> reset wipe that buffer? How would that be communicated?
>>>    
>>
>> Yes, it can.
>>
>>> The dmabuf may have originated in another process.
>>>    
>>
>> Indeed, I think we might need to add an error code for dmabuf calls so
>> the buffer user knows that it's invalid now because a reset has happened
>> in the other device. I will need to read more dmabuf code to make sure
>> how this would be possible.
>>
>>>
>>> Thanks,
>>> pq
> 
