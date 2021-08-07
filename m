Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F33E3700
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 22:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F7889D44;
	Sat,  7 Aug 2021 20:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D7089D44;
 Sat,  7 Aug 2021 20:00:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z4so15739780wrv.11;
 Sat, 07 Aug 2021 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RzbhyLykkfoaT/kVYaDJ7ejBhY0DKubqMfb6PVkLHwo=;
 b=dtyMR6K6WMSClGZdiIO+A2bSsCtz41/bZGVsE0fHqJonOZmyOtTqWzakEWc4iTX7Yg
 8Btq/F1D+VibmvuorDpQte1c9HD85wHtQGjHcae/4Vio17uqRW1qGHNeB9iWhCTqu6iS
 vqAsLNP80bKlJZz+pRvg4iwD5EL7KvAyxXTxIfc5EQDGucBEzEPL63IvFlyBgnDNavBB
 MTU4XuooVWbW6xLwVlQegO48FO1EzZWBzDDXbG7gd2qDx9goIhMqXDFZd1DC74VpClfq
 aGUtWe/KMk+30sbQ3AkAbqUrH2G0cluI3fUAEQzKD//pSqR7q9HrA7WX1KWwZHT3yTFN
 YlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RzbhyLykkfoaT/kVYaDJ7ejBhY0DKubqMfb6PVkLHwo=;
 b=dsb9EEwFzaqA9G9ZCgbe/BruCIX0C8/kMnrCmq4luDrWfyUkcLWkfoYZzyZGU6ODLf
 pmqFELn0L7l6O7fKYMTZ75wDgzoGtiioxo8DMkIE0i40IehFZGukDVclqvG1shwKpOON
 pabC5WXN8iQm0G8KARrva35G9gaIWp+QW/KKvc7MsTgiaMgI0SfXc3grx8Y0sKL4P8X7
 c6cQoyUVzbrK6YH5H29a8LnKtoIlxt4GT6/q9lfRekNsqG09TJ1PVkYAhAD8Ez33WeCG
 xH3A/BgtLoGlu3gyZNxJ69m2rxo6zgGWSur1ZWH5eBR2I5OHMV4KPqoFZ4/33SKD8y4Y
 +YzA==
X-Gm-Message-State: AOAM533ZzkQx1FuZgaLBanVdDEbaDo4Zg85EvUmh4y20oL9Pr6pWLiXp
 oU0myqD2x9+uP21G+Me+dNCY285JR5A7HhM99jQ=
X-Google-Smtp-Source: ABdhPJw3itfVhrolUsDScP9mY22q/fczJJfWu0DuI+q8JKjDZ4YAOgv3i6wKnisXGPZV678zcmlYGHsT/2Bs4cXtsNA=
X-Received: by 2002:adf:ea41:: with SMTP id j1mr16929204wrn.147.1628366419990; 
 Sat, 07 Aug 2021 13:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210729183942.2839925-1-robdclark@gmail.com>
 <1a38a590-a64e-58ef-1bbf-0ae49c004d05@linaro.org>
 <CAF6AEGs5dzA7kfO89Uqbh3XmorXoEa=fpW+unk5_oaihHm479Q@mail.gmail.com>
 <e2cebf65-012d-f818-8202-eb511c996e28@linaro.org>
 <CAF6AEGs11aYnkL30kp79pMqLTg3_4otFwG2Oc890Of2ndLbELw@mail.gmail.com>
 <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
In-Reply-To: <b7334a1a-c4ad-da90-03b4-0d19e1811b13@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 7 Aug 2021 13:04:34 -0700
Message-ID: <CAF6AEGv0WWB3Z1hmXf8vxm1_-d7fsNBRcaQF35aE2JXcJn8-cA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Disable frequency clamping on a630
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
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

On Sat, Aug 7, 2021 at 12:21 PM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi Rob, Akhil,
>
> On 29/07/2021 21:53, Rob Clark wrote:
> > On Thu, Jul 29, 2021 at 1:28 PM Caleb Connolly
> > <caleb.connolly@linaro.org> wrote:
> >>
> >>
> >>
> >> On 29/07/2021 21:24, Rob Clark wrote:
> >>> On Thu, Jul 29, 2021 at 1:06 PM Caleb Connolly
> >>> <caleb.connolly@linaro.org> wrote:
> >>>>
> >>>> Hi Rob,
> >>>>
> >>>> I've done some more testing! It looks like before that patch ("drm/msm: Devfreq tuning") the GPU would never get above
> >>>> the second frequency in the OPP table (342MHz) (at least, not in glxgears). With the patch applied it would more
> >>>> aggressively jump up to the max frequency which seems to be unstable at the default regulator voltages.
> >>>
> >>> *ohh*, yeah, ok, that would explain it
> >>>
> >>>> Hacking the pm8005 s1 regulator (which provides VDD_GFX) up to 0.988v (instead of the stock 0.516v) makes the GPU stable
> >>>> at the higher frequencies.
> >>>>
> >>>> Applying this patch reverts the behaviour, and the GPU never goes above 342MHz in glxgears, losing ~30% performance in
> >>>> glxgear.
> >>>>
> >>>> I think (?) that enabling CPR support would be the proper solution to this - that would ensure that the regulators run
> >>>> at the voltage the hardware needs to be stable.
> >>>>
> >>>> Is hacking the voltage higher (although ideally not quite that high) an acceptable short term solution until we have
> >>>> CPR? Or would it be safer to just not make use of the higher frequencies on a630 for now?
> >>>>
> >>>
> >>> tbh, I'm not sure about the regulator stuff and CPR.. Bjorn is already
> >>> on CC and I added sboyd, maybe one of them knows better.
> >>>
> >>> In the short term, removing the higher problematic OPPs from dts might
> >>> be a better option than this patch (which I'm dropping), since there
> >>> is nothing stopping other workloads from hitting higher OPPs.
> >> Oh yeah that sounds like a more sensible workaround than mine .
> >>>
> >>> I'm slightly curious why I didn't have problems at higher OPPs on my
> >>> c630 laptop (sdm850)
> >> Perhaps you won the sillicon lottery - iirc sdm850 is binned for higher clocks as is out of the factory.
> >>
> >> Would it be best to drop the OPPs for all devices? Or just those affected? I guess it's possible another c630 might
> >> crash where yours doesn't?
> >
> > I've not heard any reports of similar issues from the handful of other
> > folks with c630's on #aarch64-laptops.. but I can't really say if that
> > is luck or not.
> It looks like this affects at least the OnePlus 6 and PocoPhone F1, I've done some more poking and the following diff
> seems to fix the stability issues completely, it seems the delay is required to let the update propagate.
>
> This doesn't feel like the right fix, but hopefully it's enough to come up with a better solution than disabling the new
> devfreq behaviour on a630.
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index d7cec7f0dde0..69e2a5e84dae 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -139,6 +139,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>                  return;
>          }
>
> +       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +
> +       usleep_range(300, 500);
> +

Hmm, this is going to be in the critical path on idle -> active
transition (ie. think response time to user-input).. so we defn don't
want to do this unconditionally..

If I understand the problem, we just want to limit how far we jump the
gpu freq in one go.. maybe deleting the lowest (and perhaps highest)
OPP would accomplish that?  Could that be done in the board(s)'s
toplevel dts files?

BR,
-R

>          gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
>
>          gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> @@ -158,7 +162,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>          if (ret)
>                  dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
> -       dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>          pm_runtime_put(gmu->dev);
>   }
> >
> > Maybe just remove it for affected devices?  But I'll defer to Bjorn.
> >
> > BR,
> > -R
> >
>
> --
> Kind Regards,
> Caleb (they/them)
