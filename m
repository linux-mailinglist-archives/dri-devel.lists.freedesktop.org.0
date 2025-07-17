Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC77EB0876E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 10:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0348010E7EA;
	Thu, 17 Jul 2025 08:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="buQkCMZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DB710E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752739212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1Nz6VryXPk7mYLTTYghc42iB4MvgqJDw6Wknewy1nzE=;
 b=buQkCMZCAfBZm6ItPLcJZzsbqFNxNsYBRZ7D3GoFGz+P4MRCgYobSDkLzvxvAQO6VjVXUx
 BueuOGl7R4ewxRwHNx4NES8LtZic1jkJuCd3rIaZYoFdj1W6NsYcnh3q2s11HRfX9MjLaI
 z37Erx7vH5BAcQueoJydBsi4QOUfJws=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-UdyA7GldNNSJF1Ioh_eqUw-1; Thu, 17 Jul 2025 04:00:08 -0400
X-MC-Unique: UdyA7GldNNSJF1Ioh_eqUw-1
X-Mimecast-MFC-AGG-ID: UdyA7GldNNSJF1Ioh_eqUw_1752739207
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4561dfd07bcso3749345e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 01:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752739207; x=1753344007;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Nz6VryXPk7mYLTTYghc42iB4MvgqJDw6Wknewy1nzE=;
 b=kqoyXdCbWJk46oy+taFECyM9LOuaAx+MipyeZw3BnmHh1kda9+yyTw6e5MC+zF67Jl
 A9REXS5ysu3F+J/5X4TwRP+WHLmr4KrhFzCkSJyUg1A55Z94XHzC5bXZr9+d9zzWop5M
 UCnYe3CPSxjisQH4VflQj3S4GgOjMVrz0Rg4+IZryrel+kx5dPXVgXBv3njRqxo5sp84
 0GVQElHDGTQ0tE3xuij33RLFCJiB2sprEMV3QMGPno4BoN/MgKDbPJArrOn8uJjCA29H
 iM84v1PBzxDRb4cQRXnKLfjyKhC+0eGguq4Pto6oP0d0OUBsCH7gBTWANdOAYsFMP1tP
 0iwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULBfVea/bVRoiiz5ruTVWEq/v8iovMlRLpFeFJmgFjASXwlZDbxRD7Pv9MPFkWDK31m/ixJgQJifQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr7U1gA4Esdf3/OtcZV9d3lh2Pz4cb1ItxHfiq5n7x6khJ2v8u
 iDGSij7gVN2dJ8RQvLeAbQOtjDEhmKuHSXqvALeC4LO5xT/95rxfgh2juwmi57mX4EAS87sdg3+
 dduNQxn+bZeAHY5nvpo8iZ29zd8+M1BvzFVmTwVUn/ihWKsgsZR9hmSSZWfTIGy44MoO2DA==
X-Gm-Gg: ASbGncvn0YU/NjUgDU0jghX6aROZdBkqzxiB8McbvC3jPZdg6Bc4qcKEQ7yaeXTc91s
 qsX5nWfHhV0ezvniH/Rs0Q3nQlfDANJxQRo5op5ccmk3nLPEeaZrYWyGk8qEnTFg1BhAifuvs6L
 vWD8xbLcbeTScrycZIbWBzf8e6BJolSAIwFj0NsJsmvTecRzbdgvs26CUMQM0MIWS5TwONFtLN7
 nYcL8bakOqkRLCLm5JZtcUpqL3YiWHe8V2DdonnsQyBwYtQJhhNRu8QoMTKgKgM3yCmP7+CB0HQ
 zpo82XaO0c4Uk2g=
X-Received: by 2002:a5d:5e8a:0:b0:3a8:38b4:1d55 with SMTP id
 ffacd0b85a97d-3b60e513793mr4090922f8f.28.1752739206606; 
 Thu, 17 Jul 2025 01:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEijnsEHJwhRy5cl/HWL8P5OXf8cAn4TAJgdTuk7azxyV09+sC1fhVAUSHZE0TyivIPVAjogw==
X-Received: by 2002:a5d:5e8a:0:b0:3a8:38b4:1d55 with SMTP id
 ffacd0b85a97d-3b60e513793mr4090850f8f.28.1752739205717; 
 Thu, 17 Jul 2025 01:00:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e81ccb4sm43247315e9.17.2025.07.17.01.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 01:00:04 -0700 (PDT)
Date: Thu, 17 Jul 2025 10:00:04 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20250717-efficient-kudu-of-fantasy-ff95e0@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lqu5s6cxqdvbpx3y"
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


--lqu5s6cxqdvbpx3y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

An extra drm-misc-next PR this time around because I've been asked to
make an exception to get the hibernation fixes for amdgpu in.

This will definitely be the last PR for 6.17 :)

Thanks,
Maxime

drm-misc-next-2025-07-17:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

- mode_config: Change fb_create prototype to pass the drm_format_info
  and avoid redundant lookups in drivers
- sched: kunit improvements, memory leak fixes, reset handling
  improvements
- tests: kunit EDID update

Driver Changes:

- amdgpu: Hibernation fixes, structure lifetime fixes
- nouveau: sched improvements
- sitronix: Add Sitronix ST7567 Support

- bridge:
  - Make connector available to bridge detect hook

- panel:
  - More refcounting changes
  - New panels: BOE NE14QDM
The following changes since commit fe69a391808404977b1f002a6e7447de3de7a88e:

  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code (20=
25-07-10 10:16:50 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
5-07-17

for you to fetch changes up to 28c5c486380cc29e82b7747e999b3238f2887539:

  drm/amdgpu: Fix missing unlocking in an error path in amdgpu_userq_create=
() (2025-07-16 15:46:04 -0400)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

- mode_config: Change fb_create prototype to pass the drm_format_info
  and avoid redundant lookups in drivers
- sched: kunit improvements, memory leak fixes, reset handling
  improvements
- tests: kunit EDID update

Driver Changes:

- amdgpu: Hibernation fixes, structure lifetime fixes
- nouveau: sched improvements
- sitronix: Add Sitronix ST7567 Support

- bridge:
  - Make connector available to bridge detect hook

- panel:
  - More refcounting changes
  - New panels: BOE NE14QDM

----------------------------------------------------------------
Adri=E1n Larumbe (1):
      drm/panthor: Remove dead VM flushing code

Alice Ryhl (1):
      drm: rust: rename as_ref() to from_raw() for drm constructors

Andr=E9 Almeida (4):
      drm/doc: Fix title underline for "Task information"
      drm: Add missing struct drm_wedge_task_info kernel doc
      drm/doc: Fix grammar for "Task information"
      drm/amdgpu: Fix lifetime of struct amdgpu_task_info after ring reset

Andy Yan (3):
      drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter orde=
r with get_modes
      drm/bridge: Pass down connector to drm bridge detect hook
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Fix a compile error due =
to bridge->detect parameter changes

Anusha Srivatsa (14):
      drm/panel/lq101r1sx01: Use refcounted allocation in place of devm_kza=
lloc()
      drm/panel/raspberrypi: Use refcounted allocation in place of devm_kza=
lloc()
      drm/panel/vvx10f034n00: Use refcounted allocation in place of devm_kz=
alloc()
      drm/panel/osd101t2587-53ts: Use refcounted allocation in place of dev=
m_kzalloc()
      drm/panel/novatek-nt36672a: Use refcounted allocation in place of dev=
m_kzalloc()
      drm/panel/lg-sw43408: Use refcounted allocation in place of devm_kzal=
loc()
      drm/panel/kd097d04: Use refcounted allocation in place of devm_kzallo=
c()
      drm/panel/khadas-ts050: Use refcounted allocation in place of devm_kz=
alloc()
      drm/panel/jdi-lt070me05000: Use refcounted allocation in place of dev=
m_kzalloc()
      drm/panel/lpm102a188a: Use refcounted allocation in place of devm_kza=
lloc()
      drm/panel/ilitek-ili9882t: Use refcounted allocation in place of devm=
_kzalloc()
      drm/panel/himax-hx83102: Use refcounted allocation in place of devm_k=
zalloc()
      drm/panel/boe-tv101wum-nl6: Use refcounted allocation in place of dev=
m_kzalloc()
      drm/panel/boe-himax8279d: Use refcounted allocation in place of devm_=
kzalloc()

Christian K=F6nig (2):
      drm/ttm: fix locking in test ttm_bo_validate_no_placement_signaled
      drm/ttm: remove ttm_bo_validate_swapout test

Christophe JAILLET (1):
      drm/amdgpu: Fix missing unlocking in an error path in amdgpu_userq_cr=
eate()

Dale Whinham (1):
      dt-bindings: display: panel: samsung,atna30dw01: document ATNA30DW01

Diederik de Haas (1):
      dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells

Javier Martinez Canillas (5):
      drm/sitronix/st7571-i2c: Fix encoder callbacks function names
      drm/sitronix/st7571-i2c: Log probe deferral cause for GPIO get failure
      drm/sitronix/st7571-i2c: Add an indirection level to parse DT
      dt-bindings: display: Add Sitronix ST7567 LCD Controller
      drm/sitronix/st7571-i2c: Add support for the ST7567 Controller

Mario Limonciello (1):
      PM: hibernate: Add stub for pm_hibernate_is_recovering()

Maxime Ripard (3):
      drm/tests: edid: Fix monitor range limits
      drm/tests: edid: Update CTA-861 HDMI Vendor Specific Data Block
      drm/tests: edid: Add edid-decode --check output

Ma=EDra Canal (8):
      drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RE=
SET
      drm/sched: Allow drivers to skip the reset and keep on running
      drm/sched: Make timeout KUnit tests faster
      drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
      drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
      drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset

Philipp Stanner (7):
      drm/sched: Avoid memory leaks with cancel_job() callback
      drm/sched/tests: Implement cancel_job() callback
      drm/sched/tests: Add unit test for cancel_job()
      drm/sched: Warn if pending_list is not empty
      drm/nouveau: Make fence container helper usable driver-wide
      drm/nouveau: Add new callback for scheduler teardown
      drm/nouveau: Remove waitque for sched teardown

Samuel Zhang (5):
      drm/ttm: add new api ttm_device_prepare_hibernation()
      drm/amdgpu: move GTT to shmem after eviction for hibernation
      PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
      PM: hibernate: add new api pm_hibernate_is_recovering()
      drm/amdgpu: do not resume device in thaw for normal hibernation

Val Packett (1):
      drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455

Ville Syrj=E4l=E4 (19):
      drm: Pass pixel_format+modifier to .get_format_info()
      drm: Pass pixel_format+modifier directly to drm_get_format_info()
      drm: Look up the format info earlier
      drm: Pass the format info to .fb_create()
      drm: Allow the caller to pass in the format info to drm_helper_mode_f=
ill_fb_struct()
      drm/malidp: Pass along the format info from .fb_create() malidp_verif=
y_afbc_framebuffer_size()
      drm/gem: Pass along the format info from .fb_create() to drm_helper_m=
ode_fill_fb_struct()
      drm/gem/afbc: Eliminate redundant drm_get_format_info()
      drm/amdgpu: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/armada: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/exynos: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/gma500: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/i915: Pass along the format info from .fb_create() to drm_helper_=
mode_fill_fb_struct()
      drm/komeda: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/msm: Pass along the format info from .fb_create() to drm_helper_m=
ode_fill_fb_struct()
      drm/tegra: Pass along the format info from .fb_create() to drm_helper=
_mode_fill_fb_struct()
      drm/virtio: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm/vmwgfx: Pass along the format info from .fb_create() to drm_helpe=
r_mode_fill_fb_struct()
      drm: Make passing of format info to drm_helper_mode_fill_fb_struct() =
mandatory

 .../bindings/display/panel/samsung,atna33xc20.yaml |   2 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |   6 -
 .../bindings/display/sitronix,st7567.yaml          |  63 +++++++++
 Documentation/gpu/drm-uapi.rst                     |   6 +-
 MAINTAINERS                                        |   1 +
 drivers/accel/amdxdna/aie2_ctx.c                   |   2 +-
 drivers/base/power/main.c                          |  14 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  17 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |   2 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |   3 +-
 .../drm/arm/display/komeda/komeda_framebuffer.h    |   1 +
 drivers/gpu/drm/arm/malidp_drv.c                   |  12 +-
 drivers/gpu/drm/armada/armada_fb.c                 |  12 +-
 drivers/gpu/drm/armada/armada_fb.h                 |   4 +-
 drivers/gpu/drm/armada/armada_fbdev.c              |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  16 +--
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  12 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |   4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   2 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   3 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   2 +-
 drivers/gpu/drm/bridge/display-connector.c         |  11 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   3 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   2 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   6 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  15 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   5 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   3 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  14 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   5 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   3 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   8 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  20 +--
 drivers/gpu/drm/drm_bridge.c                       |   5 +-
 drivers/gpu/drm/drm_fourcc.c                       |  10 +-
 drivers/gpu/drm/drm_framebuffer.c                  |  27 ++--
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  42 +++---
 drivers/gpu/drm/drm_modeset_helper.c               |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |  14 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h             |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c          |   5 +-
 drivers/gpu/drm/gma500/fbdev.c                     |   5 +-
 drivers/gpu/drm/gma500/framebuffer.c               |  14 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   1 +
 drivers/gpu/drm/i915/display/intel_fb.c            |  20 +--
 drivers/gpu/drm/i915/display/intel_fb.h            |   5 +-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   3 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |   4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   5 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   8 +-
 drivers/gpu/drm/msm/dp/dp_audio.h                  |   8 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   3 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  10 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c              |   8 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   3 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  18 +--
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   9 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   6 +-
 drivers/gpu/drm/nouveau/nouveau_display.h          |   1 +
 drivers/gpu/drm/nouveau/nouveau_exec.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  35 +++--
 drivers/gpu/drm/nouveau/nouveau_fence.h            |   7 +
 drivers/gpu/drm/nouveau/nouveau_sched.c            |  37 +++---
 drivers/gpu/drm/nouveau/nouveau_sched.h            |   9 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   8 +-
 drivers/gpu/drm/omapdrm/omap_fb.c                  |  10 +-
 drivers/gpu/drm/omapdrm/omap_fb.h                  |   3 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |  11 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  10 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  10 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  10 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |  12 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  11 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  13 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  12 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |  10 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |  10 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  12 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |  12 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |  12 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |  11 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |  10 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  13 +-
 drivers/gpu/drm/panthor/panthor_mmu.h              |   1 -
 drivers/gpu/drm/panthor/panthor_sched.c            |   2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   3 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   3 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |   3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |   3 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c   |   3 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  14 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |  11 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  85 +++++++++---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |  75 +++++------
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |   2 +-
 drivers/gpu/drm/scheduler/tests/tests_basic.c      |  93 +++++++++++++-
 drivers/gpu/drm/sitronix/st7571-i2c.c              |  95 ++++++++++++--
 drivers/gpu/drm/tegra/drm.h                        |   2 +
 drivers/gpu/drm/tegra/fb.c                         |   7 +-
 drivers/gpu/drm/tegra/fbdev.c                      |   4 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |   1 +
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 142 ++++++++++++++---=
----
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |  60 +--------
 drivers/gpu/drm/ttm/ttm_device.c                   |  22 ++++
 drivers/gpu/drm/v3d/v3d_sched.c                    |  18 +--
 drivers/gpu/drm/vc4/vc4_kms.c                      |   3 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  15 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c        |   6 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |  14 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   3 +-
 include/drm/drm_bridge.h                           |  42 +++---
 include/drm/drm_device.h                           |   2 +
 include/drm/drm_fourcc.h                           |   3 +-
 include/drm/drm_gem_framebuffer_helper.h           |   6 +
 include/drm/drm_mode_config.h                      |   3 +-
 include/drm/drm_modeset_helper.h                   |   2 +
 include/drm/gpu_scheduler.h                        |  25 +++-
 include/drm/ttm/ttm_device.h                       |   1 +
 include/linux/suspend.h                            |   2 +
 kernel/power/hibernate.c                           |  26 ++++
 rust/kernel/drm/device.rs                          |   2 +-
 rust/kernel/drm/file.rs                            |   8 +-
 rust/kernel/drm/gem/mod.rs                         |  16 +--
 rust/kernel/drm/ioctl.rs                           |   4 +-
 152 files changed, 1106 insertions(+), 646 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st75=
67.yaml

--lqu5s6cxqdvbpx3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHithAAKCRAnX84Zoj2+
dmPJAYDBXUdANu50x/oLMfDJa2ONG06VDacScg/MXN0FLMRwkCN63Sko5Dx6ihQ0
nP5NRugBgKwffaDrq4VTYhmXtDI5QTx+C0u51jbR2tr/6jmPiSrLiMkDos5rhoBi
I5k6INWnWg==
=/JM3
-----END PGP SIGNATURE-----

--lqu5s6cxqdvbpx3y--

