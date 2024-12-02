Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42859E0DD9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 22:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C68810E85A;
	Mon,  2 Dec 2024 21:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E44KHE2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E522B10E85D;
 Mon,  2 Dec 2024 21:28:31 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-725471754c8so442969b3a.0; 
 Mon, 02 Dec 2024 13:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733174911; x=1733779711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+WnEN01ItTNuqqGVkEXPBp2mNHCCggqDABZD+PVrHmg=;
 b=E44KHE2lELz7yc3+jejA0/0D4IcD52py5d+3hzuvOrk4u9RCZxxqgyABJsxJ4ejLF3
 bC9ATRr2zvhbkQiZb6kwI9zgPdeGX+V1awBKkZevXzll7c4tO5/4VSQ9NDRFyka87+hL
 oxCeLdLa+cAagHleIynVFKXgaLI5CKlT2x7zedb817vDQNR0iSmZ0nLTcjfLMreL6CGE
 L3fpu8vNby79aW+ZgO0JLSFJXkHEst7AB+x9zcht9E+ZT1jFtWNfupVMwTDnN4/YLCnb
 OAWy4LyTLdz4QFl2v945wzKg+hfPBaoMC7tScO0pihUD9LYIVYwslgVZ6X52KMYAQIos
 SXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733174911; x=1733779711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+WnEN01ItTNuqqGVkEXPBp2mNHCCggqDABZD+PVrHmg=;
 b=QAf3x6diBbGNogrvs0wYWh9yIO1wEY2s0Pi6Fw3efaZHMwQ7ub5NMIismGhGIr7muG
 UpbidChm8hJaYFgA2/5mVVna3dEdYtwe+FdfU4+BqJ0MM9qw1E6vq5QkuznJqZJsk3zA
 EAA/KWc38XONuL2U94QOINHa0QpA0w/F7VnKYft5HyXAmJNKMHTXvWFm2UGss8sTSqRR
 C606Ej9zrM6EsPS+suDPnl3Y8koLWMscWiZ07TNtMB/i7Qu2UYgNFQA9wRgNMwCrP6MD
 FKEd2tKPQ+1E1MZ0lfjjNUT6eskdTttW6w98Xk+FZoQEmL4kHbYLI37FATfPnuKvg2KR
 Cu8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWXrAkmMFJwGcg136yVB0y7KVyLPFXpyil8JcasFb99bdTao1OAOIEHA6oTz8I2x12M1Q/hSi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Y3zS2rhY8l2fVqz8XC7mKe/9rN6SVHk8zwDnZapPlamecgkH
 xl64haYHWKuFS00aq+0Qv4eJ65amu3llxKT+MdBq6qKCIMzk4JconZIF5KBORSpmbxmKxdlm5Uv
 6mTcfeynK13BTuhFpygpRtrDqY3Y=
X-Gm-Gg: ASbGncvTCs23MfIBYTy/bhGT1jI7+x5zvcXwiP5qChkhmAdz8e+LpOTgQny54atWtCR
 j9qAdz8LyPfQu5Zy6Q1x7GvghfzKxBc0=
X-Google-Smtp-Source: AGHT+IENTvi17eLmoTLao53OArSVxtjhTmkVbWAWihP8AZl590AAM/Tco4GMyi0JDKe7LSzoG6FmWqIFPAh81cVOQA8=
X-Received: by 2002:a05:6a00:4296:b0:725:424b:e8f7 with SMTP id
 d2e1a72fcca58-725424be92bmr11538645b3a.2.1733174911368; Mon, 02 Dec 2024
 13:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20241128032056.371989-1-rdunlap@infradead.org>
In-Reply-To: <20241128032056.371989-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Dec 2024 16:28:19 -0500
Message-ID: <CADnq5_MEFsFhLAipChNR2o78_A4WVghh4p-E5NyEFkGr6j3e7g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: device: fix spellos and punctuation
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Nov 27, 2024 at 11:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Make spelling and punctuation changes to ease reading of the comments.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> --- linux-next-20241125.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ linux-next-20241125/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -204,9 +204,9 @@ static inline void amdgpu_device_stop_pe
>   * DOC: pcie_replay_count
>   *
>   * The amdgpu driver provides a sysfs API for reporting the total number
> - * of PCIe replays (NAKs)
> + * of PCIe replays (NAKs).
>   * The file pcie_replay_count is used for this and returns the total
> - * number of replays as a sum of the NAKs generated and NAKs received
> + * number of replays as a sum of the NAKs generated and NAKs received.
>   */
>
>  static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
> @@ -429,8 +429,8 @@ bool amdgpu_device_supports_boco(struct
>   * @dev: drm_device pointer
>   *
>   * Return:
> - * 1 if the device supporte BACO;
> - * 3 if the device support MACO (only works if BACO is supported)
> + * 1 if the device supports BACO;
> + * 3 if the device supports MACO (only works if BACO is supported)
>   * otherwise return 0.
>   */
>  int amdgpu_device_supports_baco(struct drm_device *dev)
> @@ -577,7 +577,7 @@ void amdgpu_device_mm_access(struct amdg
>  }
>
>  /**
> - * amdgpu_device_aper_access - access vram by vram aperature
> + * amdgpu_device_aper_access - access vram by vram aperture
>   *
>   * @adev: amdgpu_device pointer
>   * @pos: offset of the buffer in vram
> @@ -668,7 +668,7 @@ bool amdgpu_device_skip_hw_access(struct
>          * here is that the GPU reset is not running on another thread in=
 parallel.
>          *
>          * For this we trylock the read side of the reset semaphore, if t=
hat succeeds
> -        * we know that the reset is not running in paralell.
> +        * we know that the reset is not running in parallel.
>          *
>          * If the trylock fails we assert that we are either already hold=
ing the read
>          * side of the lock or are the reset thread itself and hold the w=
rite side of
> @@ -1733,7 +1733,7 @@ bool amdgpu_device_need_post(struct amdg
>                         uint32_t fw_ver;
>
>                         err =3D request_firmware(&adev->pm.fw, "amdgpu/fi=
ji_smc.bin", adev->dev);
> -                       /* force vPost if error occured */
> +                       /* force vPost if error occurred */
>                         if (err)
>                                 return true;
>
> @@ -2378,7 +2378,7 @@ int amdgpu_device_ip_block_add(struct am
>   * the module parameter virtual_display.  This feature provides a virtua=
l
>   * display hardware on headless boards or in virtualized environments.
>   * This function parses and validates the configuration string specified=
 by
> - * the user and configues the virtual display configuration (number of
> + * the user and configures the virtual display configuration (number of
>   * virtual connectors, crtcs, etc.) specified.
>   */
>  static void amdgpu_device_enable_virtual_display(struct amdgpu_device *a=
dev)
> @@ -2441,7 +2441,7 @@ void amdgpu_device_set_sriov_virtual_dis
>   * @adev: amdgpu_device pointer
>   *
>   * Parses the asic configuration parameters specified in the gpu info
> - * firmware and makes them availale to the driver for use in configuring
> + * firmware and makes them available to the driver for use in configurin=
g
>   * the asic.
>   * Returns 0 on success, -EINVAL on failure.
>   */
> @@ -2501,7 +2501,7 @@ static int amdgpu_device_parse_gpu_info_
>                                                                 le32_to_c=
pu(hdr->header.ucode_array_offset_bytes));
>
>                 /*
> -                * Should be droped when DAL no longer needs it.
> +                * Should be dropped when DAL no longer needs it.
>                  */
>                 if (adev->asic_type =3D=3D CHIP_NAVI12)
>                         goto parse_soc_bounding_box;
> @@ -3061,7 +3061,7 @@ init_failed:
>   *
>   * Writes a reset magic value to the gart pointer in VRAM.  The driver c=
alls
>   * this function before a GPU reset.  If the value is retained after a
> - * GPU reset, VRAM has not been lost.  Some GPU resets may destry VRAM c=
ontents.
> + * GPU reset, VRAM has not been lost. Some GPU resets may destroy VRAM c=
ontents.
>   */
>  static void amdgpu_device_fill_reset_magic(struct amdgpu_device *adev)
>  {
> @@ -3376,7 +3376,7 @@ static int amdgpu_device_ip_fini_early(s
>
>         amdgpu_amdkfd_suspend(adev, false);
>
> -       /* Workaroud for ASICs need to disable SMC first */
> +       /* Workaround for ASICs need to disable SMC first */
>         amdgpu_device_smu_fini_early(adev);
>
>         for (i =3D adev->num_ip_blocks - 1; i >=3D 0; i--) {
> @@ -4271,7 +4271,7 @@ int amdgpu_device_init(struct amdgpu_dev
>
>         /*
>          * Reset domain needs to be present early, before XGMI hive disco=
vered
> -        * (if any) and intitialized to use reset sem and in_gpu reset fl=
ag
> +        * (if any) and initialized to use reset sem and in_gpu reset fla=
g
>          * early on during init and before calling to RREG32.
>          */
>         adev->reset_domain =3D amdgpu_reset_create_reset_domain(SINGLE_DE=
VICE, "amdgpu-reset-dev");
> @@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amd
>                 amdgpu_amdkfd_pre_reset(tmp_adev, reset_context);
>
>                 /*
> -                * Mark these ASICs to be reseted as untracked first
> +                * Mark these ASICs to be reset as untracked first
>                  * And add them back after reset completed
>                  */
>                 amdgpu_unregister_gpu_instance(tmp_adev);
> @@ -6065,7 +6065,7 @@ static void amdgpu_device_partner_bandwi
>   *
>   * @adev: amdgpu_device pointer
>   *
> - * Fetchs and stores in the driver the PCIE capabilities (gen speed
> + * Fetches and stores in the driver the PCIE capabilities (gen speed
>   * and lanes) of the slot the device is in. Handles APUs and
>   * virtualized environments where PCIE config space may not be available=
.
>   */
