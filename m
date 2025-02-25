Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09C4A44AE6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D250B10E0FE;
	Tue, 25 Feb 2025 18:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EacauXEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889E10E0FE;
 Tue, 25 Feb 2025 18:54:10 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fc8482c62dso1578093a91.3; 
 Tue, 25 Feb 2025 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740509650; x=1741114450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AA0rvEKo0ZVDA4AC4PP8ZiSrFdFLDF/n+cMbw3wSA/U=;
 b=EacauXEn/tZ7xxV4O3hMX3TPbodGZ+uHqVMot9UGEpvMVXLSUEsK+g43vKAKm4NGHK
 RX/uFqz0ubHGjf1vceTzplaNh920WIDiyS+M3WQVGknF7E9y26oecbVUMQvfxp6acAYF
 xcFkvq8gnBKV33QtwWYsXrm+nnlyWwBkXvliHd7on3ReF677MGSGrc+9HnfgbToUZiwQ
 gVxhbIGKMRC05ManpUlecj0MtYeV4P1T3im1AsfaFVOIdhnx95nB2vTCpVc8h+ZpFKy4
 7fmnr76vNcKLmcllPMnuvCVheB0L0fIei3ORoxwksypDBLPgUy//R4APM11/OPAcwZWr
 TAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740509650; x=1741114450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AA0rvEKo0ZVDA4AC4PP8ZiSrFdFLDF/n+cMbw3wSA/U=;
 b=qijo6EA1sIJCHSoPHiV7vpPAQMyBy4++HIZAdCaVproJvszUaTmkyU2ZCUCgEIxfIp
 dk5zMJ71Qv6f001zN9CyoVAYUVDHyg/cXis5eWqxioRdoBp2cI3mr2tk7F3/nPWhZ0I8
 mQq70j919/8XW756GduEA+DEiI/QF+VcV454w7F6r41m7EcRXEONw3JG9+i2eh5JyY4u
 dzUWj040hemkOP7ncM7gVhHf659DQar62GlxcG4bvP/vLZ10zlFLZbLWCLP4wFatLINJ
 Td8VQrPArTOyX5S5ZnM+ZI3PjJLFHIc1gjGJ46x4wpZsQ/v8rMidANBraRUCLHFFHzDu
 ba/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnvJiUgB3q/pGOjMVBoGFa7wPx99oRO7S5a7nUoxPTLwKxO0iFp+K+mm7X5fwC79HBpkgKlPfs@lists.freedesktop.org,
 AJvYcCVj2xGtNpJAZl7pvM2Y6zl9STLud3Fxz1kUYU3It3pAh0YH8bA2ERHnVW+aM9jRjoVhwfPKM7tyw0zu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+/QwzKu/Ih9uHanfTSk9Bbw3j7zlf0YLtC7n3t0yoYjDZ3Hzx
 wpVgYZQhDiMKip3w+QGuZwwJpcmdzbIPTtojUmVJiGW2jRfzdKlShrKVqXXWBPSgUCatVNjeMBR
 pXAhI6thgIMztWaE4jZOP+43kHJNTcA==
X-Gm-Gg: ASbGncsswi45KbS53frvCIPMXGB9bcFMwCNxd7X4el9WG1RkDZ0jMB9TuJDX7Jjx/PY
 dExeqySibz7lBnOk1c2EfwDrLbS9JTY4UMm6kl5q6DO3LBUcZWYZVFwYxgCP2z7HwcojfWfGimQ
 jSLo+6ktU=
X-Google-Smtp-Source: AGHT+IG3RUE4Uc/bf+X/hHkgKySQsMTqqvCc150meilYfVSQg2hcrFlXvi/rDBHJ0TRf5T1bmMeS9gxuOAdr0Atr/QI=
X-Received: by 2002:a17:90b:4c04:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2fce76a2781mr12183065a91.1.1740509649496; Tue, 25 Feb 2025
 10:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20250225015532.303032-1-luanicaro@usp.br>
In-Reply-To: <20250225015532.303032-1-luanicaro@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 Feb 2025 13:53:57 -0500
X-Gm-Features: AWEUYZkWTm3RW2NwStD1VvYFAnmLworA9vmnHpas4o76MuuqtDPaR2YLY_CDbzI
Message-ID: <CADnq5_Mi7jotv=ZYpEW1f1HOdOniUsJnXEqHqC2n38q=b42yxg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/display/dc: Refactor remove duplications
To: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Applied.  Thanks!

Alex

On Mon, Feb 24, 2025 at 8:55=E2=80=AFPM Luan Icaro Pinto Arcanjo
<luanicaro@usp.br> wrote:
>
> From: Luan Arcanjo <luanicaro@usp.br>
>
> All dce command_table_helper's shares a copy-pasted collection
> of copy-pasted functions, which are: phy_id_to_atom,
> clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.
>
> This patch removes the multiple copy-pasted by moving them to
> the command_table_helper.c and make the command_table_helper's
> calls the functions implemented by the command_table_helper.c
> instead.
>
> The changes were not tested on actual hardware. I am only able
> to verify that the changes keep the code compileable and do my
> best to to look repeatedly if I am not actually changing any code.
>
> This is the version 4 of the PATCH, fixed comments about
> licence in the new files and the matches From email to
> Signed-off-by email. Fixed comments about using
> command_table_helper instead of creating a dce_common
>
> Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
> ---
>  .../display/dc/bios/command_table_helper.c    | 104 +++++++++++++++++
>  .../display/dc/bios/command_table_helper.h    |   8 ++
>  .../bios/dce110/command_table_helper_dce110.c | 104 -----------------
>  .../dce112/command_table_helper2_dce112.c     | 106 +-----------------
>  .../bios/dce112/command_table_helper_dce112.c | 104 -----------------
>  .../bios/dce60/command_table_helper_dce60.c   | 104 -----------------
>  .../bios/dce80/command_table_helper_dce80.c   | 104 -----------------
>  7 files changed, 114 insertions(+), 520 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c b=
/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> index e317a3615147..91bc8a06e2cf 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.c
> @@ -293,3 +293,107 @@ uint8_t dal_cmd_table_helper_encoder_id_to_atom(
>                 return ENCODER_OBJECT_ID_NONE;
>         }
>  }
> +
> +uint8_t phy_id_to_atom(enum transmitter t)
> +{
> +       uint8_t atom_phy_id;
> +
> +       switch (t) {
> +       case TRANSMITTER_UNIPHY_A:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> +               break;
> +       case TRANSMITTER_UNIPHY_B:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> +               break;
> +       case TRANSMITTER_UNIPHY_C:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> +               break;
> +       case TRANSMITTER_UNIPHY_D:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> +               break;
> +       case TRANSMITTER_UNIPHY_E:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> +               break;
> +       case TRANSMITTER_UNIPHY_F:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> +               break;
> +       case TRANSMITTER_UNIPHY_G:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> +               break;
> +       default:
> +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> +               break;
> +       }
> +       return atom_phy_id;
> +}
> +
> +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> +               enum clock_source_id id)
> +{
> +       uint8_t atom_phy_clk_src_id =3D 0;
> +
> +       switch (id) {
> +       case CLOCK_SOURCE_ID_PLL0:
> +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> +               break;
> +       case CLOCK_SOURCE_ID_PLL1:
> +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> +               break;
> +       case CLOCK_SOURCE_ID_PLL2:
> +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> +               break;
> +       case CLOCK_SOURCE_ID_EXTERNAL:
> +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> +               break;
> +       default:
> +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> +               break;
> +       }
> +
> +       return atom_phy_clk_src_id >> 2;
> +}
> +
> +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> +{
> +       bool result =3D false;
> +
> +       if (atom_engine_id !=3D NULL)
> +               switch (id) {
> +               case ENGINE_ID_DIGA:
> +                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGB:
> +                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGC:
> +                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGD:
> +                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGE:
> +                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGF:
> +                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DIGG:
> +                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               case ENGINE_ID_DACA:
> +                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> +                       result =3D true;
> +                       break;
> +               default:
> +                       break;
> +               }
> +
> +       return result;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.h b=
/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.h
> index dfd30aaf4032..547700e119a6 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.h
> +++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper.h
> @@ -59,4 +59,12 @@ uint8_t dal_cmd_table_helper_transmitter_bp_to_atom(
>
>  uint8_t dal_cmd_table_helper_encoder_id_to_atom(
>         enum encoder_id id);
> +
> +uint8_t phy_id_to_atom(enum transmitter t);
> +
> +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> +               enum clock_source_id id);
> +
> +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_hel=
per_dce110.c b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_hel=
per_dce110.c
> index 11bf247bb180..3099128223df 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce=
110.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce=
110.c
> @@ -31,39 +31,6 @@
>
>  #include "../command_table_helper.h"
>
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -       uint8_t atom_phy_id;
> -
> -       switch (t) {
> -       case TRANSMITTER_UNIPHY_A:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       case TRANSMITTER_UNIPHY_B:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> -               break;
> -       case TRANSMITTER_UNIPHY_C:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> -               break;
> -       case TRANSMITTER_UNIPHY_D:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> -               break;
> -       case TRANSMITTER_UNIPHY_E:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> -               break;
> -       case TRANSMITTER_UNIPHY_F:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> -               break;
> -       case TRANSMITTER_UNIPHY_G:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> -               break;
> -       default:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       }
> -       return atom_phy_id;
> -}
> -
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
>         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V5_DP;
> @@ -94,32 +61,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signa=
l_type s)
>         return atom_dig_mode;
>  }
>
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -               enum clock_source_id id)
> -{
> -       uint8_t atom_phy_clk_src_id =3D 0;
> -
> -       switch (id) {
> -       case CLOCK_SOURCE_ID_PLL0:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL1:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL2:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_EXTERNAL:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> -               break;
> -       default:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       }
> -
> -       return atom_phy_clk_src_id >> 2;
> -}
> -
>  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>  {
>         uint8_t atom_hpd_sel =3D 0;
> @@ -207,51 +148,6 @@ static bool clock_source_id_to_atom(
>         return result;
>  }
>
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_i=
d)
> -{
> -       bool result =3D false;
> -
> -       if (atom_engine_id !=3D NULL)
> -               switch (id) {
> -               case ENGINE_ID_DIGA:
> -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGB:
> -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGC:
> -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGD:
> -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGE:
> -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGF:
> -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGG:
> -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DACA:
> -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -       return result;
> -}
> -
>  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action act=
ion)
>  {
>         uint8_t atom_action =3D 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_hel=
per2_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_he=
lper2_dce112.c
> index 755b6e33140a..349f0e5d5856 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dc=
e112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dc=
e112.c
> @@ -29,40 +29,9 @@
>
>  #include "include/bios_parser_types.h"
>
> -#include "../command_table_helper2.h"
> -
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -       uint8_t atom_phy_id;
> +#include "../command_table_helper.h"
>
> -       switch (t) {
> -       case TRANSMITTER_UNIPHY_A:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       case TRANSMITTER_UNIPHY_B:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> -               break;
> -       case TRANSMITTER_UNIPHY_C:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> -               break;
> -       case TRANSMITTER_UNIPHY_D:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> -               break;
> -       case TRANSMITTER_UNIPHY_E:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> -               break;
> -       case TRANSMITTER_UNIPHY_F:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> -               break;
> -       case TRANSMITTER_UNIPHY_G:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> -               break;
> -       default:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       }
> -       return atom_phy_id;
> -}
> +#include "../command_table_helper2.h"
>
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
> @@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signa=
l_type s)
>         return atom_dig_mode;
>  }
>
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -               enum clock_source_id id)
> -{
> -       uint8_t atom_phy_clk_src_id =3D 0;
> -
> -       switch (id) {
> -       case CLOCK_SOURCE_ID_PLL0:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL1:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL2:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_EXTERNAL:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> -               break;
> -       default:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       }
> -
> -       return atom_phy_clk_src_id >> 2;
> -}
> -
>  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>  {
>         uint8_t atom_hpd_sel =3D 0;
> @@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
>         return result;
>  }
>
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_i=
d)
> -{
> -       bool result =3D false;
> -
> -       if (atom_engine_id !=3D NULL)
> -               switch (id) {
> -               case ENGINE_ID_DIGA:
> -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGB:
> -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGC:
> -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGD:
> -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGE:
> -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGF:
> -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGG:
> -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DACA:
> -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -       return result;
> -}
> -
>  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action act=
ion)
>  {
>         uint8_t atom_action =3D 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_hel=
per_dce112.c b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_hel=
per_dce112.c
> index 06b4f7fa4a50..1a5fefcde8af 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce=
112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce=
112.c
> @@ -31,39 +31,6 @@
>
>  #include "../command_table_helper.h"
>
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -       uint8_t atom_phy_id;
> -
> -       switch (t) {
> -       case TRANSMITTER_UNIPHY_A:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       case TRANSMITTER_UNIPHY_B:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> -               break;
> -       case TRANSMITTER_UNIPHY_C:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> -               break;
> -       case TRANSMITTER_UNIPHY_D:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> -               break;
> -       case TRANSMITTER_UNIPHY_E:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> -               break;
> -       case TRANSMITTER_UNIPHY_F:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> -               break;
> -       case TRANSMITTER_UNIPHY_G:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> -               break;
> -       default:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       }
> -       return atom_phy_id;
> -}
> -
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
>         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V6_DP;
> @@ -91,32 +58,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signa=
l_type s)
>         return atom_dig_mode;
>  }
>
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -               enum clock_source_id id)
> -{
> -       uint8_t atom_phy_clk_src_id =3D 0;
> -
> -       switch (id) {
> -       case CLOCK_SOURCE_ID_PLL0:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL1:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL2:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_EXTERNAL:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> -               break;
> -       default:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       }
> -
> -       return atom_phy_clk_src_id >> 2;
> -}
> -
>  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
>  {
>         uint8_t atom_hpd_sel =3D 0;
> @@ -209,51 +150,6 @@ static bool clock_source_id_to_atom(
>         return result;
>  }
>
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_i=
d)
> -{
> -       bool result =3D false;
> -
> -       if (atom_engine_id !=3D NULL)
> -               switch (id) {
> -               case ENGINE_ID_DIGA:
> -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGB:
> -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGC:
> -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGD:
> -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGE:
> -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGF:
> -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGG:
> -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DACA:
> -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -       return result;
> -}
> -
>  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action act=
ion)
>  {
>         uint8_t atom_action =3D 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_help=
er_dce60.c b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper=
_dce60.c
> index 710221b4f5c5..01ccc803040c 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce6=
0.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce6=
0.c
> @@ -58,51 +58,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_=
control_action action)
>         return atom_action;
>  }
>
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_i=
d)
> -{
> -       bool result =3D false;
> -
> -       if (atom_engine_id !=3D NULL)
> -               switch (id) {
> -               case ENGINE_ID_DIGA:
> -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGB:
> -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGC:
> -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGD:
> -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGE:
> -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGF:
> -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGG:
> -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DACA:
> -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -       return result;
> -}
> -
>  static bool clock_source_id_to_atom(
>         enum clock_source_id id,
>         uint32_t *atom_pll_id)
> @@ -149,32 +104,6 @@ static bool clock_source_id_to_atom(
>         return result;
>  }
>
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -               enum clock_source_id id)
> -{
> -       uint8_t atom_phy_clk_src_id =3D 0;
> -
> -       switch (id) {
> -       case CLOCK_SOURCE_ID_PLL0:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL1:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL2:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_EXTERNAL:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> -               break;
> -       default:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       }
> -
> -       return atom_phy_clk_src_id >> 2;
> -}
> -
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
>         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V5_DP;
> @@ -270,39 +199,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_i=
d id)
>         return atom_dig_encoder_sel;
>  }
>
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -       uint8_t atom_phy_id;
> -
> -       switch (t) {
> -       case TRANSMITTER_UNIPHY_A:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       case TRANSMITTER_UNIPHY_B:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> -               break;
> -       case TRANSMITTER_UNIPHY_C:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> -               break;
> -       case TRANSMITTER_UNIPHY_D:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> -               break;
> -       case TRANSMITTER_UNIPHY_E:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> -               break;
> -       case TRANSMITTER_UNIPHY_F:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> -               break;
> -       case TRANSMITTER_UNIPHY_G:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> -               break;
> -       default:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       }
> -       return atom_phy_id;
> -}
> -
>  static uint8_t disp_power_gating_action_to_atom(
>         enum bp_pipe_control_action action)
>  {
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_help=
er_dce80.c b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper=
_dce80.c
> index 8b30b558cf1f..2ec5264536c7 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce8=
0.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce8=
0.c
> @@ -58,51 +58,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_=
control_action action)
>         return atom_action;
>  }
>
> -static bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_i=
d)
> -{
> -       bool result =3D false;
> -
> -       if (atom_engine_id !=3D NULL)
> -               switch (id) {
> -               case ENGINE_ID_DIGA:
> -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGB:
> -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGC:
> -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGD:
> -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGE:
> -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGF:
> -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DIGG:
> -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               case ENGINE_ID_DACA:
> -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> -                       result =3D true;
> -                       break;
> -               default:
> -                       break;
> -               }
> -
> -       return result;
> -}
> -
>  static bool clock_source_id_to_atom(
>         enum clock_source_id id,
>         uint32_t *atom_pll_id)
> @@ -149,32 +104,6 @@ static bool clock_source_id_to_atom(
>         return result;
>  }
>
> -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> -               enum clock_source_id id)
> -{
> -       uint8_t atom_phy_clk_src_id =3D 0;
> -
> -       switch (id) {
> -       case CLOCK_SOURCE_ID_PLL0:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL1:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_PLL2:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PLL;
> -               break;
> -       case CLOCK_SOURCE_ID_EXTERNAL:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_REFCLK=
_SRC_EXT;
> -               break;
> -       default:
> -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PLL;
> -               break;
> -       }
> -
> -       return atom_phy_clk_src_id >> 2;
> -}
> -
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
>         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V5_DP;
> @@ -270,39 +199,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_i=
d id)
>         return atom_dig_encoder_sel;
>  }
>
> -static uint8_t phy_id_to_atom(enum transmitter t)
> -{
> -       uint8_t atom_phy_id;
> -
> -       switch (t) {
> -       case TRANSMITTER_UNIPHY_A:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       case TRANSMITTER_UNIPHY_B:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> -               break;
> -       case TRANSMITTER_UNIPHY_C:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> -               break;
> -       case TRANSMITTER_UNIPHY_D:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> -               break;
> -       case TRANSMITTER_UNIPHY_E:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> -               break;
> -       case TRANSMITTER_UNIPHY_F:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> -               break;
> -       case TRANSMITTER_UNIPHY_G:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> -               break;
> -       default:
> -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> -               break;
> -       }
> -       return atom_phy_id;
> -}
> -
>  static uint8_t disp_power_gating_action_to_atom(
>         enum bp_pipe_control_action action)
>  {
> --
> 2.43.0
>
