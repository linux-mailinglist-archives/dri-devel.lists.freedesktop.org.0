Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2821CFB9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 08:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D96E176;
	Mon, 13 Jul 2020 06:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70916E0F2;
 Mon, 13 Jul 2020 06:32:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l17so12154185wmj.0;
 Sun, 12 Jul 2020 23:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QPb+Ou4Nfbq4PIi1UZykCwKUnQ4n6w1QsHNkKepASo0=;
 b=Tc6qMqUSO9yd+No46p+3VZaiCkQz7TQoaa22nRESfECs3FcRYRYWx5jNliEHlP+zNF
 IMvTogJaSYmij/+yfydYGi+rNp9UTz64flg38oVBRgVFRKC1kSUNqQ0Ko4WjTwTimMsI
 dtgjceO895GYTE8QT3BEKwUj8jY/e996chWgQ46DVMsdXU7oJNAATnKyp4E7Bap2V8h9
 J18/cGH/b7LhMkB2rFeYqMEkDdgBX59fzkMltQLmVaiGrUTEy67lOban27BiG7iSwHT3
 vk8xP9TK4z+jdbr7OVW/awV8Xcxuq7bNnO2oh51ql4howEUmOPsNi/w6NrFkyZ5ZvmS8
 2JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPb+Ou4Nfbq4PIi1UZykCwKUnQ4n6w1QsHNkKepASo0=;
 b=V7PV3fPDfHQkxiOh5ALUBSq8mAzDkMpWrATJ0mDB3amBezBfBXWbMARd5AhYXtWbma
 lPAGVPq/DNujTWTu07EWA3gtxsVuU+s/YaOdXVeqp9giO6byWrKfRWCfqEgTstzy1I7q
 tWNOb3n28IKTmRhbyy1PFHD8GBme3D+WHRtTzZw5NPOYPNJjuwhgZfAC8U+hjWjzQnr5
 037iE47P79DCOQVrIAL11dqX1OibjpyjJqT4HM7iM1a0sPh9YDRJuF3DlroXSBlWbe0l
 ogAtVia34/FG2vK/flZ2DguRpLIkTt4+Zu7XVxx1Hz6nM04taXqjhMYSm7HTAAg6ECAj
 06uA==
X-Gm-Message-State: AOAM530FRCTB2ab0Q9bWP+yPksm8GquzIP2YC2F/JkFqYI9psVxiH4YA
 uqKfvmAfQbdlLkrilwehixElwFFfK4Ep6KANP6Y=
X-Google-Smtp-Source: ABdhPJwtmLkoBDFIQzDYJKb3x7imJR9/4fT8sbqz0NflsoC92ZNtel0WsaIODvDBCqb6eUTNh09dKdSGkvFcLp4fFb0=
X-Received: by 2002:a1c:2602:: with SMTP id m2mr18229896wmm.50.1594621954326; 
 Sun, 12 Jul 2020 23:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKGbVbtYusvURFcUyQtgUycNJPAQyDGDaLXW8qw-x49DqfKmQA@mail.gmail.com>
 <20200619075900.3030696-1-andrey.lebedev@gmail.com>
 <bd4370f5-6fb4-d32f-5ca4-02e56526f47d@gmail.com>
In-Reply-To: <bd4370f5-6fb4-d32f-5ca4-02e56526f47d@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 13 Jul 2020 14:32:23 +0800
Message-ID: <CAKGbVbt3ahDqYNC3jCYe19A2PmEk6iS9bT44XPfr0gfWoWjHjA@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Expose job_hang_limit module parameter
To: Andrey Lebedev <andrey.lebedev@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrey Lebedev <andrey@lebedev.lt>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next:
https://cgit.freedesktop.org/drm/drm-misc/

Sorry for the late response.

Regards,
Qiang

On Tue, Jul 7, 2020 at 12:17 AM Andrey Lebedev <andrey.lebedev@gmail.com> wrote:
>
> Hello guys,
>
> What is the status of this patch? Was this committed to any branch? Is
> it pending for merge to the mainline? Do I have to do anything in order
> to make it mergeable?
>
> On 6/19/20 10:58 AM, Andrey Lebedev wrote:
> > From: Andrey Lebedev <andrey@lebedev.lt>
> >
> > Some pp or gp jobs can be successfully repeated even after they time outs.
> > Introduce lima module parameter to specify number of times a job can hang
> > before being dropped.
> >
> > Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> > ---
> >
> > Now all types are correct (uint).
> >
> >   drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
> >   drivers/gpu/drm/lima/lima_drv.h   | 1 +
> >   drivers/gpu/drm/lima/lima_sched.c | 5 +++--
> >   3 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> > index a831565af813..ab460121fd52 100644
> > --- a/drivers/gpu/drm/lima/lima_drv.c
> > +++ b/drivers/gpu/drm/lima/lima_drv.c
> > @@ -19,6 +19,7 @@
> >   int lima_sched_timeout_ms;
> >   uint lima_heap_init_nr_pages = 8;
> >   uint lima_max_error_tasks;
> > +uint lima_job_hang_limit;
> >
> >   MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
> >   module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
> > @@ -29,6 +30,9 @@ module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
> >   MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
> >   module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
> >
> > +MODULE_PARM_DESC(job_hang_limit, "number of times to allow a job to hang before dropping it (default 0)");
> > +module_param_named(job_hang_limit, lima_job_hang_limit, uint, 0444);
> > +
> >   static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
> >   {
> >       struct drm_lima_get_param *args = data;
> > diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
> > index fdbd4077c768..c738d288547b 100644
> > --- a/drivers/gpu/drm/lima/lima_drv.h
> > +++ b/drivers/gpu/drm/lima/lima_drv.h
> > @@ -11,6 +11,7 @@
> >   extern int lima_sched_timeout_ms;
> >   extern uint lima_heap_init_nr_pages;
> >   extern uint lima_max_error_tasks;
> > +extern uint lima_job_hang_limit;
> >
> >   struct lima_vm;
> >   struct lima_bo;
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index e6cefda00279..1602985dfa04 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -503,8 +503,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
> >
> >       INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> >
> > -     return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
> > -                           msecs_to_jiffies(timeout), name);
> > +     return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> > +                           lima_job_hang_limit, msecs_to_jiffies(timeout),
> > +                           name);
> >   }
> >
> >   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> >
>
> --
> Andrey Lebedev aka -.- . -.. -.. . .-.
> Software engineer
> Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
