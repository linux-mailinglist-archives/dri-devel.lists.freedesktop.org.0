Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF878ACE97
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CCB112AF5;
	Mon, 22 Apr 2024 13:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 29886 seconds by postgrey-1.36 at gabe;
 Mon, 22 Apr 2024 13:45:07 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C848112AF5;
 Mon, 22 Apr 2024 13:45:06 +0000 (UTC)
X-QQ-mid: bizesmtpsz6t1713793491tn5a1gu
X-QQ-Originating-IP: 4T9vFwtcN5bxuKVyJbWNoCazsGTJce4anorEd6nw19M=
Received: from john-PC ( [123.114.60.34]) by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 22 Apr 2024 21:44:48 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: TxLxcJtIk++bAQsC+7kYDxGgt3lLYoKlJnOLtIMzDcO0Iriok2aBG9QN2pBfi
 LgZDfkJs6Q13EeO5ul+C1abhuuv5Cnf26b7STHZ35jLbjInDsCKgvJPRocX5o8TI3UngAdr
 NYKQ1wdA/VFOR4QlWz/ibm7GWPGXvH6y+uoPNJq9wWcXKOrbPMh9HLHmkMBqLxxuHiX5Dk8
 qfnDosogiJqEPf43tQN7faSqfabqkL980q6gdeSefosXjn9lKCnromtz+RnKOM+/RFJ7eIx
 T85e4sp+VVVdOsNYLd6mT7TWa2zUfP1AlngWgLeTE+Jm/Uj9SJ6YSrzIGw8V5lLNl2/3Bpj
 VOQNr6E1GpfR45nCdCCJDzrmw2MwgiUX4kmWRMlkYZdBOah/HuA0hGkqpZnDTnAf86DzP64
 9C7Hw976CtmHPt88OeQEz9cBrn37R36R
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12248589611114575822
Date: Mon, 22 Apr 2024 21:44:47 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 Arunpravin.PaneerSelvam@amd.com, le.ma@amd.com, Felix.Kuehling@amd.com,
 mukul.joshi@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
Message-ID: <2778C515DE59A537+20240422214447.231a09de@john-PC>
In-Reply-To: <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
 <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

On Mon, 22 Apr 2024 14:59:36 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 22.04.24 um 14:33 schrieb Qiang Ma:
> > On Mon, 22 Apr 2024 11:40:26 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Am 22.04.24 um 07:26 schrieb Qiang Ma: =20
> >>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
> >>> garbage in the upper 16 bits of the vram size register,
> >>> kern log as follows:
> >>>
> >>> [    6.000000] [drm] Detected VRAM RAM=3D2256537600M, BAR=3D256M
> >>> [    6.007812] [drm] RAM width 64bits GDDR5
> >>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
> >>>
> >>> This is obviously not true, check for this and clamp the size
> >>> properly. Fixes boards reporting bogus amounts of vram,
> >>> kern log as follows:
> >>>
> >>> [    2.789062] [drm] Probable bad vram size: 0x86800800
> >>> [    2.789062] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
> >>> [    2.789062] [drm] RAM width 64bits GDDR5
> >>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready =20
> >> Well we had patches like this one here before and so far we always
> >> rejected them.
> >>
> >> When the mmCONFIG_MEMSIZE register isn't properly initialized then
> >> there is something wrong with your hardware.
> >>
> >> Working around that in the software driver is not going to fly.
> >>
> >> Regards,
> >> Christian.
> >> =20
> > Hi Christian:
> > I see that two patches for this issue have been merged, and the
> > patches are as follows:
> >
> > 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
> > 0ca223b029a2 drm/radeon: fixup bad vram size on SI =20
>=20
> Mhm, I remember that we discussed reverting those but it looks like
> that never happened. I need to ask around internally.
>=20
> Question is do you see any other problems with the board? E.g.
> incorrect connector or harvesting configuration?
>=20
> Regards,
> Christian.
>=20

At present, no other problems have been found.
Configured as radeon driver, display is normal.=20
But this problem is found when I switch to amdgpu driver, and the
startup fails with black screen.
After add the patch, the startup was successful, display is normal.

Qiang Ma

> >
> > Qiang Ma
> > =20
> >>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
> >>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
> >>>    2 files changed, 19 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
> >>> 23b478639921..3703695f7789 100644 ---
> >>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@
> >>> static int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
> >>>    	adev->gmc.vram_width =3D numchan * chansize;
> >>>    	/* size in MB on si */
> >>> -	adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> -	adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> +	tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>> +	/* some boards may have garbage in the upper 16 bits */
> >>> +	if (tmp & 0xffff0000) {
> >>> +		DRM_INFO("Probable bad vram size: 0x%08x\n",
> >>> tmp);
> >>> +		if (tmp & 0xffff)
> >>> +			tmp &=3D 0xffff;
> >>> +	}
> >>> +	adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>> +	adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>   =20
> >>>    	if (!(adev->flags & AMD_IS_APU)) {
> >>>    		r =3D amdgpu_device_resize_fb_bar(adev);
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
> >>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
> >>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
> >>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
> >>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev) static
> >>> int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
> >>>    	int r;
> >>> +	u32 tmp;
> >>>   =20
> >>>    	adev->gmc.vram_width =3D
> >>> amdgpu_atombios_get_vram_width(adev); if (!adev->gmc.vram_width) {
> >>> -		u32 tmp;
> >>>    		int chansize, numchan;
> >>>   =20
> >>>    		/* Get VRAM informations */
> >>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
> >>> amdgpu_device *adev) adev->gmc.vram_width =3D numchan * chansize;
> >>>    	}
> >>>    	/* size in MB on si */
> >>> -	adev->gmc.mc_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> -	adev->gmc.real_vram_size =3D RREG32(mmCONFIG_MEMSIZE) *
> >>> 1024ULL * 1024ULL;
> >>> +	tmp =3D RREG32(mmCONFIG_MEMSIZE);
> >>> +	/* some boards may have garbage in the upper 16 bits */
> >>> +	if (tmp & 0xffff0000) {
> >>> +		DRM_INFO("Probable bad vram size: 0x%08x\n",
> >>> tmp);
> >>> +		if (tmp & 0xffff)
> >>> +			tmp &=3D 0xffff;
> >>> +	}
> >>> +	adev->gmc.mc_vram_size =3D tmp * 1024ULL * 1024ULL;
> >>> +	adev->gmc.real_vram_size =3D adev->gmc.mc_vram_size;
> >>>   =20
> >>>    	if (!(adev->flags & AMD_IS_APU)) {
> >>>    		r =3D amdgpu_device_resize_fb_bar(adev); =20
> >> =20
>=20
>=20

