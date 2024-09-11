Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D843975979
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597B10E7BC;
	Wed, 11 Sep 2024 17:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rb/UUYNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C410E09F;
 Wed, 11 Sep 2024 17:34:26 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-718e65590easo1314b3a.3; 
 Wed, 11 Sep 2024 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726076066; x=1726680866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8Hs3sP0IaWm8QtSoZF4bycUgTm7RYb8rZnwj5x6l28=;
 b=Rb/UUYNYjDvmW7NWX8a0wSNKgM3zYV/45wVWAYB3SVfkLt7PVlL0GG/qIZBJFiPQBR
 bUVzDIqp/lEWT9ADd5EApLSufgdiSaez6FKcyJYjOEW8z95yHnYHa6C4eNEsXBwNwRSt
 kNRSebgjK9YD9TqwT5IGvgj3lJPweI0TWvFf+esJKQnY6a53cjn38QmMTrFLwesIjQfi
 31LyvMfnoHxIG54JJYzfjydWTHRVkKQriyMrHUWNQHmqb/4VjvC6/6l4L+Lim+lvyvxq
 mMjL5S6aVTL2U8J1NEXCTvk7gKzSu/vandWeqlEilbApYzKlT6KIgNVQ12et35b24/Ac
 GsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726076066; x=1726680866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8Hs3sP0IaWm8QtSoZF4bycUgTm7RYb8rZnwj5x6l28=;
 b=aV+DRXzedZwOqOdVQLA+nbvxQ9fQi32KozpbME4NcuMbIBK0PwoYGklJ6rNkef2gki
 UWHi7aZYD503blTgEnUQuYURVWZDTORRWGR1jRQiQ2+WnZbT9frO+UQehuWKie6KhvGB
 6GunNpDNtUEnZi3oulkjqo+D1Nw17QG56+gCcJYXmdyDLQm9il+h9+yRUCb7AngT8osG
 EXIZmNdSdqugTb5ZrwOzScAMGUpqBfBp5nwv8ayFHaKHeBQDQDsHyz4B4l7ZFl8QumrL
 +XxG/0aEPMN3AODRp/toEde6Gl53+RAZD8zAy/btO5tloo6/kCm2ZtNibZiPhCMdy84D
 SPFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU/KLCEk4dRKcO+2sS/vbIkE8IZG3UEphousim83MdoK0SY2tiQzSw035kTDuk2y3zCQuecttV@lists.freedesktop.org,
 AJvYcCVi/Y0IrljDJBmR7mckzfJyilrXtW32eTr07QSU+yyXeo2Qay5viHEgmIVxqfczgEwyBNS10fYPFl8u@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY4eoQ3sMbq3HsExZGqG85ie43M+NErLCK35+4mkgRFuHs/8Jk
 hTZOcS0ESdWRdCW2t62z2w1pJQCT0J77dY+7ChMBSdb5XOw2gAtJwTUGm8Skuyu+iKQZh41yHyY
 14raFjk763P80PBxenyi5IDOQM/Q=
X-Google-Smtp-Source: AGHT+IEsHfx9RR9F1XpDKtrYe/P98LpItY1guYFun3MnIcCzCN4FO0QecDfQI2YOMVrjCp8APNdhPGll9ns6GE+FNWM=
X-Received: by 2002:a05:6a00:2d05:b0:718:e49f:137a with SMTP id
 d2e1a72fcca58-71926339ea9mr80244b3a.6.1726076065587; Wed, 11 Sep 2024
 10:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240911042738.3886250-1-yanzhen@vivo.com>
 <024a5eb1-0255-483f-9674-dba431c01593@amd.com>
In-Reply-To: <024a5eb1-0255-483f-9674-dba431c01593@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Sep 2024 13:34:13 -0400
Message-ID: <CADnq5_O0FCHksdf37X+RxJ56SEDj9DBB3e20xft6CY8vkLGjQw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amdgpu: fix typo in the comment
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yan Zhen <yanzhen@vivo.com>, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

Applied.  Thanks!

On Wed, Sep 11, 2024 at 2:58=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 11.09.24 um 06:27 schrieb Yan Zhen:
> > Correctly spelled comments make it easier for the reader to understand
> > the code.
> >
> > Replace 'udpate' with 'update' in the comment &
> > replace 'recieved' with 'received' in the comment &
> > replace 'dsiable' with 'disable' in the comment &
> > replace 'Initiailize' with 'Initialize' in the comment &
> > replace 'disble' with 'disable' in the comment &
> > replace 'Disbale' with 'Disable' in the comment &
> > replace 'enogh' with 'enough' in the comment &
> > replace 'availabe' with 'available' in the comment.
> >
> > Signed-off-by: Yan Zhen <yanzhen@vivo.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/imu_v11_0.c  | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c  | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c | 2 +-
> >   8 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_aca.c
> > index 57bda66e8..2ca127173 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
> > @@ -511,7 +511,7 @@ static int __aca_get_error_data(struct amdgpu_devic=
e *adev, struct aca_handle *h
> >               return -EINVAL;
> >       }
> >
> > -     /* udpate aca bank to aca source error_cache first */
> > +     /* update aca bank to aca source error_cache first */
> >       ret =3D aca_banks_update(adev, smu_type, handler_aca_log_bank_err=
or, qctx, NULL);
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_psp.c
> > index 189574d53..e9e599ff3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> > @@ -2853,7 +2853,7 @@ static int psp_load_non_psp_fw(struct psp_context=
 *psp)
> >               if (ret)
> >                       return ret;
> >
> > -             /* Start rlc autoload after psp recieved all the gfx firm=
ware */
> > +             /* Start rlc autoload after psp received all the gfx firm=
ware */
> >               if (psp->autoload_supported && ucode->ucode_id =3D=3D (am=
dgpu_sriov_vf(adev) ?
> >                   adev->virt.autoload_ucode_id : AMDGPU_UCODE_ID_RLC_G)=
) {
> >                       ret =3D psp_rlc_autoload_start(psp);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ras.c
> > index 61a2f386d..71069b198 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -882,7 +882,7 @@ int amdgpu_ras_feature_enable_on_boot(struct amdgpu=
_device *adev,
> >                       if (ret)
> >                               return ret;
> >
> > -                     /* gfx block ras dsiable cmd must send to ras-ta =
*/
> > +                     /* gfx block ras disable cmd must send to ras-ta =
*/
> >                       if (head->block =3D=3D AMDGPU_RAS_BLOCK__GFX)
> >                               con->features |=3D BIT(head->block);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index b8bc7fa8c..74adb983a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1970,7 +1970,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
> >       DRM_INFO("amdgpu: %uM of GTT memory ready.\n",
> >                (unsigned int)(gtt_size / (1024 * 1024)));
> >
> > -     /* Initiailize doorbell pool on PCI BAR */
> > +     /* Initialize doorbell pool on PCI BAR */
> >       r =3D amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_DOORBELL, adev->doo=
rbell.size / PAGE_SIZE);
> >       if (r) {
> >               DRM_ERROR("Failed initializing doorbell heap.\n");
> > diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/a=
md/amdgpu/imu_v11_0.c
> > index 6c1891889..d4f72e47a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> > @@ -153,7 +153,7 @@ static void imu_v11_0_setup(struct amdgpu_device *a=
dev)
> >               WREG32_SOC15(GC, 0, regGFX_IMU_C2PMSG_16, imu_reg_val);
> >       }
> >
> > -     //disble imu Rtavfs, SmsRepair, DfllBTC, and ClkB
> > +     //disable imu Rtavfs, SmsRepair, DfllBTC, and ClkB
> >       imu_reg_val =3D RREG32_SOC15(GC, 0, regGFX_IMU_SCRATCH_10);
> >       imu_reg_val |=3D 0x10007;
> >       WREG32_SOC15(GC, 0, regGFX_IMU_SCRATCH_10, imu_reg_val);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/a=
md/amdgpu/nbio_v2_3.c
> > index fa479dfa1..739fce4fa 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> > @@ -365,7 +365,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_dev=
ice *adev,
> >
> >               data &=3D ~PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
> >       } else {
> > -             /* Disbale ASPM L1 */
> > +             /* Disable ASPM L1 */
> >               data &=3D ~PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK;
> >               /* Disable ASPM TxL0s */
> >               data &=3D ~PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/a=
md/amdgpu/sdma_v3_0.c
> > index aa637541d..e65194fe9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> > @@ -710,7 +710,7 @@ static int sdma_v3_0_gfx_resume(struct amdgpu_devic=
e *adev)
> >                      upper_32_bits(wptr_gpu_addr));
> >               wptr_poll_cntl =3D RREG32(mmSDMA0_GFX_RB_WPTR_POLL_CNTL +=
 sdma_offsets[i]);
> >               if (ring->use_pollmem) {
> > -                     /*wptr polling is not enogh fast, directly clean =
the wptr register */
> > +                     /*wptr polling is not enough fast, directly clean=
 the wptr register */
> >                       WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], 0);
> >                       wptr_poll_cntl =3D REG_SET_FIELD(wptr_poll_cntl,
> >                                                      SDMA0_GFX_RB_WPTR_=
POLL_CNTL,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c b/drivers/gpu/drm/=
amd/amdgpu/smuio_v9_0.c
> > index e4e30b9d4..c04fdd2d5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
> > @@ -60,7 +60,7 @@ static void smuio_v9_0_get_clock_gating_state(struct =
amdgpu_device *adev, u64 *f
> >   {
> >       u32 data;
> >
> > -     /* CGTT_ROM_CLK_CTRL0 is not availabe for APUs */
> > +     /* CGTT_ROM_CLK_CTRL0 is not available for APUs */
> >       if (adev->flags & AMD_IS_APU)
> >               return;
> >
>
