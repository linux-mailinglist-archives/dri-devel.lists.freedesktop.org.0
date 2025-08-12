Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D1B22D83
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EDF10E615;
	Tue, 12 Aug 2025 16:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TXNuTYLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C31D10E60B;
 Tue, 12 Aug 2025 16:28:51 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-23ffa774f00so5246655ad.1; 
 Tue, 12 Aug 2025 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755016131; x=1755620931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8XXWc2SnRetJzdkycaLv1Sy6oktVrYdWqBPT/1g+j4=;
 b=TXNuTYLGeF6nS5zNBl43Ta8s60oyv3PXHueTryXKOIW3+E7nRWaZ1rP4v6nCTskA7O
 +a3E1QrCBWsr2+6j7M+VvlIbR/aiH3i/e1xZPrj5DVYiitsVff1318jE2WpDjG1eOlCy
 h/vPTln9cZlxEMJw9ZgE/kNrCRXrNLYD0Sh0vkOAIJRvWGLPUUIhCQwpdRlU+a/5eOU5
 eQSq8yXO7d8flwnAC8tqJ1cIuJpywwutQpGf6KfS40QcSXVt9aij76FhNPxwujCY2TAG
 /dubmf9Kshek13YpyNn8Mhyy7+bAUhdOws/kiorfqcUH8SycC7Gn+YQ1+srMn0FJ+b0r
 6hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755016131; x=1755620931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8XXWc2SnRetJzdkycaLv1Sy6oktVrYdWqBPT/1g+j4=;
 b=gLqaIZiGMbbxKLs3NhVGdBwld5RbeF3ml3M6xz+U5sX7UiyuBf5YFrJCWTBYZ7WlRp
 0i+iXUJDPY0acn6hOt9wAfOm3KvUwSl9HfvmmowChT0e1Xbq0cR6mkjp733TFUs+4Kmc
 70BKuBnEzk1GHYxLTtW9OSZ05rHRj9q1RuX8v5SyvQW3he0IHnpzBudT4kPp7+G+Qofj
 leuVR/dPaXOFI0WNEM1YXULhdOB19dBvPJV0lWzmAaicjf9a7Nq7TIVYgsHqvLPdAkTZ
 B8aiQZKyETcwCpTIt0E7dfOcLmlod5NfrEDd+QB20zXR7/BCMKVFDMeAgCeuOts6kJgv
 esyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU0DhDZG38etqxDFSD6oHSFPcBLAL0Ux5jz0QYtMcGxHp0T5mWlzzQhLVEXxtGvTbuV1Lg2cNCbKm3@lists.freedesktop.org,
 AJvYcCWe2ypafnxDEZI95FwQn7HsBMeQD0vcgOyaVcnLfxzy+sBrbhtiIwn2iJrmi51T8BjjEfga7b1R@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDkSbzB+GNowLTLQRKTftf5jS1Qq7doYfTf3IJRyWuOC8J8D7w
 YG9Gf0bLfMl4YZegdr2/D7f8jA4EdAj+Z7OaJRdf4l2Z5SH28cjxwMh3kiUo26SSY1LJA6emQjN
 vBF3E7jXhiMsk4AkdX73lv/9O4owKI6ksQA==
X-Gm-Gg: ASbGncsoWd4J+T0NAIxyeI2I7q9kBQXg9JuCjxy88clesCA0NjCh405G56+q7gRlnQW
 MkQcCLYwgIMXwjQkJqlWuuFKNj1kfFo157X3GaSfWS1q9AG67dlunL70mLFfWqIgO/lSLHa5cxh
 yRugYQrLBVa0RtfUsyNpGW0x8FY9ImCDCYReFzd3Rc5a7SdILUrDh2mppw+OniflhoTsNk1cLPu
 7+lG1U=
X-Google-Smtp-Source: AGHT+IF7UGNoWHAY2HBfAfn8v6UyctnQGA9lFULx5VpBJUqJiWlcxTy5uqrxR2lo6+lp5MVHHbDGSUwHdQbO0yPEfQk=
X-Received: by 2002:a17:902:e841:b0:235:737:7a8 with SMTP id
 d9443c01a7336-2430c1033bfmr2211895ad.3.1755016130853; Tue, 12 Aug 2025
 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250812075017.5370-1-liaoyuanhong@vivo.com>
In-Reply-To: <20250812075017.5370-1-liaoyuanhong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Aug 2025 12:28:39 -0400
X-Gm-Features: Ac12FXxy3-M_wzEetsEfVe6DFeHMxdgLbCQg5APkZ-SqZKW-POTop_GS7uBXzuE
Message-ID: <CADnq5_OAdOx5s-76uyVFRZbsStpvRh=rngJ=uKcpjb4HYaJz1w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant semicolons
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Aug 12, 2025 at 3:58=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.co=
m> wrote:
>
> Remove unnecessary semicolons.
>
> Fixes: dda4fb85e433f ("drm/amd/display: DML changes for DCN32/321")
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c    | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc=
_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> index 9ba6cb67655f..6c75aa82327a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
> @@ -139,7 +139,6 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_r=
egs,
>         if (dual_plane) {
>                 unsigned int p1_pte_row_height_linear =3D get_dpte_row_he=
ight_linear_c(mode_lib, e2e_pipe_param,
>                                 num_pipes, pipe_idx);
> -               ;
>                 if (src->sw_mode =3D=3D dm_sw_linear)
>                         ASSERT(p1_pte_row_height_linear >=3D 8);
>
> --
> 2.34.1
>
