Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43CCA315DF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 20:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C46B10E74C;
	Tue, 11 Feb 2025 19:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RNZNAer/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B7410E74B;
 Tue, 11 Feb 2025 19:50:29 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fa102a6106so1329585a91.0; 
 Tue, 11 Feb 2025 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739303429; x=1739908229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/syMYk1I/eVV0UELLsqxL3p3z7uv/sPdVpSm0ICMLaI=;
 b=RNZNAer/F5gyYH+AJa3Y6wf4VafSbwZt7838geJuqBY5YBm9SPS64bg6BXXcv+D/cQ
 NaCzj8BRZL0ooMvxCvrj2lj5LWIDl/V86Gh04FvAyuyQuxjjbZ0VHEWlibJM69hBmoQk
 3dsVpCcc7Iwhf9T5iUMpuhKYwbIfaId9vcHU9XkxMREJq2uBVI5KTghWE2Jm8+TWPNFR
 j5nzEpupYZ4Eg5mBs6LVfPxAIv3HM+egWFfhprBiBBAmctgJ/wehZbjP36RRZrU7GrTT
 pb+DCSEk6tncKmbgzZxzZUhlcZ457w//73d8gbiwQP97XGUFHmQZu130ik/Qh1mEVkgC
 /fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739303429; x=1739908229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/syMYk1I/eVV0UELLsqxL3p3z7uv/sPdVpSm0ICMLaI=;
 b=pP+UdNmHpBfKyQktTbVb3Wy6h5XTUCXqVDWyzfegfSLXyvVKfSoPtHlsm/MyMWZJi2
 7YRLQx6J2oALkBm8EKNKzzgVxWvxu8Kzqrr42EAjIDdbR+dkSiv/07nr74c8fM6GCnCz
 OFhpITphEKp9O7QDJ9EfIgyx1cWBPKEs4ioHsjLI+y7xNZhHcEyWB6nzs3GLHReiqUYc
 LS0g/m+98G4QLDk8qXLSE+widcRhKraVkbKG16jZ7aPQ+kU0odDn9WpuhO52yz4rqcIe
 q7YMa202LDqzJLqKMjDnfGNSXneYa0X3kZusGzwI1ktGVSwba2QR0WPjaSuDhY0WIBLD
 tSAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoz0Gov8WqO5P/Y1501kN+riyEzPYvwCNrc0tP2gIgnU34Rr55kXyVNu3gpZHgAsVJx8/yFF18YZZ3@lists.freedesktop.org,
 AJvYcCWPRz7FazVIFHvissm6yFsFA194ghh4HSm6fJbdcisIJzhDLTE5UT5ECRbcvNvJlGBlHIWEuxCS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF2SS71UdPPLGtNbeZGQF30cJtEtkP/NwLgOMGeMFLnFK2E6rA
 vgnjHK+/7UnD/Gl3EtZI+lM3V/k8SBpGI/kRDlxoSPgKmlmh1WmciCvtzHcnhelWyF3PiIt79f9
 vZLfojAL/HfZPaAra8e1dCuJb3N8=
X-Gm-Gg: ASbGncuwTGmerwyfY64wpS0wLMUgYDiDcdi7GywKxTQqE7Cc/8xLUJUqj/Zh6tf91C2
 FlQ4l9kCnOeMUVeFEKDjenY/NSAnbd8M35PvMGpGpFnSSOUpeUVEElPi2+/gc5FUsXE54wt0L
X-Google-Smtp-Source: AGHT+IFdynawvtQRArVltPh1D0vHpp1Q4ArsQhbDq7sEuIaKNt1vkv5BVj3T07haCpcwdB0GK4C61ATWAvQvy8y0SkM=
X-Received: by 2002:a17:90b:2243:b0:2f4:f7f8:f70b with SMTP id
 98e67ed59e1d1-2fbf5c69f4dmr200547a91.5.1739303428766; Tue, 11 Feb 2025
 11:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20250207231219.10807-1-luanicaro@usp.br>
In-Reply-To: <20250207231219.10807-1-luanicaro@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Feb 2025 14:50:17 -0500
X-Gm-Features: AWEUYZny-w0-DEfuGbN1qpN90w7A0sl2FswJ7X9rB3Ft_ISSbPKY0zH8tzpAA0I
Message-ID: <CADnq5_PQ-WiZt2qnbeSnxXWkj1Cf=OLq0pjWcnzm2PE8be34Mg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amd/display/dc: Refactor remove duplications on
 command_table files
To: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
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

On Fri, Feb 7, 2025 at 6:13=E2=80=AFPM Luan Icaro Pinto Arcanjo
<luanicaro@usp.br> wrote:
>
> From: Luan Arcanjo <luanicaro@usp.br>
>
> All dce command_table_helper's shares a copy-pasted collection
> of copy-pasted functions, which are: phy_id_to_atom,
> clock_source_id_to_atom_phy_clk_src_id, and engine_bp_to_atom.
>
> This patch removes the multiple copy-pasted by creating a
> common command table and make the command_table_helper's calls
> the functions implemented by the common instead.
>
> The changes were not tested on actual hardware. I am only able
> to verify that the changes keep the code compileable and do my
> best to to look repeatedly if I am not actually changing any code.
>
> This is the version 2 of the PATCH, fixed comments about
> licence in the new files and the matches From email to
> Signed-off-by email.
>
> Signed-off-by: Luan Icaro Pinto Arcanjo <luanicaro@usp.br>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/Makefile  |   6 +
>  .../bios/dce110/command_table_helper_dce110.c | 104 +----------------
>  .../dce112/command_table_helper2_dce112.c     | 104 +----------------
>  .../bios/dce112/command_table_helper_dce112.c | 104 +----------------
>  .../bios/dce60/command_table_helper_dce60.c   | 106 +----------------
>  .../bios/dce80/command_table_helper_dce80.c   | 106 +----------------
>  .../command_table_helper_dce_common.c         | 110 ++++++++++++++++++
>  .../command_table_helper_dce_common.h         |  14 +++
>  8 files changed, 137 insertions(+), 517 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/comman=
d_table_helper_dce_common.c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/bios/dce_common/comman=
d_table_helper_dce_common.h

Might be easier to just put these into command_table_helper.c rather
than adding a new set of files.  @Wentland, Harry, @Leo (Sunpeng) Li
do you have a preference?  Other than that, looks like a nice clean up
to me.

Alex

>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/Makefile b/drivers/gpu/d=
rm/amd/display/dc/bios/Makefile
> index ed6b5e9763f6..0d2f7ca1d0c2 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/bios/Makefile
> @@ -27,6 +27,7 @@ BIOS =3D bios_parser.o bios_parser_interface.o  bios_pa=
rser_helper.o command_table
>
>  BIOS +=3D command_table2.o command_table_helper2.o bios_parser2.o
>
> +
>  AMD_DAL_BIOS =3D $(addprefix $(AMDDALPATH)/dc/bios/,$(BIOS))
>
>  AMD_DISPLAY_FILES +=3D $(AMD_DAL_BIOS)
> @@ -55,3 +56,8 @@ AMD_DISPLAY_FILES +=3D $(AMDDALPATH)/dc/bios/dce110/com=
mand_table_helper_dce110.o
>  AMD_DISPLAY_FILES +=3D $(AMDDALPATH)/dc/bios/dce112/command_table_helper=
_dce112.o
>
>  AMD_DISPLAY_FILES +=3D $(AMDDALPATH)/dc/bios/dce112/command_table_helper=
2_dce112.o
> +
> +########################################################################=
#######
> +# DCE COMMON
> +########################################################################=
#######
> +AMD_DISPLAY_FILES +=3D $(AMDDALPATH)/dc/bios/dce_common/command_table_he=
lper_dce_common.o
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_hel=
per_dce110.c b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_hel=
per_dce110.c
> index 11bf247bb180..6f8fec224b88 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce=
110.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce110/command_table_helper_dce=
110.c
> @@ -31,38 +31,7 @@
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
> +#include "../dce_common/command_table_helper_dce_common.h"
>
>  static uint8_t signal_type_to_atom_dig_mode(enum signal_type s)
>  {
> @@ -94,32 +63,6 @@ static uint8_t signal_type_to_atom_dig_mode(enum signa=
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
> @@ -207,51 +150,6 @@ static bool clock_source_id_to_atom(
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
> index 755b6e33140a..3392277ac3b6 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dc=
e112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper2_dc=
e112.c
> @@ -31,38 +31,7 @@
>
>  #include "../command_table_helper2.h"
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
> +#include "../dce_common/command_table_helper_dce_common.h"
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
> index 06b4f7fa4a50..39b199b388e4 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce=
112.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce112/command_table_helper_dce=
112.c
> @@ -31,38 +31,7 @@
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
> +#include "../dce_common/command_table_helper_dce_common.h"
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
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_help=
er_dce60.c b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper=
_dce60.c
> index 710221b4f5c5..49b3c6fd648d 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce6=
0.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce60/command_table_helper_dce6=
0.c
> @@ -33,6 +33,8 @@
>
>  #include "../command_table_helper.h"
>
> +#include "../dce_common/command_table_helper_dce_common.h"
> +
>  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action act=
ion)
>  {
>         uint8_t atom_action =3D 0;
> @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_=
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
> @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
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
> @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_i=
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
> index 8b30b558cf1f..f8c66e3a8f08 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce8=
0.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce80/command_table_helper_dce8=
0.c
> @@ -33,6 +33,8 @@
>
>  #include "../command_table_helper.h"
>
> +#include "../dce_common/command_table_helper_dce_common.h"
> +
>  static uint8_t encoder_action_to_atom(enum bp_encoder_control_action act=
ion)
>  {
>         uint8_t atom_action =3D 0;
> @@ -58,51 +60,6 @@ static uint8_t encoder_action_to_atom(enum bp_encoder_=
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
> @@ -149,32 +106,6 @@ static bool clock_source_id_to_atom(
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
> @@ -270,39 +201,6 @@ static uint8_t dig_encoder_sel_to_atom(enum engine_i=
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
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table=
_helper_dce_common.c b/drivers/gpu/drm/amd/display/dc/bios/dce_common/comma=
nd_table_helper_dce_common.c
> new file mode 100644
> index 000000000000..d715a2bb7710
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper=
_dce_common.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include "dm_services.h"
> +#include "atom.h"
> +
> +#include "command_table_helper_dce_common.h"
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
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table=
_helper_dce_common.h b/drivers/gpu/drm/amd/display/dc/bios/dce_common/comma=
nd_table_helper_dce_common.h
> new file mode 100644
> index 000000000000..4e0ceb39b95f
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/dc/bios/dce_common/command_table_helper=
_dce_common.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> +#define __DAL_COMMAND_TABLE_HELPER_DCE_COMMON_H__
> +
> +
> +uint8_t phy_id_to_atom(enum transmitter t);
> +
> +uint8_t clock_source_id_to_atom_phy_clk_src_id(
> +               enum clock_source_id id);
> +
> +bool engine_bp_to_atom(enum engine_id id, uint32_t *atom_engine_id);
> +
> +#endif
> --
> 2.43.0
>
