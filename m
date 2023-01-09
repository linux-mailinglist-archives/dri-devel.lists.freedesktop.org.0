Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6847B662F10
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 19:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72F710E4F5;
	Mon,  9 Jan 2023 18:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CF110E4F5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 18:30:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so14329937lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 10:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lyg8ntH5k9A6+UghVFByrHhXnR9EgBOacK6dV87p4l4=;
 b=flQ78srWhyh+BhBnJgCj+3d8BpJNoiaLJ9fFjE1BrVwEC7qY3sNQIapjt4gvLMem27
 v3K6klXeYCxvF4ONJzmQBlmxSkl/rzTTrivpWf/MLcM/igrwemjjoIjFsWPoA9eMjk6a
 pa0BucdxFT2C12XC1PXj9yIlFxIFjrGQ8jpe7PgH1AC73NhL+Yud1YS0rtmy7zp+6syd
 +jUtfjpwlsgRYpRaaMTtUutXI83chMHEc7Q3Xo8rPGendjd+6ZgWrrV3PV0zBFKYIHOv
 82diee/wBoLXK2vijWbtPG85lap5VvbHyYRoAoJcRkSJVY0Hd70ellN7A86Jozu8l8eb
 Kzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lyg8ntH5k9A6+UghVFByrHhXnR9EgBOacK6dV87p4l4=;
 b=0qyWVXvCOLkcZjLyBY2K/LF/0ofdwh1JhKnKrI6qPE9hZOXPUfPuTVwdhdmeV6kKNv
 fQy2VmvBVqrv9U+q6tNQ1NRo42icY+SsOG00w7+mRCe8BIDKj6v0L1RrvCfVgBs8/oKN
 oDK1/F0GMEx8YlOpt1NWEQnZYbSdlaof+2/fHEexSZcE9pImsF3P6y5DVLY+KBT9rfZP
 UUo+ueR3AmRluOLB26Xj0tBVGgxq2yVXNeq/UqNayNf5CfPxrTFfDUzka8xqwsva0aKB
 nsUPm6jHzui3XG8Okp/nGaWDjL+kGseDCvPcM2sYvJ137EpqN19sIoClKeB+ulOwiDFF
 9ixg==
X-Gm-Message-State: AFqh2krrl6AIcOyKS0bLoXXCOCxK1H/N+zS0hm1OFVEenSaF9cdY73Sc
 yf5QVahZGZr6hn9SHA4ZepniEA==
X-Google-Smtp-Source: AMrXdXsWQngNQDB0O08A0S/nz925H3pGCUjqmmMIrRI9hbiX3aeuuBYCxPIxhHH/YVxQEasVEUw6HQ==
X-Received: by 2002:a05:6512:10d6:b0:4b5:834b:9f75 with SMTP id
 k22-20020a05651210d600b004b5834b9f75mr20213778lfg.33.1673289002662; 
 Mon, 09 Jan 2023 10:30:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm1735856lfv.128.2023.01.09.10.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 10:30:02 -0800 (PST)
Message-ID: <91254914-39a1-d11c-5e53-b35448253e22@linaro.org>
Date: Mon, 9 Jan 2023 20:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/dpu: sort entries in the HW catalog
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230108211113.200846-1-dmitry.baryshkov@linaro.org>
 <20230109083417.5drdfllpm4ythy42@SoMainline.org>
 <CAA8EJpoVC2OW4iKcq=C-D3hejVPZ1Bd+6Nb9vPk6DVVWP2_4rQ@mail.gmail.com>
 <20230109171052.wa43fccjh3f6wype@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109171052.wa43fccjh3f6wype@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 19:10, Marijn Suijten wrote:
> On 2023-01-09 11:22:42, Dmitry Baryshkov wrote:
>> On Mon, 9 Jan 2023 at 10:34, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> On 2023-01-08 23:11:13, Dmitry Baryshkov wrote:
>>>> Different entries into the catalog were added quite randomly. Enforce
>>>> the sorting order of some kind. It is not alphabetic to prevent the
>>>> patch from growing uncontrollably.
>>>
>>> Why not sort these chronologically based on DPU hardware revision in the
>>> match table at the end of this file?
>>
>> If we keep the SoC name as part of the symbolic name, we will end up
>> in another semi-random order that is a pain to verify. Would you
>> remember that sm6350 comes between sm6115 and qcm2290? I would not :-(
>> And changing all names to dpu_6_5_0_lms would make it easy to add but
>> nearly impossible to follow.
> 
> Agreed, though I think having the version in there would make things
> easier to follow.  Then everything uses the "lowest" version it is
> compatible with, and we duplicate the structs when adding a feature that
> is only available on newer (or older) revisions.

Up to some point...

> 
>>> Regardless, this patch is going to
>>> make it hard to properly rebase DPU additions; see for example patch 4/8
>>> and 5/8 in my second round of DSC fixes.
>>
>> Yes, quite unfortunate. As I wrote, it's already late to apply this patch :-(
> 
> At least we're working towards making things better, or at the very
> least discussing the right way forward.
> 
>>> At the same time we should find a solution to the wishy-washy reuse of
>>> structs and defines, which may appear the same initially but become
>>> mismatched as more features are added (see how I had to split out
>>> multiple of these in the INTF TE enablement series).
>>
>> It's a slightly different problem, but yes, I share the pain.
> 
> It is quite relevant though, as sorting is very closely tied to what
> structs we reuse where, considering what SoC name is used.  It is
> typically "what was already there" but a "least common denominator"
> would be more descriptive (e.g. based on hardware version).

The usual problem is that there are two dimensions: with each 
generations there are new (and removed) features, but on the other hand 
within each generation there are units that are feature-rich and the 
ones that are feature-deprived. qcm2290, sm6115, etc.

> 
>>>> Thus SDM comes before SC and SM
>>>> platforms and QCM is kept as the last one. There are no functional
>>>> changes in this patch.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>
>>>> Yes, I hate such mass-moves too. However the entries in this file are
>>>> slowly becoming uncontrollable. Let's enforce some order now (while it's
>>>> late already, but not _that_ late).
>>>
>>> I agree that something should happen, contributing to this file is
>>> unnecessarily tough.
>>
>> In the IRC conversation Rob suggested playing with includes, but I
>> don't see a good way to implement that.
> 
> That would be nice; especially if we accept struct duplication (instead
> of recursively including "earlier" versions where needed, as mentioned
> in IRC that'll spiral out of control).  With that one can easily diff
> two include files and understand the differences between SoCs and/or DPU
> hardware revisions (or notice whether a certain configuration might be
> missing/extraneous).

Let's see what kind of binary growth does it bring. In the end it well 
might be that the compiler is smart enough.

> 
> - Marijn

-- 
With best wishes
Dmitry

