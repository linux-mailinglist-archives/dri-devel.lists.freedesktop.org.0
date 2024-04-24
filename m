Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C38AFE70
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09910FEF8;
	Wed, 24 Apr 2024 02:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 136624 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 02:30:48 UTC
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB310FEF8;
 Wed, 24 Apr 2024 02:30:47 +0000 (UTC)
X-QQ-mid: bizesmtp80t1713925829thu2spv5
X-QQ-Originating-IP: qbpHB5AsY5fWBXvwdZ7obXSglqCo8likImgKQqcak7g=
Received: from john-PC ( [123.114.60.34]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 24 Apr 2024 10:30:26 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: ElntjVByhgXxfG5iUPWhPYsitjgcVhEkJcWMGGOIIPYvD2sFGRut4HVaLxIvv
 abHXZL3H+uoWdYuuEUdip6/iLbjNe3K1fDUpE95FqngzpxxJE/SIqSrcznkUoVGI2Wl+imZ
 +zG4Kn3/fS4QDJmk/Hydb1UDAnaD4gCjkdNEHrtrIy1dqrx7cXlweZfwobsSGaqHLPOpufM
 ZdhYEDLMEslg8PmOeCd3oRd9MaxCR+p6N+KJKDE/Cg6Oo8E1N6279c24GpkVXs0AsKgjYYs
 l0MYP45pI8x0FuXFyUqwPSfwZPgifwwTuohYb+C93KCwpx1yLODvtYIt/q4+i5LyWUMrr9k
 OO+4tui0OkqAirlOlYRnGjjE2XMoDYaqJ4x5YxNMM+scEK9vSK1Slx9xzVPASDiswy0jtm+
 YX2OU0wqFXw=
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12069142072743202888
Date: Wed, 24 Apr 2024 10:30:25 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 srinivasan.shanmugam@amd.com, Arunpravin.PaneerSelvam@amd.com,
 le.ma@amd.com, Felix.Kuehling@amd.com, mukul.joshi@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
Message-ID: <94BEDC76B25ADCE8+20240424103025.74a98199@john-PC>
In-Reply-To: <f2e1b969-ce9c-450c-9882-99813b7334a0@amd.com>
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
 <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
 <CADnq5_PQ67J9ytb89-DqOgDw5V-s98TOyVjT5BGfkWMYv5sMQg@mail.gmail.com>
 <f2e1b969-ce9c-450c-9882-99813b7334a0@amd.com>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

On Mon, 22 Apr 2024 16:47:36 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 22.04.24 um 16:40 schrieb Alex Deucher:
> > On Mon, Apr 22, 2024 at 9:00=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote: =20
> >> Am 22.04.24 um 14:33 schrieb Qiang Ma: =20
> >>> On Mon, 22 Apr 2024 11:40:26 +0200
> >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >>> =20
> >>>> Am 22.04.24 um 07:26 schrieb Qiang Ma: =20
> >>>>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
> >>>>> garbage in the upper 16 bits of the vram size register,
> >>>>> kern log as follows:
> >>>>>
> >>>>> [    6.000000] [drm] Detected VRAM RAM=3D2256537600M, BAR=3D256M
> >>>>> [    6.007812] [drm] RAM width 64bits GDDR5
> >>>>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
> >>>>>
> >>>>> This is obviously not true, check for this and clamp the size
> >>>>> properly. Fixes boards reporting bogus amounts of vram,
> >>>>> kern log as follows:
> >>>>>
> >>>>> [    2.789062] [drm] Probable bad vram size: 0x86800800
> >>>>> [    2.789062] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
> >>>>> [    2.789062] [drm] RAM width 64bits GDDR5
> >>>>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready =20
> >>>> Well we had patches like this one here before and so far we
> >>>> always rejected them.
> >>>>
> >>>> When the mmCONFIG_MEMSIZE register isn't properly initialized
> >>>> then there is something wrong with your hardware.
> >>>>
> >>>> Working around that in the software driver is not going to fly.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>> =20
> >>> Hi Christian:
> >>> I see that two patches for this issue have been merged, and the
> >>> patches are as follows:
> >>>
> >>> 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
> >>> 0ca223b029a2 drm/radeon: fixup bad vram size on SI =20
> >> Mhm, I remember that we discussed reverting those but it looks
> >> like that never happened. I need to ask around internally.
> >>
> >> Question is do you see any other problems with the board? E.g.
> >> incorrect connector or harvesting configuration? =20
> > I'll need to dig up the past discussion again, but IIRC, the issue
> > was only seen on some non-x86 platforms.  Maybe something specific
> > to MMIO on those? =20
>=20
> I honestly doesn't remember it either, but in general it's the job of=20
> the VBIOS to init this register.
>=20
> So if we see the upper bits mangled the VBIOS hasn't done that
> correctly and it's quite likely that this is only the tip of the
> iceberg of problems.
>=20

Yes, this problem was found on the mips notebook. Check log vbios
signature incorrect, I don't know if it has any influence.
After add patch, drm logs are as follows:

[    2.554687] [drm] amdgpu kernel modesetting enabled.
[    2.558593] [drm] initializing kernel modesetting (OLAND
0x1002:0x6613 0x1028:0x1002 0x00). [    2.558593] [drm] register mmio
base: 0x45400000 [    2.558593] [drm] register mmio size: 262144
[    2.558593] [drm] add ip block number 0 <si_common>
[    2.558593] [drm] add ip block number 1 <gmc_v6_0>
[    2.558593] [drm] add ip block number 2 <si_ih>
[    2.558593] [drm] add ip block number 3 <si_dpm>
[    2.558593] [drm] add ip block number 4 <dce_v6_0>
[    2.558593] [drm] add ip block number 5 <gfx_v6_0>
[    2.558593] [drm] add ip block number 6 <si_dma>
[    2.578125] [drm] BIOS signature incorrect 0 0
[    2.746093] [drm] vm size is 64 GB, 2 levels, block size is 10-bit,
fragment size is 9-bit [    2.746093] [drm] Probable bad vram size:
0x86800800 [    2.746093] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
[    2.746093] [drm] RAM width 64bits GDDR5
[    2.750000] [drm] amdgpu: 2048M of VRAM memory ready
[    2.750000] [drm] amdgpu: 3072M of GTT memory ready.
[    2.750000] [drm] GART: num cpu pages 65536, num gpu pages 262144
[    2.750000] [drm] Supports vblank timestamp caching Rev 2
(21.10.2013). [    2.750000] [drm] Driver supports precise vblank
timestamp query. [    2.750000] [drm] Internal thermal controller with
fan control [    2.750000] [drm] amdgpu: dpm initialized
[    2.750000] [drm] amdgpu atom DIG backlight initialized
[    2.750000] [drm] AMDGPU Display Connectors
[    2.750000] [drm] Connector 0:
[    2.750000] [drm]   DP-1
[    2.750000] [drm]   HPD2
[    2.750000] [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952
0x1953 0x1953 [    2.750000] [drm]   Encoders:
[    2.750000] [drm]     LCD1: INTERNAL_UNIPHY
[    2.750000] [drm] Connector 1:
[    2.750000] [drm]   HDMI-A-1
[    2.750000] [drm]   HPD1
[    2.750000] [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e
0x194f 0x194f [    2.750000] [drm]   Encoders:
[    2.750000] [drm]     DFP1: INTERNAL_UNIPHY
[    2.753906] [drm] PCIE gen 2 link speeds already enabled
[    3.507812] [drm] fb mappable at 0x503E4000
[    3.507812] [drm] vram apper at 0x50000000
[    3.507812] [drm] size 8306688
[    3.507812] [drm] fb depth is 24
[    3.507812] [drm]    pitch is 7680
[    4.632812] amdgpu 0000:05:00.0: fb0: amdgpudrmfb frame buffer device
[    5.023437] [drm] Initialized amdgpu 3.27.0 20150101 for
0000:05:00.0 on minor 0


Qiang Ma

> Christian.
>=20
> >
> > Alex
> >
> > =20
> >> Regards,
> >> Christian.
> >> =20
> >>> Qiang Ma
> >>> =20
> >>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
> >>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
> >>>>>     2 files changed, 19 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
> >>>>> 23b478639921..3703695f7789 100644 ---
> >>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
> >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@
> >>>>> static int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
> >>>>>      adev->gmc.vram_width =3D numchan * chansize;
> >>>>>      /* size in MB on si */
> >>>>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>>>> 1024ULL * 1024ULL;
> >>>>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>>>> 1024ULL * 1024ULL;
> >>>>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>>>> +   /* some boards may have garbage in the upper 16 bits */
> >>>>> +   if (tmp & 0xffff0000) {
> >>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> >>>>> +           if (tmp & 0xffff)
> >>>>> +                   tmp &=3D 0xffff;
> >>>>> +   }
> >>>>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>>>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>>>
> >>>>>      if (!(adev->flags & AMD_IS_APU)) {
> >>>>>              r =3D amdgpu_device_resize_fb_bar(adev);
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
> >>>>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
> >>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
> >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
> >>>>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev)
> >>>>> static int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
> >>>>>      int r;
> >>>>> +   u32 tmp;
> >>>>>
> >>>>>      adev->gmc.vram_width =3D
> >>>>> amdgpu_atombios_get_vram_width(adev); if
> >>>>> (!adev->gmc.vram_width) {
> >>>>> -           u32 tmp;
> >>>>>              int chansize, numchan;
> >>>>>
> >>>>>              /* Get VRAM informations */
> >>>>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
> >>>>> amdgpu_device *adev) adev->gmc.vram_width =3D numchan * chansize;
> >>>>>      }
> >>>>>      /* size in MB on si */
> >>>>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>>>> 1024ULL * 1024ULL;
> >>>>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>>>> 1024ULL * 1024ULL;
> >>>>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>>>> +   /* some boards may have garbage in the upper 16 bits */
> >>>>> +   if (tmp & 0xffff0000) {
> >>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> >>>>> +           if (tmp & 0xffff)
> >>>>> +                   tmp &=3D 0xffff;
> >>>>> +   }
> >>>>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>>>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>>>
> >>>>>      if (!(adev->flags & AMD_IS_APU)) {
> >>>>>              r =3D amdgpu_device_resize_fb_bar(adev); =20
>=20
>=20

