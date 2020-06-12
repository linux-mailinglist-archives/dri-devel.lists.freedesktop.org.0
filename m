Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867F1F7C8E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5936EA17;
	Fri, 12 Jun 2020 17:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ED06EA17;
 Fri, 12 Jun 2020 17:41:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p5so10534119wrw.9;
 Fri, 12 Jun 2020 10:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N06e4f1LZnIJJBVTlO/jLeXZsHg330hzDvfCmeP0IlU=;
 b=p40Fx6wb8BUjL8MLw6Uby7ELzYeqk8GJS7iSx2HZWKT6AniT2oAZTF0lNf5IOaXgEd
 jNGv5VOyKENkvX1oYmY22uXlxA5utc6md8HGkNYDw3YoiQeDZ6YXBFJucgVihB/EOcd3
 N0TZ3TujZSQQfxJIaX4SzYzhd38FEr/GJQM8pqSXbHMNw+7JiYiNBgZwKWYGtvD4ta/s
 fAWecJbLwM/y/cgR3pVQbYnvGg8YLqPHNubmeEj3Txetkkcpdqnu5XRKSP6oLIUjqpsb
 hBzA1PalfctTmrjJbVmrMMCRhxHA/UNFZAGtwiaB/UCveIE6ZFvd4qYrDfUU/YEfAint
 AnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N06e4f1LZnIJJBVTlO/jLeXZsHg330hzDvfCmeP0IlU=;
 b=gILjKb+PlnvSplrsKQa2w4q4dqzd/9zvhZZwMztlcl6WCDvqPF1VoburttMLmGhffZ
 jxfJqfak0ijhEUOC8ME/3nZWeLeQWJsCaeNW2Zuy1TkKo9FPVTJvvHOz4pTJjmGDYisO
 ALgRYqXvV86ahToC4DgJUwEjZGjqW78uaDrSb4I8Ockq5ZSGo+Tw9mCQ/dPbuTGEIiQu
 bBadMR6vGgGpFgwDmbj5DjoxrNCltwk2w6G6BKOEvf2iMAw0u/ukI1eiGVkTGuh9kQEJ
 RyfvRBrRVeAY6eKOxkbuYrMlgsaJ9bQx1YbfoPfwSWjWvxX3k9y0xehrzdL5vfR5nvd7
 +JMg==
X-Gm-Message-State: AOAM5304b0oI6Z9YCXrXEt+wrxW9uDrsU/Ni//mVFsEYDyC9bSa948FS
 NCwjK93/Yr74ZEFLx8sJwPowX+ZXmhRvijQ6JdA=
X-Google-Smtp-Source: ABdhPJybPHDIKFvsEJLfkdWBErvccLGV9L5JXqBOdeWNgHrmcUZB0dofVEQHzSS7WYDZmgJpnA4lX/A7mSCIwX+ye04=
X-Received: by 2002:a05:6000:1003:: with SMTP id
 a3mr15716844wrx.111.1591983688378; 
 Fri, 12 Jun 2020 10:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-2-daniel.vetter@ffwll.ch>
 <ad375dbb-760b-b2e9-cfab-94fba61f4eb7@amd.com>
In-Reply-To: <ad375dbb-760b-b2e9-cfab-94fba61f4eb7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 12 Jun 2020 13:41:17 -0400
Message-ID: <CADnq5_NY1P8nM9gSL9zb1fpizsFxgRwvztQRg426-fEKMupq+w@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/amdgpu: Use __drm_atomic_helper_crtc_reset
To: Harry Wentland <hwentlan@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 1:24 PM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2020-06-12 12:00 p.m., Daniel Vetter wrote:
> > Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
> > which means vblank state isn't ill-defined and fail-y at driver load
> > before the first modeset on each crtc.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > Cc: Roman Li <roman.li@amd.com>
> > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > Cc: Stylon Wang <stylon.wang@amd.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Daniel, do you want to take the whole series, or should I pull this in
through my tree?  Either way works for me.  Thanks for the patch!

Alex

> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 68a73065b516..36d605a6eb16 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -4594,9 +4594,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
> >       if (WARN_ON(!state))
> >               return;
> >
> > -     crtc->state = &state->base;
> > -     crtc->state->crtc = crtc;
> > -
> > +     __drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >
> >  static struct drm_crtc_state *
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
