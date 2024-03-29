Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5108911F3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 04:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AEF10EF5C;
	Fri, 29 Mar 2024 03:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rUqdYLC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680D210EF5C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 03:24:54 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcbcea9c261so1676769276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 20:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711682633; x=1712287433; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2cGkeY7zQxQRxLqhm5ORukRN8aDetleyVVG2pLEXZBE=;
 b=rUqdYLC5AgIdi1pEZqjHyygTMNADtix3EGsUSGDvy44S8r8i1RS2Tc9MZ20bz+mXxr
 421m8ilMtgXuWFMlwafh5qiw7EoJVsij2hr80OA7LvBu3MghMMGjecvzceZDXHVppdd4
 BsXgFLiCUTRfizox1ElsonfUVuBD74NNqNHRqaQSWSyvgFs78o+kQTc+5uWlVEFISIQ2
 VZ6PkKQoF4La/9X0KI6OlmVsdBOSQtzBOVV/IjmjCEUBq1PtlqPHqdEl+s2LaS1vY4oM
 SneCRAKhJL++4mpquyRg+duD0umsux8rxpj9VhchbdB/d4vwv2sSjgUcdiBGxVGo3+bf
 vFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711682633; x=1712287433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2cGkeY7zQxQRxLqhm5ORukRN8aDetleyVVG2pLEXZBE=;
 b=DxhA+9qKYG6/H/TpEx8/xuiKrMMDD8DLR3NV/6v+u/FmO3vxysvTqP42RsursgDCni
 TjeT7Vu3y/bAxrlBuPuO4e0A9KMksUeuYoWhGd9/GH81+txXjSBMCSd6LmDeRBWuGvjA
 bnbeCdRP79nn8rp7XG+Ce4pSe4Qll5N61BtUHRIrDgV07wibIE/ny8FxTScC6T3eGGH9
 LnGMuCLe8Zutwg04gyZ4m5RsdQJtmucIoZtlJp20WmVtM9uqTGNf5mxNMgu7k96cpunx
 sG1PVm1l9MiS3sq9IpgPZQ5Nb7SivSqSptOruYk9Yinyy8ISMAMavDinfsftmNdeFpBg
 JTZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpMybpp1uBp2ELAfD+J0cyjN48YGeCZxp73Zu+XUsId/y+wwoUBaMapV1/4ch5jS5UaKp+E8WVJF7LT3+mZXCcBvQ+vMtHNc2X+KjlTF7y
X-Gm-Message-State: AOJu0Yy1Uu0M7qHpXrp1d1fjaaJBmClEH3w5nUJhSE/84AGAZSP1eE/z
 +aTSPmbZ5LV+lXMdnfspnHii19+x0+mYXZzNom8WWJJs0eEJvj1Dk40QzfxnmlbBTH9dBgNko8K
 ip7zxUQXeFwqGAsSZSKXEiPnoqXl6PUpck5XV8g==
X-Google-Smtp-Source: AGHT+IE9Q72EecKSUjdkAGdBSxPtFtYMJ5UUWxsvxQNwZ6y2SKoPJRd/NHT8zNBwM36IvFA+QfBgnXwSpg9cS3MuxQc=
X-Received: by 2002:a25:df09:0:b0:dcd:aa73:e349 with SMTP id
 w9-20020a25df09000000b00dcdaa73e349mr1168492ybg.12.1711682632909; Thu, 28 Mar
 2024 20:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
 <CAA8EJppEWXnsQzDD1tdNuMb1ijEVtE7LQct9jt1fwVwMd8ch_Q@mail.gmail.com>
 <27cadd17-10a3-3b8c-2b29-6698ccdce531@quicinc.com>
 <CAA8EJpqYVDG9pBj39m40rPwUNgE7x07HfCt6C3yaMN7eOaWk6Q@mail.gmail.com>
 <efbe5aa8-8bbe-26cd-ca70-1974241a3537@quicinc.com>
In-Reply-To: <efbe5aa8-8bbe-26cd-ca70-1974241a3537@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 05:23:41 +0200
Message-ID: <CAA8EJprES3q3w6GuQ8dW5vicnzbO_eZ6wpNfWe5njTPRDZm5KQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 abel.vesa@linaro.org, 
 agross@kernel.org, airlied@gmail.com, daniel@ffwll.ch, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org, quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 29 Mar 2024 at 04:16, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 5:10 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Mar 2024 at 01:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/28/2024 3:50 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 28 Mar 2024 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> >>>>> Quoting Abhinav Kumar (2024-03-28 13:24:34)
> >>>>>> + Johan and Bjorn for FYI
> >>>>>>
> >>>>>> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> >>>>>>> For internal HPD case, hpd_event_thread is created to handle HPD
> >>>>>>> interrupts generated by HPD block of DP controller. It converts
> >>>>>>> HPD interrupts into events and executed them under hpd_event_thread
> >>>>>>> context. For external HPD case, HPD events is delivered by way of
> >>>>>>> dp_bridge_hpd_notify() under thread context. Since they are executed
> >>>>>>> under thread context already, there is no reason to hand over those
> >>>>>>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> >>>>>>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> >>>>>>>
> >>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> >>>>>>>      1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>
> >>>>>> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> >>>>>
> >>>>> Is this a bug fix or an optimization? The commit text doesn't tell me.
> >>>>>
> >>>>
> >>>> I would say both.
> >>>>
> >>>> optimization as it avoids the need to go through the hpd_event thread
> >>>> processing.
> >>>>
> >>>> bug fix because once you go through the hpd event thread processing it
> >>>> exposes and often breaks the already fragile hpd handling state machine
> >>>> which can be avoided in this case.
> >>>
> >>> Please add a description for the particular issue that was observed
> >>> and how it is fixed by the patch.
> >>>
> >>> Otherwise consider there to be an implicit NAK for all HPD-related
> >>> patches unless it is a series that moves link training to the enable
> >>> path and drops the HPD state machine completely.
> >>>
> >>> I really mean it. We should stop beating a dead horse unless there is
> >>> a grave bug that must be fixed.
> >>>
> >>
> >> I think the commit message is explaining the issue well enough.
> >>
> >> This was not fixing any issue we saw to explain you the exact scenario
> >> of things which happened but this is just from code walkthrough.
> >>
> >> Like kuogee wrote, hpd event thread was there so handle events coming
> >> out of the hpd_isr for internal hpd cases. For the hpd_notify coming
> >> from pmic_glink or any other extnernal hpd cases, there is no need to
> >> put this through the hpd event thread because this will only make things
> >> worse of exposing the race conditions of the state machine.
> >>
> >> Moving link training to enable and removal of hpd event thread will be
> >> worked on but delaying obvious things we can fix does not make sense.
> >
> >  From the commit message this feels like an optimisation rather than a
> > fix. And granted the fragility of the HPD state machine, I'd prefer to
> > stay away from optimisations. As far as I understood from the history
> > of the last revert, we'd better make sure that HPD handling goes only
> > through the HPD event thread.
> >
>
> I think you are mixing the two. We tried to send the events through
> DRM's hpd_notify which ended up in a bad way and btw, thats still not
> resolved even though I have seen reports that things are fine with the
> revert, we are consistently able to see us ending up in a disconnected
> state with all the reverts and fixes in our x1e80100 DP setup.
>
> I plan to investigate that issue properly in the next week and try to
> make some sense of it all.
>
> In fact, this patch is removing one more user of the hpd event thread
> which is the direction in which we all want to head towards.

As I stated earlier, from my point of view it doesn't make sense to
rework the HPD thread in small steps.

> On whether this is an optimization or a bug fix. I think by avoiding hpd
> event thread (which should have never been used for hpd_notify updates,
> hence a bug) we are avoiding the possibility of more race conditions.

I think that the HPD event thread serializes handling of events, so
avoiding it increases the possibility of a race condition.

>
> So, this has my R-b and it holds. Upto you.

I'd wait for a proper description of the issue that was observed and
how it is solved by this patch.

-- 
With best wishes
Dmitry
