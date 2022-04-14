Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24887500E61
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D38910E071;
	Thu, 14 Apr 2022 13:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC13A10E071;
 Thu, 14 Apr 2022 13:11:26 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r85so116310oie.7;
 Thu, 14 Apr 2022 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FJTqqynozRlFhZj6zQE6SI9JAXhhpX1MJOvb4vtV6bk=;
 b=b0VXhbb5s9tmmkoY9HD0UOaq4Nn461oG+PsAXbQQhdIuaxr9c2qvZveP19JJwNO6gd
 MFvH13UWVGq6UqdEvMht9odRsCXK++sZ0pz1duuz2/2QqHh+iCDCL6WnX8UZh0teINV3
 qBhJKCiwiH4Ekk5J8aKj54TsAxeHiTaVt0y3HDmIViIqlTBSJ1YHBVlYSxr8q78GiphC
 w2mtnHLDX6jFxDn+9Aztz+DNx1rH1XEUeyG4+X4FLa9fV/yDjrafl3B2fAhEZNMHmy7+
 4nK0m0Ex/+TUnsUT9Te6rYgcj2UAO86sefVgXCkbyrL9Y6FlQglzoOpwvbh1EMMQvtda
 W8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FJTqqynozRlFhZj6zQE6SI9JAXhhpX1MJOvb4vtV6bk=;
 b=HvXYvTmwowflH3DNI6KFRUoIVCIEnZvKswPYX9lzOwugza2nrtWgNeBSpru3AX+LqX
 q+kuJxGmLC4iq8Nw9juub7EdG0dkc8efjvKRKHnVzWtOm+ZdQWJFKZMAvIDl496WP0DF
 PtPZ6hDzVG6jRl9d6r4Rm0NJKrS6HFoXM9Xvxt3dYa4OeHzH2WRPFSzbrKkOwHaLvc2Y
 0XxQ/pO91cY6JE/vyGU7fDjjeCy3ndJwRGSgBk0LV93KB4svRBeJMo1AUFFhimP8qD/v
 r6/PNwZrb24HXmr2PQ0Skfi6/kZuWPm93gEqd0pRHNCSHAV9LrChOKYa0NHSY/fVDgGw
 2UEA==
X-Gm-Message-State: AOAM533RMDCXnBT0seWMzDr6NRLgHKgmjeOo4OzXYWFSyOGf34U9gLvt
 KSpC6KahYk3Q9L6IjXrTfSJRTXVke6/cAnGmcw8=
X-Google-Smtp-Source: ABdhPJylCbYVBm3BfzEiRvj1FrCDnwDBCv10i0cu00almCCBVRtEVezMTYQm0DJI1RRgTvCyd2GsFEdwvVO1QzqvPZE=
X-Received: by 2002:a05:6808:1486:b0:2f9:e821:51d9 with SMTP id
 e6-20020a056808148600b002f9e82151d9mr1319996oiw.253.1649941886069; Thu, 14
 Apr 2022 06:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
In-Reply-To: <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Apr 2022 09:11:14 -0400
Message-ID: <CADnq5_MJuH1KEHHWfuF4gY=LOAZ=2adBZ61jqL5k2WnupdFx4Q@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Richard Gong <richard.gong@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 3:52 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> [Cc: -kernel test robot <lkp@intel.com>]
>
> Dear Alex, dear Richard,
>
>
> Am 13.04.22 um 15:00 schrieb Alex Deucher:
> > On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
>
> >> Thank you for sending out v4.
> >>
> >> Am 12.04.22 um 23:50 schrieb Richard Gong:
> >>> Active State Power Management (ASPM) feature is enabled since kernel =
5.14.
> >>> There are some AMD GFX cards (such as WX3200 and RX640) that won't wo=
rk
> >>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX car=
ds as
> >>> video/display output, Intel Alder Lake based systems will hang during
> >>> suspend/resume.
> >>
> >> I am still not clear, what =E2=80=9Chang during suspend/resume=E2=80=
=9D means. I guess
> >> suspending works fine? During resume (S3 or S0ix?), where does it hang=
?
> >> The system is functional, but there are only display problems?
> >>
> >>> The issue was initially reported on one system (Dell Precision 3660 w=
ith
> >>> BIOS version 0.14.81), but was later confirmed to affect at least 4 A=
lder
> >>> Lake based systems.
> >>>
> >>> Add extra check to disable ASPM on Intel Alder Lake based systems.
> >>>
> >>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> >>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> This tag is a little confusing. Maybe clarify that it was for an issue
> >> in a previous patch iteration?
> >>
> >>> Signed-off-by: Richard Gong <richard.gong@amd.com>
> >>> ---
> >>> v4: s/CONFIG_X86_64/CONFIG_X86
> >>>       enhanced check logic
> >>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
> >>>       correct build error with W=3D1 option
> >>> v2: correct commit description
> >>>       move the check from chip family to problematic platform
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> >>>    1 file changed, 16 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/am=
dgpu/vi.c
> >>> index 039b90cdc3bc..b33e0a9bee65 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> >>> @@ -81,6 +81,10 @@
> >>>    #include "mxgpu_vi.h"
> >>>    #include "amdgpu_dm.h"
> >>>
> >>> +#if IS_ENABLED(CONFIG_X86)
> >>> +#include <asm/intel-family.h>
> >>> +#endif
> >>> +
> >>>    #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
> >>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK  =
  0x00000001L
> >>>    #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK      =
  0x00000002L
> >>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_devi=
ce *adev)
> >>>                WREG32_PCIE(ixPCIE_LC_CNTL, data);
> >>>    }
> >>>
> >>> +static bool aspm_support_quirk_check(void)
> >>> +{
> >>> +     if (IS_ENABLED(CONFIG_X86)) {
> >>> +             struct cpuinfo_x86 *c =3D &cpu_data(0);
> >>> +
> >>> +             return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D INTEL_F=
AM6_ALDERLAKE);
> >>> +     }
> >>> +
> >>> +     return true;
> >>> +}
> >>> +
> >>>    static void vi_program_aspm(struct amdgpu_device *adev)
> >>>    {
> >>>        u32 data, data1, orig;
> >>>        bool bL1SS =3D false;
> >>>        bool bClkReqSupport =3D true;
> >>>
> >>> -     if (!amdgpu_device_should_use_aspm(adev))
> >>> +     if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk=
_check())
> >>>                return;
> >>
> >> Can users still forcefully enable ASPM with the parameter `amdgpu.aspm=
`?
> >>
> >>>
> >>>        if (adev->flags & AMD_IS_APU ||
> >>
> >> If I remember correctly, there were also newer cards, where ASPM worke=
d
> >> with Intel Alder Lake, right? Can only the problematic generations for
> >> WX3200 and RX640 be excluded from ASPM?
> >
> > This patch only disables it for the generation that was problematic.
>
> Could that please be made clear in the commit message summary, and messag=
e?

Sure.  Richard, please add that this only disables ASPM on VI parts
when in an alderlake system.

>
> Loosely related, is there a public (or internal issue) to analyze how to
> get ASPM working for VI generation devices with Intel Alder Lake?

We'd need support from Intel.  I'm not sure where things currently stand.

Alex
