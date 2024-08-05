Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97F947CF4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 16:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A4D10E210;
	Mon,  5 Aug 2024 14:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iStNvd2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6C10E210;
 Mon,  5 Aug 2024 14:36:53 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1fdd6d81812so91574785ad.1; 
 Mon, 05 Aug 2024 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722868613; x=1723473413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHAzP3S88dfaqn+qscjv4QEzSFpizfKFOZ1oCnJxWko=;
 b=iStNvd2WZCOsFgWU9tsX0SfjJu31LLmyzGmFaMvFfB4/FT+kOOgNiGDHBITbGOUjWZ
 qrJvMLVwyIg4+tMVOUoCQBBXKPghhrKN7idGtFrVgiKpKoEfB+xldwRBAAkQBvu9l88y
 x9HEUG/kcasdBQ/Jx1FNY0EN5Gwk/acX6e4oA6nUCYs159XR6FcY7qgsHxJ1f5g33eg2
 TyyD/4z6lydppyyW2U2lsgb7dDgcjypKeTYf6a7aY8u4U75MpXHyeCPTfhWaug6gDzB4
 Rw4x1CNiRhNzDrW2ouY4oG2fdufpmZSQXmHUqRezlU+IdoZKTW5ZlOydTKyNbSgTFovM
 vEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722868613; x=1723473413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JHAzP3S88dfaqn+qscjv4QEzSFpizfKFOZ1oCnJxWko=;
 b=cyNUbuYrRUi71czg5guY4BAp2nRwmMSI4HsXq3qHQBVU3GKV10UgbPMYY2OO/EnBG/
 6tz8IZvF4vQubY/tudsc8Nwt+8RiaW2wSOes/WxepLl118Z0vRr0Lu/8MvN420PPECzd
 K36pzjCg0ryQhqTG9YDxY5A4BbB9PgRbmdgm21FHFIIudmpjiIqk1lwHVrLBgvd907CY
 BAGHZ/fIXQus2iopO7kqnLCRugbXnXo76GJqo5Sw88cQlfm6sMBbG7YcHTKws2KUYUS+
 H1JfTAHe0XucqV+gz9dYdEs9MJgfgN4jvkqet9ombXDQWgu3/2oxmFl7IKarB53yp3XH
 d1AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6MGNlLYa21M1ogiF8xmBwTH3BSvq4nIXpC5JxRlFsDSS6OCcYd29XmhtPH00rmoHcOzFMgCMFpNPs2rijdP7WQ5b0FU6mR+vHEFxazRX/bvcZ1B9BUNw8AVhkCUU+iuLwyWEaFcoW7N7Ffp06Wg==
X-Gm-Message-State: AOJu0YzEXjlTkENmyHpPAeVTh1n657JZbhDooT5ThqjyclGM97Al5M+i
 Smek7SUI5Nh3zAxv9Is7waz41YxrmW+L9Ax8GzwDiCb7GeDc5Emd65wyvLvMbPEHhlGImoxIuFT
 CRnij+I99Wpl1gR5jvl0Fm0KNUQw1uPjb
X-Google-Smtp-Source: AGHT+IG5uYH964HVm7D3GRTxDtKerP1rDMTVkDhDfFhFHkLVHjFdE7m3jLdLoL4arwmIPldmNUcJXv2cmahjhdEebto=
X-Received: by 2002:a17:902:da82:b0:1fd:791d:1437 with SMTP id
 d9443c01a7336-1ff5722da46mr166655175ad.6.1722868613038; Mon, 05 Aug 2024
 07:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
 <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
 <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
 <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
 <cb85a5c1-526b-4024-8e8f-23c2fe0d8381@amd.com>
 <158d9e56-d8af-4d0f-980c-4355639f6ff8@fintech.ru>
 <a80ec052-72a3-4630-8381-bc24ad3a6ab6@amd.com>
 <66f8503f-4c36-4ac7-b66c-f9526409a0eb@fintech.ru>
In-Reply-To: <66f8503f-4c36-4ac7-b66c-f9526409a0eb@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 5 Aug 2024 10:36:41 -0400
Message-ID: <CADnq5_NaMr+vpqwqhsMoSeGrto2Lw5v0KXWEp2HRK=++orScMg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Glisse <jglisse@redhat.com>, 
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org, 
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

On Mon, Aug 5, 2024 at 3:34=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
>
>
> On 7/30/24 23:56, Christian K=C3=B6nig wrote:
> > Am 30.07.24 um 19:36 schrieb Nikita Zhandarovich:
> >> On 7/29/24 11:12, Christian K=C3=B6nig wrote:
> >>> Am 29.07.24 um 20:04 schrieb Christian K=C3=B6nig:
> >>>> Am 29.07.24 um 19:26 schrieb Nikita Zhandarovich:
> >>>>> Hi,
> >>>>>
> >>>>> On 7/29/24 02:23, Christian K=C3=B6nig wrote:
> >>>>>> Am 26.07.24 um 14:52 schrieb Alex Deucher:
> >>>>>>> On Fri, Jul 26, 2024 at 3:05=E2=80=AFAM Christian K=C3=B6nig
> >>>>>>> <christian.koenig@amd.com> wrote:
> >>>>>>>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
> >>>>>>>>> Several cs track offsets (such as 'track->db_s_read_offset')
> >>>>>>>>> either are initialized with or plainly take big enough values
> >>>>>>>>> that,
> >>>>>>>>> once shifted 8 bits left, may be hit with integer overflow if t=
he
> >>>>>>>>> resulting values end up going over u32 limit.
> >>>>>>>>>
> >>>>>>>>> Some debug prints take this into account (see according
> >>>>>>>>> dev_warn() in
> >>>>>>>>> evergreen_cs_track_validate_stencil()), even if the actual
> >>>>>>>>> calculated value assigned to local 'offset' variable is missing
> >>>>>>>>> similar proper expansion.
> >>>>>>>>>
> >>>>>>>>> Mitigate the problem by casting the type of right operands to t=
he
> >>>>>>>>> wider type of corresponding left ones in all such cases.
> >>>>>>>>>
> >>>>>>>>> Found by Linux Verification Center (linuxtesting.org) with stat=
ic
> >>>>>>>>> analysis tool SVACE.
> >>>>>>>>>
> >>>>>>>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni
> >>>>>>>>> tiling informations v11")
> >>>>>>>>> Cc: stable@vger.kernel.org
> >>>>>>>> Well first of all the long cast doesn't makes the value 64bit, i=
t
> >>>>>>>> depends on the architecture.
> >>>>>>>>
> >>>>>>>> Then IIRC the underlying hw can only handle a 32bit address
> >>>>>>>> space so
> >>>>>>>> having the offset as long is incorrect to begin with.
> >>>>>>> Evergreen chips support a 36 bit internal address space and NI an=
d
> >>>>>>> newer support a 40 bit one, so this is applicable.
> >>>>>> In that case I strongly suggest that we replace the unsigned long
> >>>>>> with
> >>>>>> u64 or otherwise we get different behavior on 32 and 64bit machine=
s.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>> To be clear, I'll prepare v2 patch that changes 'offset' to u64 as
> >>>>> well
> >>>>> as the cast of 'track->db_z_read_offset' (and the likes) to u64 too=
.
> >>>>>
> >>>>> On the other note, should I also include casting to wider type of t=
he
> >>>>> expression surf.layer_size * mslice (example down below) in
> >>>>> evergreen_cs_track_validate_cb() and other similar functions? I can=
't
> >>>>> properly gauge if the result will definitively fit into u32, maybe =
it
> >>>>> makes sense to expand it as well?
> >>>> The integer overflows caused by shifts are irrelevant and doesn't ne=
ed
> >>>> any fixing in the first place.
> >>> Wait a second.
> >>>
> >>> Thinking more about it the integer overflows are actually necessary
> >>> because that is exactly what happens in the hardware as well.
> >>>
> >>> If you don't overflow those shifts you actually create a security
> >>> problem because the HW the might access at a different offset then yo=
u
> >>> calculated here.
> >>>
> >>> We need to use something like a mask or use lower_32_bits() here.
> >> Christian,
> >>
> >> My apologies, I may be getting a bit confused here.
> >>
> >> If integer overflows caused by shifts are predictable and constitute
> >> normal behavior in this case, and there is no need to "fix" them, does
> >> it still make sense to use any mitigations at all, i.e. masks or macro=
s?
> >
> > Well you stumbled over that somehow, so some automated checker things
> > that this is a bad idea.
> >
> >> Leaving these shifts to u32 variables as they are now will achieve the
> >> same result as, for example, doing something along the lines of:
> >>
> >> offset =3D lower_32_bits((u64)track->cb_color_bo_offset[id] << 8);
> >>
> >> which seems clunky and unnecessary, even if it suppresses some static
> >> analyzer triggers (and that seems overboard).
> >> Or am I missing something obvious here?
> >
> > No, it's just about suppressing the static checker warnings.
> >
> > I'm also not 100% sure how that old hw works. Alex mentioned that it is
> > using 36bits internally.
> >
> > So it could be that we need to switch to using u64 here. I need to
> > double check that with Alex.
> >
> > But using unsigned long is certainly incorrect cause we then get
> > different behavior based on the CPU architecture.
> >
> > Thanks for pointing this out,
> > Christian.> >
>
> Hi,
>
> Christian, did you get a chance to go over hw specifics with Alex?
> I'd really like to get on with v2 patch but I can't really start
> properly if I don't know what (and how) exactly to fix.
>
> I am also hesitant to split the fix into parts and I'd rather do the
> whole int overflow mitigation in one set.

The HW has a 36 or 40 bit internal address space depending on the
generation, so we should be using 64 bit data types.  The addresses
stored in the registers are 256 byte aligned so they can fit the
address into a 32 bit register.

Alex


>
> Thanks,
> Nikita
>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> The point is rather that we need to avoid multiplication overflows a=
nd
> >>>> the security problems which come with those.
> >>>>
> >>>>> 441         }
> >>>>> 442
> >>>>> 443         offset +=3D surf.layer_size * mslice;
> >>>> In other words that here needs to be validated correctly.
> >>>>
> >> Agreed, I think either casting right operand to u64 (once 'offset' is
> >> also changed from unsigned long to u64) or using mul_u32_u32() here an=
d
> >> in other places should suffice.
> >>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> 444         if (offset > radeon_bo_size(track->cb_color_bo[id])) {
> >>>>> 445                 /* old ddx are broken they allocate bo with
> >>>>> w*h*bpp
> >>>>>
> >>>>> Regards,
> >>>>> Nikita
> >>>>>>> Alex
> >>>>>>>
> >>>>>>>> And finally that is absolutely not material for stable.
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> >>>>>>>>> ---
> >>>>>>>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
> >>>>>>>>> actually ends up taking values high enough to cause an overflow=
,
> >>>>>>>>> nonetheless I thought it prudent to cast it to ulong as well.
> >>>>>>>>>
> >>>>>>>>>      drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++------=
---
> >>>>>>>>>      1 file changed, 9 insertions(+), 9 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
> >>>>>>>>> b/drivers/gpu/drm/radeon/evergreen_cs.c
> >>>>>>>>> index 1fe6e0d883c7..d734d221e2da 100644
> >>>>>>>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> >>>>>>>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> >>>>>>>>> @@ -433,7 +433,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_cb(struct
> >>>>>>>>> radeon_cs_parser *p, unsigned i
> >>>>>>>>>                  return r;
> >>>>>>>>>          }
> >>>>>>>>>
> >>>>>>>>> -     offset =3D track->cb_color_bo_offset[id] << 8;
> >>>>>>>>> +     offset =3D (unsigned long)track->cb_color_bo_offset[id] <=
< 8;
> >>>>>>>>>          if (offset & (surf.base_align - 1)) {
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not
> >>>>>>>>> aligned with %ld\n",
> >>>>>>>>>                           __func__, __LINE__, id, offset,
> >>>>>>>>> surf.base_align);
> >>>>>>>>> @@ -455,7 +455,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_cb(struct
> >>>>>>>>> radeon_cs_parser *p, unsigned i
> >>>>>>>>>                                  min =3D surf.nby - 8;
> >>>>>>>>>                          }
> >>>>>>>>>                          bsize =3D
> >>>>>>>>> radeon_bo_size(track->cb_color_bo[id]);
> >>>>>>>>> -                     tmp =3D track->cb_color_bo_offset[id] << =
8;
> >>>>>>>>> +                     tmp =3D (unsigned
> >>>>>>>>> long)track->cb_color_bo_offset[id] << 8;
> >>>>>>>>>                          for (nby =3D surf.nby; nby > min; nby-=
-) {
> >>>>>>>>>                                  size =3D nby * surf.nbx *
> >>>>>>>>> surf.bpe *
> >>>>>>>>> surf.nsamples;
> >>>>>>>>>                                  if ((tmp + size * mslice) <=3D
> >>>>>>>>> bsize) {
> >>>>>>>>> @@ -476,10 +476,10 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_cb(struct radeon_cs_parser *p,
> >>>>>>>>> unsigned i
> >>>>>>>>>                          }
> >>>>>>>>>                  }
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d cb[%d] bo too small
> >>>>>>>>> (layer
> >>>>>>>>> size %d, "
> >>>>>>>>> -                      "offset %d, max layer %d, bo size %ld,
> >>>>>>>>> slice
> >>>>>>>>> %d)\n",
> >>>>>>>>> +                      "offset %ld, max layer %d, bo size %ld,
> >>>>>>>>> slice
> >>>>>>>>> %d)\n",
> >>>>>>>>>                           __func__, __LINE__, id, surf.layer_si=
ze,
> >>>>>>>>> -                     track->cb_color_bo_offset[id] << 8, mslic=
e,
> >>>>>>>>> - radeon_bo_size(track->cb_color_bo[id]), slice);
> >>>>>>>>> +                     (unsigned long)track->cb_color_bo_offset[=
id]
> >>>>>>>>> << 8,
> >>>>>>>>> +                     mslice,
> >>>>>>>>> radeon_bo_size(track->cb_color_bo[id]), slice);
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d problematic surf: (%d =
%d)
> >>>>>>>>> (%d
> >>>>>>>>> %d %d %d %d %d %d)\n",
> >>>>>>>>>                           __func__, __LINE__, surf.nbx, surf.nb=
y,
> >>>>>>>>>                          surf.mode, surf.bpe, surf.nsamples,
> >>>>>>>>> @@ -608,7 +608,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
> >>>>>>>>>                  return r;
> >>>>>>>>>          }
> >>>>>>>>>
> >>>>>>>>> -     offset =3D track->db_s_read_offset << 8;
> >>>>>>>>> +     offset =3D (unsigned long)track->db_s_read_offset << 8;
> >>>>>>>>>          if (offset & (surf.base_align - 1)) {
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil read bo base
> >>>>>>>>> %ld not
> >>>>>>>>> aligned with %ld\n",
> >>>>>>>>>                           __func__, __LINE__, offset,
> >>>>>>>>> surf.base_align);
> >>>>>>>>> @@ -627,7 +627,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
> >>>>>>>>>                  return -EINVAL;
> >>>>>>>>>          }
> >>>>>>>>>
> >>>>>>>>> -     offset =3D track->db_s_write_offset << 8;
> >>>>>>>>> +     offset =3D (unsigned long)track->db_s_write_offset << 8;
> >>>>>>>>>          if (offset & (surf.base_align - 1)) {
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil write bo base =
%ld
> >>>>>>>>> not
> >>>>>>>>> aligned with %ld\n",
> >>>>>>>>>                           __func__, __LINE__, offset,
> >>>>>>>>> surf.base_align);
> >>>>>>>>> @@ -706,7 +706,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
> >>>>>>>>>                  return r;
> >>>>>>>>>          }
> >>>>>>>>>
> >>>>>>>>> -     offset =3D track->db_z_read_offset << 8;
> >>>>>>>>> +     offset =3D (unsigned long)track->db_z_read_offset << 8;
> >>>>>>>>>          if (offset & (surf.base_align - 1)) {
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil read bo base
> >>>>>>>>> %ld not
> >>>>>>>>> aligned with %ld\n",
> >>>>>>>>>                           __func__, __LINE__, offset,
> >>>>>>>>> surf.base_align);
> >>>>>>>>> @@ -722,7 +722,7 @@ static int
> >>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
> >>>>>>>>>                  return -EINVAL;
> >>>>>>>>>          }
> >>>>>>>>>
> >>>>>>>>> -     offset =3D track->db_z_write_offset << 8;
> >>>>>>>>> +     offset =3D (unsigned long)track->db_z_write_offset << 8;
> >>>>>>>>>          if (offset & (surf.base_align - 1)) {
> >>>>>>>>>                  dev_warn(p->dev, "%s:%d stencil write bo base =
%ld
> >>>>>>>>> not
> >>>>>>>>> aligned with %ld\n",
> >>>>>>>>>                           __func__, __LINE__, offset,
> >>>>>>>>> surf.base_align);
> >
