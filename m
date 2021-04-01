Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F33521DB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188176ECF2;
	Thu,  1 Apr 2021 21:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209086E0F8;
 Thu,  1 Apr 2021 21:45:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e18so3126952wrt.6;
 Thu, 01 Apr 2021 14:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03BQSw1CPJ8M8BexxEezvsYQZb8neb/x+xNYoF5ZH40=;
 b=ZQE9ppnqnPtgf+sAq2hJfhtYScAce9TxQHQKT/zS+ZJEPvti7l/hx+rl3OZ3WasfBK
 6oDLe1zbgki31FRRjcQjewbh9fuIJjhm9vn4+uIFWT2x1Q+/GhsuCGKRDWWilUCkky/w
 S0aWWRw5tcDMCIrbsqUh6KGQyHcnK3UqIC+KtmspbNtvjB8BDXnHP7UlUF1xp/x3Hyei
 YlnDEi7NtkQQLX/seZWGHmxBmAXxIoA0e28iGhqFZ1yaX+4YG9+mQcoXE3IDyv9bXRCf
 QAuYXfNWr3FxictHeiaXuiwRuyGFXgIwPKeGA2+uy+ASLf4mNdkIRNnKvoMRxWGfvOem
 aVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03BQSw1CPJ8M8BexxEezvsYQZb8neb/x+xNYoF5ZH40=;
 b=BcKLza5lZQ2CgE0Rnzhe2Yd5i5+dWfjZrAJtvLeeJspds/gap7UTdCDASDtOjd1TOj
 vg1eus9dqcTqcAC5fEbPq6tqDNUIOYEHV1u7soiG9SuaHXE3v6tdWvvKvq7pcEeePC1/
 Mzy7ZRLYxMRkIpDunmE9UuIddPnVJpVwCMhKCC9omvHaZs1AHSsDPkGC7asanXKYze83
 NCONUtZE/txYPUTr/3+qops4M+yZBFPRkXOSFbO0LIgO1xAIjZFnA8s5BD8z5+ftyhDT
 rW3hzlZf2vkFhIhD464sqt2510XPNgEsBtXR5Y4raJ/WyRzzPa8nqyPEPVhLiYJgq6PY
 yCsQ==
X-Gm-Message-State: AOAM531geMYLvdu4FqeJUHWe5MNxg1F5kf6bcepABsT0daArztIJcGRL
 nD9jvjjX5JA2jv08/JxM4DovDTUOHHHaKA9hD2M=
X-Google-Smtp-Source: ABdhPJzUeWySZlY1WQjmnPeq6ZDBrhIhZnvXb2NMfVpj2NVVCCfJYyU4oNRtui0xCS4hVixSPIhr3umD2Ql1iY7Q0X8=
X-Received: by 2002:adf:b30f:: with SMTP id j15mr12078963wrd.132.1617313549709; 
 Thu, 01 Apr 2021 14:45:49 -0700 (PDT)
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
 <CAF6AEGvXYmcj0YuciZATveALJEP6DdFiwmtnYevrK2SEOJNZGg@mail.gmail.com>
 <CAF6AEGs4sYOMgysg3FraKTDetqKTgMXT6RE700e-8uyE9Gs-9A@mail.gmail.com>
 <CAA8EJpoL7Eox5WqnZQVvGF9M_4itA+2=U6QX=AreTk=AEfqyQg@mail.gmail.com>
In-Reply-To: <CAA8EJpoL7Eox5WqnZQVvGF9M_4itA+2=U6QX=AreTk=AEfqyQg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 1 Apr 2021 14:49:13 -0700
Message-ID: <CAF6AEGu88VxfDYaMt1=FCYG0DVRfRT6=5QD78Qrk=S=M0gO+pw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 1, 2021 at 2:03 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 1 Apr 2021 at 23:09, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Feb 22, 2021 at 8:06 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Feb 22, 2021 at 7:45 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> > > >
> > > > On 2/19/2021 9:30 PM, Rob Clark wrote:
> > > > > On Fri, Feb 19, 2021 at 2:44 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> > > > >>
> > > > >> On 2/18/2021 9:41 PM, Rob Clark wrote:
> > > > >>> On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> > > > >>>>
> > > > >>>> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
> > > > >>>>> On 2/17/21 3:18 PM, Rob Clark wrote:
> > > > >>>>>> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
> > > > >>>>>> <jcrouse@codeaurora.org> wrote:
> > > > >>>>>>>
> > > > >>>>>>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> > > > >>>>>>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
> > > > >>>>>>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
> > > > >>>>>>>>> wrote:
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
> > > > >>>>>>>>>> ENOENT error,
> > > > >>>>>>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > > > >>>>>>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > > >>>>>>>>>> ---
> > > > >>>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> > > > >>>>>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >>>>>>>>>>
> > > > >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > >>>>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > >>>>>>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
> > > > >>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > >>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > >>>>>>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
> > > > >>>>>>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
> > > > >>>>>>>>>>
> > > > >>>>>>>>>>            cell = nvmem_cell_get(dev, "speed_bin");
> > > > >>>>>>>>>>            /*
> > > > >>>>>>>>>> -        * -ENOENT means that the platform doesn't support
> > > > >>>>>>>>>> speedbin which is
> > > > >>>>>>>>>> -        * fine
> > > > >>>>>>>>>> +        * -ENOENT means no speed bin in device tree,
> > > > >>>>>>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> > > > >>>>>>>>>
> > > > >>>>>>>>> very minor nit, it would be nice to at least preserve the gist of the
> > > > >>>>>>>>> "which is fine" (ie. some variation of "this is an optional thing and
> > > > >>>>>>>>> things won't catch fire without it" ;-))
> > > > >>>>>>>>>
> > > > >>>>>>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> > > > >>>>>>>>> we should have a harder dependency on CONFIG_NVMEM..)
> > > > >>>>>>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
> > > > >>>>>>>> property,
> > > > >>>>>>>> we will see some error during boot up if we don't call
> > > > >>>>>>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
> > > > >>>>>>>> "speed_bin")"
> > > > >>>>>>>> is a way to test this.
> > > > >>>>>>>>
> > > > >>>>>>>> If there is no other harm, we can put a hard dependency on
> > > > >>>>>>>> CONFIG_NVMEM.
> > > > >>>>>>>
> > > > >>>>>>> I'm not sure if we want to go this far given the squishiness about
> > > > >>>>>>> module
> > > > >>>>>>> dependencies. As far as I know we are the only driver that uses this
> > > > >>>>>>> seriously
> > > > >>>>>>> on QCOM SoCs and this is only needed for certain targets. I don't
> > > > >>>>>>> know if we
> > > > >>>>>>> want to force every target to build NVMEM and QFPROM on our behalf.
> > > > >>>>>>> But maybe
> > > > >>>>>>> I'm just saying that because Kconfig dependencies tend to break my
> > > > >>>>>>> brain (and
> > > > >>>>>>> then Arnd has to send a patch to fix it).
> > > > >>>>>>>
> > > > >>>>>>
> > > > >>>>>> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> > > > >>>>>> other dependencies, so I suppose it wouldn't be the end of the world
> > > > >>>>>> to select that.. but I guess we don't want to require QFPROM
> > > > >>>>>>
> > > > >>>>>> I guess at the end of the day, what is the failure mode if you have a
> > > > >>>>>> speed-bin device, but your kernel config misses QFPROM (and possibly
> > > > >>>>>> NVMEM)?  If the result is just not having the highest clk rate(s)
> > > > >>>>
> > > > >>>> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
> > > > >>>> be very obvious what went wrong when this happens!
> > > > >>>
> > > > >>> Ugg, ok..
> > > > >>>
> > > > >>> I suppose we could select NVMEM, but not QFPROM, and then the case
> > > > >>> where QFPROM is not enabled on platforms that have the speed-bin field
> > > > >>> in DT will fail gracefully and all other platforms would continue on
> > > > >>> happily?
> > > > >>>
> > > > >>> BR,
> > > > >>> -R
> > > > >>
> > > > >> Sounds good to me.
> > > > >>
> > > > >
> > > > > You probably should do a quick test with NVMEM enabled but QFPROM
> > > > > disabled to confirm my theory, but I *think* that should work
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > >
> > > > I tried it on an sc7180 device. The suggested combo (CONFIG_NVMEM + no
> > > > CONFIG_QCOM_QFPROM) makes the gpu probe fail with error "failed to read
> > > > speed-bin. Some OPPs may not be supported by hardware". This is good
> > > > enough clue for the developer that he should fix the broken speedbin
> > > > detection.
> > > >
> > >
> > > Ok, great.. then sounds like selecting NVMEM is a good approach
> > >
> >
> > btw, did anyone ever send a patch to select NVMEM?  I'm not seeing one
> > but I could be overlooking something
>
> Judging by the amount of issues surrounding speed-bin, I might have a
> bold suggestion to revert these patches for now and get them once all
> the issues are sorted, so that we'd have a single working commit
> instead of scattered patch series breaking git bisect, having bad
> side-effects on non-sc7180 platforms, etc.
>

We do really need some pre-merge CI like we have on the mesa side of
things (and we at least have 845 devices in our CI farm, but it would
be useful to add more generations)..  but other than the config issue,
I *think* this fixes the last of the speedbin fallout?

https://patchwork.freedesktop.org/patch/426538/?series=88558&rev=1

Planning to include that in a -fixes pull req in the next day or two.
(And please have a look at msm-next-staging and let me know if you see
anything other fixes that would be good to get in, speedbin related or
otherwise.)

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
