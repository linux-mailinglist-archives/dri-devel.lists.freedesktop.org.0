Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFC94F73C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E11410E293;
	Mon, 12 Aug 2024 19:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ue4ePr93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB4E10E290;
 Mon, 12 Aug 2024 19:07:37 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7b594936e9bso3232191a12.1; 
 Mon, 12 Aug 2024 12:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723489657; x=1724094457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AaT0MsE1OmUcACDtsJmDiH3shPg9GTHC7oOXE/GXYdE=;
 b=Ue4ePr93QT1Gfo8bqMadzZ0aOn9sG+Vgy2l60yy7bWf/eMK6v5T8sXzj/yrvKeYb/Q
 hME0nSdPPPbHpagFx+tFr6LflXess2wzMerEzI847ZxUce/8GzgmVgqw8lo29Hl6Cx9F
 RkYpz1ECWEzAtDDdHpQ03au5+2R3NR3jrTxaSLmrOl3sh+fYkY9QHr0qJnkd1IgHzIbT
 kPPfWyBYYDv/xtqAJXCcVc453DeKgU3gAtAMy2uwLkuf+92UXFMqhYgFdHOF2q1WdKki
 Jvv/sBNz6+5BhjmRxfMAvDVLEqSQzz8qsaVs8q8Dr0ibUzIQEuHYW5I7anAYSrmMoWHT
 f+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723489657; x=1724094457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AaT0MsE1OmUcACDtsJmDiH3shPg9GTHC7oOXE/GXYdE=;
 b=ZyTpXVlJSR3iW4DPEhQ1eWJ4gaKqUc8d7PCvvecg6o1+UtGyUF/ZAg8JN+7Akfj3G3
 gMCB9N4t4B+oJ39lRIQRFPXwrfIKEFNWt98Xvr33C1zNeIB2AJyuTVEd2em3XHZlDkOp
 ZTTlEHLLaTSe0Ujt7RZ4JbRscNpPsPoCLgya44TFxqed8fBzzEJqVo+PkMm2H9QNcDQ/
 cYVn6YYD/uWx7JcToZr/7UFI5FmorJ0YA/kLyzQ8jmUyzeQpeSkVc/U9MbAQRl2mk7VB
 ZxJ+e9JE+vU6+xgHFLkPUFSFTPZqwdZmRvBOBoTuuDDWQSBuhcZdgksswQ8jrXfH9APD
 ujvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfbzx50x9ZHHCFutgz6+N4cMl0m9MSpKZ9KA3+mPApTY69snX3gmMApyVLE+C7mcAcpUanrXk9w/61Qq/+O6LB1Z+T0v7OD6PQ/VihbUkpUX/Hnht+J8BQWLYAIgcG9PTh/JZxkjeYxCt51JrEkFGi/MOKXV1nEbO+0QrMpbRcGFbMCAJ6cHSiBMmVeuI=
X-Gm-Message-State: AOJu0YwAPN6zIlnUB2t6TGNcwVcPwh0rtMqQgI8tkqx/AaNRGZzoxNtu
 LD6fnxAevWt0D9TtLsetiyr9DHNkqM1VPlPHEg3Z95Qs6ZOWseD0zONuLsvI/Sk+mLcrxPYunt2
 7pHFG26I7wYjBdj9BsV9hRIJBt0lwaA==
X-Google-Smtp-Source: AGHT+IHE8vAxaZwb8GaJU6aufewBnnt+P3850GHT/dKOw5ioOXZTdHVDZ2T644B+eTPA8oF7MGX4S1WR/v0bYMbzXVw=
X-Received: by 2002:a17:90a:d984:b0:2bf:8824:c043 with SMTP id
 98e67ed59e1d1-2d39250eadamr1412113a91.18.1723489656853; Mon, 12 Aug 2024
 12:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-3-tzimmermann@suse.de>
 <CADnq5_OmtCTuvF_xNmOMYkACjLnJVn7L2wsRyvOsjKtk8inPyQ@mail.gmail.com>
In-Reply-To: <CADnq5_OmtCTuvF_xNmOMYkACjLnJVn7L2wsRyvOsjKtk8inPyQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2024 15:07:25 -0400
Message-ID: <CADnq5_P4QVb3ahMsGWH=bJ_G-Ave6OS1TsBVTd+41AaC4GBm7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] drm/amdgpu: Do not set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Mon, Aug 12, 2024 at 3:05=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, Aug 12, 2024 at 4:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Remove the implementation of struct drm_driver.lastclose. The hook
> > was only necessary before in-kernel DRM clients existed, but is now
> > obsolete. The code in amdgpu_driver_lastclose_kms() is performed by
> > drm_lastclose().
> >
> > v2:
> > - update commit message
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Feel free to take these through drm-misc.

Alex

>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 -----------------
> >  3 files changed, 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu.h
> > index 137a88b8de45..4baeb6519fda 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -1484,7 +1484,6 @@ extern const int amdgpu_max_kms_ioctl;
> >
> >  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long f=
lags);
> >  void amdgpu_driver_unload_kms(struct drm_device *dev);
> > -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
> >  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *fi=
le_priv);
> >  void amdgpu_driver_postclose_kms(struct drm_device *dev,
> >                                  struct drm_file *file_priv);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index 094498a0964b..5dd39e6c6223 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -2953,7 +2953,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
> >             DRIVER_SYNCOBJ_TIMELINE,
> >         .open =3D amdgpu_driver_open_kms,
> >         .postclose =3D amdgpu_driver_postclose_kms,
> > -       .lastclose =3D amdgpu_driver_lastclose_kms,
> >         .ioctls =3D amdgpu_ioctls_kms,
> >         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
> >         .dumb_create =3D amdgpu_mode_dumb_create,
> > @@ -2980,7 +2979,6 @@ const struct drm_driver amdgpu_partition_driver =
=3D {
> >             DRIVER_SYNCOBJ_TIMELINE,
> >         .open =3D amdgpu_driver_open_kms,
> >         .postclose =3D amdgpu_driver_postclose_kms,
> > -       .lastclose =3D amdgpu_driver_lastclose_kms,
> >         .ioctls =3D amdgpu_ioctls_kms,
> >         .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
> >         .dumb_create =3D amdgpu_mode_dumb_create,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_kms.c
> > index 66782be5917b..0a799942343d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> > @@ -1269,23 +1269,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, vo=
id *data, struct drm_file *filp)
> >         return 0;
> >  }
> >
> > -
> > -/*
> > - * Outdated mess for old drm with Xorg being in charge (void function =
now).
> > - */
> > -/**
> > - * amdgpu_driver_lastclose_kms - drm callback for last close
> > - *
> > - * @dev: drm dev pointer
> > - *
> > - * Switch vga_switcheroo state after last close (all asics).
> > - */
> > -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> > -{
> > -       drm_fb_helper_lastclose(dev);
> > -       vga_switcheroo_process_delayed_switch();
> > -}
> > -
> >  /**
> >   * amdgpu_driver_open_kms - drm callback for open
> >   *
> > --
> > 2.46.0
> >
