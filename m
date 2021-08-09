Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552373E4977
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF2B89A4B;
	Mon,  9 Aug 2021 16:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B68B893DB;
 Mon,  9 Aug 2021 16:08:42 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i4so4695793wru.0;
 Mon, 09 Aug 2021 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q53d8G5kWOf4SS+fjXRtH8Ez6cE2HYq6UNctarCj+nM=;
 b=ZqpTtesNoIb8JAsIbc4kwfEwn9QcduU1DyNy35SXxRaBkKvTpb/MD9CAq7zt/N8uTX
 SfsNB8K94EDzZqYgWiqM8YexfGvbBG+K+3bVNyKtYZ6Bvw6vFOLzKVhy2YjOt1Z2i2ke
 9dyOxB0DTRZ2y1U8BDUKZ3KpM5cM+NOOXS/ooepVZU2uvGnssYDNU4wCoEd7tcp/7LS+
 ZEo9BSJySV41eRoGkLhhD9bBsiZQR6J+oO5qBn+MY02vEaHoAnDI10lmXoN85ZBDE4KG
 xmCvggeKy1oQHLOnpTO7zNj4LFcu7WHkTNeiq0PsABTl32Ffq0pFtUmdq9Sp98TLGcPU
 SpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q53d8G5kWOf4SS+fjXRtH8Ez6cE2HYq6UNctarCj+nM=;
 b=hBmjQW9zEj0E+xtUIntmnjzWjwI2ybX2J2v118u1jlWbTBovH+hFLKGd5r+RUpUpk0
 Hyn7hE8tj9fKu5KPQ/aQggHb6nK/sbUFZ52yGLY+CN+uWtokb2+4YacE/65zfpB0mlZ0
 ZZwH262wFX4eoAnpmSUum6xg5Lpjdf66evDdGDtYw8vZfW1a2XGfBIzVeUBdLTZQG0Uq
 wU2hWM/dWNTUFxB+AuT8K6Oc7uMPXmDdHP80BtHgG9Wy1YHbjTiamWmPqTGeMogBOZ5Y
 wv06PCH1eualoFYS9Kgho3hhrziIYPGBi+h5H+9Uj3Vu7cFzvLvu5nYobRlDfRUPsgaG
 rmGQ==
X-Gm-Message-State: AOAM53194vUP1abUhNvEEXDqJq5MEgQKd/V/H4xrXbBCZ63LhwT84epj
 EqC903R9gaDaaINSQ87qelK6vyAUGwxyjpDbir8=
X-Google-Smtp-Source: ABdhPJy3pG/6+VfjOqn3jkwRT0PbqDMKObWHzi8f2K7QQhuOcwS7fFkPd65O49HnnBXkF3VTjk+lLukWJ0voi6+LWyg=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr25039733wrm.327.1628525321161; 
 Mon, 09 Aug 2021 09:08:41 -0700 (PDT)
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
In-Reply-To: <6eefedb2-9e59-56d2-7703-2faf6cb0ca3a@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Aug 2021 09:12:56 -0700
Message-ID: <CAF6AEGvhqPHWNK=6GYz+Mu5aKe8+iE4_Teem6o=X6eiANhWsPg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Mon, Aug 9, 2021 at 7:52 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 8/8/2021 10:22 PM, Rob Clark wrote:
> > On Sun, Aug 8, 2021 at 7:33 AM Caleb Connolly <caleb.connolly@linaro.org> wrote:
> >>
> >>
> >>
> >> On 07/08/2021 21:04, Rob Clark wrote:
> >>> On Sat, Aug 7, 2021 at 12:21 PM Caleb Connolly
> >>> <caleb.connolly@linaro.org> wrote:
> >>>>
> >>>> Hi Rob, Akhil,
> >>>>
> >>>> On 29/07/2021 21:53, Rob Clark wrote:
> >>>>> On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> >>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 29/07/2021 21:24, Rob Clark wrote:
> >>>>>>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> >>>>>>> <caleb.connolly@linaro.org> wrote:
> >>>>>>>>
> >>>>>>>> Hi Rob,
> >>>>>>>>
> >>>>>>>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> >>>>>>>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> >>>>>>>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> >>>>>>>
> >>>>>>> *ohh*, yeah, ok, that would explain it
> >>>>>>>
> >>>>>>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> >>>>>>>> at the higher frequencies.
> >>>>>>>>
> >>>>>>>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> >>>>>>>> glxgear.
> >>>>>>>>
> >>>>>>>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> >>>>>>>> at the voltage the hardware needs to be stable.
> >>>>>>>>
> >>>>>>>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> >>>>>>>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> >>>>>>>>
> >>>>>>>
> >>>>>>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> >>>>>>> on CC and I added sboyd, maybe one of them knows better.
> >>>>>>>
> >>>>>>> In the short term, removing the higher problematic OPPs from dts might
> >>>>>>> be a better option than this patch (which I'm dropping), since there
> >>>>>>> is nothing stopping other workloads from hitting higher OPPs.
> >>>>>> Oh yeah that sounds like a more sensible workaround than mine .
> >>>>>>>
> >>>>>>> I'm slightly curious why I didn't have problems at higher OPPs on my
> >>>>>>> c630 laptop (sdm850)
> >>>>>> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
> >>>>>>
> >>>>>> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> >>>>>> crash where yours doesn't?
> >>>>>
> >>>>> I've not heard any reports of similar issues from the handful of other
> >>>>> folks with c630's on #aarch64-laptops.. but I can't really say if that
> >>>>> is luck or not.
> >>>> It looks like this affects at least the OnePlus 6 and PocoPhone F1, I've done some more poking and the following diff
> >>>> seems to fix the stability issues completely, it seems the delay is required to let the update propagate.
> >>>>
> >>>> This doesn't feel like the right fix, but hopefully it's enough to come up with a better solution than disabling the new
> >>>> devfreq behaviour on a630.
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> index d7cec7f0dde0..69e2a5e84dae 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >>>> @@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>>>                    return;
> >>>>            }
> >>>>
> >>>> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>>> +
> >>>> +       usleep_range(300, 500);
> >>>> +
> >>>
>
> I am a bit confused. We don't define a power domain for gpu in dt,
> correct? Then what exactly set_opp do here? Do you think this usleep is
> what is helping here somehow to mask the issue?

Hmm, I thought "opp-level = RPMH_REGULATOR_LEVEL_*" did *something*,
but tbh I'm not sure exactly what..

> I feel we should just leave the new dcvs feature (shall we call it NAP?)
> disabled for a630 (and 10ms devfreq interval), until this is root caused.

I suppose "NAP" is a reasonable name.

But I think that reverting to previous behavior would not be enough,
there is nothing stopping devfreq from jumping from min to max freq,
which AFAIU should be enough to trigger this.  I guess that there just
hasn't been enough testing with different game workloads on those
phones to trigger this.

That said, I haven't seen similar issues on my sdm850 laptop, where I
defn have triggered mix->max freq transitions.. I guess it would be
interesting to know if this issue could be reproduced on db845c, or if
it really is board specific?

To workaround, I think we'd need to implement some way to limit that
maximum frequency jump (and then use delayed work to continue ramping
up the freq over time until we hit the target).. which seems like a
lot of work if this is just a board(s) specific workaround and isn't
needed once CPR is supported

BR,
-R

> >>> Hmm, this is going to be in the critical path on idle -> active
> >>> transition (ie. think response time to user-input).. so we defn don't
> >>> want to do this unconditionally..
> >>>
> >>> If I understand the problem, we just want to limit how far we jump the
> >>> gpu freq in one go.. maybe deleting the lowest (and perhaps highest)
> >>> OPP would accomplish that?  Could that be done in the board(s)'s
> >>> toplevel dts files?
> >> That would be a workaround, however I'd really like to avoid limiting performance as a solution if I can help it,
> >> especially as the fix might just be "set the opp first, wait for it to apply, then set the core clock".
> >>
> >> Is there a sensible way to get a callback from the opp notify chain? Or from rpmh directly? Or is this solution really
> >> not the right way to go?
> >
> > It does seem a bit strange to me that we are telling GMU to change
> > freq before calling dev_pm_opp_set_opp()..  if dev_pm_opp_set_opp() is
> > increasing voltage, it seems like you'd want to do that *before*
> > increasing freq (but reverse the order when decreasing freq).. But I'm
> > not an expert on the ways of the GMU..  maybe Akhil or Jordan knows
> > better how this is supposed to work.
>
> For legacy gmu, we trigger DCVS using DCVS OOB which comes later in this
> function. But the order between regulator and clock which you mentioned
> is correct.
>
> >
> > But the delay seems like papering something over, and I'm trying to go
> > in the other direction and reduce latency between user input and
> > pageflip..
> >
> > BR,
> > -R
> >
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>>            gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
> >>>>
> >>>>            gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> >>>> @@ -158,7 +162,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>>>            if (ret)
> >>>>                    dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
> >>>>
> >>>> -       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >>>>            pm_runtime_put(gmu->dev);
> >>>>     }
> >>>>>
> >>>>> Maybe just remove it for affected devices?  But I'll defer to Bjorn.
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>
> >>>> --
> >>>> Kind Regards,
> >>>> Caleb (they/them)
> >>
> >> --
> >> Kind Regards,
> >> Caleb (they/them)
>
