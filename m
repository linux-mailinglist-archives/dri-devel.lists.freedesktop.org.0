Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C07515081
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 18:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0051110E048;
	Fri, 29 Apr 2022 16:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E4410E048;
 Fri, 29 Apr 2022 16:13:49 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso8597375fac.3; 
 Fri, 29 Apr 2022 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Un+8uBdSonMBArNllHw60eJ9+stkGa05/rjOsT5H7mQ=;
 b=CcsvnPcyaByh/nvf5QgMaDK4KDq+1ywC2wyRQgS4Z5PIcHl5NrA1xwhpD70O4uFRMj
 tR9E0NJzMirunOscfIp2SGOnQC9aQf02NR7/CYUFnAs0ToijQawWAhKZRTqfUyRcyyMT
 ZMMZvCLOqxPLWM+uRhg201zcAlgjQPdiXnmYx3MX7/S2+D4Wd+ci2wMTk/kZ9TI8hyxZ
 I/jagVFQQb2Rg3XnXZS2BANG+rqq0zT9YRRfiqeNEu1niItjVsmAIFGia9DoklrES8mU
 Psvu0isGTybgzYHeh/pslkmrhbzskYlNW47ViTWVY9Wx3JNxGP05H39qOCX0Bf5TutYa
 j4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Un+8uBdSonMBArNllHw60eJ9+stkGa05/rjOsT5H7mQ=;
 b=IHdVBjFNAsmUuAPqqcFXWrX/xTIeJehtVETI0w9JlbyxdUo4e1rUs2QH3FXLgP847I
 LzwkxrK1S/t5Jm6dtgcFnXJ/F8wtRoG4HkMJLvEzpBG5Z4sR74aNMACaErEZ8FgOkkUH
 OLkMuP3lbScB0UCsVbdWKgpCrD8CWKYDp0e1AGLFCzn5i6yVUs4/Qd1nFOJ2QxV7xFnG
 B8W9Uuor7JqPc3m6ZpnYZvxWWeR4esbM8bmUF47RLT5CdVhEIgwic+LwVEyuGWk+4c6t
 a6n1DH5HmTbXDtM6Ej8ZmMkiOSSZ22ZBlzJt0vMJDGyiarGCNhzxITwrcddSsHEqsDhK
 wvLg==
X-Gm-Message-State: AOAM531v1iPhsivbKXWiwB4dYW18whufPMaTFoSC0fxac9BlMjK1XxtK
 OOBD3Mds50vDmpmnvdRPYDt037CPO4D9HJxJCzs=
X-Google-Smtp-Source: ABdhPJxOiBo4M/pvZvo6hhugzdJ2Op2OmRYRd++GDtCarikTTq3eyAiFl/sdq1eGPRIPu01vIKYQK69XBKFGhqKtPjc=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr24878oap.253.1651248829146; Fri, 29 Apr
 2022 09:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220429160604.2608782-1-richard.gong@amd.com>
In-Reply-To: <20220429160604.2608782-1-richard.gong@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Apr 2022 12:13:38 -0400
Message-ID: <CADnq5_OoyRmM+tWZ_nipfnNyxFVnyUH+R8Pc4-u2akeffXgssg@mail.gmail.com>
Subject: Re: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake based
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
Cc: kernel test robot <lkp@intel.com>, Dave Airlie <airlied@linux.ie>,
 xinhui pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, "Limonciello,
 Mario" <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Apr 29, 2022 at 12:08 PM Richard Gong <richard.gong@amd.com> wrote:
>
> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD Volcanic Islands (VI) GFX cards, such as the WX3200 and
> RX640, that do not work with ASPM-enabled Intel Alder Lake based systems.
> Using these GFX cards as video/display output, Intel Alder Lake based
> systems will freeze after suspend/resume.
>
> The issue was originally reported on one system (Dell Precision 3660 with
> BIOS version 0.14.81), but was later confirmed to affect at least 4
> pre-production Alder Lake based systems.
>
> Add an extra check to disable ASPM on Intel Alder Lake based systems with
> the problematic AMD Volcanic Islands GFX cards.
>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Richard Gong <richard.gong@amd.com>
> ---
> v5: added vi to commit header and updated commit message
>     rolled back guard with the preprocessor as did in v2 to correct build
>     error on non-x86 systems
> v4: s/CONFIG_X86_64/CONFIG_X86
>     enhanced check logic
> v3: s/intel_core_aspm_chk/aspm_support_quirk_check
>     correct build error with W=1 option
> v2: correct commit description
>     move the check from chip family to problematic platform
> ---
>  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..45f0188c4273 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> +#if IS_ENABLED(CONFIG_X86)
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
> +static bool aspm_support_quirk_check(void)
> +{
> +#if IS_ENABLED(CONFIG_X86)
> +       struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +       return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> +#else
> +       return true;
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
> +       if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_check())
>                 return;
>
>         if (adev->flags & AMD_IS_APU ||
> --
> 2.25.1
>
