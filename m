Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2919B4B2E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78CD10E1BE;
	Tue, 29 Oct 2024 13:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZHUet2bS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C3310E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:47:22 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7c3d8105646so651447a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730209642; x=1730814442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/D7WfJDevvalVYpHoiCjOaBH12oKtVHLCOYsUvDV9HY=;
 b=ZHUet2bSIFyRV6bPmqsQTgxTq+wyNWZKiXEoC2BS8v5Vl4qjHsrp19zEYYeE8doS4A
 uIbG4yJ2KmEvSEdxvyPYTjS8MndarmO8UqyGfk/lIEyncrzqWC95yMbLpMVK3ssLQTVx
 sB0GwaX1u4Hw50G5+qjviyzNrcB3f2GvWnbwVuNe+DJzMUklQrDRO+KzHkCjcMYFeIoS
 2r1ec68bzK5gzDL9TaDYrKthCdDc7vJC7mpHDwr93rUuFa/z244yAi9hpJloUGQWUV00
 sdu0KRMbTymVfzFgeklT33Wndg6O8TuUDcuE/BAdIlSIyLQn1hEo4laMBjeKL9+Utk3p
 Ms1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730209642; x=1730814442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/D7WfJDevvalVYpHoiCjOaBH12oKtVHLCOYsUvDV9HY=;
 b=Upc+AIZDP33woEP1BrM6UFPwK/8115+r8i67mjCCvYG+wpo0qpv5SrsTr/UfbR8h/O
 XuMxlzXgDtjwMDMt1nyEABctbQJQOtjwCkw9zpGIN3+OQ2UL/y30Abmc/IkkJ8vHOpqR
 yRegnhJWVQVGDPy3VxMwhZX1vBAp6kOUK3iKrhZUjgyDzckPxo5eAPTBAk2LEZr5ygha
 67v2HWMN6Mzpxnw8LwnQBCRdIz37qo+e5/qR6uMLSdliu4X05mh8Mma1eX0hz13NsTAT
 tC69DJ9ubLLtHAt59PrXehnGnVIUFRBedn+xHCrenTVuNQ1TK42bCPE5L5PsK0FJi7Xg
 qPLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtjBypLWLksY1IuBoasgwSKakICnGxDjhhjat6VMiKrIVi1LgitL0HhBFebXUNtF+rA6EFkFBzXbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs8g7GDEeDAXtQLCikcKtKADF8hoIDc8Opc5w1QKvijvWTTmVs
 HTup66R/yW2GGqi09ViaIFZ7121boCXDZPTQ02qUhKzkM/1XlTapL6ogirr5jC/XVEUuiMIeMdx
 GrSUm1789M4dVZHsfrZO63rZSyIw=
X-Google-Smtp-Source: AGHT+IFq+zZ2uEaa76yV0X76vhFVcbVRtvW+9G+W15c8OXtY7NLGNXCInOVPkBeSu5C3j5eWFIbRhAvlOsTNmWAeLjQ=
X-Received: by 2002:a05:6a20:2590:b0:1cf:52f5:dc with SMTP id
 adf61e73a8af0-1d9a83a67e3mr8148565637.1.1730209642294; Tue, 29 Oct 2024
 06:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241029133819.78696-2-pstanner@redhat.com>
In-Reply-To: <20241029133819.78696-2-pstanner@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 09:47:10 -0400
Message-ID: <CADnq5_NNnQvLG+dmj+RLijxAOg0jEuih+dqc3tin2EiK5jf2_g@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Document purpose of drm_sched_{start,stop}
To: Philipp Stanner <pstanner@redhat.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Oct 29, 2024 at 9:39=E2=80=AFAM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> drm_sched_start()'s and drm_sched_stop()'s names suggest that those
> functions might be intended for actively starting and stopping the
> scheduler on initialization and teardown.
>
> They are, however, only used on timeout handling (reset recovery). The
> docstrings should reflect that to prevent confusion.
>
> Document those functions' purpose.
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index eaef20f41786..59fd49fc790e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -601,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct=
 *work)
>   * callers responsibility to release it manually if it's not part of the
>   * pending list any more.
>   *
> + * This function is typically used for reset recovery (see the docu of
> + * drm_sched_backend_ops.timedout_job() for details). Do not call it for
> + * scheduler teardown, i.e., before calling drm_sched_fini().
>   */
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_jo=
b *bad)
>  {
> @@ -673,7 +676,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, =
struct drm_sched_job *bad)
>          */
>         cancel_delayed_work(&sched->work_tdr);
>  }
> -
>  EXPORT_SYMBOL(drm_sched_stop);
>
>  /**
> @@ -681,6 +683,10 @@ EXPORT_SYMBOL(drm_sched_stop);
>   *
>   * @sched: scheduler instance
>   *
> + * This function is typically used for reset recovery (see the docu of
> + * drm_sched_backend_ops.timedout_job() for details). Do not call it for
> + * scheduler startup. The scheduler itself is fully operational after
> + * drm_sched_init() succeeded.
>   */
>  void drm_sched_start(struct drm_gpu_scheduler *sched)
>  {
> --
> 2.47.0
>
