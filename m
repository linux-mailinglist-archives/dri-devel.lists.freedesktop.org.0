Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E5B890EF1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 01:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C2310E56C;
	Fri, 29 Mar 2024 00:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cPF07XVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6458410E4CA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:10:37 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6114c9b4d83so13861087b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711671036; x=1712275836; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K5lSPZalTka6RxrpE0PVtOAReRQxe7xqocRBLESvr1I=;
 b=cPF07XVk/q62oMi3vdycQmS5RQeJz/IJdOVyjtItbOSqrdTM2J3qQp8WEEYHrxbEEk
 sOJMmGz2PUubM4MyHGiv26ad/omN35mkVta4LhpDJJ9UBxbaBeDUaaQzJRn+gZvxJq14
 8b5fSrZZQXAv3/gT3Z9/toln8pudcwG0+GHrQqgGzPFtocEudHUTBMHUX4te/CA9QN2S
 tQEGno2lM+LA1NaD+vyGJMhJqa1/fKr/id/aaWcW8TkMWmvV8wjhfX+u1JdFMBFb2/so
 pUl3V/iC61lzmfchgY7TPgmsjEzyoNKF7DNoR5JIm4Qv6uSUWcgSTW4oF0NJ7nx9yseI
 D7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711671036; x=1712275836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K5lSPZalTka6RxrpE0PVtOAReRQxe7xqocRBLESvr1I=;
 b=i7iksgIBus82GTYLZxSmK0wZnf0r+bq2g3a2wVxnVl2pNa68ByE/3JV3SmV04Iwi3m
 TrzOeUWnDUKLsfPiCjViksUdZ+u39sq1Wjt/MCDUlqsL9c/uAt68shwaKEl6WwD+PrrZ
 qiGMiAZad0gw0/2HZQygMkHpzfhNL19DtdGhWTUE4CSZ659YLwe4CQnwDtrXQ9pTGA8R
 EmDglrdJ5PAGWS5Qh66EienIUJePkPYymQac4L9eaxceUgcXrAsSpLczNzHk/7hv6ufo
 /hlZOF/Ae/Yn+RD9RYlHNf1SMObKQSTsfRGazfGicoN2QHCC9C7EoYvxKHwtfpDdGe7v
 GyFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtpdxfiL0iBKpdN5m4bCuPtLWYnXgoZxjVOt1OQ9v9H/pxmSB1UkCDRBBfuatk3RevgmT9f+7Aq+DCalGW88RClnbGsUHljVhW8p4y0ljE
X-Gm-Message-State: AOJu0YwEBFlMFgEeDW4dsJsboSct/H6Ecw+LNC/mxDTsJNo0spURi0Nl
 LL6CZe62xRutyhZdDls9DbC6cXS3yksjl9xpff7+zhisQ7B8JL2stEhPlkmQ+CQw8lXbGjrhheN
 NHsjv4UpPfDTlYw6av8/PSFTVnbAC+/ER/VbQPQ==
X-Google-Smtp-Source: AGHT+IFNTD2wcHv6N04Ko0vkYz+k2THNRgzN2dkBDjgsSy4EQ2HSZ3QxzAoBtzLez5o4xIavqtXemij+Sg/7cukae7E=
X-Received: by 2002:a0d:cc01:0:b0:611:bdd:452c with SMTP id
 o1-20020a0dcc01000000b006110bdd452cmr1106283ywd.8.1711671036187; Thu, 28 Mar
 2024 17:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
 <CAA8EJppEWXnsQzDD1tdNuMb1ijEVtE7LQct9jt1fwVwMd8ch_Q@mail.gmail.com>
 <27cadd17-10a3-3b8c-2b29-6698ccdce531@quicinc.com>
In-Reply-To: <27cadd17-10a3-3b8c-2b29-6698ccdce531@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 02:10:25 +0200
Message-ID: <CAA8EJpqYVDG9pBj39m40rPwUNgE7x07HfCt6C3yaMN7eOaWk6Q@mail.gmail.com>
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

On Fri, 29 Mar 2024 at 01:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 3:50 PM, Dmitry Baryshkov wrote:
> > On Thu, 28 Mar 2024 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> >>> Quoting Abhinav Kumar (2024-03-28 13:24:34)
> >>>> + Johan and Bjorn for FYI
> >>>>
> >>>> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> >>>>> For internal HPD case, hpd_event_thread is created to handle HPD
> >>>>> interrupts generated by HPD block of DP controller. It converts
> >>>>> HPD interrupts into events and executed them under hpd_event_thread
> >>>>> context. For external HPD case, HPD events is delivered by way of
> >>>>> dp_bridge_hpd_notify() under thread context. Since they are executed
> >>>>> under thread context already, there is no reason to hand over those
> >>>>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> >>>>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> >>>>>
> >>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> >>>>>     1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>
> >>>>
> >>>> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> >>>
> >>> Is this a bug fix or an optimization? The commit text doesn't tell me.
> >>>
> >>
> >> I would say both.
> >>
> >> optimization as it avoids the need to go through the hpd_event thread
> >> processing.
> >>
> >> bug fix because once you go through the hpd event thread processing it
> >> exposes and often breaks the already fragile hpd handling state machine
> >> which can be avoided in this case.
> >
> > Please add a description for the particular issue that was observed
> > and how it is fixed by the patch.
> >
> > Otherwise consider there to be an implicit NAK for all HPD-related
> > patches unless it is a series that moves link training to the enable
> > path and drops the HPD state machine completely.
> >
> > I really mean it. We should stop beating a dead horse unless there is
> > a grave bug that must be fixed.
> >
>
> I think the commit message is explaining the issue well enough.
>
> This was not fixing any issue we saw to explain you the exact scenario
> of things which happened but this is just from code walkthrough.
>
> Like kuogee wrote, hpd event thread was there so handle events coming
> out of the hpd_isr for internal hpd cases. For the hpd_notify coming
> from pmic_glink or any other extnernal hpd cases, there is no need to
> put this through the hpd event thread because this will only make things
> worse of exposing the race conditions of the state machine.
>
> Moving link training to enable and removal of hpd event thread will be
> worked on but delaying obvious things we can fix does not make sense.

From the commit message this feels like an optimisation rather than a
fix. And granted the fragility of the HPD state machine, I'd prefer to
stay away from optimisations. As far as I understood from the history
of the last revert, we'd better make sure that HPD handling goes only
through the HPD event thread.

-- 
With best wishes
Dmitry
