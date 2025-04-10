Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B8A83ECA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFB410E86A;
	Thu, 10 Apr 2025 09:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dvnFPoy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC4010E84F;
 Thu, 10 Apr 2025 09:33:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so1247662a12.1; 
 Thu, 10 Apr 2025 02:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744277618; x=1744882418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuO+brZQXiPJghd9emj1QQSfvrqSf5T0v7ZqHbwoZ40=;
 b=dvnFPoy1f5kqKt1t++0M3D53d+rv5+l3oX6Oq2Pppj1tE/D38C81eWnhQ/h9AVelEX
 IKfkPh4M8c5CxsQ4qK9GyUzWimO9SNO+9vlP4w8H0Uct7ozxbNTh2bp60lvWv5VvL1C8
 7OPUvyuQ+wztix6TSZNVfii/vecZnm3tV/V5vRxFM6neVTDxeEvuFHKDw0Wv+99e8xy5
 POQLMpoC7v41Bpzh9FuKKdjiqV5yuQiA4d5LPC9si6/HOWZL+wwR7Tr9Iz4l1Fvbt99Q
 /1Eg8UeU5bnfCCTMleDOOWZgdZqXod3zVHDRf7bW1VZxnl4aFtgIp7qSgWPxeR+htLDc
 6/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744277618; x=1744882418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EuO+brZQXiPJghd9emj1QQSfvrqSf5T0v7ZqHbwoZ40=;
 b=dNrKJwLXAubenB4yvPA5tgT1oOZZwHaZ0WDPIj77yNYDhb9ErGLKP3qhO2uKUV96cb
 5L0vKQVoItSeIjPEKBg6izgUjrFop/QQmAxJAgZTTyruTkfIlL9gEnykN1YTyMgmoFUs
 CjxwuXJCCqDcpUkpOoM+p7HRJaBArNntPiTHL5uL2lqX/ftJBZ3Qc2YI1TYQfodkiRPj
 42qOpki+NwylvXCgXNmJAAGCYpp/gnNKFmD1n0oAQO6MWstrOvKd45bvzhDxZcqug27y
 5TEkmd/ONJffSylFjGCmrrebcdxYJLqNkKDdhWOPFnhmuwfBKnZNvNuhVHKrO6wHf7+v
 6v+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw2/r8VBUVSvxNnnK4+46v1HYQdyg8g/miqFj+0bcw5gv1pKTL4oYhckEMi6kv6c3PEUBATkTCMc0=@lists.freedesktop.org,
 AJvYcCVAXZ4QhfE3OxovSAUJcVDqb8CNvg2iy8vW9OMFChuzCLxve1AnIL4XH/0VBYUxv4H1LTPQ6w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUjDGfY6eqM1OrdHcGB+QLdeUiYo8eeZULI/qpAfZnHlyv0jbq
 1ytXIb9d9dM93iZHzlitS7GAZl47Q/MMF/IoLQoZ/5ssxE5APjE3JVGz80AfdmNl3d95SeP2Dm8
 NU0bCP5kTj6u+aGy5W8LqgmeXJb4=
X-Gm-Gg: ASbGnctYtW5MCaGidVTZda/Szn3IemqWpAryqehGWfRdEWkVxwlRQsBkuBSjF0o53F+
 FIOSw+4nTlmangEv+GkFjNGBkE1c+ADGDeRdZIlc8Dcubidq3OxT1/Ocgr+YcYdfXA/IiauHuHn
 6mckx1Xc4kgF4TckNM+NL9tt8=
X-Google-Smtp-Source: AGHT+IHQpxLbZAQQ13zaynRJL2c9HbhMeYqq42dawThUnx8xlULHCBD0an0leDkn4bmxDdtdUt3JkBMCX4J9/G92nTw=
X-Received: by 2002:a05:6402:5187:b0:5e0:82a0:50dd with SMTP id
 4fb4d7f45d1cf-5f329308bbdmr1628324a12.27.1744277618359; Thu, 10 Apr 2025
 02:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
In-Reply-To: <20250408154637.1637082-2-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 10 Apr 2025 17:33:26 +0800
X-Gm-Features: ATxdqUEcyxfdU1-00StI0GqNWHnpq1Y0HdcuWsC3IvQXjDqGXE1seiA7fp9hAmM
Message-ID: <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: Erico Nunes <nunes.erico@gmail.com>
Cc: christian.koenig@amd.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
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

On Tue, Apr 8, 2025 at 11:48=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> With this callback implemented, a terminating application will wait for
> the sched entity to be flushed out to the hardware and cancel all other
> pending jobs before destroying its context.

We do flush when file release in lima_ctx_mgr_fini. Why do we wait here
in flush? What's the difference?

> This prevents applications with multiple contexts from running into a
> race condition between running tasks and context destroy when
> terminating.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_=
ctx.c
> index 0e668fc1e0f9..e8fb5788ca69 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.c
> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
>         xa_destroy(&mgr->handles);
>         mutex_destroy(&mgr->lock);
>  }
> +
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
> +{
> +       struct lima_ctx *ctx;
> +       unsigned long id;
> +
> +       mutex_lock(&mgr->lock);
> +       xa_for_each(&mgr->handles, id, ctx) {
> +               for (int i =3D 0; i < lima_pipe_num; i++) {
> +                       struct lima_sched_context *context =3D &ctx->cont=
ext[i];
> +                       struct drm_sched_entity *entity =3D &context->bas=
e;
> +
> +                       timeout =3D drm_sched_entity_flush(entity, timeou=
t);
> +               }
> +       }
> +       mutex_unlock(&mgr->lock);
> +       return timeout;
> +}
> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_=
ctx.h
> index 5b1063ce968b..ff133db6ae4c 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.h
> +++ b/drivers/gpu/drm/lima/lima_ctx.h
> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr,=
 u32 id);
>  void lima_ctx_put(struct lima_ctx *ctx);
>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
>
>  #endif
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_=
drv.c
> index 11ace5cebf4c..08169b0d9c28 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_i=
octls[] =3D {
>         DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_=
ALLOW),
>  };
>
> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
> +{
> +       struct drm_file *file =3D filp->private_data;
> +       struct lima_drm_priv *priv =3D file->driver_priv;
> +       long timeout =3D MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
> +
> +       timeout =3D lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
> +
> +       return timeout >=3D 0 ? 0 : timeout;
> +}
> +
> +static const struct file_operations lima_drm_driver_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .flush =3D lima_drm_driver_flush,
> +       DRM_GEM_FOPS,
> +};
>
>  /*
>   * Changelog:
> --
> 2.49.0
>
