Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F077AC0C0A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C218C10E731;
	Thu, 22 May 2025 12:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="UZeQoVEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B665810EA09
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:57:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a37535646aso2999209f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747918667; x=1748523467;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
 b=UZeQoVEqCxDhl56RoqeEaSMwRHwb3X3TPc/XzcYj1jzMAIv8HhGT4w7ElhccvI4p8z
 j7J7bNnxcfZkVvnyGGL2MfCkmAFA7nCYt7XXr1Rj1+TY2NIEmFLzCykEMSdvfRZzkV9o
 82rChsjfxWDfQcT4r26z0CAI+9yK3awThIPa9PjrzamNr4CDnXeGxq6JGMHFC4HCCkNZ
 NLZa4/yCZ6K+lPrIBWx7nxv6zFZlfvfsVkY+i5aTMbVZvYf+L5EPIyqN5F4l/hqCQzCx
 GIC4n+g12BfGRl9yalsOJNr3/uVjZelBEwT7F1VO8Bw7VOjeqSpvbCklGWgUsFQ1wA1/
 bM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747918667; x=1748523467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
 b=u7uBkJtGFYA5WLV9cpb/Ao8VXS5BKJXPs9g4uCC/7MkL8WE/xiXAnR2DJm+eb2/9dr
 7bUT81InlUrsad0zaJsQX7fZMZlg3BBM1SOD9AeTsaIuNIKbUIWNHOvqXYOsy+AbX2N/
 7j9Hpay5UCzZapLCnF9OKp5nDwNLgN6joMIHjFadFelLZ+hGStMpf26b9lmNMIF+giNC
 l3EO9ibe7vzINy1ByzZKis78rnCgabsYbUTPI1xBfPRZg/U7zxWUdskBT1we8gcj/uyu
 m+yv5iUMrd1F+L5LcIg86IFZG8bZyqph1SfRqzn/VemC7hLDTHPyM86P9YRoe03gxWfs
 lkjw==
X-Gm-Message-State: AOJu0Ywh1cbSk8IC3/uuiazeM7kDs8x0UPmo0uwObRw0G1K0MGaCqohV
 2agUwIYGJMo6F/JPMd+3ZWBtZtZARMeZa1dnBO03p5q1l3SFMOOqK7NL2OQA23OBKS8=
X-Gm-Gg: ASbGncu6dHRgGHrPH3tgg4TDbq6uS5+eWubge0piLY/+GDgZIMSGo1ur5WJ0L9gwBWz
 XqW/VT5XgbNhOLJboETfP59WjT2Iz9I6YUrrpxQKV6/Lcbv1W1TQq2oKaINbyopWcteeC7lAUS+
 picx+b3FagJXUEpcLjkraTVTHL+vUrhjTaLtEiF/m5lQlg1ZyXoB4tG9bZiBdsEBPI2+2BVnd9/
 BrJihKUwUMQ6yDXsfFgbtvCNoZ1V++I5ecEneyM9kAs2yVMMCjW0f2lJje+uXqFHdrHNC/xDg7k
 A1inYNQ+Coj1ConGfKVkEJZW3tqfs3825CWovmFU+nC3UsR0Pt2S9ij54rwhSajTlA==
X-Google-Smtp-Source: AGHT+IHvgtQQC0r16ZhryOrtlBzgjmQhsHS0R3Z6+yIPce93CHi+ORR3bGFByrXrywpyK9wgMjlkUA==
X-Received: by 2002:a05:6000:40dd:b0:3a3:7816:3e17 with SMTP id
 ffacd0b85a97d-3a378163e38mr12097933f8f.8.1747918666820; 
 Thu, 22 May 2025 05:57:46 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca6210asm22857327f8f.41.2025.05.22.05.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 05:57:46 -0700 (PDT)
Message-ID: <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Date: Thu, 22 May 2025 13:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/05/2025 13:34, Christian König wrote:
> On 5/22/25 14:20, Philipp Stanner wrote:
>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>> dma_fence_is_signaled_locked(), which is used in
>>>> nouveau_fence_context_kill(), can signal fences below the surface
>>>> through a callback.
>>>>
>>>> There is neither need for nor use in doing that when killing a
>>>> fence
>>>> context.
>>>>
>>>> Replace dma_fence_is_signaled_locked() with
>>>> __dma_fence_is_signaled(), a
>>>> function which only checks, never signals.
>>>
>>> That is not a good approach.
>>>
>>> Having the __dma_fence_is_signaled() means that other would be
>>> allowed to call it as well.
>>>
>>> But nouveau can do that here only because it knows that the fence was
>>> issued by nouveau.
>>>
>>> What nouveau can to is to test the signaled flag directly, but that's
>>> what you try to avoid as well.
>>
>> There's many parties who check the bit already.
>>
>> And if Nouveau is allowed to do that, one can just as well provide a
>> wrapper for it.
> 
> No, exactly that's what is usually avoided in cases like this here.
> 
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> 
> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

But why? Say for example scheduler dependencies - why the scheduler 
couldn't ignore them at add time, but it can before trying to install a 
callback on them, and instead has to opportunistically signal someone 
else's fences?

I don't see it. But even if there is a reason, advantage of the helper 
is that it can document this at a centralised place.

Regards,

Tvrtko

>> That has the advantage of centralizing the responsibility and
>> documenting it.
>>
>> P.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>> nouveau_fence_chan *fctx, int error)
>>>>   
>>>>   	spin_lock_irqsave(&fctx->lock, flags);
>>>>   	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>>> {
>>>> -		if (error && !dma_fence_is_signaled_locked(&fence-
>>>>> base))
>>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>>> base))
>>>>   			dma_fence_set_error(&fence->base, error);
>>>>   
>>>>   		if (nouveau_fence_signal(fence))
>>>
>>
> 

