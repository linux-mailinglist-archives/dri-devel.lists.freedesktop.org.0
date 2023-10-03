Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F367B6307
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 10:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F110E17A;
	Tue,  3 Oct 2023 08:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB04110E17A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 08:01:08 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a21ea6baccso7831887b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696320068; x=1696924868; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8UNK8jjHO3j+XhJ8hgifUB4wEZkucPxPTntH8sr6bo=;
 b=DywSti+R69Gva4LuDLFhSdo/Ga+osLT1spo2DUku293/B1I81fvoT8ZHHpl9Vtp8Ms
 WnUW1Li4dXpd8iEtwmXRtpDgSgxVb/GgXpOG4ZX9fqwIkjmvlZGIOtOs+ZXVSOwl/KFd
 wAFhtfA8mN5hRR9Of0Q364F/4EiU69EBqlLJLxibB5NALFO9MQCBf2IKt7/Dm5Yd58SZ
 oa1jx02cyR8ThfAtNeMqPYT953Dt3D7wbqaMYsQwIilUiPYumI9cPnNFEUOXE1Y95/HY
 q+qIEMbKXlPKpy8SCYv1xNGG4HSHb/ixBO2eh6mt2QAGVgux0QOA/KxnLZWGqM4lsvxa
 zidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696320068; x=1696924868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8UNK8jjHO3j+XhJ8hgifUB4wEZkucPxPTntH8sr6bo=;
 b=lOT7LIWirqcSsmY+tCb2iJl819QcfDHcW3PyYwyI3EzF4IOXPODzUAWu8/I8+48xkp
 2zlOzrTh+U104a8+2RzLv80SCDb0u239Hfmf63ITJdCCIg26lfTT/ZNyLzyWDIcB5Vog
 R78VfKBjYExBAODOhlrJLXi4E3xo5fCMgvrUxKv4zpKre97P5QaSYd6SZ5LtyV09dOYQ
 OYfWfVpU77KiK/6UMMnCH0d+cTBwfZ1TiifPbKvxtLfyxfbaG1Rrk/DoaxLqyfSrk9Vh
 C7GPf1jfdTJkgQyJYfJFOy/ey3g/a8y9wqP5f42Ckjm8TrXQnl8eyVpuTX02If9l6ntl
 AdpQ==
X-Gm-Message-State: AOJu0YxCpd24xWdQ4zFoHQOSSNQ9JdbaaYbbPUV+2SgVuUcV6BnxV+6r
 mGZf4CTynPqnaH/qQ7gC7P4+62AuBNmxskkZsIIrMw==
X-Google-Smtp-Source: AGHT+IE+/CazD7WPLFjjvYPVPNhuviavjNh2ISOII73m27jele67HS6ZBQ1QSauV1lTmIrRGFsiwTD4brCHFPK6dMhg=
X-Received: by 2002:a81:72c5:0:b0:59b:2458:f612 with SMTP id
 n188-20020a8172c5000000b0059b2458f612mr13268838ywc.28.1696320067941; Tue, 03
 Oct 2023 01:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
 <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
 <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
 <58701008-bb93-e5c6-9ca0-5bc43f9a46f0@quicinc.com>
 <CAE-0n50N6hXM7qQZzccKy2X-kcru9n7Nvgn_V4tOHTnLn64qjw@mail.gmail.com>
 <b9bd5423-f6e3-e511-613c-b6535c27b205@quicinc.com>
In-Reply-To: <b9bd5423-f6e3-e511-613c-b6535c27b205@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 11:00:56 +0300
Message-ID: <CAA8EJprK8W5qysWGD5pv=6A6mqnEZqPAF0DDpDgF0pa+=do-yg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, linux-kernel@vger.kernel.org,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Oct 2023 at 04:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/2/2023 3:58 PM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2023-09-28 17:46:11)
> >> On 9/27/2023 3:01 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2023-09-25 09:07:18)
> >>>>
> >>>> However for external DP case, link training can not be guarantee always
> >>>> success without link rate or lane being reduced as Abhinav mentioned.
> >>>>
> >>>> In addition,  CTS (compliance test) it required to complete link
> >>>> training within 10ms after hpd asserted.
> >>>
> >>> Is it possible to change that timeout? I have to look around for the CTS
> >>> parameters because I'm pretty confused how it can work. What do we do if
> >>> DP wakes the system from suspend and asserts HPD? We need resume time to
> >>> be < 10ms?  That's not realistic.
> >>>
> >>
> >> No, the CTS doesnt say we need to finish link training within 10ms after
> >> HPD is asserted. It says it must be completed in 10ms after
> >> TRAINING_PATTERN_SET dpcd write.
> >>
> >> "Wait until the Source DUT writes 00h to the TRAINING_PATTERN_SET byte
> >> of Reference Sink DPCD Link Configuration Field to indicate the end of
> >> the link training. Stop the link training timer. Verify that link
> >> training completed in 10ms or less"
> >>
> >> That needs to be done independent of HPD so we can ignore the CTS point.
> >
> > Great!
> >
> >>
> >>>>
> >>>> I am not sure do link training at atomic_enable() can meet this timing
> >>>> requirement.
> >
> > Why? It's putting some time bound on link training in general to only
> > take 10ms, right?
> >
>
> Like I said, CTS is mentioning 10ms to finish link training after the
> DUT writes 00h to the TRAINING_PATTERN_SET byte. So for this discussion
> lets leave out CTS for now.
>
> >>>>
> >>>
> >>> At least in the DP spec itself it doesn't require the link to be trained
> >>> within 10ms of HPD being asserted. Instead it simply recommends that the
> >>> OS start configuring the display promptly after HPD is asserted, e.g.
> >>> within 100ms. There's some strict timing on IRQ_HPD, so the driver must
> >>> read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
> >>> what CTS is checking for?
> >>>
> >>> TL;DR: I don't see why CTS should stop us from link training in
> >>> atomic_enable(). It would be beneficial to do so to make eDP and DP the
> >>> same. It would also help to report a drm connector being connected
> >>> _before_ link training so that userspace knows the link itself is the
> >>> bad part of the equation (and not that the DP connector looks
> >>> disconnected to userspace when in fact it really is connected and the
> >>> monitor is asserting HPD, just the link training failed).
> >>
> >> Its the corrective action of the userspace when it finds link is bad is
> >> the concern as I highlighted in the other response. Just reading and
> >> resetting link_status is not enough to recover.
> >
> > What needs to be done to recover? Userspace will try to set a mode on
> > the connector again if the link status is bad and there were some modes
> > available. If there are zero modes and the link is bad, then it ignores
> > the connector. I'm not sure what else could be done to recover besides
> > try again and stop trying if no modes exist.
> >
>
> Let me re-explain if I didnt make this clear last time.
>
> You are right. Thats all the "userspace" can do which is basically retry
> the mode. And like I said, its again only going to fail. All the
> corrective actions you mentioned below like ignoring the connector
> entirely or consider that the display has link training problems are not
> something we decided to go with on a commercial device where we expect
> things to be more reliable.

I have had link training issues with one of my laptops (x86) and USB-C
dock. Usually switching to lower resolution works in such cases.
Moreover, in some cases after switching to low res, I can successfully
switch to high res.

>
> Let me re-explain what I explained in the prev response.
>
> If driver issues hot-plug after link-training:
>
> It would have implemented all the link training mechanisms such as
> trying lower rates/number of lanes and made sure that when the usermode
> queries the list of modes, only the modes which fit into the link rate
> which was link trained successfully will be exposed and the chances of a
> user ending up with a blank screen on connection are pretty high.
>
> This reduces the dependency on usermodes to be smart enough to implement
> such policies and we would rather not depend on those unless we have
> some reference to a compositor which is more sturdy. I do not think the
> CrOS code you have pointed to is more sturdy than the driver mechanism
> explained above.
>
> As opposed to this, if we just issue hotplug without any of this,
> usermode does not know which mode to retry as we do not remove or edit
> the mode list once link training fails.

I think we are trying to be overprotective here. From my point of
view, there are two kinds of issues:
1) We know that some modes can not be supported (e.g. because of the
amount of lanes available or because of the board link rate
limitations).
Of course the kernel should not present these modes to userspace

2) Modes that pass known limitations, but can not be set e.g. because
of the bad cable or dirty connector.
Neither kernel nor userspace have control here. Judging from my
experience with x86, we should pass all these modes to userspace. Then
the user can select what seems to be working.

>
> > Acting like the connector isn't connected makes the situation worse for
> > ChromeOS because userspace thinks there's nothing there so it can't try
> > to retrain the link again. Instead, userspace has to rely on the kernel
> > driver to train the link again. The kernel should just tell userspace
> > the link is bad so userspace can implement the policy to either ignore
> > the connector entirely or to consider it a display that is having link
> > training problems.
> >
>
> What gain will it give if it retries the same mode blindly as opposed to
> the safer option I have explained above. None of the policies you have
> highlighted seem like something an end user will be satisfied with.
>
> > So again, I see no reason why the kernel driver thinks it can implement
> > a policy to train the link before indicating the drm connector is
> > connected. It should stop doing that. Instead it should tell userspace
> > that the connector is connected and then train the link when there's a
> > modeset. If the modeset fails then userspace can take action to either
> > figure out that the link is bad, or notify the user that the cable is
> > bad, or to try replugging or power cycle the monitor, etc. None of that
> > can be done if the kernel lies about the state of the connector because
> > the link training failed.
>
> Usermode is unable to take the corrective action without proper support
> from the kernel like removing unsupported modes etc and I dont see other
> drivers taking an action like that. Kernel is not lying. Its delaying
> the status to a point where usermode can safely handle.
>
> Please explain to me how any of the policies you have explained usermode
> can take are safer and have more chance of success than what we have now.



-- 
With best wishes
Dmitry
