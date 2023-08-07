Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F323772C8A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3311C10E342;
	Mon,  7 Aug 2023 17:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90410E33C;
 Mon,  7 Aug 2023 17:17:02 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bca6c06e56so4276662a34.1; 
 Mon, 07 Aug 2023 10:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428622; x=1692033422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw1/lE3oDwvMAgGbwq37rEFlQSYTjYJZy4ndo+1nhtE=;
 b=PYa4DP2yxIeyhlwZu/rPWrm5u8/LOyHx8Wb3WN0mNHawTQHz5v9jXQbcEkNSE17cT0
 MwCCxHEXQUTYcwf1zR6JMVKl9Pai4WqzciT8CtwuX2/fLyJf/ZLONz9S3IpfBmyf6yEG
 eLWpw+x82hKB42Cox596LNm/VEkU61DbCvQwfpSWlq+1r1SOxbNMtNVc153qcrrntALf
 RY7xYgGqEv2I5XdwUXfA8V4RI9ipPdZqTO7kqi+R6xhPG4mil90QlRbVLk98WRhP8G53
 CFYX6xPVdYGlRN9q5CNRzxs+Ktrc6cmXcw9fx80NezPK8h1vgS5BiKzLXHGgcCvouVnh
 HQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428622; x=1692033422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gw1/lE3oDwvMAgGbwq37rEFlQSYTjYJZy4ndo+1nhtE=;
 b=BCt0xlxZicXg7+WN8aZRAHVwj0dfr9uLZEC0JYay2n6kLiDuOtq+bv17MxNh1lSY+F
 TMDBP0RBYs3Eh1PwPhBoNQxaQ8BOmLEo5tPLqXM5DlfkGoT4Y+r9waTmlIALPRLSYxI6
 cInOf6u1azxR8JStPtUJyBS1Ltooh9BdM6x4wPWLnIaTRe3FSSBLoB7wN4vLp1x/0TUr
 rwcz7o2gzfRPt/CjxJR1d0Co+L/oceyVkKay+/gFzDP2phEOnFepSQ0YGcUYN+06BhEr
 008/tsJ3m4yFbVXiR1SFzGIBTGsuycJQT1gl2qRJ9rjcR5wQKmjC0+DE7tubTBuXf/1e
 W89g==
X-Gm-Message-State: AOJu0YyciqK78E6d+lXSaiV/odCwPdR8TtAtRaYBYvBcm93UhNh2j49I
 19Lohm0TSsiblED/7P3jr7IRV8auDrlXL++aV/w=
X-Google-Smtp-Source: AGHT+IEOzJSLELMOxOLp3WGomkZUhV4gON0TULeLPfu0jawep70yBs3PRuPqpq4e9U+cKPawF6dpxljuyAtFpqhp0kc=
X-Received: by 2002:a05:6871:82a:b0:1bf:174b:a17e with SMTP id
 q42-20020a056871082a00b001bf174ba17emr11432280oap.22.1691428622112; Mon, 07
 Aug 2023 10:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230802063742.11697-1-sunran001@208suo.com>
In-Reply-To: <20230802063742.11697-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:16:51 -0400
Message-ID: <CADnq5_PFn8bsHGJw0s72VuAMo4UWx_Rr=1dZ_=hOD3cpQvzNpQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in vce_v3_0.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 2:38=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/vce_v3_0.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/=
amdgpu/vce_v3_0.c
> index 8def62c83ffd..18f6e62af339 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> @@ -998,8 +998,7 @@ static void vce_v3_0_set_irq_funcs(struct amdgpu_devi=
ce *adev)
>         adev->vce.irq.funcs =3D &vce_v3_0_irq_funcs;
>  };
>
> -const struct amdgpu_ip_block_version vce_v3_0_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vce_v3_0_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_VCE,
>         .major =3D 3,
>         .minor =3D 0,
> @@ -1007,8 +1006,7 @@ const struct amdgpu_ip_block_version vce_v3_0_ip_bl=
ock =3D
>         .funcs =3D &vce_v3_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version vce_v3_1_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vce_v3_1_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_VCE,
>         .major =3D 3,
>         .minor =3D 1,
> @@ -1016,8 +1014,7 @@ const struct amdgpu_ip_block_version vce_v3_1_ip_bl=
ock =3D
>         .funcs =3D &vce_v3_0_ip_funcs,
>  };
>
> -const struct amdgpu_ip_block_version vce_v3_4_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version vce_v3_4_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_VCE,
>         .major =3D 3,
>         .minor =3D 4,
> --
> 2.17.1
>
