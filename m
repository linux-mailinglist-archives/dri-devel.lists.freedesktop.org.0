Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1175A31853B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 07:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E66E877;
	Thu, 11 Feb 2021 06:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A656E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 06:31:34 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r23so6098426ljh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 22:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TOklzTxcOPwXWm9l4jAtrQGEX72i+JYfSaQ1C89RGRo=;
 b=qnneM9R57nLabELW/YH9tUuEX5unBD1JcTlYUbyDGo8pnsUhv3opcGKHlNArEyrnN4
 wm8JfDQaVf4wEtIs91AdUmDB5DFAzADdtkexFYKv6h4M234HXguw8PHSTG3eVFmLevFd
 nWj5iKSGY5Xi4iRcCgPlF72NBsLFixuDwkNcy38MajafFU0CWlHJ9I+iPN2nbaPOJFpo
 s1oonq068H4BotjiSwn72yBpULWJgIBRQKbibLeA0fw6F8gHyYcI61yMPDrZ41DjlmGn
 sKufkvne5fDQCbxdPqITN4OfzQpHr465P7YsQ8RYFO2CzOrTCsSSSYZFnRl3EpB/DjJz
 w68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TOklzTxcOPwXWm9l4jAtrQGEX72i+JYfSaQ1C89RGRo=;
 b=pn8NKg3Nwd8SBFxGTNhJn6qqR07OKrGpGMFlbxESpzRQ0lQyhyLkyGc9M0a9f8XKyO
 UnmXnUG1JLsFEgabWzqFK2iE4zaw6zqTUjmSprIvy1zS9WoWObTyxBP5lapwKTOA8JGm
 B5wCRyFStde8EOLcvb5AuxFEdY232iSNja/ThuuCXJMbXAHWw4wEehOP64yWFyn9KnTI
 XIGEWXgdd2MwGYYwuNLWoEUY6kigB2nrf3HeOHxcmsolb0kYl4t8+LUMd62cu80/2278
 A91wBQfQ9Du5Lskfk1cSP3NjUTN2PcusLTQjvEShYDzaBhkAA9wB5C4dD+6X/rNby4JR
 3xFQ==
X-Gm-Message-State: AOAM53204YSNBbjiFTXbyj6tSKuJr1n2jjO9eaNTRmJSlYrzPr4eKxqm
 leQcXBzdDIQM/E8QCliSzWvXNsBg939sLEgwoAHf
X-Google-Smtp-Source: ABdhPJx/9/HNDNJcLRGssimKlDf9O5AgjQSrRU4KThg18nUC5lraPvdhEridoHTbn6686spRilzj/rpn5DqLc/GsgR0=
X-Received: by 2002:a2e:3e08:: with SMTP id l8mr3042754lja.118.1613025092915; 
 Wed, 10 Feb 2021 22:31:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac2:50c7:0:0:0:0:0 with HTTP; Wed, 10 Feb 2021 22:31:31
 -0800 (PST)
In-Reply-To: <443a02b7-8b39-e339-e2b8-6c9211a1b2ca@igalia.com>
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
 <20200903164821.2879-4-i.can.speak.c.and.basic@gmail.com>
 <0f552124-ebcf-2f7c-6aa2-9ad84f838717@igalia.com>
 <CADaigPWcU5rB8HJWNtrb7p=icr5jFrqZnAQd-K6tWKvm0Yjr9Q@mail.gmail.com>
 <CACzkUEu2TtWVzJ6obR4LovP5G9mqzRZzgMArP73qmB4S9LP2CQ@mail.gmail.com>
 <443a02b7-8b39-e339-e2b8-6c9211a1b2ca@igalia.com>
From: Yukimasa Sugizaki <ysugi@idein.jp>
Date: Thu, 11 Feb 2021 15:31:31 +0900
Message-ID: <CACzkUEtOd5W0fwphKKe4CbxKAPy_60mxSignZMyq3WnAUYmR6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/v3d: Add job timeout module param
To: Chema Casanova <jmcasanova@igalia.com>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2021, Chema Casanova <jmcasanova@igalia.com> wrote:
>
> On 5/2/21 13:28, Yukimasa Sugizaki wrote:
>> On 05/02/2021, Eric Anholt <eric@anholt.net> wrote:
>>> On Thu, Feb 4, 2021 at 10:09 AM Chema Casanova <jmcasanova@igalia.com>
>>> wrote:
>>>> On 3/9/20 18:48, Yukimasa Sugizaki wrote:
>>>>> From: Yukimasa Sugizaki <ysugi@idein.jp>
>>>>>
>>>>> The default timeout is 500 ms which is too short for some workloads
>>>>> including Piglit.  Adding this parameter will help users to run
>>>>> heavier
>>>>> tasks.
>>>>>
>>>>> Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
>>>>> ---
>>>>>    drivers/gpu/drm/v3d/v3d_sched.c | 24 +++++++++++++-----------
>>>>>    1 file changed, 13 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> b/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> index feef0c749e68..983efb018560 100644
>>>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> @@ -19,11 +19,17 @@
>>>>>     */
>>>>>
>>>>>    #include <linux/kthread.h>
>>>>> +#include <linux/moduleparam.h>
>>>>>
>>>>>    #include "v3d_drv.h"
>>>>>    #include "v3d_regs.h"
>>>>>    #include "v3d_trace.h"
>>>>>
>>>>> +static uint timeout = 500;
>>>>> +module_param(timeout, uint, 0444);
>>>>> +MODULE_PARM_DESC(timeout,
>>>>> +     "Timeout for a job in ms (0 means infinity and default is 500
>>>>> ms)");
>>>>> +
>>>> I think that  parameter definition could be included at v3d_drv.c as
>>>> other drivers do. Then we would have all future parameters together. In
>>>> that case we would need also to include the extern definition at
>>>> v3d_drv.h for the driver variable.
>>>>
>>>> The param name could be more descriptive like "sched_timeout_ms" in the
>>>> lima driver.
>>>>
>>>> I wonder if it would make sense to have different timeouts parameters
>>>> for different type of jobs we have. At least this series come from the
>>>> need additional time to complete compute jobs. This is what amdgpu
>>>> does,
>>>> but we probably don't need something such complex.
>>>>
>>>> I think it would also make sense to increase our default value for the
>>>> compute jobs.
>>>>
>>>> What do you think?
>>>>
>>>> In any case I think that having this general scheduling timeout
>>>> parameter as other drivers do is a good idea.
>> I agree with your observations.
>> I'm going to add bin_timeout_ms, render_timeout_ms, tfu_timeout_ms,
>> v3d_timeout_ms, and cache_clean_timeout_ms parameters to v3d_drv.c
>> instead of the sole timeout parameter.
>> Though not sophisticated, this should be enough.
>
>>> Having a param for being able to test if the job completes eventually
>>> is a good idea, but if tests are triggering timeouts, then you
>>> probably need to investigate what's going on in the driver -- it's not
>>> like you want .5second unpreemptible jobs to be easy to produce.
>>>
>>> Also, for CS, I wonder if we have another reg besides CSD_CURRENT_CFG4
>>> we could be looking at for "we're making progress on the job".  Half a
>>> second with no discernible progress sounds like a bug.
>> If binning/render/TFU/cache_clean jobs keep running over 0.5 seconds,
>> then it should be a bug because they normally complete processing
>> within the period.
>> However, a CSD job can do anything.
>> For example, SaschaWillems's ray tracing example requires about 0.7
>> seconds to compose a frame with compute shader with Igalia's Vulkan
>> driver.
>
> I've been checking the values of the registers with SaschaWillems
> computeraytracing on job submission, timeout evaluation and job destroy.
> The driver detects progress. CSD_CURRENT_CFG4 values are decreased as
> expected based in the number of pending batches. Next debug info starts
> with 262144 - 1, and we can see it ends with 0xfffffffff. So, I think
> that using CSD_CURRENT_CFG4 is working as expected. We could see also
> that CSD_CURRENT_ID0 and CSD_CURRENT_ID1 could also be used to track
> progress as we see how values are changing for X, Y and Z component of
> current workgroup ID. But comparisons on CSD_CURRENT_CFG4 are simpler.
>
> 10661.766782] [drm] CSD launched: timeout_batches (0x00000000) | cfg4
> (0x0003fff9) | id0 (0x00000080) | id1 (0x00000000) | status (0x00000056)
> [10662.272345] [drm] CSD timeout check: timeout_batches (0x00000000) ->
> cfg4 (0x0002dfaf) | id0 (0x00050000) | id1 (0x00000024) | status
> (0x00000056)
> [10662.792324] [drm] CSD timeout check: timeout_batches (0x0002dfaf) ->
> cfg4 (0x00018c1f) | id0 (0x003e0000) | id1 (0x0000004e) | status
> (0x00000056)
> [10663.302350] [drm] CSD timeout check: timeout_batches (0x00018c1f) ->
> cfg4 (0x0000724f) | id0 (0x005b0000) | id1 (0x00000071) | status
> (0x00000056)
> [10663.487139] [drm] CSD free: timeout_batches (0x0000724f) -> cfg4
> (0xffffffff) | id0 (0x00000000) | id1 (0x00010000) | status (0x00000060)
>
>> Another example is our matrix computation library for QPU:
>> https://github.com/Idein/qmkl6
>> It requires about 1.1 seconds to multiply two 2048x2048 matrices.
>> Because in general we do not know what is the expected behavior of a
>> QPU program and what is not, we also cannot detect a progress the
>> program is making.
>> This is why we want to have the timeout parameters to be able to be
>> modified.
>
> In case of qmkl6, all jobs are launched with CSD_CURRENT_CFG4 is
> initialized as 7 (Number of batches minus 1) so when the job starts, all
> the batches are on execution. So, the HW cannot report any progress, and
> CFG4 reports that there are no pending batches queued with ~0.
>
> This is the trace of v3d_submit_csd_ioctl calls showing CFG4.
>
>       sscal-qmkl6-26222   [002] .... 11978.399780: v3d_submit_csd_ioctl:
> dev=1, CFG4 0x00000007, CFG5 0x00560000, CFG6 0x00280000
>       sscal-qmkl6-26222   [002] .... 11978.518960: v3d_submit_csd_ioctl:
> dev=1, CFG4 0x00000007, CFG5 0x00560000, CFG6 0x00280000
>
> Here is a example of the process finishing before reaching the timeout:
>
> [10339.374376] [drm] CSD launched: timeout_batches (0x00000000) | cfg4
> (0x00000001) | id0 (0x00080800) | id1 (0x00000000) | status (0x00000b34)
> [10339.470097] [drm] CSD free: timeout_batches (0x00000000) -> cfg4
> (0xffffffff) | id0 (0x00080800) | id1 (0x00000000) | status (0x00000b40)
>
> Here is the example of a job that reaches the timeout and RESET:
>
> [10339.980849] [drm] CSD launched: timeout_batches (0x00000000) | cfg4
> (0x00000000) | id0 (0x00080800) | id1 (0x00000000) | status (0x00000b44)
> [10340.497731] [drm] CSD timeout: timeout_batches (0x00000000) -> cfg4
> (0xffffffff) | id0 (0x00080800) | id1 (0x00000000) | status (0x00000b44)
> [10341.007815] [drm] CSD timeout RESET: timeout_batches (0xffffffff) |
> cfg4 (0xffffffff) | id0 (0x00080800) | id1 (0x00000000) | status
> (0x00000b44)
> [10341.008143] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting
> GPU for hang.
> [10341.008241] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR*
> V3D_ERR_STAT: 0x00001000
> [10341.008311] [drm] Skipping CSD job resubmission due to previous error
> (-125)
> [10341.008375] [drm] CSD free: timeout_batches (0xffffffff) -> cfg4
> (0x00000000) | id0 (0x00000000) | id1 (0x00000000) | status (0x00000000)
>
> In the general case we need at least to reach the timeout twice to reset
> the GPU.
>
> Jobs start with 0 on timeout_batches, then the value is updated to
> 0xffffffff and at next timeout evaluation there is no progress as all
> batches have already been submitted. Then we reset the GPU.
>
> I don't know if the algorithms in qmkl6 or py-videocore6 cannot be
> launched using more batches. But if this is not the case adding the
> timeout module parameter seems to be our first solution. It would
> probably be enough adding a general timeout "timeout_ms" for debugging
> any kind of job and a specific "csd_timeout_ms" that only applies to CSD
> jobs and could be used by systems that need to execute this kind of
> jobs. When the CSD timeout is reached we could probably notify with a
> DRM_WARN suggesting increasing the csd_timeout.
>
> Kind regards,
>
> Chema Casanova

Yes, our CSD codes perform computation with just eight batches (one
batch per QPU) for two reasons.
One is for efficiency and the other is that we cannot always divide
the problem to run within 500 milliseconds.
So we too think it makes sense to add the timeout parameters.

Thank you for the suggestion on the parameters.
Though I've completed implementing them, we are facing an issue where
very occasionally v3d_irq() is called by a finished CSD job during the
reset by v3d_gpu_reset_for_timeout().
In this situation, v3d_irq() reads V3D_CTL_INT_STS as 0xdeadbeef (no
response), and the remaining operations cause a kernel panic.
I suspect this can be fixed by holding v3d->reset_lock in v3d_irq(),
but we've not completed testing it yet.
I appreciate your patience.

Regards,
Y. Sugizaki.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
