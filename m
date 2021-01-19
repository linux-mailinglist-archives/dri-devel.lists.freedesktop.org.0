Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 078742FBC88
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 17:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DB989BD5;
	Tue, 19 Jan 2021 16:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6756A89BD5;
 Tue, 19 Jan 2021 16:34:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g10so1977770wrx.1;
 Tue, 19 Jan 2021 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8CPP2LxVCRfQvw6Mvjys75AeJM/eD3BKflYmxoWy0Y=;
 b=o1yKY9vqL6lFysCAxbW+xr3OKTjSrN23zZNZQGQmNyYbKZLPk8YFBfDeLqPv26DiXr
 2VF6UVwFeLFe4FapelSdLdb+NHLIKGOL+xkosdRkeMWtKB0HyGTIJAPIoety7SncPydT
 1GcBMv4NY+lCmT1syZQzGopFwsEji7sLL70imchf5o27JB5r7Vc3lFj/23oFPYJxidNo
 YXRN9Kx877+qX6/hvvUFxhJMxzoVUd2f642bkirLANEreHDMS+T8KzQBHKabs1ghUYiE
 cB1jpGPPVdIN4XzGNOZpo9rYCEB6EWV+VsplMOrjE6vivFRc0lpSlOIl0hGX8mkWLzxh
 9dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8CPP2LxVCRfQvw6Mvjys75AeJM/eD3BKflYmxoWy0Y=;
 b=Vhl5baiOZGNQ3NMpb0vIcof0Egg2ngIIqfa6Cxjanu9KJbB+GLoaTaAxhBIvPdOJzO
 n3v4C7fAkuZSP3K0HR8ws9tL9ckKR9NrS7rvOlnE/4Bcrl5ZoZj1znQbZgzlzJf9aSmZ
 gTEVIMho5LSazBcQM9xGA8fStAOWW59gwxdFrp2kxnD4nXlBjhh2pdcslGsxomrQ0A3t
 LkEcADPiQlXSckVpkMOM+gT6FIV4oIh635+9kMIZGAmrwe2YNJEQObCtK+TWkGFo5m2w
 6jpW8IOzSabGKQMJxfdTyhIaAoDzSSzA1CcBY+cld1p7sqzCPns0tlp4ubcsIff2xjsq
 XDMg==
X-Gm-Message-State: AOAM530lLZLz0RM7LlOm9ttiv0/rQR2BMw1GgLjhmvUtsMzA3gEsYN7v
 9mgcyQ+7scdNENSSQkwnRsowbtDs+Tv+WLkHakc=
X-Google-Smtp-Source: ABdhPJwlH+KuLj1j8ERMqIwHoWH5x4ZSIo4tLJR/GfYt0+5JVb5lagtVPPAe7FqFO7LhiKHxCUkzcDq5sfNgwRNhEFQ=
X-Received: by 2002:a5d:688d:: with SMTP id h13mr5464908wru.28.1611074098001; 
 Tue, 19 Jan 2021 08:34:58 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
 <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
In-Reply-To: <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 19 Jan 2021 08:34:44 -0800
Message-ID: <CAF6AEGuEeaSMyjVQXV-2WAJ6FamrqYc=TF8_EFQo27r+X8_gdg@mail.gmail.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>, Jonathan Marek <jonathan@marek.ca>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 11:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 18, 2021 at 11:00 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 6:44 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Adding some more folks in case anyone has any suggestions to fix this
> > > reboot hang.
> >
> > Not sure if this is a valid fix, but the change below makes reboot
> > works correctly.
> >
> > kmscube still works.
> >
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -207,8 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
> >         struct msm_kms *kms = priv->kms;
> >         struct drm_crtc *async_crtc = NULL;
> >         unsigned crtc_mask = get_crtc_mask(state);
> > -       bool async = kms->funcs->vsync_time &&
> > -                       can_do_async(state, &async_crtc);
> > +       bool async;
> > +
> > +       if (!kms)
> > +               return;
>
> That looks a bit like a hack papering over the real issue.
>
> From your report it sounds like earlier kernels worked, did you
> attempt bisecting? Also for regressions put regressions into the
> subject, it's the magic work that gets much more attention.

the root issue is how are we doing KMS stuff on imx (where drm/msm is
only used for gpu).. which I think is this commit:

----------
commit 9d5cbf5fe46e350715389d89d0c350d83289a102
Author:     Krishna Manikandan <mkrishn@codeaurora.org>
AuthorDate: Mon Jun 1 16:33:22 2020 +0530
Commit:     Rob Clark <robdclark@chromium.org>
CommitDate: Tue Aug 18 08:09:01 2020 -0700

    drm/msm: add shutdown support for display platform_driver

    Define shutdown callback for display drm driver,
    so as to disable all the CRTCS when shutdown
    notification is received by the driver.

    This change will turn off the timing engine so
    that no display transactions are requested
    while mmu translations are getting disabled
    during reboot sequence.

    Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

    Changes in v2:
            - Remove NULL check from msm_pdev_shutdown (Stephen Boyd)
            - Change commit text to reflect when this issue
              was uncovered (Sai Prakash Ranjan)

    Signed-off-by: Rob Clark <robdclark@chromium.org>
----------

I suppose we should do the drm_atomic_helper_shutdown() conditionally?
 Or the helper should bail if there is no kms?

BR,
-R

> -Daniel
>
> > +
> > +       async = kms->funcs->vsync_time && can_do_async(state, &async_crtc);
> >
> >         trace_msm_atomic_commit_tail_start(async, crtc_mask);
> >
> > Any comments?
> >
> > Thanks
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
