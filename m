Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20C276F449
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B18410E225;
	Thu,  3 Aug 2023 20:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0FB10E227
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691095993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Pme+UrjTii3z9xalltrhriRoJjNQ+9U+uj1gMPEOw=;
 b=RxaonGui+NfsQU0pDQNVBmBZ5MvWAXS2VjIGkLZs+8nwqPDCpT1TJdPpD7q+CN8FDLTxeq
 Q+FFypFxBxZmlaz67MFP1uWe0We6HZtLFhbv/3hdkCIGbX2UPiRTLEZ5Ox4IoBPH4IaK5/
 0fJ2Mu7WswX/RhLoJxPx0TUhhOZqkk0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-QvQkqi66PR-lz_t0Tfp9XQ-1; Thu, 03 Aug 2023 16:53:10 -0400
X-MC-Unique: QvQkqi66PR-lz_t0Tfp9XQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-4fe08579d93so1370231e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 13:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691095989; x=1691700789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a5Pme+UrjTii3z9xalltrhriRoJjNQ+9U+uj1gMPEOw=;
 b=FXjanIgBpJ1ojiti67RnFQDAE4ueRb8sqcqxeOBbjXXrKSzM/fPePy25Aq7bq1dkXn
 EoHD2tInrbkycK3qZ0NQGg/S9oG5eaWi/CGMtujsp4tvbR+zYb23/n9eKRbs7XIPs6xi
 +lsCH+GjYP6TX4qhl0SwqeOwVLjyppSDM3aMc8l3uwBSZmTrRU5rm3PQFb5VwFn9RKMT
 WGCGivNqMfw3uuaqrr/6uHR6IMQtB393kXN4JidtQq2Szn1BOnjFfGb02KVkTRAaZhWp
 Bz/VpyJQOwjyGbGoZuWAOG31tfKedxhg3tPW9aIGptsXp0OKBCVolrfNlh2u+3h1ax1F
 bP0g==
X-Gm-Message-State: ABy/qLaF+446K4+BmBGW9A9asQ4K2wBYs0AhD6XL6yn6pxgoMZKJIbPm
 USyEjhtdRS79Z9KjEjrvbboWzNWHaEyhjNm+VhNgS7M6htXcuHKuKvNl3E022PlCM1k6tLtuOo6
 h53Qsb0+jHg/s8xfEV2Jlpa8YmrdqAakfFIjuvVyFNL3k
X-Received: by 2002:a05:6512:2521:b0:4f7:6775:2a66 with SMTP id
 be33-20020a056512252100b004f767752a66mr9972379lfb.53.1691095988807; 
 Thu, 03 Aug 2023 13:53:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGdNhzJQFA3LnvK9G4sJ2+HTEp46+ureNYTERhbpB9hHUS/4gHIg2y2r64vWvjW8i/MQSTa49cesFh2FRazrzY=
X-Received: by 2002:a05:6512:2521:b0:4f7:6775:2a66 with SMTP id
 be33-20020a056512252100b004f767752a66mr9972363lfb.53.1691095988422; Thu, 03
 Aug 2023 13:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230729225008.30455-1-mairacanal@riseup.net>
In-Reply-To: <20230729225008.30455-1-mairacanal@riseup.net>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 3 Aug 2023 22:52:57 +0200
Message-ID: <CA+hFU4xQnFM+JPkjOd=H2yOV1hzCntLGBH2Bh15dXjF2X4axJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: avoid race-condition between flushing and
 destroying
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 30, 2023 at 12:51=E2=80=AFAM Ma=C3=ADra Canal <mairacanal@riseu=
p.net> wrote:
>
> After we flush the workqueue at the commit tale, we need to make sure
> that no work is queued until we destroy the state. Currently, new work
> can be queued in the workqueue, even after the commit tale, as the
> vblank thread is still running.
>
> Therefore, to avoid a race-condition that will lead to the trigger of a
> WARN_ON() at the function vkms_atomic_crtc_destroy_state(), add a mutex
> to protect the sections where the queue is manipulated.
>
> This way we can make sure that no work will be added to the workqueue
> between flushing the queue (at the commit tail) and destroying the
> state.
>
> Signed-off-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 10 +++++++++-
>  drivers/gpu/drm/vkms/vkms_drv.c  |  1 +
>  drivers/gpu/drm/vkms/vkms_drv.h  |  8 ++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 3c5ebf106b66..e5ec21a0da05 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -49,7 +49,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct=
 hrtimer *timer)
>                 state->crc_pending =3D true;
>                 spin_unlock(&output->composer_lock);
>
> +               mutex_lock(&state->queue_lock);
>                 ret =3D queue_work(output->composer_workq, &state->compos=
er_work);
> +               mutex_unlock(&state->queue_lock);
>                 if (!ret)
>                         DRM_DEBUG_DRIVER("Composer worker already queued\=
n");
>         }
> @@ -129,6 +131,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crt=
c)
>
>         __drm_atomic_helper_crtc_duplicate_state(crtc, &vkms_state->base)=
;
>
> +       mutex_init(&vkms_state->queue_lock);
>         INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
>
>         return &vkms_state->base;
> @@ -142,6 +145,9 @@ static void vkms_atomic_crtc_destroy_state(struct drm=
_crtc *crtc,
>         __drm_atomic_helper_crtc_destroy_state(state);
>
>         WARN_ON(work_pending(&vkms_state->composer_work));
> +       mutex_unlock(&vkms_state->queue_lock);
> +
> +       mutex_destroy(&vkms_state->queue_lock);
>         kfree(vkms_state->active_planes);
>         kfree(vkms_state);
>  }
> @@ -155,8 +161,10 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *=
crtc)
>                 vkms_atomic_crtc_destroy_state(crtc, crtc->state);
>
>         __drm_atomic_helper_crtc_reset(crtc, &vkms_state->base);
> -       if (vkms_state)
> +       if (vkms_state) {
> +               mutex_init(&vkms_state->queue_lock);
>                 INIT_WORK(&vkms_state->composer_work, vkms_composer_worke=
r);
> +       }
>  }
>
>  static const struct drm_crtc_funcs vkms_crtc_funcs =3D {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index dd0af086e7fa..9212686ca88a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -84,6 +84,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_s=
tate *old_state)
>                 struct vkms_crtc_state *vkms_state =3D
>                         to_vkms_crtc_state(old_crtc_state);
>
> +               mutex_lock(&vkms_state->queue_lock);

I haven't looked at the code in detail but doesn't this need to be
unlocked after flush_work again?

>                 flush_work(&vkms_state->composer_work);
>         }
>
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index c7ae6c2ba1df..83767692469a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -89,6 +89,14 @@ struct vkms_crtc_state {
>         struct vkms_writeback_job *active_writeback;
>         struct vkms_color_lut gamma_lut;
>
> +       /* protects the access to the workqueue
> +        *
> +        * we need to hold this lock between flushing the workqueue and
> +        * destroying the state to avoid work to be queued by the worker
> +        * thread
> +        */
> +       struct mutex queue_lock;
> +
>         /* below four are protected by vkms_output.composer_lock */
>         bool crc_pending;
>         bool wb_pending;
> --
> 2.41.0
>

