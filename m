Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214EFABC13D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 16:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520F010E232;
	Mon, 19 May 2025 14:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KopvAeDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0325310E12A;
 Mon, 19 May 2025 14:46:41 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-23179999d4aso4606025ad.1; 
 Mon, 19 May 2025 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747666001; x=1748270801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kADBuowxof65udqYDbFHGBx7vhRtqalFqgiYXXItF9w=;
 b=KopvAeDbn9LiaxKfN30xtrDelgcuMrnjjM8WI/+moxlNcLq2J5M6kArHXgc1R+GzKx
 /IgxepTE/wGoZ+V4qriULOCTFOv79nUGak43H3BlnJaJK8pD36XG2IvqIdaRrIsmi9om
 YnowMo+3O/dbGd1IvS+PF/8UI5TlOvJKklpfuKLMjuyrGCnGWnVT2Wh32ujOYyhK/sQh
 kK01HpSknq74B75UaxKCj2TX7TFt7vjFT4d1q06DoKx1qnsxY3qtiO917h61/jBUzAlH
 OxE4f+YFcl/ftD+CeeDJ/fut0WEuKdFUck8B9X5HvAI6JyMgYc6gmpgBXf241uRoOX3T
 fvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747666001; x=1748270801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kADBuowxof65udqYDbFHGBx7vhRtqalFqgiYXXItF9w=;
 b=KTpHVRfJxe5c2BjB/aqGvBEVcWyEbGfrWrgOUqorFLz2iZJxfWFYW77Gdxexk2+YNw
 r9cx9QaqlRtGZpeHBoFjCkbqVjprCWaGhNUizcjx8O1vCMG21aoCjWgFspSk8Chv0B0s
 6qJA9TUVqaYIkLamnJZ9d2LT92Yl5xl7OYJNtmHpta+aCJjzWQd+NpvYoJjXkgff7Bhq
 5JQP0ellq1Eq7xVZ2RT5JMF0jwiHizQTaTpIjTelT/mjHjq6ERCBM62KuZ5LK9C+L4ZX
 o3MsBCO6SieSp/V8r5xiCf9lJbAFp0pPeVVtv95A55cxV34e9nbQhJ7sl4CTAE6AkKzC
 iyQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT6lAbN3gcnmf6PNyOfExKeSBP9aYtFdtXVxS9GtAbel8m4Opejm0/8C5ViEHYVfT1Gek9hLgt@lists.freedesktop.org,
 AJvYcCXgM261ACWTfFVw34px9tdXxpoX+wSHLZ1m+F2v95GyVtb12t/6aTZ5DC67mMEFpQSdkQdjHulVYbfo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwahQhGTESM5x+zik6pNn9AHwZ+xKWTT6YL9kYMhkFZU83zzi8I
 XuVnSGCZ5H+gNcpLhH5UY6pg1/PhpmHckijkb3VEstM/E7/s7JwtNF8mqwjmFCxb5R9cKn7+1Bq
 3Oq6LU1FW1QEbeWRUZkQABg0iBMOoIks=
X-Gm-Gg: ASbGncuwn8mB999MjmjdoNBlBTwGWwFMVpf71s0Nb8cRKFWGA+m3GlgEW0sl6c8btEV
 qrBAKNjhn2HyoM0VvVehFfcIR3WUYLxgYP+pjF/UJf15YpcOQen9nqAJr9nWtB2J+HeQBwv5Tn+
 IhSdLm3lSU4c6xFfk5pD33KdNEJCLBEuGKpA==
X-Google-Smtp-Source: AGHT+IGxUyLpuIzuYI9yQN7+ja/Sm14SmFPcRyk8rO/gYDn+dKFkO1xwmMC+JwJVaVoj6ptwii1tfKmvJd5SMChDWjw=
X-Received: by 2002:a17:902:d54c:b0:224:10a2:cad1 with SMTP id
 d9443c01a7336-231d45168bcmr73303035ad.10.1747666000574; Mon, 19 May 2025
 07:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250516233516.29480-1-daniilryabov4@gmail.com>
In-Reply-To: <20250516233516.29480-1-daniilryabov4@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:46:29 -0400
X-Gm-Features: AX0GCFsQQ8F-uOPfM0f66pMmiUGhGWImNrxgkYRyjyQpnzmvoHwfqxmPEhSQLO8
Message-ID: <CADnq5_MObnUtQ+VC+qc1fmdKZ8=XVWRRm5rS88-BmpYTtLZfOg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix typo in comments
To: Daniil Ryabov <daniilryabov4@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, May 17, 2025 at 8:38=E2=80=AFAM Daniil Ryabov <daniilryabov4@gmail.=
com> wrote:
>
> Fix double 'u' in 'frequuency'
>
> Signed-off-by: Daniil Ryabov <daniilryabov4@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/=
gpu/drm/amd/display/dc/basics/dce_calcs.c
> index 681799468..d897f8a30 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
> @@ -1393,7 +1393,7 @@ static void calculate_bandwidth(
>                                                 if ((bw_mtn(data->dram_sp=
eed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_ma=
rgin, bw_int_to_fixed(9999)))) {
>                                                         /*determine the m=
inimum dram clock change margin for each set of clock frequencies*/
>                                                         data->min_dram_sp=
eed_change_margin[i][j] =3D bw_min2(data->min_dram_speed_change_margin[i][j=
], data->dram_speed_change_margin);
> -                                                       /*compute the max=
imum clock frequuency required for the dram clock change at each set of clo=
ck frequencies*/
> +                                                       /*compute the max=
imum clock frequency required for the dram clock change at each set of cloc=
k frequencies*/
>                                                         data->dispclk_req=
uired_for_dram_speed_change_pipe[i][j] =3D bw_max2(bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_fac=
tor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(data->maxi=
mum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency), data->=
dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer_time[k=
][i][j]))), bw_div(bw_div(bw_mul(data->src_pixels_for_last_output_pixel[k],=
 dceip->display_pipe_throughput_factor), dceip->lb_write_pixels_per_dispclk=
), (bw_add(bw_sub(bw_sub(bw_sub(data->maximum_latency_hiding_with_cursor[k]=
, vbios->nbp_state_change_latency), data->dmif_burst_time[i][j]), data->dra=
m_speed_change_line_source_transfer_time[k][i][j]), data->active_time[k])))=
);
>                                                         if ((bw_ltn(data-=
>dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max=
_dispclk))) {
>                                                                 data->dis=
play_pstate_change_enable[k] =3D 1;
> @@ -1407,7 +1407,7 @@ static void calculate_bandwidth(
>                                                 if ((bw_mtn(data->dram_sp=
eed_change_margin, bw_int_to_fixed(0)) && bw_ltn(data->dram_speed_change_ma=
rgin, bw_int_to_fixed(9999)))) {
>                                                         /*determine the m=
inimum dram clock change margin for each display pipe*/
>                                                         data->min_dram_sp=
eed_change_margin[i][j] =3D bw_min2(data->min_dram_speed_change_margin[i][j=
], data->dram_speed_change_margin);
> -                                                       /*compute the max=
imum clock frequuency required for the dram clock change at each set of clo=
ck frequencies*/
> +                                                       /*compute the max=
imum clock frequency required for the dram clock change at each set of cloc=
k frequencies*/
>                                                         data->dispclk_req=
uired_for_dram_speed_change_pipe[i][j] =3D bw_max2(bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_first_output_pixel[k], dceip->display_pipe_throughput_fac=
tor), dceip->lb_write_pixels_per_dispclk), (bw_sub(bw_sub(bw_sub(bw_sub(dat=
a->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_latency),=
 data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_transfer=
_time[k][i][j]), data->mcifwr_burst_time[i][j]))), bw_div(bw_div(bw_mul(dat=
a->src_pixels_for_last_output_pixel[k], dceip->display_pipe_throughput_fact=
or), dceip->lb_write_pixels_per_dispclk), (bw_add(bw_sub(bw_sub(bw_sub(bw_s=
ub(data->maximum_latency_hiding_with_cursor[k], vbios->nbp_state_change_lat=
ency), data->dmif_burst_time[i][j]), data->dram_speed_change_line_source_tr=
ansfer_time[k][i][j]), data->mcifwr_burst_time[i][j]), data->active_time[k]=
))));
>                                                         if ((bw_ltn(data-=
>dispclk_required_for_dram_speed_change_pipe[i][j], vbios->high_voltage_max=
_dispclk))) {
>                                                                 data->dis=
play_pstate_change_enable[k] =3D 1;
> --
> 2.43.0
>
