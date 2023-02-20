Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71F369C8E0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 11:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEB810E66C;
	Mon, 20 Feb 2023 10:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E85A10E666
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 10:45:30 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id i7so1134470ybu.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qE8ccAc6srj7YW8sxvMR5Nbflx/OrsLT2uTV8qv6wfU=;
 b=M58Qz+57FWujaYoLFnToxqQ6r1Y7ikJmj417NVLZ8nM6Rth1WeAEiwWMN25/2avjdn
 aOjmut9cXVLodctmYaFi5fRqa9Z2+fIvBZ1wNGvbfVU3pppjEyU6upGcoBl9hSCoeS5j
 XsnrYUzsFxfEWB/TbN6LSR9/O491m9y6H0Pb2dMStPnKrfnmtAICdM1+kIXTbMrr0xjG
 +p69g1wBRkXh15ylCrH2dftYJHXWY0iEhuMF5L9Zglwj1sateqQvoquFQ6r8lzo8WBet
 W/JcO/9IwPFjYpZ1c0khArrg0QJGqPhThbfQhKhjfkFwva87pvWuFrK5UlyZsv/GId0f
 qmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qE8ccAc6srj7YW8sxvMR5Nbflx/OrsLT2uTV8qv6wfU=;
 b=oxIGhENnFZMdoLZWkgwfIRjedgBkAxAg+J+uSSfN5kr3syRckS1aPEHauu4AFEIFgH
 UMN2vI8mTjzOazMqtGfRMDwFOzSm6gIF5esloP6XuSWC6hiX94amgJwkbYywAuasP5hm
 68TGhp04sMxA2OlCt/cJJSBQ/li03VOyOd/R0ywrzY52x2hCYmjp3ddKqfVNLySoB+JA
 tTKj88bTZGTJtRLP4rwFVIzcmXIV1BfbJAXiso8vCuUC1DACzottbsLzwt7dH9Zi3P/w
 mRJMhYnPW+pz3aUoKL7zshwXgJRvnESSU1nONZKSjb4xmb1QYBxQ/HfsGcfeM/Vx4byZ
 7N8w==
X-Gm-Message-State: AO0yUKWtStgF7KJK9MEoOhuHOYpZQu8+Feetsfm6oXc6tTFXrAFSjeJ4
 eJKVdrko9UNerSAw0J0APq9VbXCaZUj4HOvXYYA1OA==
X-Google-Smtp-Source: AK7set8tFQGsK7Y+a1NRFzH/5PC8UWM4uO0qzbVBAIkPoK1pgl13TGsFzf2okdk5S2A1yEDnaYLmUm/jwgSUmgEdKZ0=
X-Received: by 2002:a5b:4c8:0:b0:8d5:5d9d:d088 with SMTP id
 u8-20020a5b04c8000000b008d55d9dd088mr1960718ybp.229.1676889929095; Mon, 20
 Feb 2023 02:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-7-konrad.dybcio@linaro.org>
 <2e129fd6-d4e5-a955-5355-3ca71166fb33@linaro.org>
 <82c84ba4-ca33-3ce0-fe86-efedfce04cda@linaro.org>
 <170ee26d-8904-0829-f92e-4ea6678b08eb@linaro.org>
 <cc7a9cce-cd12-0f35-d8f7-933b64bbb34d@linaro.org>
In-Reply-To: <cc7a9cce-cd12-0f35-d8f7-933b64bbb34d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Feb 2023 12:45:18 +0200
Message-ID: <CAA8EJpqcM2jfRsii_efBM8HVPd-26hOkNyeWJ=ocLafEnupJ6w@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU
 GPUs
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Feb 2023 at 11:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> On 18.02.2023 17:47, Dmitry Baryshkov wrote:
> > On 18/02/2023 13:04, Konrad Dybcio wrote:
> >> On 17.02.2023 22:07, Dmitry Baryshkov wrote:
> >>> On 14/02/2023 19:31, Konrad Dybcio wrote:
> >>>> Currently we only utilize the OPP table connected to the GPU for
> >>>> getting (available) frequencies. We do however need to scale the
> >>>> voltage rail(s) accordingly to ensure that we aren't trying to
> >>>> run the GPU at 1GHz with a VDD_LOW vote, as that would result in
> >>>> an otherwise inexplainable hang.
> >>>>
> >>>> Tell the OPP framework that we want to scale the "core" clock
> >>>> and swap out the clk_set_rate to a dev_pm_opp_set_rate in
> >>>> msm_devfreq_target() to enable usage of required-opps and by
> >>>> extension proper voltage level/corner scaling.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
> >>>>    drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
> >>>>    2 files changed, 5 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> index ce6b76c45b6f..15e405e4f977 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>>> @@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>>>        const char *gpu_name;
> >>>>        u32 speedbin;
> >>>>    +    /* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
> >>>> +    if (!IS_ERR(devm_clk_get(dev, "core")))
> >>>> +        devm_pm_opp_set_clkname(dev, "core");
> >>>
> >>> Can we instead move a call to a6xx_set_supported_hw() / check_speed_bin after the adreno_gpu_init() ? It will call msm_gpu_init, which in turn sets gpu->core_clk.
> >>>
> >>> Ideally you can call devm_pm_opp_set_clkname() from that function.
> >>
> >>
> >>> Or maybe completely drop gpu->core_clk and always use devm_pm_opp_set_clk_rate().
> >> That would break non-OPP targets, last of which were probably added N=big years ago..
> >
> > No. In the lack of OPP tables, dev_pm_opp_clk_set_rate() should behave exactly like the clk_set_rate().
> Not sure if that's what you meant, but if a device lacks OPP,
> devm_pm_opp_set_rate will return -ENODEV.
>
> If you meant "if we can't find an opp table, behave as if we
> called clk_set_rate", a discussion on #freedreno with robclark
> indicates he'd accept getting rid of non-opp code, provided we
> construct a table if need be, since we have the data required
> to do so ([FMIN=27MHz, FMAX=fast_rate]).

I was referring to a comment at dev_pm_opp_set_rate():

/*
* For IO devices which require an OPP on some platforms/SoCs
* while just needing to scale the clock on some others
* we look for empty OPP tables with just a clock handle and
* scale only the clk. This makes dev_pm_opp_set_rate()
* equivalent to a clk_set_rate()
*/

Maybe we just need to make sure that the OPP table exists
(devm_pm_opp_of_add_table) to prevent the function from bailing out
early.

>
> >
> >> I'm not sure these would still work, as I think we've got rid of some ugly
> >> clock getters that were looking for both "core" and "core_clk" etc.
> >
> > We still support core vs core_clk, see the get_clocks() at msm_gpu.c and then msm_clk_bulk_get_clock(). However we might mimick this function and call devm_pm_opp_set_clkname() with the proper name ("core" or "core_clk").
> >
> >>
> >> See 8db0b6c7b636376789e356d861c3c6c35dcb6913 for what seems to be the most recent
> >> example of non-OPP.
> >>
> >> IMX51/53 also have no OPP tables and are using the (AFAIK) now-defunct _clk-suffixed
> >> clock-names.
> >
> > It works, I tested it during this cycle.
> Oh okay, I had a feeling like that was dropped at one point..
>
> >
> >>
> >> I'd be more than happy to rip out some of this legacy code and convert it
> >> to something modern like OPP, but I'm not sure you guys would like it considering
> >> the breakage on (arguably ancient and borderline retired) platforms.
> >
> > I think, we should try switching to OPP-for-everybody, granted the promise of dev_pm_opp_set_clk_rate() being backwards compatible with bare clk_set_rate().
> It's not, but as I mentioned, we can easily work around that.
>
> >
> >>
> >> This patch as-is "only" breaks non-OPP a5xx & a6xx (as they have .gpu_busy defined),
> >> of which there are none..
> ...but we want to get devfreq everywhere and it's a few LoC away..
>
> Konrad
> >>
> >>>
> >>>> +
> >>>>        adreno_gpu->funcs = funcs;
> >>>>        adreno_gpu->info = adreno_info(config->rev);
> >>>>        adreno_gpu->gmem = adreno_gpu->info->gmem;
> >>>> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>>> index e27dbf12b5e8..ea70c1c32d94 100644
> >>>> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>>> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> >>>> @@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >>>>            gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
> >>>>            mutex_unlock(&df->lock);
> >>>>        } else {
> >>>> -        clk_set_rate(gpu->core_clk, *freq);
> >>>> +        dev_pm_opp_set_rate(dev, *freq);
> >>>
> >>> This is not enough, there are calls to clk_set_rate(gpu->core_clk) in msm_gpu.c which are called from the suspend/resume path.
> >> Right, good catch.
> >>
> >> Konrad
> >>>
> >>>>        }
> >>>>          dev_pm_opp_put(opp);
> >>>
> >



-- 
With best wishes
Dmitry
