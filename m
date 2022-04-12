Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B850B4FE504
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 17:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364610E5B0;
	Tue, 12 Apr 2022 15:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AF10E5AB;
 Tue, 12 Apr 2022 15:43:03 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q189so19383039oia.9;
 Tue, 12 Apr 2022 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZGZNu9iiX3iSvmXUM8rzXVowDpysbTVW80h1NVMIpd0=;
 b=cnUXGmM7zHLLJgvWl00m+xYFp1+371WRKCG4/3WQi09uZVR0nnJiO4SCnG8bZjyXa3
 ur4i8kaIHHT4fvx/ZfYUpEweUQiDT9CDKTLmzERuNi8t9OL+kKqtRHBMMdtaEJr0ag8z
 wK0LR/X5rmuzQZB4EtuO+eHu7jji5tfqSRrI7zVxKpNZB5S17nrluTOxQPknb2HOC9t1
 89vC0oZvlU70HG0jub9xt56KRz9Vg4G1pgb90mH5ISd6r02jDWIZf5KtrowO0Sni9jye
 fZKuVvIA+K88P7mfCMAzjAvLgTzGzsaMxMXxF6YLHaDvlVrQUynNwSCX95BX1bfRlR0q
 aimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZGZNu9iiX3iSvmXUM8rzXVowDpysbTVW80h1NVMIpd0=;
 b=7iSDgHFYgcTaWQ0T9J3mWF+VAnMwHzVfBax7ld1QtP0Q640cnIc6htTnuEdiMkOZ4b
 J6wf7SYySnkiFVxP19SkES0hD5Z3ZY4td/F2vqOw2mVoWgy4UVpBaXkCGMsN3ZUwRNVr
 iq+MIymFLjiGQ/weCAp8gPk2klR2139MxNl1NxDVGaisq+9tVskoOLwnuCrnD3aQoOUY
 CcbAdcKbSqPDbYPeLoLFQcvRR+GCXbrnhLPw+gYkIqJ7TlySPzAli3si38NvMW+PpNF4
 fSKNjqMlUtmiN2BcsYy4JM5i6U9hxbjvstmTk7xMDn/yJPcxwqKcxXwCQBxatMpEQzEW
 5DbA==
X-Gm-Message-State: AOAM533ODYbTB4lcDMiKR+2G+i9gjl1vMbYAt/C2/xa8masmWthjZixu
 5TJlYufgHp+6EVhVd2XVt6ILpXHygiNs+0Xg8FM=
X-Google-Smtp-Source: ABdhPJxFB+Il2thTK2QAOb85QGOKwlW91TXm8qlLr1lQzB40w266iztnDdN5QvsGS+1bOw+dYPtWSm/w/73OAm4rWZg=
X-Received: by 2002:a05:6808:1486:b0:2f9:e821:51d9 with SMTP id
 e6-20020a056808148600b002f9e82151d9mr2140098oiw.253.1649778182265; Tue, 12
 Apr 2022 08:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220412145350.2843514-1-richard.gong@amd.com>
In-Reply-To: <20220412145350.2843514-1-richard.gong@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Apr 2022 11:42:51 -0400
Message-ID: <CADnq5_P5dO9eBR1c1bN+S73ABUBuUtZPkOtW0TCeLuBVD+PQwA@mail.gmail.com>
Subject: Re: [PATCHv3] drm/amdgpu: disable ASPM on Intel Alder Lake based
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

On Tue, Apr 12, 2022 at 10:59 AM Richard Gong <richard.gong@amd.com> wrote:
>
> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD GFX cards (such as WX3200 and RX640) that won't work
> with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as
> video/display output, Intel Alder Lake based systems will hang during
> suspend/resume.
>
> The issue was initially reported on one system (Dell Precision 3660 with
> BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder
> Lake based systems.
>
> Add extra check to disable ASPM on Intel Alder Lake based systems.
>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Richard Gong <richard.gong@amd.com>
> ---
> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>     correct build error with W=1 option
> v2: correct commit description
>     move the check from chip family to problematic platform
> ---
>  drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..b0b6353b48b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>  #include "mxgpu_vi.h"
>  #include "amdgpu_dm.h"
>
> +#if IS_ENABLED(CONFIG_X86_64)

Shouldn't this be X86?  You could theoretically run this on 32 bit.

Alex

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
> +       if (IS_ENABLED(CONFIG_X86_64)) {
> +               struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +               return (c->x86 == 6 && c->x86_model != INTEL_FAM6_ALDERLAKE);
> +       }
> +
> +       return true;
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
