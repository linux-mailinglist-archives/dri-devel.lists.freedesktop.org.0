Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00954FF74F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B22F10E37E;
	Wed, 13 Apr 2022 13:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051210E37E;
 Wed, 13 Apr 2022 13:01:02 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e2442907a1so1894867fac.8; 
 Wed, 13 Apr 2022 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gZDaCj8hTLM0bP/l9w7YSO7g2qnbuNgNCn+DCFEd6aI=;
 b=FEv0kyLo3VMIFAfqBNf2vyglxgp+UTUwDsIRZrjJplezgnISwnlye+51pCD+/BwS2H
 B1016hY0GDvBfJCqcJZjHjdT4OzviCPT11gyZw9see9RLuMyS1uV+xeJuc+LL/6r8P9V
 LWDPRVRuD4Nd34JqBPuQfy7uesTk2i37Lhm0/wgvJ8dz/beuac7vETgMBiDWAy5BZsrQ
 NMYsTTfI9x99CKEa3NoeDcRPYklNpjxymFE0eG8Z09wVdQNW5FijH3YxurMWtL5JB0kN
 zXDVLK9EXg8ENwB1X436vunz2P/dHcSD6SX8dpxVqW1lCPZYHtZ/K8D371ILyPyI4W2q
 W8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gZDaCj8hTLM0bP/l9w7YSO7g2qnbuNgNCn+DCFEd6aI=;
 b=u1LvJfNk7X+Xa2eWe0fNwRbsGlAKFX+kJXCTsZJ1HhF7qCVG6vqseQqVHj0M8Cq1pH
 NGEPA2q4nrwjAKtqPGATlWdYIh2N0l38LWfcFx/bQQ2Tm8zua9ZkP4xfLbV4AlVf/h1W
 SFWbXjW34Mz61TBC9ZDhDxq8jU6fOyV3Y/HdpYQZNmQpsyTw7d9yxYtoD+B2bxRR6FsC
 TLRWKS3HzeQL6vkWvA/AuV6qvQU3r2YEODC0tmAgwJGwXVcBu4FuWIhN+ZmlruHu1cJq
 72lplIuYnMOYS02OC+Mi7mJMoMDhsXmajYVnjPzh+W4aNS5cc1X+5WyED3tKjOctm6Bb
 vF7g==
X-Gm-Message-State: AOAM531nqjVTJdFJPz37e6cjVfkyrbfPnVxBWUmaYrFtnvmjFFs9RoZs
 ZjoNmTP4cioHqRwZTc1woxgw01ZyB/SwGNg/FL8=
X-Google-Smtp-Source: ABdhPJyxWqtPubtjVsfln8tW3NJZa00U2bWV6SGBrTscpzYvBAsPghZG5gshfaDwslYztZlR+9ZObVa2eOzU4UoTulU=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr3978609oaa.200.1649854861731; Wed, 13
 Apr 2022 06:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
In-Reply-To: <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Apr 2022 09:00:50 -0400
Message-ID: <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: kernel test robot <lkp@intel.com>, Dave Airlie <airlied@linux.ie>,
 Richard Gong <richard.gong@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, "Limonciello,
 Mario" <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Richard,
>
>
> Thank you for sending out v4.
>
> Am 12.04.22 um 23:50 schrieb Richard Gong:
> > Active State Power Management (ASPM) feature is enabled since kernel 5.=
14.
> > There are some AMD GFX cards (such as WX3200 and RX640) that won't work
> > with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards=
 as
> > video/display output, Intel Alder Lake based systems will hang during
> > suspend/resume.
>
> I am still not clear, what =E2=80=9Chang during suspend/resume=E2=80=9D m=
eans. I guess
> suspending works fine? During resume (S3 or S0ix?), where does it hang?
> The system is functional, but there are only display problems?
>
> > The issue was initially reported on one system (Dell Precision 3660 wit=
h
> > BIOS version 0.14.81), but was later confirmed to affect at least 4 Ald=
er
> > Lake based systems.
> >
> > Add extra check to disable ASPM on Intel Alder Lake based systems.
> >
> > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > Reported-by: kernel test robot <lkp@intel.com>
>
> This tag is a little confusing. Maybe clarify that it was for an issue
> in a previous patch iteration?
>
> > Signed-off-by: Richard Gong <richard.gong@amd.com>
> > ---
> > v4: s/CONFIG_X86_64/CONFIG_X86
> >      enhanced check logic
> > v3: s/intel_core_asom_chk/aspm_support_quirk_check
> >      correct build error with W=3D1 option
> > v2: correct commit description
> >      move the check from chip family to problematic platform
> > ---
> >   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdg=
pu/vi.c
> > index 039b90cdc3bc..b33e0a9bee65 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > @@ -81,6 +81,10 @@
> >   #include "mxgpu_vi.h"
> >   #include "amdgpu_dm.h"
> >
> > +#if IS_ENABLED(CONFIG_X86)
> > +#include <asm/intel-family.h>
> > +#endif
> > +
> >   #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
> >   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK    0=
x00000001L
> >   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK        0=
x00000002L
> > @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device=
 *adev)
> >               WREG32_PCIE(ixPCIE_LC_CNTL, data);
> >   }
> >
> > +static bool aspm_support_quirk_check(void)
> > +{
> > +     if (IS_ENABLED(CONFIG_X86)) {
> > +             struct cpuinfo_x86 *c =3D &cpu_data(0);
> > +
> > +             return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_FAM=
6_ALDERLAKE);
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >   static void vi_program_aspm(struct amdgpu_device *adev)
> >   {
> >       u32 data, data1, orig;
> >       bool bL1SS =3D false;
> >       bool bClkReqSupport =3D true;
> >
> > -     if (!amdgpu_device_should_use_aspm(adev))
> > +     if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_c=
heck())
> >               return;
>
> Can users still forcefully enable ASPM with the parameter `amdgpu.aspm`?
>
> >
> >       if (adev->flags & AMD_IS_APU ||
>
> If I remember correctly, there were also newer cards, where ASPM worked
> with Intel Alder Lake, right? Can only the problematic generations for
> WX3200 and RX640 be excluded from ASPM?

This patch only disables it for the generation that was problematic.

Alex

>
>
> Kind regards,
>
> Paul
