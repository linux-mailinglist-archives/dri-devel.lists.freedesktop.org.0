Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F67CDDF3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B715310E0AA;
	Wed, 18 Oct 2023 13:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5230D10E0AA;
 Wed, 18 Oct 2023 13:54:53 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1e19cb7829bso4221072fac.1; 
 Wed, 18 Oct 2023 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697637292; x=1698242092; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQtk85yAlUtWvDHsaGA/g7mDe6/47cka+lCUyYH/oYo=;
 b=ORDBNnFhYEUca1qNtUe0nG820gXh+skLRa1waP4f/G29msWkMoHCyM0J2sdMAUZd6X
 0EDt58oSAsKaeMR/BtDbIjdAj5guqrpZN4+iirq4WXobvMpDvp9V1kthzUeYSoG7BFjp
 oFpbBnRvu9EVx9I6ua6TIqhrFf0CbqL6gUN+zF4V4xF3Qui41vv3f+AnGElPiDN6u6Pw
 sCvYI9KV+jBcKxw8FpDz+7hobTfB+4OTEn9Kigt1KBHTkY60QHepiwcxZWUmVvjxQe+9
 M0T5GmMUmuxytTvKY+1Jy685UK4NTkweAnW51Ggu8aD1mFAri/Xkw7DFjlK0C1rSMLqq
 NmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697637292; x=1698242092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQtk85yAlUtWvDHsaGA/g7mDe6/47cka+lCUyYH/oYo=;
 b=CC9YC/5Kgl5oqRrtt7Kc1HJGBS8F19LaaHjzNbRD21x24H9GEgEzovKElB6evYEPl6
 ZYUCds/nG7UpEmGJNwZuQ+od66CxFMiz+1fIwAkYXeuqZNU2tRSoOj3TzeG58ISCR+Lh
 fwzLL+MkutiMbOnDEP6mYu0vLnhtJIkUUyJA3R1YCEWyWhceeOHvgsCeybEoNfXKA3u5
 c0X9bH0T2agNbre9QvPdReUCJEkj6I4zprbqIO9Y1Lj6N/uNw1XeejVr0f38AhaEJVrP
 jzn+iFyeOgLooJwAOJdCGoFaIFYn0jxId/0B9vnEz1ESdBhMz8ieX6uZUtcmdKSa7ME5
 fUOg==
X-Gm-Message-State: AOJu0YxYgHGseEKJOliGRlkYpHZV/lKS8n/WnJpWfLKUWpy8+OQg8uPJ
 51AzqMy6d+jg62mtFqAD19uCzwDiPnv3Y/yOcpc=
X-Google-Smtp-Source: AGHT+IFlaoizvKWMcFlZPTzHVe9b4XIs0EXekcyzuBDq5Az+Rq7X9x4hmvFDljDEuaGPMfkJvfYECf4RXcy3tA5IzIo=
X-Received: by 2002:a05:6870:d60e:b0:1d6:567b:7a93 with SMTP id
 a14-20020a056870d60e00b001d6567b7a93mr5985350oaq.11.1697637292212; Wed, 18
 Oct 2023 06:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230928011351.110093-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230928011351.110093-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Oct 2023 09:54:41 -0400
Message-ID: <CADnq5_Ps0gfiu9iadfKzYiG=N06QznOq=p8aJYibxLmuxJDmDQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Sep 27, 2023 at 9:14=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:261 dcn35_=
update_bw_bounding_box_fpu() warn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c  | 144 +++++++++---------
>  1 file changed, 72 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> index 4d5ee2aad9e4..4f284c31de5d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> @@ -258,85 +258,85 @@ void dcn35_update_bw_bounding_box_fpu(struct dc *dc=
,
>
>         dc_assert_fp_enabled();
>
> -               dcn3_5_ip.max_num_otg =3D
> -                       dc->res_pool->res_cap->num_timing_generator;
> -               dcn3_5_ip.max_num_dpp =3D dc->res_pool->pipe_count;
> -               dcn3_5_soc.num_chans =3D bw_params->num_channels;
> -
> -               ASSERT(clk_table->num_entries);
> -
> -               /* Prepass to find max clocks independent of voltage leve=
l. */
> -               for (i =3D 0; i < clk_table->num_entries; ++i) {
> -                       if (clk_table->entries[i].dispclk_mhz > max_dispc=
lk_mhz)
> -                               max_dispclk_mhz =3D clk_table->entries[i]=
.dispclk_mhz;
> -                       if (clk_table->entries[i].dppclk_mhz > max_dppclk=
_mhz)
> -                               max_dppclk_mhz =3D clk_table->entries[i].=
dppclk_mhz;
> -               }
> +       dcn3_5_ip.max_num_otg =3D
> +               dc->res_pool->res_cap->num_timing_generator;
> +       dcn3_5_ip.max_num_dpp =3D dc->res_pool->pipe_count;
> +       dcn3_5_soc.num_chans =3D bw_params->num_channels;
> +
> +       ASSERT(clk_table->num_entries);
> +
> +       /* Prepass to find max clocks independent of voltage level. */
> +       for (i =3D 0; i < clk_table->num_entries; ++i) {
> +               if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
> +                       max_dispclk_mhz =3D clk_table->entries[i].dispclk=
_mhz;
> +               if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
> +                       max_dppclk_mhz =3D clk_table->entries[i].dppclk_m=
hz;
> +       }
>
> -               for (i =3D 0; i < clk_table->num_entries; i++) {
> -                       /* loop backwards*/
> -                       for (closest_clk_lvl =3D 0, j =3D dcn3_5_soc.num_=
states - 1;
> -                            j >=3D 0; j--) {
> -                               if (dcn3_5_soc.clock_limits[j].dcfclk_mhz=
 <=3D
> -                                   clk_table->entries[i].dcfclk_mhz) {
> -                                       closest_clk_lvl =3D j;
> -                                       break;
> -                               }
> -                       }
> -                       if (clk_table->num_entries =3D=3D 1) {
> -                               /*smu gives one DPM level, let's take the=
 highest one*/
> -                               closest_clk_lvl =3D dcn3_5_soc.num_states=
 - 1;
> +       for (i =3D 0; i < clk_table->num_entries; i++) {
> +               /* loop backwards*/
> +               for (closest_clk_lvl =3D 0, j =3D dcn3_5_soc.num_states -=
 1;
> +                       j >=3D 0; j--) {
> +                       if (dcn3_5_soc.clock_limits[j].dcfclk_mhz <=3D
> +                               clk_table->entries[i].dcfclk_mhz) {
> +                               closest_clk_lvl =3D j;
> +                               break;
>                         }
> +               }
> +               if (clk_table->num_entries =3D=3D 1) {
> +                       /*smu gives one DPM level, let's take the highest=
 one*/
> +                       closest_clk_lvl =3D dcn3_5_soc.num_states - 1;
> +               }
>
> -                       clock_limits[i].state =3D i;
> -
> -                       /* Clocks dependent on voltage level. */
> -                       clock_limits[i].dcfclk_mhz =3D clk_table->entries=
[i].dcfclk_mhz;
> -                       if (clk_table->num_entries =3D=3D 1 &&
> -                           clock_limits[i].dcfclk_mhz <
> -                           dcn3_5_soc.clock_limits[closest_clk_lvl].dcfc=
lk_mhz) {
> -                               /*SMU fix not released yet*/
> -                               clock_limits[i].dcfclk_mhz =3D
> -                                       dcn3_5_soc.clock_limits[closest_c=
lk_lvl].dcfclk_mhz;
> -                       }
> +               clock_limits[i].state =3D i;
>
> -                       clock_limits[i].fabricclk_mhz =3D
> -                               clk_table->entries[i].fclk_mhz;
> -                       clock_limits[i].socclk_mhz =3D
> -                               clk_table->entries[i].socclk_mhz;
> -
> -                       if (clk_table->entries[i].memclk_mhz &&
> -                           clk_table->entries[i].wck_ratio)
> -                               clock_limits[i].dram_speed_mts =3D
> -                                       clk_table->entries[i].memclk_mhz =
* 2 *
> -                                       clk_table->entries[i].wck_ratio;
> -
> -                       /* Clocks independent of voltage level. */
> -                       clock_limits[i].dispclk_mhz =3D max_dispclk_mhz ?
> -                               max_dispclk_mhz :
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dispclk_mhz;
> -
> -                       clock_limits[i].dppclk_mhz =3D max_dppclk_mhz ?
> -                               max_dppclk_mhz :
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dppclk_mhz;
> -
> -                       clock_limits[i].dram_bw_per_chan_gbps =3D
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dram_bw_per_chan_gbps;
> -                       clock_limits[i].dscclk_mhz =3D
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dscclk_mhz;
> -                       clock_limits[i].dtbclk_mhz =3D
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dtbclk_mhz;
> -                       clock_limits[i].phyclk_d18_mhz =3D
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
phyclk_d18_mhz;
> -                       clock_limits[i].phyclk_mhz =3D
> -                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
phyclk_mhz;
> +               /* Clocks dependent on voltage level. */
> +               clock_limits[i].dcfclk_mhz =3D clk_table->entries[i].dcfc=
lk_mhz;
> +               if (clk_table->num_entries =3D=3D 1 &&
> +                       clock_limits[i].dcfclk_mhz <
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dcfclk_m=
hz) {
> +                       /*SMU fix not released yet*/
> +                       clock_limits[i].dcfclk_mhz =3D
> +                               dcn3_5_soc.clock_limits[closest_clk_lvl].=
dcfclk_mhz;
>                 }
>
> -               memcpy(dcn3_5_soc.clock_limits, clock_limits,
> -                      sizeof(dcn3_5_soc.clock_limits));
> +               clock_limits[i].fabricclk_mhz =3D
> +                       clk_table->entries[i].fclk_mhz;
> +               clock_limits[i].socclk_mhz =3D
> +                       clk_table->entries[i].socclk_mhz;
> +
> +               if (clk_table->entries[i].memclk_mhz &&
> +                       clk_table->entries[i].wck_ratio)
> +                       clock_limits[i].dram_speed_mts =3D
> +                               clk_table->entries[i].memclk_mhz * 2 *
> +                               clk_table->entries[i].wck_ratio;
> +
> +               /* Clocks independent of voltage level. */
> +               clock_limits[i].dispclk_mhz =3D max_dispclk_mhz ?
> +                       max_dispclk_mhz :
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dispclk_=
mhz;
> +
> +               clock_limits[i].dppclk_mhz =3D max_dppclk_mhz ?
> +                       max_dppclk_mhz :
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dppclk_m=
hz;
> +
> +               clock_limits[i].dram_bw_per_chan_gbps =3D
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dram_bw_=
per_chan_gbps;
> +               clock_limits[i].dscclk_mhz =3D
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dscclk_m=
hz;
> +               clock_limits[i].dtbclk_mhz =3D
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].dtbclk_m=
hz;
> +               clock_limits[i].phyclk_d18_mhz =3D
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].phyclk_d=
18_mhz;
> +               clock_limits[i].phyclk_mhz =3D
> +                       dcn3_5_soc.clock_limits[closest_clk_lvl].phyclk_m=
hz;
> +       }
> +
> +       memcpy(dcn3_5_soc.clock_limits, clock_limits,
> +               sizeof(dcn3_5_soc.clock_limits));
>
> -               if (clk_table->num_entries)
> -                       dcn3_5_soc.num_states =3D clk_table->num_entries;
> +       if (clk_table->num_entries)
> +               dcn3_5_soc.num_states =3D clk_table->num_entries;
>
>         if (max_dispclk_mhz) {
>                 dcn3_5_soc.dispclk_dppclk_vco_speed_mhz =3D max_dispclk_m=
hz * 2;
> --
> 2.20.1.7.g153144c
>
