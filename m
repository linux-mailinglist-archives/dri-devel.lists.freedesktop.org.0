Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BA93D388
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 14:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3FE10E8B6;
	Fri, 26 Jul 2024 12:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cV8Agy9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E253210E8B6;
 Fri, 26 Jul 2024 12:52:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fc569440e1so5810335ad.3; 
 Fri, 26 Jul 2024 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721998350; x=1722603150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nl6ThKFvgtQtUv9d4LulxfTZukBDYJgIsNXgNCVx5ac=;
 b=cV8Agy9QW+UpW3k9N+qzFe+DqZjoczXSTz65GyOFb1iZJBPBNjhdzZABOpuKmjw9ef
 HKJ0IWPnNS8f0U7ZYiWciv2ZEhv9Cou2WcwFrdf5R8zI8HcAiZdOuflt061Lo7nNOqzN
 b8bE4iukjCwCVmjk3mb98wIGC6zj+mpLcQs8doivAKnGfO0344rkhL1sJBSRaoWbwSl1
 HRcJJkMK8Yjcwn0ejgtaTJY5ikk9i92LZwrnHUF+JnzXV8irFAy/fDhdCtIaXzPc34Xx
 BrBulJevSEdMTsvSuFhABy6+nfxH9r3yljgmugXKEfICcx/O0edqm9m5t7JYKTGzJbky
 nITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721998350; x=1722603150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nl6ThKFvgtQtUv9d4LulxfTZukBDYJgIsNXgNCVx5ac=;
 b=tZLf+if7xdW+FfTNxV3QEtrkR/QLj1K4ZE6cxc3NkNyNWIBw6A7+XX97DKFVIuioDE
 23PRd7fjhe/GsK/wLD8frMYR1iuhfA6KdMrDiL9FpP8FjGk6sGhTTSGVFLbPcrYAClOV
 rmOfHz1Ku2fSNyyzjqABHsRDMhMq2bDr3XHRfF6E05k82393xayuCEJnqvJR/YGYJvVk
 ad+4tuk8Cin5GTg0Mz1Ngwqw9/h3WqzvNvtg1B4GYdf47GGnBjZovkiiUIuz3RrWR2J8
 NeDkDqK5zULCjEDTDYkiurfUoC0Ry32lUODNVGMH4ciBbrOPq6PbN4QoVkVZie8v/aWx
 oASg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnrQ91uL8fjtjBVpGvmdYlb0q8lmfbMsIa0I70gFzyUUgP+bRUlhOwMFrYJl0xYxkJiH1BFzSYOo1ofwKO1AR217jkO1FwsXKCsfeUr0Giq9b0ZdXoILApEIJiGZsf3N0Vp140MDwOXseFigMDUw==
X-Gm-Message-State: AOJu0YwM1eZq+uC8Ydl89t48c6WUmNtyrrJBB2UWdNOXpgqKGiOfWesh
 vvwn89DA1IPfdz9v4YKkBi6xJ0Ho2A4bcXcVN06UANKOxDc+gCgggSd09/0Xl5NpJLFsXSbTEjL
 jT13AXklNO/2ofYD66Q8LGzg0hh8=
X-Google-Smtp-Source: AGHT+IEJHhRw/2mhPW780IeoT698zyyYGxwE+9O2EQ0T7VqZtjo0r65t5srrsM5KUTRmbT+dv1QTnf0jjMW7AFpVSkc=
X-Received: by 2002:a17:90b:b03:b0:2c8:e43b:4015 with SMTP id
 98e67ed59e1d1-2cf2377360bmr6772084a91.6.1721998350174; Fri, 26 Jul 2024
 05:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
In-Reply-To: <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jul 2024 08:52:17 -0400
Message-ID: <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
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

On Fri, Jul 26, 2024 at 3:05=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
> > Several cs track offsets (such as 'track->db_s_read_offset')
> > either are initialized with or plainly take big enough values that,
> > once shifted 8 bits left, may be hit with integer overflow if the
> > resulting values end up going over u32 limit.
> >
> > Some debug prints take this into account (see according dev_warn() in
> > evergreen_cs_track_validate_stencil()), even if the actual
> > calculated value assigned to local 'offset' variable is missing
> > similar proper expansion.
> >
> > Mitigate the problem by casting the type of right operands to the
> > wider type of corresponding left ones in all such cases.
> >
> > Found by Linux Verification Center (linuxtesting.org) with static
> > analysis tool SVACE.
> >
> > Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling i=
nformations v11")
> > Cc: stable@vger.kernel.org
>
> Well first of all the long cast doesn't makes the value 64bit, it
> depends on the architecture.
>
> Then IIRC the underlying hw can only handle a 32bit address space so
> having the offset as long is incorrect to begin with.

Evergreen chips support a 36 bit internal address space and NI and
newer support a 40 bit one, so this is applicable.

Alex

>
> And finally that is absolutely not material for stable.
>
> Regards,
> Christian.
>
> > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > ---
> > P.S. While I am not certain that track->cb_color_bo_offset[id]
> > actually ends up taking values high enough to cause an overflow,
> > nonetheless I thought it prudent to cast it to ulong as well.
> >
> >   drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/ra=
deon/evergreen_cs.c
> > index 1fe6e0d883c7..d734d221e2da 100644
> > --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> > +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> > @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct ra=
deon_cs_parser *p, unsigned i
> >               return r;
> >       }
> >
> > -     offset =3D track->cb_color_bo_offset[id] << 8;
> > +     offset =3D (unsigned long)track->cb_color_bo_offset[id] << 8;
> >       if (offset & (surf.base_align - 1)) {
> >               dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned wi=
th %ld\n",
> >                        __func__, __LINE__, id, offset, surf.base_align)=
;
> > @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct ra=
deon_cs_parser *p, unsigned i
> >                               min =3D surf.nby - 8;
> >                       }
> >                       bsize =3D radeon_bo_size(track->cb_color_bo[id]);
> > -                     tmp =3D track->cb_color_bo_offset[id] << 8;
> > +                     tmp =3D (unsigned long)track->cb_color_bo_offset[=
id] << 8;
> >                       for (nby =3D surf.nby; nby > min; nby--) {
> >                               size =3D nby * surf.nbx * surf.bpe * surf=
.nsamples;
> >                               if ((tmp + size * mslice) <=3D bsize) {
> > @@ -476,10 +476,10 @@ static int evergreen_cs_track_validate_cb(struct =
radeon_cs_parser *p, unsigned i
> >                       }
> >               }
> >               dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %=
d, "
> > -                      "offset %d, max layer %d, bo size %ld, slice %d)=
\n",
> > +                      "offset %ld, max layer %d, bo size %ld, slice %d=
)\n",
> >                        __func__, __LINE__, id, surf.layer_size,
> > -                     track->cb_color_bo_offset[id] << 8, mslice,
> > -                     radeon_bo_size(track->cb_color_bo[id]), slice);
> > +                     (unsigned long)track->cb_color_bo_offset[id] << 8=
,
> > +                     mslice, radeon_bo_size(track->cb_color_bo[id]), s=
lice);
> >               dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d =
%d %d %d %d %d)\n",
> >                        __func__, __LINE__, surf.nbx, surf.nby,
> >                       surf.mode, surf.bpe, surf.nsamples,
> > @@ -608,7 +608,7 @@ static int evergreen_cs_track_validate_stencil(stru=
ct radeon_cs_parser *p)
> >               return r;
> >       }
> >
> > -     offset =3D track->db_s_read_offset << 8;
> > +     offset =3D (unsigned long)track->db_s_read_offset << 8;
> >       if (offset & (surf.base_align - 1)) {
> >               dev_warn(p->dev, "%s:%d stencil read bo base %ld not alig=
ned with %ld\n",
> >                        __func__, __LINE__, offset, surf.base_align);
> > @@ -627,7 +627,7 @@ static int evergreen_cs_track_validate_stencil(stru=
ct radeon_cs_parser *p)
> >               return -EINVAL;
> >       }
> >
> > -     offset =3D track->db_s_write_offset << 8;
> > +     offset =3D (unsigned long)track->db_s_write_offset << 8;
> >       if (offset & (surf.base_align - 1)) {
> >               dev_warn(p->dev, "%s:%d stencil write bo base %ld not ali=
gned with %ld\n",
> >                        __func__, __LINE__, offset, surf.base_align);
> > @@ -706,7 +706,7 @@ static int evergreen_cs_track_validate_depth(struct=
 radeon_cs_parser *p)
> >               return r;
> >       }
> >
> > -     offset =3D track->db_z_read_offset << 8;
> > +     offset =3D (unsigned long)track->db_z_read_offset << 8;
> >       if (offset & (surf.base_align - 1)) {
> >               dev_warn(p->dev, "%s:%d stencil read bo base %ld not alig=
ned with %ld\n",
> >                        __func__, __LINE__, offset, surf.base_align);
> > @@ -722,7 +722,7 @@ static int evergreen_cs_track_validate_depth(struct=
 radeon_cs_parser *p)
> >               return -EINVAL;
> >       }
> >
> > -     offset =3D track->db_z_write_offset << 8;
> > +     offset =3D (unsigned long)track->db_z_write_offset << 8;
> >       if (offset & (surf.base_align - 1)) {
> >               dev_warn(p->dev, "%s:%d stencil write bo base %ld not ali=
gned with %ld\n",
> >                        __func__, __LINE__, offset, surf.base_align);
>
