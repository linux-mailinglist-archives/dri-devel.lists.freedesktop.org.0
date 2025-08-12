Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11FBB246D7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EDC10E6E2;
	Wed, 13 Aug 2025 10:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PpnFQE+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7072610E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:09:49 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3e5429b9a5dso10247365ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755004188; x=1755608988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCTldDZR7k6dRE1AzEZefc9AHLCcWRZn215S8tzP9HE=;
 b=PpnFQE+1I2thSvCwgVgX0NqXffZzvuJHd6CUNoFs5iekbqMtza4C8V9LzRdFiXgwRM
 NbCHRWZFw033WYLe6LSdtHTLO81mmnh0r4o8+V7Iobe0Lg3EL+RydOSF4iiKMXYXbHZM
 TiJO+hf21sqnylUTOUMfSZBJQJhvqDkoB43RtlOYHA2QlC4c1pKEeEwOkrUq6lvSAh5O
 0aG2/BeUdAQEAvwt3hSDouRWO3Qa+6C2UDBj0SZoYX0llQoAkaMa0VwhoIPaeNs1IV8w
 uiWBcYBMezIPUMwc/bAXrJwuI4FTVNXGL/UeaFfuvi8Gp8x32upm2AklhyQXF34kY0n4
 nUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755004188; x=1755608988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCTldDZR7k6dRE1AzEZefc9AHLCcWRZn215S8tzP9HE=;
 b=qdHjBKJehC440EwbaiKFZ1xFcFlTG6n8YvXpU6E+60Dge3ZBPNa/b9k1+ASPori3Ia
 Cy3+fdi93h1dtGNXFSin4FONUWIIVgH/2Oub5zUK5ogjryeRxCop+qW29dyLklWroiIn
 Mwkwjwt9fbkjxOyBymqMhaqoN+Hd9igB0yYH7dkh414lFr4vjfAiNfWyZWEgl/aSeqAr
 92+l1bDvruEgkTGGM1Yi2KQwiohstPs0fa/E9HDe6fAuUyhaEKJf7iqS9Ic9rBJWXM27
 X117BlNbc+wAd6AG1/hmwbdOH5xt4N5uyrudmHkHeSYVypOxMiNuFl6TjqJ5L7ZgWdaL
 E0HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGxSrv+6iBOwQJPyb3CCFqhQOTsqAKWByRTd4hYJQBs9J2YxUoluLGCyqBdaiGEkSjZAida+1bsDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw86I7V/sMs3ScSgrdBMvd3g3+FfsUkrh84XtnIZatxLlrbaV7R
 Tl0AKgLtm/kUVMjFoPCeKMzblRtQ2WpnQFIanwb1WV9IO8QtRsrsliInR15UpyqqrQnc3WSzf55
 HT2eRfhDHtrhrZsol1ptDKlti0PEzKns8iPpZxUl4WDDD
X-Gm-Gg: ASbGnctT13zPH6aV8cXdAkLyMXxA9zzPaTSvna5OkcySXvtOc01viz6CvM31kbwd/Oi
 Mq17eKC1RYj8HryBbzRVnqH2qrAepFxfCV9w1Onch1Ql847Mv23Bl+4fm2BaWeDFrBSCEnlCC9i
 mnwwoSozQ5Hb14o41R+nLsp3Kr5ISzQ52ZMO7yZ3Z0hx6xIPKzolTkkFi9o+lHU3/USiy0WHShO
 zsVuw==
X-Google-Smtp-Source: AGHT+IEyiNUXbvVqwYVbrRdb/7n8DO7e27n4xYqX8r0AVGzm55ZY/0DlFUByK5lcwmnjkEh0lGGKbzjd+RO/Kf2vkXY=
X-Received: by 2002:a05:6e02:1565:b0:3e5:42ec:137a with SMTP id
 e9e14a558f8ab-3e55af2b456mr54984915ab.4.1755004188435; Tue, 12 Aug 2025
 06:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250812101119.2506-1-rk0006818@gmail.com>
 <aJshoswGslcYQFLI@e110455-lin.cambridge.arm.com>
 <CAKY2RyZX9D6J08S78zT97cHS3dJ7Cf0xURX7EougPmh-rMSMGQ@mail.gmail.com>
In-Reply-To: <CAKY2RyZX9D6J08S78zT97cHS3dJ7Cf0xURX7EougPmh-rMSMGQ@mail.gmail.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 12 Aug 2025 18:39:35 +0530
X-Gm-Features: Ac12FXyHXw4dWp3GJOGwX8qm21Fcd3McvMhOactXfaVPp-awu1HoiIo1XP-izQ4
Message-ID: <CAKY2Ryac_jwvHVXNmPKrNEdQa9CcjM=1aLEDWyRbspgp0bZK-g@mail.gmail.com>
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thanks for the review and feedback, Liviu.
I will follow this for my future patches.

Regards,
Rahul


On Tue, Aug 12, 2025 at 5:50=E2=80=AFPM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Thanks for the review and feedback, Liviu.
> I will follow this for my future patches.
>
> Regards,
> Rahul
>
> On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Liviu Dudau <liviu.dudau@arm.com>=
 wrote:
>>
>> On Tue, Aug 12, 2025 at 03:41:19PM +0530, Rahul Kumar wrote:
>> > Replace all dev_err(), dev_warn(), dev_info() and DRM_ERROR/WARN/INFO(=
)
>> > calls in drivers/gpu/drm/arm/display/komeda/komeda_crtc.c with the
>> > corresponding drm_err(), drm_warn(), and drm_info() helpers.
>> >
>> > The new drm_*() logging functions take a struct drm_device * as the
>> > first argument. This allows the DRM core to prefix log messages with
>> > the specific DRM device name and instance, which is essential for
>> > distinguishing logs when multiple GPUs or display controllers are pres=
ent.
>> >
>> > This change aligns komeda with the DRM TODO item: "Convert logging to
>> > drm_* functions with drm_device parameter".
>> >
>> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
>>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>>
>> For future patches, when you make changes, please generate them with
>>
>> git patch -v<version>
>>
>> and include a change log so that reviewers can quickly figure out what
>> has changed between emails without having to go back and forth.
>>
>> Best regards,
>> Liviu
>>
>> > ---
>> >  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 27 +++++++++++-------=
-
>> >  1 file changed, 16 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/driver=
s/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > index 2ad33559a33a..e4cc1fb34e94 100644
>> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> > @@ -111,6 +111,7 @@ komeda_crtc_atomic_check(struct drm_crtc *crtc,
>> >  static int
>> >  komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>> >       struct komeda_pipeline *master =3D kcrtc->master;
>> >       struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(kcrtc->base.s=
tate);
>> > @@ -128,7 +129,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >
>> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
>> >       if (err) {
>> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
>> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,"=
,
>> >                         mdev->dpmode, new_mode);
>> >               goto unlock;
>> >       }
>> > @@ -142,18 +143,18 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >       if (new_mode !=3D KOMEDA_MODE_DUAL_DISP) {
>> >               err =3D clk_set_rate(mdev->aclk, komeda_crtc_get_aclk(kc=
rtc_st));
>> >               if (err)
>> > -                     DRM_ERROR("failed to set aclk.\n");
>> > +                     drm_err(drm, "failed to set aclk.\n");
>> >               err =3D clk_prepare_enable(mdev->aclk);
>> >               if (err)
>> > -                     DRM_ERROR("failed to enable aclk.\n");
>> > +                     drm_err(drm, "failed to enable aclk.\n");
>> >       }
>> >
>> >       err =3D clk_set_rate(master->pxlclk, mode->crtc_clock * 1000);
>> >       if (err)
>> > -             DRM_ERROR("failed to set pxlclk for pipe%d\n", master->i=
d);
>> > +             drm_err(drm, "failed to set pxlclk for pipe%d\n", master=
->id);
>> >       err =3D clk_prepare_enable(master->pxlclk);
>> >       if (err)
>> > -             DRM_ERROR("failed to enable pxl clk for pipe%d.\n", mast=
er->id);
>> > +             drm_err(drm, "failed to enable pxl clk for pipe%d.\n", m=
aster->id);
>> >
>> >  unlock:
>> >       mutex_unlock(&mdev->lock);
>> > @@ -164,6 +165,7 @@ komeda_crtc_prepare(struct komeda_crtc *kcrtc)
>> >  static int
>> >  komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct komeda_dev *mdev =3D kcrtc->base.dev->dev_private;
>> >       struct komeda_pipeline *master =3D kcrtc->master;
>> >       u32 new_mode;
>> > @@ -180,7 +182,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >
>> >       err =3D mdev->funcs->change_opmode(mdev, new_mode);
>> >       if (err) {
>> > -             DRM_ERROR("failed to change opmode: 0x%x -> 0x%x.\n,",
>> > +             drm_err(drm, "failed to change opmode: 0x%x -> 0x%x.\n,"=
,
>> >                         mdev->dpmode, new_mode);
>> >               goto unlock;
>> >       }
>> > @@ -200,6 +202,7 @@ komeda_crtc_unprepare(struct komeda_crtc *kcrtc)
>> >  void komeda_crtc_handle_event(struct komeda_crtc   *kcrtc,
>> >                             struct komeda_events *evts)
>> >  {
>> > +     struct drm_device *drm =3D kcrtc->base.dev;
>> >       struct drm_crtc *crtc =3D &kcrtc->base;
>> >       u32 events =3D evts->pipes[kcrtc->master->id];
>> >
>> > @@ -212,7 +215,7 @@ void komeda_crtc_handle_event(struct komeda_crtc  =
 *kcrtc,
>> >               if (wb_conn)
>> >                       drm_writeback_signal_completion(&wb_conn->base, =
0);
>> >               else
>> > -                     DRM_WARN("CRTC[%d]: EOW happen but no wb_connect=
or.\n",
>> > +                     drm_warn(drm, "CRTC[%d]: EOW happen but no wb_co=
nnector.\n",
>> >                                drm_crtc_index(&kcrtc->base));
>> >       }
>> >       /* will handle it together with the write back support */
>> > @@ -236,7 +239,7 @@ void komeda_crtc_handle_event(struct komeda_crtc  =
 *kcrtc,
>> >                       crtc->state->event =3D NULL;
>> >                       drm_crtc_send_vblank_event(crtc, event);
>> >               } else {
>> > -                     DRM_WARN("CRTC[%d]: FLIP happened but no pending=
 commit.\n",
>> > +                     drm_warn(drm, "CRTC[%d]: FLIP happened but no pe=
nding commit.\n",
>> >                                drm_crtc_index(&kcrtc->base));
>> >               }
>> >               spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>> > @@ -309,7 +312,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct ko=
meda_crtc *kcrtc,
>> >
>> >       /* wait the flip take affect.*/
>> >       if (wait_for_completion_timeout(flip_done, HZ) =3D=3D 0) {
>> > -             DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->mast=
er->id);
>> > +             drm_err(drm, "wait pipe%d flip done timeout\n", kcrtc->m=
aster->id);
>> >               if (!input_flip_done) {
>> >                       unsigned long flags;
>> >
>> > @@ -562,6 +565,7 @@ static const struct drm_crtc_funcs komeda_crtc_fun=
cs =3D {
>> >  int komeda_kms_setup_crtcs(struct komeda_kms_dev *kms,
>> >                          struct komeda_dev *mdev)
>> >  {
>> > +     struct drm_device *drm =3D &kms->base;
>> >       struct komeda_crtc *crtc;
>> >       struct komeda_pipeline *master;
>> >       char str[16];
>> > @@ -581,7 +585,7 @@ int komeda_kms_setup_crtcs(struct komeda_kms_dev *=
kms,
>> >               else
>> >                       sprintf(str, "None");
>> >
>> > -             DRM_INFO("CRTC-%d: master(pipe-%d) slave(%s).\n",
>> > +             drm_info(drm, "CRTC-%d: master(pipe-%d) slave(%s).\n",
>> >                        kms->n_crtcs, master->id, str);
>> >
>> >               kms->n_crtcs++;
>> > @@ -613,6 +617,7 @@ static int komeda_attach_bridge(struct device *dev=
,
>> >                               struct komeda_pipeline *pipe,
>> >                               struct drm_encoder *encoder)
>> >  {
>> > +     struct drm_device *drm =3D encoder->dev;
>> >       struct drm_bridge *bridge;
>> >       int err;
>> >
>> > @@ -624,7 +629,7 @@ static int komeda_attach_bridge(struct device *dev=
,
>> >
>> >       err =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>> >       if (err)
>> > -             dev_err(dev, "bridge_attach() failed for pipe: %s\n",
>> > +             drm_err(drm, "bridge_attach() failed for pipe: %s\n",
>> >                       of_node_full_name(pipe->of_node));
>> >
>> >       return err;
>> > --
>> > 2.43.0
>> >
>>
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> | I would like to |
>> | fix the world,  |
>> | but they're not |
>> | giving me the   |
>>  \ source code!  /
>>   ---------------
>>     =C2=AF\_(=E3=83=84)_/=C2=AF
