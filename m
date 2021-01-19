Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3292FBCB1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E601892C9;
	Tue, 19 Jan 2021 16:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A51892C9;
 Tue, 19 Jan 2021 16:40:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a12so20355266wrv.8;
 Tue, 19 Jan 2021 08:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzUrICd+hooqRjrH4nA7JLp0t3EGkemoaYLuTuXnI4U=;
 b=HVtaBGDhj++pFjZhcrVW2JENvon1UmMl4mWKuz/rRLw9dCo+1QO/OGIC4/jbmsENC2
 /po9MAwU9Uk3FRJlJg/yxyHaHeXWdF88J8VnwxwnVelGzfwSUnul1ytWukLQmXr2uRp0
 btapII2NSt7HRg+P8K/PDD5GjeuF/hzEy+awNRRfOFKxEvBMs3hyGYf7n2/M+t4IA491
 60xTMn5zsD+D9Ra825dls5WOz3AccyPzCS9qi1wLmlKNZOxXt6HUHtoYMu/9EO7ckAHP
 jpmS+9OpW0sglKPFx497NaBCawWhzQJDS264hzTFryr62CP0RrtX2HgKRidLzHX2bR1T
 KlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzUrICd+hooqRjrH4nA7JLp0t3EGkemoaYLuTuXnI4U=;
 b=BQS6p+pyBqnLQf3put9kCyQ0dvAt3sAwcbYMDk990Ti+8i7OvoMnMyrnMkio/MTvrt
 O2isyEcdejKs7LmVTXwJOmcx5Oy7YPmoyYKVAgn2EGW6U2Z8LUedBWB1TFPIQvLIY2cP
 Dj5+E2KYrOQW3BeItb0J+77IaxLtagLEiojlItihIi81O61Krd/VRiNLCK6YfJl7xhhT
 ICIsaM0Q1ehVKGcyA49noVNGR6uZ2p8POJuGY90/BgMrnUakoqf7MVhem2zRi/e77MAB
 HMyI9qMW0VPb9WJeYf4RrUiFQoCFAoRT3zJK9wmn9DmvSgj3DiDcRX/mDVVWxmaGGDMj
 XyLA==
X-Gm-Message-State: AOAM53279KQU/Upvl7xF61KWNmLmLCFjssTkhOo7OvikNHSrAGjpo2Uo
 3heVloGWv6SLVo4FxhiCuDt/cNY6nlVo2qHMEz4=
X-Google-Smtp-Source: ABdhPJy2Cc8Lk+LvvPdZkBTuX3hMcqJqJSB7yqMbf4dh4mMCT1sUbUEbFs7xmtbSZcrza1gehyh/lEaCNcEfBuIAyIo=
X-Received: by 2002:adf:db51:: with SMTP id f17mr5361743wrj.83.1611074449917; 
 Tue, 19 Jan 2021 08:40:49 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
 <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
 <CAF6AEGuEeaSMyjVQXV-2WAJ6FamrqYc=TF8_EFQo27r+X8_gdg@mail.gmail.com>
In-Reply-To: <CAF6AEGuEeaSMyjVQXV-2WAJ6FamrqYc=TF8_EFQo27r+X8_gdg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 19 Jan 2021 08:43:14 -0800
Message-ID: <CAF6AEGvxdLCLDfhnY9M4-R6U3CvH6eqJBUs=xB6ycDQf2F=JOw@mail.gmail.com>
Subject: Re: Reboot crash at msm_atomic_commit_tail
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 Sascha Hauer <kernel@pengutronix.de>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

forgot to CC Krishna

On Tue, Jan 19, 2021 at 8:34 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 11:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jan 18, 2021 at 11:00 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > On Mon, Jan 18, 2021 at 6:44 PM Fabio Estevam <festevam@gmail.com> wrote:
> > > >
> > > > Adding some more folks in case anyone has any suggestions to fix this
> > > > reboot hang.
> > >
> > > Not sure if this is a valid fix, but the change below makes reboot
> > > works correctly.
> > >
> > > kmscube still works.
> > >
> > > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > > @@ -207,8 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> > >         struct msm_kms *kms = priv->kms;
> > >         struct drm_crtc *async_crtc = NULL;
> > >         unsigned crtc_mask = get_crtc_mask(state);
> > > -       bool async = kms->funcs->vsync_time &&
> > > -                       can_do_async(state, &async_crtc);
> > > +       bool async;
> > > +
> > > +       if (!kms)
> > > +               return;
> >
> > That looks a bit like a hack papering over the real issue.
> >
> > From your report it sounds like earlier kernels worked, did you
> > attempt bisecting? Also for regressions put regressions into the
> > subject, it's the magic work that gets much more attention.
>
> the root issue is how are we doing KMS stuff on imx (where drm/msm is
> only used for gpu).. which I think is this commit:
>
> ----------
> commit 9d5cbf5fe46e350715389d89d0c350d83289a102
> Author:     Krishna Manikandan <mkrishn@codeaurora.org>
> AuthorDate: Mon Jun 1 16:33:22 2020 +0530
> Commit:     Rob Clark <robdclark@chromium.org>
> CommitDate: Tue Aug 18 08:09:01 2020 -0700
>
>     drm/msm: add shutdown support for display platform_driver
>
>     Define shutdown callback for display drm driver,
>     so as to disable all the CRTCS when shutdown
>     notification is received by the driver.
>
>     This change will turn off the timing engine so
>     that no display transactions are requested
>     while mmu translations are getting disabled
>     during reboot sequence.
>
>     Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
>     Changes in v2:
>             - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
>             - Change commit text to reflect when this issue
>               was uncovered (Sai Prakash Ranjan)
>
>     Signed-off-by: Rob Clark <robdclark@chromium.org>
> ----------
>
> I suppose we should do the drm_atomic_helper_shutdown() conditionally?
>  Or the helper should bail if there is no kms?
>
> BR,
> -R
>
> > -Daniel
> >
> > > +
> > > +       async = kms->funcs->vsync_time && can_do_async(state, &async_crtc);
> > >
> > >         trace_msm_atomic_commit_tail_start(async, crtc_mask);
> > >
> > > Any comments?
> > >
> > > Thanks
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
