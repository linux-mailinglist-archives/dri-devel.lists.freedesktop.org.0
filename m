Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623F457C030
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B481D14BE9A;
	Wed, 20 Jul 2022 22:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46814B43E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 22:42:37 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m8so134695edd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KuBSeD48AXgXk0Y7RnBVCdR0V4hjzjRzCq3VFtUSmXU=;
 b=hM1UrZ2kalbQlptKuH3fj5NcVp93Bz/8tn9oJq5IQEFtIepQAjgmF2oYEksVjL31KB
 e9LMOlkKA3bfMgkiuGzd1pbAGoeWM1l3rCYMAEyTFiFQbIUVXsUfBgcDxyeIpATWToPj
 DsMiLq1btPhMB8rNiehlMRFMF/tlaDAlKu2qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KuBSeD48AXgXk0Y7RnBVCdR0V4hjzjRzCq3VFtUSmXU=;
 b=H34WXzAZTtnV8JsECq1/PTqqMltSpyAuHrj4KsMYNpZQu2vHnIZaFTc8H1cwv1rQoi
 Y59t6IHfQ1ghZNRT64zosqZPUj8YEBzEVB8ef/YooHWrVJLF6ru5UOEpI0eEb9tb4+qT
 /97vzLCr0Fr9qGjaPGJpKegZAzo0mTQIQdeDCh/QiY4gwu6jkskk8DAEuZrtzwD0/QuE
 5i+1+mMZGaUo17C+W33jWvothe3+HxVsmMUhjlCxHnAwb3yodfSC1uYBWKKLFhgFt52D
 H3QgB6Sw2Lh25CFBMsaGxKU6ZUM5q/QOfaZ9pOn9p+fN6VELMksLcIdyri3HXARMlSUk
 dcjA==
X-Gm-Message-State: AJIora9yRI4kPU43p/Nf8TMOJx2h5UTCRClvG69I/CFzc4616Ye4fo/k
 Fmz9vOA5ZLAkJqK3SZqrdYIJHHVNUfj5WaOW
X-Google-Smtp-Source: AGRyM1u4AxlL6YutA1QwDx/7DaPOuxduaiBIjo9/XQGYA/CDCEVb+7GspOb2iRG7m6vz7qeXssasSw==
X-Received: by 2002:a05:6402:753:b0:43b:a416:3963 with SMTP id
 p19-20020a056402075300b0043ba4163963mr11244568edy.267.1658356956059; 
 Wed, 20 Jul 2022 15:42:36 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05640205d200b0043b7917b1a4sm123381edx.43.2022.07.20.15.42.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 15:42:34 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id z13so8495010wro.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:42:34 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr32970096wrn.138.1658356953852; Wed, 20
 Jul 2022 15:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220706191442.1150634-1-swboyd@chromium.org>
 <CAD=FV=UrYCwm2ByN_5EN3fq-ayMJNjmWfJ5sooRy51ZiCoMcjA@mail.gmail.com>
 <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt_J6f1T+-6KtyCrUJrY2fh7Sz10L1AV1FSe8hueGREtQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Jul 2022 15:42:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
Message-ID: <CAD=FV=W+VWtpTKAoyQpYMFteZy8iYB7-o=ACqkjr7YX7uCxZvg@mail.gmail.com>
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

On Wed, Jul 20, 2022 at 1:46 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Jul 8, 2022 at 8:25 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 6, 2022 at 12:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Set the panel orientation in drm when the panel is directly connected,
> > > i.e. we're not using an external bridge. The external bridge case is
> > > already handled by the panel bridge code, so we only update the path we
> > > take when the panel is directly connected/internal. This silences a
> > > warning splat coming from __drm_mode_object_add() on Wormdingler boards.
> > >
> > > Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >
> > > This relies on commit 5e41b01a7808 ("drm/panel: Add an API to allow drm
> > > to set orientation from panel") which is in drm-misc
> > >
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > I don't personally have objections to this, but (to my understanding)
> > "the future" is that everyone should use panel_bridge. If we made the
> > move to panel_bridge today then we wouldn't need to do this. In
> > general I think panel_bridge would end up letting us delete a bunch of
> > code...
> >
> > See commit 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with
> > panel-bridge") for when this was done by ti-sn65dsi86.
> >
> > Then again, I spent a small amount of time looking into this and it's
> > definitely non-trivial. Still likely worthwhile, but not worth
> > blocking a tiny fix like this. It also should be fairly obvious that
> > we should delete this when we switch to panel_bridge.
> >
> > Thus:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll assume that we'll just snooze this commit until drm-misc-next
> > merges into a tree that msm-next is based on, which will probably be
> > the next -rc1. If desired and Acked I could land this in
> > drm-misc-next, but it's probably not worth it?
>
> if you want to land this patch via drm-misc, which might be the
> easier/faster route, then:
>
> Acked-by: Rob Clark <robdclark@gmail.com>

As per discussion on IRC, I'm not going to apply this to drm-misc-next.

Given where we are in the cycle landing in drm-misc-next means it
won't be in mainline for a couple versions and I suspect that'll cause
merge conflicts with Dmitry's series [1]. ...and, of course, if
Dmitry's series lands then we don't even need ${SUBJECT} patch...

So I think the plan is:

1. Snooze waiting for the next -rc1 since
drm_connector_set_orientation_from_panel() won't be in mainline until
then.

2. If Dmitry's series looks like a long way off, we could land
${SUBJECT} patch in msm-next as a stopgap fix.


[1] https://lore.kernel.org/r/20220711094320.368062-5-dmitry.baryshkov@linaro.org/

-Doug
