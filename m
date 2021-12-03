Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CD4677EC
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75E7AB88;
	Fri,  3 Dec 2021 13:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D4B7AB87
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 13:14:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c32so6469252lfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ivs5tUHl8CTOTUJU2uh23j/2YiIaxPZ968pusd66ktc=;
 b=vu2F4TFLkAVejgKeo2TVUQirixjQvurAX1QBWmZF7f04kjN8WiZeWZoyT3UvOV3SGb
 XwSthiJoKZq7qMu82QkcBKmSJWzt3IYqFLyO0FsP6fVOh6J59E3kkbzT59w1WB0GHil+
 +UPI3orS1RWcQv8V12o30n2BWxQENKz2hU9XM7xO0fawsXUMzfnvp6yWuYYdX2d+mWO7
 kLDGG1b7Ve5c/Au938Z+fTwgil/Gl2Tr22FTrEJh0PaBHA9IRlYZtbYFBDw4plm/+cPt
 y7lIQ47Joj987QEErridEQgm+iiSzQw8K4f8FpP76N96PE0hgvTVGghfdKGvoW0peQsy
 rxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ivs5tUHl8CTOTUJU2uh23j/2YiIaxPZ968pusd66ktc=;
 b=jiKyy2G6KhV1rDJEG/iifoVsbU2U6wgnl526lrOXhyEfyZ7QSlaB/ZR5kztX68Rs6s
 EJ4qxUgn8eyi0j5DXhDXxjM79if8WVPH6/m1DEAWS8NontIRAApIwirQYwy5rFS2hU9i
 ygH7YkBaL6stAyzYEiNJAeC4HpdqnWlAk04ZfFNDC2ilY6msdB8jP4FEWoG+zjvXlKFz
 lGrwHRKHrNWAVZGsMuOvYGl7ykn1Cz06GUuSn1wMBv5UEqczRc9vpVNghV7jlpXwUv5z
 WWoIdyuWxWNDV3+Z6dQfclJFk0gQ7+yCqgMYRVeltvwiIj/DwH564kQv9zu5Vr9Mv7tt
 zbqQ==
X-Gm-Message-State: AOAM530u3q0f8OpcJIPN+aLJIAg3TL+3ogA74GK8HNKjfjjdGffdDdpX
 V7TygUg4OxM+k1BYI+5QAFfATQ==
X-Google-Smtp-Source: ABdhPJxOBXL8m68oGl3M2iu/1ENcT/1Ea1PAM0shYBl742zqS0YKX77sdfd77Z6udFzd6e8GINmPqA==
X-Received: by 2002:ac2:50d2:: with SMTP id h18mr17496693lfm.421.1638537275543; 
 Fri, 03 Dec 2021 05:14:35 -0800 (PST)
Received: from [192.168.43.7] ([188.162.64.246])
 by smtp.gmail.com with ESMTPSA id b2sm397953lfj.280.2021.12.03.05.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 05:14:35 -0800 (PST)
Message-ID: <4cb2fd68-6917-3ac3-f387-7cecb07177f3@linaro.org>
Date: Fri, 3 Dec 2021 16:14:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201105210.24970-3-angelogioacchino.delregno@collabora.com>
 <20211201202023.2313971-1-dmitry.baryshkov@linaro.org>
 <21fe6cf4-3cef-91e1-7bf7-b94ac223e7c5@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <21fe6cf4-3cef-91e1-7bf7-b94ac223e7c5@collabora.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 13:43, AngeloGioacchino Del Regno wrote:
> Il 01/12/21 21:20, Dmitry Baryshkov ha scritto:
>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>> DSI host gets initialized earlier, but this caused unability to probe
>> the entire stack of components because they all depend on interrupts
>> coming from the main `mdss` node (mdp5, or dpu1).
>>
>> To fix this issue, move mdss device initialization (which include irq
>> domain setup) to msm_mdev_probe() time, as to make sure that the
>> interrupt controller is available before dsi and/or other components try
>> to initialize, finally satisfying the dependency.
>>
>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>> Co-Developed-By: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> When checking your patch, I noticed that IRQ domain is created before
>> respective MDSS clocks are enabled. This does not look like causing any
>> issues at this time, but it did not look good. So I started moving
>> clocks parsing to early_init() callbacks. And at some point it looked
>> like we can drop the init()/destroy() callbacks in favour of
>> early_init() and remove(). Which promted me to move init()/destroy() in
>> place of early_init()/remove() with few minor fixes here and there.
>>
> 
> 
> Hey Dmitry,
> I wanted to make the least amount of changes to Rob's logic... I know that
> the clocks aren't up before registering the domain, but my logic was 
> implying
> that if the handlers aren't registered, then there's no interrupt 
> coming, hence
> no risk of getting issues. Same if the hardware is down, you can't get any
> interrupt, because it can't generate any (but if bootloader leaves it 
> up.. eh.)

We can get spurious interrupts for any reason, which puts us at risk of 
peeking into unpowered registers. So, while your approach was working, 
it did not seem fully correct.

> 
> I recognize that such approach is "fragile enough", lastly, I agree with 
> this
> patch which is, in the end, something that is in the middle between my 
> first
> and last approach.
> 
> I've tested this one on trogdor-lazor-limozeen and seems to be working 
> in an
> analogous way to my v2/v3, so on my side it's validated.
> 
> 
> Let's go for this one!
> How do we proceeed now? Are you sending a new series with the new 
> patches, or
> should I?

I'll run a few more tests and then I'll probably include both patches 
into the next series to be sent to Rob.

> 
> Also, I don't think this is relevant, since I'm in co-dev, but in case 
> it is:
> Tested-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> 
> P.S.: Sorry for the 1-day delay, got busy with other tasks!

No problem, it was just single day, no worries.

-- 
With best wishes
Dmitry
