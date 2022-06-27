Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 719AD55BC75
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7093E10E43E;
	Mon, 27 Jun 2022 23:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AA310E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:20:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z19so15133685edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Spj1S0nEmr3mdqe+SBysZnlIvOHa+5hXVGG2oJZ/gY4=;
 b=gw3JBCSK7pUmYmcwcMUIWMn5+CWQcbCcDcRx8oxASvz6jD1mczE+qT/ZBB96doH0dX
 qxC84Qwu/KkCO1VhbGAoN9YlrzNXn09yMegVa/n1J8QvW3Q3oJx4knBJfVyM5HtrHzZJ
 Ev5mkfHH/F3gv31lSwwOzmPUd433yiR6r7Vq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Spj1S0nEmr3mdqe+SBysZnlIvOHa+5hXVGG2oJZ/gY4=;
 b=oENzdSj6q/GtamMA3Su4PjUAcwe2hRkl5ZCKfd7fHuq0Wjutetwa/LkR9czxlteNjC
 olknPAxc16aHpRMere1/aZZ/1HHyDmt+8Py7kJksqD2RxH2jIKhN3fMsQ0QFdRWeHpTu
 j8dXkpn5ShNiBEQHrw8wbiWQwx+DE4lXWCnl/sO15bHso17ndg9kBv6iqw75nLvdRsXF
 6uLWc3DrqG6IEtv6nk/saM8kJaPEnZDD0u3qELIamCc4lQUzTRTS00wne+yZEEV+36f5
 pkVyxBcPs6s2gVT4CYyGv8443GqP3LzRuxnk9CA18c4XKXj5XgOCptFAGE+BmGqh+uU8
 lWRg==
X-Gm-Message-State: AJIora8OpYACUtHbYnVA3XKZnU17Ek56CaWLqQuZPtVVWnoSRLH/DP74
 cvhyLH3+fEeG7iRwHSW+py7VScwKQ3CrJjgZ
X-Google-Smtp-Source: AGRyM1spPYSO3joZJnzpBpMb0ZQuUqwSARhnoGyZuiGuvRMeXpMLJWpODk6Z9sUsrt3U20qtN3bbpA==
X-Received: by 2002:a05:6402:51ca:b0:437:79a9:4dd with SMTP id
 r10-20020a05640251ca00b0043779a904ddmr14929354edd.319.1656372023063; 
 Mon, 27 Jun 2022 16:20:23 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b00435d4179bbdsm8512097edv.4.2022.06.27.16.20.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 16:20:21 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so6517775wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:20:21 -0700 (PDT)
X-Received: by 2002:a05:600c:5107:b0:3a0:4342:ed75 with SMTP id
 o7-20020a05600c510700b003a04342ed75mr15187921wms.93.1656372020510; Mon, 27
 Jun 2022 16:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <6523e533-960b-d148-0f87-2ad327a3ac3b@quicinc.com>
 <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
In-Reply-To: <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jun 2022 16:20:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
Message-ID: <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 25, 2022 at 1:48 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 25 Jun 2022 at 04:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > On 6/24/2022 5:11 PM, Dmitry Baryshkov wrote:
> > > On Sat, 25 Jun 2022 at 03:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
> > >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > >> b/drivers/gpu/drm/msm/dp/dp_display.c
> > >> index dcd80c8a794c..7816e82452ca 100644
> > >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > >> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
> > >>
> > >>    static const struct msm_dp_config sc7280_dp_cfg = {
> > >>           .descs = (const struct msm_dp_desc[]) {
> > >> -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > >>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
> > >> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > >> +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > >>           },
> > >>           .num_descs = 2,
> > >>    };
> > >>
> > >>
> > >> The reason order is important is because  in this function below, even
> > >> though it matches the address to find which one to use it loops through
> > >> the array and so the value of *id will change depending on which one is
> > >> located where.
> > >>
> > >> static const struct msm_dp_desc *dp_display_get_desc(struct
> > >> platform_device *pdev,
> > >>                                unsigned int *id)
> > >> {
> > >>       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> > >>       struct resource *res;
> > >>       int i;
> > >>
> > >>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >>       if (!res)
> > >>           return NULL;
> > >>
> > >>       for (i = 0; i < cfg->num_descs; i++) {
> > >>           if (cfg->descs[i].io_start == res->start) {
> > >>               *id = i;
> > >
> > > The id is set to the index of the corresponding DP instance in the
> > > descs array, which is MSM_DP_CONTROLLER_n. Correct up to now.
> >
> > Right, this is where I misunderstood his explanation.
> >
> > Even if we swap the order, but retain the index correctly it will still
> > work today.
> >
> > Hes not sure of the root-cause of why turning on the primary display
> > first fixes the issue.
> >
> > I think till we root-cause that, lets put this on hold.
>
> Agreed. Let's find the root cause.

FWIW, I was poking a little bit about the glitch that Kuogee was
trying to fix here. Through a bunch of hacky heuristics I think the
dpu_hw_ctl_trigger_flush_v1() is the function that "causes" the
corruption. Specifically I managed to do something like:

if (hacky_heuristic)
  pr_info("About to call flush\n);
  mdelay(2000);
}
ctl->ops.trigger_flush(ctl)
if (hacky_heuristic)
  pr_info("Finished calling flush\n);
  mdelay(2000);
  pr_info("Finished calling flush delay done\n);
}

I then watched my display and reproduced the problem. When I saw the
problem I looked over at the console and saw "Finished calling flush"
was the last thing printed.

I don't know if this helps much. Presumably we're flushing a bunch of
previous operations so whatever we had queued up probably matters
more, but maybe it'll give a clue?


Other notes FWIW:

* If you increase the amount of time of the glitching, you can
actually see that we are glitching both the internal and external
displays.

* You can actually make the glitch stay on the screen "permanently" by
unplugging the external display while the internal screen is off. I
don't know why it doesn't always happen, but it seems to happen often
enough. Presumably if someone knew the display controller well they
could try to figure out what state it was in and debug the problem.


-Doug
