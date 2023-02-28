Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B046A5BD0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8160110E4D7;
	Tue, 28 Feb 2023 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C870710E4D7;
 Tue, 28 Feb 2023 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1P/CMXGxj7MEFBYHfYR2YHpsJNtdZiBmYO9UykBmZlA=; b=UO+MTwYv4g3zQjHRMxzwhJWZ2F
 JgotM50lxIgku/bqWfBvxLYcrA0JVt8HtYEsE+WXPRbf0FLok+MK2V+OyDB7DzHy88zT/US+PfURC
 55G3ZCBcC1pEJmyjOcwovleaht7EtAKutwVq9JHA1y5reFcxEfLetZdXEg32pD0yj1vGtLMrjegoN
 qkHAeotfkEfsRA4f0dO3xHdxUh1TeD11UH5PCKeKOdlLXK/2ZwcQ1t28CRpqdZvBofuF7/09mHgJY
 WdnyI9KKEtTa5/FLalO3gNGm+zRwZa8fjtLUOHpry9WhLAsldob7ciPyiRySliBpQkUTY2RJNem+4
 hkCBjVzA==;
Received: from [181.199.58.72] (helo=[192.168.100.46])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pX1rl-000NRm-2P; Tue, 28 Feb 2023 16:26:09 +0100
Message-ID: <0d38d76f-77b4-ec14-fbc3-9c7eee6ce58b@igalia.com>
Date: Tue, 28 Feb 2023 10:26:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/1] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230227204000.56787-1-andrealmeid@igalia.com>
 <20230227204000.56787-2-andrealmeid@igalia.com>
 <20230228120201.7b20519a@eldfell>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230228120201.7b20519a@eldfell>
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
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

Thank you for your feedback,

On 2/28/23 05:02, Pekka Paalanen wrote:
> On Mon, 27 Feb 2023 15:40:00 -0500
> André Almeida <andrealmeid@igalia.com> wrote:
>
>> Create a section that specifies how to deal with DRM device resets for
>> kernel and userspace drivers.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   Documentation/gpu/drm-uapi.rst | 51 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>> index 65fb3036a580..3d6c3ed392ea 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -285,6 +285,57 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>>   mmapped regular files. Threads cause additional pain with signal
>>   handling as well.
>>   
>> +Device reset
>> +============
>> +
>> +The GPU stack is really complex and is prone to errors, from hardware bugs,
>> +faulty applications and everything in the many layers in between. To recover
>> +from this kind of state, sometimes is needed to reset the GPU. Unproper handling
>> +of GPU resets can lead to an unstable userspace. This section describes what's
>> +the expected behaviour from DRM drivers to do in those situations, from usermode
>> +drivers and compositors as well. The end goal is to have a seamless experience
>> +as possible, either the stack being able to recover itself or resetting to a new
>> +stable state.
>> +
>> +Robustness
>> +----------
>> +
>> +First of all, application robust APIs, when available, should be used. This
>> +allows the application to correctly recover and continue to run after a reset.
>> +Apps that doesn't use this should be promptly killed when the kernel driver
>> +detects that it's in broken state. Specifically guidelines for some APIs:
> Hi,
>
> the "kill" wording is still here. It feels too harsh to me, like I say
> in my comments below, but let's see what others think.
>
> Even the device hot-unplug guide above this does not call for killing
> anything and is prepared for userspace to keep going indefinitely if
> userspace is broken enough.

If I understood correctly, you don't think that neither KMD or UMD 
should terminate apps that hangs the GPU, right? Should those apps run 
indefinitely until the user decides to do something about it?

At least on Intel GPUs, if I run an OpenGL infinite loop the app will be 
terminated in a few moments, and the rest of userspace is preserved. 
There's an app that just do that if you want to have a look on how it 
works: https://gitlab.freedesktop.org/andrealmeid/gpu-timeout

>
>> +
>> +- OpenGL: KMD signals the abortion of submitted commands and the UMD should then
>> +  react accordingly and abort the application.
> No, not abort. Just return failures and make sure no API call will
> block indefinitely.
>
>> +
>> +- Vulkan: Assumes that every app is able to deal with ``VK_ERROR_DEVICE_LOST``.
>> +  If it doesn't do it right, it's considered a broken application and UMD will
>> +  deal with it, aborting it.
> Is it even possible to detect if an app does it right?
>
> What if the app does do it right, but not before it attempts to hammer
> a few more jobs in?

I think what I meant was

+ If it doesn't support VK_ERROR_DEVICE_LOST, it's considered a broken 
app [...]

In the sense that if it doesn't support this, it is impossible for the 
app to recovery gracefully from a reset so it's considered broken

>> +
>> +Kernel mode driver
>> +------------------
>> +
>> +The KMD must be able to detect that something is wrong with the application
>> +and that a reset is needed to take place to recover the device (e.g. an endless
>> +wait). It needs to properly track the context that is broken and mark it as
>> +dead, so any other syscalls to that context should be further rejected. The
>> +other contexts should be preserved when possible, avoid crashing the rest of
>> +userspace. KMD can ban a file descriptor that keeps causing resets, as it's
>> +likely in a broken loop.
> If userspace is in a broken loop repeatedly causing GPU reset, would it
> keep using the same (render node) fd? To me it would be more likely to
> close the fd and open a new one, then crash again. Robust or not, the
> gfx library API would probably require tearing everything down and
> starting from scratch. In fact, only robust apps would likely exhibit
> this behaviour, and non-robust just get stuck or quit themselves.
>
> I suppose in e.g. EGL, it is possible to just create a new context
> instead of a new EGLDisplay, so both re-using and not using the old fd
> are possible.
>
> The process identity would usually remain, I believe, except in cases
> like Chromium with its separate rendering processes, but then, would
> you really want to ban whole Chromium in that case...
>
Right, so userspace is the right place to implement the repeat-offender 
policy, as you noted below.

>> +
> Another thing for the kernel mode driver maybe worth mentioning is that
> the driver could also pretend a hot-unplug if the GPU crash is so bad
> that everything is at risk being lost or corrupted.

Ack, I'll add that

>
>> +User mode driver
>> +----------------
>> +
>> +During a reset, UMD should be aware that rejected syscalls indicates that the
>> +context is broken and for robust apps the recovery should happen for the
>> +context. Non-robust apps must be terminated.
> I think the termination thing probably needs to be much more nuanced,
> and also interact with the repeat-offender policy.
>
> Repeat-offender policy could be implemented in userspace too,
> especially if userspace keeps using the same device fd which is likely
> hidden by the gfx API.
>
>> +
>> +Compositors
>> +-----------
>> +
>> +Compositors should be robust as well to properly deal with its errors.
> What is the worth of this note? To me as a compositor developer it is
> obvious.

As it is it doesn't says much indeed, I think Christian suggestion adds 
something more meaningful to this part.

>
> Thanks,
> pq
>
>> +
>> +
>>   .. _drm_driver_ioctl:
>>   
>>   IOCTL Support on Device Nodes
