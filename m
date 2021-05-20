Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C51B38B766
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 21:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B55D6F50A;
	Thu, 20 May 2021 19:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6162D6F50C;
 Thu, 20 May 2021 19:21:51 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so4032801oop.12; 
 Thu, 20 May 2021 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8UnW4lL464SupfU+ewTqWUOAJiPxxvepRI6nrJy0aog=;
 b=rpvbE82xTDInyVqe9a45WfFep9oOZcNx01b+vjen1B9hHI5mWk7mzo5TXi68TdsRwR
 ZjltyDrBegL8B0VN0n2C6rxEXaAG9NqMbnvbDnkYhZFmBBvqNTpYSqmL5CBiLE1iCh1Q
 4hwWkNuAdhi7hXZWnRp/W3s6s1sgWBHCgIg6qt04aUDgt1SLuc4CFlp0eRxSw2hJ8BUQ
 gmMkxMJu3f3+W7FZapF1QzS0qEbsU0weCflW6xye/+jU52D1ayVCwuDWsANo9ZQiw42Z
 2OSTNhuZAtzDfE9HofU/Y2ANZ8JE1sTRx9/zg8pI+QUkJVIlTp5TniFEDgz0W1M5OIQ4
 rqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8UnW4lL464SupfU+ewTqWUOAJiPxxvepRI6nrJy0aog=;
 b=uUBQ3PKHulyQXSW2Sxb0Xf5Q9hry47TR/R3+u1bjturo0Ek1kruAjYgtAPYz7EJqpg
 ybrgac2//wKuY0AUtjekqhQyN1qrhjmsJrAYC/WUBj5a9GfT/NqVXLz+RZ99c9SGNvo3
 WDonYkY5JZj3KzoPWNv1YmDobo5en39MALfM8TJZMcR3S5jriyyHjRqdvks7L1gGKNJ1
 TsYipJORyGF/Wy83HX+nwEYOeJl8mIeVVRJ+acvWpMISiKPpOsMhM0qHgf9KxGJryH40
 1qJ73qxtFjUx1SGWNiz9/9X4jKNUTwAgdaUPOdxnqVmYO9pwZcFquzijVtDLwNYGFbiv
 +D1A==
X-Gm-Message-State: AOAM531hpGt02rbJ5kHkcfDz+41DWVapMDZYTyQA7Mj6/y0AB72gTrDn
 jDTZjY2WThKM1JvXHOckGs9vKnXY/tbS2SdHEHE=
X-Google-Smtp-Source: ABdhPJze2+4ds5K9a8squEtefsFNJ0q4Fofl54xgQV9gTyaKMdgvwqw4oCLv1nqKO37ipbe1eXoZajw1jGSJA9EWBqA=
X-Received: by 2002:a4a:d004:: with SMTP id h4mr4982728oor.90.1621538510749;
 Thu, 20 May 2021 12:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-31-lee.jones@linaro.org>
In-Reply-To: <20210520120248.3464013-31-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 May 2021 15:21:39 -0400
Message-ID: <CADnq5_Nx=Zf=tGBP+V0sJEQRfuygyizdQoTZfLiRccvqcrJFtQ@mail.gmail.com>
Subject: Re: [PATCH 30/38] drm/amd/amdgpu/gfx_v9_4_2: Mark functions called by
 reference as static
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1008:5: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_query_ras_error_count=E2=80=99 [-Wmissing-pr=
ototypes]
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1054:6: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_reset_ras_error_count=E2=80=99 [-Wmissing-pr=
ototypes]
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1063:5: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_ras_error_inject=E2=80=99 [-Wmissing-prototy=
pes]
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1133:6: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_query_ras_error_status=E2=80=99 [-Wmissing-p=
rototypes]
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1143:6: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_reset_ras_error_status=E2=80=99 [-Wmissing-p=
rototypes]
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:1153:6: warning: no previous pro=
totype for =E2=80=98gfx_v9_4_2_enable_watchdog_timer=E2=80=99 [-Wmissing-pr=
ototypes]
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_2.c
> index dbad9ef002d59..87ec96a18a5dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> @@ -1641,8 +1641,8 @@ static int gfx_v9_4_2_query_utc_edc_count(struct am=
dgpu_device *adev,
>         return 0;
>  }
>
> -int gfx_v9_4_2_query_ras_error_count(struct amdgpu_device *adev,
> -                                  void *ras_error_status)
> +static int gfx_v9_4_2_query_ras_error_count(struct amdgpu_device *adev,
> +                                           void *ras_error_status)
>  {
>         struct ras_err_data *err_data =3D (struct ras_err_data *)ras_erro=
r_status;
>         uint32_t sec_count =3D 0, ded_count =3D 0;
> @@ -1690,7 +1690,7 @@ static void gfx_v9_4_2_reset_ea_err_status(struct a=
mdgpu_device *adev)
>         mutex_unlock(&adev->grbm_idx_mutex);
>  }
>
> -void gfx_v9_4_2_reset_ras_error_count(struct amdgpu_device *adev)
> +static void gfx_v9_4_2_reset_ras_error_count(struct amdgpu_device *adev)
>  {
>         if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
>                 return;
> @@ -1699,7 +1699,7 @@ void gfx_v9_4_2_reset_ras_error_count(struct amdgpu=
_device *adev)
>         gfx_v9_4_2_query_utc_edc_count(adev, NULL, NULL);
>  }
>
> -int gfx_v9_4_2_ras_error_inject(struct amdgpu_device *adev, void *inject=
_if)
> +static int gfx_v9_4_2_ras_error_inject(struct amdgpu_device *adev, void =
*inject_if)
>  {
>         struct ras_inject_if *info =3D (struct ras_inject_if *)inject_if;
>         int ret;
> @@ -1772,7 +1772,7 @@ static void gfx_v9_4_2_query_utc_err_status(struct =
amdgpu_device *adev)
>         }
>  }
>
> -void gfx_v9_4_2_query_ras_error_status(struct amdgpu_device *adev)
> +static void gfx_v9_4_2_query_ras_error_status(struct amdgpu_device *adev=
)
>  {
>         if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
>                 return;
> @@ -1782,7 +1782,7 @@ void gfx_v9_4_2_query_ras_error_status(struct amdgp=
u_device *adev)
>         gfx_v9_4_2_query_sq_timeout_status(adev);
>  }
>
> -void gfx_v9_4_2_reset_ras_error_status(struct amdgpu_device *adev)
> +static void gfx_v9_4_2_reset_ras_error_status(struct amdgpu_device *adev=
)
>  {
>         if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
>                 return;
> @@ -1792,7 +1792,7 @@ void gfx_v9_4_2_reset_ras_error_status(struct amdgp=
u_device *adev)
>         gfx_v9_4_2_reset_sq_timeout_status(adev);
>  }
>
> -void gfx_v9_4_2_enable_watchdog_timer(struct amdgpu_device *adev)
> +static void gfx_v9_4_2_enable_watchdog_timer(struct amdgpu_device *adev)
>  {
>         uint32_t i;
>         uint32_t data;
> --
> 2.31.1
>
