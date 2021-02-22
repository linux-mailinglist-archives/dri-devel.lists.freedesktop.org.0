Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C3321C1F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E616E10B;
	Mon, 22 Feb 2021 16:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FE46E10B;
 Mon, 22 Feb 2021 16:03:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id n4so19672059wrx.1;
 Mon, 22 Feb 2021 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M3HrPldQNINRDApkREUB3CejIa6YRDxufQU+GfYs42A=;
 b=TJPGKawlVl43Zfhg5kXKIMNPLifrS+FKQLdlcAzrn82TAGzn6WwW0RxJY0PEWQUaT6
 Ru480aODjlOuCph8XyCP+NyOWP8Q5jY9DykDQlAms2jwMGSwd4CYsWWScxrS5dmjBmRO
 Cx5C5htnSYVfObO1nzUoW1GtQAAfJ6wZHNFfT74YvteqG+vdnbNj3xFwHUVMeQoysJHj
 LeCijUp56FsvsML+pem4TB4AwBxXlxcsoPePfrczD3oNDxTY5mIzq9jr5gNqJrfz1KDA
 uIGtlXGQYQoxoQpQpHge6TXy4kza72QrYxojC62MN4sDmXCViR34ghY7dKf3yynYP1Vd
 zEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3HrPldQNINRDApkREUB3CejIa6YRDxufQU+GfYs42A=;
 b=aPQokzFkktEo3gEJ6tgMHrmy/ejlB+QoPs5X6sQE69zBUu/LoMBFRQYypBs5Cu28pJ
 TCyQs8w/ZSh0J/TZNYuQPaFzcMaUo1w3z5DvdtIkAi5KqDtiyoyKSsYgol2zlmmn0XeI
 1bavCjPdIFct6CGUXHXcdKV6uwQd7wWWL4uripc9X+20ic4dt+/0P8joQv+acLA1NdRZ
 8i9t1blESZDGpRsRqStwicn5nr0TDbCm4uSrWUSLNC4DnU2rR81vBYw3JzGAiIDmbDeT
 INlJ0aGxdAkNtouR94KBqjtGq1FzsbDfyMraMopiev+ZaJ/9rxE2URUoZl/rH3ngFiYb
 L2RQ==
X-Gm-Message-State: AOAM533IDJ6I2ZaG/HSL7Rti6hPp9k5lUZyM1Vudciy3X/U7AbytmjTA
 laVnrBb5m2HHc/rpKDQuJR+A627+X+tUqfTWaA0=
X-Google-Smtp-Source: ABdhPJzAmISKz624HeEpKgKdI0aNDUTbh4qfVREBzH+bS3Xmz/KkwIDif6koWv7cOeMcJe0BabSA6S2nRXomVyEYk3g=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr22500863wre.83.1614009820457; 
 Mon, 22 Feb 2021 08:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
 <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
 <CAF6AEGsWCrkOgMVxnx53k8b_o7xy3KWv9VaNRoY44+4GfXtWdg@mail.gmail.com>
 <757b557a-b5f6-6018-caa4-34bffb1b60b7@codeaurora.org>
 <CAF6AEGv-A5=4z7ZO-SytmivZTfKPYxhAjmRLVsQnrT7_pYCDtQ@mail.gmail.com>
 <0f057c99-ec94-f3e3-796f-b73a609f735d@codeaurora.org>
In-Reply-To: <0f057c99-ec94-f3e3-796f-b73a609f735d@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Feb 2021 08:06:38 -0800
Message-ID: <CAF6AEGvXYmcj0YuciZATveALJEP6DdFiwmtnYevrK2SEOJNZGg@mail.gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 7:45 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 2/19/2021 9:30 PM, Rob Clark wrote:
> > On Fri, Feb 19, 2021 at 2:44 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>
> >> On 2/18/2021 9:41 PM, Rob Clark wrote:
> >>> On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>>>
> >>>> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
> >>>>> On 2/17/21 3:18 PM, Rob Clark wrote:
> >>>>>> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
> >>>>>> <jcrouse@codeaurora.org> wrote:
> >>>>>>>
> >>>>>>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> >>>>>>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
> >>>>>>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
> >>>>>>>>> wrote:
> >>>>>>>>>>
> >>>>>>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
> >>>>>>>>>> ENOENT error,
> >>>>>>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
> >>>>>>>>>>
> >>>>>>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> >>>>>>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >>>>>>>>>> ---
> >>>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> >>>>>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
> >>>>>>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
> >>>>>>>>>>
> >>>>>>>>>>            cell = nvmem_cell_get(dev, "speed_bin");
> >>>>>>>>>>            /*
> >>>>>>>>>> -        * -ENOENT means that the platform doesn't support
> >>>>>>>>>> speedbin which is
> >>>>>>>>>> -        * fine
> >>>>>>>>>> +        * -ENOENT means no speed bin in device tree,
> >>>>>>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> >>>>>>>>>
> >>>>>>>>> very minor nit, it would be nice to at least preserve the gist of the
> >>>>>>>>> "which is fine" (ie. some variation of "this is an optional thing and
> >>>>>>>>> things won't catch fire without it" ;-))
> >>>>>>>>>
> >>>>>>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> >>>>>>>>> we should have a harder dependency on CONFIG_NVMEM..)
> >>>>>>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
> >>>>>>>> property,
> >>>>>>>> we will see some error during boot up if we don't call
> >>>>>>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
> >>>>>>>> "speed_bin")"
> >>>>>>>> is a way to test this.
> >>>>>>>>
> >>>>>>>> If there is no other harm, we can put a hard dependency on
> >>>>>>>> CONFIG_NVMEM.
> >>>>>>>
> >>>>>>> I'm not sure if we want to go this far given the squishiness about
> >>>>>>> module
> >>>>>>> dependencies. As far as I know we are the only driver that uses this
> >>>>>>> seriously
> >>>>>>> on QCOM SoCs and this is only needed for certain targets. I don't
> >>>>>>> know if we
> >>>>>>> want to force every target to build NVMEM and QFPROM on our behalf.
> >>>>>>> But maybe
> >>>>>>> I'm just saying that because Kconfig dependencies tend to break my
> >>>>>>> brain (and
> >>>>>>> then Arnd has to send a patch to fix it).
> >>>>>>>
> >>>>>>
> >>>>>> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> >>>>>> other dependencies, so I suppose it wouldn't be the end of the world
> >>>>>> to select that.. but I guess we don't want to require QFPROM
> >>>>>>
> >>>>>> I guess at the end of the day, what is the failure mode if you have a
> >>>>>> speed-bin device, but your kernel config misses QFPROM (and possibly
> >>>>>> NVMEM)?  If the result is just not having the highest clk rate(s)
> >>>>
> >>>> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
> >>>> be very obvious what went wrong when this happens!
> >>>
> >>> Ugg, ok..
> >>>
> >>> I suppose we could select NVMEM, but not QFPROM, and then the case
> >>> where QFPROM is not enabled on platforms that have the speed-bin field
> >>> in DT will fail gracefully and all other platforms would continue on
> >>> happily?
> >>>
> >>> BR,
> >>> -R
> >>
> >> Sounds good to me.
> >>
> >
> > You probably should do a quick test with NVMEM enabled but QFPROM
> > disabled to confirm my theory, but I *think* that should work
> >
> > BR,
> > -R
> >
>
> I tried it on an sc7180 device. The suggested combo (CONFIG_NVMEM + no
> CONFIG_QCOM_QFPROM) makes the gpu probe fail with error "failed to read
> speed-bin. Some OPPs may not be supported by hardware". This is good
> enough clue for the developer that he should fix the broken speedbin
> detection.
>

Ok, great.. then sounds like selecting NVMEM is a good approach

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
