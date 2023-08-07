Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33823772A6E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12E110E2A2;
	Mon,  7 Aug 2023 16:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D9689E9E;
 Mon,  7 Aug 2023 16:20:24 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bb94563d19so3094780fac.0; 
 Mon, 07 Aug 2023 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425223; x=1692030023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFgEczBVOmwiviyA0fAfUVo2xor8ZUuCQLMEthf9n1g=;
 b=QQws6JNdH3Ir4CXOIgPnwaa8y7FwpFfLiPIou/77zYkl6kLvqBPYXFDAqYZpsFDG5w
 Qik1kHvUKAJQY8vhofXUo9xNBwm4cb02k2JtD2ExXfgb+aV7nQB8lMTIq8Z3eToETBOq
 eJ1SgAQ2ynj+kPTSv3GHYWxQnOeT/v3J47ftoDGLALF/yyTMMNmTc12TfSwZR7duPWIH
 qORPX5IciAow3eXhN5An/fTYhzwt6gEwkuw5gsVNL5ow5J/XkEWDQpc5af+PRaiM7Lnq
 5sHKhBvQbvjG7DRN3CSRHlaIFORZOiX5YScAyfsaN/IkZCRxgyv3cS3+ItXHaZkKTpT/
 Migw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425223; x=1692030023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFgEczBVOmwiviyA0fAfUVo2xor8ZUuCQLMEthf9n1g=;
 b=f4tiYFkIpRUbKfbSY3w1zTUKz/vr46E9XAnodo862QTMzDcrtI7qECEjenUH3dTBUz
 D2Dbxbp9vD1FpUMZn6awDOTL76bz2K7ASCV0bQBKfPOs9B3q9MMjST33qyegbwCkJWNf
 CMwBJTZ1QNDm9QnzV6iaDdasfOIQNhaY3MJIeiknuUQo+Hx/U01dA9ILYCEMzf4KbZn3
 ELIajxSWO9pHBQIvrfxm2M+25bdsgfWJ+sjmf37l0BnEnvOJNNeR4ht1QJ8uaX8wBf2q
 6cRVx4S6Pj2+zBYm3FWIzQka5hA8EU0MCQQsp53igj5W4+YFe/7ISXygzL8L0HRJV3KW
 z+3g==
X-Gm-Message-State: AOJu0YwkrVFBpaudB3ZtbDGlvi9Npq+G/oF5zBxWUNFBrhZAXFK+ScvW
 ocXBqGZTO5iOwd/Fb/S3qtrQsYisilvLLHYh7OE=
X-Google-Smtp-Source: AGHT+IHbslJXFOnho9JUjULNY7bfYsjdUEcd3xNZCdbeKxSuR0POaVNEvGZzwZT5YyzP3NnHf57KLQ7rSp/PLjaxgUY=
X-Received: by 2002:a05:6870:560c:b0:1bf:8978:1eb8 with SMTP id
 m12-20020a056870560c00b001bf89781eb8mr6583944oao.17.1691425223179; Mon, 07
 Aug 2023 09:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230801014318.4097-1-sunran001@208suo.com>
In-Reply-To: <20230801014318.4097-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:20:12 -0400
Message-ID: <CADnq5_PAgA958H9gx97k1eUXedNpcP8YtmuFihQPJc=ximkFvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 9:43=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required before the open parenthesis '('
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index 9b62b45ebb7f..895cda8e6934 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -1121,7 +1121,7 @@ smu_v13_0_display_clock_voltage_request(struct smu_=
context *smu,
>
>                 ret =3D smu_v13_0_set_hard_freq_limited_range(smu, clk_se=
lect, clk_freq, 0);
>
> -               if(clk_select =3D=3D SMU_UCLK)
> +               if (clk_select =3D=3D SMU_UCLK)
>                         smu->hard_min_uclk_req_from_dal =3D clk_freq;
>         }
>
> @@ -1437,8 +1437,7 @@ static int smu_v13_0_irq_process(struct amdgpu_devi=
ce *adev,
>         return 0;
>  }
>
> -static const struct amdgpu_irq_src_funcs smu_v13_0_irq_funcs =3D
> -{
> +static const struct amdgpu_irq_src_funcs smu_v13_0_irq_funcs =3D {
>         .set =3D smu_v13_0_set_irq_state,
>         .process =3D smu_v13_0_irq_process,
>  };
> @@ -1933,7 +1932,7 @@ static int smu_v13_0_get_dpm_level_count(struct smu=
_context *smu,
>
>         ret =3D smu_v13_0_get_dpm_freq_by_index(smu, clk_type, 0xff, valu=
e);
>         /* SMU v13.0.2 FW returns 0 based max level, increment by one for=
 it */
> -       if((smu->adev->ip_versions[MP1_HWIP][0] =3D=3D IP_VERSION(13, 0, =
2)) && (!ret && value))
> +       if ((smu->adev->ip_versions[MP1_HWIP][0] =3D=3D IP_VERSION(13, 0,=
 2)) && (!ret && value))
>                 ++(*value);
>
>         return ret;
> --
> 2.17.1
>
