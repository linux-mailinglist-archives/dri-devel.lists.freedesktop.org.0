Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6355091E9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 23:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7078E10F2A8;
	Wed, 20 Apr 2022 21:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E6D10F2A8;
 Wed, 20 Apr 2022 21:14:08 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e2442907a1so3345445fac.8; 
 Wed, 20 Apr 2022 14:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vtp8MJAaQAPK53MbtPLRxAAFC181Iaj1HgbpXhwvwbQ=;
 b=N9wH4iZxlECdNpXkLmI1xneOCzFbRsHv6ibrJNmMfSbl6/+vN/OGxlIKhqJ2eegSIn
 VrbY++KAHCfv4IJxtT441GZGIW3LI4BtjDGBKjBwyC8EjLBHqUgg7o7KdO2mT76RH7PU
 2GvPWc2sgRwp3gkcYO20U1Jt8dPi4uVGpoW7J7KoG4dhUOsA4Ey3e1Z1AifcR0WnQ3L/
 h4xypcp/egzHo0+8rfkZj0zAIZDCubQThYw/OZWqU0nM6lole/WWq+4Kn341CCOCuBHT
 AMlIiyigJv+jAQ2oqh5CSopTcB6fHah7aw4Y8clzmZmcj6lo4YNXmijgCgYiCaQWQqM5
 +EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vtp8MJAaQAPK53MbtPLRxAAFC181Iaj1HgbpXhwvwbQ=;
 b=hj0W4bPvYo3OAbYMiHaxt7ywxEEM2FDMuCj+SJPAS4tABVhAajkh72q+CdNXAq+A00
 kMFnQvg8SmUlAwFVxUh/zBqpkLa+Bj5+0sGAm7po2ntPs+Uzkk+yinLfE1rLvi952++T
 NHmHuIiZRZyMsRP5yw6Wb2uRkvaThkdyEjXNWFxTeaeqJrwImPTmzBi+Hc8Kq+tr/ZNo
 0RUlgOCASTSAgRzIXn12L+E6tRUwzvxSI/2YPxPe4mBqIqOv5urQZy2R2nv8s6Dvxhvk
 TgcM76tTm3Y8xOXLcXIil512OSoESG6d9KNCHqlIDaVjq+0iIviVqkTjLYgBCMESk7c1
 4J1g==
X-Gm-Message-State: AOAM532xJNizHlVz4K8cmBOiKfJOrqewOPDYll2+xUQY33Fb5SXWAloA
 kSKTRV+b4/cK5Sk6U9d5Gz64/wvzzRCbXrc2ZOtehHfy
X-Google-Smtp-Source: ABdhPJyJOYLRBWmvKzuq0DF7h1JYtPoI+ZIfpflWiZ11laqw6pix8mYn8NFREagTXanP41ZOn3O+z79BysLql4Q5C9M=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr2395785oaa.200.1650489247390; Wed, 20
 Apr 2022 14:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
 <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
 <67e98c3e-cfa3-ee51-4932-bbad8de5ffd8@amd.com>
 <462dce7d-73fc-ea8c-0a8a-5e8722ee1967@molgen.mpg.de>
In-Reply-To: <462dce7d-73fc-ea8c-0a8a-5e8722ee1967@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Apr 2022 17:13:56 -0400
Message-ID: <CADnq5_PKYNwO2bN-SU2Z7_hBCWksja9+42n01K5UDm=m63eAkw@mail.gmail.com>
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
 Xinhui Pan <xinhui.pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 5:02 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Richard,
>
>
> Am 20.04.22 um 22:56 schrieb Gong, Richard:
>
> > On 4/20/2022 3:48 PM, Paul Menzel wrote:
>
> >> Am 20.04.22 um 22:40 schrieb Alex Deucher:
> >>> On Wed, Apr 20, 2022 at 4:29 PM Paul Menzel <pmenzel@molgen.mpg.de>
> >>> wrote:
> >>
> >>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
> >>>>
> >>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
> >>>>>> [Cc: -kernel test robot <lkp@intel.com>]
> >>>>
> >>>> [=E2=80=A6]
> >>>>
> >>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
> >>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
> >>>>>>
> >>>>>>>> Thank you for sending out v4.
> >>>>>>>>
> >>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
> >>>>>>>>> Active State Power Management (ASPM) feature is enabled since
> >>>>>>>>> kernel 5.14.
> >>>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that wo=
n't
> >>>>>>>>> work
> >>>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these G=
FX
> >>>>>>>>> cards as
> >>>>>>>>> video/display output, Intel Alder Lake based systems will hang
> >>>>>>>>> during
> >>>>>>>>> suspend/resume.
> >>>>
> >>>> [Your email program wraps lines in cited text for some reason, makin=
g
> >>>> the citation harder to read.]
> >>>>
> >>>>>>>>
> >>>>>>>> I am still not clear, what =E2=80=9Chang during suspend/resume=
=E2=80=9D means. I
> >>>>>>>> guess
> >>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does
> >>>>>>>> it hang?
> >>>>>>>> The system is functional, but there are only display problems?
> >>>>> System freeze after suspend/resume.
> >>>>
> >>>> But you see certain messages still? At what point does it freeze
> >>>> exactly? In the bug report you posted Linux messages.
> >>>>
> >>>>>>>>> The issue was initially reported on one system (Dell Precision
> >>>>>>>>> 3660
> >>>>>>>>> with
> >>>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at
> >>>>>>>>> least 4
> >>>>>>>>> Alder
> >>>>>>>>> Lake based systems.
> >>>>>>>>>
> >>>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based syste=
ms.
> >>>>>>>>>
> >>>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> >>>>>>>>> Link:
> >>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=3D05%7=
C01%7Crichard.gong%40amd.com%7C487aaa63098b462e146a08da230f2319%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637860845178176835%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
%7C%7C%7C&amp;sdata=3D3IVldn05qNa2XVp1Lu58SriS8k9mk4U9K9p3F3IYPe0%3D&amp;re=
served=3D0
> >>>>>>>>>
> >>>>
> >>>> Thank you Microsoft Outlook for keeping us safe. :(
> >>>>
> >>>>>>>>>
> >>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>>>>>
> >>>>>>>> This tag is a little confusing. Maybe clarify that it was for an
> >>>>>>>> issue
> >>>>>>>> in a previous patch iteration?
> >>>>>
> >>>>> I did describe in change-list version 3 below, which corrected the
> >>>>> build
> >>>>> error with W=3D1 option.
> >>>>>
> >>>>> It is not good idea to add the description for that to the commit
> >>>>> message, this is why I add descriptions on change-list version 3.
> >>>>
> >>>> Do as you wish, but the current style is confusing, and readers of t=
he
> >>>> commit are going to think, the kernel test robot reported the proble=
m
> >>>> with AMD VI ASICs and Intel Alder Lake systems.
> >>>>
> >>>>>>>>
> >>>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
> >>>>>>>>> ---
> >>>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
> >>>>>>>>>        enhanced check logic
> >>>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
> >>>>>>>>>        correct build error with W=3D1 option
> >>>>>>>>> v2: correct commit description
> >>>>>>>>>        move the check from chip family to problematic platform
> >>>>>>>>> ---
> >>>>>>>>>     drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> >>>>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
> >>>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> >>>>>>>>> @@ -81,6 +81,10 @@
> >>>>>>>>>     #include "mxgpu_vi.h"
> >>>>>>>>>     #include "amdgpu_dm.h"
> >>>>>>>>>
> >>>>>>>>> +#if IS_ENABLED(CONFIG_X86)
> >>>>>>>>> +#include <asm/intel-family.h>
> >>>>>>>>> +#endif
> >>>>>>>>> +
> >>>>>>>>>     #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
> >>>>>>>>>     #define
> >>>>>>>>> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> >>>>>>>>> 0x00000001L
> >>>>>>>>>     #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MAS=
K
> >>>>>>>>> 0x00000002L
> >>>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
> >>>>>>>>> amdgpu_device *adev)
> >>>>>>>>>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
> >>>>>>>>>     }
> >>>>>>>>>
> >>>>>>>>> +static bool aspm_support_quirk_check(void)
> >>>>>>>>> +{
> >>>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
> >>>>>>>>> +             struct cpuinfo_x86 *c =3D &cpu_data(0);
> >>>>>>>>> +
> >>>>>>>>> +             return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D
> >>>>>>>>> INTEL_FAM6_ALDERLAKE);
> >>>>>>>>> +     }
> >>>>>>>>> +
> >>>>>>>>> +     return true;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>     static void vi_program_aspm(struct amdgpu_device *adev)
> >>>>>>>>>     {
> >>>>>>>>>         u32 data, data1, orig;
> >>>>>>>>>         bool bL1SS =3D false;
> >>>>>>>>>         bool bClkReqSupport =3D true;
> >>>>>>>>>
> >>>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
> >>>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) ||
> >>>>>>>>> !aspm_support_quirk_check())
> >>>>>>>>>                 return;
> >>>>>>>>
> >>>>>>>> Can users still forcefully enable ASPM with the parameter
> >>>>>>>> `amdgpu.aspm`?
> >>>>>>>>
> >>>>> As Mario mentioned in a separate reply, we can't forcefully enable
> >>>>> ASPM
> >>>>> with the parameter 'amdgpu.aspm'.
> >>>>
> >>>> That would be a regression on systems where ASPM used to work. Hmm. =
I
> >>>> guess, you could say, there are no such systems.
> >>>>
> >>>>>>>>>
> >>>>>>>>>         if (adev->flags & AMD_IS_APU ||
> >>>>>>>>
> >>>>>>>> If I remember correctly, there were also newer cards, where ASPM
> >>>>>>>> worked
> >>>>>>>> with Intel Alder Lake, right? Can only the problematic
> >>>>>>>> generations for
> >>>>>>>> WX3200 and RX640 be excluded from ASPM?
> >>>>>>>
> >>>>>>> This patch only disables it for the generatioaon that was
> >>>>>>> problematic.
> >>>>>>
> >>>>>> Could that please be made clear in the commit message summary, and
> >>>>>> message?
> >>>>>
> >>>>> Are you ok with the commit messages below?
> >>>>
> >>>> Please change the commit message summary. Maybe:
> >>>>
> >>>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
> >>>>
> >>>>> Active State Power Management (ASPM) feature is enabled since
> >>>>> kernel 5.14.
> >>>>>
> >>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won't
> >>>>> work
> >>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX
> >>>>> cards as
> >>>>> video/display output, Intel Alder Lake based systems will freeze af=
ter
> >>>>> suspend/resume.
> >>>>
> >>>> Something like:
> >>>>
> >>>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic
> >>>> Islands (VI) cards, like WX3200 and RX640, graphics don=E2=80=99t in=
itialize
> >>>> when resuming from S0ix(?).
> >>>>
> >>>>
> >>>>> The issue was initially reported on one system (Dell Precision 3660
> >>>>> with
> >>>>> BIOS version 0.14.81), but was later confirmed to affect at least 4
> >>>>> Alder
> >>>>> Lake based systems.
> >>>>
> >>>> Which ones?
> >>>>
> >>>>> Add extra check to disable ASPM on Intel Alder Lake based systems w=
ith
> >>>>> problematic generation GFX cards.
> >>>>
> >>>> =E2=80=A6 with the problematic Volcanic Islands GFX cards.
> >>>>
> >>>>>>
> >>>>>> Loosely related, is there a public (or internal issue) to analyze =
how
> >>>>>> to get ASPM working for VI generation devices with Intel Alder Lak=
e?
> >>>>>
> >>>>> As Alex mentioned, we need support from Intel. We don't have any
> >>>>> update
> >>>>> on that.
> >>>>
> >>>> It=E2=80=99d be great to get that fixed properly.
> >>>>
> >>>> Last thing, please don=E2=80=99t hate me, does Linux log, that ASPM =
is
> >>>> disabled?
> >>>
> >>> I'm not sure what gets logged at the platform level with respect to
> >>> ASPM, but whether or not the driver enables ASPM is tied to whether
> >>> ASPM is allowed at the platform level or not so if the platform
> >>> indicates that ASPM is not supported, the driver won't enable it.  Th=
e
> >>> driver does not log whether ASPM is enabled or not if that is what yo=
u
> >>> are asking.  As to whether or not it should, it comes down to how muc=
h
> >>> stuff is worth indiciating in the log.  The driver is already pretty
> >>> chatty by driver standards.
> >>
> >> I specifically mean, Linux should log the quirks it applies. (As a
> >> normal user, I=E2=80=99d also expect ASPM to work nowadays, so a messa=
ge, that
> >> it=E2=80=99s disabled would help a lot.)
> >
> > In general rule we shouldn't generate additional log unless something
> > went wrong with the system.
>
> Please run `dmesg` and see that your statement is false. That=E2=80=99s w=
hat log
> levels are for, and in your case, it would be at least error level.
> Also, I claim, something indeed went wrong, because a quirk had to be
> applied. So please add a notice log level, that ASPM gets disabled:
>
> Disable ASPM on Alder Lake with Volcanic Islands card due to resume
> problems. System energy consumption might be higher than expected.

ASPM does not save that much power.  I doubt you could really measure
it effectively without dedicated equipment.  Adding too many of these
types of messages just leads to lots of useless bug reports.  Users
see the message and file bugs.

Alex
