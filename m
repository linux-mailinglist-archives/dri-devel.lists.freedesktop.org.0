Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B974E77AC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A0310E3EC;
	Fri, 25 Mar 2022 15:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEA910E2AD;
 Fri, 25 Mar 2022 15:30:16 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i23-20020a9d6117000000b005cb58c354e6so5716637otj.10; 
 Fri, 25 Mar 2022 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBkqRXwmCQXVZZQLtX0HscPogOawBdLH54y96ZCObf8=;
 b=UcDOxlrC2lyAEoCBzlHdHWL6vUGVnHsLVUtSW3blgM/3LEu32UeF+yBslEDEqQzSdF
 rZ1QZ0nxzJH/HwCqP0jkgjSRJdB6hXOsR77+aGQFlmN7s5U/1IkJqOnIXf6yoVoNUClZ
 eeJLBY/Bf0VYJypDMZqcjHFoy4knTIhZctKL4ukWLX4Fl+SvGZJqoFIiZOKeQ+O9tpVa
 8L4uW/zQrkxSqmABde/r3ODcQ9qZgJfWaHT+SdFVfdCPA7XDDqrPpK1zhCjUkdiZ5BPd
 PNBxeYAAzys0ZiaE6w1v5l2K6Pw+MKbNaIPOdfPVvQAarf2aY9/hKMKGeCb3ERvCcnSE
 bqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBkqRXwmCQXVZZQLtX0HscPogOawBdLH54y96ZCObf8=;
 b=JfrCHLS+7W+ptncxtqyAjw5IgosP1kFbBoE7ueuVsRWIJYvOL3N+3EnroMMdSVrRbs
 xToBQc0pyhsDQmMJpcbaI1OJqTJrwgGO8YQgexbBckWZKF0dHl8f9UCmtjDkpJzzbeWm
 InUGsKoN/4BwHTI2GOvnipnpp2wRWYSO9pu5IzIWSZn4mvg6ZTbOiUEHncE5A6xqoOLW
 PPBYGBDrMm1NI+jXriNmn3oWuS8k8sfv7oKtXHYnXxwSmrrPVWHV0Th4IWGt198afeqR
 T9w0vnSLKHDeWxuSB/x6/gRW/9kI6UtRigM3R60bBhelx5009Qt3R8A+az+TYV5tneJf
 m8tA==
X-Gm-Message-State: AOAM531WKR2j/jfugsaasWw0AdqKQNv+rNuzLMpe7Hc7AZi41XEEeeyr
 MTvcM8SUT00JnYcOSTSEB+dJiXxHY02ozeTySLg=
X-Google-Smtp-Source: ABdhPJyj8b5pWZriNY8HoKAVf1aKrBjBWG2VQcycx0310kJrK366qVQxbfCR6HfjRlKP6S82eXMypO6ZcB8gMcQXP0k=
X-Received: by 2002:a05:6830:1552:b0:5cd:bc6e:62b1 with SMTP id
 l18-20020a056830155200b005cdbc6e62b1mr1893973otp.357.1648222215790; Fri, 25
 Mar 2022 08:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220325000622.1594343-1-sean@poorly.run>
 <da22152b-57e7-5bb4-7330-26edf405bbf8@amd.com>
In-Reply-To: <da22152b-57e7-5bb4-7330-26edf405bbf8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Mar 2022 11:30:04 -0400
Message-ID: <CADnq5_MDjUpzJbeUVD8kDf6jPMuPShQub-Byokhz3T9Rd1ESeA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Re-classify some log messages in commit path
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks.  Fixed up the title when I applied it.

Alex

On Fri, Mar 25, 2022 at 10:55 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-03-24 20:06, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > ATOMIC and DRIVER log categories do not typically contain per-frame log
> > messages. This patch re-classifies some messages in amd to chattier
> > categories to keep ATOMIC/DRIVER quiet.
> >
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> With the subject line fixed as per Christian's comment this is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 5 +++--
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > index fae5c1debfad..1fcbab2fd3c3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -113,8 +113,9 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
> >       spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> >
> >
> > -     DRM_DEBUG_DRIVER("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> > -                                      amdgpu_crtc->crtc_id, amdgpu_crtc, work);
> > +     drm_dbg_vbl(adev_to_drm(adev),
> > +                 "crtc:%d[%p], pflip_stat:AMDGPU_FLIP_SUBMITTED, work: %p,\n",
> > +                 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
> >
> >  }
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index b30656959fd8..45d130f86114 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -9248,7 +9248,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
> >                       &bundle->flip_addrs[planes_count].address,
> >                       afb->tmz_surface, false);
> >
> > -             DRM_DEBUG_ATOMIC("plane: id=%d dcc_en=%d\n",
> > +             drm_dbg_state(state->dev, "plane: id=%d dcc_en=%d\n",
> >                                new_plane_state->plane->index,
> >                                bundle->plane_infos[planes_count].dcc.enable);
> >
> > @@ -9282,7 +9282,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
> >                               dc_plane,
> >                               bundle->flip_addrs[planes_count].flip_timestamp_in_us);
> >
> > -             DRM_DEBUG_ATOMIC("%s Flipping to hi: 0x%x, low: 0x%x\n",
> > +             drm_dbg_state(state->dev, "%s Flipping to hi: 0x%x, low: 0x%x\n",
> >                                __func__,
> >                                bundle->flip_addrs[planes_count].address.grph.addr.high_part,
> >                                bundle->flip_addrs[planes_count].address.grph.addr.low_part);
> > @@ -9624,7 +9624,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
> >               dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
> >               dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
> >
> > -             DRM_DEBUG_ATOMIC(
> > +             drm_dbg_state(state->dev,
> >                       "amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
> >                       "planes_changed:%d, mode_changed:%d,active_changed:%d,"
> >                       "connectors_changed:%d\n",
> > @@ -10328,7 +10328,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
> >       if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
> >               goto skip_modeset;
> >
> > -     DRM_DEBUG_ATOMIC(
> > +     drm_dbg_state(state->dev,
> >               "amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
> >               "planes_changed:%d, mode_changed:%d,active_changed:%d,"
> >               "connectors_changed:%d\n",
>
