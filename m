Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079EFD24795
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 13:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0310E74E;
	Thu, 15 Jan 2026 12:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iFbpDF36";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iYFkLte7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6910E74E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768480172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=wp62IAblmjf2cdmiyyJKUfUX1geHsq0NaKyZVo0SXeY=;
 b=iFbpDF36i/Jw6iMg+E7ahMY2iTceUyy64A0if3u1f1yLs9lez9gCxc0jON0aUeSC5sxhbY
 e8/thr5y2HDu0mih5sJ7SMLmztcvG9Z5Gv+Gn+RsziyrlltCIsSFsorFOrjLRULFtpsqeL
 JhkpKrVBDR/CyRq3axkDtC3+RFbZaFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-dixhBftoMkeeKq1cF_hZog-1; Thu, 15 Jan 2026 07:29:29 -0500
X-MC-Unique: dixhBftoMkeeKq1cF_hZog-1
X-Mimecast-MFC-AGG-ID: dixhBftoMkeeKq1cF_hZog_1768480168
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso7846935e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 04:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1768480168; x=1769084968; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wp62IAblmjf2cdmiyyJKUfUX1geHsq0NaKyZVo0SXeY=;
 b=iYFkLte7uRXwV98kgAlng0OYRFpOOgzpUUP6xKTJQoHmpzWMP7KqENx5mNUT0eEgAu
 EA1Fo625yQNpfdInDbugG03TSGLKUPbsq/znKqrXvMLv9FomqMBEi5X8154KvX3QWpj2
 P25PUivhXb1+zHIokCk0GXwZlubXKcrCfnDU14h/RR5/6CH90vMd6csjqXQsYRSNFK0E
 JxyDp98uIlDc2Oc9CbrQGtRk1tASH+DckhYb+P7iVB4HFzNakhxvZLjjj3rz1ndxgoWr
 HcC+7ZDncatNLo45/DYCU2hfg9VVCMug997zU7MlYg3Z9tqFJN6W4DdGlxutUi4M4O74
 ywdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768480168; x=1769084968;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wp62IAblmjf2cdmiyyJKUfUX1geHsq0NaKyZVo0SXeY=;
 b=KMgPC53FALnxINaC50fyIjDW/H6R6RDgFUQQVGocxkjhntpv+B3HhNuX5/56bfVASt
 IvnusfUH+sJOtLV9mYc2EF0NWXTvwd8sEkWQcR0h74/HAbaldXFb5oxqNjevM3tlaJbX
 NbwZr3SRWFi+ZS3IvGaylxn8bsyzSWboxgpQfrl93XZT+h2eysyfeQ+bO8GAyYUcx4vn
 0XKWqzNcfL6hoL08ZZ9BHPr7hnEk2SuxapPd9hROF7FpxagcKouT7LBNL5enNljHG6Iz
 O72p8+6o7lVQd32cdAXf0hoKCSDYWhp3eEcSuR7oY93ZWuiPN3UP6msA86Vqox8AwuBG
 kqdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX79Kz8kZd3SKPTXhJxq+8qEQUvwAklB3tiXfqzYol2frPDTte8lPhoml96SPYFZvVQNGrHYI9YAfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeHgIm5zCWPArM1wJ3uLyong5Cd4GWgNdiehi6vkIyUX0yKeER
 OPuu5EDt1NQZxCTHroTLuEY/4WQGvAiPVatRv9sA361SZYX5IKpskl1QZCphT0LqhtXhsLyUqdj
 9WByTg+WAqbmRBXjqaf+KIZsCGPyEufGuJ6oaIh8CzSNCjlJtdeXFjwnZOUvATbtNWrqmHA==
X-Gm-Gg: AY/fxX68orULnoLB/dpb+R8v2lLrkwjuItwT237Q6doT4ZJTp2Vwt54kbRjgp1ukNX3
 8fL7oKMvmoTRtFDh62XqFKc+oM2XY1tb3B+9f9+qO7oY8oZqTPj7/o30HrPjqx244tzCw0ZGdB3
 R2MH8lojEhVpGoFdc25lhOHHA1JNpeupgP/tcHYBkCc2UliUUVECPVW7ueapqV211rSuEl5RsgJ
 HuGCwFEy7LIQp0Tl4/DrUQ1MNGihLggvDUw8YOHT3JOJj2JsV1T/rVpdv75JNwm+/weCQvmp4Kn
 YT7rWvuSEnoM3/VbjnAVC016FVjHdn+voorcEjPYLOMLSZzijrMvAoAPYmwz9g==
X-Received: by 2002:a05:600c:a406:b0:480:1d32:afc6 with SMTP id
 5b1f17b1804b1-4801d32b09fmr3466495e9.4.1768480167608; 
 Thu, 15 Jan 2026 04:29:27 -0800 (PST)
X-Received: by 2002:a05:600c:a406:b0:480:1d32:afc6 with SMTP id
 5b1f17b1804b1-4801d32b09fmr3466205e9.4.1768480167181; 
 Thu, 15 Jan 2026 04:29:27 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428e5488sm46529905e9.14.2026.01.15.04.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:29:26 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:25 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20260115-lilac-dragon-of-opposition-ac0a30@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ku7omxszsslfi5ud"
Content-Disposition: inline
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


--ku7omxszsslfi5ud
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2026-01-15:
drm-misc-next for 6.20:

Core Changes:

- atomic: Introduce Gamma/Degamma LUT size check
- gem: Fix a leak in drm_gem_get_unmapped_area
- gpuvm: API sanitation for Rust bindings
- panic: Few corner-cases fixes

Driver Changes:

- Replace system workqueue with percpu equivalent

- amdxdna: Update message buffer allocation requirements, Update
  firmware version check
- imagination: Add AM62P support
- ivpu: Implement warm boot flow
- rockchip: Get rid of atomic_check fixups, Add Rockchip RK3506 Support
- rocket: Cleanups

- bridge:
  - dw-hdmi-qp: Add support for HPD-less setups
- panel:
  - mantix: Various power management related improvements
  - new panels: Innolux G150XGE-L05,

- dma-buf:
  - cma: Call clear_page instead of memset
The following changes since commit 6a0b99e9fb45f403c3097a9047963d2dd5b0fab2:

  drm/etnaviv: Add module parameter to force PPU flop reset (2026-01-06 16:=
43:19 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
6-01-15

for you to fetch changes up to b36178488d479e9a53bbef2b01280378b5586e60:

  accel/amdxdna: Fix notifier_wq flushing warning (2026-01-14 09:07:33 -080=
0)

----------------------------------------------------------------
drm-misc-next for 6.20:

Core Changes:

- atomic: Introduce Gamma/Degamma LUT size check
- gem: Fix a leak in drm_gem_get_unmapped_area
- gpuvm: API sanitation for Rust bindings
- panic: Few corner-cases fixes

Driver Changes:

- Replace system workqueue with percpu equivalent

- amdxdna: Update message buffer allocation requirements, Update
  firmware version check
- imagination: Add AM62P support
- ivpu: Implement warm boot flow
- rockchip: Get rid of atomic_check fixups, Add Rockchip RK3506 Support
- rocket: Cleanups

- bridge:
  - dw-hdmi-qp: Add support for HPD-less setups
- panel:
  - mantix: Various power management related improvements
  - new panels: Innolux G150XGE-L05,

- dma-buf:
  - cma: Call clear_page instead of memset

----------------------------------------------------------------
Alice Ryhl (3):
      drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
      drm/gpuvm: use const for drm_gpuva_op_* ptrs
      drm/gpuvm: fix name in kernel doc of drm_gpuvm_bo_obtain_locked()

Arunpravin Paneer Selvam (1):
      MAINTAINERS: drm: add maintainers for DRM buddy allocator

Boris Brezillon (2):
      drm/gem: Fix a GEM leak in drm_gem_get_unmapped_area()
      drm/panfrost: Fix a page leak in panfrost_mmu_map_fault_addr() when T=
HP is on

Chaoyi Chen (5):
      dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
      dt-bindings: display: rockchip,vop: Add compatible for rk3506
      drm/rockchip: dsi: Add support for rk3506
      drm/rockchip: vop: Add support for rk3506
      drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP

Chris Morgan (2):
      dt-bindings: display: rockchip: Add no-hpd for dw-hdmi-qp controller
      drm/bridge: dw-hdmi-qp: Add support for missing HPD

Daniel Stone (8):
      drm/rockchip: vop2: Switch impossible format conditional to WARN_ON
      drm/rockchip: vop2: Switch impossible pos conditional to WARN_ON
      drm/rockchip: vop2: Fix Esmart test condition
      drm/rockchip: vop2: Enforce scaling workaround in plane_check
      drm/rockchip: vop2: Enforce AFBC source alignment in plane_check
      drm/rockchip: vop2: Enforce AFBC transform stride align in plane_check
      drm/rockchip: vop2: Use drm_is_afbc helper function
      drm/rockchip: vop2: Simplify format_mod_supported

Dmitry Baryshkov (3):
      drm/mode_object: add drm_object_immutable_property_get_value()
      drm/atomic: add max_size check to drm_property_replace_blob_from_id()
      drm/atomic: verify that gamma/degamma LUTs are not too big

Fabio Estevam (2):
      dt-bindings: display: simple: Add Innolux G150XGE-L05 panel
      drm/panel: simple: Add Innolux G150XGE-L05 panel entry

Geert Uytterhoeven (1):
      drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP

Johan Hovold (1):
      drm/tegra: dsi: fix device leak on probe

Karol Wachowski (1):
      accel/ivpu: Implement warm boot flow for NPU6 and unify boot handling

Langyan Ye (1):
      drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mo=
de

Linus Walleij (1):
      dma-buf: heaps: Clear CMA pages with clear_page()

Lizhi Hou (3):
      accel/amdxdna: Update message DMA buffer allocation
      accel/amdxdna: Update firmware version check for latest firmware
      accel/amdxdna: Fix notifier_wq flushing warning

Marco Crivellari (2):
      drm/rockchip: replace use of system_unbound_wq with system_dfl_wq
      drm/rockchip: replace use of system_wq with system_percpu_wq

Michael Walle (1):
      dt-bindings: gpu: img: Add AM62P SoC specific compatible

Nathan Chancellor (2):
      drm/panic: Ensure drm_panic_type is initialized to a valid value
      drm/panic: Fix expected string for QR_CODE in drm_panic_type_map

Nicolas Frattaroli (2):
      dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
      drm/panthor: Implement reading shader_present from nvmem

Quentin Schulz (3):
      accel/rocket: fix unwinding in error path in rocket_core_init
      accel/rocket: fix unwinding in error path in rocket_probe
      accel/rocket: factor out code with find_core_for_dev in rocket_remove

Randy Dunlap (1):
      accel/rocket: rocket_accel.h: fix kernel-doc warnings

Rob Herring (Arm) (1):
      dt-bindings: display: panel-simple: Allow "data-mapping" for "yes-opt=
oelectronics,ytc700tlag-05-201c"

Sebastian Krzyszkowiak (5):
      drm/panel: mantix: Enable DSI LPM
      drm/panel: mantix: Improve power on sequence timings
      drm/panel: mantix: Improve power off sequence
      drm/panel: mantix: Drop bank 9 initialization
      drm/panel: mantix: Don't turn on MIPI peripheral

Tuo Li (1):
      drm/panel: Fix a possible null-pointer dereference in jdi_panel_dsi_r=
emove()

Uwe Kleine-K=F6nig (2):
      host1x: Make remove callback return void
      host1x: Convert to bus methods

Vladimir Yakovlev (1):
      drm/panel: himax-hx83102: change to gpiod_set_value_cansleep

 .../bindings/display/panel/panel-simple.yaml       |   6 +-
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |   2 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       |   6 +
 .../bindings/display/rockchip/rockchip-vop.yaml    |   1 +
 .../bindings/gpu/arm,mali-valhall-csf.yaml         |  14 ++
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   2 +
 MAINTAINERS                                        |  11 ++
 drivers/accel/amdxdna/aie2_error.c                 |  10 +-
 drivers/accel/amdxdna/aie2_message.c               |  33 +++--
 drivers/accel/amdxdna/aie2_pci.c                   |  36 ++---
 drivers/accel/amdxdna/aie2_pci.h                   |  10 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.c            |   2 +-
 drivers/accel/amdxdna/npu1_regs.c                  |   6 +-
 drivers/accel/amdxdna/npu4_regs.c                  |  11 +-
 drivers/accel/amdxdna/npu5_regs.c                  |   2 -
 drivers/accel/amdxdna/npu6_regs.c                  |   2 -
 drivers/accel/ivpu/ivpu_debugfs.c                  |   4 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   4 +-
 drivers/accel/ivpu/ivpu_fw.c                       |  13 +-
 drivers/accel/ivpu/ivpu_fw.h                       |   9 +-
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |   6 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |  84 ++++++++----
 drivers/accel/ivpu/ivpu_hw_ip.h                    |   1 -
 drivers/accel/ivpu/ivpu_pm.c                       |  13 +-
 drivers/accel/ivpu/ivpu_pm.h                       |   1 -
 drivers/accel/rocket/rocket_core.c                 |   7 +-
 drivers/accel/rocket/rocket_drv.c                  |  30 ++--
 drivers/crypto/tegra/tegra-se-main.c               |   4 +-
 drivers/dma-buf/heaps/cma_heap.c                   |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  18 +--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  34 ++++-
 drivers/gpu/drm/drm_atomic_uapi.c                  |  32 +++--
 drivers/gpu/drm/drm_gem.c                          |  10 +-
 drivers/gpu/drm/drm_gpuvm.c                        |  26 ++--
 drivers/gpu/drm/drm_mode_object.c                  |  25 ++++
 drivers/gpu/drm/drm_panic.c                        |  11 +-
 drivers/gpu/drm/drm_property.c                     |  11 ++
 drivers/gpu/drm/imagination/pvr_vm.c               |   2 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   2 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  12 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      | 147 +++++++++++++++++=
+--
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |   4 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |  35 ++---
 drivers/gpu/drm/panel/panel-simple.c               |  29 ++++
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |  40 ++++--
 drivers/gpu/drm/panthor/panthor_hw.c               |  36 ++++-
 drivers/gpu/drm/rockchip/Kconfig                   |   4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  20 +++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 151 ++++++++++-------=
----
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  57 ++++++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        |  14 ++
 drivers/gpu/drm/tegra/drm.c                        |   4 +-
 drivers/gpu/drm/tegra/dsi.c                        |   6 +-
 drivers/gpu/drm/xe/xe_vm.c                         |   4 +-
 drivers/gpu/host1x/bus.c                           |  67 +++++----
 drivers/staging/media/tegra-video/video.c          |   4 +-
 include/drm/drm_gpuvm.h                            |  12 +-
 include/drm/drm_mode_object.h                      |   3 +
 include/drm/drm_property.h                         |   1 +
 include/linux/host1x.h                             |   2 +-
 include/uapi/drm/rocket_accel.h                    |  98 +++++++++----
 65 files changed, 882 insertions(+), 381 deletions(-)

--ku7omxszsslfi5ud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaWjdpQAKCRAnX84Zoj2+
dtZSAX9ncRrvIO3d6C+yogIMsrRZ0S1cKIli1Pbg8eBhbvNeLtlqB/h3gJrlsxxw
fYWgXAABf34PbReTTu+I/oRr4/nE9mzUucWccaWyhaHRvfNVthzK6A5rfADMigHn
OAMqSAKaLw==
=sm7n
-----END PGP SIGNATURE-----

--ku7omxszsslfi5ud--

