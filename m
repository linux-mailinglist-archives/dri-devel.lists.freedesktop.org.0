Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64E5540B8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 04:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B543110E2E9;
	Wed, 22 Jun 2022 02:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5010E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:59:42 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso20862493fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 19:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=QkbVDi6oZOvTPDcMwZXGsoYfGdqUPPUk7tJ+2+elX5s=;
 b=THYrB1E9k91TCnr+V74Cuctr7fnR5f25+6XK/hEIc0Gif5IUpqNWE73dTSwmcJpggO
 XWrydg+/DLYqpayTOjK7lMa/upuYVQpdjRKb5oBp5LuXjA6bonQsm1/LJtNtWYqyqU3z
 qk+UkVZ+F0eEg6q0/uvotetNpCZcmBqTdYiso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=QkbVDi6oZOvTPDcMwZXGsoYfGdqUPPUk7tJ+2+elX5s=;
 b=PflOWEJc74MRtVQFrtAAZ0/GpS+bWWHWoC/b+oFdcJNrsgnWg7Iv+jre8+3aPz7LnS
 OVWoewfckLA5NGOaIj55r/3Sv5peyUb1zMIaESN07O/TdQjiYH6B1UQBtutQZSRdv8+P
 7gu0WBUaG9LYXQ62X9z/MY98Se/NX/eDh/Hf/awQsEcz31Q/WQXmioleabdC7zxEfeOj
 Wnp11iveeepgYJianx1G7Y2DBs+0yLtpjh5XvaW6CiIAefmwaMMY0ecVR0r3k74+hoQz
 oV75JNJZkwpmzsvUL32cpbw/iZRiQ8U1blJcwTZEdeVgPJvwsBT39V8RdVk3yaoBQKeU
 +HQA==
X-Gm-Message-State: AJIora/KbfGwfWXZ/CKnEGmr9ROJVan9WpgubKRscD/GEk0zPU3PAVlp
 sZgRZdwNJUeVyfW8ReuLrznyqf8FzKm2ukMpNMdj5w==
X-Google-Smtp-Source: AGRyM1uopL3zeCsqA5w30zHRns6v+RvwzmYQSxJqB4ZSOOW5tSWTRM/NTziAL3zCVDH56+dcJU0kjl17IwBIClIWsPs=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr748273oab.193.1655866781557; Tue, 21
 Jun 2022 19:59:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jun 2022 22:59:41 -0400
MIME-Version: 1.0
In-Reply-To: <bb98ca29-8752-6864-ddbd-19547fb6f73b@linaro.org>
References: <20220617204750.2347797-1-swboyd@chromium.org>
 <20220617204750.2347797-3-swboyd@chromium.org>
 <bb98ca29-8752-6864-ddbd-19547fb6f73b@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 21 Jun 2022 22:59:41 -0400
Message-ID: <CAE-0n51_zysbkktVEfhvXtGqpADTWcaPBAX7A7rD1FV+vcK3Uw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: Remove pixel_rate from struct dp_ctrl
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 16:07:58)
> On 17/06/2022 23:47, Stephen Boyd wrote:
> > This struct member is stored to in the function that calls the function
> > which uses it. That's possible with a function argument instead of
> > storing to a struct member. Pass the pixel_rate as an argument instead
> > to simplify the code. Note that dp_ctrl_link_maintenance() was storing
> > the pixel_rate but never using it so we just remove the assignment from
> > there.
> >
> > Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 57 ++++++++++++++++----------------
> >   drivers/gpu/drm/msm/dp/dp_ctrl.h |  1 -
> >   2 files changed, 28 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index bd445e683cfc..e114521af2e9 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -1336,7 +1336,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> >                               name, rate);
> >   }
> >
> > -static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
> > +static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl, unsigned long pixel_rate)
>
>
> I think we can read pixel_rate here rather than getting it as an
> argument. We'd need to move handling (DP_TEST_LINK_PHY_TEST_PATTERN &&
> !ctrl->panel->dp_mode.drm_mode.clock) case here from dp_ctrl_on_link().

This is also called from dp_ctrl_on_stream() and
dp_ctrl_reinitialize_mainlink(). In the dp_ctrl_on_stream() case we may
divide the pixel_rate by 2 with widebus. We could move the
dp_ctrl_on_link() code here, but then we also need to move widebus, and
then I'm not sure which pixel rate to use.

It looks like the test code doesn't care about widebus? And similarly,
we may run the pixel clk faster until we get a modeset and then divide
it for widebus. Is that why you're suggesting to check
!ctrl->panel->dp_mode.drm_mode.clock? I hesitate because it isn't a
direct conversion, instead it checks some other stashed struct member.

I'll also note that dp_ctrl_enable_mainlink_clocks() doesn't really use
this argument except to print the value in drm_dbg_dp(). Maybe we should
simply remove it from here instead?

> > @@ -1588,12 +1586,12 @@ static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> >   {
> >       int ret;
> >       struct dp_ctrl_private *ctrl;
> > +     unsigned long pixel_rate;
> >
> >       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> >
> > -     ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> > -
> > -     ret = dp_ctrl_enable_stream_clocks(ctrl);
> > +     pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> > +     ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
>
> I think we can take another step forward here. Read the
> ctrl->panel->dp_mode.drm_mode.clock from within the
> dp_ctrl_enable_stream_clocks() function. This removes the need to pass
> pixel_rate as an argument here.

This is also affected by widebus and if the function is called from
dp_ctrl_on_stream() or dp_ctrl_on_stream_phy_test_report(). Maybe it
would be better to inline dp_ctrl_enable_stream_clocks() to the
callsites? That would probably simplify things because the function is
mostly a wrapper around a couple functions.
