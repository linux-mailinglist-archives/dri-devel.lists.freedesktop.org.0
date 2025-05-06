Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1217AAC90F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993E010E6C1;
	Tue,  6 May 2025 15:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lY6SsPvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198BF10E25A;
 Tue,  6 May 2025 15:05:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b07698318ebso624778a12.2; 
 Tue, 06 May 2025 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746543927; x=1747148727; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeYlbEYEwavza4UvF1lXEEZ0JxcIrbgVsspOdX27P4g=;
 b=lY6SsPvBbB5f57dRnu3sD4eQpxU98eVu0QwZWvZNFIbK10vFBtmiIA6a48T2neaDjZ
 ssJQvzhf/iRc+itsVmntcj+ji0SZgslE3OsV9BugPfa0Bnp2kIhLw/qNcsFZZQTFIzlk
 FkIY4393p1zEvYEi8KiS5CEwh6jzsOEOrSYmN64+5QN8tYcDeFEiG58IQVhGqLTkeAME
 twygOdZIHHJ9KFLyBpE24HMw9fZpWplgax0bLFByLjDg38HilMxxT+8HfeyWx3nl8qoX
 n5/wxUHVOnhPua1pI90qV+fE7qZUS+BF+h1qV7IsoPP39VACnNOayrsIjyqgANUV2omb
 PC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746543927; x=1747148727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeYlbEYEwavza4UvF1lXEEZ0JxcIrbgVsspOdX27P4g=;
 b=tqoe5FpY5Ey0o+FIvqEoYPDw4VdAr4spNbRAXCuONuVKMKarYjsvseX5gikBDbVkrl
 mYFYuyw/8pOGajDOmDHeUUJ6x7iYg5Uf2MH3TUcOMGFxVMsrCrTdhrAuu/XdZR4KKPYL
 Up1m9LPaujLXnj4ipuIPfhMj0QBjAKuTixRSyGEGdrAPraNoPdELmQulOOuzFaGIsJ7j
 tyXragh4k+8ViodbW9epSscJfcidmepThNv7lq1+H3M1cGhIjd0lScyvTtYaVrAXlp8D
 Wacp5/cNLmaU0U8dPF1+ouZW32GJTtxPxbSCVhVZk7MMslffM0AHJWMsIZeCGx5ZRgUN
 JRUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG3q2lbs2izOV/YiPWBIh8M9ROyNCfPfw6iZn7jGaQLO0sYCPUfKKt2WP3n64AporogmDlrxc0@lists.freedesktop.org,
 AJvYcCWtKrM+MsjnJW0fcb4kqcpZtLMnpcUtz3hLw7tbqLtZskwLitdLl245GgsETXcAtYtGzydmxUjOvzSv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGwBhcbdRclsaT/ovpVwyPAOypGnqtRtR6/HQ85ukcT1eMkX6l
 o0z0BMixJ4ELLN+rM5SCbgySAmOxL+3KZzz54tvQfR6Y3N4IU/bV6dyOq2UhEeYgLpuQf5w/ZJj
 ChpJ+d0vDYBM//kyH2eGmyscLWEE=
X-Gm-Gg: ASbGncsjktnXww1jM+yWTAXIfGKZUqwsFBJUFADAWNel/k/9xaeebzFP/tOfmm1BDG5
 OrNYB/fR/KXu2eYB2mhoiBJtWM2RpaO3EeqyQj7SnZLJbo5je1/Q+/X9J4y40JRuQMju466UJwy
 JgnzS/zMsUUzb1lTRR5mhLHA==
X-Google-Smtp-Source: AGHT+IGoR/1KNKu8t6FhcfkvG15adjneHBLuPet1jUD8RK6gXmMHJVwSbb0sxCBa3iS20c2BjnGa1dBq89e+BFUlqs0=
X-Received: by 2002:a17:902:e552:b0:223:5124:ee7f with SMTP id
 d9443c01a7336-22e103876aemr96861115ad.12.1746543927415; Tue, 06 May 2025
 08:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-248-sashal@kernel.org>
In-Reply-To: <20250505221419.2672473-248-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 May 2025 11:05:15 -0400
X-Gm-Features: ATxdqUG9foOxWfXm1xZFyjnjBCiu9l7qR46nlmJ4liwGbAsOLlF1aF7W238Y4Mg
Message-ID: <CADnq5_MfAFmbLeg+PAtWaFvY1G29ApTmMKwFq7etT35NvQWXHw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 248/642] drm/amdgpu: add dce_v6_0_soft_reset()
 to DCE6
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Alexandre Demers <alexandre.f.demers@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 sunil.khatri@amd.com, boyuan.zhang@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Mon, May 5, 2025 at 6:24=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Alexandre Demers <alexandre.f.demers@gmail.com>
>
> [ Upstream commit ab23db6d08efdda5d13d01a66c593d0e57f8917f ]
>
> DCE6 was missing soft reset, but it was easily identifiable under radeon.
> This should be it, pretty much as it is done under DCE8 and DCE10.
>
> Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This is not stable material.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 53 ++++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/dce_v6_0.c
> index 915804a6a1d7d..ed5e06b677df1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -370,13 +370,41 @@ static u32 dce_v6_0_hpd_get_gpio_reg(struct amdgpu_=
device *adev)
>         return mmDC_GPIO_HPD_A;
>  }
>
> +static bool dce_v6_0_is_display_hung(struct amdgpu_device *adev)
> +{
> +       u32 crtc_hung =3D 0;
> +       u32 crtc_status[6];
> +       u32 i, j, tmp;
> +
> +       for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> +               if (RREG32(mmCRTC_CONTROL + crtc_offsets[i]) & CRTC_CONTR=
OL__CRTC_MASTER_EN_MASK) {
> +                       crtc_status[i] =3D RREG32(mmCRTC_STATUS_HV_COUNT =
+ crtc_offsets[i]);
> +                       crtc_hung |=3D (1 << i);
> +               }
> +       }
> +
> +       for (j =3D 0; j < 10; j++) {
> +               for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> +                       if (crtc_hung & (1 << i)) {
> +                               tmp =3D RREG32(mmCRTC_STATUS_HV_COUNT + c=
rtc_offsets[i]);
> +                               if (tmp !=3D crtc_status[i])
> +                                       crtc_hung &=3D ~(1 << i);
> +                       }
> +               }
> +               if (crtc_hung =3D=3D 0)
> +                       return false;
> +               udelay(100);
> +       }
> +
> +       return true;
> +}
> +
>  static void dce_v6_0_set_vga_render_state(struct amdgpu_device *adev,
>                                           bool render)
>  {
>         if (!render)
>                 WREG32(mmVGA_RENDER_CONTROL,
>                         RREG32(mmVGA_RENDER_CONTROL) & VGA_VSTATUS_CNTL);
> -
>  }
>
>  static int dce_v6_0_get_num_crtc(struct amdgpu_device *adev)
> @@ -2872,7 +2900,28 @@ static bool dce_v6_0_is_idle(void *handle)
>
>  static int dce_v6_0_soft_reset(struct amdgpu_ip_block *ip_block)
>  {
> -       DRM_INFO("xxxx: dce_v6_0_soft_reset --- no impl!!\n");
> +       u32 srbm_soft_reset =3D 0, tmp;
> +       struct amdgpu_device *adev =3D ip_block->adev;
> +
> +       if (dce_v6_0_is_display_hung(adev))
> +               srbm_soft_reset |=3D SRBM_SOFT_RESET__SOFT_RESET_DC_MASK;
> +
> +       if (srbm_soft_reset) {
> +               tmp =3D RREG32(mmSRBM_SOFT_RESET);
> +               tmp |=3D srbm_soft_reset;
> +               dev_info(adev->dev, "SRBM_SOFT_RESET=3D0x%08X\n", tmp);
> +               WREG32(mmSRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32(mmSRBM_SOFT_RESET);
> +
> +               udelay(50);
> +
> +               tmp &=3D ~srbm_soft_reset;
> +               WREG32(mmSRBM_SOFT_RESET, tmp);
> +               tmp =3D RREG32(mmSRBM_SOFT_RESET);
> +
> +               /* Wait a little for things to settle down */
> +               udelay(50);
> +       }
>         return 0;
>  }
>
> --
> 2.39.5
>
