Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22DB246D4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A266010E6DF;
	Wed, 13 Aug 2025 10:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZQOpdcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D975810E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 12:20:30 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3e40d16e218so45424805ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 05:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755001230; x=1755606030; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bN4OU0Et1bkk6Prn99YhQkkIL9DRbHQhYTYSAn7diRs=;
 b=aZQOpdcxbNHWl1Cp/+TULh4nTBsfRV0oNp1PY/hSI4zbsJS+M5X3xPzU0iMB28syOR
 tLPA2qOllmJLKqRpxfOQk3xFuKI+G4i0CsWzewU1JRmGQX3PJcCnY2mQ1fmtroGLqEDe
 euP10jhpC1k/ZjxdFqGFDUcQpDzKPB1/dq6TRK6FxfT5zd4Y2/ftDq9MmLL9AJftbWZs
 ZGbDSfQTyRuKRQkTTZ4RbTRggRnKC+gl4ncMxCGGj2g0VleizxrArInOaJmlBlA7sYXC
 EeiYNPjwqiR92fcaUs0uDu6bgSl38SP8N73BVWM9wAVK8JTZzIVyP6B1nigt3id/PLXy
 +tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755001230; x=1755606030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bN4OU0Et1bkk6Prn99YhQkkIL9DRbHQhYTYSAn7diRs=;
 b=JdGHXRxXQve8spquN/G4AUe8sCEG82rU8uyOb1+ECFWwKaUYU1387ooBhbMmHmRAYW
 wiqrXBQSxSCE+kXD7mNwCWYqrmG8F+NOL6U7A5tJLOdcgvVC8d/csapuKNw6CdfqQjVU
 fhK2EsfCnWYxnS9+zHNj814qWgmkuOyuEqzCltk67Xko2lq0ZsWtIY++1qjtZ9C75er9
 830pu6kqfzNLDPPSO3BwuK27IPr8YBziUd8qcSYqEhYwsSBlRyCnyiJGbncVWcuDHOUZ
 oY+VqV+PJ8lrIcq0A8Wwk+ofDZSxmFMeJ+r+ZTRoQfebPek5Q23c0a0D65lEdihJ6bHJ
 jm9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg3iNULzL9uaFeoqataOp9VFzx6qtxdNM+Vjld5MVm8l/e5bUFoxhjQDbdZwrI2QTqogfew1V7b1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGI5Rcbztqy+Wm5pBimoCue3Um1Tdoa1xYH5SYN+JGOUzB0+wj
 5CWY/uL6kgWV7N6Pf4YdYdN2357qKti+5H/6Gjvp/4kFjAQOhjDRio0wDBIl7xQA6zXj39gka7x
 C/0Xl9Sc/+Qd6X9R+vRdWaGKmqVGmEyg=
X-Gm-Gg: ASbGnctlvEuAcPBEce7HNAaRR4/sSpQalhUx6v7wpTLXyHn4SNDl+GN7EMA78rNHyu2
 Zg2yxvSIQJoAgt8df/7t/n0G3fkVFaGQlScNoFMpXZe/P6iQOFfgFZQ8zypd6Uvko/dit/PPCk2
 ofKhWX66oBTAHlT92MbkcUf5V5a5htf34BgjpMBMbQFgDPwu1bstp/vztEzX4Iy/OpkdA/hrrZJ
 pt2dA==
X-Google-Smtp-Source: AGHT+IEBeUCrRc/YoE/h7D6AEKbC2+oAFysobtOGusyrbRxkIddyRmHBVJ5ky5ZJzpQClz7n/78YjyiNVrBXjp6jaEY=
X-Received: by 2002:a05:6e02:378f:b0:3e5:4e4f:65df with SMTP id
 e9e14a558f8ab-3e55af6f533mr52198645ab.9.1755001229810; Tue, 12 Aug 2025
 05:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250812101119.2506-1-rk0006818@gmail.com>
 <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
In-Reply-To: <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 12 Aug 2025 17:50:18 +0530
X-Gm-Features: Ac12FXw_sNYmecV6tu8Q92WtiYwpjy4ESLY7GRfZiDtC0gsCogncgH4iGRjtJyE
Message-ID: <CAKY2RyZX9D6J08S78zT97cHS3dJ7Cf0xURX7EougPmh-rMSMGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000e2218c063c2a1040"
X-Mailman-Approved-At: Wed, 13 Aug 2025 10:15:00 +0000
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

--000000000000e2218c063c2a1040
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review and feedback, Liviu.
I will follow this for my future patches.

Regards,
Rahul

On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com> w=
rote:

> On Tue, Aug 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:
> > Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO()
> > calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
> > corresponding drm_err(), drm_warn(), and drm_info() helpers.
> >
> > The new drm_*() logging functions take a struct drm_device * as the
> > first argument. This allows the DRM core to prefix log messages with
> > the specific DRM device name and instance, which is essential for
> > distinguishing logs when multiple GPUs or display controllers are
> present.
> >
> > This change aligns komeda with the DRM TODO item: "Convert logging to
> > drm_* functions with drm_device parameter".
> >
> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>
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
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
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
> >       struct komeda_crtc_state *kcrtc_st =3D
> to_kcrtc_st(kcrtc->base.state);
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
> >               err =3D clk_set_rate(mdev->aclk,
> komeda_crtc_get_aclk(kcrtc_st));
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
> > +             drm_err(drm, "failed to set pxlclk for pipe%d\n",
> master->id);
> >       err =3D clk_prepare_enable(master->pxlclk);
> >       if (err)
> > -             DRM_ERROR("failed to enable pxl clk for pipe%d.\n",
> master->id);
> > +             drm_err(drm, "failed to enable pxl clk for pipe%d.\n",
> master->id);
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
> > @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc
>  *kcrtc,
> >               if (wb_conn)
> >                       drm_writeback_signal_completion(&wb_conn->base, 0=
);
> >               else
> > -                     DRM_WARN("CRTC[%d]: EOW happen but no
> wb_connector.\n",
> > +                     drm_warn(drm, "CRTC[%d]: EOW happen but no
> wb_connector.\n",
> >                                drm_crtc_index(&kcrtc->base));
> >       }
> >       /* will handle it together with the write back support */
> > @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc
>  *kcrtc,
> >                       crtc->state->event =3D NULL;
> >                       drm_crtc_send_vblank_event(crtc, event);
> >               } else {
> > -                     DRM_WARN("CRTC[%d]: FLIP happened but no pending
> commit.\n",
> > +                     drm_warn(drm, "CRTC[%d]: FLIP happened but no
> pending commit.\n",
> >                                drm_crtc_index(&kcrtc->base));
> >               }
> >               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> > @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct
> komeda_crtc *kcrtc,
> >
> >       /* wait the flip take affect.*/
> >       if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {
> > -             DRM_ERROR("wait pipe%d flip done timeout\n",
> kcrtc->master->id);
> > +             drm_err(drm, "wait pipe%d flip done timeout\n",
> kcrtc->master->id);
> >               if (!input_flip_done) {
> >                       unsigned long flags;
> >
> > @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_func=
s
> =3D {
> >  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
> >                          struct komeda_dev *mdev)
> >  {
> > +     struct drm_device *drm =3D &kms->base;
> >       struct komeda_crtc *crtc;
> >       struct komeda_pipeline *master;
> >       char str[16];
> > @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev
> *kms,
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
>

--000000000000e2218c063c2a1040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review and feedback, Liviu. =C2=A0<br>I wil=
l follow this for my future patches. =C2=A0<br><br>Regards, =C2=A0<br>Rahul=
<br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Liviu Dud=
au &lt;<a href=3D"mailto:liviu.dudau@arm.com">liviu.dudau@arm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Au=
g 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:<br>
&gt; Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO(=
)<br>
&gt; calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the<br>
&gt; corresponding drm_err(), drm_warn(), and drm_info() helpers.<br>
&gt; <br>
&gt; The new drm_*() logging functions take a struct drm_device * as the<br=
>
&gt; first argument. This allows the DRM core to prefix log messages with<b=
r>
&gt; the specific DRM device name and instance, which is essential for<br>
&gt; distinguishing logs when multiple GPUs or display controllers are pres=
ent.<br>
&gt; <br>
&gt; This change aligns komeda with the DRM TODO item: &quot;Convert loggin=
g to<br>
&gt; drm_* functions with drm_device parameter&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rk0006818@gmail.com" =
target=3D"_blank">rk0006818@gmail.com</a>&gt;<br>
<br>
Reviewed-by: Liviu Dudau &lt;<a href=3D"mailto:liviu.dudau@arm.com" target=
=3D"_blank">liviu.dudau@arm.com</a>&gt;<br>
<br>
For future patches, when you make changes, please generate them with<br>
<br>
git patch -v&lt;version&gt;<br>
<br>
and include a change log so that reviewers can quickly figure out what<br>
has changed between emails without having to go back and forth.<br>
<br>
Best regards,<br>
Liviu<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../gpu/drm/arm/display/komeda/komeda_crtc.c=C2=A0 | 27 ++++++++=
+++--------<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/driver=
s/gpu/drm/arm/display/komeda/komeda_crtc.c<br>
&gt; index 2ad33559a33a..e4cc1fb34e94 100644<br>
&gt; --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c<br>
&gt; +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c<br>
&gt; @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,<br=
>
&gt;=C2=A0 static int<br>
&gt;=C2=A0 komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D"h=
ttp://base.dev" rel=3D"noreferrer" target=3D"_blank">base.dev</a>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_dev *mdev =3D kcrtc-&gt;base.d=
ev-&gt;dev_private;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_pipeline *master =3D kcrtc-&gt=
;master;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_crtc_state *kcrtc_st =3D to_kc=
rtc_st(kcrtc-&gt;base.state);<br>
&gt; @@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mdev-&gt;funcs-&gt;change_opmode(mde=
v, new_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D clk_set_=
rate(mdev-&gt;aclk, komeda_crtc_get_aclk(kcrtc_st));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;failed to set aclk.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(drm, &quot;failed to set aclk.\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D clk_prep=
are_enable(mdev-&gt;aclk);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_ERROR(&quot;failed to enable aclk.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(drm, &quot;failed to enable aclk.\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D clk_set_rate(master-&gt;pxlclk, mode=
-&gt;crtc_clock * 1000);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to set pxlclk for pipe%d\n&quot;, master-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to set pxlclk for pipe%d\n&quot;, master-&gt;id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D clk_prepare_enable(master-&gt;pxlclk=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to enable pxl clk for pipe%d.\n&quot;, master-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to enable pxl clk for pipe%d.\n&quot;, master-&gt;id);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 unlock:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mdev-&gt;lock);<br>
&gt; @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)<br>
&gt;=C2=A0 static int<br>
&gt;=C2=A0 komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D"h=
ttp://base.dev" rel=3D"noreferrer" target=3D"_blank">base.dev</a>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_dev *mdev =3D kcrtc-&gt;base.d=
ev-&gt;dev_private;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_pipeline *master =3D kcrtc-&gt=
;master;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 new_mode;<br>
&gt; @@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D mdev-&gt;funcs-&gt;change_opmode(mde=
v, new_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;faile=
d to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to change opmode: 0x%x -&gt; 0x%x.\n,&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mdev-&gt;dpmode, new_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)<b=
r>
&gt;=C2=A0 void komeda_crtc_handle_event(struct komeda_crtc=C2=A0 =C2=A0*kc=
rtc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_events *evts)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D kcrtc-&gt;<a href=3D"h=
ttp://base.dev" rel=3D"noreferrer" target=3D"_blank">base.dev</a>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc =3D &amp;kcrtc-&gt;bas=
e;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 events =3D evts-&gt;pipes[kcrtc-&gt;mast=
er-&gt;id];<br>
&gt;=C2=A0 <br>
&gt; @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc=
=C2=A0 =C2=A0*kcrtc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (wb_conn)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0drm_writeback_signal_completion(&amp;wb_conn-&gt;base, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_WARN(&quot;CRTC[%d]: EOW happen but no wb_connector.\n&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_warn(drm, &quot;CRTC[%d]: EOW happen but no wb_connector.\n&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_crtc_index(&amp;kcrtc-&gt;bas=
e));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* will handle it together with the write ba=
ck support */<br>
&gt; @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc=
=C2=A0 =C2=A0*kcrtc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0crtc-&gt;state-&gt;event =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0drm_crtc_send_vblank_event(crtc, event);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_WARN(&quot;CRTC[%d]: FLIP happened but no pending commit.\n&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_warn(drm, &quot;CRTC[%d]: FLIP happened but no pending commit.\n=
&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_crtc_index(&amp;kcrtc-&gt;bas=
e));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqr=
estore(&amp;crtc-&gt;dev-&gt;event_lock, flags);<br>
&gt; @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct ko=
meda_crtc *kcrtc,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* wait the flip take affect.*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wait_for_completion_timeout(flip_done, H=
Z) =3D=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;wait =
pipe%d flip done timeout\n&quot;, kcrtc-&gt;master-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;wa=
it pipe%d flip done timeout\n&quot;, kcrtc-&gt;master-&gt;id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!input_flip_=
done) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0unsigned long flags;<br>
&gt;=C2=A0 <br>
&gt; @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_fun=
cs =3D {<br>
&gt;=C2=A0 int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 struct komeda_dev *mdev)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D &amp;kms-&gt;base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_pipeline *master;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char str[16];<br>
&gt; @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *=
kms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sprintf(str, &quot;None&quot;);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;CRTC-%=
d: master(pipe-%d) slave(%s).\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(drm, &quot;C=
RTC-%d: master(pipe-%d) slave(%s).\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 kms-&gt;n_crtcs, master-&gt;id, str);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kms-&gt;n_crtcs+=
+;<br>
&gt; @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct komeda_pipeline *pipe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_encoder *encoder)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D encoder-&gt;dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_bridge *bridge;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt;=C2=A0 <br>
&gt; @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev=
,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D drm_bridge_attach(encoder, bridge, N=
ULL, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;br=
idge_attach() failed for pipe: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;br=
idge_attach() failed for pipe: %s\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0of_node_full_name(pipe-&gt;of_node));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
-- <br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
| I would like to |<br>
| fix the world,=C2=A0 |<br>
| but they&#39;re not |<br>
| giving me the=C2=A0 =C2=A0|<br>
=C2=A0\ source code!=C2=A0 /<br>
=C2=A0 ---------------<br>
=C2=A0 =C2=A0 =C2=AF\_(=E3=83=84)_/=C2=AF<br>
</blockquote></div>

--000000000000e2218c063c2a1040--
