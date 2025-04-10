Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993FA84574
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601C10E9C7;
	Thu, 10 Apr 2025 13:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZNu4WACG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25B510E364;
 Thu, 10 Apr 2025 13:56:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so1307713a12.0; 
 Thu, 10 Apr 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744293414; x=1744898214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yum3T7yQTn952jDZXc692dt97lil51SSA4QJdTtpPXQ=;
 b=ZNu4WACGWsBLHEqGFEhvfXXaXSarF5ImUwfPgASZOymSvBzqF5EFkkorHSznZcElky
 BgAuWQPQsAkIhUGYa7huq1KJJBIRuk5IEIWddSB7qDe7L4rh801uxN212Il+th9x0Yh1
 QX+iQpOq08OsgbEiwTOSKfqeIj8GOtkRqpteWI0i9XgmyiGDPxxKCRnUJdPeUojtE0fX
 13nvYkjeeWiBngz9U+8ijSjlLWBRoRP/tcPwF3foqdnblydbro/8dMyezd7MihIVz2PL
 scmvpx9uQK82nSPrx1VP46YeC2asWgwTrYmyW43uy7Kh2CbhBvmub+fCjjePBPiCofY4
 Evsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744293414; x=1744898214;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yum3T7yQTn952jDZXc692dt97lil51SSA4QJdTtpPXQ=;
 b=N97wSRo+MK+FAu3Zcct2gUQX//p/IGDYJJ3Pzx66xajdinD/CJByMzAlhpkgRqEDjP
 e4bA6RujXERSbKelxqVEOqH7EaFBmlpeqMG/E5uhjZAp3X2au1tjtzpaJIkXZHsjQ+KT
 tDxSw8Wux1zQ9hyOFFoSky0Cba7rt54EuQPrVOo8ylKokXiE4l4qQa9SH8XURKpGVM/i
 unJXN9msbQni8kdT/yI0QSjv5dWGPLguJXi4bDLGNNwCx77bvl5bZHZ5AJgutDS7oGjd
 Rz+eO0z1O3FVguyRWRaM1W2iV/iskyKxw8W98sCQFG7w7Q4lfWelHpAc44Zq4qR7Bqqi
 St/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkt9z7ahLoc6BkbEWj0cmT/BkRCc6c1u/mUrqZbG+tUmIZSeaXVgGyp03nz1IYwbo+JOzhu1ZVOow=@lists.freedesktop.org,
 AJvYcCXy4+HeJCfWJlWZdPcMAqzXe21VSE1fyRshVtLqbY97q/wrqyoNVsZUD/ioR2c1To+6s10g2g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ8gwF/yEjn5Cbr4l6/6h/F/S02Sb2reGNt5+5IKWnm90afUyd
 w6azYFztuxNi/weY/Wnpn2t6zVT6GL0DzrH1jSdFa1c1HXHju66fBZIM0oVZuvnJTUgkZEsgGAd
 oh2DxUF9tkVd10hPTrKrI0uH2rEDPZuy+euo=
X-Gm-Gg: ASbGncv2VZQHVguK/8whWmN7xQ3RU7d70LUcIiDZuZ52l8AjasZCpD/JLsCewu9n9qj
 HsIJNUQY3QGjhTR85Owzd6xsDxTTUv8q4Gv+bCk+/Ox8p7RkGDcmyY+c3TGajo6IgysQuwi67zD
 UIBpIVaE459zsLleCnTc7l4KU=
X-Google-Smtp-Source: AGHT+IGNB/0Ui+PMcaW/5HRRzjW9ClvoQp00+ZIsAe/KuJa4brQMtaq2fnVcJJdSGw8G6dTuXIclqZvscPkwqfOE+7o=
X-Received: by 2002:a05:6402:2803:b0:5e4:92ca:34d0 with SMTP id
 4fb4d7f45d1cf-5f32927a5cdmr2749090a12.20.1744293413620; Thu, 10 Apr 2025
 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
 <20250408154637.1637082-2-nunes.erico@gmail.com>
 <CAKGbVbt-Cfp_D3WH3o1Y=UUQzf-sM0uikZXO1MFRxt2P72gjJg@mail.gmail.com>
 <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
In-Reply-To: <e24e5e05-5ffd-440f-b9d9-8a0f792cc7c8@amd.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 10 Apr 2025 21:56:42 +0800
X-Gm-Features: ATxdqUFBovrvIbkOzZ4JhHupAwR-1tbYTdrQsr8RpEgQyDjz9E7DdN1WMWsf_fk
Message-ID: <CAKGbVbthUxOxtZ+baT=vrNE1u6fzN48K1G5dtZBqfTBc7jEuYA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/lima: implement the file flush callback
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Erico Nunes <nunes.erico@gmail.com>, 
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

On Thu, Apr 10, 2025 at 8:35=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.04.25 um 11:33 schrieb Qiang Yu:
> > On Tue, Apr 8, 2025 at 11:48=E2=80=AFPM Erico Nunes <nunes.erico@gmail.=
com> wrote:
> >> With this callback implemented, a terminating application will wait fo=
r
> >> the sched entity to be flushed out to the hardware and cancel all othe=
r
> >> pending jobs before destroying its context.
> > We do flush when file release in lima_ctx_mgr_fini. Why do we wait here
> > in flush? What's the difference?
>
> Waiting for submissions when you release the file descriptor is actually =
a bad idea since that can prevent SIGKILL from acting immediately. For exam=
ple the OOM killer absolutely doesn't like that and eventually calls panic(=
).
>
> Flush is called either manually, on process termination or when you send =
a SIGTERM. This should then wait for any I/O to complete.
>
> The idea is now that you can then still send a SIGKILL to abort waiting f=
or the I/O as well and so get pending GPU operations not submitted to the H=
W.
>
> The DRM scheduler helps doing that by providing the drm_sched_entity_flus=
h() and drm_sched_entity_fini() functions.
>
> When there is still pending work when drm_sched_entity_fini() is called a=
 callback to kill it is installed and the job just freed instead of execute=
d.
>
So the difference is we can always wait in flush, but better not in
release when SIGKILL?

> >
> >> This prevents applications with multiple contexts from running into a
> >> race condition between running tasks and context destroy when
> >> terminating.
> >>
If implementing flush callback fix the problem, it must not be when SIGKILL=
.
Could you describe the problem and how this fix solves it? As I don't under=
stand
how the above difference could fix a race bug.

> >> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> >> ---
> >>  drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
> >>  drivers/gpu/drm/lima/lima_ctx.h |  1 +
> >>  drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
> >>  3 files changed, 35 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/li=
ma_ctx.c
> >> index 0e668fc1e0f9..e8fb5788ca69 100644
> >> --- a/drivers/gpu/drm/lima/lima_ctx.c
> >> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> >> @@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
> >>         xa_destroy(&mgr->handles);
> >>         mutex_destroy(&mgr->lock);
> >>  }
> >> +
> >> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
> >> +{
> >> +       struct lima_ctx *ctx;
> >> +       unsigned long id;
> >> +
> >> +       mutex_lock(&mgr->lock);
> >> +       xa_for_each(&mgr->handles, id, ctx) {
> >> +               for (int i =3D 0; i < lima_pipe_num; i++) {
> >> +                       struct lima_sched_context *context =3D &ctx->c=
ontext[i];
> >> +                       struct drm_sched_entity *entity =3D &context->=
base;
> >> +
> >> +                       timeout =3D drm_sched_entity_flush(entity, tim=
eout);
> >> +               }
> >> +       }
> >> +       mutex_unlock(&mgr->lock);
> >> +       return timeout;
> >> +}
> >> diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/li=
ma_ctx.h
> >> index 5b1063ce968b..ff133db6ae4c 100644
> >> --- a/drivers/gpu/drm/lima/lima_ctx.h
> >> +++ b/drivers/gpu/drm/lima/lima_ctx.h
> >> @@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *m=
gr, u32 id);
> >>  void lima_ctx_put(struct lima_ctx *ctx);
> >>  void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
> >>  void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
> >> +long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
> >>
> >>  #endif
> >> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/li=
ma_drv.c
> >> index 11ace5cebf4c..08169b0d9c28 100644
> >> --- a/drivers/gpu/drm/lima/lima_drv.c
> >> +++ b/drivers/gpu/drm/lima/lima_drv.c
> >> @@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_drive=
r_ioctls[] =3D {
> >>         DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_REND=
ER_ALLOW),
> >>  };
> >>
> >> -DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
> >> +static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
> >> +{
> >> +       struct drm_file *file =3D filp->private_data;
> >> +       struct lima_drm_priv *priv =3D file->driver_priv;
> >> +       long timeout =3D MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
> >> +
> >> +       timeout =3D lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
> >> +
> >> +       return timeout >=3D 0 ? 0 : timeout;
> >> +}
> >> +
> >> +static const struct file_operations lima_drm_driver_fops =3D {
> >> +       .owner =3D THIS_MODULE,
> >> +       .flush =3D lima_drm_driver_flush,
> >> +       DRM_GEM_FOPS,
> >> +};
> >>
> >>  /*
> >>   * Changelog:
> >> --
> >> 2.49.0
> >>
>
