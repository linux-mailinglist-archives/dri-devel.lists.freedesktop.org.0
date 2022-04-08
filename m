Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FF4F9D82
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A29710F1F8;
	Fri,  8 Apr 2022 19:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EAE10F1F7;
 Fri,  8 Apr 2022 19:08:45 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso6717349otf.12; 
 Fri, 08 Apr 2022 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4RDkLQsY+tsOENcOBL3ibndewOoaXXvYJerio/FFaLo=;
 b=HkYhGIWVZ8Thkkz6utKm5XMzS7kDFaNREki6y3Bt0ydRwhnft+Sa3OZHP0zfvYZPfe
 YTgbwNnkYoe2kX/neqjd3yQSSEBkZe3O/+n2FnHFkZ4fP82zAoolHzRfAYiLp+2FH2nz
 Ux4EQcgMpsB9GYy3yR0iN47/xVQnqxxMWQVhx9HG16M7X5Hu6MTyW89MwesJFgMPj9tQ
 Iea3dYjgzLg22QJCqMlLSyxLoL9YDwUjmGJhFHYZaPvb9FG/b08plMbPyuydfQ26RSGe
 GAT64QTKCyR7QFQLnRPg3dE+V4FEB/MS6LYXJy3UzroWJSWMyw5JImDlOIresmCUpLLa
 ra2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4RDkLQsY+tsOENcOBL3ibndewOoaXXvYJerio/FFaLo=;
 b=xogaHQ/pARP73S3Ufnl/Zxg0aPHNsg44bjyrvledefQkwYwIIayeWi2wAlfCCHoevu
 1i2xVgfFgHNPjxp5PeSj5LZJJFgd2sWjwkh1SfDIOixA+q2ToEdQ7SZrDWDObdTzWy6M
 jC2h2qBdlzFykGmhwOOXv8yheD4F1IXOr/8+ZT8TkT9R8ZBTocEbdI7Uc7tksY5FF+5X
 FCZJPkP+xkcm9OJPOSlyZjjYlcrJixYglkcAn+i8YIHheLDFBLy+ZkrBHJT5D+mo8qdD
 JU6MYzlIKLfd+2zoFRpbwITEs3MUO/Cwz+shgDDCxiSS0dEMWPK5+53mEZzpnEqHYQ/U
 jTlg==
X-Gm-Message-State: AOAM530WKKtx9lZObr+NaViZYRnAHEB42DrFFarx1m5V9rUfSBRzh3nT
 cpJfWv2PlZJ91jDTecxSlWDTlmxccVKm/gK36LE=
X-Google-Smtp-Source: ABdhPJwGTc8qZf6Z5/dgjTRxbVseJYdIR7/EJz5U0WdodBdeIYfyFOGmESzGumEhmuAzFm+pvypxgldcvMmwK/3VNEg=
X-Received: by 2002:a05:6830:1552:b0:5cd:bc6e:62b1 with SMTP id
 l18-20020a056830155200b005cdbc6e62b1mr7404046otp.357.1649444924800; Fri, 08
 Apr 2022 12:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220408190502.4103670-1-richard.gong@amd.com>
In-Reply-To: <20220408190502.4103670-1-richard.gong@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 15:08:33 -0400
Message-ID: <CADnq5_NY-2sX+5Q7LZWpRqPz0dQg4-xgqSx2_-qzvZ8Ar=J_YA@mail.gmail.com>
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
To: Richard Gong <richard.gong@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Limonciello,
 Mario" <mario.limonciello@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 3:05 PM Richard Gong <richard.gong@amd.com> wrote:
>
> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
> used with Intel AlderLake based systems to enable ASPM. Using these GFX
> cards as video/display output, Intel Alder Lake based systems will hang
> during suspend/resume.
>
> Add extra check to disable ASPM on Intel AlderLake based systems.
>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Signed-off-by: Richard Gong <richard.gong@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> v2: correct commit description
>     move the check from chip family to problematic platform
> ---
>  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..8b4eaf54b23e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> +#if IS_ENABLED(CONFIG_X86_64)
> +#include <asm/intel-family.h>
> +#endif
> +
>  #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK       0x00000001L
>  #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK   0x00000002L
> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
>  }
>
> +static bool intel_core_apsm_chk(void)
> +{
> +#if IS_ENABLED(CONFIG_X86_64)
> +       struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +       return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> +#else
> +       return false;
> +#endif
> +}
> +
>  static void vi_program_aspm(struct amdgpu_device *adev)
>  {
>         u32 data, data1, orig;
>         bool bL1SS = false;
>         bool bClkReqSupport = true;
>
> -       if (!amdgpu_device_should_use_aspm(adev))
> +       if (!amdgpu_device_should_use_aspm(adev) || intel_core_apsm_chk())
>                 return;
>
>         if (adev->flags & AMD_IS_APU ||
> --
> 2.25.1
>
