Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232BAAE48BA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D4010E3DB;
	Mon, 23 Jun 2025 15:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XL+N4bJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B7BF10E3DB;
 Mon, 23 Jun 2025 15:33:40 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b26fabda6d9so807257a12.1; 
 Mon, 23 Jun 2025 08:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750692819; x=1751297619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHe+LGqfBJmGCRbTD2/3y+0WOmtHelhe1lvAXSQQkuY=;
 b=XL+N4bJshU26JkLOm/DA9Xyh6k9ohfXjzHJUB7XxvKyZpVXs3+zQFZeAUgVH1rCRln
 rmXtQ5HY8Rf8JqrcK/CGwZ+qXS8GUv94XavZypUH+EdDsIFU/A8scXXsMNcN85N7PfmK
 W4F7v6LhFxunqSLtFd/4qeJQqpHHSbkAcETMMAX73MLaxbwMyNnCj1Frx9xQgH7LIs0R
 DZlS+AwuVD3DHNxAwjEiZ133bV/kiAxGJ3jumBumFBRvZI1n+rLrwSaJgLWBJGe/rnLZ
 W3BmKcW2nNR+Fudbq83HorhUXpFB+t0bAvypEkJ59XyfOUqL+dupmreWAJcG8lxPrzHp
 O+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750692819; x=1751297619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHe+LGqfBJmGCRbTD2/3y+0WOmtHelhe1lvAXSQQkuY=;
 b=b1AarwpAKbi+AqtxCHdL5NG1Q5IBhD3cJlh/Ua6KAhzq+GS/STWJdS5CDkCnqYSvNM
 0pD5Rk6g66I10B1fCLJDQDxIxC0yaLuKkQ1jB1UTFS+a3DSMTPi0dnagjTbyJmZRkTjZ
 EfyTezZeFb1U7yuxVDacvZMcttJdVsl9ux4GMd0AxSpfV40boT+aU8plQAjoYD433+Us
 YEdHZiIHTXKFHHZDj85lkGmYNjTmX0e4TAN5mtM1sEwAS8p+IfPeuuWuSYsJeLKG6pUZ
 WiWM/OwcDYKWnFjavBvbmPEzE4ZLv0th/nPxrmEd3d/flphFN17d8wgUsVWfNy5eGBYw
 DduQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2KjqacQdU1pDE+fGQxatMblt7CYsvyBcxvkL339pFnGb1DOBbY4nC3EaNG9HMdg8/pgWCzTAM@lists.freedesktop.org,
 AJvYcCWgYMfA5EO+XZjGFPs8hsxC9CSXXXUCvb8Cw4PXcJuYkVHTpJU3Lw7zRYcASwF8L8Gkbgs5uJDxy6qz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5cnzbsknBeu7I+ys3xILtspcFyw73mPf27M6dhA5s7DAzfYVf
 rZvuI3sbXyh85ojM2T+S1i9lpY89NyRo2iAkLkVRUjVeomVjFMxIZ8d6kR88uf987dAc1PcWWot
 hlSd/W1s1b6MsHpytUmxus6Q54gNFoh0=
X-Gm-Gg: ASbGncszbKhebbQ/7TXzK47nU71MbYuh2whEx+2PpcpmxYgVK2wOa9gcREp7C+lkngx
 27tK5U23yHayMEPsJPrJtql1pdL4FrZKDxIIrVYiq1uWfU32rFLgP8lNazPjKwU2Bt0P64JncYA
 s5XJ+5Q6t1MNxiFuih2fHPHRXsxENzRH8ngu3RN/7oqIf6
X-Google-Smtp-Source: AGHT+IFy0hIPZQpb0KxFYps+8s4d6wkHkBYpK00Mn64GDE10ibBhlQWhIkFHec5/EC3NK0BdahywMOMIcsBKZBpxlQ0=
X-Received: by 2002:a17:902:e542:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-237d97217edmr82924635ad.3.1750692819391; Mon, 23 Jun 2025
 08:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250619125507.54384-1-kode54@gmail.com>
 <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net> <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
 <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
In-Reply-To: <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 11:33:27 -0400
X-Gm-Features: AX0GCFvJMwuOZFcfYlSDPJgah_-90nqioNXt5ljbjpEChyXLvCYPb2q60UyxujM
Message-ID: <CADnq5_OjUp+YpXSdvWrYN+6ofFfyES9Jvwkswf3JmTTMGL=MVQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
To: Christopher Snowhill <chris@kode54.net>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

+ Harry, Leo

On Mon, Jun 23, 2025 at 9:38=E2=80=AFAM Christopher Snowhill <chris@kode54.=
net> wrote:
>
> On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
> > On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
> >> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
> >>> Here's another alternative change, which may be more thorough. It doe=
s
> >>> seem to fix the issue, at least. The issue does indeed appear to be
> >>> no-op plane changes sent to the cursor plane.
> >>>
> >>> If anyone wants to propose style changes, and suggest a proper commit
> >>> message, if this is indeed a welcome fix for the problem, please let =
me
> >>> know.
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_=
atomic_uapi.c
> >>> index c2726af6698e..b741939698e8 100644
> >>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_atomic=
_state *state,
> >>>                     }
> >>>
> >>>                     /* ask the driver if this non-primary plane is su=
pported */
> >>> -                   if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> >>> -                           ret =3D -EINVAL;
> >>> +                   else if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)=
 {
> >>> +                           ret =3D drm_atomic_plane_get_property(pla=
ne, plane_state,
> >>> +                                                               prop,=
 &old_val);
> >>> +
> >>> +                           if (ret || old_val !=3D prop_value) {
> >>> +                                   ret =3D -EINVAL;
> >>>
> >>> -                           if (plane_funcs && plane_funcs->atomic_as=
ync_check)
> >>> -                                   ret =3D plane_funcs->atomic_async=
_check(plane, state, true);
> >>> +                                   if (plane_funcs && plane_funcs->a=
tomic_async_check)
> >>> +                                           ret =3D plane_funcs->atom=
ic_async_check(plane, state, true);
> >>>
> >>> -                           if (ret) {
> >>> -                                   drm_dbg_atomic(prop->dev,
> >>> -                                                  "[PLANE:%d:%s] doe=
s not support async flips\n",
> >>> -                                                  obj->id, plane->na=
me);
> >>> -                                   break;
> >>> +                                   if (ret) {
> >>> +                                           drm_dbg_atomic(prop->dev,
> >>> +                                                          "[PLANE:%d=
:%s] does not support async flips\n",
> >>> +                                                          obj->id, p=
lane->name);
> >>> +                                           break;
> >>> +                                   }
> >>>                             }
> >>>                     }
> >>>             }
> >>
> >> Upon further testing and reflection, I have come to the conclusion tha=
t
> >> this is indeed best handled by a kernel fix, rather than breaking user
> >> space.
> >>
> >> I attempted to work around this in wlroots, adjusting 0.18, 0.19, and
> >> 0.20 git with similar patches. First I attempted to stash all the
> >> written properties for the atomic code, storing an initial value of al=
l
> >> 0xFE so it was always likely to write the first time, and only setting=
 a
> >> property if it changed from the last commit.
> >>
> >> This resulted in whole commits breaking for one or both framebuffers
> >> until I ctrl-alt-fx switched to a tty and back again, and this would
> >> work again temporarily.
> >>
> >> So I went back to the drawing board and only withheld seemingly
> >> duplicate plane properties. This "worked", until I attempted to play a
> >> game, and then it started glitching spectacularly, and not updating at
> >> all if the game was doing direct scanout and vrr.
> >>
> >> Clearly this is wrong.
> >>
> >> The wlroots library queues up properties for each commit. On every
> >> commit where the cursor is disabled, it queues up both fb_id=3D0 and
> >> crtc_id=3D0. Every commit. Is this wrong? Should it only be queueing u=
p
> >> the disablement properties once? It also queues up the full plane and
> >> hotspot properties when enabled, even if the cursor doesn't change
> >> position or appearance.
> >
> > Probably should have CC'd the drm misc maintainers when I started pokin=
g
> > drm misc instead of amdgpu. Pity there isn't a list for that...
>
> I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
> and the correct list. Not sure if I should remove amd-gfx, since this
> affects them, somewhat...
>
> However, the intention of this thread was to seek commentary on the
> situation as it is.
