Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0E6A21F51
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F59110E805;
	Wed, 29 Jan 2025 14:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cx3IcuuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F810E805;
 Wed, 29 Jan 2025 14:37:05 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab2aea81cd8so1262092766b.2; 
 Wed, 29 Jan 2025 06:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738161424; x=1738766224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/p0nI/RRITvDFuGFNWEW3gKzJnASm0DDTRWHL7Dwns=;
 b=cx3IcuuJmQmSfVpI2KM/wa+5DQOxC8Gdwd1QLsufYK+6po53Z9odZsCLAM0pdU/XmF
 VAnQKLiYTa0ciYBofOlwTD3TKbdgXzDiMaOYkqDXEz/4JOizUR/MOA5UcrfZWhOBYaGZ
 0yLe4nsU6Dj37f2Bk5vkg2/iRR7PGIFNCR/Djhh1KhIVulm3Bf7XD6YGNhEM7Wny5600
 NZez+QCk+1Z9BmNh7Y59JKujN2FrnnJexvGS88zC8LnbtFDZ/R3NOarTRE+KiQVXPpMQ
 WRREWpxhALYck7l6xjzLFdPgg1ljzwmhxBCqSm0GlVIrNif4KXU2AmbjgK0a9d8Vt9ct
 mO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738161424; x=1738766224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/p0nI/RRITvDFuGFNWEW3gKzJnASm0DDTRWHL7Dwns=;
 b=R+4iQz1tODix3j+V2IFsGL7FN5zZL8AtEjzsrZU2yAKAC0+Nlbb7KSEdQoepwqVDiQ
 DRAPm/hH1xMtymaDBJx25Uycf6sBu3iRd61BM/0WQCvaNv0DIXKr1Dltg8jDSCLbpOjr
 ekLWZWqU+/MZjfI1CD7CTcB4+GlgYOvsQtBwyfeBIRFIrPL0xcRV5lBAhGFmfdPiqa1o
 S5Ri+krZXohGV6/lAzAruow8Y75/r5wyAvQ2mFgChO9vNVc8XMqdoiIw/r33C0B2uB4g
 +2KbLlmMS7N8KIAI2SBkZSkQbt1SSZzx3P08wZdW7itKKhYlQlXamh5WlOsaZlVMWf+T
 A6+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1kpTs3ep22tsBi4kmdARWuGP4NI53SELDsDpYB/ck8joC+e82VKnoj2mD/oPbb5TI6j2GY2Lm@lists.freedesktop.org,
 AJvYcCWNb0QQ5Rn1F+OBbF8hxkkdVGoWJ1kjUZOt4Ah4N4saUIS1Apv19QS2Haim22GWN73E8/uwl6LBE/mH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnIizppjDTPZKHooD/f9V0R36N/SPQPJj9/BrxeLdLjkYqOqyR
 MplpGVj8noFENesT+nIeDp4rtyItMwtX4gQar3F0mlA1+mvJjWxwhK9fd1QfRkgmy8Nf6Y9PEIa
 Zyo2kCA4az49etV3JJsVAfEvCv7c=
X-Gm-Gg: ASbGncv1vkhHLR2PMc78y6RxRqkxMNGEkATfp8/NaZ3ev2zRnIn4lS24SN9SVh8HJaR
 75UXoLr/VOHsXS2O5TTPCdhz2C40msg7mbDUjpf8D/69+bz6ts6hkAX8m9PLe/JGcJ0tdkAIQO0
 Cp1TTJBPw6ZvSB/mTxMGzY6aKwVpqKYGY=
X-Google-Smtp-Source: AGHT+IHMHeuiKc94hFkHEcvT2ioyUeH/DxNrW8qbmcplxWmFlWc1J6wPB5UBonIpdsGvPza8v/uxqVmIdqqID0QBtlk=
X-Received: by 2002:a17:906:fb1b:b0:ab6:d799:d113 with SMTP id
 a640c23a62f3a-ab6d79bc159mr159512466b.34.1738161423719; Wed, 29 Jan 2025
 06:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
 <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
In-Reply-To: <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 29 Jan 2025 15:36:52 +0100
X-Gm-Features: AWEUYZl-1_-MtammtVbCs-nYcUuseN_AsQpENvQFJy-5e54cI140iBPDzREpPD8
Message-ID: <CAFZQkGwG7FLU1Lw8aRo20ox3ccJbEntSB=iZZURrXEJKLQoyhw@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Daniel Stone <daniel@fooishbar.org>, 
 ville.syrjala@linux.intel.com, kernel-dev@igalia.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org
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

Am Mo., 27. Jan. 2025 um 21:00 Uhr schrieb Andr=C3=A9 Almeida
<andrealmeid@igalia.com>:
>
> amdgpu can handle async flips on overlay planes, so allow it for atomic
> async checks.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 774cc3f4f3fd9a964fe48c66eb596d2f6dfee602..6bfed3d1530e6610eea025b47=
7f409ee505870da 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1258,21 +1258,23 @@ static int amdgpu_dm_plane_atomic_check(struct dr=
m_plane *plane,
>  }
>
>  static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
> -                                             struct drm_atomic_state *st=
ate)
> +                                             struct drm_atomic_state *st=
ate, bool flip)
>  {
>         struct drm_crtc_state *new_crtc_state;
>         struct drm_plane_state *new_plane_state;
>         struct dm_crtc_state *dm_new_crtc_state;
>
> -       /* Only support async updates on cursor planes. */
> -       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> +       if (flip) {
> +               if (plane->type !=3D DRM_PLANE_TYPE_OVERLAY)
> +                       return -EINVAL;
> +       } else if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
>                 return -EINVAL;

This changes the logic for cursor updates, flipping on the cursor
plane allowed async updates before. Is that intentional?

>         new_plane_state =3D drm_atomic_get_new_plane_state(state, plane);
>         new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_plane=
_state->crtc);
>         dm_new_crtc_state =3D to_dm_crtc_state(new_crtc_state);
>         /* Reject overlay cursors for now*/
> -       if (dm_new_crtc_state->cursor_mode =3D=3D DM_CURSOR_OVERLAY_MODE)
> +       if (!flip && dm_new_crtc_state->cursor_mode =3D=3D DM_CURSOR_OVER=
LAY_MODE)
>                 return -EINVAL;
>
>         return 0;
>
> --
> 2.48.0
>
