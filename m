Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BAD9776DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 04:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09D10EC30;
	Fri, 13 Sep 2024 02:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmF/c9zD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E417B10EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:23:54 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6c35427935eso9497286d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 19:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726194234; x=1726799034; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPVsVFceR0WWI5d/ojpASw6tDyoPFdiM2e1qY8KWSm4=;
 b=EmF/c9zDWiTwTybb3sHjaB3lcJqiiUfI+f5zU5cVO262O6lWOErfhdgww8bYvm738c
 M3uU1oJNTYHpGAbZOzhm7WalSEthHYoQrc1PJBVExV/TML3rV8ktTDMIY1nWszyMfEvo
 KZxcJVhL2vPXimSctVqQ/2odQWyth7v4c5qrOiZP9GtNzpJvPKXlTXh/HPpO0a0zyd2z
 XuMQiKpApKLimWftWxEPMYsxqGb6dWsj/mrnoJFZCcTABbaun0qm9Wh5Xpo/5aeKI05X
 TyJXDby9VzGzmShhI1Ko7cU0+ssW+ubbgQPjmR97sk5zSRaidrBMcBIvLAprda/cu1FV
 I6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726194234; x=1726799034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPVsVFceR0WWI5d/ojpASw6tDyoPFdiM2e1qY8KWSm4=;
 b=a1Js6jZnRCTsob7ztEfvMn/aZCZA8A+Rl5bDv5ZTWqocgc/keNhMro9xa8xC/QYbOs
 3twUgEbAKT1875tPoTxBxkRtvTmnrvCUa76lbSusOK5NU9W3CbJWnAKA4NKxjOmSNvkx
 D7gA26PRoWfwWroWw1drprMCOonj85Nzup9tJ6cBxRpFPFoau6aOgi29Z+LQ66fAX3L4
 x993o/MxQiv/p6+M+bwvBYmSsVUT9NUkVMj14xcreaKUJ4dFJTSZi37gibKTLtEZEmg6
 pumUgMaAmrFRB3BUQ0LYXWCTkmqxuDo44kxzpopMQWpgweu1iC/jEsptGZ2ODBsJrBZr
 S4hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqynofDWKE8JhRdVNwfUVKctHbZLkblel/5Pd6nj4SKt1mk/NQeWB3pC0W2+7bI6Wp1SVgovPaaGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi6d6c/3NM+3QALdDWQUJyRMNX6COej+JP5Bj9eH/ZdDDAyHqJ
 guIkp1bNXlSH17xb/hCZPCDkVaRqI3L+tTkg242kP4Wq14Aa+vv1e6pvVcrY5EUUcbWU8TjEXJi
 avy+k5f4kWhLsfNJsmY66ubIReEU=
X-Google-Smtp-Source: AGHT+IE7ATrua7rsyqeOcJseYjVtTnE4hssxQiNmRKzesjoiGraR/SEm091yrLZIkqiIIy/oAkVbRqThLd1lUTb523s=
X-Received: by 2002:a05:6214:2e4a:b0:6c5:31d6:7749 with SMTP id
 6a1803df08f44-6c5736ea189mr65801846d6.44.1726194233773; Thu, 12 Sep 2024
 19:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-9-laoar.shao@gmail.com>
 <qqpiar6nlyuill6eng7safauo2xzzpx46cv6wku4xe42qsw47m@rirhsxrdzm2z>
In-Reply-To: <qqpiar6nlyuill6eng7safauo2xzzpx46cv6wku4xe42qsw47m@rirhsxrdzm2z>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 13 Sep 2024 10:23:17 +0800
Message-ID: <CALOAHbCRnqg8q-9KxNHZVfGUm5aO5_60X_sZB7TPB68EMz7mZA@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] drm: Replace strcpy() with strscpy()
To: Justin Stitt <justinstitt@google.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, alx@kernel.org, 
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 bpf@vger.kernel.org, netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
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

On Fri, Sep 13, 2024 at 5:28=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Hi,
>
> On Wed, Aug 28, 2024 at 11:03:21AM GMT, Yafang Shao wrote:
> > To prevent erros from occurring when the src string is longer than the
> > dst string in strcpy(), we should use strscpy() instead. This
> > approach also facilitates future extensions to the task comm.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_framebuffer.c     | 2 +-
> >  drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fr=
amebuffer.c
> > index 888aadb6a4ac..2d6993539474 100644
> > --- a/drivers/gpu/drm/drm_framebuffer.c
> > +++ b/drivers/gpu/drm/drm_framebuffer.c
> > @@ -868,7 +868,7 @@ int drm_framebuffer_init(struct drm_device *dev, st=
ruct drm_framebuffer *fb,
> >       INIT_LIST_HEAD(&fb->filp_head);
> >
> >       fb->funcs =3D funcs;
> > -     strcpy(fb->comm, current->comm);
> > +     strscpy(fb->comm, current->comm);
> >
> >       ret =3D __drm_mode_object_add(dev, &fb->base, DRM_MODE_OBJECT_FB,
> >                                   false, drm_framebuffer_free);
> > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i9=
15/i915_gpu_error.c
>
> There are other strcpy() in this file but it seems all control paths to
> the copies themselves stem from string literals, so it is probably fine
> not to also change those ones. But, if a v9 is required and you're
> feeling up to it, we should probably replace them too, as per [1].

will change them in the next version.
Thanks for your suggestion.

>
>
> > index 96c6cafd5b9e..afa9dae39378 100644
> > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > @@ -1412,7 +1412,7 @@ static bool record_context(struct i915_gem_contex=
t_coredump *e,
> >       rcu_read_lock();
> >       task =3D pid_task(ctx->pid, PIDTYPE_PID);
> >       if (task) {
> > -             strcpy(e->comm, task->comm);
> > +             strscpy(e->comm, task->comm);
> >               e->pid =3D task->pid;
> >       }
> >       rcu_read_unlock();
> > --
> > 2.43.5
> >
> >
>
>
> Reviewed-by: Justin Stitt <justinstitt@google.com>
>
> [1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcp=
y
>
> Thanks
> Justin



--=20
Regards
Yafang
