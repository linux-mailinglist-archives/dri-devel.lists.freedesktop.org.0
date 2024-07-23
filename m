Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99593A4C2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 19:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13A10E613;
	Tue, 23 Jul 2024 17:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nv3EsrD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7C10E613;
 Tue, 23 Jul 2024 17:14:53 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7669d62b5bfso703709a12.1; 
 Tue, 23 Jul 2024 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721754892; x=1722359692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YR/sRwpB1CCsWUP+4Ph7FU7thUB0l4sYMzG0JevTYg=;
 b=Nv3EsrD7aewrVvC0agV/nuG/ljLcbLLER04rYYFdwc4R5kYbZtDgyuY0lBKcHnNva0
 D4uzIppgekIDMptoUngl+LRXdErRhkYY97qjHPWBS8YZtputWBvY+pAYm91CZmw7XRbP
 DqgGbbKpax+/KmcsaBnp3mh4pxIL3pk8re8C/sQrKX/9KhH7RkFq2dwNo9gQM0ODbi9p
 RqOVaRFYSFU/WiBmaL7qbzejS6jUxAiUAbITpUA+WXOuOMB7OSBy7foAB1MLp1J2ykje
 L/svEbzpILDhVHBPl/Bhfw5A1MpfS1op4L8VULOesZlW42RzcEmjK5KUvTI3mgj03/Ul
 lPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721754892; x=1722359692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YR/sRwpB1CCsWUP+4Ph7FU7thUB0l4sYMzG0JevTYg=;
 b=NWG3r2qQ26dzRPXrDz6awmcN6ZxFrTpDLYll52dcP6uDhUn1LkPnr4hxmaCMx8KhI6
 UzTlLxBN0IeJ42hNr/iyR7L7Cn/haz/sz6R881paS88RivlyojNBcT4H/b4mKHKlSsQA
 fnyd+0KMyrHGnS/JwonhBViC5YApLhKID+ZcBAXCCBemYSVsRm7pohWGRUaxxRsKUqTs
 GjI7HIe5jCeBOoIYm+8WGKmX1/uq9WavUWks7A02MuaP3rjzCYAi1cj/p5RbbjYyxHou
 amRH6sHxpRC4+388H0O5JSZXezQh0XosurocZKZdRDJCsU1MzmqkoaM7qtRq9na3XCLY
 Hscw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWviDgziVcASGhDS3aXncoB6hU6u31TtGhVktZ3RmXMB5l8RgB79iM6nICCXPUDDuaZ2vL4mTkEO+Dw3Giooo/RhED8lH8Po61YaKRliJC+UsqJcFrv4Eiv10guscIEOaCHiPBCI2xIen2+5Eixsg==
X-Gm-Message-State: AOJu0Ywb6/Db18F9EMjo1t2GPG7tn+jbIqYQ1mlk/kp32Xk4Ntds+e0o
 saAgjZP4B54m5eek6M+ABj/xcemfzr7oQ6E2W7pouTh95SVVaU0ve7pJo8SAZELxs6XGTa0IyAM
 Scmja88tQVLKw08ayXZCytLzSQDQ=
X-Google-Smtp-Source: AGHT+IGOWJh0Vr3vgfLKwgbdET9Ih1+E4GAFHNnhf5BKkoe1va0SUJ3C95dZPt2LE3dvS9NDOXkvc202wsNZKJQrkB0=
X-Received: by 2002:a17:90b:1e4d:b0:2c8:7897:eb46 with SMTP id
 98e67ed59e1d1-2cd274d48c6mr7012879a91.37.1721754892475; Tue, 23 Jul 2024
 10:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net>
 <ad78ada4-4e31-4994-845b-fe756b52a1ae@t-8ch.de>
 <CADnq5_OjRgMkqnsep_AtKxonhCxthZZCsv+eNERuGH4-fXw6Ww@mail.gmail.com>
In-Reply-To: <CADnq5_OjRgMkqnsep_AtKxonhCxthZZCsv+eNERuGH4-fXw6Ww@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2024 13:14:40 -0400
Message-ID: <CADnq5_NU51=+QM5OC+Ut4ahU_b-64zCAaTKfLB1BKbZijutHCg@mail.gmail.com>
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

On Tue, Jul 23, 2024 at 12:49=E2=80=AFPM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Sun, Jun 16, 2024 at 2:32=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weis=
sschuh.net> wrote:
> >
> > On 2024-06-16 11:12:03+0000, Thomas Wei=C3=9Fschuh wrote:
> > > Instead of manually passing around 'struct edid *' and its size,
> > > use 'struct drm_edid', which encapsulates a validated combination of
> > > both.
> > >
> > > As the drm_edid_ can handle NULL gracefully, the explicit checks can =
be
> > > dropped.
> > >
> > > Also save a few characters by transforming '&array[0]' to the equival=
ent
> > > 'array' and using 'max_t(int, ...)' instead of manual casts.
> > >
> > > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > ---
> > > While this patch introduces a new user for drm_edid_raw(),
> > > if amdgpu proper gets migrated to 'struct drm_edid', that usage will =
go
> > > away.
> > >
> > > This is only compile-tested.
> > >
> > > I have some more patches for the rest of amdgpu,
> > > to move to 'struct drm_edid'.
> > > This patch is a test-balloon for the general idea.
> > >
> > > The same can also be done for drm/radeon.
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c |  6 +-----
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h       |  4 ++--
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c       |  2 +-
> > >  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 21 +++++++---------=
-----
> > >  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c         |  2 +-
> > >  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c         |  2 +-
> > >  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  2 +-
> > >  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  2 +-
> > >  8 files changed, 15 insertions(+), 26 deletions(-)
> >
> > <snip>
> >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers=
/gpu/drm/amd/amdgpu/atombios_encoders.c
> > > index 25feab188dfe..90383094ed1e 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> > > @@ -2064,20 +2064,13 @@ amdgpu_atombios_encoder_get_lcd_info(struct a=
mdgpu_encoder *encoder)
> > >                               case LCD_FAKE_EDID_PATCH_RECORD_TYPE:
> > >                                       fake_edid_record =3D (ATOM_FAKE=
_EDID_PATCH_RECORD *)record;
> > >                                       if (fake_edid_record->ucFakeEDI=
DLength) {
> > > -                                             struct edid *edid;
> > > -                                             int edid_size =3D
> > > -                                                     max((int)EDID_L=
ENGTH, (int)fake_edid_record->ucFakeEDIDLength);
> > > -                                             edid =3D kmalloc(edid_s=
ize, GFP_KERNEL);
> > > -                                             if (edid) {
> > > -                                                     memcpy((u8 *)ed=
id, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
> > > -                                                            fake_edi=
d_record->ucFakeEDIDLength);
> > > -
> > > -                                                     if (drm_edid_is=
_valid(edid)) {
> > > -                                                             adev->m=
ode_info.bios_hardcoded_edid =3D edid;
> > > -                                                             adev->m=
ode_info.bios_hardcoded_edid_size =3D edid_size;
> > > -                                                     } else
> > > -                                                             kfree(e=
did);
> > > -                                             }
> > > +                                             const struct drm_edid *=
edid;
> > > +                                             edid =3D drm_edid_alloc=
(fake_edid_record->ucFakeEDIDString,
> > > +                                                                   m=
ax_t(int, EDID_LENGTH, fake_edid_record->ucFakeEDIDLength));
> > > +                                             if (drm_edid_valid(edid=
))
> > > +                                                     adev->mode_info=
.bios_hardcoded_edid =3D edid;
> > > +                                             else
> > > +                                                     drm_edid_free(e=
did);
> >
> > The old code here seems broken in general.
> > In drivers/gpu/drm/amd/include/atombios.h the comment for ucFakeEDIDLen=
gth says:
> > (I expect the same field in the same struct for amdgpu to have the same=
 semantics)
> >
> >     UCHAR ucFakeEDIDLength;       // =3D 128 means EDID length is 128 b=
ytes, otherwise the EDID length =3D ucFakeEDIDLength*128
> >
> > So as soon as the EDID from the BIOS has extensions, only the first few
> > bytes will be copied into the allocated memory. drm_edid_is_valid() wil=
l
> > then read the uninitialized memory and if the "extensions" field ends u=
p
> > non-zero it will happily "validate" past the allocated buffer.
>
> I guess the allocation should be changed to something like:
> if (ucFakeEDIDLength =3D=3D 128)
>     edid_size =3D ucFakeEDIDLength;
> else
>     edid_size =3D ucFakeEDIDLength * 128;

The record size handling in atombios_encoders.c would also need to be fixed=
.

Alex

>
> That said, I don't know how many systems actually used this.  IIRC
> this was only used in GPUs from 15-20 years ago.  No objections to the
> patch in general.
>
> Alex
>
>
> >
> > The new code won't work either but at least it won't read uninitialized
> > memory nor will it read past the buffer bounds.
> >
> > >                                       }
> > >                                       record +=3D fake_edid_record->u=
cFakeEDIDLength ?
> > >                                                 struct_size(fake_edid=
_record,
> >
> > <snip>
