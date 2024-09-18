Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69A97BD97
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 16:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2F910E240;
	Wed, 18 Sep 2024 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HeRz19Vh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97510E240;
 Wed, 18 Sep 2024 14:03:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7191f1875d3so703109b3a.0; 
 Wed, 18 Sep 2024 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726668215; x=1727273015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWbJgztcoceFfFThLVY5wbXfQyLhn8o8Q6POCrLxBDM=;
 b=HeRz19VhVvnFRRzJD/YdP3OorTbl6oh2kWPvguWyh7gypwdAGHpRyhvZmXjClwoizE
 13ZW5mLl5l4NDYoCtmZpYkJukohFYVcnZbnEi3+/Zs4Un9mhCt3uR8rKyu6qmH4cjfmD
 RBbKQlOmNy+zkx4SnmXtAJCnQ8z9dAhBHC4b42grI7qchjkYpPPTPkTOTL2LhFM82zw6
 B8Y6yBWdszAZoqFCWBO3IHBEN3SC84Ysk9Ul2bjMBuRUrxRZjuqW2Wk6SXc/I0D0jgws
 7k9G6bMP9TpWBfPzwPVjmiHLj96LwlmuzNhrGXUkL+v4/DFxj//wTQScn8PAjxMh1WUo
 kj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726668215; x=1727273015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWbJgztcoceFfFThLVY5wbXfQyLhn8o8Q6POCrLxBDM=;
 b=xQfZ/MeRHJ8+0ZD0/SXbLVIXqIcRGHCbuM6Rteljxtdi6GQbgNpEYkcW97ogRAmw+k
 Yew3IP40zoGB6k/TpgSxAL6fMklalo/LdzN9743FRNzCXEQ89QtC+Tf6V2sGtqpFziA1
 fB8fprQpq7/lQUlpI/ED8YtJpSKWs01Ynsix0ZpgA0RdMrplh1MPR4hJidYv7RtlpOpI
 Z4Xhbe1PASuZ3HlDTcJ4hY3JUOsg7i0bPqxqtHt5Ha624s53gmJRvtEHw2uG2OuZ1y3X
 Hr4JMOfz3WqjvXna67ZK7tPeyB1wYBgwytKrWOCnG265pNd3wKuuLd3sfMc4FZE94eS8
 hUUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyv/nP3sOuifcxXx4W+CsXS8vdMK6pIWCSDVAwWmLhasSqkr/ZuRpPx+BHj0kH1oUwRZMpwiqw5w2v@lists.freedesktop.org,
 AJvYcCVQcxBRc1ijMfvrs9SXlSqFtgtkhM8+zZy2Yyo/YTmqbU7qczaCoPaIXm94AgwOcXRo4x2JP/tw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySqVjuTlKTVfZTRP+f9K3s4rDzcQ2W5FkdzQDRjIgCPHRaYcbm
 JmFWIVVymeSelcBDaqX6s6VcZjNZqOmsugFa9zTlhoE5wBB+H0tVhx4GHKwFbZd2xt07g2L+6ut
 pKBnCuG2Q+6jB1pnlcwq13kP4HJU=
X-Google-Smtp-Source: AGHT+IHDEMiQCcUgd0quuVe6+gHogtqzPU+y9sOiiTdAPQGGpUctqLcMyAdRZYLEQDqTWWmP+4jGGqEYoYG6oIHKK6k=
X-Received: by 2002:a05:6a00:1256:b0:70d:2289:4c55 with SMTP id
 d2e1a72fcca58-7192633889cmr13505341b3a.5.1726668215320; Wed, 18 Sep 2024
 07:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240917163119.890276-1-roheetchavan@gmail.com>
In-Reply-To: <20240917163119.890276-1-roheetchavan@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Sep 2024 10:03:21 -0400
Message-ID: <CADnq5_MXmSYf0=Lfb5-bsmuK6m2UEgyeVOMp4hjZcpxU82_Z2A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unnecessary cast warnings from
 checkpatch
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>

Applied.

Thanks!

On Tue, Sep 17, 2024 at 5:58=E2=80=AFPM Rohit Chavan <roheetchavan@gmail.co=
m> wrote:
>
> This patch addresses warnings produced by the checkpatch script
> related to unnecessary casts that could potentially hide bugs.
>
> The specific warnings are as follows:
> - Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:16
> - Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:20
> - Warning at drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:30
>
> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/=
drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index 41ecf00ed196..3ab401729f9b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -13,11 +13,11 @@
>
>  static bool dml21_allocate_memory(struct dml2_context **dml_ctx)
>  {
> -       *dml_ctx =3D (struct dml2_context *)kzalloc(sizeof(struct dml2_co=
ntext), GFP_KERNEL);
> +       *dml_ctx =3D kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
>         if (!(*dml_ctx))
>                 return false;
>
> -       (*dml_ctx)->v21.dml_init.dml2_instance =3D (struct dml2_instance =
*)kzalloc(sizeof(struct dml2_instance), GFP_KERNEL);
> +       (*dml_ctx)->v21.dml_init.dml2_instance =3D kzalloc(sizeof(struct =
dml2_instance), GFP_KERNEL);
>         if (!((*dml_ctx)->v21.dml_init.dml2_instance))
>                 return false;
>
> @@ -27,7 +27,7 @@ static bool dml21_allocate_memory(struct dml2_context *=
*dml_ctx)
>         (*dml_ctx)->v21.mode_support.display_config =3D &(*dml_ctx)->v21.=
display_config;
>         (*dml_ctx)->v21.mode_programming.display_config =3D (*dml_ctx)->v=
21.mode_support.display_config;
>
> -       (*dml_ctx)->v21.mode_programming.programming =3D (struct dml2_dis=
play_cfg_programming *)kzalloc(sizeof(struct dml2_display_cfg_programming),=
 GFP_KERNEL);
> +       (*dml_ctx)->v21.mode_programming.programming =3D kzalloc(sizeof(s=
truct dml2_display_cfg_programming), GFP_KERNEL);
>         if (!((*dml_ctx)->v21.mode_programming.programming))
>                 return false;
>
> --
> 2.34.1
>
