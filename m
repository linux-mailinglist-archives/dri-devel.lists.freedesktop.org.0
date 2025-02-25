Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFDA432B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147F710E527;
	Tue, 25 Feb 2025 01:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="hy+d0B4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C4C10E528
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:59:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so47899605e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1740448743; x=1741053543; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KWw9UlmP6atxs4GBD3fz91MmsnIWSWDqUYX1Iq56IT0=;
 b=hy+d0B4k1psyoaW3K/PHTNONLaa1iGr5u16+jGpiJ0rAYO7Mwk476cZHga1ifbEr0D
 G4k5yZuAEoT8pVx5B6rZlJQ6IzycXRSLsg2BYKbVrfxDKVQZIYz0LFod2NCG0GjV2NNY
 xnRbveBE8nepV04faNNzHwdrpaO3k9RT/1zG+Zq07nA8z8BqPkanEOvtSmfvEX22xXUs
 4NUo8u9ZOfEjiOHFFhca+TbEitqRNaZCF0j7zFS9bvMjC6KeIG0sirXxZWF23yzrpUgS
 heB9dzaV1tFRM7i4imhbZWpqke7qgi0l+yLVbkNCR7qqVl10Yyhr6pMXAkNeZB62WIQd
 KpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740448743; x=1741053543;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KWw9UlmP6atxs4GBD3fz91MmsnIWSWDqUYX1Iq56IT0=;
 b=sl8o9MBm0vg049E0JT8mUKW1oZU9d/pat7APHMHT3hDkEb2teFvXH60PSEaxII0D4U
 qCAuTjbZjxjqFt8y4qZ56lu9Bc6S5AlVwdTRrYrRInzEDSEyfpRJobtRaWTcjcsLuGyA
 8TmxLvKDPvvHkvBZMs4J8+1p99QKXZFHDO6jm0ckzrOgkpK9t++xtQLHCors6erXJ6Wi
 Xjy5UyisgB+WWHeHW69GgMFeY5jh9FNXtgzjYl+0pBPSrxk4YW75t1U88yu6dv2uH9gn
 LFbFeDn1gvyHwihW/zj2FkN96T0VT10fetC2Sc7N71+SVWf/y7HQSScrB0bAEZk9ihTV
 46Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXq1j0WoIIcPaC4J80f1W3dlZCAJTLh1A0AiMHXzpZ2Ct2Z5zBjx3Cxi/PapojbcPrmsf72+wTJpw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywohyn18/RXCeFil4zOuF8J/4XtIOqVLkxDwFjOvAiPbV/Q8Ddu
 tissefarEfq3VxOmEnnSsHqaqzy8+lEkL+fz4J0y/8cFvcn1LHA3bOlWsJGgpS/M85uBDplE3xq
 MB4FtdEiVXkYcH+p/BdA8pqX7o20Tg9gVoc8cfQ==
X-Gm-Gg: ASbGncvB5dITDstKb8HSxl6w9FhCSv/tNC8Qk2JTvBevFnjU2CFNK7zpVdDgFnWF7rX
 iw07tU6jHAeFjXUGc3kXe9AIABoQT1BT36CoG1ODDp+iz1rb5wHx0zVs7gSWvm90yzNprjSnEwQ
 B/Mq29QKor
X-Google-Smtp-Source: AGHT+IHHCuEgRCWr1767sQsBlnab4gIKMxuRDGnumr8epb09WYpsJXO3m1ztv+0eKmTanP4SBnew49u4VlU1iUJVAig=
X-Received: by 2002:a5d:4890:0:b0:38d:b6a9:2cd2 with SMTP id
 ffacd0b85a97d-38f70858c0bmr8340823f8f.46.1740448743557; Mon, 24 Feb 2025
 17:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20250207231219.10807-1-luanicaro@usp.br>
 <CADnq5_PQ-WiZt2qnbeSnxXWkj1Cf=OLq0pjWcnzm2PE8be34Mg@mail.gmail.com>
In-Reply-To: <CADnq5_PQ-WiZt2qnbeSnxXWkj1Cf=OLq0pjWcnzm2PE8be34Mg@mail.gmail.com>
From: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
Date: Mon, 24 Feb 2025 22:58:52 -0300
X-Gm-Features: AQ5f1Jr8ZSsHKcFVJkhQNLsFoCcMS16uzxztVgUCBCNuPXXzjhO8l0h0GCPEEx4
Message-ID: <CAAgyy7fZwCqPc7NkiTWd6qLgH-b3xouoSEcr-5q93sYo6ujvEA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/display/dc: Refactor remove duplications on
 command_table files
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000001c224f062eedcd42"
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

--0000000000001c224f062eedcd42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply,

I have submitted a v4 with the changes to put these functions
 in the command_table_helper.c rather than adding a new set of files.
The mail title of v4 is
"[PATCH v4] drm/amd/display/dc: Refactor remove duplications"

@alexander.deucher@amd.com <alexander.deucher@amd.com> Can you take a look?

Luan

Em ter., 11 de fev. de 2025 =C3=A0s 16:50, Alex Deucher <alexdeucher@gmail.=
com>
escreveu:

> On Fri, Feb 7, 2025 at 6:13=E2=80=AFPM Luan Icaro Pinto Arcanjo
> <luanicaro@usp.br> wrote:
> >
> > From: Luan Arcanjo <luanicaro@usp.br>
> >
> > All dce command_table_helper's shares a copy-pasted collection
> > of copy-pasted functions, which are: phy_id_to_atom,
> > clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.
> >
> > This patch removes the multiple copy-pasted by creating a
> > common command table and make the command_table_helper's calls
> > the functions implemented by the common instead.
> >
> > The changes were not tested on actual hardware. I am only able
> > to verify that the changes keep the code compileable and do my
> > best to to look repeatedly if I am not actually changing any code.
> >
> > This is the version 2 of the PATCH, fixed comments about
> > licence in the new files and the matches From email to
> > Signed-off-by email.
> >
> > Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
> > ---
> >  drivers/gpu/drm/amd/display/dc/bios/Makefile  |   6 +
> >  .../bios/dce110/command_table_helper_dce110.c | 104 +----------------
> >  .../dce112/command_table_helper2_dce112.c     | 104 +----------------
> >  .../bios/dce112/command_table_helper_dce112.c | 104 +----------------
> >  .../bios/dce60/command_table_helper_dce60.c   | 106 +----------------
> >  .../bios/dce80/command_table_helper_dce80.c   | 106 +----------------
> >  .../command_table_helper_dce_common.c         | 110 ++++++++++++++++++
> >  .../command_table_helper_dce_common.h         |  14 +++
> >  8 files changed, 137 insertions(+), 517 deletions(-)
> >  create mode 100644
> drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_c=
ommon.c
> >  create mode 100644
> drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce_c=
ommon.h
>
> Might be easier to just put these into command_table_helper.c rather
> than adding a new set of files.  @Wentland, Harry, @Leo (Sunpeng) Li
> do you have a preference?  Other than that, looks like a nice clean up
> to me.
>
> Alex
>
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/bios/Makefile
> b/drivers/gpu/drm/amd/display/dc/bios/Makefile
> > index ed6b5e9763f6..0d2f7ca1d0c2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/bios/Makefile
> > +++ b/drivers/gpu/drm/amd/display/dc/bios/Makefile
> > @@ -27,6 +27,7 @@ BIOS =3D bios_parser.o bios_parser_interface.o
> bios_parser_helper.o command_table
> >
> >  BIOS +=3D command_table2.o command_table_helper2.o bios_parser2.o
> >
> > +
> >  AMD_DAL_BIOS =3D $(addprefix $(AMDDALPATH)/dc/bios/,$(BIOS))
> >
> >  AMD_DISPLAY_FILES +=3D $(AMD_DAL_BIOS)
> > @@ -55,3 +56,8 @@ AMD_DISPLAY_FILES +=3D
> $(AMDDALPATH)/dc/bios/dce110/command_table_helper_dce110.o
> >  AMD_DISPLAY_FILES +=3D
> $(AMDDALPATH)/dc/bios/dce112/command_table_helper_dce112.o
> >
> >  AMD_DISPLAY_FILES +=3D
> $(AMDDALPATH)/dc/bios/dce112/command_table_helper2_dce112.o
> > +
> >
> +########################################################################=
#######
> > +# DCE COMMON
> >
> +########################################################################=
#######
> > +AMD_DISPLAY_FILES +=3D
> $(AMDDALPATH)/dc/bios/dce_common/command_table_helper_dce_common.o
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.=
c
> b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.=
c
> > index 11bf247bb180..6f8fec224b88 100644
> > ---
> a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.=
c
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce110.=
c
> > @@ -31,38 +31,7 @@
> >
> >  #include "../command_table_helper.h"
> >
> > -static uint8_t phy_id_to_atom(enum transmitter t)
> > -{
> > -       uint8_t atom_phy_id;
> > -
> > -       switch (t) {
> > -       case TRANSMITTER_UNIPHY_A:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_B:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_C:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_D:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_E:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_F:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_G:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > -               break;
> > -       default:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       }
> > -       return atom_phy_id;
> > -}
> > +#include "../dce_common/command_table_helper_dce_common.h"
> >
> >  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
> >  {
> > @@ -94,32 +63,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum
> signal_type s)
> >         return atom_dig_mode;
> >  }
> >
> > -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > -               enum clock_source_id id)
> > -{
> > -       uint8_t atom_phy_clk_src_id =3D 0;
> > -
> > -       switch (id) {
> > -       case CLOCK_SOURCE_ID_PLL0:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL1:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL2:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_EXTERNAL:
> > -               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > -               break;
> > -       default:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       }
> > -
> > -       return atom_phy_clk_src_id >> 2;
> > -}
> > -
> >  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
> >  {
> >         uint8_t atom_hpd_sel =3D 0;
> > @@ -207,51 +150,6 @@ static bool clock_source_id_to_atom(
> >         return result;
> >  }
> >
> > -static bool engine_bp_to_atom(enum engine_id id, uint32_t
> *atom_engine_id)
> > -{
> > -       bool result =3D false;
> > -
> > -       if (atom_engine_id !=3D NULL)
> > -               switch (id) {
> > -               case ENGINE_ID_DIGA:
> > -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGB:
> > -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGC:
> > -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGD:
> > -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGE:
> > -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGF:
> > -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGG:
> > -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DACA:
> > -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -       return result;
> > -}
> > -
> >  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action
> action)
> >  {
> >         uint8_t atom_action =3D 0;
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112=
.c
> b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112=
.c
> > index 755b6e33140a..3392277ac3b6 100644
> > ---
> a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112=
.c
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dce112=
.c
> > @@ -31,38 +31,7 @@
> >
> >  #include "../command_table_helper2.h"
> >
> > -static uint8_t phy_id_to_atom(enum transmitter t)
> > -{
> > -       uint8_t atom_phy_id;
> > -
> > -       switch (t) {
> > -       case TRANSMITTER_UNIPHY_A:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_B:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_C:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_D:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_E:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_F:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_G:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > -               break;
> > -       default:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       }
> > -       return atom_phy_id;
> > -}
> > +#include "../dce_common/command_table_helper_dce_common.h"
> >
> >  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
> >  {
> > @@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum
> signal_type s)
> >         return atom_dig_mode;
> >  }
> >
> > -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > -               enum clock_source_id id)
> > -{
> > -       uint8_t atom_phy_clk_src_id =3D 0;
> > -
> > -       switch (id) {
> > -       case CLOCK_SOURCE_ID_PLL0:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL1:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL2:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_EXTERNAL:
> > -               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > -               break;
> > -       default:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       }
> > -
> > -       return atom_phy_clk_src_id >> 2;
> > -}
> > -
> >  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
> >  {
> >         uint8_t atom_hpd_sel =3D 0;
> > @@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
> >         return result;
> >  }
> >
> > -static bool engine_bp_to_atom(enum engine_id id, uint32_t
> *atom_engine_id)
> > -{
> > -       bool result =3D false;
> > -
> > -       if (atom_engine_id !=3D NULL)
> > -               switch (id) {
> > -               case ENGINE_ID_DIGA:
> > -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGB:
> > -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGC:
> > -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGD:
> > -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGE:
> > -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGF:
> > -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGG:
> > -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DACA:
> > -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -       return result;
> > -}
> > -
> >  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action
> action)
> >  {
> >         uint8_t atom_action =3D 0;
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.=
c
> b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.=
c
> > index 06b4f7fa4a50..39b199b388e4 100644
> > ---
> a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.=
c
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce112.=
c
> > @@ -31,38 +31,7 @@
> >
> >  #include "../command_table_helper.h"
> >
> > -static uint8_t phy_id_to_atom(enum transmitter t)
> > -{
> > -       uint8_t atom_phy_id;
> > -
> > -       switch (t) {
> > -       case TRANSMITTER_UNIPHY_A:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_B:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_C:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_D:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_E:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_F:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_G:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > -               break;
> > -       default:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       }
> > -       return atom_phy_id;
> > -}
> > +#include "../dce_common/command_table_helper_dce_common.h"
> >
> >  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
> >  {
> > @@ -91,32 +60,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum
> signal_type s)
> >         return atom_dig_mode;
> >  }
> >
> > -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > -               enum clock_source_id id)
> > -{
> > -       uint8_t atom_phy_clk_src_id =3D 0;
> > -
> > -       switch (id) {
> > -       case CLOCK_SOURCE_ID_PLL0:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL1:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL2:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_EXTERNAL:
> > -               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > -               break;
> > -       default:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       }
> > -
> > -       return atom_phy_clk_src_id >> 2;
> > -}
> > -
> >  static uint8_t hpd_sel_to_atom(enum hpd_source_id id)
> >  {
> >         uint8_t atom_hpd_sel =3D 0;
> > @@ -209,51 +152,6 @@ static bool clock_source_id_to_atom(
> >         return result;
> >  }
> >
> > -static bool engine_bp_to_atom(enum engine_id id, uint32_t
> *atom_engine_id)
> > -{
> > -       bool result =3D false;
> > -
> > -       if (atom_engine_id !=3D NULL)
> > -               switch (id) {
> > -               case ENGINE_ID_DIGA:
> > -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGB:
> > -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGC:
> > -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGD:
> > -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGE:
> > -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGF:
> > -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGG:
> > -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DACA:
> > -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -       return result;
> > -}
> > -
> >  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action
> action)
> >  {
> >         uint8_t atom_action =3D 0;
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> > index 710221b4f5c5..49b3c6fd648d 100644
> > ---
> a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce60.c
> > @@ -33,6 +33,8 @@
> >
> >  #include "../command_table_helper.h"
> >
> > +#include "../dce_common/command_table_helper_dce_common.h"
> > +
> >  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action
> action)
> >  {
> >         uint8_t atom_action =3D 0;
> > @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum
> bp_encoder_control_action action)
> >         return atom_action;
> >  }
> >
> > -static bool engine_bp_to_atom(enum engine_id id, uint32_t
> *atom_engine_id)
> > -{
> > -       bool result =3D false;
> > -
> > -       if (atom_engine_id !=3D NULL)
> > -               switch (id) {
> > -               case ENGINE_ID_DIGA:
> > -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGB:
> > -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGC:
> > -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGD:
> > -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGE:
> > -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGF:
> > -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGG:
> > -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DACA:
> > -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -       return result;
> > -}
> > -
> >  static bool clock_source_id_to_atom(
> >         enum clock_source_id id,
> >         uint32_t *atom_pll_id)
> > @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
> >         return result;
> >  }
> >
> > -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > -               enum clock_source_id id)
> > -{
> > -       uint8_t atom_phy_clk_src_id =3D 0;
> > -
> > -       switch (id) {
> > -       case CLOCK_SOURCE_ID_PLL0:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL1:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL2:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_EXTERNAL:
> > -               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > -               break;
> > -       default:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       }
> > -
> > -       return atom_phy_clk_src_id >> 2;
> > -}
> > -
> >  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
> >  {
> >         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V5_DP;
> > @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum
> engine_id id)
> >         return atom_dig_encoder_sel;
> >  }
> >
> > -static uint8_t phy_id_to_atom(enum transmitter t)
> > -{
> > -       uint8_t atom_phy_id;
> > -
> > -       switch (t) {
> > -       case TRANSMITTER_UNIPHY_A:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_B:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_C:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_D:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_E:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_F:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_G:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > -               break;
> > -       default:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       }
> > -       return atom_phy_id;
> > -}
> > -
> >  static uint8_t disp_power_gating_action_to_atom(
> >         enum bp_pipe_control_action action)
> >  {
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> > index 8b30b558cf1f..f8c66e3a8f08 100644
> > ---
> a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce80.c
> > @@ -33,6 +33,8 @@
> >
> >  #include "../command_table_helper.h"
> >
> > +#include "../dce_common/command_table_helper_dce_common.h"
> > +
> >  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action
> action)
> >  {
> >         uint8_t atom_action =3D 0;
> > @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum
> bp_encoder_control_action action)
> >         return atom_action;
> >  }
> >
> > -static bool engine_bp_to_atom(enum engine_id id, uint32_t
> *atom_engine_id)
> > -{
> > -       bool result =3D false;
> > -
> > -       if (atom_engine_id !=3D NULL)
> > -               switch (id) {
> > -               case ENGINE_ID_DIGA:
> > -                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGB:
> > -                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGC:
> > -                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGD:
> > -                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGE:
> > -                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGF:
> > -                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DIGG:
> > -                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               case ENGINE_ID_DACA:
> > -                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > -                       result =3D true;
> > -                       break;
> > -               default:
> > -                       break;
> > -               }
> > -
> > -       return result;
> > -}
> > -
> >  static bool clock_source_id_to_atom(
> >         enum clock_source_id id,
> >         uint32_t *atom_pll_id)
> > @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
> >         return result;
> >  }
> >
> > -static uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > -               enum clock_source_id id)
> > -{
> > -       uint8_t atom_phy_clk_src_id =3D 0;
> > -
> > -       switch (id) {
> > -       case CLOCK_SOURCE_ID_PLL0:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL1:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_PLL2:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > -               break;
> > -       case CLOCK_SOURCE_ID_EXTERNAL:
> > -               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > -               break;
> > -       default:
> > -               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > -               break;
> > -       }
> > -
> > -       return atom_phy_clk_src_id >> 2;
> > -}
> > -
> >  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
> >  {
> >         uint8_t atom_dig_mode =3D ATOM_TRANSMITTER_DIGMODE_V5_DP;
> > @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum
> engine_id id)
> >         return atom_dig_encoder_sel;
> >  }
> >
> > -static uint8_t phy_id_to_atom(enum transmitter t)
> > -{
> > -       uint8_t atom_phy_id;
> > -
> > -       switch (t) {
> > -       case TRANSMITTER_UNIPHY_A:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_B:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_C:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_D:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_E:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_F:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > -               break;
> > -       case TRANSMITTER_UNIPHY_G:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > -               break;
> > -       default:
> > -               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > -               break;
> > -       }
> > -       return atom_phy_id;
> > -}
> > -
> >  static uint8_t disp_power_gating_action_to_atom(
> >         enum bp_pipe_control_action action)
> >  {
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.c
> b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.c
> > new file mode 100644
> > index 000000000000..d715a2bb7710
> > --- /dev/null
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: MIT
> > +
> > +#include "dm_services.h"
> > +#include "atom.h"
> > +
> > +#include "command_table_helper_dce_common.h"
> > +
> > +uint8_t phy_id_to_atom(enum transmitter t)
> > +{
> > +       uint8_t atom_phy_id;
> > +
> > +       switch (t) {
> > +       case TRANSMITTER_UNIPHY_A:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_B:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYB;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_C:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYC;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_D:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYD;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_E:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYE;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_F:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYF;
> > +               break;
> > +       case TRANSMITTER_UNIPHY_G:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYG;
> > +               break;
> > +       default:
> > +               atom_phy_id =3D ATOM_PHY_ID_UNIPHYA;
> > +               break;
> > +       }
> > +       return atom_phy_id;
> > +}
> > +
> > +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > +               enum clock_source_id id)
> > +{
> > +       uint8_t atom_phy_clk_src_id =3D 0;
> > +
> > +       switch (id) {
> > +       case CLOCK_SOURCE_ID_PLL0:
> > +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P0PL=
L;
> > +               break;
> > +       case CLOCK_SOURCE_ID_PLL1:
> > +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > +               break;
> > +       case CLOCK_SOURCE_ID_PLL2:
> > +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P2PL=
L;
> > +               break;
> > +       case CLOCK_SOURCE_ID_EXTERNAL:
> > +               atom_phy_clk_src_id =3D
> ATOM_TRANSMITTER_CONFIG_V5_REFCLK_SRC_EXT;
> > +               break;
> > +       default:
> > +               atom_phy_clk_src_id =3D ATOM_TRANSMITTER_CONFIG_V5_P1PL=
L;
> > +               break;
> > +       }
> > +
> > +       return atom_phy_clk_src_id >> 2;
> > +}
> > +
> > +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id)
> > +{
> > +       bool result =3D false;
> > +
> > +       if (atom_engine_id !=3D NULL)
> > +               switch (id) {
> > +               case ENGINE_ID_DIGA:
> > +                       *atom_engine_id =3D ASIC_INT_DIG1_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGB:
> > +                       *atom_engine_id =3D ASIC_INT_DIG2_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGC:
> > +                       *atom_engine_id =3D ASIC_INT_DIG3_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGD:
> > +                       *atom_engine_id =3D ASIC_INT_DIG4_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGE:
> > +                       *atom_engine_id =3D ASIC_INT_DIG5_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGF:
> > +                       *atom_engine_id =3D ASIC_INT_DIG6_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DIGG:
> > +                       *atom_engine_id =3D ASIC_INT_DIG7_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               case ENGINE_ID_DACA:
> > +                       *atom_engine_id =3D ASIC_INT_DAC1_ENCODER_ID;
> > +                       result =3D true;
> > +                       break;
> > +               default:
> > +                       break;
> > +               }
> > +
> > +       return result;
> > +}
> > diff --git
> a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.h
> b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.h
> > new file mode 100644
> > index 000000000000..4e0ceb39b95f
> > --- /dev/null
> > +++
> b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper_dce=
_common.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> > +#define __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> > +
> > +
> > +uint8_t phy_id_to_atom(enum transmitter t);
> > +
> > +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> > +               enum clock_source_id id);
> > +
> > +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
> > +
> > +#endif
> > --
> > 2.43.0
> >
>

--0000000000001c224f062eedcd42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlNvcnJ5IGZv
ciB0aGUgbGF0ZSByZXBseSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaGF2ZSBzdWJtaXR0
ZWQgYSB2NCB3aXRoIHRoZSBjaGFuZ2VzIHRvIHB1dCB0aGVzZSBmdW5jdGlvbnM8L2Rpdj48ZGl2
PsKgaW4gdGhlIGNvbW1hbmRfdGFibGVfaGVscGVyLmMgcmF0aGVyIHRoYW4gYWRkaW5nIGEgbmV3
IHNldCBvZiBmaWxlcy48L2Rpdj48ZGl2PlRoZSBtYWlsIHRpdGxlIG9mIHY0IGlzwqA8L2Rpdj48
ZGl2PiZxdW90O1tQQVRDSCB2NF0gZHJtL2FtZC9kaXNwbGF5L2RjOiBSZWZhY3RvciByZW1vdmUg
ZHVwbGljYXRpb25zJnF1b3Q7PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YSBjbGFzcz0iZ21h
aWxfcGx1c3JlcGx5IiBpZD0icGx1c1JlcGx5Q2hpcC0wIiBocmVmPSJtYWlsdG86YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbSIgdGFiaW5kZXg9Ii0xIj5AYWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bTwvYT4gQ2FuIHlvdSB0YWtlIGEgbG9vaz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkx1YW48
YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRy
IiBjbGFzcz0iZ21haWxfYXR0ciI+RW0gdGVyLiwgMTEgZGUgZmV2LiBkZSAyMDI1IMOgcyAxNjo1
MCwgQWxleCBEZXVjaGVyICZsdDs8YSBocmVmPSJtYWlsdG86YWxleGRldWNoZXJAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+YWxleGRldWNoZXJAZ21haWwuY29tPC9hPiZndDsgZXNjcmV2ZXU6
PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjow
cHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij5PbiBGcmksIEZlYiA3LCAyMDI1IGF0IDY6MTPigK9QTSBMdWFuIElj
YXJvIFBpbnRvIEFyY2Fuam88YnI+DQombHQ7PGEgaHJlZj0ibWFpbHRvOmx1YW5pY2Fyb0B1c3Au
YnIiIHRhcmdldD0iX2JsYW5rIj5sdWFuaWNhcm9AdXNwLmJyPC9hPiZndDsgd3JvdGU6PGJyPg0K
Jmd0Ozxicj4NCiZndDsgRnJvbTogTHVhbiBBcmNhbmpvICZsdDs8YSBocmVmPSJtYWlsdG86bHVh
bmljYXJvQHVzcC5iciIgdGFyZ2V0PSJfYmxhbmsiPmx1YW5pY2Fyb0B1c3AuYnI8L2E+Jmd0Ozxi
cj4NCiZndDs8YnI+DQomZ3Q7IEFsbCBkY2UgY29tbWFuZF90YWJsZV9oZWxwZXImIzM5O3Mgc2hh
cmVzIGEgY29weS1wYXN0ZWQgY29sbGVjdGlvbjxicj4NCiZndDsgb2YgY29weS1wYXN0ZWQgZnVu
Y3Rpb25zLCB3aGljaCBhcmU6IHBoeV9pZF90b19hdG9tLDxicj4NCiZndDsgY2xvY2tfc291cmNl
X2lkX3RvX2F0b21fcGh5X2Nsa19zcmNfaWQsIGFuZCBlbmdpbmVfYnBfdG9fYXRvbS48YnI+DQom
Z3Q7PGJyPg0KJmd0OyBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIG11bHRpcGxlIGNvcHktcGFzdGVk
IGJ5IGNyZWF0aW5nIGE8YnI+DQomZ3Q7IGNvbW1vbiBjb21tYW5kIHRhYmxlIGFuZCBtYWtlIHRo
ZSBjb21tYW5kX3RhYmxlX2hlbHBlciYjMzk7cyBjYWxsczxicj4NCiZndDsgdGhlIGZ1bmN0aW9u
cyBpbXBsZW1lbnRlZCBieSB0aGUgY29tbW9uIGluc3RlYWQuPGJyPg0KJmd0Ozxicj4NCiZndDsg
VGhlIGNoYW5nZXMgd2VyZSBub3QgdGVzdGVkIG9uIGFjdHVhbCBoYXJkd2FyZS4gSSBhbSBvbmx5
IGFibGU8YnI+DQomZ3Q7IHRvIHZlcmlmeSB0aGF0IHRoZSBjaGFuZ2VzIGtlZXAgdGhlIGNvZGUg
Y29tcGlsZWFibGUgYW5kIGRvIG15PGJyPg0KJmd0OyBiZXN0IHRvIHRvIGxvb2sgcmVwZWF0ZWRs
eSBpZiBJIGFtIG5vdCBhY3R1YWxseSBjaGFuZ2luZyBhbnkgY29kZS48YnI+DQomZ3Q7PGJyPg0K
Jmd0OyBUaGlzIGlzIHRoZSB2ZXJzaW9uIDIgb2YgdGhlIFBBVENILCBmaXhlZCBjb21tZW50cyBh
Ym91dDxicj4NCiZndDsgbGljZW5jZSBpbiB0aGUgbmV3IGZpbGVzIGFuZCB0aGUgbWF0Y2hlcyBG
cm9tIGVtYWlsIHRvPGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5IGVtYWlsLjxicj4NCiZndDs8YnI+
DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IEx1YW4gSWNhcm8gUGludG8gQXJjYW5qbyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmx1YW5pY2Fyb0B1c3AuYnIiIHRhcmdldD0iX2JsYW5rIj5sdWFuaWNhcm9AdXNw
LmJyPC9hPiZndDs8YnI+DQomZ3Q7IC0tLTxicj4NCiZndDvCoCBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvYmlvcy9NYWtlZmlsZcKgIHzCoCDCoDYgKzxicj4NCiZndDvCoCAuLi4vYmlv
cy9kY2UxMTAvY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlMTEwLmMgfCAxMDQgKy0tLS0tLS0tLS0t
LS0tLS08YnI+DQomZ3Q7wqAgLi4uL2RjZTExMi9jb21tYW5kX3RhYmxlX2hlbHBlcjJfZGNlMTEy
LmPCoCDCoCDCoHwgMTA0ICstLS0tLS0tLS0tLS0tLS0tPGJyPg0KJmd0O8KgIC4uLi9iaW9zL2Rj
ZTExMi9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2UxMTIuYyB8IDEwNCArLS0tLS0tLS0tLS0tLS0t
LTxicj4NCiZndDvCoCAuLi4vYmlvcy9kY2U2MC9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2U2MC5j
wqAgwqB8IDEwNiArLS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCAuLi4vYmlvcy9kY2U4MC9j
b21tYW5kX3RhYmxlX2hlbHBlcl9kY2U4MC5jwqAgwqB8IDEwNiArLS0tLS0tLS0tLS0tLS0tLTxi
cj4NCiZndDvCoCAuLi4vY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlX2NvbW1vbi5jwqAgwqAgwqAg
wqAgwqB8IDExMCArKysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7wqAgLi4uL2NvbW1hbmRfdGFi
bGVfaGVscGVyX2RjZV9jb21tb24uaMKgIMKgIMKgIMKgIMKgfMKgIDE0ICsrKzxicj4NCiZndDvC
oCA4IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCA1MTcgZGVsZXRpb25zKC0pPGJy
Pg0KJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvYmlvcy9kY2VfY29tbW9uL2NvbW1hbmRfdGFibGVfaGVscGVyX2RjZV9jb21tb24uYzxicj4N
CiZndDvCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2VfY29tbW9uLmg8YnI+DQo8
YnI+DQpNaWdodCBiZSBlYXNpZXIgdG8ganVzdCBwdXQgdGhlc2UgaW50byBjb21tYW5kX3RhYmxl
X2hlbHBlci5jIHJhdGhlcjxicj4NCnRoYW4gYWRkaW5nIGEgbmV3IHNldCBvZiBmaWxlcy7CoCBA
V2VudGxhbmQsIEhhcnJ5LCBATGVvIChTdW5wZW5nKSBMaTxicj4NCmRvIHlvdSBoYXZlIGEgcHJl
ZmVyZW5jZT/CoCBPdGhlciB0aGFuIHRoYXQsIGxvb2tzIGxpa2UgYSBuaWNlIGNsZWFuIHVwPGJy
Pg0KdG8gbWUuPGJyPg0KPGJyPg0KQWxleDxicj4NCjxicj4NCiZndDs8YnI+DQomZ3Q7IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9NYWtlZmlsZSBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL01ha2VmaWxlPGJyPg0KJmd0OyBpbmRl
eCBlZDZiNWU5NzYzZjYuLjBkMmY3Y2ExZDBjMiAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL01ha2VmaWxlPGJyPg0KJmd0OyArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9NYWtlZmlsZTxicj4NCiZndDsgQEAg
LTI3LDYgKzI3LDcgQEAgQklPUyA9IGJpb3NfcGFyc2VyLm8gYmlvc19wYXJzZXJfaW50ZXJmYWNl
Lm/CoCBiaW9zX3BhcnNlcl9oZWxwZXIubyBjb21tYW5kX3RhYmxlPGJyPg0KJmd0Ozxicj4NCiZn
dDvCoCBCSU9TICs9IGNvbW1hbmRfdGFibGUyLm8gY29tbWFuZF90YWJsZV9oZWxwZXIyLm8gYmlv
c19wYXJzZXIyLm88YnI+DQomZ3Q7PGJyPg0KJmd0OyArPGJyPg0KJmd0O8KgIEFNRF9EQUxfQklP
UyA9ICQoYWRkcHJlZml4ICQoQU1EREFMUEFUSCkvZGMvYmlvcy8sJChCSU9TKSk8YnI+DQomZ3Q7
PGJyPg0KJmd0O8KgIEFNRF9ESVNQTEFZX0ZJTEVTICs9ICQoQU1EX0RBTF9CSU9TKTxicj4NCiZn
dDsgQEAgLTU1LDMgKzU2LDggQEAgQU1EX0RJU1BMQVlfRklMRVMgKz0gJChBTUREQUxQQVRIKS9k
Yy9iaW9zL2RjZTExMC9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2UxMTAubzxicj4NCiZndDvCoCBB
TURfRElTUExBWV9GSUxFUyArPSAkKEFNRERBTFBBVEgpL2RjL2Jpb3MvZGNlMTEyL2NvbW1hbmRf
dGFibGVfaGVscGVyX2RjZTExMi5vPGJyPg0KJmd0Ozxicj4NCiZndDvCoCBBTURfRElTUExBWV9G
SUxFUyArPSAkKEFNRERBTFBBVEgpL2RjL2Jpb3MvZGNlMTEyL2NvbW1hbmRfdGFibGVfaGVscGVy
Ml9kY2UxMTIubzxicj4NCiZndDsgKzxicj4NCiZndDsgKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8
YnI+DQomZ3Q7ICsjIERDRSBDT01NT048YnI+DQomZ3Q7ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
PGJyPg0KJmd0OyArQU1EX0RJU1BMQVlfRklMRVMgKz0gJChBTUREQUxQQVRIKS9kYy9iaW9zL2Rj
ZV9jb21tb24vY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlX2NvbW1vbi5vPGJyPg0KJmd0OyBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNlMTEwL2NvbW1h
bmRfdGFibGVfaGVscGVyX2RjZTExMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvZGNlMTEwL2NvbW1hbmRfdGFibGVfaGVscGVyX2RjZTExMC5jPGJyPg0KJmd0OyBpbmRl
eCAxMWJmMjQ3YmIxODAuLjZmOGZlYzIyNGI4OCAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMC9jb21tYW5kX3RhYmxlX2hlbHBl
cl9kY2UxMTAuYzxicj4NCiZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvZGNlMTEwL2NvbW1hbmRfdGFibGVfaGVscGVyX2RjZTExMC5jPGJyPg0KJmd0OyBAQCAt
MzEsMzggKzMxLDcgQEA8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgICNpbmNsdWRlICZxdW90Oy4uL2Nv
bW1hbmRfdGFibGVfaGVscGVyLmgmcXVvdDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyAtc3RhdGljIHVp
bnQ4X3QgcGh5X2lkX3RvX2F0b20oZW51bSB0cmFuc21pdHRlciB0KTxicj4NCiZndDsgLXs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoHVpbnQ4X3QgYXRvbV9waHlfaWQ7PGJyPg0KJmd0OyAtPGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqBzd2l0Y2ggKHQpIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2Ug
VFJBTlNNSVRURVJfVU5JUEhZX0E6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBh
dG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUE7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJf
VU5JUEhZX0I6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9
IEFUT01fUEhZX0lEX1VOSVBIWUI7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
cmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0M6PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lE
X1VOSVBIWUM7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0Q6PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUQ7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0U6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUU7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJB
TlNNSVRURVJfVU5JUEhZX0Y6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9t
X3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUY7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5J
UEhZX0c6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFU
T01fUEhZX0lEX1VOSVBIWUc7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVh
azs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUE7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoH08YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoHJldHVybiBhdG9tX3BoeV9pZDs8YnI+DQomZ3Q7IC19PGJyPg0K
Jmd0OyArI2luY2x1ZGUgJnF1b3Q7Li4vZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBlcl9k
Y2VfY29tbW9uLmgmcXVvdDs8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIHN0YXRpYyB1aW50OF90IHNp
Z25hbF90eXBlX3RvX2F0b21fZGlnX21vZGUoZW51bSBzaWduYWxfdHlwZSBzKTxicj4NCiZndDvC
oCB7PGJyPg0KJmd0OyBAQCAtOTQsMzIgKzYzLDYgQEAgc3RhdGljIHVpbnQ4X3Qgc2lnbmFsX3R5
cGVfdG9fYXRvbV9kaWdfbW9kZShlbnVtIHNpZ25hbF90eXBlIHMpPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgcmV0dXJuIGF0b21fZGlnX21vZGU7PGJyPg0KJmd0O8KgIH08YnI+DQomZ3Q7PGJyPg0K
Jmd0OyAtc3RhdGljIHVpbnQ4X3QgY2xvY2tfc291cmNlX2lkX3RvX2F0b21fcGh5X2Nsa19zcmNf
aWQoPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnVtIGNsb2NrX3NvdXJjZV9p
ZCBpZCk8YnI+DQomZ3Q7IC17PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqB1aW50OF90IGF0b21fcGh5
X2Nsa19zcmNfaWQgPSAwOzxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKgIMKgc3dpdGNo
IChpZCkgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMDo8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBB
VE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMFBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0Vf
SURfUExMMTo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19z
cmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMVBMTDs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9D
S19TT1VSQ0VfSURfUExMMjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21f
cGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMlBMTDs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKg
Y2FzZSBDTE9DS19TT1VSQ0VfSURfRVhURVJOQUw6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVf
UkVGQ0xLX1NSQ19FWFQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVf
UDFQTEw7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoH08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoHJldHVybiBh
dG9tX3BoeV9jbGtfc3JjX2lkICZndDsmZ3Q7IDI7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgLTxi
cj4NCiZndDvCoCBzdGF0aWMgdWludDhfdCBocGRfc2VsX3RvX2F0b20oZW51bSBocGRfc291cmNl
X2lkIGlkKTxicj4NCiZndDvCoCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdWludDhfdCBhdG9t
X2hwZF9zZWwgPSAwOzxicj4NCiZndDsgQEAgLTIwNyw1MSArMTUwLDYgQEAgc3RhdGljIGJvb2wg
Y2xvY2tfc291cmNlX2lkX3RvX2F0b20oPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmV0dXJuIHJl
c3VsdDs8YnI+DQomZ3Q7wqAgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC1zdGF0aWMgYm9vbCBlbmdp
bmVfYnBfdG9fYXRvbShlbnVtIGVuZ2luZV9pZCBpZCwgdWludDMyX3QgKmF0b21fZW5naW5lX2lk
KTxicj4NCiZndDsgLXs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGJvb2wgcmVzdWx0ID0gZmFsc2U7
PGJyPg0KJmd0OyAtPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBpZiAoYXRvbV9lbmdpbmVfaWQgIT0g
TlVMTCk8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN3aXRjaCAoaWQpIHs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0E6PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQg
PSBBU0lDX0lOVF9ESUcxX0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjYXNlIEVOR0lORV9JRF9ESUdCOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHMl9FTkNPREVSX0lE
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0g
dHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFr
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHQzo8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2lu
ZV9pZCA9IEFTSUNfSU5UX0RJRzNfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0Q6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc0X0VOQ09E
RVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1
bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9E
SUdFOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21f
ZW5naW5lX2lkID0gQVNJQ19JTlRfRElHNV9FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHRjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzZf
RU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5F
X0lEX0RJR0c6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAq
YXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc3X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9EQUNBOjxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRf
REFDMV9FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVmYXVs
dDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCiZndDsgLTxicj4NCiZndDsg
LcKgIMKgIMKgIMKgcmV0dXJuIHJlc3VsdDs8YnI+DQomZ3Q7IC19PGJyPg0KJmd0OyAtPGJyPg0K
Jmd0O8KgIHN0YXRpYyB1aW50OF90IGVuY29kZXJfYWN0aW9uX3RvX2F0b20oZW51bSBicF9lbmNv
ZGVyX2NvbnRyb2xfYWN0aW9uIGFjdGlvbik8YnI+DQomZ3Q7wqAgezxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoHVpbnQ4X3QgYXRvbV9hY3Rpb24gPSAwOzxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMi9jb21tYW5kX3RhYmxlX2hl
bHBlcjJfZGNlMTEyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9kY2Ux
MTIvY29tbWFuZF90YWJsZV9oZWxwZXIyX2RjZTExMi5jPGJyPg0KJmd0OyBpbmRleCA3NTViNmUz
MzE0MGEuLjMzOTIyNzdhYzNiNiAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMi9jb21tYW5kX3RhYmxlX2hlbHBlcjJfZGNlMTEy
LmM8YnI+DQomZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2Rj
ZTExMi9jb21tYW5kX3RhYmxlX2hlbHBlcjJfZGNlMTEyLmM8YnI+DQomZ3Q7IEBAIC0zMSwzOCAr
MzEsNyBAQDxicj4NCiZndDs8YnI+DQomZ3Q7wqAgI2luY2x1ZGUgJnF1b3Q7Li4vY29tbWFuZF90
YWJsZV9oZWxwZXIyLmgmcXVvdDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyAtc3RhdGljIHVpbnQ4X3Qg
cGh5X2lkX3RvX2F0b20oZW51bSB0cmFuc21pdHRlciB0KTxicj4NCiZndDsgLXs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoHVpbnQ4X3QgYXRvbV9waHlfaWQ7PGJyPg0KJmd0OyAtPGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqBzd2l0Y2ggKHQpIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNN
SVRURVJfVU5JUEhZX0E6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3Bo
eV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUE7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZ
X0I6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01f
UEhZX0lEX1VOSVBIWUI7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0M6PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBI
WUM7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3C
oCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0Q6PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUQ7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNh
c2UgVFJBTlNNSVRURVJfVU5JUEhZX0U6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUU7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRU
RVJfVU5JUEhZX0Y6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9p
ZCA9IEFUT01fUEhZX0lEX1VOSVBIWUY7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgVFJBTlNNSVRURVJfVU5JUEhZX0c6
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZ
X0lEX1VOSVBIWUc7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBhdG9tX3BoeV9pZCA9IEFUT01fUEhZX0lEX1VOSVBIWUE7PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoH08YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoHJldHVybiBhdG9tX3BoeV9pZDs8YnI+DQomZ3Q7IC19PGJyPg0KJmd0OyAr
I2luY2x1ZGUgJnF1b3Q7Li4vZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2VfY29t
bW9uLmgmcXVvdDs8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIHN0YXRpYyB1aW50OF90IHNpZ25hbF90
eXBlX3RvX2F0b21fZGlnX21vZGUoZW51bSBzaWduYWxfdHlwZSBzKTxicj4NCiZndDvCoCB7PGJy
Pg0KJmd0OyBAQCAtOTEsMzIgKzYwLDYgQEAgc3RhdGljIHVpbnQ4X3Qgc2lnbmFsX3R5cGVfdG9f
YXRvbV9kaWdfbW9kZShlbnVtIHNpZ25hbF90eXBlIHMpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
cmV0dXJuIGF0b21fZGlnX21vZGU7PGJyPg0KJmd0O8KgIH08YnI+DQomZ3Q7PGJyPg0KJmd0OyAt
c3RhdGljIHVpbnQ4X3QgY2xvY2tfc291cmNlX2lkX3RvX2F0b21fcGh5X2Nsa19zcmNfaWQoPGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnVtIGNsb2NrX3NvdXJjZV9pZCBpZCk8
YnI+DQomZ3Q7IC17PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqB1aW50OF90IGF0b21fcGh5X2Nsa19z
cmNfaWQgPSAwOzxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKgIMKgc3dpdGNoIChpZCkg
ezxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMDo8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RS
QU5TTUlUVEVSX0NPTkZJR19WNV9QMFBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExM
MTo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQg
PSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMVBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VS
Q0VfSURfUExMMjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Ns
a19zcmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMlBMTDs8YnI+DQomZ3Q7IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBD
TE9DS19TT1VSQ0VfSURfRVhURVJOQUw6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUkVGQ0xL
X1NSQ19FWFQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUDFQTEw7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoH08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoHJldHVybiBhdG9tX3Bo
eV9jbGtfc3JjX2lkICZndDsmZ3Q7IDI7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgLTxicj4NCiZn
dDvCoCBzdGF0aWMgdWludDhfdCBocGRfc2VsX3RvX2F0b20oZW51bSBocGRfc291cmNlX2lkIGlk
KTxicj4NCiZndDvCoCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdWludDhfdCBhdG9tX2hwZF9z
ZWwgPSAwOzxicj4NCiZndDsgQEAgLTIwOSw1MSArMTUyLDYgQEAgc3RhdGljIGJvb2wgY2xvY2tf
c291cmNlX2lkX3RvX2F0b20oPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmV0dXJuIHJlc3VsdDs8
YnI+DQomZ3Q7wqAgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC1zdGF0aWMgYm9vbCBlbmdpbmVfYnBf
dG9fYXRvbShlbnVtIGVuZ2luZV9pZCBpZCwgdWludDMyX3QgKmF0b21fZW5naW5lX2lkKTxicj4N
CiZndDsgLXs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGJvb2wgcmVzdWx0ID0gZmFsc2U7PGJyPg0K
Jmd0OyAtPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBpZiAoYXRvbV9lbmdpbmVfaWQgIT0gTlVMTCk8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN3aXRjaCAoaWQpIHs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0E6PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lD
X0lOVF9ESUcxX0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
YXNlIEVOR0lORV9JRF9ESUdCOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHMl9FTkNPREVSX0lEOzxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHQzo8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9
IEFTSUNfSU5UX0RJRzNfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNhc2UgRU5HSU5FX0lEX0RJR0Q6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc0X0VOQ09ERVJfSUQ7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0
cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdFOjxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5l
X2lkID0gQVNJQ19JTlRfRElHNV9FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHRjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzZfRU5DT0RF
Ul9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3Vs
dCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
cmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJ
R0c6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9l
bmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc3X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9EQUNBOjxicj4NCiZndDsgLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfREFDMV9F
TkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVmYXVsdDo8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKg
IMKgIMKgcmV0dXJuIHJlc3VsdDs8YnI+DQomZ3Q7IC19PGJyPg0KJmd0OyAtPGJyPg0KJmd0O8Kg
IHN0YXRpYyB1aW50OF90IGVuY29kZXJfYWN0aW9uX3RvX2F0b20oZW51bSBicF9lbmNvZGVyX2Nv
bnRyb2xfYWN0aW9uIGFjdGlvbik8YnI+DQomZ3Q7wqAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDC
oHVpbnQ4X3QgYXRvbV9hY3Rpb24gPSAwOzxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMi9jb21tYW5kX3RhYmxlX2hlbHBlcl9k
Y2UxMTIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMi9jb21t
YW5kX3RhYmxlX2hlbHBlcl9kY2UxMTIuYzxicj4NCiZndDsgaW5kZXggMDZiNGY3ZmE0YTUwLi4z
OWIxOTliMzg4ZTQgMTAwNjQ0PGJyPg0KJmd0OyAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmlvcy9kY2UxMTIvY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlMTEyLmM8YnI+DQom
Z3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTExMi9jb21t
YW5kX3RhYmxlX2hlbHBlcl9kY2UxMTIuYzxicj4NCiZndDsgQEAgLTMxLDM4ICszMSw3IEBAPGJy
Pg0KJmd0Ozxicj4NCiZndDvCoCAjaW5jbHVkZSAmcXVvdDsuLi9jb21tYW5kX3RhYmxlX2hlbHBl
ci5oJnF1b3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgLXN0YXRpYyB1aW50OF90IHBoeV9pZF90b19h
dG9tKGVudW0gdHJhbnNtaXR0ZXIgdCk8YnI+DQomZ3Q7IC17PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqB1aW50OF90IGF0b21fcGh5X2lkOzxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKgIMKg
c3dpdGNoICh0KSB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBI
WV9BOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9N
X1BIWV9JRF9VTklQSFlBOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9COjxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQ
SFlCOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9DOjxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlDOzxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBj
YXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9EOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlEOzxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlU
VEVSX1VOSVBIWV9FOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlf
aWQgPSBBVE9NX1BIWV9JRF9VTklQSFlFOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9G
Ojxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BI
WV9JRF9VTklQSFlGOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9HOjxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlH
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqBkZWZhdWx0Ojxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9w
aHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlBOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqB9PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqByZXR1cm4gYXRvbV9waHlfaWQ7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgKyNpbmNsdWRlICZx
dW90Oy4uL2RjZV9jb21tb24vY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlX2NvbW1vbi5oJnF1b3Q7
PGJyPg0KJmd0Ozxicj4NCiZndDvCoCBzdGF0aWMgdWludDhfdCBzaWduYWxfdHlwZV90b19hdG9t
X2RpZ19tb2RlKGVudW0gc2lnbmFsX3R5cGUgcyk8YnI+DQomZ3Q7wqAgezxicj4NCiZndDsgQEAg
LTkxLDMyICs2MCw2IEBAIHN0YXRpYyB1aW50OF90IHNpZ25hbF90eXBlX3RvX2F0b21fZGlnX21v
ZGUoZW51bSBzaWduYWxfdHlwZSBzKTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJldHVybiBhdG9t
X2RpZ19tb2RlOzxicj4NCiZndDvCoCB9PGJyPg0KJmd0Ozxicj4NCiZndDsgLXN0YXRpYyB1aW50
OF90IGNsb2NrX3NvdXJjZV9pZF90b19hdG9tX3BoeV9jbGtfc3JjX2lkKDxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZW51bSBjbG9ja19zb3VyY2VfaWQgaWQpPGJyPg0KJmd0OyAt
ezxicj4NCiZndDsgLcKgIMKgIMKgIMKgdWludDhfdCBhdG9tX3BoeV9jbGtfc3JjX2lkID0gMDs8
YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoHN3aXRjaCAoaWQpIHs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoGNhc2UgQ0xPQ0tfU09VUkNFX0lEX1BMTDA6PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9D
T05GSUdfVjVfUDBQTEw7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgQ0xPQ0tfU09VUkNFX0lEX1BMTDE6PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lkID0gQVRPTV9UUkFO
U01JVFRFUl9DT05GSUdfVjVfUDFQTEw7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgQ0xPQ0tfU09VUkNFX0lEX1BMTDI6
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lkID0g
QVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUDJQTEw7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGNhc2UgQ0xPQ0tfU09VUkNF
X0lEX0VYVEVSTkFMOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlf
Y2xrX3NyY19pZCA9IEFUT01fVFJBTlNNSVRURVJfQ09ORklHX1Y1X1JFRkNMS19TUkNfRVhUOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqBkZWZhdWx0Ojxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlf
Y2xrX3NyY19pZCA9IEFUT01fVFJBTlNNSVRURVJfQ09ORklHX1Y1X1AxUExMOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqB9PGJy
Pg0KJmd0OyAtPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqByZXR1cm4gYXRvbV9waHlfY2xrX3NyY19p
ZCAmZ3Q7Jmd0OyAyOzxicj4NCiZndDsgLX08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7wqAgc3RhdGlj
IHVpbnQ4X3QgaHBkX3NlbF90b19hdG9tKGVudW0gaHBkX3NvdXJjZV9pZCBpZCk8YnI+DQomZ3Q7
wqAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHVpbnQ4X3QgYXRvbV9ocGRfc2VsID0gMDs8YnI+
DQomZ3Q7IEBAIC0yMDksNTEgKzE1Miw2IEBAIHN0YXRpYyBib29sIGNsb2NrX3NvdXJjZV9pZF90
b19hdG9tKDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJldHVybiByZXN1bHQ7PGJyPg0KJmd0O8Kg
IH08YnI+DQomZ3Q7PGJyPg0KJmd0OyAtc3RhdGljIGJvb2wgZW5naW5lX2JwX3RvX2F0b20oZW51
bSBlbmdpbmVfaWQgaWQsIHVpbnQzMl90ICphdG9tX2VuZ2luZV9pZCk8YnI+DQomZ3Q7IC17PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqBib29sIHJlc3VsdCA9IGZhbHNlOzxicj4NCiZndDsgLTxicj4N
CiZndDsgLcKgIMKgIMKgIMKgaWYgKGF0b21fZW5naW5lX2lkICE9IE5VTEwpPGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzd2l0Y2ggKGlkKSB7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdBOjxicj4NCiZndDsgLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHMV9F
TkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVf
SURfRElHQjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCph
dG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzJfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0M6PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9E
SUczX0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVO
R0lORV9JRF9ESUdEOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHNF9FTkNPREVSX0lEOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHRTo8YnI+DQomZ3Q7IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNf
SU5UX0RJRzVfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNh
c2UgRU5HSU5FX0lEX0RJR0Y6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc2X0VOQ09ERVJfSUQ7PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdHOjxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0g
QVNJQ19JTlRfRElHN19FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2FzZSBFTkdJTkVfSURfREFDQTo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RBQzFfRU5DT0RFUl9JRDs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRy
dWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoHJldHVy
biByZXN1bHQ7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgLTxicj4NCiZndDvCoCBzdGF0aWMgdWlu
dDhfdCBlbmNvZGVyX2FjdGlvbl90b19hdG9tKGVudW0gYnBfZW5jb2Rlcl9jb250cm9sX2FjdGlv
biBhY3Rpb24pPGJyPg0KJmd0O8KgIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB1aW50OF90IGF0
b21fYWN0aW9uID0gMDs8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvYmlvcy9kY2U2MC9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2U2MC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNlNjAvY29tbWFuZF90YWJsZV9oZWxw
ZXJfZGNlNjAuYzxicj4NCiZndDsgaW5kZXggNzEwMjIxYjRmNWM1Li40OWIzYzZmZDY0OGQgMTAw
NjQ0PGJyPg0KJmd0OyAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9k
Y2U2MC9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2U2MC5jPGJyPg0KJmd0OyArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9kY2U2MC9jb21tYW5kX3RhYmxlX2hlbHBlcl9k
Y2U2MC5jPGJyPg0KJmd0OyBAQCAtMzMsNiArMzMsOCBAQDxicj4NCiZndDs8YnI+DQomZ3Q7wqAg
I2luY2x1ZGUgJnF1b3Q7Li4vY29tbWFuZF90YWJsZV9oZWxwZXIuaCZxdW90Ozxicj4NCiZndDs8
YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDsuLi9kY2VfY29tbW9uL2NvbW1hbmRfdGFibGVfaGVs
cGVyX2RjZV9jb21tb24uaCZxdW90Ozxicj4NCiZndDsgKzxicj4NCiZndDvCoCBzdGF0aWMgdWlu
dDhfdCBlbmNvZGVyX2FjdGlvbl90b19hdG9tKGVudW0gYnBfZW5jb2Rlcl9jb250cm9sX2FjdGlv
biBhY3Rpb24pPGJyPg0KJmd0O8KgIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB1aW50OF90IGF0
b21fYWN0aW9uID0gMDs8YnI+DQomZ3Q7IEBAIC01OCw1MSArNjAsNiBAQCBzdGF0aWMgdWludDhf
dCBlbmNvZGVyX2FjdGlvbl90b19hdG9tKGVudW0gYnBfZW5jb2Rlcl9jb250cm9sX2FjdGlvbiBh
Y3Rpb24pPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmV0dXJuIGF0b21fYWN0aW9uOzxicj4NCiZn
dDvCoCB9PGJyPg0KJmd0Ozxicj4NCiZndDsgLXN0YXRpYyBib29sIGVuZ2luZV9icF90b19hdG9t
KGVudW0gZW5naW5lX2lkIGlkLCB1aW50MzJfdCAqYXRvbV9lbmdpbmVfaWQpPGJyPg0KJmd0OyAt
ezxicj4NCiZndDsgLcKgIMKgIMKgIMKgYm9vbCByZXN1bHQgPSBmYWxzZTs8YnI+DQomZ3Q7IC08
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGlmIChhdG9tX2VuZ2luZV9pZCAhPSBOVUxMKTxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3dpdGNoIChpZCkgezxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHQTo8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJ
RzFfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5H
SU5FX0lEX0RJR0I6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUcyX0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdDOjxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19J
TlRfRElHM19FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2Fz
ZSBFTkdJTkVfSURfRElHRDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzRfRU5DT0RFUl9JRDs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0U6PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBB
U0lDX0lOVF9ESUc1X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjYXNlIEVOR0lORV9JRF9ESUdGOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHNl9FTkNPREVSX0lEOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1
ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHRzo8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9p
ZCA9IEFTSUNfSU5UX0RJRzdfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RBQ0E6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9EQUMxX0VOQ09ERVJf
SUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQg
PSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJl
YWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KJmd0OyAtPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBy
ZXR1cm4gcmVzdWx0Ozxicj4NCiZndDsgLX08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7wqAgc3RhdGlj
IGJvb2wgY2xvY2tfc291cmNlX2lkX3RvX2F0b20oPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgZW51
bSBjbG9ja19zb3VyY2VfaWQgaWQsPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdWludDMyX3QgKmF0
b21fcGxsX2lkKTxicj4NCiZndDsgQEAgLTE0OSwzMiArMTA2LDYgQEAgc3RhdGljIGJvb2wgY2xv
Y2tfc291cmNlX2lkX3RvX2F0b20oPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmV0dXJuIHJlc3Vs
dDs8YnI+DQomZ3Q7wqAgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC1zdGF0aWMgdWludDhfdCBjbG9j
a19zb3VyY2VfaWRfdG9fYXRvbV9waHlfY2xrX3NyY19pZCg8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGVudW0gY2xvY2tfc291cmNlX2lkIGlkKTxicj4NCiZndDsgLXs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoHVpbnQ4X3QgYXRvbV9waHlfY2xrX3NyY19pZCA9IDA7PGJyPg0KJmd0
OyAtPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBzd2l0Y2ggKGlkKSB7PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqBjYXNlIENMT0NLX1NPVVJDRV9JRF9QTEwwOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYXRvbV9waHlfY2xrX3NyY19pZCA9IEFUT01fVFJBTlNNSVRURVJfQ09ORklHX1Y1
X1AwUExMOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqBjYXNlIENMT0NLX1NPVVJDRV9JRF9QTEwxOjxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfY2xrX3NyY19pZCA9IEFUT01fVFJBTlNNSVRURVJf
Q09ORklHX1Y1X1AxUExMOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIENMT0NLX1NPVVJDRV9JRF9QTEwyOjxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfY2xrX3NyY19pZCA9IEFUT01fVFJB
TlNNSVRURVJfQ09ORklHX1Y1X1AyUExMOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIENMT0NLX1NPVVJDRV9JRF9FWFRF
Uk5BTDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNf
aWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9SRUZDTEtfU1JDX0VYVDs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgZGVm
YXVsdDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNf
aWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMVBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgfTxicj4NCiZndDsg
LTxicj4NCiZndDsgLcKgIMKgIMKgIMKgcmV0dXJuIGF0b21fcGh5X2Nsa19zcmNfaWQgJmd0OyZn
dDsgMjs8YnI+DQomZ3Q7IC19PGJyPg0KJmd0OyAtPGJyPg0KJmd0O8KgIHN0YXRpYyB1aW50OF90
IHNpZ25hbF90eXBlX3RvX2F0b21fZGlnX21vZGUoZW51bSBzaWduYWxfdHlwZSBzKTxicj4NCiZn
dDvCoCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdWludDhfdCBhdG9tX2RpZ19tb2RlID0gQVRP
TV9UUkFOU01JVFRFUl9ESUdNT0RFX1Y1X0RQOzxicj4NCiZndDsgQEAgLTI3MCwzOSArMjAxLDYg
QEAgc3RhdGljIHVpbnQ4X3QgZGlnX2VuY29kZXJfc2VsX3RvX2F0b20oZW51bSBlbmdpbmVfaWQg
aWQpPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgcmV0dXJuIGF0b21fZGlnX2VuY29kZXJfc2VsOzxi
cj4NCiZndDvCoCB9PGJyPg0KJmd0Ozxicj4NCiZndDsgLXN0YXRpYyB1aW50OF90IHBoeV9pZF90
b19hdG9tKGVudW0gdHJhbnNtaXR0ZXIgdCk8YnI+DQomZ3Q7IC17PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqB1aW50OF90IGF0b21fcGh5X2lkOzxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKg
IMKgc3dpdGNoICh0KSB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VO
SVBIWV9BOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBB
VE9NX1BIWV9JRF9VTklQSFlBOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJl
YWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9COjxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9V
TklQSFlCOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9DOjxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlDOzxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9EOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlEOzxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5T
TUlUVEVSX1VOSVBIWV9FOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9w
aHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlFOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBI
WV9GOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9N
X1BIWV9JRF9VTklQSFlGOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9HOjxicj4NCiZn
dDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQ
SFlHOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqBkZWZhdWx0Ojxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRv
bV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlBOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqB9PGJyPg0KJmd0OyAtwqAgwqAg
wqAgwqByZXR1cm4gYXRvbV9waHlfaWQ7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgLTxicj4NCiZn
dDvCoCBzdGF0aWMgdWludDhfdCBkaXNwX3Bvd2VyX2dhdGluZ19hY3Rpb25fdG9fYXRvbSg8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqBlbnVtIGJwX3BpcGVfY29udHJvbF9hY3Rpb24gYWN0aW9uKTxi
cj4NCiZndDvCoCB7PGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Jpb3MvZGNlODAvY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlODAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZTgwL2NvbW1hbmRfdGFibGVfaGVscGVy
X2RjZTgwLmM8YnI+DQomZ3Q7IGluZGV4IDhiMzBiNTU4Y2YxZi4uZjhjNjZlM2E4ZjA4IDEwMDY0
NDxicj4NCiZndDsgLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNl
ODAvY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlODAuYzxicj4NCiZndDsgKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNlODAvY29tbWFuZF90YWJsZV9oZWxwZXJfZGNl
ODAuYzxicj4NCiZndDsgQEAgLTMzLDYgKzMzLDggQEA8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgICNp
bmNsdWRlICZxdW90Oy4uL2NvbW1hbmRfdGFibGVfaGVscGVyLmgmcXVvdDs8YnI+DQomZ3Q7PGJy
Pg0KJmd0OyArI2luY2x1ZGUgJnF1b3Q7Li4vZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBl
cl9kY2VfY29tbW9uLmgmcXVvdDs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7wqAgc3RhdGljIHVpbnQ4
X3QgZW5jb2Rlcl9hY3Rpb25fdG9fYXRvbShlbnVtIGJwX2VuY29kZXJfY29udHJvbF9hY3Rpb24g
YWN0aW9uKTxicj4NCiZndDvCoCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgdWludDhfdCBhdG9t
X2FjdGlvbiA9IDA7PGJyPg0KJmd0OyBAQCAtNTgsNTEgKzYwLDYgQEAgc3RhdGljIHVpbnQ4X3Qg
ZW5jb2Rlcl9hY3Rpb25fdG9fYXRvbShlbnVtIGJwX2VuY29kZXJfY29udHJvbF9hY3Rpb24gYWN0
aW9uKTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJldHVybiBhdG9tX2FjdGlvbjs8YnI+DQomZ3Q7
wqAgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC1zdGF0aWMgYm9vbCBlbmdpbmVfYnBfdG9fYXRvbShl
bnVtIGVuZ2luZV9pZCBpZCwgdWludDMyX3QgKmF0b21fZW5naW5lX2lkKTxicj4NCiZndDsgLXs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGJvb2wgcmVzdWx0ID0gZmFsc2U7PGJyPg0KJmd0OyAtPGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqBpZiAoYXRvbV9lbmdpbmVfaWQgIT0gTlVMTCk8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN3aXRjaCAoaWQpIHs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0E6PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUcx
X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lO
RV9JRF9ESUdCOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
KmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHMl9FTkNPREVSX0lEOzxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHQzo8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5U
X0RJRzNfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2Ug
RU5HSU5FX0lEX0RJR0Q6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9ESUc0X0VOQ09ERVJfSUQ7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4N
CiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdFOjxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJ
Q19JTlRfRElHNV9FTkNPREVSX0lEOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2FzZSBFTkdJTkVfSURfRElHRjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzZfRU5DT0RFUl9JRDs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7
PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0c6PGJyPg0K
Jmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQg
PSBBU0lDX0lOVF9ESUc3X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjYXNlIEVOR0lORV9JRF9EQUNBOjxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfREFDMV9FTkNPREVSX0lE
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0g
dHJ1ZTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFr
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVmYXVsdDo8YnI+DQomZ3Q7IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKgIMKgcmV0
dXJuIHJlc3VsdDs8YnI+DQomZ3Q7IC19PGJyPg0KJmd0OyAtPGJyPg0KJmd0O8KgIHN0YXRpYyBi
b29sIGNsb2NrX3NvdXJjZV9pZF90b19hdG9tKDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGVudW0g
Y2xvY2tfc291cmNlX2lkIGlkLDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHVpbnQzMl90ICphdG9t
X3BsbF9pZCk8YnI+DQomZ3Q7IEBAIC0xNDksMzIgKzEwNiw2IEBAIHN0YXRpYyBib29sIGNsb2Nr
X3NvdXJjZV9pZF90b19hdG9tKDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJldHVybiByZXN1bHQ7
PGJyPg0KJmd0O8KgIH08YnI+DQomZ3Q7PGJyPg0KJmd0OyAtc3RhdGljIHVpbnQ4X3QgY2xvY2tf
c291cmNlX2lkX3RvX2F0b21fcGh5X2Nsa19zcmNfaWQoPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBlbnVtIGNsb2NrX3NvdXJjZV9pZCBpZCk8YnI+DQomZ3Q7IC17PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqB1aW50OF90IGF0b21fcGh5X2Nsa19zcmNfaWQgPSAwOzxicj4NCiZndDsg
LTxicj4NCiZndDsgLcKgIMKgIMKgIMKgc3dpdGNoIChpZCkgezxicj4NCiZndDsgLcKgIMKgIMKg
IMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9Q
MFBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMTo8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVSX0NP
TkZJR19WNV9QMVBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMjo8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RSQU5T
TUlUVEVSX0NPTkZJR19WNV9QMlBMTDs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfRVhURVJO
QUw6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lk
ID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUkVGQ0xLX1NSQ19FWFQ7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoGRlZmF1
bHQ6PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3BoeV9jbGtfc3JjX2lk
ID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUDFQTEw7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoH08YnI+DQomZ3Q7IC08
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoHJldHVybiBhdG9tX3BoeV9jbGtfc3JjX2lkICZndDsmZ3Q7
IDI7PGJyPg0KJmd0OyAtfTxicj4NCiZndDsgLTxicj4NCiZndDvCoCBzdGF0aWMgdWludDhfdCBz
aWduYWxfdHlwZV90b19hdG9tX2RpZ19tb2RlKGVudW0gc2lnbmFsX3R5cGUgcyk8YnI+DQomZ3Q7
wqAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHVpbnQ4X3QgYXRvbV9kaWdfbW9kZSA9IEFUT01f
VFJBTlNNSVRURVJfRElHTU9ERV9WNV9EUDs8YnI+DQomZ3Q7IEBAIC0yNzAsMzkgKzIwMSw2IEBA
IHN0YXRpYyB1aW50OF90IGRpZ19lbmNvZGVyX3NlbF90b19hdG9tKGVudW0gZW5naW5lX2lkIGlk
KTxicj4NCiZndDvCoCDCoCDCoCDCoCDCoHJldHVybiBhdG9tX2RpZ19lbmNvZGVyX3NlbDs8YnI+
DQomZ3Q7wqAgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC1zdGF0aWMgdWludDhfdCBwaHlfaWRfdG9f
YXRvbShlbnVtIHRyYW5zbWl0dGVyIHQpPGJyPg0KJmd0OyAtezxicj4NCiZndDsgLcKgIMKgIMKg
IMKgdWludDhfdCBhdG9tX3BoeV9pZDs8YnI+DQomZ3Q7IC08YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oHN3aXRjaCAodCkgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBUUkFOU01JVFRFUl9VTklQ
SFlfQTo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2lkID0gQVRP
TV9QSFlfSURfVU5JUEhZQTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFr
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBUUkFOU01JVFRFUl9VTklQSFlfQjo8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2lkID0gQVRPTV9QSFlfSURfVU5J
UEhZQjs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsg
LcKgIMKgIMKgIMKgY2FzZSBUUkFOU01JVFRFUl9VTklQSFlfQzo8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2lkID0gQVRPTV9QSFlfSURfVU5JUEhZQzs8YnI+DQom
Z3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKg
Y2FzZSBUUkFOU01JVFRFUl9VTklQSFlfRDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGF0b21fcGh5X2lkID0gQVRPTV9QSFlfSURfVU5JUEhZRDs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBUUkFOU01J
VFRFUl9VTklQSFlfRTo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5
X2lkID0gQVRPTV9QSFlfSURfVU5JUEhZRTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBUUkFOU01JVFRFUl9VTklQSFlf
Rjo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2lkID0gQVRPTV9Q
SFlfSURfVU5JUEhZRjs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgY2FzZSBUUkFOU01JVFRFUl9VTklQSFlfRzo8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2lkID0gQVRPTV9QSFlfSURfVU5JUEhZ
Rzs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKg
IMKgIMKgIMKgZGVmYXVsdDo8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21f
cGh5X2lkID0gQVRPTV9QSFlfSURfVU5JUEhZQTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGJyZWFrOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgfTxicj4NCiZndDsgLcKgIMKgIMKg
IMKgcmV0dXJuIGF0b21fcGh5X2lkOzxicj4NCiZndDsgLX08YnI+DQomZ3Q7IC08YnI+DQomZ3Q7
wqAgc3RhdGljIHVpbnQ4X3QgZGlzcF9wb3dlcl9nYXRpbmdfYWN0aW9uX3RvX2F0b20oPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgZW51bSBicF9waXBlX2NvbnRyb2xfYWN0aW9uIGFjdGlvbik8YnI+
DQomZ3Q7wqAgezxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9iaW9zL2RjZV9jb21tb24vY29tbWFuZF90YWJsZV9oZWxwZXJfZGNlX2NvbW1vbi5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNlX2NvbW1vbi9jb21tYW5k
X3RhYmxlX2hlbHBlcl9kY2VfY29tbW9uLmM8YnI+DQomZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
PGJyPg0KJmd0OyBpbmRleCAwMDAwMDAwMDAwMDAuLmQ3MTVhMmJiNzcxMDxicj4NCiZndDsgLS0t
IC9kZXYvbnVsbDxicj4NCiZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2VfY29tbW9uLmM8YnI+DQom
Z3Q7IEBAIC0wLDAgKzEsMTEwIEBAPGJyPg0KJmd0OyArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IE1JVDxicj4NCiZndDsgKzxicj4NCiZndDsgKyNpbmNsdWRlICZxdW90O2RtX3NlcnZpY2Vz
LmgmcXVvdDs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDthdG9tLmgmcXVvdDs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDtjb21tYW5kX3RhYmxlX2hlbHBlcl9kY2VfY29t
bW9uLmgmcXVvdDs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICt1aW50OF90IHBoeV9pZF90b19hdG9t
KGVudW0gdHJhbnNtaXR0ZXIgdCk8YnI+DQomZ3Q7ICt7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB1
aW50OF90IGF0b21fcGh5X2lkOzxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3dp
dGNoICh0KSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9B
Ojxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BI
WV9JRF9VTklQSFlBOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9COjxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlC
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9DOjxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlDOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjYXNl
IFRSQU5TTUlUVEVSX1VOSVBIWV9EOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlEOzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVS
X1VOSVBIWV9FOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQg
PSBBVE9NX1BIWV9JRF9VTklQSFlFOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9GOjxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9J
RF9VTklQSFlGOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqBjYXNlIFRSQU5TTUlUVEVSX1VOSVBIWV9HOjxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlfaWQgPSBBVE9NX1BIWV9JRF9VTklQSFlHOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqBkZWZhdWx0Ojxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXRvbV9waHlf
aWQgPSBBVE9NX1BIWV9JRF9VTklQSFlBOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBy
ZXR1cm4gYXRvbV9waHlfaWQ7PGJyPg0KJmd0OyArfTxicj4NCiZndDsgKzxicj4NCiZndDsgK3Vp
bnQ4X3QgY2xvY2tfc291cmNlX2lkX3RvX2F0b21fcGh5X2Nsa19zcmNfaWQoPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnVtIGNsb2NrX3NvdXJjZV9pZCBpZCk8YnI+DQomZ3Q7
ICt7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB1aW50OF90IGF0b21fcGh5X2Nsa19zcmNfaWQgPSAw
Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3dpdGNoIChpZCkgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMDo8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RSQU5TTUlUVEVS
X0NPTkZJR19WNV9QMFBMTDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFr
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExMMTo8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQgPSBBVE9NX1RS
QU5TTUlUVEVSX0NPTkZJR19WNV9QMVBMTDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VSQ0VfSURfUExM
Mjo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF0b21fcGh5X2Nsa19zcmNfaWQg
PSBBVE9NX1RSQU5TTUlUVEVSX0NPTkZJR19WNV9QMlBMTDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgY2FzZSBDTE9DS19TT1VS
Q0VfSURfRVhURVJOQUw6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3Bo
eV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUkVGQ0xLX1NSQ19FWFQ7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoGRlZmF1bHQ6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhdG9tX3Bo
eV9jbGtfc3JjX2lkID0gQVRPTV9UUkFOU01JVFRFUl9DT05GSUdfVjVfUDFQTEw7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH08
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHJldHVybiBhdG9tX3BoeV9jbGtfc3Jj
X2lkICZndDsmZ3Q7IDI7PGJyPg0KJmd0OyArfTxicj4NCiZndDsgKzxicj4NCiZndDsgK2Jvb2wg
ZW5naW5lX2JwX3RvX2F0b20oZW51bSBlbmdpbmVfaWQgaWQsIHVpbnQzMl90ICphdG9tX2VuZ2lu
ZV9pZCk8YnI+DQomZ3Q7ICt7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBib29sIHJlc3VsdCA9IGZh
bHNlOzxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgaWYgKGF0b21fZW5naW5lX2lk
ICE9IE5VTEwpPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzd2l0Y2ggKGlkKSB7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdBOjxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5l
X2lkID0gQVNJQ19JTlRfRElHMV9FTkNPREVSX0lEOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfRElHQjo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzJfRU5DT0RF
Ul9JRDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3Vs
dCA9IHRydWU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
cmVhazs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJ
R0M6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9l
bmdpbmVfaWQgPSBBU0lDX0lOVF9ESUczX0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjYXNlIEVOR0lORV9JRF9ESUdEOjxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHNF9F
TkNPREVSX0lEOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVzdWx0ID0gdHJ1ZTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGJyZWFrOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVf
SURfRElHRTo8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCph
dG9tX2VuZ2luZV9pZCA9IEFTSUNfSU5UX0RJRzVfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNhc2UgRU5HSU5FX0lEX0RJR0Y6PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqYXRvbV9lbmdpbmVfaWQgPSBBU0lDX0lOVF9E
SUc2X0VOQ09ERVJfSUQ7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXN1bHQgPSB0cnVlOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYnJlYWs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXNlIEVO
R0lORV9JRF9ESUdHOjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKmF0b21fZW5naW5lX2lkID0gQVNJQ19JTlRfRElHN19FTkNPREVSX0lEOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVzdWx0ID0gdHJ1ZTs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZSBFTkdJTkVfSURfREFDQTo8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCphdG9tX2VuZ2luZV9pZCA9IEFTSUNf
SU5UX0RBQzFfRU5DT0RFUl9JRDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlc3VsdCA9IHRydWU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRl
ZmF1bHQ6PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVh
azs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoHJldHVybiByZXN1bHQ7PGJyPg0KJmd0OyArfTxicj4NCiZndDsgZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iaW9zL2RjZV9jb21tb24v
Y29tbWFuZF90YWJsZV9oZWxwZXJfZGNlX2NvbW1vbi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2Jpb3MvZGNlX2NvbW1vbi9jb21tYW5kX3RhYmxlX2hlbHBlcl9kY2VfY29tbW9u
Lmg8YnI+DQomZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0OyBpbmRleCAwMDAwMDAw
MDAwMDAuLjRlMGNlYjM5Yjk1Zjxicj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvZGNlX2NvbW1vbi9jb21tYW5k
X3RhYmxlX2hlbHBlcl9kY2VfY29tbW9uLmg8YnI+DQomZ3Q7IEBAIC0wLDAgKzEsMTQgQEA8YnI+
DQomZ3Q7ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovPGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArI2lmbmRlZiBfX0RBTF9DT01NQU5EX1RBQkxFX0hFTFBFUl9EQ0VfQ09NTU9OX0hf
Xzxicj4NCiZndDsgKyNkZWZpbmUgX19EQUxfQ09NTUFORF9UQUJMRV9IRUxQRVJfRENFX0NPTU1P
Tl9IX188YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICt1aW50OF90IHBoeV9pZF90
b19hdG9tKGVudW0gdHJhbnNtaXR0ZXIgdCk7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArdWludDhf
dCBjbG9ja19zb3VyY2VfaWRfdG9fYXRvbV9waHlfY2xrX3NyY19pZCg8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGVudW0gY2xvY2tfc291cmNlX2lkIGlkKTs8YnI+DQomZ3Q7ICs8
YnI+DQomZ3Q7ICtib29sIGVuZ2luZV9icF90b19hdG9tKGVudW0gZW5naW5lX2lkIGlkLCB1aW50
MzJfdCAqYXRvbV9lbmdpbmVfaWQpOzxicj4NCiZndDsgKzxicj4NCiZndDsgKyNlbmRpZjxicj4N
CiZndDsgLS08YnI+DQomZ3Q7IDIuNDMuMDxicj4NCiZndDs8YnI+DQo8L2Jsb2NrcXVvdGU+PC9k
aXY+DQo=
--0000000000001c224f062eedcd42--
