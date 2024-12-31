Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B49FEF5C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 13:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F28910E042;
	Tue, 31 Dec 2024 12:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="HAV47V8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1CB10E042
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 12:52:49 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso105722295e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 04:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1735649508; x=1736254308;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
 b=HAV47V8k1JTAX0vG9XYAzTG0zFxPVcCL0oy0EQOu1QXuh6bK+OeDk1KsRYINN7+m9j
 Oz1KvAZOzvVxGQjxPNjr8Ls8rnrrspc0yZusSrBwJBHFyEIUhKH7uQ/Ll/Oi+QdeO0S0
 n699Fk0P7ox8B3pJF1ERGlSLyi+7aZKbokW3dbTiGgqq20MOG8WfE6GIxd4A8lfxnKE7
 wL1RpLQ+t5dxLvDdWtyhlfBxS1khcoc21L/yasS8G+V7N19ayKzJMzqkFpRDTphfeSRk
 TJL4Nk+54iqN3Jc8PpXkoq3kNqhkpbNFvGz0lKUSHig7dScSqVGo9kLobJfj/mbULT58
 NDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735649508; x=1736254308;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
 b=i5OEaZlWWNNZVh6AC4lUUSVrohR/KseGrhDz0S61SJb3vSqiZZ2JvTWxervC8pQ8Ck
 uvetzJZBBIT+eys77T8tjrH1WqvWehHFrjUIJfhRtMIVJqrxkhhoy8idbGjVHSF7O6VT
 tNng1RWUXFo+4XaRS/t1zit70PLgicIwY4JdBlRW7JofZ96/C5aae99uiTRk2YmLlAcb
 K5ghN64aQiSlQpqJam6Jf8SAaCZqWxBhmzNp3V0k4jgl3J9ivh9zI1Rx/Ltc8fLZozYR
 c76TcBxlxBHvTYqQ8BRSzQ6bAC12Ne+FaKNLpS90nzjf1dzTOktL7q97Kz3VxU5OD5fq
 1I6w==
X-Gm-Message-State: AOJu0YwX3S4vwIp43+EyG5J88Fv5wjNecWlP/xTKCPYU8Rr64x1jArta
 tqqnANZwGr581rKx0MLvVP9hYUSo5h3yfWAFULtEXc+Mgscq7M3ajI8/1hpW51gciZJ6l12hSEY
 J
X-Gm-Gg: ASbGncsQzqn9KRqyvao105izEpSf5tNEK/Z/ACaty0Q6iFzisKNCWS+14jd+GzZkhac
 wsR7UGhHxbH+OyLCYBeGSTJc9eZl+t+JjOehwdNeNW4SVQIdj/hi/SnlHncf/w71/1HnbA6y1Zt
 dDJOJNyTjekb41sdlEoudBc2XxhCL1aKRhUcFvsURDgQoRWc71YY/fBk9JYY1zJWX4yjgtdIMuV
 KmSTI51FKPEHl1auhkju7AI0o53f4H/aAKd4UW1aUYSjE0sSEC7ZJFSh8EcYhBSpaB2GWWw
X-Google-Smtp-Source: AGHT+IEonJCQkKfmUZRTTcQxMpQNh8v+hJ8WjpocKj3WTxQpFwWxDIM9bcA7O43AFVEzFIMvitFZLg==
X-Received: by 2002:a05:600c:4748:b0:434:f804:a9b0 with SMTP id
 5b1f17b1804b1-43668b78818mr314536595e9.29.1735646132934; 
 Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3e0sm390817235e9.7.2024.12.31.03.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Message-ID: <1b5a3555-1094-404c-8b71-49dd07f59ac9@ursulin.net>
Date: Tue, 31 Dec 2024 11:55:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
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


On 22/11/2024 15:51, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>> helper macro to make it easier to add debug logging which can be enabled
>>> at runtime via drm.debug.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>
>> [...]
>>
>>> +/* Helper for returning a UABI error with optional logging which can make
>>> + * it easier for userspace to understand what it is doing wrong.
>>> + */
>>> +#define UERR(err, drm, fmt, ...) \
>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>> +
>>>   #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>
>> I'm generally not a fan of adding driver-specific debug prints..
>>
>> Maybe that's something that could be pushed to the drm-common layer
>> or even deeper down the stack?
> 
> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> just #define UERR() to be a wrapper for it, since line length/wrapping
> tends to be a bit of a challenge.  And I have a fairly substantial
> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> that was actually the motivation for this patch.)
> 
> I noticed that xe has something similar, but slightly different shape,
> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> length problem into the if() conditional.  (And doesn't provide the
> benefit of being able to display the incorrect param.)

FWIW there is also a debug only builds hack in i915:

/* Catch emission of unexpected errors for CI! */
#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
#undef EINVAL
#define EINVAL ({ \
	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
	22; \
})
#endif

UERR functionality wise looks quite good to me. Better than the other 
two. The name is not scoped but I appreciate the readability line length 
challenges.

Regards,

Tvrtko
