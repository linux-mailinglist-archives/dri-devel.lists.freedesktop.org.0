Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94608FD0F0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 16:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36C10E277;
	Wed,  5 Jun 2024 14:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ekVjC97W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5DD10E277;
 Wed,  5 Jun 2024 14:36:06 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6ff6fe215c6so20052b3a.3; 
 Wed, 05 Jun 2024 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717598166; x=1718202966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq1yy0Su5P7QN87mXYg9WXuNVfybQpz6GBQGEruYcrI=;
 b=ekVjC97WW76E5V23/n4hlhwiKdrtNoJdvTnuh5OthQdNiTC2T0qeli0I7x6FgJ7mX+
 dq+elL1cxPLuvc8JJX6dPm4rhBushDU90j7Iv+ZCi0TG+D4Wl4ln3Owo1zaQ08ttJ+3I
 gl/Ry4+ZjOc9YvoHqqpky8PtdRWYXVLqxL+bPtN/+w3AjfpaCRWicsWkOIU7h5vXL41J
 K2+fJZoYXXL3oL0LJq0+WEf53Id+3Tg0YKTKi8X6EVwmKt6cRHKtuz9M7LuZ2O4pkVtU
 PwuMUajqvgzB197J7v+N8fEL5DgQQqzIs9ELhRCjtYxr+Mz2OoTI+/3VjD7WYyi5cY5l
 NmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717598166; x=1718202966;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yq1yy0Su5P7QN87mXYg9WXuNVfybQpz6GBQGEruYcrI=;
 b=rxvMQQ3qhHkQpVZqr0Ujks9bI8wAQOxG6DiI058QibXbU793Lo/JTFSQtF9DpJlH8z
 P7r0xrxMHYo5+l/kz5+OR9QGHrvxTHZF1HNzxquCrR/SZPgHHM1gK07SzeoluACxshwL
 g+dmZZkW42stiJvWE4iB5T/5awVGEnuI5qK4fsgxIE+RBShjaAWSdit+fHv7hIcq8tYZ
 jjOuYIsi+Sb/e5KYHWg7l7Cr3aC8PCh+3z3FFqKiohV8otWnjqcPArg3M7dhV9zKEzrP
 028CvfZ44O0ZX17gj083lSoeJR0FkaHFm1HNN38PX/O2RCG2MVmHDqv0s+QBszWO2F6e
 77AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVThxbAD5bmU2IsSV1wFX3fbGdcBs4T2QJi1uO2sJ6xo3bG0rgQLAn/rdIfahO7mxvAht4pG63wIVy81xqxJ8GcOCwGHD7Vo2lGuwbAcz+i8IBXAD7P4tJkbmUsOz8Gh4As6zFlSfDyQe1QJKy9pg==
X-Gm-Message-State: AOJu0Yy5XJ5q1xzJc8XIOYejDxAuJPVEuplidejKFS0cZ45YVfszL8YJ
 cwSR1D/l6NhbsFAmnxReJWw486YVkwARM16H+k8l3SfBPaiKcexjvDoKnWivStmI1Czvc9BiL0B
 JCegt5Y3vghfB/w+epOdi0psuRiQ=
X-Google-Smtp-Source: AGHT+IHzMIhmIExlPP2dOJMwUeHRzAG3Zqtu8CJwxbDQujyXLFtz5Pdob5xgc4REV0gHk7os55wc3YNBoweEki0mI8g=
X-Received: by 2002:a05:6a20:918d:b0:1b0:111f:2b7f with SMTP id
 adf61e73a8af0-1b2b75a2cc8mr3145079637.39.1717598165835; Wed, 05 Jun 2024
 07:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240604103736.3068-1-thorsten.blum@toblux.com>
In-Reply-To: <20240604103736.3068-1-thorsten.blum@toblux.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 5 Jun 2024 10:35:51 -0400
Message-ID: <CADnq5_OtyaYJAcMpd6hmo4jShFq+1NjDHW5_TEcQB+Hf3yxaqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify if conditions
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 daniel@ffwll.ch, Qingqing.Zhuo@amd.com, roman.li@amd.com, hersenxs.wu@amd.com, 
 chaitanya.dhere@amd.com, wenjing.liu@amd.com, alex.hung@amd.com, 
 sungkim@amd.com, syed.hassan@amd.com, syedsaaem.rizvi@amd.com, 
 dillon.varone@amd.com, charlene.liu@amd.com, hamza.mahfooz@amd.com, 
 nicholas.kazlauskas@amd.com, jerry.zuo@amd.com, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Tue, Jun 4, 2024 at 9:07=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux.=
com> wrote:
>
> The if conditions !A || A && B can be simplified to !A || B.
>
> Fixes the following Coccinelle/coccicheck warnings reported by
> excluded_middle.cocci:
>
>         WARNING !A || A && B is equivalent to !A || B
>         WARNING !A || A && B is equivalent to !A || B
>         WARNING !A || A && B is equivalent to !A || B
>
> Compile-tested only.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c | 6 +++---
>  .../gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c =
b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> index ad2a6b4769fe..940081df6dc0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
> @@ -68,7 +68,7 @@ static bool get_plane_id(struct dml2_context *dml2, con=
st struct dc_state *state
>                 if (state->streams[i]->stream_id =3D=3D stream_id) {
>                         for (j =3D 0; j < state->stream_status[i].plane_c=
ount; j++) {
>                                 if (state->stream_status[i].plane_states[=
j] =3D=3D plane &&
> -                                       (!is_plane_duplicate || (is_plane=
_duplicate && (j =3D=3D plane_index)))) {
> +                                       (!is_plane_duplicate || (j =3D=3D=
 plane_index))) {
>                                         *plane_id =3D (i << 16) | j;
>                                         return true;
>                                 }
> @@ -707,8 +707,8 @@ static void free_unused_pipes_for_plane(struct dml2_c=
ontext *ctx, struct dc_stat
>         for (i =3D 0; i < ctx->config.dcn_pipe_count; i++) {
>                 if (state->res_ctx.pipe_ctx[i].plane_state =3D=3D plane &=
&
>                         state->res_ctx.pipe_ctx[i].stream->stream_id =3D=
=3D stream_id &&
> -                       (!is_plane_duplicate || (is_plane_duplicate &&
> -                       ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_=
idx_to_plane_index[state->res_ctx.pipe_ctx[i].pipe_idx] =3D=3D plane_index)=
) &&
> +                       (!is_plane_duplicate ||
> +                       ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_=
idx_to_plane_index[state->res_ctx.pipe_ctx[i].pipe_idx] =3D=3D plane_index)=
 &&
>                         !is_pipe_used(pool, state->res_ctx.pipe_ctx[i].pi=
pe_idx)) {
>                         free_pipe(&state->res_ctx.pipe_ctx[i]);
>                 }
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.=
c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> index a41812598ce8..b2bbf7988f92 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
> @@ -979,7 +979,7 @@ static bool get_plane_id(struct dml2_context *dml2, c=
onst struct dc_state *conte
>                 if (context->streams[i]->stream_id =3D=3D stream_id) {
>                         for (j =3D 0; j < context->stream_status[i].plane=
_count; j++) {
>                                 if (context->stream_status[i].plane_state=
s[j] =3D=3D plane &&
> -                                       (!is_plane_duplicate || (is_plane=
_duplicate && (j =3D=3D plane_index)))) {
> +                                       (!is_plane_duplicate || (j =3D=3D=
 plane_index))) {
>                                         *plane_id =3D (i << 16) | j;
>                                         return true;
>                                 }
> --
> 2.39.2
>
