Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BD9786BE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 19:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66110ED55;
	Fri, 13 Sep 2024 17:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e38URErb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A6F10ED55
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 17:28:59 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3a08c907245so3579585ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726248538; x=1726853338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxOXBnMiL21PBJM6uKoe7HLZ86EpzfC5VehNtOteI+g=;
 b=e38URErbGJ5Dxm4AURpiRKnGF7rynpLFNpNC9mqyVRJxuupCtR4dJdnGEz3l8qluF5
 ClqcKFb4WIyzSZgEc+l3MkohOSWEo018UoB9vSSB7jHke7RTBzgp3ixWZ4mBH8CLFjuh
 ka0hSZNoPZukdGo+EUQW3NXSS1NSM/bKrUmxrq5MfDKOAZ89/qq9r4tdzKmuneWkEqYu
 blhUEh1aahQ8Xsd6AAk0GaRvW9ZsYOf0bYSvV+1UrQl8wE6u1mitfnF5PoHZxtk0r9IG
 irL80tsW2We7xwQs/eetbNwNoI+7GuImWkLA/7GpHIZ1vPLfblMNTnzWLfQkUWunhf8n
 qRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726248538; x=1726853338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxOXBnMiL21PBJM6uKoe7HLZ86EpzfC5VehNtOteI+g=;
 b=XzEpogJAFtTEpNmj9ShHfcEp900wAMoZAIGpuB5I7SV3rxXuUTJiWBgpaohF4Q0UvS
 hquhhxFBSjK2hl9BH1Dcu/4DjpUby6sGNvucK1/llApW0ZkcOZR6f7AoZPxxNUpmPlNJ
 vDSFTmJru8jywVI5mFEasUkR3u4QWS0lOlGuv6V/usX35X0dm2iVGBvdk4Je96iMvmaW
 aXqxBPjRVZy0A7J14zgQtpeNrNeUEuqD2IsVUGdvq9VwZFWjs7j7x7D6PJOdVC/x6nyV
 VlHSvpFlUd1KpJSxB2vVibyYtrhGmjHP3ACYDOZyKMeDtYYfryld/Sg2z7fy3Pj7okIT
 7PVQ==
X-Gm-Message-State: AOJu0YxTuJGRGSTq9JupwF+JXc/iWb5Bu6IOiaR7nIAve47wshyi8Z4i
 IfUpq9lTm9sVo1NavSgwbuOLGy9S15Mpu8HO1TjhyytvatY5r/xErQt/rFMDXVregS2BldxAcG0
 pRtAes2zQt9jOKDEXCHCAvsusD3E=
X-Google-Smtp-Source: AGHT+IEKX2EIDXwhlSkFf4Al7/dq4lAUUmNHq96waCVvHxlWAdUIptNZ7AMZnQS7FMl3hYwUP2PcTwOAHigWf/TpBXo=
X-Received: by 2002:a92:c548:0:b0:3a0:8dcb:b033 with SMTP id
 e9e14a558f8ab-3a08dcbb224mr22846555ab.24.1726248538452; Fri, 13 Sep 2024
 10:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240913165326.8856-1-robdclark@gmail.com>
 <fa243d3e-abe2-47d9-928f-70e24065baf1@mailbox.org>
In-Reply-To: <fa243d3e-abe2-47d9-928f-70e24065baf1@mailbox.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Sep 2024 10:28:46 -0700
Message-ID: <CAF6AEGtFJu5DEuA+Urv7zdrsO-zV-y0o0wQnTdGojTNjwwRqNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix dynamic job-flow control race
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Asahi Lina <lina@asahilina.net>, Luben Tuikov <ltuikov89@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Danilo Krummrich <dakr@redhat.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 13, 2024 at 10:03=E2=80=AFAM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 2024-09-13 18:53, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Fixes a race condition reported here: https://github.com/AsahiLinux/lin=
ux/issues/309#issuecomment-2238968609
> >
> > The whole premise of lockless access to a single-producer-single-
> > consumer queue is that there is just a single producer and single
> > consumer.  That means we can't call drm_sched_can_queue() (which is
> > about queueing more work to the hw, not to the spsc queue) from
> > anywhere other than the consumer (wq).
> >
> > This call in the producer is just an optimization to avoid scheduling
> > the consuming worker if it cannot yet queue more work to the hw.  It
> > is safe to drop this optimization to avoid the race condition.
> >
> > Suggested-by: Asahi Lina <lina@asahilina.net>
> > Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index ab53ab486fe6..1af1dbe757d5 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1020,8 +1020,7 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
> >  void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> >                     struct drm_sched_entity *entity)
> >  {
> > -     if (drm_sched_can_queue(sched, entity))
> > -             drm_sched_run_job_queue(sched);
> > +     drm_sched_run_job_queue(sched);
> >  }
> >
> >  /**
>
> The entity parameter is unused now.

Right.. and we probably should collapse drm_sched_wakeup() and
drm_sched_run_job_queue()..

But this fix needs to be cherry picked back to a bunch of release
branches, so I intentionally avoided refactoring as part of the fix.

BR,
-R

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
