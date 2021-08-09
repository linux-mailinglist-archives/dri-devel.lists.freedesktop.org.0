Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 510D23E4E3B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 23:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19589D9A;
	Mon,  9 Aug 2021 21:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75689D9A;
 Mon,  9 Aug 2021 21:04:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m36-20020a05600c3b24b02902e67543e17aso605518wms.0; 
 Mon, 09 Aug 2021 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMxT0uvgD2aUIEwbe5mo6YkR7gd5DznbXHMmSr6Ytlg=;
 b=oD8EdJzLnZTvXNBs8WpuddvcWy4/QKVi/nIuDv4QH2tHogldFOXfRW2qVMztrtZ29t
 ZEbV8BKzIYAf/W7tt9BUJTHhBlfFlnLlq9jnDUZ2Boi5lp5h5dnf7h15pc+Eyo7IjTjm
 6KgjwI6Rk/2EBUdiQQ6H0d+wD56fD24ZZGSdsRQgDH2FR7lHdvGGVVF4F+C8ju95YULZ
 2kv9Iwplstx4C6vupUALnU2EW0M/1WU6IXKMDqiJcb+JzcR8c+aFh6I3xRXa1ioiO8wF
 9wzrQ7WTMGweV6aW8noe9cK6Pfr1ig3wyzzIVp1eljNXJ0G46BdD+J3re7+zMl6xNCdu
 vFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMxT0uvgD2aUIEwbe5mo6YkR7gd5DznbXHMmSr6Ytlg=;
 b=O+OdOtIciOcHVmYDk0LX6PJbkwDy0w3pgWH0SckSpFFENzpDvbxOXSzgustef7MDGu
 hbVmd/gnOO2Y6E5Agaljq7ugNSDNBI5A2jsnEf2V7YG3J3SDVlvXXfrC9jJw6P4fZYSe
 kADGGe0u/4JrfOzVICh4j2Rrjm5WP/vntbbq41VWbf1edXR6kYybF0inpyZTwsjGThbw
 0DZRi45DSLRXV8ruBK5FNmekgMkpcDDOZlpX4/uQr48oC1/XGBFppmmE2HWSRC9yH7KT
 v9pFdoGmVkhTj5DW2C51rRMoogc8EKoxBdaYxA5iSS3RwmyOYc1IiVLDObmyykboqn4G
 +Jow==
X-Gm-Message-State: AOAM532jdhE6COBxPO1T5vIlpo9eoe//D13GrJH/cnw9CllneLJj+1RT
 b/yNk95TPOWhErGO7U5GrE8mzp8pZF6OaoZ0O5g=
X-Google-Smtp-Source: ABdhPJxomHOLhjLpwAzPb8XcjVxOfTAiGypEEBhpChhtyEOpB1znTPfyWmTWbgY6N/fTzNyvwB+Uq1ggHqVUHIysgzw=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr1026100wma.49.1628543066439; 
 Mon, 09 Aug 2021 14:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
 <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
 <8aa590be-6a9f-9343-e897-18e86ea48202@linaro.org>
 <CAF6AEGtd_5jKhixp6h+NnN8-aqjBHTLopRozASE73oT3rfnFHA@mail.gmail.com>
 <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org>
 <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
 <83ecbe74-caf0-6c42-e6f5-4887b3b534c6@linaro.org>
 <53d3e5b7-9dc0-a806-70e9-b9b5ff877462@codeaurora.org>
 <CAJs_Fx4brw8j8Wk5ethSrhTHC+Kj0=cWga4q69Cv6JA6L8cDxA@mail.gmail.com>
 <7c354c1a-d528-ed77-586b-881cc3df4563@linaro.org>
In-Reply-To: <7c354c1a-d528-ed77-586b-881cc3df4563@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Aug 2021 14:08:41 -0700
Message-ID: <CAF6AEGtRHa4udfZMmdozTcXU-SkF8Cr_ASbgWbVDESKQVr=spQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek <jonathan@marek.ca>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>, 
 open list <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Aug 9, 2021 at 1:35 PM Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
>
>
> On 09/08/2021 18:58, Rob Clark wrote:
> > On Mon, Aug 9, 2021 at 10:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>
> >> On 8/9/2021 9:48 PM, Caleb Connolly wrote:
> >>>
> >>>
> >>> On 09/08/2021 17:12, Rob Clark wrote:
> >>>> On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen <akhilpo@codeaurora.org>
> >>>> wrote:
> >>>>>
> >>>>> On 8/8/2021 10:22 PM, Rob Clark wrote:
> >>>>>> On Sun, Aug 8, 2021 at 7:33 AM Caleb Connolly
> >>>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 07/08/2021 21:04, Rob Clark wrote:
> >>>>>>>> On Sat, Aug 7, 2021 at 12:21 PM Caleb Connolly
> >>>>>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Rob, Akhil,
> >>>>>>>>>
> >>>>>>>>> On 29/07/2021 21:53, Rob Clark wrote:
> >>>>>>>>>> On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> >>>>>>>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>>>> On 29/07/2021 21:24, Rob Clark wrote:
> >>>>>>>>>>>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> >>>>>>>>>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hi Rob,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I've done some more testing! It looks like before that patch
> >>>>>>>>>>>>> ("drm/msm: Devfreq tuning") the GPU would never get above
> >>>>>>>>>>>>> the second frequency in the OPP table (342MHz) (at least, not
> >>>>>>>>>>>>> in glxgears). With the patch applied it would more
> >>>>>>>>>>>>> aggressively jump up to the max frequency which seems to be
> >>>>>>>>>>>>> unstable at the default regulator voltages.
> >>>>>>>>>>>>
> >>>>>>>>>>>> *ohh*, yeah, ok, that would explain it
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up
> >>>>>>>>>>>>> to 0.988v (instead of the stock 0.516v) makes the GPU stable
> >>>>>>>>>>>>> at the higher frequencies.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Applying this patch reverts the behaviour, and the GPU never
> >>>>>>>>>>>>> goes above 342MHz in glxgears, losing ~30% performance in
> >>>>>>>>>>>>> glxgear.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I think (?) that enabling CPR support would be the proper
> >>>>>>>>>>>>> solution to this - that would ensure that the regulators run
> >>>>>>>>>>>>> at the voltage the hardware needs to be stable.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Is hacking the voltage higher (although ideally not quite
> >>>>>>>>>>>>> that high) an acceptable short term solution until we have
> >>>>>>>>>>>>> CPR? Or would it be safer to just not make use of the higher
> >>>>>>>>>>>>> frequencies on a630 for now?
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is
> >>>>>>>>>>>> already
> >>>>>>>>>>>> on CC and I added sboyd, maybe one of them knows better.
> >>>>>>>>>>>>
> >>>>>>>>>>>> In the short term, removing the higher problematic OPPs from
> >>>>>>>>>>>> dts might
> >>>>>>>>>>>> be a better option than this patch (which I'm dropping), since
> >>>>>>>>>>>> there
> >>>>>>>>>>>> is nothing stopping other workloads from hitting higher OPPs.
> >>>>>>>>>>> Oh yeah that sounds like a more sensible workaround than mine .
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm slightly curious why I didn't have problems at higher OPPs
> >>>>>>>>>>>> on my
> >>>>>>>>>>>> c630 laptop (sdm850)
> >>>>>>>>>>> Perhaps you won the sillicon lottery - iirc sdm850 is binned
> >>>>>>>>>>> for higher clocks as is out of the factory.
> >>>>>>>>>>>
> >>>>>>>>>>> Would it be best to drop the OPPs for all devices? Or just
> >>>>>>>>>>> those affected? I guess it's possible another c630 might
> >>>>>>>>>>> crash where yours doesn't?
> >>>>>>>>>>
> >>>>>>>>>> I've not heard any reports of similar issues from the handful of
> >>>>>>>>>> other
> >>>>>>>>>> folks with c630's on #aarch64-laptops.. but I can't really say
> >>>>>>>>>> if that
> >>>>>>>>>> is luck or not.
> >>>>>>>>> It looks like this affects at least the OnePlus 6 and PocoPhone
> >>>>>>>>> F1, I've done some more poking and the following diff
> >>>>>>>>> seems to fix the stability issues completely, it seems the delay
> >>>>>>>>> is required to let the update propagate.
> >>>>>>>>>
> >>>>>>>>> This doesn't feel like the right fix, but hopefully it's enough
> >>>>>>>>> to come up with a better solution than disabling the new
> >>>>>>>>> devfreq behaviour on a630.
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>>>>>>> index d7cec7f0dde0..69e2a5e84dae 100644
> >>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>>>>>>> @@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
> >>>>>>>>> struct dev_pm_opp *opp)
> >>>>>>>>>                      return;
> >>>>>>>>>              }
> >>>>>>>>>
> >>>>>>>>> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>>>>>>>> +
> >>>>>>>>> +       usleep_range(300, 500);
> >>>>>>>>> +
> >>>>>>>>
> >>>>>
> >>>>> I am a bit confused. We don't define a power domain for gpu in dt,
> >>>>> correct? Then what exactly set_opp do here? Do you think this usleep is
> >>>>> what is helping here somehow to mask the issue?
> >>> The power domains (for cx and gx) are defined in the GMU DT, the OPPs in
> >>> the GPU DT. For the sake of simplicity I'll refer to the lowest
> >>> frequency (257000000) and OPP level (RPMH_REGULATOR_LEVEL_LOW_SVS) as
> >>> the "min" state, and the highest frequency (710000000) and OPP level
> >>> (RPMH_REGULATOR_LEVEL_TURBO_L1) as the "max" state. These are defined in
> >>> sdm845.dtsi under the gpu node.
> >>>
> >>> The new devfreq behaviour unmasks what I think is a driver bug, it
> >>> inadvertently puts much more strain on the GPU regulators than they
> >>> usually get. With the new behaviour the GPU jumps from it's min state to
> >>> the max state and back again extremely rapidly under workloads as small
> >>> as refreshing UI. Where previously the GPU would rarely if ever go above
> >>> 342MHz when interacting with the device, it now jumps between min and
> >>> max many times per second.
> >>>
> >>> If my understanding is correct, the current implementation of the GMU
> >>> set freq is the following:
> >>>    - Get OPP for frequency to set
> >>>    - Push the frequency to the GMU - immediately updating the core clock
> >>>    - Call dev_pm_opp_set_opp() which triggers a notify chain, this winds
> >>> up somewhere in power management code and causes the gx regulator level
> >>> to be updated
> >>
> >> Nope. dev_pm_opp_set_opp() sets the bandwidth for gpu and nothing else.
> >> We were using a different api earlier which got deprecated -
> >> dev_pm_opp_set_bw().
> Huh ok, thanks for the correction. So it's the GMU writes in this function which cause the regulator to be adjusted?
> >
> > Hmm, ok, if this is just setting icc vote, the order shouldn't be too important.
> >
> > I guess GMU then is the one that is controlling the regulator(s) to
> > ensure adequate voltage for the requested freq?
> >
> > But the GMU fw should be the same for a618 and a630, md5sum of what
> > I'm using (from linux-firmware):
> >
> >    ab20135f7adf48e0f344282a37da80e4  a630_gmu.bin
> Same here.
> >
> >>>
> >>> The regulator will then take some time to reach it's new voltage level
> >>> and stabilise. I believe that rapid transitions between min and max
> >>> state - in combination with the increased current load from the GPU core
> >>> - lead to the regulator becoming unstable (e.g. when it's requested to
> >>> transition from it's lowest to highest levels immediately after
> >>> transitioning down), the unstable voltage causes the GPU to crash.
> >>>
> >>> Sillicon lottery will of course play a role here - this is very much an
> >>> edge case and would definitely be different on a per-device and even
> >>> per-unit basis.
> >>>>
> >>>> Hmm, I thought "opp-level = RPMH_REGULATOR_LEVEL_*" did *something*,
> >>>> but tbh I'm not sure exactly what..
> >>>>
> >>>>> I feel we should just leave the new dcvs feature (shall we call it NAP?)
> >>>>> disabled for a630 (and 10ms devfreq interval), until this is root
> >>>>> caused.
> >>> I believe this hacky workaround expresses the root cause of the issue
> >>> quite clearly, by setting the OPP first and allowing the gx regulator to
> >>> become stable before telling the GPU to change clock speeds, we avoid
> >>> the edge case and prevent the crashes.
> >>>
> >>> I took some rough measurements by adding logging to msm_devfreq_idle and
> >>> causing UI updates for ~20 seconds and that function is being called
> >>> about 30 times per second, this means the GPU is transitioning between
> >>> min (idle) state and max (active / boost) state at that frequency and
> >>> causing the issue I described above. It's likely that the usleep is
> >>> helping to mask this behaviour.
> >>>
> >>> I hope this serves as a slightly better explanation of what I perceive
> >>> to be the issue, I realise my previous explanations were not very
> >>> adequate, I apologise for all the noise.
> >>>>
> >>>> I suppose "NAP" is a reasonable name.
> >>>>
> >>>> But I think that reverting to previous behavior would not be enough,
> >>>> there is nothing stopping devfreq from jumping from min to max freq,
> >>>> which AFAIU should be enough to trigger this.  I guess that there just
> >>>> hasn't been enough testing with different game workloads on those
> >>>> phones to trigger this.
> >>> Ack
> >>>>
> >>>> That said, I haven't seen similar issues on my sdm850 laptop, where I
> >>>> defn have triggered mix->max freq transitions.. I guess it would be
> >>>> interesting to know if this issue could be reproduced on db845c, or if
> >>>> it really is board specific?
> >>> My db845c arrives this week, I'll definitely try and reproduce this.
> >>>>
> >>>> To workaround, I think we'd need to implement some way to limit that
> >>>> maximum frequency jump (and then use delayed work to continue ramping
> >>>> up the freq over time until we hit the target).. which seems like a
> >>>> lot of work if this is just a board(s) specific workaround and isn't
> >>>> needed once CPR is supported
> >>> Based on my reasoning above, I came up with the following: reducing
> >>> thrashing by preventing rapid idle/active transitions. The minimum
> >>> active time of 30ms was just used for testing, I think some number
> >>> between 2 and 4 frames would be a sensible choice - the higher the safer.
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> index d7cec7f0dde0..87f2d1085c3e 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>> @@ -139,6 +139,8 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct
> >>> dev_pm_opp *opp)
> >>>                   return;
> >>>           }
> >>>
> >>> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>> +
> >>>           gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
> >>>
> >>>           gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> >>> @@ -158,7 +160,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct
> >>> dev_pm_opp *opp)
> >>>           if (ret)
> >>>                   dev_err(gmu->dev, "GMU set GPU frequency error: %d\n",
> >>> ret);
> >>>
> >>> -       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>>           pm_runtime_put(gmu->dev);
> >>>    }
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> >>> index 0e4b45bff2e6..0e2293bcb46d 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>> @@ -99,8 +99,8 @@ struct msm_gpu_devfreq {
> >>>           /** time: Time of last sampling period. */
> >>>           ktime_t time;
> >>>
> >>> -       /** idle_time: Time of last transition to idle: */
> >>> -       ktime_t idle_time;
> >>> +       /** transition_time: Time of last transition between
> >>> idle/active: */
> >>> +       ktime_t transition_time;
> >>>
> >>>           /**
> >>>            * idle_freq:
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> index 0a1ee20296a2..774a7be33e7a 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>> @@ -157,7 +157,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >>>            */
> >>>           mutex_lock(&df->devfreq->lock);
> >>>
> >>> -       idle_time = ktime_to_ms(ktime_sub(ktime_get(), df->idle_time));
> >>> +       idle_time = ktime_to_ms(ktime_sub(ktime_get(),
> >>> df->transition_time));
> >>>
> >>>           /*
> >>>            * If we've been idle for a significant fraction of a polling
> >>> @@ -168,7 +168,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >>>                   target_freq *= 2;
> >>>           }
> >>>
> >>> -       df->idle_freq = 0;
> >>> +       df->transition_time = ktime_get();;
> >>>
> >>>           msm_devfreq_target(&gpu->pdev->dev, &target_freq, 0);
> >>>
> >>> @@ -185,6 +185,16 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >>>    {
> >>>           struct msm_gpu_devfreq *df = &gpu->devfreq;
> >>>           unsigned long idle_freq, target_freq = 0;
> >>> +       unsigned int active_time;
> >>> +
> >>> +       active_time = ktime_to_ms(ktime_sub(ktime_get(),
> >>> df->transition_time));
> >>> +       /*
> >>> +        * Don't go back to idle unless we've been active for at least 30ms
> >>> +        * to avoid thrashing.
> >>
> >> This basically defeats the purpose of this feature! At least, we should
> >> keep this '30' gpu specific. Does a Kconfig makes sense here?? BTW, if
> >> 300us was helping you earlier why do you want it to be 30ms now?
> Previously I thought that the issue was related to specifically the transition from idle/active, hence sleeping to let
> the regulator catch up, whilst that masked the issue it didn't *fix* it, I now think it's actually due to the repeated
> transition between idle and active states.
>
> Enforcing that the GPU stay active for at least two frames should still give the intended goal of reducing latency and
> more reliably fixes the issue.
>
> AFAIU from reading the commit description, the goal of the devfreq tuning is to reduce latency by quickly bursting up
> when there's user activity, by telling the GPU to stay active for longer we shouldn't impede this behaviour at all.

Well, there are a couple parts to it.. one thing it was intended to
fix was a bad devfreq behavior I was seeing with, for example, games
that throttle themselves to 30fps, so rendering one 16ms frame every
other vblank cycle.. previously devfreq would ramp up to max just as
it was at the end of rendering a frame, and then sit there at fmax
while GPU was doing nothing for the next 16ms, and then ramp back down
to fmin just as the GPU got some more work to do.  So it was nearly
180deg out of phase with where you'd want it to be
increasing/decreasing GPU freq.

The longer polling interval is meant to smooth that out, with clamping
to fmin while GPU is idle to offset the fact that it would take the
GPU longer to ramp down (and it otherwise being pointless to keep the
GPU at a high freq when it isn't doing anything), and boosting above
what freq devfreq would have picked if the gpu had been idle for a
while (to offset the longer ramp up on user input).

So the 30ms delay for clamping to fmin would defeat one part of that.

We could perhaps somehow disable the clamping to fmin for certain
boards and/or gpus, which would possibly lose a bit of power savings
but otherwise be ok.  But I'm not clear whether this is a board
specific issue (ie. are these phones using different PMICs compared to
sdm850 laptops and db845c?  Or is there some difference in what power
rail is powering the GPU?)

I think it was mentioned earlier that CPR should help (AFAIU that is
some sort of hw closed loop voltage regulation?) so maybe this is just
a short term workaround?

BR,
-R
