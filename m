Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFF8AFE98
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 04:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BF010F86B;
	Wed, 24 Apr 2024 02:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdKtco7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B602310F8BD;
 Wed, 24 Apr 2024 02:43:45 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2a2e5d86254so346603a91.1; 
 Tue, 23 Apr 2024 19:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713926625; x=1714531425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZh6ePaIOuCwDbpk3olt/lwItI0lVW6WJuNX6TqYyCY=;
 b=JdKtco7bQD1fkj5ilpKhWeS9eTZ0HBODYeDAjbMTw21VVFbfkU6XVzLiU8XHOlzIbH
 SzLlJZeeE4cJPLAXB42GbNEn+CT80fq8nqNj2Pr801xA9OGWc3DwpCMqaN2JbYvhGZZQ
 LdHscWTqDPQwRhdkzfF8hq/aZnt9Bl4uOC8/wKK09TKh1I39UHupMxREg7dl/NgnDwWv
 1hb+HmqOStrXE2yeCgO+Q7NW+Gkx9sDk3q0yjFK500+z0w0zVkhCLdgYGviaLhKnSaVS
 /vBpbohJcJWRD/exkTB1JJXlLJeH6R61QHphoiLKGLcwBig/8jHDW5pcgK8bPvf2LgoQ
 HfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713926625; x=1714531425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZh6ePaIOuCwDbpk3olt/lwItI0lVW6WJuNX6TqYyCY=;
 b=bJUHpRZCIPZy7QQKUnfLnh6MREfKxyR3cQxK2n0s0kOE/LdaKr3nLXxVGJLV3JTVnK
 SaU8CC/Bh0BXqbvM/k6q9nSaIzvuOPZDQiyxppbf+ppYTxt3dFPAiSElXtQl1hkQqM33
 dfpu0Z5W7Cd7ZRE0jcO5dvkzic03E8dUFcpUyLik6TX4Z1i+cybAK0yA1bzwGAkyUime
 dSA9nMElA32IxHGO93jTlrCanF4bZADbrX+xmdEPlHph2BM9S3nCgECy1B6cQ+cfkxaI
 yNXXpbZCKYPptZDSkXYoauzYGJXAhYo46owWjbBRoxcUwRUgRsb7b44g+TZrCBwSI9H0
 DAtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx3pwtGd3VoIuL0MFPX7hvsRbmOA9bNQuQpZ2BHeQOtSEIS6BJmVZizBidw3UrLJR/q95bC3vYfBBjVsv4GV5N3ayRx2Cphe5elMU78UqOEYdX+F+YzogN4kaxaMN7/OvN7jU8LEicOMwRYEs7GQ==
X-Gm-Message-State: AOJu0YwlxbmUtRiGmIw8DYwH3lPxY71QYsqzToajaxw/7uc9WKr2o/F5
 +Wf8GwulkO+UCamo+lHJ0UY8A4RHzI8TuCV8amlJr1H6ESAw54R8FWUY4puZxDUDGJkkKPeXKoy
 qdFewmNoZy7QQzBnr5Q/LE3dZe1c=
X-Google-Smtp-Source: AGHT+IFSIqdUq+ljGpUwgGHf5/dKAU3xPmayX7D3Q3FJxkA6QCsqyhQ9gSv0f5pavGyse5CfWMo/wuRpa1I5/rBLkKo=
X-Received: by 2002:a17:90a:a381:b0:2a6:217b:4492 with SMTP id
 x1-20020a17090aa38100b002a6217b4492mr1644346pjp.3.1713926625028; Tue, 23 Apr
 2024 19:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
 <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
 <CADnq5_PQ67J9ytb89-DqOgDw5V-s98TOyVjT5BGfkWMYv5sMQg@mail.gmail.com>
 <f2e1b969-ce9c-450c-9882-99813b7334a0@amd.com>
 <94BEDC76B25ADCE8+20240424103025.74a98199@john-PC>
In-Reply-To: <94BEDC76B25ADCE8+20240424103025.74a98199@john-PC>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Apr 2024 22:43:33 -0400
Message-ID: <CADnq5_PukFSfD2LKvLXLGEJnVD3=Gu_2_bRam45P2hKX6rzuRA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
To: Qiang Ma <maqianga@uniontech.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, srinivasan.shanmugam@amd.com, 
 Arunpravin.PaneerSelvam@amd.com, le.ma@amd.com, Felix.Kuehling@amd.com, 
 mukul.joshi@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 23, 2024 at 10:30=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> =
wrote:
>
> On Mon, 22 Apr 2024 16:47:36 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>
> > Am 22.04.24 um 16:40 schrieb Alex Deucher:
> > > On Mon, Apr 22, 2024 at 9:00=E2=80=AFAM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 22.04.24 um 14:33 schrieb Qiang Ma:
> > >>> On Mon, 22 Apr 2024 11:40:26 +0200
> > >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > >>>
> > >>>> Am 22.04.24 um 07:26 schrieb Qiang Ma:
> > >>>>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
> > >>>>> garbage in the upper 16 bits of the vram size register,
> > >>>>> kern log as follows:
> > >>>>>
> > >>>>> [    6.000000] [drm] Detected VRAM RAM=3D2256537600M, BAR=3D256M
> > >>>>> [    6.007812] [drm] RAM width 64bits GDDR5
> > >>>>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
> > >>>>>
> > >>>>> This is obviously not true, check for this and clamp the size
> > >>>>> properly. Fixes boards reporting bogus amounts of vram,
> > >>>>> kern log as follows:
> > >>>>>
> > >>>>> [    2.789062] [drm] Probable bad vram size: 0x86800800
> > >>>>> [    2.789062] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
> > >>>>> [    2.789062] [drm] RAM width 64bits GDDR5
> > >>>>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready
> > >>>> Well we had patches like this one here before and so far we
> > >>>> always rejected them.
> > >>>>
> > >>>> When the mmCONFIG_MEMSIZE register isn't properly initialized
> > >>>> then there is something wrong with your hardware.
> > >>>>
> > >>>> Working around that in the software driver is not going to fly.
> > >>>>
> > >>>> Regards,
> > >>>> Christian.
> > >>>>
> > >>> Hi Christian:
> > >>> I see that two patches for this issue have been merged, and the
> > >>> patches are as follows:
> > >>>
> > >>> 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
> > >>> 0ca223b029a2 drm/radeon: fixup bad vram size on SI
> > >> Mhm, I remember that we discussed reverting those but it looks
> > >> like that never happened. I need to ask around internally.
> > >>
> > >> Question is do you see any other problems with the board? E.g.
> > >> incorrect connector or harvesting configuration?
> > > I'll need to dig up the past discussion again, but IIRC, the issue
> > > was only seen on some non-x86 platforms.  Maybe something specific
> > > to MMIO on those?
> >
> > I honestly doesn't remember it either, but in general it's the job of
> > the VBIOS to init this register.
> >
> > So if we see the upper bits mangled the VBIOS hasn't done that
> > correctly and it's quite likely that this is only the tip of the
> > iceberg of problems.
> >
>
> Yes, this problem was found on the mips notebook. Check log vbios
> signature incorrect, I don't know if it has any influence.
> After add patch, drm logs are as follows:

IIRC, the patches for the other generations were on similar less
mainstream platforms.  I've never seen anything like this on x86.  I
suspect this is something platform specific.  Does this platform have
an x86 real mode emulator to post the GPU?  If so, I wonder if the
problem lies somewhere in there?  Can you disable that or test with a
secondary board which does not post the GPU?  The driver can post it
itself.  Another thing to try would be to call the atombios asic_init
sequence and check if the value is correctly written in that case.
The asic_init sequence should write the mem config register as part of
the sequence.  Since asic_init is just a programming sequence stored
in the vbios (and interpreted by the driver), you should be able to
audit it to find out what is going wrong.  You can use atomdis
(https://cgit.freedesktop.org/~mhopf/AtomDis/) to print out the
programming sequences in the atom command tables.

Alex


>
> [    2.554687] [drm] amdgpu kernel modesetting enabled.
> [    2.558593] [drm] initializing kernel modesetting (OLAND
> 0x1002:0x6613 0x1028:0x1002 0x00). [    2.558593] [drm] register mmio
> base: 0x45400000 [    2.558593] [drm] register mmio size: 262144
> [    2.558593] [drm] add ip block number 0 <si_common>
> [    2.558593] [drm] add ip block number 1 <gmc_v6_0>
> [    2.558593] [drm] add ip block number 2 <si_ih>
> [    2.558593] [drm] add ip block number 3 <si_dpm>
> [    2.558593] [drm] add ip block number 4 <dce_v6_0>
> [    2.558593] [drm] add ip block number 5 <gfx_v6_0>
> [    2.558593] [drm] add ip block number 6 <si_dma>
> [    2.578125] [drm] BIOS signature incorrect 0 0
> [    2.746093] [drm] vm size is 64 GB, 2 levels, block size is 10-bit,
> fragment size is 9-bit [    2.746093] [drm] Probable bad vram size:
> 0x86800800 [    2.746093] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
> [    2.746093] [drm] RAM width 64bits GDDR5
> [    2.750000] [drm] amdgpu: 2048M of VRAM memory ready
> [    2.750000] [drm] amdgpu: 3072M of GTT memory ready.
> [    2.750000] [drm] GART: num cpu pages 65536, num gpu pages 262144
> [    2.750000] [drm] Supports vblank timestamp caching Rev 2
> (21.10.2013). [    2.750000] [drm] Driver supports precise vblank
> timestamp query. [    2.750000] [drm] Internal thermal controller with
> fan control [    2.750000] [drm] amdgpu: dpm initialized
> [    2.750000] [drm] amdgpu atom DIG backlight initialized
> [    2.750000] [drm] AMDGPU Display Connectors
> [    2.750000] [drm] Connector 0:
> [    2.750000] [drm]   DP-1
> [    2.750000] [drm]   HPD2
> [    2.750000] [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952
> 0x1953 0x1953 [    2.750000] [drm]   Encoders:
> [    2.750000] [drm]     LCD1: INTERNAL_UNIPHY
> [    2.750000] [drm] Connector 1:
> [    2.750000] [drm]   HDMI-A-1
> [    2.750000] [drm]   HPD1
> [    2.750000] [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e
> 0x194f 0x194f [    2.750000] [drm]   Encoders:
> [    2.750000] [drm]     DFP1: INTERNAL_UNIPHY
> [    2.753906] [drm] PCIE gen 2 link speeds already enabled
> [    3.507812] [drm] fb mappable at 0x503E4000
> [    3.507812] [drm] vram apper at 0x50000000
> [    3.507812] [drm] size 8306688
> [    3.507812] [drm] fb depth is 24
> [    3.507812] [drm]    pitch is 7680
> [    4.632812] amdgpu 0000:05:00.0: fb0: amdgpudrmfb frame buffer device
> [    5.023437] [drm] Initialized amdgpu 3.27.0 20150101 for
> 0000:05:00.0 on minor 0
>
>
> Qiang Ma
>
> > Christian.
> >
> > >
> > > Alex
> > >
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>> Qiang Ma
> > >>>
> > >>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> > >>>>> ---
> > >>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
> > >>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
> > >>>>>     2 files changed, 19 insertions(+), 5 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> > >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
> > >>>>> 23b478639921..3703695f7789 100644 ---
> > >>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
> > >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@
> > >>>>> static int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
> > >>>>>      adev->gmc.vram_width =3D numchan * chansize;
> > >>>>>      /* size in MB on si */
> > >>>>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> > >>>>> 1024ULL * 1024ULL;
> > >>>>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> > >>>>> 1024ULL * 1024ULL;
> > >>>>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> > >>>>> +   /* some boards may have garbage in the upper 16 bits */
> > >>>>> +   if (tmp & 0xffff0000) {
> > >>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> > >>>>> +           if (tmp & 0xffff)
> > >>>>> +                   tmp &=3D 0xffff;
> > >>>>> +   }
> > >>>>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> > >>>>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> > >>>>>
> > >>>>>      if (!(adev->flags & AMD_IS_APU)) {
> > >>>>>              r =3D amdgpu_device_resize_fb_bar(adev);
> > >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> > >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
> > >>>>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
> > >>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
> > >>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
> > >>>>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev)
> > >>>>> static int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
> > >>>>>      int r;
> > >>>>> +   u32 tmp;
> > >>>>>
> > >>>>>      adev->gmc.vram_width =3D
> > >>>>> amdgpu_atombios_get_vram_width(adev); if
> > >>>>> (!adev->gmc.vram_width) {
> > >>>>> -           u32 tmp;
> > >>>>>              int chansize, numchan;
> > >>>>>
> > >>>>>              /* Get VRAM informations */
> > >>>>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
> > >>>>> amdgpu_device *adev) adev->gmc.vram_width =3D numchan * chansize;
> > >>>>>      }
> > >>>>>      /* size in MB on si */
> > >>>>> -   adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> > >>>>> 1024ULL * 1024ULL;
> > >>>>> -   adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> > >>>>> 1024ULL * 1024ULL;
> > >>>>> +   tmp =3D RREG32(mmCONFIG_MEMSIZE);
> > >>>>> +   /* some boards may have garbage in the upper 16 bits */
> > >>>>> +   if (tmp & 0xffff0000) {
> > >>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
> > >>>>> +           if (tmp & 0xffff)
> > >>>>> +                   tmp &=3D 0xffff;
> > >>>>> +   }
> > >>>>> +   adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> > >>>>> +   adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> > >>>>>
> > >>>>>      if (!(adev->flags & AMD_IS_APU)) {
> > >>>>>              r =3D amdgpu_device_resize_fb_bar(adev);
> >
> >
>
