Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB900A32936
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 15:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6110E8DB;
	Wed, 12 Feb 2025 14:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EAOQW0w4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B0E10E8DB;
 Wed, 12 Feb 2025 14:54:41 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fa227edb68so1387383a91.0; 
 Wed, 12 Feb 2025 06:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739372080; x=1739976880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WAkQk0vCtyjUEvQeMQjvpik2mcmrdn/YbyfEFLALom4=;
 b=EAOQW0w4nw12su1GJf+X1U7m5D0+aFb9Z4nnMj+UXKCZt86ossYYqy6eslMwsgwotG
 rdu//J/I5qhj4BcEz2jshHzatYw5gTZdwnaSGwmKfftE8zJEm8BYO8kVz4RCaBRZd1n5
 ebfjYnruHLq5MVE+/N8crY7UhzoA5WPUeQEnHEmPXqfNmUf3qxqL6XhiHwOlujBcnn9M
 jO7AB015dO9oGhIZfwFNi2g8ywi6dT3VFXq+KIiHzZwKe+lFFYDEzQo1q8SMhqXApRcu
 XupN1aIRnIQDZpTZXs7+jSl1H6487bq3dlN2YxRo2YPz/+NykICG63gHRRs/ZN7csCKq
 TrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739372080; x=1739976880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAkQk0vCtyjUEvQeMQjvpik2mcmrdn/YbyfEFLALom4=;
 b=cL6RTBP5zTcQs3QDj3NVH/WlsWqYbDlrGOKSi+e0j4/VuY1Al6RnzEn35wbg05pRXR
 45GfUJxza9/FMDCdJ5hxfgj5J3X9fEaAmeGlbBzU9Y0MXmvkUlqvmLafVeihprDsMu56
 Rm2uSlb5IkS5vk5hf7JvEwEW08nFMY2/pZXmpv4IiQM7OeMukN0h/FWIXA6DqMUDY7g/
 NnjLw9uk2J1JVj0j8XZVm7Tg+rTw5WNz8OVNQmVSVC9hTriTgWwuULfyD92IK2bCSBQ6
 3/Ww4y049VDKuV6qoWgEjVYt1elwGukfItWdu2JDX4decETN9/6R/Romq3xUg2RIAKNw
 OXKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7vw1o/lIJ5Ub42Gp5CbZJxLn8AZB45Son/rRD9W8Ukr0UEcp1XSbzOYO9TpamKBUAulfyZyjs@lists.freedesktop.org,
 AJvYcCXdGHf60tyXnMF7WflbzLvJ8eykKEuSDBTrn5Bk9aBwVOSmwETbQ1lUSi1PLMPXpuUKaU/4DxpGL2WD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhyy36VZDSLknyDZRqG7cKirub/znm6QZnvAaabzAHFTPziIwG
 ZpGVrLyKNxm8KH45pGTw3uXSfzksKX9GbprNzXAwmyH48Aq7+x1rxbMHyQYb4R5Ozka2PjpjlxU
 ak5R5vcldofI+eld3+in/0Jihe8A=
X-Gm-Gg: ASbGncsk7qnIerHcZL1kbfOFcCMicGB0eFTQNoQ67CRJsQMNZoqIaWc5+16MdkKikkN
 elPdKPTABKbR8jFZaS0jeIYE1atoNMfOqxpBzS5QF8oZfAILqi2rvDZ1OOukHfplsIXxwkMni
X-Google-Smtp-Source: AGHT+IFo2yCN2xd13k7pkRlQ8E0+as8C6qrcJ2fIeXpquYmq/wvPsy3OR22XEyVWdi28mKIGajdVEmPqauE7rW3eqb4=
X-Received: by 2002:a17:90b:1b50:b0:2fa:2011:c85d with SMTP id
 98e67ed59e1d1-2fbf5ca1356mr1899558a91.7.1739372080381; Wed, 12 Feb 2025
 06:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
 <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
 <3e6f5e44-403b-41bb-b819-c4479948731c@amd.com>
In-Reply-To: <3e6f5e44-403b-41bb-b819-c4479948731c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Feb 2025 09:54:27 -0500
X-Gm-Features: AWEUYZmBHahplTG5qlcLVLsio8I4kY1VcqYEW5X_o2UrI_3pX2OADkQg-56WzMU
Message-ID: <CADnq5_N_SQHbx5zZGyWFJo8FcGbR+mT3aJr1C-uPRJ5Z9m27Vw@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
To: Harry Wentland <harry.wentland@amd.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org, 
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Xaver Hugl <xaver.hugl@gmail.com>, 
 Daniel Stone <daniel@fooishbar.org>, ville.syrjala@linux.intel.com,
 kernel-dev@igalia.com, 
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

Acked-by: Alex Deucher <alexander.deucher@amd.com> for the series.

On Thu, Feb 6, 2025 at 5:37=E2=80=AFPM Harry Wentland <harry.wentland@amd.c=
om> wrote:
>
>
>
> On 2025-01-27 14:59, Andr=C3=A9 Almeida wrote:
> > amdgpu can handle async flips on overlay planes, so allow it for atomic
> > async checks.
> >
> > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 10 ++++++---=
-
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > index 774cc3f4f3fd9a964fe48c66eb596d2f6dfee602..6bfed3d1530e6610eea025b=
477f409ee505870da 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> > @@ -1258,21 +1258,23 @@ static int amdgpu_dm_plane_atomic_check(struct =
drm_plane *plane,
> >  }
> >
> >  static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
> > -                                           struct drm_atomic_state *st=
ate)
> > +                                           struct drm_atomic_state *st=
ate, bool flip)
> >  {
> >       struct drm_crtc_state *new_crtc_state;
> >       struct drm_plane_state *new_plane_state;
> >       struct dm_crtc_state *dm_new_crtc_state;
> >
> > -     /* Only support async updates on cursor planes. */
> > -     if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> > +     if (flip) {
> > +             if (plane->type !=3D DRM_PLANE_TYPE_OVERLAY)
> > +                     return -EINVAL;
> > +     } else if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> >               return -EINVAL;
> >
> >       new_plane_state =3D drm_atomic_get_new_plane_state(state, plane);
> >       new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_plane=
_state->crtc);
> >       dm_new_crtc_state =3D to_dm_crtc_state(new_crtc_state);
> >       /* Reject overlay cursors for now*/
> > -     if (dm_new_crtc_state->cursor_mode =3D=3D DM_CURSOR_OVERLAY_MODE)
> > +     if (!flip && dm_new_crtc_state->cursor_mode =3D=3D DM_CURSOR_OVER=
LAY_MODE)
> >               return -EINVAL;
> >
> >       return 0;
> >
>
