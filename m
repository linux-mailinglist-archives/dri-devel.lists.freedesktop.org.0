Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A699793A48B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 18:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E1C10E12D;
	Tue, 23 Jul 2024 16:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dUUT4I3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC79510E12D;
 Tue, 23 Jul 2024 16:49:29 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2cb55ff1007so2905084a91.0; 
 Tue, 23 Jul 2024 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721753369; x=1722358169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMmHjYZaR62eDvty50K2NRQt0UbFsIJ7pK7TgLOXdII=;
 b=dUUT4I3t3jAaqdTqE1zrc7zt/RKd6ZntAzIyxoXQwC/4FQr/aSt4SGSz+pUdqAxDcu
 yq4z6VOsCneJjd6/L0agJd0cVVT2+uPFdk9Pmu+P9QKLrpDHtrOLl7EfU6FSdWw3R4v0
 lWD4wp5Ed9gJFHTNKqR8WRn81EyaIN4OxE8GTS+d1nTl1ryHsQhsQxmzZmc9JVXTD/Ij
 aEXLBtVH9jZ2UIYccwlZUpwU5QGfnaVJAv7sud38wl8+ojRdKuUT9pbV7RqDeU4l4yqd
 nTuWBL4XOWneUWpTgQpXgxeNhEiGJ0bt1lZQO1jA9rOibQ4zviSG1tleMEz2iokJrVhZ
 mKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721753369; x=1722358169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMmHjYZaR62eDvty50K2NRQt0UbFsIJ7pK7TgLOXdII=;
 b=UrJqe/bbkygqKM3z3fG9L5sNQpjH0aisSF6yXIcygvYLbF2kXtQLBx7tFaj4qhqC6j
 Dewb1GSQBKmNAZBPEfAgG1Zse9kWDoE4KpfX8+/3Jsx4MdcDj2FEcElDX+mLSmASEFyc
 yZIM/Klo0xdu7/+DsKC31U7JhgTMSaTT6oQj+qsTxB1LMD2bvU+iPOjwJOC2ejqX6QsJ
 Zc5/G2MzlKrQxXehuQMrHpMcGkX7ZbA0pRDn14VoaizxFjgq7OXJDysEnwzmyAbbwO8A
 TGY6/nbT9D+pPsrqONbHF/SjSKqInwRmDQVeQxavy6SiI73waR4BDl4W9DIR/SQZufZT
 92Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYv4gXo6GcZ1tzeUVkI+miTxPz8JUmbmMMIxZ7aLwdNXpSGua5I+MkaefatNcDkq5npNS/Qq+RyEs5kaSjVmeD8lyMPl7/hZw5xl6umE0yJmPK8eJt225ctSHJJSiWZRdrebO1kdMe/W4BuG4lJQ==
X-Gm-Message-State: AOJu0Yw1u159AMpNw1H0LZD7H/SoFS8DcTGQfLrQv3J3xtJrspAyYfcn
 kdV5ElvIwg7fh8uNHhy6E3OfaPVXY3Ufy90wKPVNa1LEjozYIttc/loe716/JnqKNlfIyNnKD4e
 sFXUY9hqnM58n/l1qwwXvPBHuIo0=
X-Google-Smtp-Source: AGHT+IE8JQBZvhS2e9eniMpbuWyekU8wcVXNlUi2GDa0myv7hS4wlZavVHKcmrE30IzEvkK6/tLYZObBbfVH90jq+Zg=
X-Received: by 2002:a17:90a:c20d:b0:2cb:4c4f:3280 with SMTP id
 98e67ed59e1d1-2cdaf5585b1mr259536a91.26.1721753368766; Tue, 23 Jul 2024
 09:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net>
 <ad78ada4-4e31-4994-845b-fe756b52a1ae@t-8ch.de>
In-Reply-To: <ad78ada4-4e31-4994-845b-fe756b52a1ae@t-8ch.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2024 12:49:17 -0400
Message-ID: <CADnq5_OjRgMkqnsep_AtKxonhCxthZZCsv+eNERuGH4-fXw6Ww@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: convert bios_hardcoded_edid to drm_edid
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
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

On Sun, Jun 16, 2024 at 2:32=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> On 2024-06-16 11:12:03+0000, Thomas Wei=C3=9Fschuh wrote:
> > Instead of manually passing around 'struct edid *' and its size,
> > use 'struct drm_edid', which encapsulates a validated combination of
> > both.
> >
> > As the drm_edid_ can handle NULL gracefully, the explicit checks can be
> > dropped.
> >
> > Also save a few characters by transforming '&array[0]' to the equivalen=
t
> > 'array' and using 'max_t(int, ...)' instead of manual casts.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
> > While this patch introduces a new user for drm_edid_raw(),
> > if amdgpu proper gets migrated to 'struct drm_edid', that usage will go
> > away.
> >
> > This is only compile-tested.
> >
> > I have some more patches for the rest of amdgpu,
> > to move to 'struct drm_edid'.
> > This patch is a test-balloon for the general idea.
> >
> > The same can also be done for drm/radeon.
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  6 +-----
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       |  4 ++--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c       |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 21 +++++++-----------=
---
> >  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  2 +-
> >  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  2 +-
> >  8 files changed, 15 insertions(+), 26 deletions(-)
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/g=
pu/drm/amd/amdgpu/atombios_encoders.c
> > index 25feab188dfe..90383094ed1e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> > @@ -2064,20 +2064,13 @@ amdgpu_atombios_encoder_get_lcd_info(struct amd=
gpu_encoder *encoder)
> >                               case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
> >                                       fake_edid_record =3D (ATOM_FAKE_E=
DID_PATCH_RECORD *)record;
> >                                       if (fake_edid_record->ucFakeEDIDL=
ength) {
> > -                                             struct edid *edid;
> > -                                             int edid_size =3D
> > -                                                     max((int)EDID_LEN=
GTH, (int)fake_edid_record->ucFakeEDIDLength);
> > -                                             edid =3D kmalloc(edid_siz=
e, GFP_KERNEL);
> > -                                             if (edid) {
> > -                                                     memcpy((u8 *)edid=
, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
> > -                                                            fake_edid_=
record->ucFakeEDIDLength);
> > -
> > -                                                     if (drm_edid_is_v=
alid(edid)) {
> > -                                                             adev->mod=
e_info.bios_hardcoded_edid =3D edid;
> > -                                                             adev->mod=
e_info.bios_hardcoded_edid_size =3D edid_size;
> > -                                                     } else
> > -                                                             kfree(edi=
d);
> > -                                             }
> > +                                             const struct drm_edid *ed=
id;
> > +                                             edid =3D drm_edid_alloc(f=
ake_edid_record->ucFakeEDIDString,
> > +                                                                   max=
_t(int, EDID_LENGTH, fake_edid_record->ucFakeEDIDLength));
> > +                                             if (drm_edid_valid(edid))
> > +                                                     adev->mode_info.b=
ios_hardcoded_edid =3D edid;
> > +                                             else
> > +                                                     drm_edid_free(edi=
d);
>
> The old code here seems broken in general.
> In drivers/gpu/drm/amd/include/atombios.h the comment for ucFakeEDIDLengt=
h says:
> (I expect the same field in the same struct for amdgpu to have the same s=
emantics)
>
>     UCHAR ucFakeEDIDLength;       // =3D 128 means EDID length is 128 byt=
es, otherwise the EDID length =3D ucFakeEDIDLength*128
>
> So as soon as the EDID from the BIOS has extensions, only the first few
> bytes will be copied into the allocated memory. drm_edid_is_valid() will
> then read the uninitialized memory and if the "extensions" field ends up
> non-zero it will happily "validate" past the allocated buffer.

I guess the allocation should be changed to something like:
if (ucFakeEDIDLength =3D=3D 128)
    edid_size =3D ucFakeEDIDLength;
else
    edid_size =3D ucFakeEDIDLength * 128;

That said, I don't know how many systems actually used this.  IIRC
this was only used in GPUs from 15-20 years ago.  No objections to the
patch in general.

Alex


>
> The new code won't work either but at least it won't read uninitialized
> memory nor will it read past the buffer bounds.
>
> >                                       }
> >                                       record +=3D fake_edid_record->ucF=
akeEDIDLength ?
> >                                                 struct_size(fake_edid_r=
ecord,
>
> <snip>
