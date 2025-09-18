Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A28B8577C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91A810E1F5;
	Thu, 18 Sep 2025 15:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LcPriV37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE19210E1F5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:10:30 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-752f88e0b59so798951a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758208230; x=1758813030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJCD/GWaEbE7CpfeMPeup88gbNCvyKDHt8+xdjkZdx0=;
 b=LcPriV37LtIhjDetmioaMi/bXBZ6a6d/71GCXFjUyCh7NfJpXV15AX6FjYxeWs92Cm
 cIE1N3VRvmGTozg30eJc0SFX6IBWxOpaXp5ESHZkwKgQg/6Uty4L4r3jITcfKq5JAkKc
 G8KNe2YgKDnDncdP4bi84+9HJkitoDxQnjALQJbfsaWBJV11nwyowp/K5gE528ArmhO2
 SWBbETqojiqhbAh6mKPSve4PX4s6qJ4d8VVKTjOV88tA/VOodJK7an/twYjWc0Dkrrsf
 kHOa4kOgEDIvaLAZVu/6GpTj8XltiLE35lxxvbuH3LXcBA2aQMpjwmKpekDwsG62rFeZ
 pNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758208230; x=1758813030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJCD/GWaEbE7CpfeMPeup88gbNCvyKDHt8+xdjkZdx0=;
 b=wixUCYn7wJ7FonhHJAuBOb5QvNSCS4S/uT9EhOG2RTq2slTBIvRfwiVPNZezONkfAW
 vEurZdDe6EXTdA+7ygoPDtmzUOCNknUwKxRYaB+LE4bU9WXtAe6eSdl8SWMz35UMCkP2
 JW18lzukVj283FPcOZLYatKNV6xm0PvqNQMv3muwNwAGkKX17CK2wH4FPu2zyP5/na1k
 XHDqYhUq2mLcg1rSlYJvwWfxgD8ic75zHNGG98FWHp1QMO/l34Evda4YYNiChliU5yiq
 BKMDxPJZu+nq98FBrTv5wg2QyGuxFt1DMxlUyx3LfGcJWCz0UI9zFAZn4VCGysvrHsPY
 1yMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhE1gr9j8Hq1UWxscRtpIUDByorFBhzY9CM4wkoUAf5aujLIWgAvDb03QhH5oHcMNmBWmYuXj5Zu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTHHKApF8PGvmJvmIVs+9WLdT6uMm1uSBuBYEg71htJna/hrzc
 rogupczQdlRkh5P9CZYbs2hFM0jZIc+ki6sD0yqatQnNZtwh1Ofzv6yaki4ZvHmSNIAvxolLAHj
 zPHsqAYnsU80qT2U29awjWesqoVMGq74=
X-Gm-Gg: ASbGncsTlZqwJdufE3MQKqmekLqbAg7aWYrFKdE98d2XSUf0KGKrfpEkE3DGZj2aG1D
 hijngRD8MJV10lxyw6YVuGeHGqk5jQIgRbxorqWeekpNvz1EQRayaIRV65yZNgBVuDhB4Tt0w+Q
 Wr2P/gO/w/TT7h/xjDUt10erN2HDRGm06E1FFkP/H7XDXQ0fI4+pjfKmotGfw2kVFJCf6M7t0b3
 bHdIiLN7ty3wrpWxP1AV8gs
X-Google-Smtp-Source: AGHT+IGaCVAN30v8oUC6k3D0axrGZD4ceqkUUCjR54VGI6JUzof2ZcIwvXzYDlz9f+JwTiW6Yd2M0Obi9b8I3ofR9zo=
X-Received: by 2002:a05:6830:26c:b0:745:a3b2:9add with SMTP id
 46e09a7af769-7690184d707mr1696329a34.10.1758208229750; Thu, 18 Sep 2025
 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250812101119.2506-1-rk0006818@gmail.com>
 <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
In-Reply-To: <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Thu, 18 Sep 2025 20:40:17 +0530
X-Gm-Features: AS18NWC8-yp8H_ihIxT83iefQZgDeQeGh3iJwG5rYwAT5K09s35lEtBeLklSxbk
Message-ID: <CAKY2RyZr8XCR+nYt_eG49uJiAhc6nesac8hs6AQ8eEy+o9hyvg@mail.gmail.com>
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org
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

Hi Liviu,

On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Tue, Aug 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:
> > Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> > calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> > corresponding drm_err(), drm_warn(), and drm_info() helpers.
> >
> > The new drm_*() logging functions take a struct drm_device * as the
> > first argument. This allows the DRM core to prefix log messages with
> > the specific DRM device name and instance, which is essential for
> > distinguishing logs when multiple GPUs or display controllers are prese=
nt.
> >
> > This change aligns komeda with the DRM TODO item: "Convert logging to
> > drm_* functions with drm_device parameter".
> >
> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>

I just wanted to check if there=E2=80=99s anything else I should do for thi=
s
patch, or if it=E2=80=99s already queued for merging.

Thanks,
Rahul

> For future patches, when you make changes, please generate them with
>
> git patch -v<version>
>
> and include a change log so that reviewers can quickly figure out what
> has changed between emails without having to go back and forth.
>
> Best regards,
> Liviu
>
> > ---
> >  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 27 +++++++++++--------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index 2ad33559a33a..e4cc1fb34e94 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
> >  static int
> >  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
> >  {
> > +     struct drm_device *drm =3D kcrtc->base.dev;
> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
> >       struct komeda_pipeline *master =3D kcrtc->master;
> >       struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(kcrtc->base.st=
ate);
> > @@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
> >
> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
> >       if (err) {
> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> >                         mdev->dpmode, new_mode);
> >               goto unlock;
> >       }
> > @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
> >       if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {
> >               err =3D clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kcr=
tc_st));
> >               if (err)
> > -                     DRM_ERROR("failed to set aclk.\n");
> > +                     drm_err(drm, "failed to set aclk.\n");
> >               err =3D clk_prepare_enable(mdev->aclk);
> >               if (err)
> > -                     DRM_ERROR("failed to enable aclk.\n");
> > +                     drm_err(drm, "failed to enable aclk.\n");
> >       }
> >
> >       err =3D clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
> >       if (err)
> > -             DRM_ERROR("failed to set pxlclk for pipe%d\n", master->id=
);
> > +             drm_err(drm, "failed to set pxlclk for pipe%d\n", master-=
>id);
> >       err =3D clk_prepare_enable(master->pxlclk);
> >       if (err)
> > -             DRM_ERROR("failed to enable pxl clk for pipe%d.\n", maste=
r->id);
> > +             drm_err(drm, "failed to enable pxl clk for pipe%d.\n", ma=
ster->id);
> >
> >  unlock:
> >       mutex_unlock(&mdev->lock);
> > @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
> >  static int
> >  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
> >  {
> > +     struct drm_device *drm =3D kcrtc->base.dev;
> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
> >       struct komeda_pipeline *master =3D kcrtc->master;
> >       u32 new_mode;
> > @@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
> >
> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
> >       if (err) {
> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,",
> >                         mdev->dpmode, new_mode);
> >               goto unlock;
> >       }
> > @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
> >  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
> >                             struct komeda_events *evts)
> >  {
> > +     struct drm_device *drm =3D kcrtc->base.dev;
> >       struct drm_crtc *crtc =3D &kcrtc->base;
> >       u32 events =3D evts->pipes[kcrtc->master->id];
> >
> > @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   =
*kcrtc,
> >               if (wb_conn)
> >                       drm_writeback_signal_completion(&wb_conn->base, 0=
);
> >               else
> > -                     DRM_WARN("CRTC[%d]: EOW happen but no wb_connecto=
r.\n",
> > +                     drm_warn(drm, "CRTC[%d]: EOW happen but no wb_con=
nector.\n",
> >                                drm_crtc_index(&kcrtc->base));
> >       }
> >       /* will handle it together with the write back support */
> > @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc   =
*kcrtc,
> >                       crtc->state->event =3D NULL;
> >                       drm_crtc_send_vblank_event(crtc, event);
> >               } else {
> > -                     DRM_WARN("CRTC[%d]: FLIP happened but no pending =
commit.\n",
> > +                     drm_warn(drm, "CRTC[%d]: FLIP happened but no pen=
ding commit.\n",
> >                                drm_crtc_index(&kcrtc->base));
> >               }
> >               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> > @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct kom=
eda_crtc *kcrtc,
> >
> >       /* wait the flip take affect.*/
> >       if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {
> > -             DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->maste=
r->id);
> > +             drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->ma=
ster->id);
> >               if (!input_flip_done) {
> >                       unsigned long flags;
> >
> > @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_func=
s =3D {
> >  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
> >                          struct komeda_dev *mdev)
> >  {
> > +     struct drm_device *drm =3D &kms->base;
> >       struct komeda_crtc *crtc;
> >       struct komeda_pipeline *master;
> >       char str[16];
> > @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *k=
ms,
> >               else
> >                       sprintf(str, "None");
> >
> > -             DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
> > +             drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
> >                        kms->n_crtcs, master->id, str);
> >
> >               kms->n_crtcs++;
> > @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev,
> >                               struct komeda_pipeline *pipe,
> >                               struct drm_encoder *encoder)
> >  {
> > +     struct drm_device *drm =3D encoder->dev;
> >       struct drm_bridge *bridge;
> >       int err;
> >
> > @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev,
> >
> >       err =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> >       if (err)
> > -             dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> > +             drm_err(drm, "bridge_attach() failed for pipe: %s\n",
> >                       of_node_full_name(pipe->of_node));
> >
> >       return err;
> > --
> > 2.43.0
> >
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
