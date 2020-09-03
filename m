Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51C25B8D5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 04:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45036E13A;
	Thu,  3 Sep 2020 02:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C228A6E09C;
 Thu,  3 Sep 2020 02:43:19 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id g29so887877pgl.2;
 Wed, 02 Sep 2020 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uzFZds36rw0JeEsWuEjPbkSwSL2t87mwsmXA8l/SvE=;
 b=UStrrACjnYfrZEA7cEeZK/lTIJWz/NKQn3xEQ3VRAK/iedWkY4zw5ZqgXbQKV9tZQa
 7mF8QoRypny5xVXxcdm/a/nc0123HFW/5jytJtkn5zuSlXqv3m/h6db8Yy+rozhcRGGL
 DqzksqilS71GS4KvF6lvJzi5WNbqOSPoQqnHU64th9S2/15g3ZJPHi/2r1QTweusLmZf
 sqm0Gt2Ha4hAYRLRU6VwZv86AO/5VWFeLKiylWAY+PiQlG1I79eXMVWHYAz6j0g/PS2B
 JoBlHokqquBszX2C6xC4G4CSq43OAEAAc07ZO6LLRdaFp0YtF15ts+LJDGLbomFYODsb
 2zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uzFZds36rw0JeEsWuEjPbkSwSL2t87mwsmXA8l/SvE=;
 b=DsCLWSuqQvm6uwTzErQZ6HkmwOpVoNJa/ZBcwMxa+/oZsQtOhtsuImOFrb4XrYxxD3
 CjFl6BfpNn7MkfAibBW3Ff/oVVB+ltuuTLrrCZGvm+frfJ5Yro8n0hE9jbrjTJnhb4MI
 LpTLaiOjqkAeedal2ijSyqyjGHWgTr1m7UoP+l6CCMPYG+B38uphH/o/RKjE7+V2SV3I
 K92faK2nUN2RG6sdrTk2LIVDTcIYTIqJFbEbzfonzV0xD/+ttrqn0S53xxwJIEZ5S8an
 UDENpwEHRh46L2AQF4K+72T+fRYBm3gmIFjckMACN7lqtv7uaq4tCiRs588+eSRXyIls
 oLXQ==
X-Gm-Message-State: AOAM530/slwEuD1os7D8FihMZSTy+UuCZg1424Q8/vye++FnbirZqJk9
 VGydmdLhipKb3DMN9aYyMc9wc3y7oSRUpXr8wMg=
X-Google-Smtp-Source: ABdhPJx9gn/Cy90t2OlVXFwD4WQuF/Mo/GDT/oqmWI2S5gNOyBaQhmKVr7Zihj+lf0TRcYmHWos5H5lBVaM0Yc3Rau4=
X-Received: by 2002:a17:902:7489:b029:d0:4c09:be with SMTP id
 h9-20020a1709027489b02900d04c0900bemr1444512pll.0.1599100999220; Wed, 02 Sep
 2020 19:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-9-bas@basnieuwenhuizen.nl>
 <CAAxE2A7SmOvYQggfcN0A=DUMMNSeYqiKo6iLJs2ai76RupQYKQ@mail.gmail.com>
 <CAP+8YyE82tgHMq7o0HdcfS6Vryfg=BwFxbtTRXqK6Wtp3Q3XJA@mail.gmail.com>
In-Reply-To: <CAP+8YyE82tgHMq7o0HdcfS6Vryfg=BwFxbtTRXqK6Wtp3Q3XJA@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Sep 2020 22:42:42 -0400
Message-ID: <CAAxE2A4E_jhq9_q5q6u0ok38=Dmft7HqLFuqHws-TrMVTp2J2Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/amd/display: Expose modifiers.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0124836693=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0124836693==
Content-Type: multipart/alternative; boundary="00000000000004c38c05ae5fb733"

--00000000000004c38c05ae5fb733
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK. Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

Marek

On Wed, Sep 2, 2020 at 6:31 AM Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> On Fri, Aug 7, 2020 at 9:43 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> w=
rote:
> >
> > On Tue, Aug 4, 2020 at 5:32 PM Bas Nieuwenhuizen <
> bas@basnieuwenhuizen.nl> wrote:
> >>
> >> This expose modifier support on GFX9+.
> >>
> >> Only modifiers that can be rendered on the current GPU are
> >> added. This is to reduce the number of modifiers exposed.
> >>
> >> The HW could expose more, but the best mechanism to decide
> >> what to expose without an explosion in modifiers is still
> >> to be decided, and in the meantime this should not regress
> >> things from pre-modifiers and does not risk regressions as
> >> we make up our mind in the future.
> >>
> >> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> ---
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 343 +++++++++++++++++=
-
> >>  1 file changed, 342 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index c38257081868..6594cbe625f9 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -3891,6 +3891,340 @@ fill_gfx9_tiling_info_from_modifier(const
> struct amdgpu_device *adev,
> >>         }
> >>  }
> >>
> >> +enum dm_micro_swizzle {
> >> +       MICRO_SWIZZLE_Z =3D 0,
> >> +       MICRO_SWIZZLE_S =3D 1,
> >> +       MICRO_SWIZZLE_D =3D 2,
> >> +       MICRO_SWIZZLE_R =3D 3
> >> +};
> >> +
> >> +static bool dm_plane_format_mod_supported(struct drm_plane *plane,
> >> +                                         uint32_t format,
> >> +                                         uint64_t modifier)
> >> +{
> >> +       struct amdgpu_device *adev =3D plane->dev->dev_private;
> >> +       const struct drm_format_info *info =3D drm_format_info(format)=
;
> >> +
> >> +       enum dm_micro_swizzle microtile =3D
> modifier_gfx9_swizzle_mode(modifier) & 3;
> >> +
> >> +       if (!info)
> >> +               return false;
> >> +
> >> +       /*
> >> +        * We always have to allow this modifier, because core DRM sti=
ll
> >> +        * checks LINEAR support if userspace does not provide modifer=
s.
> >> +        */
> >> +       if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> >> +               return true;
> >> +
> >> +       /*
> >> +        * The arbitrary tiling support for multiplane formats has not
> been hooked
> >> +        * up.
> >> +        */
> >> +       if (info->num_planes > 1)
> >> +               return false;
> >> +
> >> +       /*
> >> +        * For D swizzle the canonical modifier depends on the bpp, so
> check
> >> +        * it here.
> >> +        */
> >> +       if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) =3D=3D
> AMD_FMT_MOD_TILE_VER_GFX9 &&
> >> +           adev->family >=3D AMDGPU_FAMILY_NV) {
> >> +               if (microtile =3D=3D MICRO_SWIZZLE_D && info->cpp[0] =
=3D=3D 4)
> >> +                       return false;
> >> +       }
> >> +
> >> +       if (adev->family >=3D AMDGPU_FAMILY_RV && microtile =3D=3D
> MICRO_SWIZZLE_D &&
> >> +           info->cpp[0] < 8)
> >> +               return false;
> >> +
> >> +       if (modifier_has_dcc(modifier)) {
> >> +               /* Per radeonsi comments 16/64 bpp are more
> complicated. */
> >> +               if (info->cpp[0] !=3D 4)
> >> +                       return false;
> >> +       }
> >> +
> >> +       return true;
> >> +}
> >> +
> >> +static void
> >> +add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t
> mod)
> >> +{
> >> +       if (!*mods)
> >> +               return;
> >> +
> >> +       if (*cap - *size < 1) {
> >> +               uint64_t new_cap =3D *cap * 2;
> >> +               uint64_t *new_mods =3D kmalloc(new_cap *
> sizeof(uint64_t), GFP_KERNEL);
> >> +
> >> +               if (!new_mods) {
> >> +                       kfree(*mods);
> >> +                       *mods =3D NULL;
> >> +                       return;
> >> +               }
> >> +
> >> +               memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
> >> +               kfree(*mods);
> >> +               *mods =3D new_mods;
> >> +               *cap =3D new_cap;
> >> +       }
> >> +
> >> +       (*mods)[*size] =3D mod;
> >> +       *size +=3D 1;
> >> +}
> >> +
> >> +static void
> >> +add_gfx9_modifiers(const struct amdgpu_device *adev,
> >> +                 uint64_t **mods, uint64_t *size, uint64_t *capacity)
> >> +{
> >> +       int pipes =3D
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> >> +       int pipe_xor_bits =3D min(8, pipes +
> >> +
>  ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
> >> +       int bank_xor_bits =3D min(8 - pipe_xor_bits,
> >> +
>  ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
> >> +       int rb =3D ilog2(adev->gfx.config.gb_addr_config_fields.num_se=
) +
> >> +
> ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
> >> +
> >> +
> >> +       if (adev->family =3D=3D AMDGPU_FAMILY_RV) {
> >> +               /*
> >> +                * No _D DCC swizzles yet because we only allow 32bpp,
> which
> >> +                * doesn't support _D on DCN
> >> +                */
> >> +
> >> +               /*
> >> +                * Always enable constant encoding, because the only
> unit that
> >> +                * didn't support it was CB. But on texture/display we
> can
> >> +                * always interpret it.
> >> +                */
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS,
> pipe_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS,
> bank_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(DCC, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> >> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
> >
> >
> > I don't think Raven1 can do DCC constant encoding in DCN and GL2.
> >
> >> +
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS,
> pipe_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS,
> bank_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(DCC, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> >> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
> >> +
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS,
> pipe_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS,
> bank_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(DCC, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> >> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> >> +                           AMD_FMT_MOD_SET(RB, rb) |
> >> +                           AMD_FMT_MOD_SET(PIPE, pipes));
> >> +
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS,
> pipe_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS,
> bank_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(DCC, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> >> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
> >> +                           AMD_FMT_MOD_SET(RB, rb) |
> >> +                           AMD_FMT_MOD_SET(PIPE, pipes));
> >> +       }
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
> >
> >
> > Addrlib says that D swizzle modes are unsupported for 32bpp in DCN1.
> They are only supported in DCE12. The swizzle modes between the two have =
no
> intersection.
>
> Right, but we don't have the format here. These get further filtered
> by dm_plane_format_mod_supported, which does:
>
>         if (adev->family >=3D AMDGPU_FAMILY_RV && microtile =3D=3D
> MICRO_SWIZZLE_D &&
>             info->cpp[0] < 8)
>                 return false;
>
> (cpp is in bytes)
>
> >
> >>
> >> +
> >> +       if (adev->family =3D=3D AMDGPU_FAMILY_RV) {
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> >> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS,
> pipe_xor_bits) |
> >> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS,
> bank_xor_bits));
> >> +       }
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D)=
 |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> >> +
> >> +       if (adev->family =3D=3D AMDGPU_FAMILY_RV) {
> >> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S) |
> >> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> >> +       }
> >> +}
> >> +
> >> +static void
> >> +add_gfx10_1_modifiers(const struct amdgpu_device *adev,
> >> +                    uint64_t **mods, uint64_t *size, uint64_t
> *capacity)
> >> +{
> >> +       int pipe_xor_bits =3D
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(DCC, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(DCC, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
> >
> >
> > D swizzle modes are unsupported according to Addrlib.
>
> Seems to be supported for DCN2:
>
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/addrlib/sr=
c/gfx10/gfx10addrlib.cpp#L1942
>
> which seems to be both gfx10.1 and gfx10.3 GPUs:
>
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/addrlib/sr=
c/gfx10/gfx10addrlib.cpp#L923
>
> >
> >>
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D)=
 |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D)=
 |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S)=
 |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> >> +}
> >> +
> >> +static void
> >> +add_gfx10_3_modifiers(const struct amdgpu_device *adev,
> >> +                    uint64_t **mods, uint64_t *size, uint64_t
> *capacity)
> >> +{
> >> +       int pipe_xor_bits =3D
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> >> +       int pkrs =3D
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(PACKERS, pkrs) |
> >> +                   AMD_FMT_MOD_SET(DCC, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_128B));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(PACKERS, pkrs) |
> >> +                   AMD_FMT_MOD_SET(DCC, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
> >> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_128B));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(PACKERS, pkrs));
> >> +
> >> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> >> +                   AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> >> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> >> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> >> +                   AMD_FMT_MOD_SET(PACKERS, pkrs));
> >
> >
> > D swizzle modes are unsupported.
>
> Same as above.
> >
> > Marek
> >
>

--00000000000004c38c05ae5fb733
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>OK. Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D=
"mailto:marek.olsak@amd.com">marek.olsak@amd.com</a>&gt;</div><div><br></di=
v><div>Marek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Sep 2, 2020 at 6:31 AM Bas Nieuwenhuizen &lt;=
<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas@basnieuwenhuizen.nl</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, A=
ug 7, 2020 at 9:43 PM Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gm=
ail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Aug 4, 2020 at 5:32 PM Bas Nieuwenhuizen &lt;<a href=3D"mailto=
:bas@basnieuwenhuizen.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; This expose modifier support on GFX9+.<br>
&gt;&gt;<br>
&gt;&gt; Only modifiers that can be rendered on the current GPU are<br>
&gt;&gt; added. This is to reduce the number of modifiers exposed.<br>
&gt;&gt;<br>
&gt;&gt; The HW could expose more, but the best mechanism to decide<br>
&gt;&gt; what to expose without an explosion in modifiers is still<br>
&gt;&gt; to be decided, and in the meantime this should not regress<br>
&gt;&gt; things from pre-modifiers and does not risk regressions as<br>
&gt;&gt; we make up our mind in the future.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieu=
wenhuizen.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 343 ++++++++=
+++++++++-<br>
&gt;&gt;=C2=A0 1 file changed, 342 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt;&gt; index c38257081868..6594cbe625f9 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&gt;&gt; @@ -3891,6 +3891,340 @@ fill_gfx9_tiling_info_from_modifier(const =
struct amdgpu_device *adev,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +enum dm_micro_swizzle {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MICRO_SWIZZLE_Z =3D 0,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MICRO_SWIZZLE_S =3D 1,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MICRO_SWIZZLE_D =3D 2,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MICRO_SWIZZLE_R =3D 3<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static bool dm_plane_format_mod_supported(struct drm_plane *plane=
,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t format,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint64_t modifier)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_device *adev =3D plane-&=
gt;dev-&gt;dev_private;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info =3D=
 drm_format_info(format);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0enum dm_micro_swizzle microtile =3D mo=
difier_gfx9_swizzle_mode(modifier) &amp; 3;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!info)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fal=
se;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We always have to allow this modifi=
er, because core DRM still<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * checks LINEAR support if userspace =
does not provide modifers.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (modifier =3D=3D DRM_FORMAT_MOD_LIN=
EAR)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tru=
e;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The arbitrary tiling support for mu=
ltiplane formats has not been hooked<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * up.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&gt;num_planes &gt; 1)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fal=
se;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * For D swizzle the canonical modifie=
r depends on the bpp, so check<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * it here.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (AMD_FMT_MOD_GET(TILE_VERSION, modi=
fier) =3D=3D AMD_FMT_MOD_TILE_VER_GFX9 &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;family &gt;=3D =
AMDGPU_FAMILY_NV) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (microt=
ile =3D=3D MICRO_SWIZZLE_D &amp;&amp; info-&gt;cpp[0] =3D=3D 4)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;family &gt;=3D AMDGPU_FAM=
ILY_RV &amp;&amp; microtile =3D=3D MICRO_SWIZZLE_D &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;cpp[0] &lt; 8)<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fal=
se;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (modifier_has_dcc(modifier)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Per rad=
eonsi comments 16/64 bpp are more complicated. */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info-&=
gt;cpp[0] !=3D 4)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint=
64_t mod)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*mods)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br=
>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*cap - *size &lt; 1) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t n=
ew_cap =3D *cap * 2;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *=
new_mods =3D kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!new_m=
ods) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0kfree(*mods);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*mods =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(new=
_mods, *mods, sizeof(uint64_t) * *size);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(*mod=
s);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*mods =3D =
new_mods;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*cap =3D n=
ew_cap;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(*mods)[*size] =3D mod;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*size +=3D 1;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +add_gfx9_modifiers(const struct amdgpu_device *adev,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uin=
t64_t **mods, uint64_t *size, uint64_t *capacity)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pipes =3D ilog2(adev-&gt;gfx.confi=
g.gb_addr_config_fields.num_pipes);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pipe_xor_bits =3D min(8, pipes +<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ilog2(adev-&gt;gfx.config.g=
b_addr_config_fields.num_se));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int bank_xor_bits =3D min(8 - pipe_xor=
_bits,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ilog2(adev-&gt;gfx.config.g=
b_addr_config_fields.num_banks));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int rb =3D ilog2(adev-&gt;gfx.config.g=
b_addr_config_fields.num_se) +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ilog2(ade=
v-&gt;gfx.config.gb_addr_config_fields.num_rb_per_se);<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;family =3D=3D AMDGPU_FAMI=
LY_RV) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * No _D D=
CC swizzles yet because we only allow 32bpp, which<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * doesn&#=
39;t support _D on DCN<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Always =
enable constant encoding, because the only unit that<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * didn&#3=
9;t support it was CB. But on texture/display we can<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * always =
interpret it.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,=
 AMD_FMT_MOD_DCC_BLOCK_64B) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));=
<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t think Raven1 can do DCC constant encoding in DCN and GL2.<=
br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,=
 AMD_FMT_MOD_DCC_BLOCK_64B) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));=
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_RETILE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,=
 AMD_FMT_MOD_DCC_BLOCK_64B) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(RB, rb) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE, pipes));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_RETILE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,=
 AMD_FMT_MOD_DCC_BLOCK_64B) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(RB, rb) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE, pipes));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));<br>
&gt;<br>
&gt;<br>
&gt; Addrlib says that D swizzle modes are unsupported for 32bpp in DCN1. T=
hey are only supported in DCE12. The swizzle modes between the two have no =
intersection.<br>
<br>
Right, but we don&#39;t have the format here. These get further filtered<br=
>
by dm_plane_format_mod_supported, which does:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (adev-&gt;family &gt;=3D AMDGPU_FAMILY_RV &a=
mp;&amp; microtile =3D=3D MICRO_SWIZZLE_D &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;cpp[0] &lt; 8)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
<br>
(cpp is in bytes)<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;family =3D=3D AMDGPU_FAMI=
LY_RV) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_b=
its) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_b=
its));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;family =3D=3D AMDGPU_FAMI=
LY_RV) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifi=
er(mods, size, capacity, AMD_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GF=
X9_64K_S) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD=
_TILE_VER_GFX9));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +add_gfx10_1_modifiers(const struct amdgpu_device *adev,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint64_t **mods, uint64_t *size, uint64_t *capacity)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pipe_xor_bits =3D ilog2(adev-&gt;g=
fx.config.gb_addr_config_fields.num_pipes);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B))=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_RETILE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_64B))=
;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));<br>
&gt;<br>
&gt;<br>
&gt; D swizzle modes are unsupported according to Addrlib.<br>
<br>
Seems to be supported for DCN2:<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/a=
ddrlib/src/gfx10/gfx10addrlib.cpp#L1942" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/addrlib/s=
rc/gfx10/gfx10addrlib.cpp#L1942</a><br>
<br>
which seems to be both gfx10.1 and gfx10.3 GPUs:<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/a=
ddrlib/src/gfx10/gfx10addrlib.cpp#L923" rel=3D"noreferrer" target=3D"_blank=
">https://gitlab.freedesktop.org/mesa/mesa/-/blob/master/src/amd/addrlib/sr=
c/gfx10/gfx10addrlib.cpp#L923</a><br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9));<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +add_gfx10_3_modifiers(const struct amdgpu_device *adev,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint64_t **mods, uint64_t *size, uint64_t *capacity)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pipe_xor_bits =3D ilog2(adev-&gt;g=
fx.config.gb_addr_config_fields.num_pipes);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int pkrs =3D ilog2(adev-&gt;gfx.config=
.gb_addr_config_fields.num_pkrs);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PACKERS, pkrs) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B)=
);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PACKERS, pkrs) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_RETILE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK, AMD_FMT_MOD_DCC_BLOCK_128B)=
);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PACKERS, pkrs));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0add_modifier(mods, size, capacity, AMD=
_FMT_MOD |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0AMD_FMT_MOD_SET(PACKERS, pkrs));<br>
&gt;<br>
&gt;<br>
&gt; D swizzle modes are unsupported.<br>
<br>
Same as above.<br>
&gt;<br>
&gt; Marek<br>
&gt;<br>
</blockquote></div>

--00000000000004c38c05ae5fb733--

--===============0124836693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0124836693==--
