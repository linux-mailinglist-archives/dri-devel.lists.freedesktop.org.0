Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB931EC0B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 17:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2836EA42;
	Thu, 18 Feb 2021 16:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22216EA40;
 Thu, 18 Feb 2021 16:11:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id m1so4462762wml.2;
 Thu, 18 Feb 2021 08:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VaWGH3cwhYh4BHCCROkHu3HMiH4QPakbevCqWXhdWA0=;
 b=hFnnBqj9UW61LvYtGFegNLB36V2195NF7+wnGBwgStAQEW261MqLko2ZdH5P2A2A1o
 R1ViL1XLbuEHNWYzAgG0zibxxJUBnEt0ilN5CsURh6UnuVpaYjvwxKX6P8lv3j1WGyaV
 6MVXGyhQe+M7X/sE6bQ7vPqgBnaORWZIz04QcsMVMQaS9HkMwllYdCPoqWPcetK/9dx0
 GO2ShJEhcUYDn2ha4uowl0LUBSxztnVpG9Cn23Xi6d+7HsvvQrMAE9h+hwSg6oVb3rsV
 X73ybvREldXEkialUtf6aJj2DcinWwP/xm7FMpTgAJHMkuB5L+1GQz4byElvzWSAOQjX
 9Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VaWGH3cwhYh4BHCCROkHu3HMiH4QPakbevCqWXhdWA0=;
 b=rbgZlieoW3W2jo3gOx0a5fJAINMakliLUKBUNLKbLhnKT82/W33Vbhw2WhXTiqIMjz
 zBsWMjOJhA0Af6ksmP8p/kHsDWD4jdRQkkgIPlHrRQFQfV7rV59pudux1/O9MzpIqret
 laThJju4+8xzTEznkZOOHdhblcUvYhHMj/I1eDNoTZorPx7DJLvcJcYPj/jbm9A2ItT0
 MK/X3/Cc0dNvMZ6ohEtI5a7ZAPk2tOOKcFmJORwzx2moPWAwKkCveXdl6cXwXJpbB8ig
 3aki9bKHtAljAujte8ETVaGoJqPT4huBSSQDFqdB+Bk8Vkp8k052e8P+hozCMrDTX0Kb
 IoCw==
X-Gm-Message-State: AOAM532s5Gdx2WbGkIqXZ/7nUPfBT3F8Zwoa/Huu4P0VFTzoNG37Gstv
 cRz1Oh38pFj0fa7lWmaVSxw29LyQyts7A842QyX/lYSiJw4=
X-Google-Smtp-Source: ABdhPJyFfpJXKxitmCOiwGNdIXY0rjTqKs7a0eRS4jHbH+qoQNaC2dKm1C7sSOxGr7QEumgYzRmb7lsHMqNooH7QjWM=
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr4300588wmj.123.1613664699499; 
 Thu, 18 Feb 2021 08:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
 <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
In-Reply-To: <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Feb 2021 08:11:27 -0800
Message-ID: <CAF6AEGsWCrkOgMVxnx53k8b_o7xy3KWv9VaNRoY44+4GfXtWdg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
> > On 2/17/21 3:18 PM, Rob Clark wrote:
> >> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
> >> <jcrouse@codeaurora.org> wrote:
> >>>
> >>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> >>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
> >>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
> >>>>> wrote:
> >>>>>>
> >>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
> >>>>>> ENOENT error,
> >>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
> >>>>>>
> >>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> >>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> >>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
> >>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
> >>>>>>
> >>>>>>          cell = nvmem_cell_get(dev, "speed_bin");
> >>>>>>          /*
> >>>>>> -        * -ENOENT means that the platform doesn't support
> >>>>>> speedbin which is
> >>>>>> -        * fine
> >>>>>> +        * -ENOENT means no speed bin in device tree,
> >>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> >>>>>
> >>>>> very minor nit, it would be nice to at least preserve the gist of the
> >>>>> "which is fine" (ie. some variation of "this is an optional thing and
> >>>>> things won't catch fire without it" ;-))
> >>>>>
> >>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> >>>>> we should have a harder dependency on CONFIG_NVMEM..)
> >>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
> >>>> property,
> >>>> we will see some error during boot up if we don't call
> >>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
> >>>> "speed_bin")"
> >>>> is a way to test this.
> >>>>
> >>>> If there is no other harm, we can put a hard dependency on
> >>>> CONFIG_NVMEM.
> >>>
> >>> I'm not sure if we want to go this far given the squishiness about
> >>> module
> >>> dependencies. As far as I know we are the only driver that uses this
> >>> seriously
> >>> on QCOM SoCs and this is only needed for certain targets. I don't
> >>> know if we
> >>> want to force every target to build NVMEM and QFPROM on our behalf.
> >>> But maybe
> >>> I'm just saying that because Kconfig dependencies tend to break my
> >>> brain (and
> >>> then Arnd has to send a patch to fix it).
> >>>
> >>
> >> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> >> other dependencies, so I suppose it wouldn't be the end of the world
> >> to select that.. but I guess we don't want to require QFPROM
> >>
> >> I guess at the end of the day, what is the failure mode if you have a
> >> speed-bin device, but your kernel config misses QFPROM (and possibly
> >> NVMEM)?  If the result is just not having the highest clk rate(s)
>
> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
> be very obvious what went wrong when this happens!

Ugg, ok..

I suppose we could select NVMEM, but not QFPROM, and then the case
where QFPROM is not enabled on platforms that have the speed-bin field
in DT will fail gracefully and all other platforms would continue on
happily?

BR,
-R

>
> >> available, that isn't the end of the world.  But if it makes things
> >> not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
> >> seems to be way harder than it should be to build a kernel that works,
> >> if we could somehow not add to that problem (for both people with a6xx
> >> and older gens) that would be nice ;-)
> >>
> >
> > There is a "imply" kconfig option which solves exactly this problem.
> > (you would "imply NVMEM" instead of "select NVMEM". then it would be
> > possible to disable NVMEM but it would get enabled by default)
> >
> >> BR,
> >> -R
> >>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
