Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C48BFF4D
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D9710F5F0;
	Wed,  8 May 2024 13:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OMNMFiKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ACA10F45F;
 Wed,  8 May 2024 13:48:02 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-61aef9901deso3024619a12.1; 
 Wed, 08 May 2024 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715176082; x=1715780882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQDk2xB0WQjUhRNs2EAciXxFONLNnOupCUzKUQ7mDoo=;
 b=OMNMFiKn90wKGjJoiFp++mTutOk9zyGAFy71RPPxrgGRtsfKCl7DPTGhjiOwp4Ql2L
 aRkk8gvCA0JXwPvLVTAlD8bduY9cqTRRA5xfdvTO6gnPTWwlq/djbZeXPPwW2D3KSfDR
 P4GihQffkQgxbg3+WNvqneqVfkRuIXcFDmnNzvud2HO71jdP/V+X1Z5LmySN1eynHgAd
 IPODrbAbGIAj6SGr1kOlUw+0v6jpskdt0cSFWuj+YzQB4UNLRmbDo/rEkP9UCFoRfP7I
 x5LJhzs/LSRSzNOIJeXU1AebkGa4nRV6preXC7n7oIhjK9QPJAouSyVMDIxDIFHygP9+
 yEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715176082; x=1715780882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQDk2xB0WQjUhRNs2EAciXxFONLNnOupCUzKUQ7mDoo=;
 b=I9cug21yVr25CH7IsHUsfBEyVIOtPeGoin+Lcin3XREKum/CqmyCIm8Q93yZok6G8B
 +/qgnaG3WGmDeZXaKRlWUhHu5D8Tt7aKzJBdrCdrQdQBnXf+A4smWlGNzkGXaJN8C4xy
 EXvww6X5udaEU1y0HqvOOpjKfp6cnZ1qNUuzpNvhq99Tg3Z1ci4ysoDWa7ixp7xANTml
 qOLNlv45bQIpgwY16EjQxCdEDRdnbFX3LTZ+DqcbnwQVP4tf7IBKYa49luczbvoUUelU
 XUvWW5NzOf4X9bMRx3P3s0GcJs3qYTNnwEXMHpOissov2uIgaz0EG4b2Rug/sNGmBOXv
 I7jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtN2/1Wwv5bKzL3aDuPEtaDwnOyMzc/suK3Hwd4GE6DvVTefRYJrMdSQ2zKPmSGqPQ/H2BHh6xg/xhtc8fC5Kx9zVQsZA3ajAdr/T0sZGT5fA4Neh+LPARTe7FmFst8vhaj3Jcgf0lVjcnLHRI0Q==
X-Gm-Message-State: AOJu0YwYyn8O1kFMkvb7ykgX2RlNVxERKfYxEB8akZMbw10UQEeQMaV2
 A+KhwMpqAJyxY4NiO9sYD7K0NpiMSLpUu7AHn/gTSyAAP0oe5mWbdHTZg+3LLl/21bXEGEPM/bh
 qwkKkn18aDcmm6Tvc+kAX6KmQ0Ls=
X-Google-Smtp-Source: AGHT+IFSVVt9RrcAL5Wi7+chr4r3elmGE8J+LMQf7kBN65pmNJVpe6JBbHG/U5jrxQ6hVgSVO9M4R2yKT+Lkao2KJMQ=
X-Received: by 2002:a05:6a20:431d:b0:1af:93b0:f006 with SMTP id
 adf61e73a8af0-1afc8d3d46bmr3194469637.21.1715176082175; Wed, 08 May 2024
 06:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408190611.24914-2-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 May 2024 09:47:50 -0400
Message-ID: <CADnq5_OF=MM-J6WAqnLYtu-kUWcCXkzCmi499viFptrFnBWGAg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/amdgpu: Use drm_crtc_vblank_crtc()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
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

On Mon, Apr 8, 2024 at 3:06=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the open coded drm_crtc_vblank_crtc() with the real
> thing.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 8 ++------
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vkms.c
> index 8baa2e0935cc..258703145161 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -65,9 +65,7 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate=
(struct hrtimer *timer)
>
>  static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
>  {
> -       struct drm_device *dev =3D crtc->dev;
> -       unsigned int pipe =3D drm_crtc_index(crtc);
> -       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +       struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>         struct amdgpu_vkms_output *out =3D drm_crtc_to_amdgpu_vkms_output=
(crtc);
>         struct amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
>
> @@ -91,10 +89,8 @@ static bool amdgpu_vkms_get_vblank_timestamp(struct dr=
m_crtc *crtc,
>                                              ktime_t *vblank_time,
>                                              bool in_vblank_irq)
>  {
> -       struct drm_device *dev =3D crtc->dev;
> -       unsigned int pipe =3D crtc->index;
>         struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms_out=
put(crtc);
> -       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +       struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>         struct amdgpu_crtc *amdgpu_crtc =3D to_amdgpu_crtc(crtc);
>
>         if (!READ_ONCE(vblank->enabled)) {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 71d2d44681b2..662d2d83473b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -528,7 +528,7 @@ static void dm_vupdate_high_irq(void *interrupt_param=
s)
>         if (acrtc) {
>                 vrr_active =3D amdgpu_dm_crtc_vrr_active_irq(acrtc);
>                 drm_dev =3D acrtc->base.dev;
> -               vblank =3D &drm_dev->vblank[acrtc->base.index];
> +               vblank =3D drm_crtc_vblank_crtc(&acrtc->base);
>                 previous_timestamp =3D atomic64_read(&irq_params->previou=
s_timestamp);
>                 frame_duration_ns =3D vblank->time - previous_timestamp;
>
> --
> 2.43.2
>
