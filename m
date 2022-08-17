Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810F59783F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 22:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59967965A0;
	Wed, 17 Aug 2022 20:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65559164A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 20:48:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z20so18992615edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+Cti20S/WWpY7aspWrYZ4xE3P/s0O+PHZV22YRy/CUE=;
 b=RUY2d9i5bIklJBMGlj1kJOw47zUbEvxdY1V+2zngZZk1/gVeOIgKDiz2urgv4l6Cpa
 4SgbFJshe0t5ZmI808R5aNZoUHqzHaqN3nRZzuaTWbgKyuf30NRCp7q12AdrmxbnSCT3
 Hum1AaJKsg24YJxa3NlN8SEYHrrLmnQp1xJAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+Cti20S/WWpY7aspWrYZ4xE3P/s0O+PHZV22YRy/CUE=;
 b=uBX65zMrF3npEi121UXho9jESUOCOxeuoniBvu4U7FI/rNM2opFHEF6KXNNqZjBXy9
 v/FuGAxDBU+knYbkR69YSa0eMV+71okdHK7WLl2bVDDotmz5j+9RYGQVmm5j4tYnRNmf
 yfDffwZUJuR4seCdlKXvyb4LqNPSegnmedT/K+gI2hffV2dnGvdVwPCV7yLXdRh4vNVO
 Tq9U6VLYQd7r9IBo09gS66WtPQ9rFfFh1+FjXqIJhBt9ulWqxFzi+F+y/g72ShXldg8D
 6w+mOsYpiuQa0EZGqpmBE//y+3X6X8mMqzj+5fEH9vaMLGNv4nEF8D616T9Y0UjGstj5
 leHw==
X-Gm-Message-State: ACgBeo1ZxxwevnbsSLP3b2jxY+mYWfuv73SvISI5+y6rXxbiB2D7jFLy
 b735/VgjhCpg0zM2uC929brFsfTCo6pAHyI6
X-Google-Smtp-Source: AA6agR6FZ9U0hnwLXYQrj1LyPVEB6egONeDkFICbl2zB3Ls0idFdbreumioEkCmZNQf8gadUX1juxg==
X-Received: by 2002:aa7:dd42:0:b0:440:916e:9a38 with SMTP id
 o2-20020aa7dd42000000b00440916e9a38mr24707211edw.302.1660769320174; 
 Wed, 17 Aug 2022 13:48:40 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906471200b00711edab7622sm7232902ejq.40.2022.08.17.13.48.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 13:48:39 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id j7so17520060wrh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 13:48:38 -0700 (PDT)
X-Received: by 2002:a05:6000:1564:b0:225:17e4:4084 with SMTP id
 4-20020a056000156400b0022517e44084mr5308854wrz.617.1660769317514; Wed, 17 Aug
 2022 13:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
 <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
In-Reply-To: <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Aug 2022 13:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9Gr9MyCg2rsKaA-ssSi5e3W5zO9sC56At+ceN4A2XtA@mail.gmail.com>
Message-ID: <CAD=FV=W9Gr9MyCg2rsKaA-ssSi5e3W5zO9sC56At+ceN4A2XtA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Set panel orientation when directly connected
To: Rob Clark <robdclark@gmail.com>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, patches@lists.linux.dev,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 20, 2022 at 3:42 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jul 20, 2022 at 1:46 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Jul 8, 2022 at 8:25 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Set the panel orientation in drm when the panel is directly connected,
> > > > i.e. we're not using an external bridge. The external bridge case is
> > > > already handled by the panel bridge code, so we only update the path we
> > > > take when the panel is directly connected/internal. This silences a
> > > > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> > > >
> > > > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > Cc: Douglas Anderson <dianders@chromium.org>
> > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > ---
> > > >
> > > > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > > > to set orientation from panel") which is in drm-misc
> > > >
> > > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > I don't personally have objections to this, but (to my understanding)
> > > "the future" is that everyone should use panel_bridge. If we made the
> > > move to panel_bridge today then we wouldn't need to do this. In
> > > general I think panel_bridge would end up letting us delete a bunch of
> > > code...
> > >
> > > See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
> > > panel-bridge") for when this was done by ti-sn65dsi86.
> > >
> > > Then again, I spent a small amount of time looking into this and it's
> > > definitely non-trivial. Still likely worthwhile, but not worth
> > > blocking a tiny fix like this. It also should be fairly obvious that
> > > we should delete this when we switch to panel_bridge.
> > >
> > > Thus:
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll assume that we'll just snooze this commit until drm-misc-next
> > > merges into a tree that msm-next is based on, which will probably be
> > > the next -rc1. If desired and Acked I could land this in
> > > drm-misc-next, but it's probably not worth it?
> >
> > if you want to land this patch via drm-misc, which might be the
> > easier/faster route, then:
> >
> > Acked-by: Rob Clark <robdclark@gmail.com>
>
> As per discussion on IRC, I'm not going to apply this to drm-misc-next.
>
> Given where we are in the cycle landing in drm-misc-next means it
> won't be in mainline for a couple versions and I suspect that'll cause
> merge conflicts with Dmitry's series [1]. ...and, of course, if
> Dmitry's series lands then we don't even need ${SUBJECT} patch...
>
> So I think the plan is:
>
> 1. Snooze waiting for the next -rc1 since
> drm_connector_set_orientation_from_panel() won't be in mainline until
> then.
>
> 2. If Dmitry's series looks like a long way off, we could land
> ${SUBJECT} patch in msm-next as a stopgap fix.
>
>
> [1] https://lore.kernel.org/r/20220711094320.368062-5-dmitry.baryshkov@linaro.org/

Just checking up. What's the latest thinking here? Do we want to land
Stephen's change as a stopgap?
drm_connector_set_orientation_from_panel() is available in v6.0-rc1.

-Doug
