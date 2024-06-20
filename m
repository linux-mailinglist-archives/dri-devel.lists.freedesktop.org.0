Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CD910A16
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA010E2BC;
	Thu, 20 Jun 2024 15:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MxHTbkoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4EB10E0BC;
 Thu, 20 Jun 2024 15:39:06 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1f9de13d6baso3196345ad.2; 
 Thu, 20 Jun 2024 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718897945; x=1719502745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZiM+YF32yo4nDHQ3wUnYbNN+W5ZP8TEo860NNMId04=;
 b=MxHTbkoozzRjtkXDnFi/vZ2oCRUy0CVWabTc9NOEF1Vl59i81L2vG+ZvcXN2XuFPxy
 SPXzClVZXkVpAJurUVZetz4IkFSNhC9iN8dr/JihCi6TUt81yk7NaE3zvv01LspdX95X
 Op1bOPBTPpcpaUztvLfQnZFOicsJyl739YpxLTslIAn127bGL6H27REtsoAUrd3ayWhX
 e1ClxWvL+eIUiJ5GAyOn2sLOKmnSW2iS3XrWJ0lcOoKHcu2NLfvsJoNht4uwaXsCbIHI
 MeAY7mOhApUHg/LTCGpisBWZjD/EQqiSz3jd7q/Y+V1kanqlookGFKqkw7Gg+9O/3Gya
 5Snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718897945; x=1719502745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZiM+YF32yo4nDHQ3wUnYbNN+W5ZP8TEo860NNMId04=;
 b=mPb9fOoG0tkSPJ/0RVbhATdN4s9KosiZpdkecn9T43mfxpdt03zGWF+BDsPYJRCIXy
 iUqOO3p/QdUZFo4Uyf+zj2gV5hw7pZjY5W5OhXnW9Ep+fuUtbRLqL0yuYVy1f7PQpP/1
 BGe0rVvKYJSJqUKpKQnJLzGvN7ZzszaUai0gFewvbTG+dVwY3sJ6TbE5Hbktf7ev9LAa
 PbFZBJJnGtqga3Vo6Yv9ONu/cJzfJpL2dwPbuqgmMseJ5e531DIVzsHwEGfzwOIkomP+
 gcepqeW93piGLlprfuK7sbkqdj5Yqdq7E+Js24ROY4vbOSu8YaEj5ccMkppr0haTMuDf
 Hj1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/h3lUWI6H/cGC/bGDDSXxwDWbqs2AnO818c8t4thc55TE5jRUrbyt/qQr91ZIRDZq/yZxR+GzGy7L7xtot6z/ORoPlxGFKUs4fEipVAo8U+Fx/9rk08iq/8RHDJf0GQoPxhNsTrkLC2QpxX+ZCw==
X-Gm-Message-State: AOJu0YyOjAZMa0j59g7ayGwcwEvE494oYTrfXWL+YEzd37X9800RMRUp
 EdC/lwb7twuouwKKK0duA8xXJBmLPTR6eSY5i73HYO5glIhAhJsvQjDOVZA3Z59/6t7YlPMY50j
 xNYABoTAelDfQEvHh9lAgSeX8kuw=
X-Google-Smtp-Source: AGHT+IFs4cCXaYXfPLL4tEu5sHew2ZyfUuFoMGlVDGBf4hJXj5XH8xm9DX67le0YENHbSqeP4ZMKfz7PIq6kLoBgW/o=
X-Received: by 2002:a17:902:d382:b0:1f8:6776:7ab7 with SMTP id
 d9443c01a7336-1f9aa412402mr50450385ad.24.1718897945494; Thu, 20 Jun 2024
 08:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240620081052.56439-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240620081052.56439-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Jun 2024 11:38:54 -0400
Message-ID: <CADnq5_NevWHt2p17WipaAmw1q-CzxCe_shYwSe3iLBx7KDV1zg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant code and semicolons
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

On Thu, Jun 20, 2024 at 5:07=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_share=
d.c:3171:2-3: Unneeded semicolon.
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_share=
d.c:3185:2-3: Unneeded semicolon.
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_share=
d.c:3200:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9365
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../dml21/src/dml2_core/dml2_core_shared.c    | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_shared.c
> index cfa4c4475821..1a9895b1833f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_s=
hared.c
> @@ -3142,62 +3142,62 @@ static unsigned int dml_get_tile_block_size_bytes=
(enum dml2_swizzle_mode sw_mode
>  {
>         switch (sw_mode) {
>         case (dml2_sw_linear):
> -               return 256; break;
> +               return 256;
>         case (dml2_sw_256b_2d):
> -               return 256; break;
> +               return 256;
>         case (dml2_sw_4kb_2d):
> -               return 4096; break;
> +               return 4096;
>         case (dml2_sw_64kb_2d):
> -               return 65536; break;
> +               return 65536;
>         case (dml2_sw_256kb_2d):
> -               return 262144; break;
> +               return 262144;
>         case (dml2_gfx11_sw_linear):
> -               return 256; break;
> +               return 256;
>         case (dml2_gfx11_sw_64kb_d):
> -               return 65536; break;
> +               return 65536;
>         case (dml2_gfx11_sw_64kb_d_t):
> -               return 65536; break;
> +               return 65536;
>         case (dml2_gfx11_sw_64kb_d_x):
> -               return 65536; break;
> +               return 65536;
>         case (dml2_gfx11_sw_64kb_r_x):
> -               return 65536; break;
> +               return 65536;
>         case (dml2_gfx11_sw_256kb_d_x):
> -               return 262144; break;
> +               return 262144;
>         case (dml2_gfx11_sw_256kb_r_x):
> -               return 262144; break;
> +               return 262144;
>         default:
>                 DML2_ASSERT(0);
>                 return 256;
> -       };
> +       }
>  }
>
>  const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_ty=
pe bw_type)
>  {
>         switch (bw_type) {
>         case (dml2_core_internal_bw_sdp):
> -               return("dml2_core_internal_bw_sdp"); break;
> +               return("dml2_core_internal_bw_sdp");
>         case (dml2_core_internal_bw_dram):
> -               return("dml2_core_internal_bw_dram"); break;
> +               return("dml2_core_internal_bw_dram");
>         case (dml2_core_internal_bw_max):
> -               return("dml2_core_internal_bw_max"); break;
> +               return("dml2_core_internal_bw_max");
>         default:
> -               return("dml2_core_internal_bw_unknown"); break;
> -       };
> +               return("dml2_core_internal_bw_unknown");
> +       }
>  }
>
>  const char *dml2_core_internal_soc_state_type_str(enum dml2_core_interna=
l_soc_state_type dml2_core_internal_soc_state_type)
>  {
>         switch (dml2_core_internal_soc_state_type) {
>         case (dml2_core_internal_soc_state_sys_idle):
> -               return("dml2_core_internal_soc_state_sys_idle"); break;
> +               return("dml2_core_internal_soc_state_sys_idle");
>         case (dml2_core_internal_soc_state_sys_active):
> -               return("dml2_core_internal_soc_state_sys_active"); break;
> +               return("dml2_core_internal_soc_state_sys_active");
>         case (dml2_core_internal_soc_state_svp_prefetch):
> -               return("dml2_core_internal_soc_state_svp_prefetch"); brea=
k;
> +               return("dml2_core_internal_soc_state_svp_prefetch");
>         case dml2_core_internal_soc_state_max:
>         default:
> -               return("dml2_core_internal_soc_state_unknown"); break;
> -       };
> +               return("dml2_core_internal_soc_state_unknown");
> +       }
>  }
>
>  static bool dml_is_vertical_rotation(enum dml2_rotation_angle Scan)
> --
> 2.20.1.7.g153144c
>
