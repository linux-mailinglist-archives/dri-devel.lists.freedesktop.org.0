Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2A900B0B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 19:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8142B10EB9D;
	Fri,  7 Jun 2024 17:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmydTiMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA17110EC71;
 Fri,  7 Jun 2024 14:12:55 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso27297881fa.3; 
 Fri, 07 Jun 2024 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717769574; x=1718374374; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fY7MKXBkQChZao31yQj+gem+3Q0KcV2VxbzeRfAUzlg=;
 b=EmydTiMwK6XQFHximzj3Zd+UB5o08pehNim1qGLG3J9gVe+F+L/z60wtjyI26L2iYA
 MxPaBim4LDsfFYyTcZJvSQOftVw3iOjZm7a9CA4gNxdaeGPrHjDbvAA/k+ZNvTyBkkpx
 ce8gKCuvKmD7zZcjKpQG1FUNHR1N95qo2F5BaAfQTD1O+YfvHZsZol96f5orHhT2x2DW
 Jdrr50b1UHjm7+nPyXRXYB8Jb4Mds4f7FQykrjFcIZ+espzM9UVp1MPjHFMkkguqPqr3
 MzwRQPFn7plFWipPnoEo6KgHId+/cb2sy7IHkvthV4VvVd8s3UgoLh7lCT6dEmdTht6d
 F1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717769574; x=1718374374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fY7MKXBkQChZao31yQj+gem+3Q0KcV2VxbzeRfAUzlg=;
 b=EkbQldAi+IsNhLCW1quhkcSDiW6VZA1Ni6ibEeuxJ1bUffAy2jj10v0grI1uSwkDWT
 Yx1FMgLw4ywJPWTMB5/x3agOXUaEzy73zOA8ouRUB6rM4yHwliALSH0HD5xtkosCg59b
 at4GnvWFmwXpDQvY294QBLT7qU6PNtMX3g0G+kChBnFed6pUEUllw8uY4z8Zn+WfwUsZ
 f2WdymnTe2mbNb5BXxLw1gG8syQzycbLSLknCS+9vPIWPwPYnwhoOaQ3xs02tBY5CFBs
 4XrhsWHnNMZAnrcjcbMsSjPYaMJ+SzYVp2yoRW6uz+xEFXF6XwH5321GarTbRNWRbCE+
 a6Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWL0+LDoFd9tD02+d/RBrh5X1aU52CBS5nnzeMpkxxf5AtcBnLBhqr2rT0/97d5GATPqNVL+UtyWGAXAz0Q6dl9iOhcD82OzsTV9RZhfADxqYhyli+K0Sj0As2qw7CO5AUoC3r3gW72IZkHZCj4g==
X-Gm-Message-State: AOJu0YzbfcMTuYXFq6xlIWXQSTdpCctHG/mXjgi4eN8huceA8X5HFPNY
 thq3brZHisOWJCON+rRKE4HLUAHhsPQCNWpWPptV+gWex1pyTWwxwKxc1xhL6nKiRD5UKVFlyOg
 G0YFUjpF8qf2NdLDxrbQ6tzxM9otdG6kVwSs=
X-Google-Smtp-Source: AGHT+IEuoIwAL9wMAQOt6Qx9R7MnvfnBcg3+GfDPrU402kKJX0MgDjQdBZID41FPt85myS4XgzNkN9kjml292lhOkpU=
X-Received: by 2002:a2e:b0d2:0:b0:2e9:8ac8:b0c4 with SMTP id
 38308e7fff4ca-2eadce91587mr16740381fa.49.1717769573254; Fri, 07 Jun 2024
 07:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240607011413.8839-1-wuhoipok@gmail.com>
 <dd92e946-144a-4624-aac9-c516b2417208@amd.com>
In-Reply-To: <dd92e946-144a-4624-aac9-c516b2417208@amd.com>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Fri, 7 Jun 2024 10:12:40 -0400
Message-ID: <CANyH0kCh9wxpGZ3W1QRE68PqgNCmX=uBf9N0OOnw77-B8xR4EQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove load callback
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000385007061a4d65b6"
X-Mailman-Approved-At: Fri, 07 Jun 2024 17:11:39 +0000
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

--000000000000385007061a4d65b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i do it because it is part of the todo list
where the task is to remove load/unload callback
there are only 2 drm_driver that still uses thats why
i thought my amdgpu could test radeonsi but no, i still send it anyway

regards,
wu


On Fri, Jun 7, 2024 at 3:51=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com>
wrote:

> Am 07.06.24 um 03:14 schrieb wu hoi pok:
> > this patch is to remove the load callback from the kms_driver,
> > following closly to amdgpu, radeon_driver_load_kms and devm_drm_dev_all=
oc
> > are used, most of the changes here are rdev->ddev to rdev_to_drm,
> > which maps to adev_to_drm in amdgpu. however this patch is not tested o=
n
> > hardware, so if you are free and have a gcn1 gcn2 card please do so.
>
> What is the motivation to do that?
>
> When the old interface is going to be removed the patch is probably
> justified, but in general we don't really accept any larger changes like
> this for radeon any more.
>
> Especially without some testing of it.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: wu hoi pok <wuhoipok@gmail.com>
> > ---
> >   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
> >   drivers/gpu/drm/radeon/cik.c               | 14 ++--
> >   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
> >   drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
> >   drivers/gpu/drm/radeon/ni.c                |  2 +-
> >   drivers/gpu/drm/radeon/r100.c              | 24 +++----
> >   drivers/gpu/drm/radeon/r300.c              |  6 +-
> >   drivers/gpu/drm/radeon/r420.c              |  6 +-
> >   drivers/gpu/drm/radeon/r520.c              |  2 +-
> >   drivers/gpu/drm/radeon/r600.c              | 12 ++--
> >   drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
> >   drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
> >   drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon.h            | 11 +++-
> >   drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
> >   drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
> >   drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
> >   drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_device.c     | 17 ++---
> >   drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++----------=
-
> >   drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
> >   drivers/gpu/drm/radeon/radeon_drv.h        |  1 -
> >   drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
> >   drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
> >   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_kms.c        | 16 ++---
> >   drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
> >   drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
> >   drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
> >   drivers/gpu/drm/radeon/rs400.c             |  6 +-
> >   drivers/gpu/drm/radeon/rs600.c             | 14 ++--
> >   drivers/gpu/drm/radeon/rs690.c             |  2 +-
> >   drivers/gpu/drm/radeon/rv515.c             |  4 +-
> >   drivers/gpu/drm/radeon/rv770.c             |  2 +-
> >   drivers/gpu/drm/radeon/si.c                |  4 +-
> >   40 files changed, 192 insertions(+), 188 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c
> b/drivers/gpu/drm/radeon/atombios_encoders.c
> > index 7b11674f5d45..05f34efd7fd0 100644
> > --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> > +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> > @@ -2179,7 +2179,7 @@ int radeon_atom_pick_dig_encoder(struct
> drm_encoder *encoder, int fe_idx)
> >   void
> >   radeon_atom_encoder_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_encoder *encoder;
> >
> >       list_for_each_entry(encoder, &dev->mode_config.encoder_list, head=
)
> {
> > diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.=
c
> > index b5e96a8fc2c1..11a492f21157 100644
> > --- a/drivers/gpu/drm/radeon/cik.c
> > +++ b/drivers/gpu/drm/radeon/cik.c
> > @@ -7585,7 +7585,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[0]) {
> > -                                     drm_handle_vblank(rdev->ddev, 0);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 0);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -7615,7 +7615,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[1]) {
> > -                                     drm_handle_vblank(rdev->ddev, 1);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 1);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -7645,7 +7645,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[2]) {
> > -                                     drm_handle_vblank(rdev->ddev, 2);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 2);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -7675,7 +7675,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[3]) {
> > -                                     drm_handle_vblank(rdev->ddev, 3);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 3);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -7705,7 +7705,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[4]) {
> > -                                     drm_handle_vblank(rdev->ddev, 4);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 4);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -7735,7 +7735,7 @@ int cik_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: IH event w/o
> asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[5]) {
> > -                                     drm_handle_vblank(rdev->ddev, 5);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 5);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -8581,7 +8581,7 @@ int cik_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c
> b/drivers/gpu/drm/radeon/dce6_afmt.c
> > index 4c06f47453fd..d6ab93ed9ec4 100644
> > --- a/drivers/gpu/drm/radeon/dce6_afmt.c
> > +++ b/drivers/gpu/drm/radeon/dce6_afmt.c
> > @@ -91,7 +91,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct
> radeon_device *rdev)
> >                       pin =3D &rdev->audio.pin[i];
> >                       pin_count =3D 0;
> >
> > -                     list_for_each_entry(encoder,
> &rdev->ddev->mode_config.encoder_list, head) {
> > +                     list_for_each_entry(encoder,
> &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
> >                               if (radeon_encoder_is_digital(encoder)) {
> >                                       radeon_encoder =3D
> to_radeon_encoder(encoder);
> >                                       dig =3D radeon_encoder->enc_priv;
> > diff --git a/drivers/gpu/drm/radeon/evergreen.c
> b/drivers/gpu/drm/radeon/evergreen.c
> > index c634dc28e6c3..bc4ab71613a5 100644
> > --- a/drivers/gpu/drm/radeon/evergreen.c
> > +++ b/drivers/gpu/drm/radeon/evergreen.c
> > @@ -1673,7 +1673,7 @@ void evergreen_pm_misc(struct radeon_device *rdev=
)
> >    */
> >   void evergreen_pm_prepare(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -1698,7 +1698,7 @@ void evergreen_pm_prepare(struct radeon_device
> *rdev)
> >    */
> >   void evergreen_pm_finish(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -1763,7 +1763,7 @@ void evergreen_hpd_set_polarity(struct
> radeon_device *rdev,
> >    */
> >   void evergreen_hpd_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned enabled =3D 0;
> >       u32 tmp =3D DC_HPDx_CONNECTION_TIMER(0x9c4) |
> > @@ -1804,7 +1804,7 @@ void evergreen_hpd_init(struct radeon_device *rde=
v)
> >    */
> >   void evergreen_hpd_fini(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned disabled =3D 0;
> >
> > @@ -4753,7 +4753,7 @@ int evergreen_irq_process(struct radeon_device
> *rdev)
> >                               event_name =3D "vblank";
> >
> >                               if (rdev->irq.crtc_vblank_int[crtc_idx]) =
{
> > -                                     drm_handle_vblank(rdev->ddev,
> crtc_idx);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -5211,7 +5211,7 @@ int evergreen_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
> >       /* initialize AGP */
> > diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
> > index 77aee99e473a..3890911fe693 100644
> > --- a/drivers/gpu/drm/radeon/ni.c
> > +++ b/drivers/gpu/drm/radeon/ni.c
> > @@ -2360,7 +2360,7 @@ int cayman_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
> >       /* initialize memory controller */
> > diff --git a/drivers/gpu/drm/radeon/r100.c
> b/drivers/gpu/drm/radeon/r100.c
> > index 0b1e19345f43..d7d7d23bf9a1 100644
> > --- a/drivers/gpu/drm/radeon/r100.c
> > +++ b/drivers/gpu/drm/radeon/r100.c
> > @@ -459,7 +459,7 @@ void r100_pm_misc(struct radeon_device *rdev)
> >    */
> >   void r100_pm_prepare(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -490,7 +490,7 @@ void r100_pm_prepare(struct radeon_device *rdev)
> >    */
> >   void r100_pm_finish(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -603,7 +603,7 @@ void r100_hpd_set_polarity(struct radeon_device
> *rdev,
> >    */
> >   void r100_hpd_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned enable =3D 0;
> >
> > @@ -626,7 +626,7 @@ void r100_hpd_init(struct radeon_device *rdev)
> >    */
> >   void r100_hpd_fini(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned disable =3D 0;
> >
> > @@ -798,7 +798,7 @@ int r100_irq_process(struct radeon_device *rdev)
> >               /* Vertical blank interrupts */
> >               if (status & RADEON_CRTC_VBLANK_STAT) {
> >                       if (rdev->irq.crtc_vblank_int[0]) {
> > -                             drm_handle_vblank(rdev->ddev, 0);
> > +                             drm_handle_vblank(rdev_to_drm(rdev), 0);
> >                               rdev->pm.vblank_sync =3D true;
> >                               wake_up(&rdev->irq.vblank_queue);
> >                       }
> > @@ -807,7 +807,7 @@ int r100_irq_process(struct radeon_device *rdev)
> >               }
> >               if (status & RADEON_CRTC2_VBLANK_STAT) {
> >                       if (rdev->irq.crtc_vblank_int[1]) {
> > -                             drm_handle_vblank(rdev->ddev, 1);
> > +                             drm_handle_vblank(rdev_to_drm(rdev), 1);
> >                               rdev->pm.vblank_sync =3D true;
> >                               wake_up(&rdev->irq.vblank_queue);
> >                       }
> > @@ -1471,7 +1471,7 @@ int r100_cs_packet_parse_vline(struct
> radeon_cs_parser *p)
> >       header =3D radeon_get_ib_value(p, h_idx);
> >       crtc_id =3D radeon_get_ib_value(p, h_idx + 5);
> >       reg =3D R100_CP_PACKET0_GET_REG(header);
> > -     crtc =3D drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
> > +     crtc =3D drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
> >       if (!crtc) {
> >               DRM_ERROR("cannot find crtc %d\n", crtc_id);
> >               return -ENOENT;
> > @@ -3059,7 +3059,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);
> >   void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
> >                           &r100_debugfs_rbbm_info_fops);
> > @@ -3069,7 +3069,7 @@ void  r100_debugfs_rbbm_init(struct radeon_device
> *rdev)
> >   void r100_debugfs_cp_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
> >                           &r100_debugfs_cp_ring_info_fops);
> > @@ -3081,7 +3081,7 @@ void r100_debugfs_cp_init(struct radeon_device
> *rdev)
> >   void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("r100_mc_info", 0444, root, rdev,
> >                           &r100_debugfs_mc_info_fops);
> > @@ -3947,7 +3947,7 @@ int r100_resume(struct radeon_device *rdev)
> >                       RREG32(R_0007C0_CP_STAT));
> >       }
> >       /* post */
> > -     radeon_combios_asic_init(rdev->ddev);
> > +     radeon_combios_asic_init(rdev_to_drm(rdev));
> >       /* Resume clock after posting */
> >       r100_clock_startup(rdev);
> >       /* Initialize surface registers */
> > @@ -4056,7 +4056,7 @@ int r100_init(struct radeon_device *rdev)
> >       /* Set asic errata */
> >       r100_errata(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize AGP */
> >       if (rdev->flags & RADEON_IS_AGP) {
> >               r =3D radeon_agp_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/r300.c
> b/drivers/gpu/drm/radeon/r300.c
> > index 1620f534f55f..05c13102a8cb 100644
> > --- a/drivers/gpu/drm/radeon/r300.c
> > +++ b/drivers/gpu/drm/radeon/r300.c
> > @@ -616,7 +616,7 @@ DEFINE_SHOW_ATTRIBUTE(rv370_debugfs_pcie_gart_info)=
;
> >   static void rv370_debugfs_pcie_gart_info_init(struct radeon_device
> *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
> >                           &rv370_debugfs_pcie_gart_info_fops);
> > @@ -1452,7 +1452,7 @@ int r300_resume(struct radeon_device *rdev)
> >                       RREG32(R_0007C0_CP_STAT));
> >       }
> >       /* post */
> > -     radeon_combios_asic_init(rdev->ddev);
> > +     radeon_combios_asic_init(rdev_to_drm(rdev));
> >       /* Resume clock after posting */
> >       r300_clock_startup(rdev);
> >       /* Initialize surface registers */
> > @@ -1538,7 +1538,7 @@ int r300_init(struct radeon_device *rdev)
> >       /* Set asic errata */
> >       r300_errata(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize AGP */
> >       if (rdev->flags & RADEON_IS_AGP) {
> >               r =3D radeon_agp_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/r420.c
> b/drivers/gpu/drm/radeon/r420.c
> > index a979662eaa73..9a31cdec6415 100644
> > --- a/drivers/gpu/drm/radeon/r420.c
> > +++ b/drivers/gpu/drm/radeon/r420.c
> > @@ -322,7 +322,7 @@ int r420_resume(struct radeon_device *rdev)
> >       if (rdev->is_atom_bios) {
> >               atom_asic_init(rdev->mode_info.atom_context);
> >       } else {
> > -             radeon_combios_asic_init(rdev->ddev);
> > +             radeon_combios_asic_init(rdev_to_drm(rdev));
> >       }
> >       /* Resume clock after posting */
> >       r420_clock_resume(rdev);
> > @@ -414,7 +414,7 @@ int r420_init(struct radeon_device *rdev)
> >               return -EINVAL;
> >
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize AGP */
> >       if (rdev->flags & RADEON_IS_AGP) {
> >               r =3D radeon_agp_init(rdev);
> > @@ -493,7 +493,7 @@ DEFINE_SHOW_ATTRIBUTE(r420_debugfs_pipes_info);
> >   void r420_debugfs_pipes_info_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("r420_pipes_info", 0444, root, rdev,
> >                           &r420_debugfs_pipes_info_fops);
> > diff --git a/drivers/gpu/drm/radeon/r520.c
> b/drivers/gpu/drm/radeon/r520.c
> > index 6cbcaa845192..08e127b3249a 100644
> > --- a/drivers/gpu/drm/radeon/r520.c
> > +++ b/drivers/gpu/drm/radeon/r520.c
> > @@ -287,7 +287,7 @@ int r520_init(struct radeon_device *rdev)
> >               atom_asic_init(rdev->mode_info.atom_context);
> >       }
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize AGP */
> >       if (rdev->flags & RADEON_IS_AGP) {
> >               r =3D radeon_agp_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/r600.c
> b/drivers/gpu/drm/radeon/r600.c
> > index 087d41e370fd..8b62f7faa5b9 100644
> > --- a/drivers/gpu/drm/radeon/r600.c
> > +++ b/drivers/gpu/drm/radeon/r600.c
> > @@ -950,7 +950,7 @@ void r600_hpd_set_polarity(struct radeon_device
> *rdev,
> >
> >   void r600_hpd_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned enable =3D 0;
> >
> > @@ -1017,7 +1017,7 @@ void r600_hpd_init(struct radeon_device *rdev)
> >
> >   void r600_hpd_fini(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned disable =3D 0;
> >
> > @@ -3280,7 +3280,7 @@ int r600_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
> >       if (rdev->flags & RADEON_IS_AGP) {
> > @@ -4136,7 +4136,7 @@ int r600_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: D1 vblank - IH
> event w/o asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[0]) {
> > -                                     drm_handle_vblank(rdev->ddev, 0);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 0);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -4166,7 +4166,7 @@ int r600_irq_process(struct radeon_device *rdev)
> >                                       DRM_DEBUG("IH: D2 vblank - IH
> event w/o asserted irq bit?\n");
> >
> >                               if (rdev->irq.crtc_vblank_int[1]) {
> > -                                     drm_handle_vblank(rdev->ddev, 1);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), 1);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -4358,7 +4358,7 @@ DEFINE_SHOW_ATTRIBUTE(r600_debugfs_mc_info);
> >   static void r600_debugfs_mc_info_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("r600_mc_info", 0444, root, rdev,
> >                           &r600_debugfs_mc_info_fops);
> > diff --git a/drivers/gpu/drm/radeon/r600_cs.c
> b/drivers/gpu/drm/radeon/r600_cs.c
> > index 6cf54a747749..1b2d31c4d77c 100644
> > --- a/drivers/gpu/drm/radeon/r600_cs.c
> > +++ b/drivers/gpu/drm/radeon/r600_cs.c
> > @@ -884,7 +884,7 @@ int r600_cs_common_vline_parse(struct
> radeon_cs_parser *p,
> >       crtc_id =3D radeon_get_ib_value(p, h_idx + 2 + 7 + 1);
> >       reg =3D R600_CP_PACKET0_GET_REG(header);
> >
> > -     crtc =3D drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
> > +     crtc =3D drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
> >       if (!crtc) {
> >               DRM_ERROR("cannot find crtc %d\n", crtc_id);
> >               return -ENOENT;
> > diff --git a/drivers/gpu/drm/radeon/r600_dpm.c
> b/drivers/gpu/drm/radeon/r600_dpm.c
> > index 64980a61d38a..81d58ef667dd 100644
> > --- a/drivers/gpu/drm/radeon/r600_dpm.c
> > +++ b/drivers/gpu/drm/radeon/r600_dpm.c
> > @@ -153,7 +153,7 @@ void r600_dpm_print_ps_status(struct radeon_device
> *rdev,
> >
> >   u32 r600_dpm_get_vblank_time(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 vblank_in_pixels;
> > @@ -180,7 +180,7 @@ u32 r600_dpm_get_vblank_time(struct radeon_device
> *rdev)
> >
> >   u32 r600_dpm_get_vrefresh(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 vrefresh =3D 0;
> > diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c
> b/drivers/gpu/drm/radeon/r600_hdmi.c
> > index f3551ebaa2f0..661f374f5f27 100644
> > --- a/drivers/gpu/drm/radeon/r600_hdmi.c
> > +++ b/drivers/gpu/drm/radeon/r600_hdmi.c
> > @@ -116,7 +116,7 @@ void r600_audio_update_hdmi(struct work_struct *wor=
k)
> >   {
> >       struct radeon_device *rdev =3D container_of(work, struct
> radeon_device,
> >                                                 audio_work);
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct r600_audio_pin audio_status =3D r600_audio_status(rdev);
> >       struct drm_encoder *encoder;
> >       bool changed =3D false;
> > diff --git a/drivers/gpu/drm/radeon/radeon.h
> b/drivers/gpu/drm/radeon/radeon.h
> > index 0999c8eaae94..69bb30ced189 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct
> radeon_device*, uint32_t, uint32_t);
> >
> >   struct radeon_device {
> >       struct device                   *dev;
> > -     struct drm_device               *ddev;
> > +     struct drm_device               ddev;
> >       struct pci_dev                  *pdev;
> >   #ifdef __alpha__
> >       struct pci_controller           *hose;
> > @@ -2440,10 +2440,13 @@ struct radeon_device {
> >       u64 gart_pin_size;
> >   };
> >
> > +static inline struct drm_device *rdev_to_drm(struct radeon_device *rde=
v)
> > +{
> > +     return &rdev->ddev;
> > +}
> > +
> >   bool radeon_is_px(struct drm_device *dev);
> >   int radeon_device_init(struct radeon_device *rdev,
> > -                    struct drm_device *ddev,
> > -                    struct pci_dev *pdev,
> >                      uint32_t flags);
> >   void radeon_device_fini(struct radeon_device *rdev);
> >   int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
> > @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct
> ttm_device *bdev);
> >
> >   /* KMS */
> >
> > +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long
> flags);
> > +
> >   u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> >   int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> >   void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> > diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c
> b/drivers/gpu/drm/radeon/radeon_acpi.c
> > index 603a78e41ba5..22ce61bdfc06 100644
> > --- a/drivers/gpu/drm/radeon/radeon_acpi.c
> > +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
> > @@ -405,11 +405,11 @@ static int radeon_atif_handler(struct
> radeon_device *rdev,
> >       if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
> >               if ((rdev->flags & RADEON_IS_PX) &&
> >                   radeon_atpx_dgpu_req_power_for_displays()) {
> > -                     pm_runtime_get_sync(rdev->ddev->dev);
> > +                     pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
> >                       /* Just fire off a uevent and let userspace tell
> us what to do */
> > -                     drm_helper_hpd_irq_event(rdev->ddev);
> > -                     pm_runtime_mark_last_busy(rdev->ddev->dev);
> > -                     pm_runtime_put_autosuspend(rdev->ddev->dev);
> > +                     drm_helper_hpd_irq_event(rdev_to_drm(rdev));
> > +                     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev)=
;
> > +                     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev=
);
> >               }
> >       }
> >       /* TODO: check other events */
> > @@ -736,7 +736,7 @@ int radeon_acpi_init(struct radeon_device *rdev)
> >               struct radeon_encoder *target =3D NULL;
> >
> >               /* Find the encoder controlling the brightness */
> > -             list_for_each_entry(tmp,
> &rdev->ddev->mode_config.encoder_list,
> > +             list_for_each_entry(tmp,
> &rdev_to_drm(rdev)->mode_config.encoder_list,
> >                               head) {
> >                       struct radeon_encoder *enc =3D
> to_radeon_encoder(tmp);
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_agp.c
> b/drivers/gpu/drm/radeon/radeon_agp.c
> > index a3d749e350f9..89d7b0e9e79f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_agp.c
> > +++ b/drivers/gpu/drm/radeon/radeon_agp.c
> > @@ -161,7 +161,7 @@ struct radeon_agp_head *radeon_agp_head_init(struct
> drm_device *dev)
> >
> >   static int radeon_agp_head_acquire(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> >
> >       if (!rdev->agp)
> > diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c
> b/drivers/gpu/drm/radeon/radeon_atombios.c
> > index 10793a433bf5..97c4e10d0550 100644
> > --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> > +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> > @@ -187,7 +187,7 @@ void radeon_atombios_i2c_init(struct radeon_device
> *rdev)
> >
> >                       if (i2c.valid) {
> >                               sprintf(stmp, "0x%x", i2c.i2c_id);
> > -                             rdev->i2c_bus[i] =3D
> radeon_i2c_create(rdev->ddev, &i2c, stmp);
> > +                             rdev->i2c_bus[i] =3D
> radeon_i2c_create(rdev_to_drm(rdev), &i2c, stmp);
> >                       }
> >                       gpio =3D (ATOM_GPIO_I2C_ASSIGMENT *)
> >                               ((u8 *)gpio +
> sizeof(ATOM_GPIO_I2C_ASSIGMENT));
> > diff --git a/drivers/gpu/drm/radeon/radeon_audio.c
> b/drivers/gpu/drm/radeon/radeon_audio.c
> > index 74753bb26d33..31f032295497 100644
> > --- a/drivers/gpu/drm/radeon/radeon_audio.c
> > +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> > @@ -196,7 +196,7 @@ static void radeon_audio_enable(struct radeon_devic=
e
> *rdev,
> >               return;
> >
> >       if (rdev->mode_info.mode_config_initialized) {
> > -             list_for_each_entry(encoder,
> &rdev->ddev->mode_config.encoder_list, head) {
> > +             list_for_each_entry(encoder,
> &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
> >                       if (radeon_encoder_is_digital(encoder)) {
> >                               radeon_encoder =3D
> to_radeon_encoder(encoder);
> >                               dig =3D radeon_encoder->enc_priv;
> > @@ -759,7 +759,7 @@ static int radeon_audio_component_get_eld(struct
> device *kdev, int port,
> >       if (!rdev->audio.enabled ||
> !rdev->mode_info.mode_config_initialized)
> >               return 0;
> >
> > -     list_for_each_entry(encoder,
> &rdev->ddev->mode_config.encoder_list, head) {
> > +     list_for_each_entry(encoder,
> &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
> >               if (!radeon_encoder_is_digital(encoder))
> >                       continue;
> >               radeon_encoder =3D to_radeon_encoder(encoder);
> > diff --git a/drivers/gpu/drm/radeon/radeon_combios.c
> b/drivers/gpu/drm/radeon/radeon_combios.c
> > index 6952b1273b0f..41ddc576f8f8 100644
> > --- a/drivers/gpu/drm/radeon/radeon_combios.c
> > +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> > @@ -372,7 +372,7 @@ bool radeon_combios_check_hardcoded_edid(struct
> radeon_device *rdev)
> >       int edid_info, size;
> >       struct edid *edid;
> >       unsigned char *raw;
> > -     edid_info =3D combios_get_table_offset(rdev->ddev,
> COMBIOS_HARDCODED_EDID_TABLE);
> > +     edid_info =3D combios_get_table_offset(rdev_to_drm(rdev),
> COMBIOS_HARDCODED_EDID_TABLE);
> >       if (!edid_info)
> >               return false;
> >
> > @@ -642,7 +642,7 @@ static struct radeon_i2c_bus_rec
> combios_setup_i2c_bus(struct radeon_device *rde
> >
> >   static struct radeon_i2c_bus_rec
> radeon_combios_get_i2c_info_from_table(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct radeon_i2c_bus_rec i2c;
> >       u16 offset;
> >       u8 id, blocks, clk, data;
> > @@ -670,7 +670,7 @@ static struct radeon_i2c_bus_rec
> radeon_combios_get_i2c_info_from_table(struct r
> >
> >   void radeon_combios_i2c_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct radeon_i2c_bus_rec i2c;
> >
> >       /* actual hw pads
> > @@ -812,7 +812,7 @@ bool radeon_combios_get_clock_info(struct drm_devic=
e
> *dev)
> >
> >   bool radeon_combios_sideport_present(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       u16 igp_info;
> >
> >       /* sideport is AMD only */
> > @@ -915,7 +915,7 @@ struct radeon_encoder_primary_dac
> *radeon_combios_get_primary_dac_info(struct
> >   enum radeon_tv_std
> >   radeon_combios_get_tv_info(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       uint16_t tv_info;
> >       enum radeon_tv_std tv_std =3D TV_STD_NTSC;
> >
> > @@ -2637,7 +2637,7 @@ static const char *thermal_controller_names[] =3D=
 {
> >
> >   void radeon_combios_get_power_modes(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       u16 offset, misc, misc2 =3D 0;
> >       u8 rev, tmp;
> >       int state_index =3D 0;
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c
> b/drivers/gpu/drm/radeon/radeon_device.c
> > index afbb3a80c0c6..36444d739b41 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -760,7 +760,7 @@ bool radeon_boot_test_post_card(struct radeon_devic=
e
> *rdev)
> >               if (rdev->is_atom_bios)
> >                       atom_asic_init(rdev->mode_info.atom_context);
> >               else
> > -                     radeon_combios_asic_init(rdev->ddev);
> > +                     radeon_combios_asic_init(rdev_to_drm(rdev));
> >               return true;
> >       } else {
> >               dev_err(rdev->dev, "Card not posted and no BIOS -
> ignoring\n");
> > @@ -980,7 +980,7 @@ int radeon_atombios_init(struct radeon_device *rdev=
)
> >               return -ENOMEM;
> >
> >       rdev->mode_info.atom_card_info =3D atom_card_info;
> > -     atom_card_info->dev =3D rdev->ddev;
> > +     atom_card_info->dev =3D rdev_to_drm(rdev);
> >       atom_card_info->reg_read =3D cail_reg_read;
> >       atom_card_info->reg_write =3D cail_reg_write;
> >       /* needed for iio ops */
> > @@ -1005,7 +1005,7 @@ int radeon_atombios_init(struct radeon_device
> *rdev)
> >
> >       mutex_init(&rdev->mode_info.atom_context->mutex);
> >       mutex_init(&rdev->mode_info.atom_context->scratch_mutex);
> > -     radeon_atom_initialize_bios_scratch_regs(rdev->ddev);
> > +     radeon_atom_initialize_bios_scratch_regs(rdev_to_drm(rdev));
> >       atom_allocate_fb_scratch(rdev->mode_info.atom_context);
> >       return 0;
> >   }
> > @@ -1049,7 +1049,7 @@ void radeon_atombios_fini(struct radeon_device
> *rdev)
> >    */
> >   int radeon_combios_init(struct radeon_device *rdev)
> >   {
> > -     radeon_combios_initialize_bios_scratch_regs(rdev->ddev);
> > +     radeon_combios_initialize_bios_scratch_regs(rdev_to_drm(rdev));
> >       return 0;
> >   }
> >
> > @@ -1276,18 +1276,15 @@ static const struct vga_switcheroo_client_ops
> radeon_switcheroo_ops =3D {
> >    * Called at driver startup.
> >    */
> >   int radeon_device_init(struct radeon_device *rdev,
> > -                    struct drm_device *ddev,
> > -                    struct pci_dev *pdev,
> >                      uint32_t flags)
> >   {
> > +     struct pci_dev *pdev =3D rdev->pdev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       int r, i;
> >       int dma_bits;
> >       bool runtime =3D false;
> >
> >       rdev->shutdown =3D false;
> > -     rdev->dev =3D &pdev->dev;
> > -     rdev->ddev =3D ddev;
> > -     rdev->pdev =3D pdev;
> >       rdev->flags =3D flags;
> >       rdev->family =3D flags & RADEON_FAMILY_MASK;
> >       rdev->is_atom_bios =3D false;
> > @@ -1847,7 +1844,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)
> >
> >       downgrade_write(&rdev->exclusive_lock);
> >
> > -     drm_helper_resume_force_mode(rdev->ddev);
> > +     drm_helper_resume_force_mode(rdev_to_drm(rdev));
> >
> >       /* set the power state here in case we are a PX system or headles=
s
> */
> >       if ((rdev->pm.pm_method =3D=3D PM_METHOD_DPM) && rdev->pm.dpm_ena=
bled)
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c
> b/drivers/gpu/drm/radeon/radeon_display.c
> > index 5f1d24d3120c..4b9473852c1f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -302,13 +302,13 @@ void radeon_crtc_handle_vblank(struct
> radeon_device *rdev, int crtc_id)
> >       if ((radeon_use_pflipirq =3D=3D 2) && ASIC_IS_DCE4(rdev))
> >               return;
> >
> > -     spin_lock_irqsave(&rdev->ddev->event_lock, flags);
> > +     spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
> >       if (radeon_crtc->flip_status !=3D RADEON_FLIP_SUBMITTED) {
> >               DRM_DEBUG_DRIVER("radeon_crtc->flip_status =3D %d !=3D "
> >                                "RADEON_FLIP_SUBMITTED(%d)\n",
> >                                radeon_crtc->flip_status,
> >                                RADEON_FLIP_SUBMITTED);
> > -             spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
> > +             spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock,
> flags);
> >               return;
> >       }
> >
> > @@ -334,7 +334,7 @@ void radeon_crtc_handle_vblank(struct radeon_device
> *rdev, int crtc_id)
> >        */
> >       if (update_pending &&
> >           (DRM_SCANOUTPOS_VALID &
> > -          radeon_get_crtc_scanoutpos(rdev->ddev, crtc_id,
> > +          radeon_get_crtc_scanoutpos(rdev_to_drm(rdev), crtc_id,
> >                                       GET_DISTANCE_TO_VBLANKSTART,
> >                                       &vpos, &hpos, NULL, NULL,
> >
>  &rdev->mode_info.crtcs[crtc_id]->base.hwmode)) &&
> > @@ -347,7 +347,7 @@ void radeon_crtc_handle_vblank(struct radeon_device
> *rdev, int crtc_id)
> >                */
> >               update_pending =3D 0;
> >       }
> > -     spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
> > +     spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
> >       if (!update_pending)
> >               radeon_crtc_handle_flip(rdev, crtc_id);
> >   }
> > @@ -370,14 +370,14 @@ void radeon_crtc_handle_flip(struct radeon_device
> *rdev, int crtc_id)
> >       if (radeon_crtc =3D=3D NULL)
> >               return;
> >
> > -     spin_lock_irqsave(&rdev->ddev->event_lock, flags);
> > +     spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
> >       work =3D radeon_crtc->flip_work;
> >       if (radeon_crtc->flip_status !=3D RADEON_FLIP_SUBMITTED) {
> >               DRM_DEBUG_DRIVER("radeon_crtc->flip_status =3D %d !=3D "
> >                                "RADEON_FLIP_SUBMITTED(%d)\n",
> >                                radeon_crtc->flip_status,
> >                                RADEON_FLIP_SUBMITTED);
> > -             spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
> > +             spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock,
> flags);
> >               return;
> >       }
> >
> > @@ -389,7 +389,7 @@ void radeon_crtc_handle_flip(struct radeon_device
> *rdev, int crtc_id)
> >       if (work->event)
> >               drm_crtc_send_vblank_event(&radeon_crtc->base,
> work->event);
> >
> > -     spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
> > +     spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
> >
> >       drm_crtc_vblank_put(&radeon_crtc->base);
> >       radeon_irq_kms_pflip_irq_put(rdev, work->crtc_id);
> > @@ -408,7 +408,7 @@ static void radeon_flip_work_func(struct work_struc=
t
> *__work)
> >       struct radeon_flip_work *work =3D
> >               container_of(__work, struct radeon_flip_work, flip_work);
> >       struct radeon_device *rdev =3D work->rdev;
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct radeon_crtc *radeon_crtc =3D
> rdev->mode_info.crtcs[work->crtc_id];
> >
> >       struct drm_crtc *crtc =3D &radeon_crtc->base;
> > @@ -1401,7 +1401,7 @@ static int radeon_modeset_create_props(struct
> radeon_device *rdev)
> >
> >       if (rdev->is_atom_bios) {
> >               rdev->mode_info.coherent_mode_property =3D
> > -                     drm_property_create_range(rdev->ddev, 0 ,
> "coherent", 0, 1);
> > +                     drm_property_create_range(rdev_to_drm(rdev), 0,
> "coherent", 0, 1);
> >               if (!rdev->mode_info.coherent_mode_property)
> >                       return -ENOMEM;
> >       }
> > @@ -1409,57 +1409,57 @@ static int radeon_modeset_create_props(struct
> radeon_device *rdev)
> >       if (!ASIC_IS_AVIVO(rdev)) {
> >               sz =3D ARRAY_SIZE(radeon_tmds_pll_enum_list);
> >               rdev->mode_info.tmds_pll_property =3D
> > -                     drm_property_create_enum(rdev->ddev, 0,
> > +                     drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                           "tmds_pll",
> >                                           radeon_tmds_pll_enum_list, sz=
);
> >       }
> >
> >       rdev->mode_info.load_detect_property =3D
> > -             drm_property_create_range(rdev->ddev, 0, "load detection"=
,
> 0, 1);
> > +             drm_property_create_range(rdev_to_drm(rdev), 0, "load
> detection", 0, 1);
> >       if (!rdev->mode_info.load_detect_property)
> >               return -ENOMEM;
> >
> > -     drm_mode_create_scaling_mode_property(rdev->ddev);
> > +     drm_mode_create_scaling_mode_property(rdev_to_drm(rdev));
> >
> >       sz =3D ARRAY_SIZE(radeon_tv_std_enum_list);
> >       rdev->mode_info.tv_std_property =3D
> > -             drm_property_create_enum(rdev->ddev, 0,
> > +             drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                   "tv standard",
> >                                   radeon_tv_std_enum_list, sz);
> >
> >       sz =3D ARRAY_SIZE(radeon_underscan_enum_list);
> >       rdev->mode_info.underscan_property =3D
> > -             drm_property_create_enum(rdev->ddev, 0,
> > +             drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                   "underscan",
> >                                   radeon_underscan_enum_list, sz);
> >
> >       rdev->mode_info.underscan_hborder_property =3D
> > -             drm_property_create_range(rdev->ddev, 0,
> > +             drm_property_create_range(rdev_to_drm(rdev), 0,
> >                                       "underscan hborder", 0, 128);
> >       if (!rdev->mode_info.underscan_hborder_property)
> >               return -ENOMEM;
> >
> >       rdev->mode_info.underscan_vborder_property =3D
> > -             drm_property_create_range(rdev->ddev, 0,
> > +             drm_property_create_range(rdev_to_drm(rdev), 0,
> >                                       "underscan vborder", 0, 128);
> >       if (!rdev->mode_info.underscan_vborder_property)
> >               return -ENOMEM;
> >
> >       sz =3D ARRAY_SIZE(radeon_audio_enum_list);
> >       rdev->mode_info.audio_property =3D
> > -             drm_property_create_enum(rdev->ddev, 0,
> > +             drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                        "audio",
> >                                        radeon_audio_enum_list, sz);
> >
> >       sz =3D ARRAY_SIZE(radeon_dither_enum_list);
> >       rdev->mode_info.dither_property =3D
> > -             drm_property_create_enum(rdev->ddev, 0,
> > +             drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                        "dither",
> >                                        radeon_dither_enum_list, sz);
> >
> >       sz =3D ARRAY_SIZE(radeon_output_csc_enum_list);
> >       rdev->mode_info.output_csc_property =3D
> > -             drm_property_create_enum(rdev->ddev, 0,
> > +             drm_property_create_enum(rdev_to_drm(rdev), 0,
> >                                        "output_csc",
> >                                        radeon_output_csc_enum_list, sz)=
;
> >
> > @@ -1578,29 +1578,29 @@ int radeon_modeset_init(struct radeon_device
> *rdev)
> >       int i;
> >       int ret;
> >
> > -     drm_mode_config_init(rdev->ddev);
> > +     drm_mode_config_init(rdev_to_drm(rdev));
> >       rdev->mode_info.mode_config_initialized =3D true;
> >
> > -     rdev->ddev->mode_config.funcs =3D &radeon_mode_funcs;
> > +     rdev_to_drm(rdev)->mode_config.funcs =3D &radeon_mode_funcs;
> >
> >       if (radeon_use_pflipirq =3D=3D 2 && rdev->family >=3D CHIP_R600)
> > -             rdev->ddev->mode_config.async_page_flip =3D true;
> > +             rdev_to_drm(rdev)->mode_config.async_page_flip =3D true;
> >
> >       if (ASIC_IS_DCE5(rdev)) {
> > -             rdev->ddev->mode_config.max_width =3D 16384;
> > -             rdev->ddev->mode_config.max_height =3D 16384;
> > +             rdev_to_drm(rdev)->mode_config.max_width =3D 16384;
> > +             rdev_to_drm(rdev)->mode_config.max_height =3D 16384;
> >       } else if (ASIC_IS_AVIVO(rdev)) {
> > -             rdev->ddev->mode_config.max_width =3D 8192;
> > -             rdev->ddev->mode_config.max_height =3D 8192;
> > +             rdev_to_drm(rdev)->mode_config.max_width =3D 8192;
> > +             rdev_to_drm(rdev)->mode_config.max_height =3D 8192;
> >       } else {
> > -             rdev->ddev->mode_config.max_width =3D 4096;
> > -             rdev->ddev->mode_config.max_height =3D 4096;
> > +             rdev_to_drm(rdev)->mode_config.max_width =3D 4096;
> > +             rdev_to_drm(rdev)->mode_config.max_height =3D 4096;
> >       }
> >
> > -     rdev->ddev->mode_config.preferred_depth =3D 24;
> > -     rdev->ddev->mode_config.prefer_shadow =3D 1;
> > +     rdev_to_drm(rdev)->mode_config.preferred_depth =3D 24;
> > +     rdev_to_drm(rdev)->mode_config.prefer_shadow =3D 1;
> >
> > -     rdev->ddev->mode_config.fb_modifiers_not_supported =3D true;
> > +     rdev_to_drm(rdev)->mode_config.fb_modifiers_not_supported =3D tru=
e;
> >
> >       ret =3D radeon_modeset_create_props(rdev);
> >       if (ret) {
> > @@ -1618,11 +1618,11 @@ int radeon_modeset_init(struct radeon_device
> *rdev)
> >
> >       /* allocate crtcs */
> >       for (i =3D 0; i < rdev->num_crtc; i++) {
> > -             radeon_crtc_init(rdev->ddev, i);
> > +             radeon_crtc_init(rdev_to_drm(rdev), i);
> >       }
> >
> >       /* okay we should have all the bios connectors */
> > -     ret =3D radeon_setup_enc_conn(rdev->ddev);
> > +     ret =3D radeon_setup_enc_conn(rdev_to_drm(rdev));
> >       if (!ret) {
> >               return ret;
> >       }
> > @@ -1639,7 +1639,7 @@ int radeon_modeset_init(struct radeon_device *rde=
v)
> >       /* setup afmt */
> >       radeon_afmt_init(rdev);
> >
> > -     drm_kms_helper_poll_init(rdev->ddev);
> > +     drm_kms_helper_poll_init(rdev_to_drm(rdev));
> >
> >       /* do pm late init */
> >       ret =3D radeon_pm_late_init(rdev);
> > @@ -1650,11 +1650,11 @@ int radeon_modeset_init(struct radeon_device
> *rdev)
> >   void radeon_modeset_fini(struct radeon_device *rdev)
> >   {
> >       if (rdev->mode_info.mode_config_initialized) {
> > -             drm_kms_helper_poll_fini(rdev->ddev);
> > +             drm_kms_helper_poll_fini(rdev_to_drm(rdev));
> >               radeon_hpd_fini(rdev);
> > -             drm_helper_force_disable_all(rdev->ddev);
> > +             drm_helper_force_disable_all(rdev_to_drm(rdev));
> >               radeon_afmt_fini(rdev);
> > -             drm_mode_config_cleanup(rdev->ddev);
> > +             drm_mode_config_cleanup(rdev_to_drm(rdev));
> >               rdev->mode_info.mode_config_initialized =3D false;
> >       }
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.c
> b/drivers/gpu/drm/radeon/radeon_drv.c
> > index 7bf08164140e..89941a90e17f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.c
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> > @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >                           const struct pci_device_id *ent)
> >   {
> >       unsigned long flags =3D 0;
> > -     struct drm_device *dev;
> > +     struct drm_device *ddev;
> > +     struct radeon_device *rdev;
> >       int ret;
> >
> >       if (!ent)
> > @@ -300,28 +301,36 @@ static int radeon_pci_probe(struct pci_dev *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     dev =3D drm_dev_alloc(&kms_driver, &pdev->dev);
> > -     if (IS_ERR(dev))
> > -             return PTR_ERR(dev);
> > +     rdev =3D devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev=
),
> ddev);
> > +     if (IS_ERR(rdev))
> > +             return PTR_ERR(rdev);
> > +
> > +     rdev->dev  =3D &pdev->dev;
> > +     rdev->pdev =3D pdev;
> > +     ddev =3D rdev_to_drm(rdev);
> >
> >       ret =3D pci_enable_device(pdev);
> >       if (ret)
> >               goto err_free;
> >
> > -     pci_set_drvdata(pdev, dev);
> > +     pci_set_drvdata(pdev, ddev);
> > +
> > +     ret =3D radeon_driver_load_kms(rdev, flags);
> > +     if (ret)
> > +             goto err_agp;
> >
> > -     ret =3D drm_dev_register(dev, ent->driver_data);
> > +     ret =3D drm_dev_register(ddev, flags);
> >       if (ret)
> >               goto err_agp;
> >
> > -     radeon_fbdev_setup(dev->dev_private);
> > +     radeon_fbdev_setup(ddev->dev_private);
> >
> >       return 0;
> >
> >   err_agp:
> >       pci_disable_device(pdev);
> >   err_free:
> > -     drm_dev_put(dev);
> > +     drm_dev_put(ddev);
> >       return ret;
> >   }
> >
> > @@ -569,7 +578,7 @@ static const struct drm_ioctl_desc
> radeon_ioctls_kms[] =3D {
> >   static const struct drm_driver kms_driver =3D {
> >       .driver_features =3D
> >           DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
> > -     .load =3D radeon_driver_load_kms,
> > +     // .load =3D radeon_driver_load_kms,
> >       .open =3D radeon_driver_open_kms,
> >       .postclose =3D radeon_driver_postclose_kms,
> >       .unload =3D radeon_driver_unload_kms,
> > diff --git a/drivers/gpu/drm/radeon/radeon_drv.h
> b/drivers/gpu/drm/radeon/radeon_drv.h
> > index 02a65971d140..6c1eb75a951b 100644
> > --- a/drivers/gpu/drm/radeon/radeon_drv.h
> > +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> > @@ -117,7 +117,6 @@
> >   long radeon_drm_ioctl(struct file *filp,
> >                     unsigned int cmd, unsigned long arg);
> >
> > -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags=
);
> >   void radeon_driver_unload_kms(struct drm_device *dev);
> >   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file
> *file_priv);
> >   void radeon_driver_postclose_kms(struct drm_device *dev,
> > diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c
> b/drivers/gpu/drm/radeon/radeon_fbdev.c
> > index 02bf25759059..fb70de29545c 100644
> > --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> > +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> > @@ -67,7 +67,7 @@ static int radeon_fbdev_create_pinned_object(struct
> drm_fb_helper *fb_helper,
> >       int height =3D mode_cmd->height;
> >       u32 cpp;
> >
> > -     info =3D drm_get_format_info(rdev->ddev, mode_cmd);
> > +     info =3D drm_get_format_info(rdev_to_drm(rdev), mode_cmd);
> >       cpp =3D info->cpp[0];
> >
> >       /* need to align pitch with crtc limits */
> > @@ -148,15 +148,15 @@ static int radeon_fbdev_fb_open(struct fb_info
> *info, int user)
> >       struct radeon_device *rdev =3D fb_helper->dev->dev_private;
> >       int ret;
> >
> > -     ret =3D pm_runtime_get_sync(rdev->ddev->dev);
> > +     ret =3D pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
> >       if (ret < 0 && ret !=3D -EACCES)
> >               goto err_pm_runtime_mark_last_busy;
> >
> >       return 0;
> >
> >   err_pm_runtime_mark_last_busy:
> > -     pm_runtime_mark_last_busy(rdev->ddev->dev);
> > -     pm_runtime_put_autosuspend(rdev->ddev->dev);
> > +     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
> > +     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
> >       return ret;
> >   }
> >
> > @@ -165,8 +165,8 @@ static int radeon_fbdev_fb_release(struct fb_info
> *info, int user)
> >       struct drm_fb_helper *fb_helper =3D info->par;
> >       struct radeon_device *rdev =3D fb_helper->dev->dev_private;
> >
> > -     pm_runtime_mark_last_busy(rdev->ddev->dev);
> > -     pm_runtime_put_autosuspend(rdev->ddev->dev);
> > +     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
> > +     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
> >
> >       return 0;
> >   }
> > @@ -236,7 +236,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct
> drm_fb_helper *fb_helper,
> >               ret =3D -ENOMEM;
> >               goto err_radeon_fbdev_destroy_pinned_object;
> >       }
> > -     ret =3D radeon_framebuffer_init(rdev->ddev, fb, &mode_cmd, gobj);
> > +     ret =3D radeon_framebuffer_init(rdev_to_drm(rdev), fb, &mode_cmd,
> gobj);
> >       if (ret) {
> >               DRM_ERROR("failed to initialize framebuffer %d\n", ret);
> >               goto err_kfree;
> > @@ -374,12 +374,12 @@ void radeon_fbdev_setup(struct radeon_device *rde=
v)
> >       fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> >       if (!fb_helper)
> >               return;
> > -     drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel,
> &radeon_fbdev_fb_helper_funcs);
> > +     drm_fb_helper_prepare(rdev_to_drm(rdev), fb_helper, bpp_sel,
> &radeon_fbdev_fb_helper_funcs);
> >
> > -     ret =3D drm_client_init(rdev->ddev, &fb_helper->client,
> "radeon-fbdev",
> > +     ret =3D drm_client_init(rdev_to_drm(rdev), &fb_helper->client,
> "radeon-fbdev",
> >                             &radeon_fbdev_client_funcs);
> >       if (ret) {
> > -             drm_err(rdev->ddev, "Failed to register client: %d\n",
> ret);
> > +             drm_err(rdev_to_drm(rdev), "Failed to register client:
> %d\n", ret);
> >               goto err_drm_client_init;
> >       }
> >
> > @@ -394,13 +394,13 @@ void radeon_fbdev_setup(struct radeon_device *rde=
v)
> >
> >   void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
> >   {
> > -     if (rdev->ddev->fb_helper)
> > -             drm_fb_helper_set_suspend(rdev->ddev->fb_helper, state);
> > +     if (rdev_to_drm(rdev)->fb_helper)
> > +             drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper,
> state);
> >   }
> >
> >   bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct
> radeon_bo *robj)
> >   {
> > -     struct drm_fb_helper *fb_helper =3D rdev->ddev->fb_helper;
> > +     struct drm_fb_helper *fb_helper =3D rdev_to_drm(rdev)->fb_helper;
> >       struct drm_gem_object *gobj;
> >
> >       if (!fb_helper)
> > diff --git a/drivers/gpu/drm/radeon/radeon_fence.c
> b/drivers/gpu/drm/radeon/radeon_fence.c
> > index 4fb780d96f32..daff61586be5 100644
> > --- a/drivers/gpu/drm/radeon/radeon_fence.c
> > +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> > @@ -150,7 +150,7 @@ int radeon_fence_emit(struct radeon_device *rdev,
> >                      rdev->fence_context + ring,
> >                      seq);
> >       radeon_fence_ring_emit(rdev, ring, *fence);
> > -     trace_radeon_fence_emit(rdev->ddev, ring, (*fence)->seq);
> > +     trace_radeon_fence_emit(rdev_to_drm(rdev), ring, (*fence)->seq);
> >       radeon_fence_schedule_check(rdev, ring);
> >       return 0;
> >   }
> > @@ -489,7 +489,7 @@ static long radeon_fence_wait_seq_timeout(struct
> radeon_device *rdev,
> >               if (!target_seq[i])
> >                       continue;
> >
> > -             trace_radeon_fence_wait_begin(rdev->ddev, i,
> target_seq[i]);
> > +             trace_radeon_fence_wait_begin(rdev_to_drm(rdev), i,
> target_seq[i]);
> >               radeon_irq_kms_sw_irq_get(rdev, i);
> >       }
> >
> > @@ -511,7 +511,7 @@ static long radeon_fence_wait_seq_timeout(struct
> radeon_device *rdev,
> >                       continue;
> >
> >               radeon_irq_kms_sw_irq_put(rdev, i);
> > -             trace_radeon_fence_wait_end(rdev->ddev, i, target_seq[i])=
;
> > +             trace_radeon_fence_wait_end(rdev_to_drm(rdev), i,
> target_seq[i]);
> >       }
> >
> >       return r;
> > @@ -995,7 +995,7 @@
> DEFINE_DEBUGFS_ATTRIBUTE(radeon_debugfs_gpu_reset_fops,
> >   void radeon_debugfs_fence_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
> >                           &radeon_debugfs_gpu_reset_fops);
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
> b/drivers/gpu/drm/radeon/radeon_gem.c
> > index 2ef201a072f1..9dd4ff09d562 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -899,7 +899,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_gem_info);
> >   void radeon_gem_debugfs_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("radeon_gem_info", 0444, root, rdev,
> >                           &radeon_debugfs_gem_info_fops);
> > diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c
> b/drivers/gpu/drm/radeon/radeon_i2c.c
> > index 3d174390a8af..1f16619ed06e 100644
> > --- a/drivers/gpu/drm/radeon/radeon_i2c.c
> > +++ b/drivers/gpu/drm/radeon/radeon_i2c.c
> > @@ -1011,7 +1011,7 @@ void radeon_i2c_add(struct radeon_device *rdev,
> >                   struct radeon_i2c_bus_rec *rec,
> >                   const char *name)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       int i;
> >
> >       for (i =3D 0; i < RADEON_MAX_I2C_BUS; i++) {
> > diff --git a/drivers/gpu/drm/radeon/radeon_ib.c
> b/drivers/gpu/drm/radeon/radeon_ib.c
> > index 63d914f3414d..1aa41cc3f991 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ib.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> > @@ -309,7 +309,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_sa_info);
> >   static void radeon_debugfs_sa_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("radeon_sa_info", 0444, root, rdev,
> >                           &radeon_debugfs_sa_info_fops);
> > diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> > index c4dda908666c..9961251b44ba 100644
> > --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> > @@ -80,7 +80,7 @@ static void radeon_hotplug_work_func(struct
> work_struct *work)
> >   {
> >       struct radeon_device *rdev =3D container_of(work, struct
> radeon_device,
> >                                                 hotplug_work.work);
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_mode_config *mode_config =3D &dev->mode_config;
> >       struct drm_connector *connector;
> >
> > @@ -101,7 +101,7 @@ static void radeon_dp_work_func(struct work_struct
> *work)
> >   {
> >       struct radeon_device *rdev =3D container_of(work, struct
> radeon_device,
> >                                                 dp_work);
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_mode_config *mode_config =3D &dev->mode_config;
> >       struct drm_connector *connector;
> >
> > @@ -197,7 +197,7 @@ static void radeon_driver_irq_uninstall_kms(struct
> drm_device *dev)
> >
> >   static int radeon_irq_install(struct radeon_device *rdev, int irq)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       int ret;
> >
> >       if (irq =3D=3D IRQ_NOTCONNECTED)
> > @@ -218,7 +218,7 @@ static int radeon_irq_install(struct radeon_device
> *rdev, int irq)
> >
> >   static void radeon_irq_uninstall(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> >
> >       radeon_driver_irq_uninstall_kms(dev);
> > @@ -322,9 +322,9 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
> >       spin_lock_init(&rdev->irq.lock);
> >
> >       /* Disable vblank irqs aggressively for power-saving */
> > -     rdev->ddev->vblank_disable_immediate =3D true;
> > +     rdev_to_drm(rdev)->vblank_disable_immediate =3D true;
> >
> > -     r =3D drm_vblank_init(rdev->ddev, rdev->num_crtc);
> > +     r =3D drm_vblank_init(rdev_to_drm(rdev), rdev->num_crtc);
> >       if (r) {
> >               return r;
> >       }
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c
> b/drivers/gpu/drm/radeon/radeon_kms.c
> > index a16590c6247f..171f8e9fce88 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device
> *dev)
> >    * (crtcs, encoders, hotplug detect, etc.).
> >    * Returns 0 on success, error on failure.
> >    */
> > -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags=
)
> > +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long
> flags)
> >   {
> > -     struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> > -     struct radeon_device *rdev;
> > +     struct pci_dev *pdev =3D rdev->pdev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       int r, acpi_status;
> >
> > -     rdev =3D kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
> > -     if (rdev =3D=3D NULL) {
> > -             return -ENOMEM;
> > -     }
> > -     dev->dev_private =3D (void *)rdev;
> > -
> >   #ifdef __alpha__
> >       rdev->hose =3D pdev->sysdata;
> >   #endif
> >
> >       if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
> > -             rdev->agp =3D radeon_agp_head_init(dev);
> > +             rdev->agp =3D radeon_agp_head_init(rdev_to_drm(rdev));
> >       if (rdev->agp) {
> >               rdev->agp->agp_mtrr =3D arch_phys_wc_add(
> >                       rdev->agp->agp_info.aper_base,
> > @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev,
> unsigned long flags)
> >        * properly initialize the GPU MC controller and permit
> >        * VRAM allocation
> >        */
> > -     r =3D radeon_device_init(rdev, dev, pdev, flags);
> > +     r =3D radeon_device_init(rdev, flags);
> >       if (r) {
> >               dev_err(dev->dev, "Fatal error during GPU init\n");
> >               goto out;
> > diff --git a/drivers/gpu/drm/radeon/radeon_object.c
> b/drivers/gpu/drm/radeon/radeon_object.c
> > index a955f8a2f7fe..450ff7daa46c 100644
> > --- a/drivers/gpu/drm/radeon/radeon_object.c
> > +++ b/drivers/gpu/drm/radeon/radeon_object.c
> > @@ -150,7 +150,7 @@ int radeon_bo_create(struct radeon_device *rdev,
> >       bo =3D kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
> >       if (bo =3D=3D NULL)
> >               return -ENOMEM;
> > -     drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
> > +     drm_gem_private_object_init(rdev_to_drm(rdev), &bo->tbo.base,
> size);
> >       bo->rdev =3D rdev;
> >       bo->surface_reg =3D -1;
> >       INIT_LIST_HEAD(&bo->list);
> > diff --git a/drivers/gpu/drm/radeon/radeon_pm.c
> b/drivers/gpu/drm/radeon/radeon_pm.c
> > index 2d9d9f46f243..b4fb7e70320b 100644
> > --- a/drivers/gpu/drm/radeon/radeon_pm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> > @@ -282,7 +282,7 @@ static void radeon_pm_set_clocks(struct
> radeon_device *rdev)
> >
> >       if (rdev->irq.installed) {
> >               i =3D 0;
> > -             drm_for_each_crtc(crtc, rdev->ddev) {
> > +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
> >                       if (rdev->pm.active_crtcs & (1 << i)) {
> >                               /* This can fail if a modeset is in
> progress */
> >                               if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> > @@ -299,7 +299,7 @@ static void radeon_pm_set_clocks(struct
> radeon_device *rdev)
> >
> >       if (rdev->irq.installed) {
> >               i =3D 0;
> > -             drm_for_each_crtc(crtc, rdev->ddev) {
> > +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
> >                       if (rdev->pm.req_vblank & (1 << i)) {
> >                               rdev->pm.req_vblank &=3D ~(1 << i);
> >                               drm_crtc_vblank_put(crtc);
> > @@ -671,7 +671,7 @@ static ssize_t radeon_hwmon_show_temp(struct device
> *dev,
> >                                     char *buf)
> >   {
> >       struct radeon_device *rdev =3D dev_get_drvdata(dev);
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       int temp;
> >
> >       /* Can't get temperature when the card is off */
> > @@ -715,7 +715,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device
> *dev,
> >                                     struct device_attribute *attr, char
> *buf)
> >   {
> >       struct radeon_device *rdev =3D dev_get_drvdata(dev);
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       u32 sclk =3D 0;
> >
> >       /* Can't get clock frequency when the card is off */
> > @@ -740,7 +740,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device
> *dev,
> >                                     struct device_attribute *attr, char
> *buf)
> >   {
> >       struct radeon_device *rdev =3D dev_get_drvdata(dev);
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       u16 vddc =3D 0;
> >
> >       /* Can't get vddc when the card is off */
> > @@ -1692,7 +1692,7 @@ void radeon_pm_fini(struct radeon_device *rdev)
> >
> >   static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >
> > @@ -1765,7 +1765,7 @@ static void radeon_pm_compute_clocks_old(struct
> radeon_device *rdev)
> >
> >   static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       struct radeon_connector *radeon_connector;
> > @@ -1826,7 +1826,7 @@ static bool radeon_pm_in_vbl(struct radeon_device
> *rdev)
> >        */
> >       for (crtc =3D 0; (crtc < rdev->num_crtc) && in_vbl; crtc++) {
> >               if (rdev->pm.active_crtcs & (1 << crtc)) {
> > -                     vbl_status =3D radeon_get_crtc_scanoutpos(rdev->d=
dev,
> > +                     vbl_status =3D
> radeon_get_crtc_scanoutpos(rdev_to_drm(rdev),
> >                                                               crtc,
> >
>  USE_REAL_VBLANKSTART,
> >                                                               &vpos,
> &hpos, NULL, NULL,
> > @@ -1918,7 +1918,7 @@ static void radeon_dynpm_idle_work_handler(struct
> work_struct *work)
> >   static int radeon_debugfs_pm_info_show(struct seq_file *m, void
> *unused)
> >   {
> >       struct radeon_device *rdev =3D m->private;
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >
> >       if  ((rdev->flags & RADEON_IS_PX) &&
> >            (ddev->switch_power_state !=3D DRM_SWITCH_POWER_ON)) {
> > @@ -1955,7 +1955,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);
> >   static void radeon_debugfs_pm_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("radeon_pm_info", 0444, root, rdev,
> >                           &radeon_debugfs_pm_info_fops);
> > diff --git a/drivers/gpu/drm/radeon/radeon_ring.c
> b/drivers/gpu/drm/radeon/radeon_ring.c
> > index 8d1d458286a8..581ae20c46e4 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ring.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> > @@ -550,7 +550,7 @@ static void radeon_debugfs_ring_init(struct
> radeon_device *rdev, struct radeon_r
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> >       const char *ring_name =3D radeon_debugfs_ring_idx_to_name(ring->i=
dx);
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       if (ring_name)
> >               debugfs_create_file(ring_name, 0444, root, ring,
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> > index 5c65b6dfb99a..69d0c12fa419 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -682,8 +682,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
> >
> >       /* No others user of address space so set it to 0 */
> >       r =3D ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->=
dev,
> > -                            rdev->ddev->anon_inode->i_mapping,
> > -                            rdev->ddev->vma_offset_manager,
> > +                            rdev_to_drm(rdev)->anon_inode->i_mapping,
> > +                            rdev_to_drm(rdev)->vma_offset_manager,
> >                              rdev->need_swiotlb,
> >                              dma_addressing_limited(&rdev->pdev->dev));
> >       if (r) {
> > @@ -890,7 +890,7 @@ static const struct file_operations
> radeon_ttm_gtt_fops =3D {
> >   static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct drm_minor *minor =3D rdev->ddev->primary;
> > +     struct drm_minor *minor =3D rdev_to_drm(rdev)->primary;
> >       struct dentry *root =3D minor->debugfs_root;
> >
> >       debugfs_create_file("radeon_vram", 0444, root, rdev,
> > diff --git a/drivers/gpu/drm/radeon/rs400.c
> b/drivers/gpu/drm/radeon/rs400.c
> > index d4d1501e6576..d6c18fd740ec 100644
> > --- a/drivers/gpu/drm/radeon/rs400.c
> > +++ b/drivers/gpu/drm/radeon/rs400.c
> > @@ -379,7 +379,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);
> >   static void rs400_debugfs_pcie_gart_info_init(struct radeon_device
> *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("rs400_gart_info", 0444, root, rdev,
> >                           &rs400_debugfs_gart_info_fops);
> > @@ -474,7 +474,7 @@ int rs400_resume(struct radeon_device *rdev)
> >                       RREG32(R_0007C0_CP_STAT));
> >       }
> >       /* post */
> > -     radeon_combios_asic_init(rdev->ddev);
> > +     radeon_combios_asic_init(rdev_to_drm(rdev));
> >       /* Resume clock after posting */
> >       r300_clock_startup(rdev);
> >       /* Initialize surface registers */
> > @@ -552,7 +552,7 @@ int rs400_init(struct radeon_device *rdev)
> >               return -EINVAL;
> >
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize memory controller */
> >       rs400_mc_init(rdev);
> >       /* Fence driver */
> > diff --git a/drivers/gpu/drm/radeon/rs600.c
> b/drivers/gpu/drm/radeon/rs600.c
> > index 5c162778899b..88c8e91ea651 100644
> > --- a/drivers/gpu/drm/radeon/rs600.c
> > +++ b/drivers/gpu/drm/radeon/rs600.c
> > @@ -321,7 +321,7 @@ void rs600_pm_misc(struct radeon_device *rdev)
> >
> >   void rs600_pm_prepare(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -339,7 +339,7 @@ void rs600_pm_prepare(struct radeon_device *rdev)
> >
> >   void rs600_pm_finish(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *ddev =3D rdev->ddev;
> > +     struct drm_device *ddev =3D rdev_to_drm(rdev);
> >       struct drm_crtc *crtc;
> >       struct radeon_crtc *radeon_crtc;
> >       u32 tmp;
> > @@ -408,7 +408,7 @@ void rs600_hpd_set_polarity(struct radeon_device
> *rdev,
> >
> >   void rs600_hpd_init(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned enable =3D 0;
> >
> > @@ -435,7 +435,7 @@ void rs600_hpd_init(struct radeon_device *rdev)
> >
> >   void rs600_hpd_fini(struct radeon_device *rdev)
> >   {
> > -     struct drm_device *dev =3D rdev->ddev;
> > +     struct drm_device *dev =3D rdev_to_drm(rdev);
> >       struct drm_connector *connector;
> >       unsigned disable =3D 0;
> >
> > @@ -797,7 +797,7 @@ int rs600_irq_process(struct radeon_device *rdev)
> >               /* Vertical blank interrupts */
> >               if
> (G_007EDC_LB_D1_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
> >                       if (rdev->irq.crtc_vblank_int[0]) {
> > -                             drm_handle_vblank(rdev->ddev, 0);
> > +                             drm_handle_vblank(rdev_to_drm(rdev), 0);
> >                               rdev->pm.vblank_sync =3D true;
> >                               wake_up(&rdev->irq.vblank_queue);
> >                       }
> > @@ -806,7 +806,7 @@ int rs600_irq_process(struct radeon_device *rdev)
> >               }
> >               if
> (G_007EDC_LB_D2_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
> >                       if (rdev->irq.crtc_vblank_int[1]) {
> > -                             drm_handle_vblank(rdev->ddev, 1);
> > +                             drm_handle_vblank(rdev_to_drm(rdev), 1);
> >                               rdev->pm.vblank_sync =3D true;
> >                               wake_up(&rdev->irq.vblank_queue);
> >                       }
> > @@ -1133,7 +1133,7 @@ int rs600_init(struct radeon_device *rdev)
> >               return -EINVAL;
> >
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize memory controller */
> >       rs600_mc_init(rdev);
> >       r100_debugfs_rbbm_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/rs690.c
> b/drivers/gpu/drm/radeon/rs690.c
> > index 14fb0819b8c1..016eb4992803 100644
> > --- a/drivers/gpu/drm/radeon/rs690.c
> > +++ b/drivers/gpu/drm/radeon/rs690.c
> > @@ -845,7 +845,7 @@ int rs690_init(struct radeon_device *rdev)
> >               return -EINVAL;
> >
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize memory controller */
> >       rs690_mc_init(rdev);
> >       rv515_debugfs(rdev);
> > diff --git a/drivers/gpu/drm/radeon/rv515.c
> b/drivers/gpu/drm/radeon/rv515.c
> > index bbc6ccabf788..1b4dfb645585 100644
> > --- a/drivers/gpu/drm/radeon/rv515.c
> > +++ b/drivers/gpu/drm/radeon/rv515.c
> > @@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);
> >   void rv515_debugfs(struct radeon_device *rdev)
> >   {
> >   #if defined(CONFIG_DEBUG_FS)
> > -     struct dentry *root =3D rdev->ddev->primary->debugfs_root;
> > +     struct dentry *root =3D rdev_to_drm(rdev)->primary->debugfs_root;
> >
> >       debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
> >                           &rv515_debugfs_pipes_info_fops);
> > @@ -636,7 +636,7 @@ int rv515_init(struct radeon_device *rdev)
> >       if (radeon_boot_test_post_card(rdev) =3D=3D false)
> >               return -EINVAL;
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* initialize AGP */
> >       if (rdev->flags & RADEON_IS_AGP) {
> >               r =3D radeon_agp_init(rdev);
> > diff --git a/drivers/gpu/drm/radeon/rv770.c
> b/drivers/gpu/drm/radeon/rv770.c
> > index 9ce12fa3c356..7d4b0bf59109 100644
> > --- a/drivers/gpu/drm/radeon/rv770.c
> > +++ b/drivers/gpu/drm/radeon/rv770.c
> > @@ -1935,7 +1935,7 @@ int rv770_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
> >       /* initialize AGP */
> > diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
> > index 15759c8ca5b7..6c95575ce109 100644
> > --- a/drivers/gpu/drm/radeon/si.c
> > +++ b/drivers/gpu/drm/radeon/si.c
> > @@ -6277,7 +6277,7 @@ int si_irq_process(struct radeon_device *rdev)
> >                               event_name =3D "vblank";
> >
> >                               if (rdev->irq.crtc_vblank_int[crtc_idx]) =
{
> > -                                     drm_handle_vblank(rdev->ddev,
> crtc_idx);
> > +
>  drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
> >                                       rdev->pm.vblank_sync =3D true;
> >                                       wake_up(&rdev->irq.vblank_queue);
> >                               }
> > @@ -6839,7 +6839,7 @@ int si_init(struct radeon_device *rdev)
> >       /* Initialize surface registers */
> >       radeon_surface_init(rdev);
> >       /* Initialize clocks */
> > -     radeon_get_clock_info(rdev->ddev);
> > +     radeon_get_clock_info(rdev_to_drm(rdev));
> >
> >       /* Fence driver */
> >       radeon_fence_driver_init(rdev);
>
>

--000000000000385007061a4d65b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>i do it because it is part of the todo list</div><div=
>where the task is to remove load/unload callback</div><div>there are only =
2 drm_driver that still uses thats why</div><div>i thought my amdgpu could =
test radeonsi but no, i still send it anyway</div><div><br></div><div>regar=
ds,</div><div>wu<br></div></div><br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jun 7, 2024 at 3:51=E2=80=AFAM Christ=
ian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">christian.ko=
enig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Am 07.06.24 um 03:14 schrieb wu hoi pok:<br>
&gt; this patch is to remove the load callback from the kms_driver,<br>
&gt; following closly to amdgpu, radeon_driver_load_kms and devm_drm_dev_al=
loc<br>
&gt; are used, most of the changes here are rdev-&gt;ddev to rdev_to_drm,<b=
r>
&gt; which maps to adev_to_drm in amdgpu. however this patch is not tested =
on<br>
&gt; hardware, so if you are free and have a gcn1 gcn2 card please do so.<b=
r>
<br>
What is the motivation to do that?<br>
<br>
When the old interface is going to be removed the patch is probably <br>
justified, but in general we don&#39;t really accept any larger changes lik=
e <br>
this for radeon any more.<br>
<br>
Especially without some testing of it.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: wu hoi pok &lt;<a href=3D"mailto:wuhoipok@gmail.com" ta=
rget=3D"_blank">wuhoipok@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/atombios_encoders.c |=C2=A0 2 +-<br=
>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/cik.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/dce6_afmt.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/evergreen.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/ni.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r100.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 24 +++----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r300.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r420.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r520.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r600.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 ++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r600_cs.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r600_dpm.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/r600_hdmi.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 11 +++-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_acpi.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 10 +--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_agp.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_atombios.c=C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_audio.c=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_combios.c=C2=A0 =C2=A0 | 12 =
++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_device.c=C2=A0 =C2=A0 =C2=A0=
| 17 ++---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_display.c=C2=A0 =C2=A0 | 74 =
+++++++++++-----------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_drv.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 27 +++++---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_drv.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 1 -<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_fbdev.c=C2=A0 =C2=A0 =C2=A0 =
| 26 ++++----<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_fence.c=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 8 +--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_gem.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_i2c.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_ib.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_irq_kms.c=C2=A0 =C2=A0 | 12 =
++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_kms.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 16 ++---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_object.c=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_pm.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 20 +++---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_ring.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_ttm.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/rs400.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/rs600.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/rs690.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/rv515.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/rv770.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/si.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A040 files changed, 192 insertions(+), 188 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/=
drm/radeon/atombios_encoders.c<br>
&gt; index 7b11674f5d45..05f34efd7fd0 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/atombios_encoders.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/atombios_encoders.c<br>
&gt; @@ -2179,7 +2179,7 @@ int radeon_atom_pick_dig_encoder(struct drm_enco=
der *encoder, int fe_idx)<br>
&gt;=C2=A0 =C2=A0void<br>
&gt;=C2=A0 =C2=A0radeon_atom_encoder_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_encoder *encoder;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(encoder, &amp;dev-&gt;mo=
de_config.encoder_list, head) {<br>
&gt; diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik=
.c<br>
&gt; index b5e96a8fc2c1..11a492f21157 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/cik.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/cik.c<br>
&gt; @@ -7585,7 +7585,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[0=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -7615,7 +7615,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[1=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -7645,7 +7645,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[2=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -7675,7 +7675,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[3=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -7705,7 +7705,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[4=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -7735,7 +7735,7 @@ int cik_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[5=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 5);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 5);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -8581,7 +8581,7 @@ int cik_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/rade=
on/dce6_afmt.c<br>
&gt; index 4c06f47453fd..d6ab93ed9ec4 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/dce6_afmt.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/dce6_afmt.c<br>
&gt; @@ -91,7 +91,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct rad=
eon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pin =3D &amp;rdev-&gt;audio.pin[i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pin_count =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0list_for_each_entry(encoder, &amp;rdev-&gt;ddev-&gt;mode_config.enco=
der_list, head) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0list_for_each_entry(encoder, &amp;rdev_to_drm(rdev)-&gt;mode_config.=
encoder_list, head) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_encoder_is_digital(enco=
der)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon=
_encoder =3D to_radeon_encoder(encoder);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dig =
=3D radeon_encoder-&gt;enc_priv;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/rade=
on/evergreen.c<br>
&gt; index c634dc28e6c3..bc4ab71613a5 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/evergreen.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/evergreen.c<br>
&gt; @@ -1673,7 +1673,7 @@ void evergreen_pm_misc(struct radeon_device *rde=
v)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void evergreen_pm_prepare(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -1698,7 +1698,7 @@ void evergreen_pm_prepare(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void evergreen_pm_finish(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -1763,7 +1763,7 @@ void evergreen_hpd_set_polarity(struct radeon_de=
vice *rdev,<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void evergreen_hpd_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned enabled =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp =3D DC_HPDx_CONNECTION_TIMER(0x9c4) =
|<br>
&gt; @@ -1804,7 +1804,7 @@ void evergreen_hpd_init(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void evergreen_hpd_fini(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned disabled =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -4753,7 +4753,7 @@ int evergreen_irq_process(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_name =3D &quot;vblank&quot;;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[c=
rtc_idx]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, crtc_idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), crtc_idx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -5211,7 +5211,7 @@ int evergreen_init(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt; diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c=
<br>
&gt; index 77aee99e473a..3890911fe693 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/ni.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/ni.c<br>
&gt; @@ -2360,7 +2360,7 @@ int cayman_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize memory controller */<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r1=
00.c<br>
&gt; index 0b1e19345f43..d7d7d23bf9a1 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r100.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r100.c<br>
&gt; @@ -459,7 +459,7 @@ void r100_pm_misc(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void r100_pm_prepare(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -490,7 +490,7 @@ void r100_pm_prepare(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void r100_pm_finish(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -603,7 +603,7 @@ void r100_hpd_set_polarity(struct radeon_device *r=
dev,<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void r100_hpd_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned enable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -626,7 +626,7 @@ void r100_hpd_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0void r100_hpd_fini(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned disable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -798,7 +798,7 @@ int r100_irq_process(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Vertical blan=
k interrupts */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp;=
 RADEON_CRTC_VBLANK_STAT) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[0]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev-&gt;ddev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev_to_drm(rdev), 0);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;pm.vblank_sync =3D true;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up(&amp;rdev-&gt;irq.vblank_q=
ueue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -807,7 +807,7 @@ int r100_irq_process(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp;=
 RADEON_CRTC2_VBLANK_STAT) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[1]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev-&gt;ddev, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev_to_drm(rdev), 1);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;pm.vblank_sync =3D true;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up(&amp;rdev-&gt;irq.vblank_q=
ueue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -1471,7 +1471,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_=
parser *p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0header =3D radeon_get_ib_value(p, h_idx);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_id =3D radeon_get_ib_value(p, h_idx + 5=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D R100_CP_PACKET0_GET_REG(header);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0crtc =3D drm_crtc_find(p-&gt;rdev-&gt;ddev, p-&gt=
;filp, crtc_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc =3D drm_crtc_find(rdev_to_drm(p-&gt;rdev), p=
-&gt;filp, crtc_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crtc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
cannot find crtc %d\n&quot;, crtc_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<=
br>
&gt; @@ -3059,7 +3059,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);<br>
&gt;=C2=A0 =C2=A0void=C2=A0 r100_debugfs_rbbm_init(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;r100_rbbm_info&quo=
t;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r100_debugfs_rbbm_info_fops);<br>
&gt; @@ -3069,7 +3069,7 @@ void=C2=A0 r100_debugfs_rbbm_init(struct radeon_=
device *rdev)<br>
&gt;=C2=A0 =C2=A0void r100_debugfs_cp_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;r100_cp_ring_info&=
quot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r100_debugfs_cp_ring_info_fops);<br>
&gt; @@ -3081,7 +3081,7 @@ void r100_debugfs_cp_init(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0void=C2=A0 r100_debugfs_mc_info_init(struct radeon_device =
*rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;r100_mc_info&quot;=
, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r100_debugfs_mc_info_fops);<br>
&gt; @@ -3947,7 +3947,7 @@ int r100_resume(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RREG32(R_0007C0_CP_STAT));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* post */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Resume clock after posting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r100_clock_startup(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt; @@ -4056,7 +4056,7 @@ int r100_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set asic errata */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r100_errata(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D radeon_agp=
_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r3=
00.c<br>
&gt; index 1620f534f55f..05c13102a8cb 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r300.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r300.c<br>
&gt; @@ -616,7 +616,7 @@ DEFINE_SHOW_ATTRIBUTE(rv370_debugfs_pcie_gart_info=
);<br>
&gt;=C2=A0 =C2=A0static void rv370_debugfs_pcie_gart_info_init(struct radeo=
n_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;rv370_pcie_gart_in=
fo&quot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rv370_debugfs_pcie_gart_info_fops);<br>
&gt; @@ -1452,7 +1452,7 @@ int r300_resume(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RREG32(R_0007C0_CP_STAT));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* post */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Resume clock after posting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r300_clock_startup(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt; @@ -1538,7 +1538,7 @@ int r300_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set asic errata */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r300_errata(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D radeon_agp=
_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r4=
20.c<br>
&gt; index a979662eaa73..9a31cdec6415 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r420.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r420.c<br>
&gt; @@ -322,7 +322,7 @@ int r420_resume(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;is_atom_bios) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atom_asic_init(r=
dev-&gt;mode_info.atom_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_combios_asic_i=
nit(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_combios_asic_i=
nit(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Resume clock after posting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r420_clock_resume(rdev);<br>
&gt; @@ -414,7 +414,7 @@ int r420_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D radeon_agp=
_init(rdev);<br>
&gt; @@ -493,7 +493,7 @@ DEFINE_SHOW_ATTRIBUTE(r420_debugfs_pipes_info);<br=
>
&gt;=C2=A0 =C2=A0void r420_debugfs_pipes_info_init(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;r420_pipes_info&qu=
ot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r420_debugfs_pipes_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r5=
20.c<br>
&gt; index 6cbcaa845192..08e127b3249a 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r520.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r520.c<br>
&gt; @@ -287,7 +287,7 @@ int r520_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atom_asic_init(r=
dev-&gt;mode_info.atom_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D radeon_agp=
_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r6=
00.c<br>
&gt; index 087d41e370fd..8b62f7faa5b9 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r600.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r600.c<br>
&gt; @@ -950,7 +950,7 @@ void r600_hpd_set_polarity(struct radeon_device *r=
dev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void r600_hpd_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned enable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1017,7 +1017,7 @@ void r600_hpd_init(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void r600_hpd_fini(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned disable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -3280,7 +3280,7 @@ int r600_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt; @@ -4136,7 +4136,7 @@ int r600_irq_process(struct radeon_device *rdev)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: D1 vblank - IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[0=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -4166,7 +4166,7 @@ int r600_irq_process(struct radeon_device *rdev)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DE=
BUG(&quot;IH: D2 vblank - IH event w/o asserted irq bit?\n&quot;);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[1=
]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -4358,7 +4358,7 @@ DEFINE_SHOW_ATTRIBUTE(r600_debugfs_mc_info);<br>
&gt;=C2=A0 =C2=A0static void r600_debugfs_mc_info_init(struct radeon_device=
 *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;r600_mc_info&quot;=
, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r600_debugfs_mc_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon=
/r600_cs.c<br>
&gt; index 6cf54a747749..1b2d31c4d77c 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r600_cs.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r600_cs.c<br>
&gt; @@ -884,7 +884,7 @@ int r600_cs_common_vline_parse(struct radeon_cs_pa=
rser *p,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_id =3D radeon_get_ib_value(p, h_idx + 2=
 + 7 + 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D R600_CP_PACKET0_GET_REG(header);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0crtc =3D drm_crtc_find(p-&gt;rdev-&gt;ddev, p-&gt=
;filp, crtc_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc =3D drm_crtc_find(rdev_to_drm(p-&gt;rdev), p=
-&gt;filp, crtc_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crtc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
cannot find crtc %d\n&quot;, crtc_id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT;<=
br>
&gt; diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeo=
n/r600_dpm.c<br>
&gt; index 64980a61d38a..81d58ef667dd 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r600_dpm.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r600_dpm.c<br>
&gt; @@ -153,7 +153,7 @@ void r600_dpm_print_ps_status(struct radeon_device=
 *rdev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0u32 r600_dpm_get_vblank_time(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vblank_in_pixels;<br>
&gt; @@ -180,7 +180,7 @@ u32 r600_dpm_get_vblank_time(struct radeon_device =
*rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0u32 r600_dpm_get_vrefresh(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 vrefresh =3D 0;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/rade=
on/r600_hdmi.c<br>
&gt; index f3551ebaa2f0..661f374f5f27 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/r600_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/r600_hdmi.c<br>
&gt; @@ -116,7 +116,7 @@ void r600_audio_update_hdmi(struct work_struct *wo=
rk)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D container_of(=
work, struct radeon_device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0audio_work);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct r600_audio_pin audio_status =3D r600_=
audio_status(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_encoder *encoder;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool changed =3D false;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/=
radeon.h<br>
&gt; index 0999c8eaae94..69bb30ced189 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon.h<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon.h<br>
&gt; @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_devi=
ce*, uint32_t, uint32_t);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct radeon_device {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ddev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pdev;<br>
&gt;=C2=A0 =C2=A0#ifdef __alpha__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_controller=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*hose;<br>
&gt; @@ -2440,10 +2440,13 @@ struct radeon_device {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 gart_pin_size;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static inline struct drm_device *rdev_to_drm(struct radeon_device *rd=
ev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &amp;rdev-&gt;ddev;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0bool radeon_is_px(struct drm_device *dev);<br>
&gt;=C2=A0 =C2=A0int radeon_device_init(struct radeon_device *rdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct drm_device *ddev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct pci_dev *pdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t flags);<br>
&gt;=C2=A0 =C2=A0void radeon_device_fini(struct radeon_device *rdev);<br>
&gt;=C2=A0 =C2=A0int radeon_gpu_wait_for_idle(struct radeon_device *rdev);<=
br>
&gt; @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm=
_device *bdev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* KMS */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long f=
lags);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);<=
br>
&gt;=C2=A0 =C2=A0int radeon_enable_vblank_kms(struct drm_crtc *crtc);<br>
&gt;=C2=A0 =C2=A0void radeon_disable_vblank_kms(struct drm_crtc *crtc);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/ra=
deon/radeon_acpi.c<br>
&gt; index 603a78e41ba5..22ce61bdfc06 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_acpi.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_acpi.c<br>
&gt; @@ -405,11 +405,11 @@ static int radeon_atif_handler(struct radeon_dev=
ice *rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (req.pending &amp; ATIF_DGPU_DISPLAY_EVEN=
T) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((rdev-&gt;fl=
ags &amp; RADEON_IS_PX) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra=
deon_atpx_dgpu_req_power_for_displays()) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_get_sync(rdev-&gt;ddev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_get_sync(rdev_to_drm(rdev)-&gt;dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Just fire off a uevent and let userspace tell us what to do=
 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_helper_hpd_irq_event(rdev-&gt;ddev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_mark_last_busy(rdev-&gt;ddev-&gt;dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_put_autosuspend(rdev-&gt;ddev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_helper_hpd_irq_event(rdev_to_drm(rdev));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_mark_last_busy(rdev_to_drm(rdev)-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pm_runtime_put_autosuspend(rdev_to_drm(rdev)-&gt;dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: check other events */<br>
&gt; @@ -736,7 +736,7 @@ int radeon_acpi_init(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_en=
coder *target =3D NULL;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find the enco=
der controlling the brightness */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(t=
mp, &amp;rdev-&gt;ddev-&gt;mode_config.encoder_list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(t=
mp, &amp;rdev_to_drm(rdev)-&gt;mode_config.encoder_list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0head) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct radeon_encoder *enc =3D to_radeon_encoder(tmp);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/rad=
eon/radeon_agp.c<br>
&gt; index a3d749e350f9..89d7b0e9e79f 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_agp.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_agp.c<br>
&gt; @@ -161,7 +161,7 @@ struct radeon_agp_head *radeon_agp_head_init(struc=
t drm_device *dev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int radeon_agp_head_acquire(struct radeon_device *r=
dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev *pdev =3D to_pci_dev(dev-&gt;=
dev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;agp)<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/dr=
m/radeon/radeon_atombios.c<br>
&gt; index 10793a433bf5..97c4e10d0550 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_atombios.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_atombios.c<br>
&gt; @@ -187,7 +187,7 @@ void radeon_atombios_i2c_init(struct radeon_device=
 *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (i2c.valid) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(stmp, &quot;0x%x&quot;, i2=
c.i2c_id);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;i2c_bus[i] =3D radeon_i2c_creat=
e(rdev-&gt;ddev, &amp;i2c, stmp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;i2c_bus[i] =3D radeon_i2c_creat=
e(rdev_to_drm(rdev), &amp;i2c, stmp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0gpio =3D (ATOM_GPIO_I2C_ASSIGMENT *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((u8 *)gpio + sizeof(ATOM_GPIO_I2C=
_ASSIGMENT));<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/r=
adeon/radeon_audio.c<br>
&gt; index 74753bb26d33..31f032295497 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_audio.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_audio.c<br>
&gt; @@ -196,7 +196,7 @@ static void radeon_audio_enable(struct radeon_devi=
ce *rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;mode_info.mode_config_initializ=
ed) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(e=
ncoder, &amp;rdev-&gt;ddev-&gt;mode_config.encoder_list, head) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(e=
ncoder, &amp;rdev_to_drm(rdev)-&gt;mode_config.encoder_list, head) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (radeon_encoder_is_digital(encoder)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_encoder =3D to_radeon_encod=
er(encoder);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dig =3D radeon_encoder-&gt;enc_pri=
v;<br>
&gt; @@ -759,7 +759,7 @@ static int radeon_audio_component_get_eld(struct d=
evice *kdev, int port,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;audio.enabled || !rdev-&gt;mod=
e_info.mode_config_initialized)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0list_for_each_entry(encoder, &amp;rdev-&gt;ddev-&=
gt;mode_config.encoder_list, head) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(encoder, &amp;rdev_to_drm(rde=
v)-&gt;mode_config.encoder_list, head) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!radeon_enco=
der_is_digital(encoder))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_encoder =
=3D to_radeon_encoder(encoder);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm=
/radeon/radeon_combios.c<br>
&gt; index 6952b1273b0f..41ddc576f8f8 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_combios.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_combios.c<br>
&gt; @@ -372,7 +372,7 @@ bool radeon_combios_check_hardcoded_edid(struct ra=
deon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int edid_info, size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct edid *edid;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *raw;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0edid_info =3D combios_get_table_offset(rdev-&gt;d=
dev, COMBIOS_HARDCODED_EDID_TABLE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0edid_info =3D combios_get_table_offset(rdev_to_dr=
m(rdev), COMBIOS_HARDCODED_EDID_TABLE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!edid_info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -642,7 +642,7 @@ static struct radeon_i2c_bus_rec combios_setup_i2c=
_bus(struct radeon_device *rde<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static struct radeon_i2c_bus_rec radeon_combios_get_i2c_in=
fo_from_table(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_i2c_bus_rec i2c;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 id, blocks, clk, data;<br>
&gt; @@ -670,7 +670,7 @@ static struct radeon_i2c_bus_rec radeon_combios_ge=
t_i2c_info_from_table(struct r<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void radeon_combios_i2c_init(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_i2c_bus_rec i2c;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* actual hw pads<br>
&gt; @@ -812,7 +812,7 @@ bool radeon_combios_get_clock_info(struct drm_devi=
ce *dev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool radeon_combios_sideport_present(struct radeon_device =
*rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 igp_info;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* sideport is AMD only */<br>
&gt; @@ -915,7 +915,7 @@ struct radeon_encoder_primary_dac *radeon_combios_=
get_primary_dac_info(struct<br>
&gt;=C2=A0 =C2=A0enum radeon_tv_std<br>
&gt;=C2=A0 =C2=A0radeon_combios_get_tv_info(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t tv_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0enum radeon_tv_std tv_std =3D TV_STD_NTSC;<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -2637,7 +2637,7 @@ static const char *thermal_controller_names[] =
=3D {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void radeon_combios_get_power_modes(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 offset, misc, misc2 =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 rev, tmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int state_index =3D 0;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/=
radeon/radeon_device.c<br>
&gt; index afbb3a80c0c6..36444d739b41 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_device.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_device.c<br>
&gt; @@ -760,7 +760,7 @@ bool radeon_boot_test_post_card(struct radeon_devi=
ce *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;is_=
atom_bios)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0atom_asic_init(rdev-&gt;mode_info.atom_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0radeon_combios_asic_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0radeon_combios_asic_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(rdev-&gt=
;dev, &quot;Card not posted and no BIOS - ignoring\n&quot;);<br>
&gt; @@ -980,7 +980,7 @@ int radeon_atombios_init(struct radeon_device *rde=
v)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.atom_card_info =3D atom_c=
ard_info;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0atom_card_info-&gt;dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0atom_card_info-&gt;dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0atom_card_info-&gt;reg_read =3D cail_reg_rea=
d;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0atom_card_info-&gt;reg_write =3D cail_reg_wr=
ite;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* needed for iio ops */<br>
&gt; @@ -1005,7 +1005,7 @@ int radeon_atombios_init(struct radeon_device *r=
dev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;rdev-&gt;mode_info.atom_cont=
ext-&gt;mutex);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;rdev-&gt;mode_info.atom_cont=
ext-&gt;scratch_mutex);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_atom_initialize_bios_scratch_regs(rdev-&gt=
;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_atom_initialize_bios_scratch_regs(rdev_to_=
drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0atom_allocate_fb_scratch(rdev-&gt;mode_info.=
atom_context);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -1049,7 +1049,7 @@ void radeon_atombios_fini(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0int radeon_combios_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_combios_initialize_bios_scratch_regs(rdev-=
&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_combios_initialize_bios_scratch_regs(rdev_=
to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1276,18 +1276,15 @@ static const struct vga_switcheroo_client_ops =
radeon_switcheroo_ops =3D {<br>
&gt;=C2=A0 =C2=A0 * Called at driver startup.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0int radeon_device_init(struct radeon_device *rdev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct drm_device *ddev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct pci_dev *pdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t flags)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pci_dev *pdev =3D rdev-&gt;pdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r, i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int dma_bits;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool runtime =3D false;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;shutdown =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev =3D ddev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;pdev =3D pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;flags =3D flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;family =3D flags &amp; RADEON_FAMIL=
Y_MASK;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;is_atom_bios =3D false;<br>
&gt; @@ -1847,7 +1844,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0downgrade_write(&amp;rdev-&gt;exclusive_lock=
);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_helper_resume_force_mode(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_helper_resume_force_mode(rdev_to_drm(rdev));<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set the power state here in case we are a=
 PX system or headless */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((rdev-&gt;pm.pm_method =3D=3D PM_METHOD_=
DPM) &amp;&amp; rdev-&gt;pm.dpm_enabled)<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm=
/radeon/radeon_display.c<br>
&gt; index 5f1d24d3120c..4b9473852c1f 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_display.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_display.c<br>
&gt; @@ -302,13 +302,13 @@ void radeon_crtc_handle_vblank(struct radeon_dev=
ice *rdev, int crtc_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((radeon_use_pflipirq =3D=3D 2) &amp;&amp=
; ASIC_IS_DCE4(rdev))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;rdev-&gt;ddev-&gt;event_lo=
ck, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;rdev_to_drm(rdev)-&gt;even=
t_lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_crtc-&gt;flip_status !=3D RADEON_=
FLIP_SUBMITTED) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER=
(&quot;radeon_crtc-&gt;flip_status =3D %d !=3D &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;RADEON_FLIP_SUBMITTED(%d)\n=
&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeon_crtc-&gt;flip_status,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RADEON_FLIP_SUBMITTED);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestor=
e(&amp;rdev-&gt;ddev-&gt;event_lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestor=
e(&amp;rdev_to_drm(rdev)-&gt;event_lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -334,7 +334,7 @@ void radeon_crtc_handle_vblank(struct radeon_devic=
e *rdev, int crtc_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (update_pending &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(DRM_SCANOUTPOS_VALID &amp;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeon_get_crtc_scanoutpos(rdev-&g=
t;ddev, crtc_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeon_get_crtc_scanoutpos(rdev_to=
_drm(rdev), crtc_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GET_DI=
STANCE_TO_VBLANKSTART,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;v=
pos, &amp;hpos, NULL, NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;r=
dev-&gt;mode_info.crtcs[crtc_id]-&gt;base.hwmode)) &amp;&amp;<br>
&gt; @@ -347,7 +347,7 @@ void radeon_crtc_handle_vblank(struct radeon_devic=
e *rdev, int crtc_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_pending =
=3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;rdev-&gt;ddev-&gt;eve=
nt_lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;rdev_to_drm(rdev)-&gt=
;event_lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!update_pending)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_crtc_hand=
le_flip(rdev, crtc_id);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -370,14 +370,14 @@ void radeon_crtc_handle_flip(struct radeon_devic=
e *rdev, int crtc_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_crtc =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;rdev-&gt;ddev-&gt;event_lo=
ck, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;rdev_to_drm(rdev)-&gt;even=
t_lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0work =3D radeon_crtc-&gt;flip_work;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_crtc-&gt;flip_status !=3D RADEON_=
FLIP_SUBMITTED) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER=
(&quot;radeon_crtc-&gt;flip_status =3D %d !=3D &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;RADEON_FLIP_SUBMITTED(%d)\n=
&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeon_crtc-&gt;flip_status,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RADEON_FLIP_SUBMITTED);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestor=
e(&amp;rdev-&gt;ddev-&gt;event_lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestor=
e(&amp;rdev_to_drm(rdev)-&gt;event_lock, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -389,7 +389,7 @@ void radeon_crtc_handle_flip(struct radeon_device =
*rdev, int crtc_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (work-&gt;event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_vb=
lank_event(&amp;radeon_crtc-&gt;base, work-&gt;event);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;rdev-&gt;ddev-&gt;eve=
nt_lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;rdev_to_drm(rdev)-&gt=
;event_lock, flags);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_put(&amp;radeon_crtc-&gt;bas=
e);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_irq_kms_pflip_irq_put(rdev, work-&gt;=
crtc_id);<br>
&gt; @@ -408,7 +408,7 @@ static void radeon_flip_work_func(struct work_stru=
ct *__work)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_flip_work *work =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(__w=
ork, struct radeon_flip_work, flip_work);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D work-&gt;rdev=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc =3D rdev-&gt=
;mode_info.crtcs[work-&gt;crtc_id];<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc =3D &amp;radeon_crtc-&=
gt;base;<br>
&gt; @@ -1401,7 +1401,7 @@ static int radeon_modeset_create_props(struct ra=
deon_device *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;is_atom_bios) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_in=
fo.coherent_mode_property =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_property_create_range(rdev-&gt;ddev, 0 , &quot;coherent&quot;, 0=
, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_property_create_range(rdev_to_drm(rdev), 0, &quot;coherent&quot;=
, 0, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;mo=
de_info.coherent_mode_property)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENOMEM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -1409,57 +1409,57 @@ static int radeon_modeset_create_props(struct =
radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ASIC_IS_AVIVO(rdev)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZ=
E(radeon_tmds_pll_enum_list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_in=
fo.tmds_pll_property =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_property_create_enum(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_property_create_enum(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tmds_pll&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0radeon_tmds_pll_enum_list, sz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.load_detect_property =3D<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev-&gt;ddev, 0, &quot;load detection&quot;, 0, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev_to_drm(rdev), 0, &quot;load detection&quot;, 0, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;mode_info.load_detect_property=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_mode_create_scaling_mode_property(rdev-&gt;dd=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_create_scaling_mode_property(rdev_to_drm=
(rdev));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZE(radeon_tv_std_enum_list);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.tv_std_property =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;tv standard&qu=
ot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_tv_std_enum_l=
ist, sz);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZE(radeon_underscan_enum_list=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.underscan_property =3D<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;underscan&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_underscan_enu=
m_list, sz);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.underscan_hborder_propert=
y =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
underscan hborder&quot;, 0, 128);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;mode_info.underscan_hborder_pr=
operty)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.underscan_vborder_propert=
y =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_r=
ange(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
underscan vborder&quot;, 0, 128);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rdev-&gt;mode_info.underscan_vborder_pr=
operty)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZE(radeon_audio_enum_list);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.audio_property =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;audio&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeo=
n_audio_enum_list, sz);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZE(radeon_dither_enum_list);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.dither_property =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;dither&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeo=
n_dither_enum_list, sz);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D ARRAY_SIZE(radeon_output_csc_enum_lis=
t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.output_csc_property =3D<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev-&gt;ddev, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_property_create_e=
num(rdev_to_drm(rdev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;output_csc&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 radeo=
n_output_csc_enum_list, sz);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1578,29 +1578,29 @@ int radeon_modeset_init(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_mode_config_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_mode_config_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_info.mode_config_initialized =
=3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mode_config.funcs =3D &amp;rade=
on_mode_funcs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt;mode_config.funcs =3D &amp;=
radeon_mode_funcs;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_use_pflipirq =3D=3D 2 &amp;&amp; =
rdev-&gt;family &gt;=3D CHIP_R600)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.async_page_flip =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.async_page_flip =3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ASIC_IS_DCE5(rdev)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_width =3D 16384;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_height =3D 16384;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_width =3D 16384;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_height =3D 16384;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ASIC_IS_AVIVO(rdev)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_width =3D 8192;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_height =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_width =3D 8192;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_height =3D 8192;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_width =3D 4096;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mod=
e_config.max_height =3D 4096;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_width =3D 4096;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt=
;mode_config.max_height =3D 4096;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mode_config.preferred_depth =3D=
 24;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mode_config.prefer_shadow =3D 1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt;mode_config.preferred_depth=
 =3D 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt;mode_config.prefer_shadow =
=3D 1;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;mode_config.fb_modifiers_not_su=
pported =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt;mode_config.fb_modifiers_no=
t_supported =3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D radeon_modeset_create_props(rdev);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; @@ -1618,11 +1618,11 @@ int radeon_modeset_init(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* allocate crtcs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; rdev-&gt;num_crtc; i++)=
 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_crtc_init(rdev=
-&gt;ddev, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_crtc_init(rdev=
_to_drm(rdev), i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* okay we should have all the bios connecto=
rs */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D radeon_setup_enc_conn(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D radeon_setup_enc_conn(rdev_to_drm(rdev));=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -1639,7 +1639,7 @@ int radeon_modeset_init(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup afmt */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_afmt_init(rdev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* do pm late init */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D radeon_pm_late_init(rdev);<br>
&gt; @@ -1650,11 +1650,11 @@ int radeon_modeset_init(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0void radeon_modeset_fini(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;mode_info.mode_config_initializ=
ed) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_f=
ini(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_kms_helper_poll_f=
ini(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_hpd_fini(=
rdev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_helper_force_disa=
ble_all(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_helper_force_disa=
ble_all(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_afmt_fini=
(rdev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_clean=
up(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_mode_config_clean=
up(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;mode_in=
fo.mode_config_initialized =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/rad=
eon/radeon_drv.c<br>
&gt; index 7bf08164140e..89941a90e17f 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_drv.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_drv.c<br>
&gt; @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pci_device_id *ent)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ent)<br>
&gt; @@ -300,28 +301,36 @@ static int radeon_pci_probe(struct pci_dev *pdev=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev =3D drm_dev_alloc(&amp;kms_driver, &amp;pdev-=
&gt;dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (IS_ERR(dev))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dev);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev =3D devm_drm_dev_alloc(&amp;pdev-&gt;dev, &a=
mp;kms_driver, typeof(*rdev), ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(rdev))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(rdev);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev-&gt;dev=C2=A0 =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev-&gt;pdev =3D pdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ddev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pci_enable_device(pdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_free;<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pci_set_drvdata(pdev, dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pci_set_drvdata(pdev, ddev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D radeon_driver_load_kms(rdev, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_agp;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D drm_dev_register(dev, ent-&gt;driver_data=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_dev_register(ddev, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_agp;<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_fbdev_setup(dev-&gt;dev_private);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_fbdev_setup(ddev-&gt;dev_private);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0err_agp:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_disable_device(pdev);<br>
&gt;=C2=A0 =C2=A0err_free:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_dev_put(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dev_put(ddev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -569,7 +578,7 @@ static const struct drm_ioctl_desc radeon_ioctls_k=
ms[] =3D {<br>
&gt;=C2=A0 =C2=A0static const struct drm_driver kms_driver =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_features =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRIVER_GEM | DRIVER_RENDER | D=
RIVER_MODESET,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0.load =3D radeon_driver_load_kms,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// .load =3D radeon_driver_load_kms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D radeon_driver_open_kms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.postclose =3D radeon_driver_postclose_kms,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.unload =3D radeon_driver_unload_kms,<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/rad=
eon/radeon_drv.h<br>
&gt; index 02a65971d140..6c1eb75a951b 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_drv.h<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_drv.h<br>
&gt; @@ -117,7 +117,6 @@<br>
&gt;=C2=A0 =C2=A0long radeon_drm_ioctl(struct file *filp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0unsigned int cmd, unsigned long arg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flag=
s);<br>
&gt;=C2=A0 =C2=A0void radeon_driver_unload_kms(struct drm_device *dev);<br>
&gt;=C2=A0 =C2=A0int radeon_driver_open_kms(struct drm_device *dev, struct =
drm_file *file_priv);<br>
&gt;=C2=A0 =C2=A0void radeon_driver_postclose_kms(struct drm_device *dev,<b=
r>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/r=
adeon/radeon_fbdev.c<br>
&gt; index 02bf25759059..fb70de29545c 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_fbdev.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c<br>
&gt; @@ -67,7 +67,7 @@ static int radeon_fbdev_create_pinned_object(struct =
drm_fb_helper *fb_helper,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int height =3D mode_cmd-&gt;height;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cpp;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0info =3D drm_get_format_info(rdev-&gt;ddev, mode_=
cmd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info =3D drm_get_format_info(rdev_to_drm(rdev), m=
ode_cmd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpp =3D info-&gt;cpp[0];<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* need to align pitch with crtc limits */<b=
r>
&gt; @@ -148,15 +148,15 @@ static int radeon_fbdev_fb_open(struct fb_info *=
info, int user)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D fb_helper-&gt=
;dev-&gt;dev_private;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(rdev-&gt;ddev-&gt;dev=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(rdev_to_drm(rdev)-&gt=
;dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0 &amp;&amp; ret !=3D -EACCES)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pm_runt=
ime_mark_last_busy;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0err_pm_runtime_mark_last_busy:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(rdev-&gt;ddev-&gt;dev);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(rdev-&gt;ddev-&gt;dev)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(rdev_to_drm(rdev)-&gt;d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(rdev_to_drm(rdev)-&gt;=
dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -165,8 +165,8 @@ static int radeon_fbdev_fb_release(struct fb_info =
*info, int user)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_fb_helper *fb_helper =3D info-&gt=
;par;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D fb_helper-&gt=
;dev-&gt;dev_private;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(rdev-&gt;ddev-&gt;dev);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(rdev-&gt;ddev-&gt;dev)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy(rdev_to_drm(rdev)-&gt;d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_autosuspend(rdev_to_drm(rdev)-&gt;=
dev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -236,7 +236,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct =
drm_fb_helper *fb_helper,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ENOMEM;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_radeon_=
fbdev_destroy_pinned_object;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D radeon_framebuffer_init(rdev-&gt;ddev, fb=
, &amp;mode_cmd, gobj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D radeon_framebuffer_init(rdev_to_drm(rdev)=
, fb, &amp;mode_cmd, gobj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;=
failed to initialize framebuffer %d\n&quot;, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_kfree;<=
br>
&gt; @@ -374,12 +374,12 @@ void radeon_fbdev_setup(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fb_helper =3D kzalloc(sizeof(*fb_helper), GF=
P_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fb_helper)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_fb_helper_prepare(rdev-&gt;ddev, fb_helper, b=
pp_sel, &amp;radeon_fbdev_fb_helper_funcs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_fb_helper_prepare(rdev_to_drm(rdev), fb_helpe=
r, bpp_sel, &amp;radeon_fbdev_fb_helper_funcs);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D drm_client_init(rdev-&gt;ddev, &amp;fb_he=
lper-&gt;client, &quot;radeon-fbdev&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_client_init(rdev_to_drm(rdev), &amp;f=
b_helper-&gt;client, &quot;radeon-fbdev&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;radeon_fbdev_client_funcs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(rdev-&gt;ddev=
, &quot;Failed to register client: %d\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(rdev_to_drm(r=
dev), &quot;Failed to register client: %d\n&quot;, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_drm_cli=
ent_init;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -394,13 +394,13 @@ void radeon_fbdev_setup(struct radeon_device *rd=
ev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void radeon_fbdev_set_suspend(struct radeon_device *rdev, =
int state)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (rdev-&gt;ddev-&gt;fb_helper)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fb_helper_set_sus=
pend(rdev-&gt;ddev-&gt;fb_helper, state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rdev_to_drm(rdev)-&gt;fb_helper)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_fb_helper_set_sus=
pend(rdev_to_drm(rdev)-&gt;fb_helper, state);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, s=
truct radeon_bo *robj)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_fb_helper *fb_helper =3D rdev-&gt;ddev=
-&gt;fb_helper;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_fb_helper *fb_helper =3D rdev_to_drm(r=
dev)-&gt;fb_helper;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *gobj;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fb_helper)<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/r=
adeon/radeon_fence.c<br>
&gt; index 4fb780d96f32..daff61586be5 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_fence.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_fence.c<br>
&gt; @@ -150,7 +150,7 @@ int radeon_fence_emit(struct radeon_device *rdev,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rdev-&gt;fence_context + ring,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 seq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_ring_emit(rdev, ring, *fence);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0trace_radeon_fence_emit(rdev-&gt;ddev, ring, (*fe=
nce)-&gt;seq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0trace_radeon_fence_emit(rdev_to_drm(rdev), ring, =
(*fence)-&gt;seq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_schedule_check(rdev, ring);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -489,7 +489,7 @@ static long radeon_fence_wait_seq_timeout(struct r=
adeon_device *rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!target_seq[=
i])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_radeon_fence_wa=
it_begin(rdev-&gt;ddev, i, target_seq[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_radeon_fence_wa=
it_begin(rdev_to_drm(rdev), i, target_seq[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_irq_kms_s=
w_irq_get(rdev, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -511,7 +511,7 @@ static long radeon_fence_wait_seq_timeout(struct r=
adeon_device *rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_irq_kms_s=
w_irq_put(rdev, i);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_radeon_fence_wa=
it_end(rdev-&gt;ddev, i, target_seq[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_radeon_fence_wa=
it_end(rdev_to_drm(rdev), i, target_seq[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
&gt; @@ -995,7 +995,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(radeon_debugfs_gpu_reset_=
fops,<br>
&gt;=C2=A0 =C2=A0void radeon_debugfs_fence_init(struct radeon_device *rdev)=
<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;radeon_gpu_reset&q=
uot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;radeon_debugfs_gpu_reset_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rad=
eon/radeon_gem.c<br>
&gt; index 2ef201a072f1..9dd4ff09d562 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_gem.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_gem.c<br>
&gt; @@ -899,7 +899,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_gem_info);<br=
>
&gt;=C2=A0 =C2=A0void radeon_gem_debugfs_init(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;radeon_gem_info&qu=
ot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;radeon_debugfs_gem_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/rad=
eon/radeon_i2c.c<br>
&gt; index 3d174390a8af..1f16619ed06e 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_i2c.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_i2c.c<br>
&gt; @@ -1011,7 +1011,7 @@ void radeon_i2c_add(struct radeon_device *rdev,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
ruct radeon_i2c_bus_rec *rec,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0co=
nst char *name)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; RADEON_MAX_I2C_BUS; i++=
) {<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/rade=
on/radeon_ib.c<br>
&gt; index 63d914f3414d..1aa41cc3f991 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ib.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ib.c<br>
&gt; @@ -309,7 +309,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_sa_info);<br>
&gt;=C2=A0 =C2=A0static void radeon_debugfs_sa_init(struct radeon_device *r=
dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;radeon_sa_info&quo=
t;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;radeon_debugfs_sa_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm=
/radeon/radeon_irq_kms.c<br>
&gt; index c4dda908666c..9961251b44ba 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c<br>
&gt; @@ -80,7 +80,7 @@ static void radeon_hotplug_work_func(struct work_str=
uct *work)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D container_of(=
work, struct radeon_device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://hotplug_work.work" rel=3D"=
noreferrer" target=3D"_blank">hotplug_work.work</a>);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_config *mode_config =3D &amp=
;dev-&gt;mode_config;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -101,7 +101,7 @@ static void radeon_dp_work_func(struct work_struct=
 *work)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D container_of(=
work, struct radeon_device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dp_work);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_mode_config *mode_config =3D &amp=
;dev-&gt;mode_config;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -197,7 +197,7 @@ static void radeon_driver_irq_uninstall_kms(struct=
 drm_device *dev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int radeon_irq_install(struct radeon_device *rdev, =
int irq)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq =3D=3D IRQ_NOTCONNECTED)<br>
&gt; @@ -218,7 +218,7 @@ static int radeon_irq_install(struct radeon_device=
 *rdev, int irq)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void radeon_irq_uninstall(struct radeon_device *rde=
v)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_dev *pdev =3D to_pci_dev(dev-&gt;=
dev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_driver_irq_uninstall_kms(dev);<br>
&gt; @@ -322,9 +322,9 @@ int radeon_irq_kms_init(struct radeon_device *rdev=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;rdev-&gt;irq.lock);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable vblank irqs aggressively for powe=
r-saving */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev-&gt;ddev-&gt;vblank_disable_immediate =3D tr=
ue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rdev_to_drm(rdev)-&gt;vblank_disable_immediate =
=3D true;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0r =3D drm_vblank_init(rdev-&gt;ddev, rdev-&gt;num=
_crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r =3D drm_vblank_init(rdev_to_drm(rdev), rdev-&gt=
;num_crtc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/rad=
eon/radeon_kms.c<br>
&gt; index a16590c6247f..171f8e9fce88 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_kms.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_kms.c<br>
&gt; @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device =
*dev)<br>
&gt;=C2=A0 =C2=A0 * (crtcs, encoders, hotplug detect, etc.).<br>
&gt;=C2=A0 =C2=A0 * Returns 0 on success, error on failure.<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt; -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flag=
s)<br>
&gt; +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long =
flags)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct pci_dev *pdev =3D to_pci_dev(dev-&gt;dev);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pci_dev *pdev =3D rdev-&gt;pdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r, acpi_status;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rdev =3D kzalloc(sizeof(struct radeon_device), GF=
P_KERNEL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (rdev =3D=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0dev-&gt;dev_private =3D (void *)rdev;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#ifdef __alpha__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;hose =3D pdev-&gt;sysdata;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pci_find_capability(pdev, PCI_CAP_ID_AGP=
))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;agp =3D rade=
on_agp_head_init(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;agp =3D rade=
on_agp_head_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;agp) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;agp-&gt=
;agp_mtrr =3D arch_phys_wc_add(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rdev-&gt;agp-&gt;agp_info.aper_base,<br>
&gt; @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev,=
 unsigned long flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * properly initialize the GPU MC controller=
 and permit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * VRAM allocation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0r =3D radeon_device_init(rdev, dev, pdev, flags);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0r =3D radeon_device_init(rdev, flags);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev-&gt;=
dev, &quot;Fatal error during GPU init\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/=
radeon/radeon_object.c<br>
&gt; index a955f8a2f7fe..450ff7daa46c 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_object.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_object.c<br>
&gt; @@ -150,7 +150,7 @@ int radeon_bo_create(struct radeon_device *rdev,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bo =3D kzalloc(sizeof(struct radeon_bo), GFP=
_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0drm_gem_private_object_init(rdev-&gt;ddev, &amp;b=
o-&gt;tbo.base, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_gem_private_object_init(rdev_to_drm(rdev), &a=
mp;bo-&gt;tbo.base, size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;rdev =3D rdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;surface_reg =3D -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;bo-&gt;list);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/rade=
on/radeon_pm.c<br>
&gt; index 2d9d9f46f243..b4fb7e70320b 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_pm.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_pm.c<br>
&gt; @@ -282,7 +282,7 @@ static void radeon_pm_set_clocks(struct radeon_dev=
ice *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.installed) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_crtc(crt=
c, rdev-&gt;ddev) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_crtc(crt=
c, rdev_to_drm(rdev)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;pm.active_crtcs &amp; (1 &lt;&lt; i)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This can fail if a modeset is i=
n progress */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_crtc_vblank_get(crtc) =3D=
=3D 0)<br>
&gt; @@ -299,7 +299,7 @@ static void radeon_pm_set_clocks(struct radeon_dev=
ice *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.installed) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_crtc(crt=
c, rdev-&gt;ddev) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_crtc(crt=
c, rdev_to_drm(rdev)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;pm.req_vblank &amp; (1 &lt;&lt; i)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;pm.req_vblank &amp;=3D ~(=
1 &lt;&lt; i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_put(crtc);<br>
&gt; @@ -671,7 +671,7 @@ static ssize_t radeon_hwmon_show_temp(struct devic=
e *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br=
>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D dev_get_drvda=
ta(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int temp;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Can&#39;t get temperature when the card i=
s off */<br>
&gt; @@ -715,7 +715,7 @@ static ssize_t radeon_hwmon_show_sclk(struct devic=
e *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=
_attribute *attr, char *buf)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D dev_get_drvda=
ta(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 sclk =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Can&#39;t get clock frequency when the ca=
rd is off */<br>
&gt; @@ -740,7 +740,7 @@ static ssize_t radeon_hwmon_show_vddc(struct devic=
e *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=
_attribute *attr, char *buf)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D dev_get_drvda=
ta(dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 vddc =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Can&#39;t get vddc when the card is off *=
/<br>
&gt; @@ -1692,7 +1692,7 @@ void radeon_pm_fini(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void radeon_pm_compute_clocks_old(struct radeon_dev=
ice *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1765,7 +1765,7 @@ static void radeon_pm_compute_clocks_old(struct =
radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void radeon_pm_compute_clocks_dpm(struct radeon_dev=
ice *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_connector *radeon_connector;<b=
r>
&gt; @@ -1826,7 +1826,7 @@ static bool radeon_pm_in_vbl(struct radeon_devic=
e *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (crtc =3D 0; (crtc &lt; rdev-&gt;num_crt=
c) &amp;&amp; in_vbl; crtc++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;pm.=
active_crtcs &amp; (1 &lt;&lt; crtc)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vbl_status =3D radeon_get_crtc_scanoutpos(rdev-&gt;ddev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vbl_status =3D radeon_get_crtc_scanoutpos(rdev_to_drm(rdev),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0crtc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0USE_REAL_VBLANKSTART,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;vpos, &amp;hpos, NULL, NULL,<br>
&gt; @@ -1918,7 +1918,7 @@ static void radeon_dynpm_idle_work_handler(struc=
t work_struct *work)<br>
&gt;=C2=A0 =C2=A0static int radeon_debugfs_pm_info_show(struct seq_file *m,=
 void *unused)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_device *rdev =3D m-&gt;private=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if=C2=A0 ((rdev-&gt;flags &amp; RADEON_IS_PX=
) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ddev-&gt;switch_power_state =
!=3D DRM_SWITCH_POWER_ON)) {<br>
&gt; @@ -1955,7 +1955,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);<b=
r>
&gt;=C2=A0 =C2=A0static void radeon_debugfs_pm_init(struct radeon_device *r=
dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;radeon_pm_info&quo=
t;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;radeon_debugfs_pm_info_fops);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/ra=
deon/radeon_ring.c<br>
&gt; index 8d1d458286a8..581ae20c46e4 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ring.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ring.c<br>
&gt; @@ -550,7 +550,7 @@ static void radeon_debugfs_ring_init(struct radeon=
_device *rdev, struct radeon_r<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ring_name =3D radeon_debugfs_rin=
g_idx_to_name(ring-&gt;idx);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ring_name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_f=
ile(ring_name, 0444, root, ring,<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rad=
eon/radeon_ttm.c<br>
&gt; index 5c65b6dfb99a..69d0c12fa419 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; @@ -682,8 +682,8 @@ int radeon_ttm_init(struct radeon_device *rdev)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* No others user of address space so set it=
 to 0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D ttm_device_init(&amp;rdev-&gt;mman.bde=
v, &amp;radeon_bo_driver, rdev-&gt;dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev-&gt;ddev-&gt;anon_inode-&gt;i_mapping,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev-&gt;ddev-&gt;vma_offset_manager,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev_to_drm(rdev)-&gt;anon_inode-&gt;i_mapping=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev_to_drm(rdev)-&gt;vma_offset_manager,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev-&gt;need_swiotlb,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addressing_limited(&amp;rdev-&gt;pde=
v-&gt;dev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt; @@ -890,7 +890,7 @@ static const struct file_operations radeon_ttm_gtt=
_fops =3D {<br>
&gt;=C2=A0 =C2=A0static void radeon_ttm_debugfs_init(struct radeon_device *=
rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_minor *minor =3D rdev-&gt;ddev-&gt;pri=
mary;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_minor *minor =3D rdev_to_drm(rdev)-&gt=
;primary;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dentry *root =3D minor-&gt;debugfs_ro=
ot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;radeon_vram&quot;,=
 0444, root, rdev,<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/r=
s400.c<br>
&gt; index d4d1501e6576..d6c18fd740ec 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rs400.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rs400.c<br>
&gt; @@ -379,7 +379,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);<br=
>
&gt;=C2=A0 =C2=A0static void rs400_debugfs_pcie_gart_info_init(struct radeo=
n_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;rs400_gart_info&qu=
ot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rs400_debugfs_gart_info_fops);<br>
&gt; @@ -474,7 +474,7 @@ int rs400_resume(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RREG32(R_0007C0_CP_STAT));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* post */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_combios_asic_init(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Resume clock after posting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r300_clock_startup(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt; @@ -552,7 +552,7 @@ int rs400_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize memory controller */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rs400_mc_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/r=
s600.c<br>
&gt; index 5c162778899b..88c8e91ea651 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rs600.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rs600.c<br>
&gt; @@ -321,7 +321,7 @@ void rs600_pm_misc(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void rs600_pm_prepare(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -339,7 +339,7 @@ void rs600_pm_prepare(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void rs600_pm_finish(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *ddev =3D rdev_to_drm(rdev);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct radeon_crtc *radeon_crtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp;<br>
&gt; @@ -408,7 +408,7 @@ void rs600_hpd_set_polarity(struct radeon_device *=
rdev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void rs600_hpd_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned enable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -435,7 +435,7 @@ void rs600_hpd_init(struct radeon_device *rdev)<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void rs600_hpd_fini(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev-&gt;ddev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D rdev_to_drm(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned disable =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -797,7 +797,7 @@ int rs600_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Vertical blan=
k interrupts */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (G_007EDC_LB_=
D1_VBLANK_INTERRUPT(rdev-&gt;irq.stat_regs.r500.disp_int)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[0]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev-&gt;ddev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev_to_drm(rdev), 0);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;pm.vblank_sync =3D true;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up(&amp;rdev-&gt;irq.vblank_q=
ueue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -806,7 +806,7 @@ int rs600_irq_process(struct radeon_device *rdev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (G_007EDC_LB_=
D2_VBLANK_INTERRUPT(rdev-&gt;irq.stat_regs.r500.disp_int)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[1]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev-&gt;ddev, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_vblank(rdev_to_drm(rdev), 1);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&gt;pm.vblank_sync =3D true;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up(&amp;rdev-&gt;irq.vblank_q=
ueue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -1133,7 +1133,7 @@ int rs600_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize memory controller */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rs600_mc_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r100_debugfs_rbbm_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/r=
s690.c<br>
&gt; index 14fb0819b8c1..016eb4992803 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rs690.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rs690.c<br>
&gt; @@ -845,7 +845,7 @@ int rs690_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize memory controller */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rs690_mc_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rv515_debugfs(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/r=
v515.c<br>
&gt; index bbc6ccabf788..1b4dfb645585 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rv515.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rv515.c<br>
&gt; @@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);<br>
&gt;=C2=A0 =C2=A0void rv515_debugfs(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0#if defined(CONFIG_DEBUG_FS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev-&gt;ddev-&gt;primary=
-&gt;debugfs_root;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *root =3D rdev_to_drm(rdev)-&gt;pri=
mary-&gt;debugfs_root;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;rv515_pipes_info&q=
uot;, 0444, root, rdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rv515_debugfs_pipes_info_fops);<br>
&gt; @@ -636,7 +636,7 @@ int rv515_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (radeon_boot_test_post_card(rdev) =3D=3D =
false)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;flags &amp; RADEON_IS_AGP) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D radeon_agp=
_init(rdev);<br>
&gt; diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/r=
v770.c<br>
&gt; index 9ce12fa3c356..7d4b0bf59109 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/rv770.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/rv770.c<br>
&gt; @@ -1935,7 +1935,7 @@ int rv770_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* initialize AGP */<br>
&gt; diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c=
<br>
&gt; index 15759c8ca5b7..6c95575ce109 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/si.c<br>
&gt; +++ b/drivers/gpu/drm/radeon/si.c<br>
&gt; @@ -6277,7 +6277,7 @@ int si_irq_process(struct radeon_device *rdev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_name =3D &quot;vblank&quot;;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdev-&gt;irq.crtc_vblank_int[c=
rtc_idx]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev-&gt;ddev, crtc_idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_handle_v=
blank(rdev_to_drm(rdev), crtc_idx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdev-&=
gt;pm.vblank_sync =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_u=
p(&amp;rdev-&gt;irq.vblank_queue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -6839,7 +6839,7 @@ int si_init(struct radeon_device *rdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize surface registers */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_surface_init(rdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize clocks */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev-&gt;ddev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0radeon_get_clock_info(rdev_to_drm(rdev));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fence driver */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0radeon_fence_driver_init(rdev);<br>
<br>
</blockquote></div>

--000000000000385007061a4d65b6--
