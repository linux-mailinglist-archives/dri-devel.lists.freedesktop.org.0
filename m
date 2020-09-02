Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D625AD96
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3706E4B5;
	Wed,  2 Sep 2020 14:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC916E4B5;
 Wed,  2 Sep 2020 14:45:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o21so4858411wmc.0;
 Wed, 02 Sep 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/dvle3j9y6O7Ujf2ahiU0ShW9hGye771vvDoEz/F4PY=;
 b=JwH0hkrutiCbJKZ/aZB4ztxSuEKXc/RHIh5DLGmAPyF8Znq4pnnDq6HnIVd3Ok4oTh
 YU2/xlVVNV+y/dpU4t0M0hxJtAIdfjRJ2IINlhhuD1mr5UTpxPRjXG5ER1+86kCAJBE2
 XnsmOi2L7b56QYT0cx7Vq1BWNH5nuurqO18jQkMXr2EtF9547IJz2WqLUAUZCKANG13Z
 9AyqoCsWAVtYDOyx/jG9NRJDYNT7Sn8Ae/0jUYoDShmWtEGzFn4tQVq70ajo4xNzKXhq
 s2jQOWKwLgTjC2TFqY9ubnOwFj6UdOFNVNs199snMCdpWB+NGQRSIXh36wk4CvwioGWz
 RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/dvle3j9y6O7Ujf2ahiU0ShW9hGye771vvDoEz/F4PY=;
 b=TpbDRcgpfDaj1IJV1hXNfvfH5pkLKHshscwyckck7+1bxcraO1AWNMdc1LjsVEap0X
 8dji84uHyEo5ICQ/13DUCHxOa4fDIQA+jk/6fJ1X4Ot7itMJA/Fmf84oIas0SpMWBGFS
 YoZep+3488eKVuquERJwLSTSP5QZ7+mNuZvDYnpZEl18kobqfCi8vzUG/r3JEZvKTJKk
 IxdABSsh9gkUiK20uKaD5p8V0duC/AnwrT0DkjH1kGiK3qQrrtpU3veFd9MYBpH9TSpB
 n8ZwUEZe4iuP0iyWgI937z0Xq0lljuFkqbEsmCoDvk2/sXm8POrvD+95qe5TbobqHu2O
 7Ixg==
X-Gm-Message-State: AOAM533qC9GElWQ0t94XHFx4q0adncdVnEzkYy+UPoFWBIIqS4oPhoda
 UZ5Qly/V/zpB7yU/fhNcu0wakf2cqa6D9Vu1bLY6jrgvdtU=
X-Google-Smtp-Source: ABdhPJxFnw2lIf6slElWW65nhFlI//yhOScWTQotPkmugwDQjQbmeTokKjX3zGLgqH+Z8ODw4ZvDqCRkh4/oranUikw=
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr998824wmt.94.1599057934946; 
 Wed, 02 Sep 2020 07:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154200.2451899-1-robdclark@gmail.com>
 <CAAObsKD2uXmRD7Qw+kWzKcz5o96adczdaTGkPA_1fR=UZcR=cA@mail.gmail.com>
In-Reply-To: <CAAObsKD2uXmRD7Qw+kWzKcz5o96adczdaTGkPA_1fR=UZcR=cA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Sep 2020 07:45:23 -0700
Message-ID: <CAF6AEGtTkbK-W_4bjJ9mmFuzu4NbSHztM0+yaOWaeT8U-_RWRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: More GPU tracepoints
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cat is somewhat out of the bag already.. so I took the approach of
making the more useful of the traces for visualization (freq_change
trace) identical to the i915 one in units and format, so userspace
just has to add another event name to a list, and not have to add more
parsing code.

But the bigger problem is that it doesn't seem possible to #include
multiple foo_trace.h's in a single C file, so I'm not seeing how it is
possible to have both generic and driver specific traces.

BR,
-R

On Tue, Sep 1, 2020 at 11:52 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Hi Rob,
>
> Do you think we could make all these generic? Visualization tools will need to do some processing so these can be neatly presented and it could be far more convenient if people wouldn't need to add code for each GPU driver.
>
> Maybe we could put all these tracepoints in DRM core as they seem useful to all drivers?
>
> Thanks,
>
> Tomeu
>
> On Tue, 1 Sep 2020 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Various extra tracepoints that I've been collecting.
>>
>> Rob Clark (3):
>>   drm/msm/gpu: Add GPU freq_change traces
>>   drm/msm: Convert shrinker msgs to tracepoints
>>   drm/msm/gpu: Add suspend/resume tracepoints
>>
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c  |  3 +
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c  |  4 ++
>>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +-
>>  drivers/gpu/drm/msm/msm_gpu.c          |  4 ++
>>  drivers/gpu/drm/msm/msm_gpu_trace.h    | 83 ++++++++++++++++++++++++++
>>  5 files changed, 97 insertions(+), 2 deletions(-)
>>
>> --
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
