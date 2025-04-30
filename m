Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D76AA4ECD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B6710E321;
	Wed, 30 Apr 2025 14:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dAyfhsMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604010E31B;
 Wed, 30 Apr 2025 14:38:06 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-227c7e4d5feso13965795ad.2; 
 Wed, 30 Apr 2025 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746023884; x=1746628684; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uV0kZwBjrEQ3YIXZWXClBp3jOHBTKZYyjqB1LupBdOc=;
 b=dAyfhsMKBtLv/FMAKmycpf4lkLVn1SYH+Fh0WE+83Ak5A/qkzcsGIahU+t9VuN+O8/
 BoPqrMc+JM7OEcNd7qJHIJ2yofuu030nBQQGrybE7DWOGyhopdF2B6U2wCCSAyFh6/QM
 Z2O4AkESx5P4Kps0vbaTYoWxN75t+dUTrp3YCPv6siqS2GbAv6OIDLrZaZJfCNto0Nje
 CsxMzD29tc8s6RODMQ5Er6InNujsYZKbGLQHYjKwh+0P+AD222b87+EIAi8D9OLEp/vX
 KUn+k5/P47kgw6s3/4sb/7rcE/815Qed3ulhw3JebVvcNXTi4WNPW7GMKt2NrYDwMgVv
 Tnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746023884; x=1746628684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uV0kZwBjrEQ3YIXZWXClBp3jOHBTKZYyjqB1LupBdOc=;
 b=DV+Uf1UBwNmoalFqSktkFQuutMlHKUeBVv1/dqJNnZaLZdoUxSpMD0MqstO0y4si+N
 dVIS3yuF1C+xs8JvpYhqGs9oLRZorEcyTfeMNsFgz963M+jcXGLX4pB08WCA7r8hEc9Y
 FIMAdzS+um7n+V3SNM9vYejy8aMGd7n2jQYRmv83Nvtq2FGSYx0u4PabEC5p/D2pYMts
 txsxEnWoddpy255A/2zXtSKJG/uhV/Tm6qiyfsGegQSCLgUuKF+j4vUnIuNrbxgvJ9e/
 fVnBVtYACSqo+Hy6U7JRgjbMSwTF/Ju48ot8FjPiE9NYnfMA1R3UzKE+umDhly7Y68tr
 mrcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyvwfNEyG/euR12druosogXfJIu/5mrv9IEvAyqVZ5xWX+kY1nzicws89rqanXAOosg7NaKpFw@lists.freedesktop.org,
 AJvYcCXusVTMCYw7lCxG8CTg6mJ3pAoku+7RDQW/+jF3nETM7ZtPng/0NmcnI3OaVuhqcXL4XN22XY0dwBtS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywleakpgdz5TfNV3zOy1E+SKPfRswKP0MsItwif7j+cFuj+uhCb
 hXaRr2WrV2linW+Dl9Hayfi4JPyM6pY/QAH5+nETjLEhd9S5qqfMP1INBN62Txmy9mBVpAghetW
 77TFiDBmyPGbu8JfqAw9/GTi4IXs=
X-Gm-Gg: ASbGncsvSXKty21D+/SPFNjMzscpftZHLVQttrcMd0pkXSx3GmnadIKYSucYTWXhKAe
 aS+HiEnAS0nX3PbgLi931SXztbzrzRzbmlZNPhjfsp/DSlFiyynuRRDtiC6pEFyfwYQ4Z4gy9US
 hFkRFmg+HOaDZv9ZwZsaLSng==
X-Google-Smtp-Source: AGHT+IG8aDS8psTDpLj6/NSR5qEW0GGALh9v8G3ckyKzO0+KPpcxASGQudtB+CaHObyJUNVe2T1fRp/+xpMEjyZ2dpo=
X-Received: by 2002:a17:903:19ef:b0:223:28a8:610b with SMTP id
 d9443c01a7336-22e00f677demr3252645ad.14.1746023883863; Wed, 30 Apr 2025
 07:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250430000835.34139-1-fernando.cruz.ctt@gmail.com>
In-Reply-To: <20250430000835.34139-1-fernando.cruz.ctt@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Apr 2025 10:37:52 -0400
X-Gm-Features: ATxdqUGgWs6OKEU7KrpG9Xb4ZkIsdtI2vCcSt4tNGmV3eA3-DgKOEhl8VINfQso
Message-ID: <CADnq5_OrVtVXCoDxZU8ngFpDywFj3c6Wx-MOt2DJUdiU3SKp2w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Rename program_timing function for
 better debugging
To: Antonio Fernando Silva e Cruz Filho <fernando.cruz.ctt@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 andrenogueiraribeiro@usp.br, 
 =?UTF-8?Q?Andr=C3=A9_Nogueira_Ribeiro?= <r.andrenogueira@gmail.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Apr 30, 2025 at 3:44=E2=80=AFAM Antonio Fernando Silva e Cruz Filho
<fernando.cruz.ctt@gmail.com> wrote:
>
> [WHY]
> Improve the output when using the ftrace debug feature,
> making it easier to identify which function is currently being executed.
>
> [HOW]
> Rename the program_timing function to a name that
> includes the path to the function's file.
>
> Signed-off-by: Antonio Fernando Silva e Cruz Filho <fernando.cruz.ctt@gma=
il.com>
> Co-developed-by: Andr=C3=A9 Nogueira Ribeiro <r.andrenogueira@gmail.com>
> Signed-off-by: Andr=C3=A9 Nogueira Ribeiro <r.andrenogueira@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.=
c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
> index 003a9330c..88e7a1fc9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
> @@ -105,7 +105,7 @@ static void program_pix_dur(struct timing_generator *=
tg, uint32_t pix_clk_100hz)
>         dm_write_reg(tg->ctx, addr, value);
>  }
>
> -static void program_timing(struct timing_generator *tg,
> +static void dce80_timing_generator_program_timing(struct timing_generato=
r *tg,
>         const struct dc_crtc_timing *timing,
>         int vready_offset,
>         int vstartup_start,
> @@ -185,7 +185,7 @@ static void dce80_timing_generator_enable_advanced_re=
quest(
>
>  static const struct timing_generator_funcs dce80_tg_funcs =3D {
>                 .validate_timing =3D dce110_tg_validate_timing,
> -               .program_timing =3D program_timing,
> +               .program_timing =3D dce80_timing_generator_program_timing=
,
>                 .enable_crtc =3D dce110_timing_generator_enable_crtc,
>                 .disable_crtc =3D dce110_timing_generator_disable_crtc,
>                 .is_counter_moving =3D dce110_timing_generator_is_counter=
_moving,
> --
> 2.43.0
>
