Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1438B2F95A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8D10E30A;
	Thu, 21 Aug 2025 13:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDX7CvXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62FE10E30A;
 Thu, 21 Aug 2025 13:06:30 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-246180dc32cso726325ad.0; 
 Thu, 21 Aug 2025 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755781590; x=1756386390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OM6SpT0/gnQYnwU5iSjmdel1xmnPwazN3x1N0OoMlCg=;
 b=gDX7CvXGVeLXJyp93YzYc8q4aDtuERheOx67ePxoYyIPaw/nwsniUaXXXdIPwgJEmE
 Txnd6M6VuFKT/8alTmnejlur/hgXdQ+kHLNpCNOC2iOLQ69UVc9OqnF5CF01PonRgUg3
 F5gTiv5q0DCR4yC8hKpyD9TbU2Obm8PxYCD4WZFXID1pfqJSFLUWrqk6nA8ZzFWTcNiY
 IsKFzDjLPZVv29lPpXVekHTw1uiLtaMMYIDL/aiUtKlc0pT/QFSwv6DVCdx/GuZhiF5O
 RUmBsfqyW+GsNmNQtcF6pN8NlqXJfXnVtyeFYjH7hHjnO5M+a0iNMOwW/Ws5kH7vEDAL
 tEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755781590; x=1756386390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OM6SpT0/gnQYnwU5iSjmdel1xmnPwazN3x1N0OoMlCg=;
 b=WXDHTK2wMq27Uz9EfLh9BgQKdiBd1QKAuSnxIpPjM8ioAjTW3JAI5o6JebJTt8x7fE
 k6byEWIa3uc1vJDquxkzbUjHfgNL9dVTY8uy3TGQRD5FoYxaGGyF6WjVxdE8TsYOeW9W
 N+kDhCsBmD4yVgXLugqnD54jP/cr6U7IMgfcj20w+9wamNSwT1XRnTwxtZTkpXBoA9lV
 kE2Fe5QYs16R0jM0sgSsTdd/L8G4Fjd6xIqaliIUilEmAYIsiFmtHZerokpSXLtlPXFX
 CFir3c4UKXiNMMGksgvFzF4+558bUMQz6hsm3/vHE1byPttNIXwILX8BBI1khjYnMfBI
 bs4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv1LjWbAu3DhR2ugx77VOVw3havz52UuArxJz14mojnYm+NuE+ZdChWcHdtDi2F5EHbgE/kjrQeG4=@lists.freedesktop.org,
 AJvYcCXdjJ0L95ppzMBD1hKbrf1oOUhCORW/Sl3HyALqv5EpiIChyzjBEgPMBYIfn75KqJkAMGeC5x6koQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxceFAjFrrwegTOgsbo80P2Q8Wjhr+es4uf/accsc0HgUF598RI
 A/dKRktvOJhvVqonG2wKdyqPUXQ+kO11E/TZZYIz0uwLKzxh6fJLK6PZvXeWRe3KfLlOv46Q9/1
 SxhWHXvVJ4b71wjyfXrwx9qAH4OrG1Zlxdw==
X-Gm-Gg: ASbGncuCVs+8F9wV4/efKLlHCRZUT0WPKpWwp/548YEyR2rpCe1DDX0edtN7opRLJf9
 szmCRmkBkpDNwp70uLiFXJlJXiuigEyYLbxlWEEjTgFgO+ytzQZ0lhPBH0zOpXm/EFu3/1vRE2C
 Hep6xPq6tLPLWdb/IsBelNjBQ1f6qidH6l5xwU7wCQ1m3/Hz83uxDtbp/DA+1PDzOaF/wwT3l+w
 Fi3RwVnZZgLm0hnYQ==
X-Google-Smtp-Source: AGHT+IGc6/ykMRwb49kABw0pqkOxIhwmzEYtnWiq1x3iNoBSdt1kgXjbO7DU+I64t41kztwALsz+aP1dp4wqP9/xXTQ=
X-Received: by 2002:a17:903:2f85:b0:22e:62c3:8c5d with SMTP id
 d9443c01a7336-245ff8de159mr16700055ad.8.1755781590074; Thu, 21 Aug 2025
 06:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250821120133.6174-1-listout@listout.xyz>
In-Reply-To: <20250821120133.6174-1-listout@listout.xyz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:06:17 -0400
X-Gm-Features: Ac12FXzviakgIpuyoJeeDQpgiwmzbyZQeghEfJyYh-hsdAlv40CSm5wH_kZ6dxM
Message-ID: <CADnq5_PqxSm1C8rwORNCXM_O2tQrBHaMDe_a-QN0ScgJ4ERm8w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: clean-up dead code in
 dml2_mall_phantom
To: Brahmajit Das <listout@listout.xyz>
Cc: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Lyude Paul <lyude@redhat.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

On Thu, Aug 21, 2025 at 8:01=E2=80=AFAM Brahmajit Das <listout@listout.xyz>=
 wrote:
>
> pipe_idx in funtion dml2_svp_validate_static_schedulabilit, although set
> is never actually used. While building with GCC 16 this gives a warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.c: In fun=
ction =E2=80=98set_phantom_stream_timing=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml2_mall_phantom.c:657:25:=
 warning: variable =E2=80=98pipe_idx=E2=80=99 set but not used [-Wunused-bu=
t-set-variable=3D]
>   657 |         unsigned int i, pipe_idx;
>       |                         ^~~~~~~~
>
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
> v1 -> v2: leaving declaration above
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/dr=
ivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> index a56e75cdf712..c59f825cfae9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
> @@ -654,14 +654,14 @@ static void set_phantom_stream_timing(struct dml2_c=
ontext *ctx, struct dc_state
>                                      unsigned int svp_height,
>                                      unsigned int svp_vstartup)
>  {
> -       unsigned int i, pipe_idx;
> +       unsigned int i;
>         double line_time, fp_and_sync_width_time;
>         struct pipe_ctx *pipe;
>         uint32_t phantom_vactive, phantom_bp, pstate_width_fw_delay_lines=
;
>         static const double cvt_rb_vblank_max =3D ((double) 460 / (1000 *=
 1000));
>
>         // Find DML pipe index (pipe_idx) using dc_pipe_idx
> -       for (i =3D 0, pipe_idx =3D 0; i < ctx->config.dcn_pipe_count; i++=
) {
> +       for (i =3D 0; i < ctx->config.dcn_pipe_count; i++) {
>                 pipe =3D &state->res_ctx.pipe_ctx[i];
>
>                 if (!pipe->stream)
> @@ -669,8 +669,6 @@ static void set_phantom_stream_timing(struct dml2_con=
text *ctx, struct dc_state
>
>                 if (i =3D=3D dc_pipe_idx)
>                         break;
> -
> -               pipe_idx++;
>         }
>
>         // Calculate lines required for pstate allow width and FW process=
ing delays
> --
> 2.51.0
>
