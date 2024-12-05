Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953F9E58A0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 15:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F129E10EE9E;
	Thu,  5 Dec 2024 14:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jJLHz54h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2919D10EE96
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733409517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nFYfURZj+AWBIbPOVOe3XvaBntFsd2FG5D8HsxK1p/A=;
 b=jJLHz54hIXtc04BK12VQ7mcdFP2Dg719SyemEUt/e/JdygQbc3OduJNOAsUcKuarg0SeJw
 CRDVY77jpunCgJus03E6Mg10YPB+x/8mcPaa37al96oBFkRuI6HwC98+muAdw+3wYARyWZ
 zfYrPOYb6yDUj4RqRDQgz3fRNn4+5r8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-GL0uYeXwMja_pJAHb7oE7w-1; Thu, 05 Dec 2024 09:38:32 -0500
X-MC-Unique: GL0uYeXwMja_pJAHb7oE7w-1
X-Mimecast-MFC-AGG-ID: GL0uYeXwMja_pJAHb7oE7w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4349eeeb841so7043365e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 06:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733409511; x=1734014311;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nFYfURZj+AWBIbPOVOe3XvaBntFsd2FG5D8HsxK1p/A=;
 b=O7+broib0ovNFRC6ng3/BPLLIZQlZ5gn4SXT3ooJyvq761e5qloX5fpYv5voBJszE0
 MJC9Ysaz0FwPpj3Qmpn7rdGfrxOAULN/1sW/A2ym/onrdRW1RMFe7fD5gbXbwprEcNNz
 2PAI7tIYgiBdNcNQfKNn+1J0HTCcBZ77M2yf2WUBlLoDlzWwnNOuLhk9KLRYgCQKeKsL
 fIu8CPyd6tgL0FZpcs8SQJNQu6WCwJFlfLHB55g76HVuxTWLpmqJe7I/kyBNEpMatD5r
 jGlGUr0B5NV6fh9WCRee/JIEjrIc65YTupa8H6WnGyovqsJl6vwmL+mt6L2R9trrvu0h
 ERzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTSVYEjfANdl7bFZK+Jnfo7zR/azIuSugwizqZWtzjJyd5r+IyATsZQIRmUnewUk6oUfCP8mfzrUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybZc5J9l5Csg3DbajdaYYBPRL0L5pFql9Iso377jqX4I09SNkX
 zNOO9EYsx1ynRwhgASUumrfediBzQ28+fOmCtqpxU4edVfkUvfDMZHIS1hfDvbie1ICWh7bBys9
 jvT20CvSgVmF6XmHlCJFZqZB8OTPWHnh0HwdQdpOSSHZCy3AX2p0JOCcwzHC/RI68Ag==
X-Gm-Gg: ASbGncubVjh/7iJd9itjbXsEnAodHNI4ZP7eOMDVGAseKuL/9joAwdtqrQsnjgcWC3W
 89dXHfKhOdVlyPW9ROgR9BTe8woQNuxesRovBQNoufAIdssSlrqTEClI6sHDhC9y1j01tICR5Bt
 5KWkrr9Z9axHGEa/2UJ3kHlF201lyCDe3UANaPCDeKG0UsSfA0mR4fZshCgp6EY5+21Ywoj1c22
 4gowUn8BwlFqCysSGwi7tyDmA==
X-Received: by 2002:a05:600c:1d05:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-434d0a1d6f9mr99142195e9.31.1733409510597; 
 Thu, 05 Dec 2024 06:38:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVvmOANt8Nohjlx7p5UManxqZsMg7j3YkLFbcjGC7JqpuDiUibwM+Kfy7Env11MN/ABQym7w==
X-Received: by 2002:a05:600c:1d05:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-434d0a1d6f9mr99141885e9.31.1733409510045; 
 Thu, 05 Dec 2024 06:38:30 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5280746sm63177315e9.21.2024.12.05.06.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 06:38:29 -0800 (PST)
Date: Thu, 5 Dec 2024 15:38:28 +0100
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
Message-ID: <20241205-agile-straight-pegasus-aca7f4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="srgopkubhdo2twmu"
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


--srgopkubhdo2twmu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi Dave, Sima,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2024-12-05:
drm-misc-next for 6.14:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Remove driver date from drm_driver

Driver Changes:
  - amdxdna: New driver!
  - ivpu: Fix qemu crash when using passthrough
  - nouveau: expose GSP-RM logging buffers via debugfs
  - panfrost: Add MT8188 Mali-G57 MC3 support
  - panthor: misc improvements,
  - rockchip: Gamma LUT support
  - tidss: Misc improvements
  - virtio: convert to helpers, add prime support for scanout buffers
  - v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
  - vc4: Add support for BCM2712
  - vkms: Improvements all across the board

  - panels:
    - Introduce backlight quirks infrastructure
    - New panels: KDB KD116N2130B12
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-12-05

for you to fetch changes up to cb2e1c2136f71618142557ceca3a8802e87a44cd:

  drm: remove driver date from struct drm_driver and all drivers (2024-12-0=
5 12:35:42 +0200)

----------------------------------------------------------------
drm-misc-next for 6.14:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - Remove driver date from drm_driver

Driver Changes:
  - amdxdna: New driver!
  - ivpu: Fix qemu crash when using passthrough
  - nouveau: expose GSP-RM logging buffers via debugfs
  - panfrost: Add MT8188 Mali-G57 MC3 support
  - panthor: misc improvements,
  - rockchip: Gamma LUT support
  - tidss: Misc improvements
  - virtio: convert to helpers, add prime support for scanout buffers
  - v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL
  - vc4: Add support for BCM2712
  - vkms: Improvements all across the board

  - panels:
    - Introduce backlight quirks infrastructure
    - New panels: KDB KD116N2130B12

----------------------------------------------------------------
Akash Goel (2):
      drm/panthor: Update memattr programing to align with GPU spec
      drm/panthor: Explicitly set the coherency mode

Andy Yan (1):
      drm/rockchip: vop2: Don't spam logs in atomic update

AngeloGioacchino Del Regno (1):
      drm/panfrost: Add GPU ID for MT8188 Mali-G57 MC3

Arnd Bergmann (1):
      drm/rockchip: avoid 64-bit division

Arthur Grillo (1):
      drm/vkms: Use drm_frame directly

Boris Brezillon (1):
      drm/panthor: Fix a typo in the FW iface flag definitions

Chris Brandt (1):
      drm: renesas: rz-du: Increase supported resolutions

Christian Gmeiner (2):
      drm/v3d: Stop active perfmon if it is being destroyed
      drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL

Christian K=F6nig (4):
      drm/xe: drop unused component dependencies
      drm/radeon: switch over to drm_exec v2
      drm/qxl: switch to using drm_exec v2
      drm/ttm: use GEM references for VM mappings

Christophe JAILLET (1):
      drm/bridge: Constify struct i2c_device_id

Danilo Krummrich (1):
      drm/nouveau: create module debugfs root

Dave Stevenson (8):
      drm/vc4: Use of_device_get_match_data to set generation
      drm/vc4: Fix reading of frame count on GEN5 / Pi4
      drm/vc4: drv: Add support for 2712 D-step
      drm/vc4: hvs: Add in support for 2712 D-step.
      drm/vc4: plane: Add support for 2712 D-step.
      drm/vc4: hdmi: Support 2712 D-step register map
      drm/vc4: Enable bg_fill if there are no planes enabled
      drm/vc4: Drop planes that are completely off-screen or 0 crtc size

Devarsh Thakkar (2):
      drm/tidss: Clear the interrupt status for interrupts being disabled
      drm/tidss: Fix race condition while handling interrupt registers

Dongwon Kim (2):
      drm/virtio: Use drm_gem_plane_helper_prepare_fb()
      drm/virtio: New fence for every plane update

Dr. David Alan Gilbert (1):
      drm/bridge: cdns-mhdp8546: Remove unused functions

Dustin L. Howett (1):
      drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels

Heiko Stuebner (1):
      drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification

Jacek Lawrynowicz (1):
      accel/ivpu: Fix Qemu crash when running in passthrough

Jani Nikula (6):
      drm/dp: extract drm_dp_dpcd_poll_act_handled()
      drm/dp: extract drm_dp_dpcd_write_payload()
      drm/dp: extract drm_dp_dpcd_clear_payload()
      drm/xen: remove redundant initialization info print
      accel/ivpu: remove DRIVER_DATE conditional drm_driver init
      drm: remove driver date from struct drm_driver and all drivers

Jeffrey Hugo (1):
      accel/qaic: Drop redundant vfree() null check in sahara

Jens Glathe (1):
      drm/panel-edp: Add unknown BOE panel for HP Omnibook X14

Karunika Choo (1):
      drm/panthor: Simplify FW fast reset path

Kuninori Morimoto (1):
      gpu: drm: replace of_graph_get_next_endpoint()

Langyan Ye (1):
      drm/panel-edp: Add KDB KD116N2130B12

Liviu Dudau (1):
      drm/panthor: Fix compilation failure on panthor_fw.c

Lizhi Hou (10):
      accel/amdxdna: Add documentation for AMD NPU accelerator driver
      accel/amdxdna: Add a new driver for AMD AI Engine
      accel/amdxdna: Support hardware mailbox
      accel/amdxdna: Add hardware resource solver
      accel/amdxdna: Add hardware context
      accel/amdxdna: Add GEM buffer object management
      accel/amdxdna: Add command execution
      accel/amdxdna: Add suspend and resume
      accel/amdxdna: Add error handling
      accel/amdxdna: Add query functions

Louis Chauvet (9):
      drm/vkms: Remove index parameter from init_vkms_output
      drm/vkms: Code formatting
      drm/vkms: Add typedef and documentation for pixel_read and pixel_writ=
e functions
      drm/vkms: Use const for input pointers in pixel_read an pixel_write f=
unctions
      drm/vkms: Update pixels accessor to support packed and multi-plane fo=
rmats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm
      drm/vkms: Remove useless drm_rotation_simplify

Lucas Stach (1):
      drm/rockchip: analogix_dp: allow to work without panel

Maud Spierings (1):
      dt-bindings: display: panel: samsung,atna56ac03: Document ATNA56AC03

Maxime Ripard (21):
      dt-bindings: display: Add BCM2712 HDMI bindings
      dt-bindings: display: Add BCM2712 HVS bindings
      dt-bindings: display: Add BCM2712 PixelValve bindings
      dt-bindings: display: Add BCM2712 MOP bindings
      dt-bindings: display: Add BCM2712 MOPLET bindings
      dt-bindings: display: Add BCM2712 KMS driver bindings
      drm/vc4: drv: Support BCM2712
      drm/vc4: hvs: Add support for BCM2712 HVS
      drm/vc4: crtc: Add support for BCM2712 PixelValves
      drm/vc4: hdmi: Add support for BCM2712 HDMI controllers
      drm/vc4: txp: Introduce structure to deal with revision differences
      drm/vc4: txp: Rename TXP data structure
      drm/vc4: txp: Add byte enable toggle bit
      drm/vc4: txp: Add horizontal and vertical size offset toggle bit
      drm/vc4: txp: Handle 40-bits DMA Addresses
      drm/vc4: txp: Move the encoder type in the variant structure
      drm/vc4: txp: Add a new TXP encoder type
      drm/vc4: txp: Add support for BCM2712 MOP
      drm/vc4: txp: Add BCM2712 MOPLET support
      drm/vc4: Add additional warn_on for incorrect revisions
      Merge drm/drm-next into drm-misc-next

Ma=EDra Canal (1):
      drm/v3d: Fix performance counter source settings on V3D 7.x

Peter Shkenev (1):
      drm/virtio: Use generic dumb_map_offset implementation

Philipp Stanner (1):
      drm/lsdc: Request PCI BAR

Pierre-Eric Pelloux-Prayer (1):
      drm/virtio: Don't create a context with default param if context_init=
 is supported

Piotr Zalewski (1):
      rockchip/drm: vop2: add support for gamma LUT

Raphael Gallais-Pou (1):
      MAINTAINERS: add Raphael Gallais-Pou to DRM/STi maintainers

Thomas Wei=DFschuh (3):
      drm: Add panel backlight quirks
      drm/amd/display: Add support for minimum backlight quirk
      drm: panel-backlight-quirks: Add Framework 13 matte panel

Thomas Zimmermann (8):
      drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
      drm: Move client code to clients/ subdirectory
      drm/client: Move public client header to clients/ subdirectory
      drm/fbdev-client: Unexport drm_fbdev_client_setup()
      drm/cirrus: Use virtual encoder and connector types
      drm/cirrus: Rename to cirrus-qemu
      drm/hibmc: Drop dependency on ARM64
      drm/vmwgfx: Remove initialization of connector status

Timur Tabi (2):
      drm/nouveau: retain device pointer in nvkm_gsp_mem object
      drm/nouveau: expose GSP-RM logging buffers via debugfs

Tomi Valkeinen (5):
      drm/tidss: Fix issue in irq handling causing irq-flood issue
      drm/tidss: Remove unused OCP error flag
      drm/tidss: Remove extra K2G check
      drm/tidss: Add printing of underflows
      drm/tidss: Rename 'wait_lock' to 'irq_lock'

Vivek Kasireddy (5):
      drm/virtio: Implement VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
      drm/virtio: Add a helper to map and note the dma addrs and lengths
      drm/virtio: Add helpers to initialize and free the imported object
      drm/virtio: Import prime buffers from other devices as guest blobs
      drm/virtio: Add prepare and cleanup routines for imported dmabuf obj

Zhi Wang (2):
      nvkm/gsp: correctly advance the read pointer of GSP message queue
      nvkm: correctly calculate the available space of the GSP cmdq buffer

 Documentation/accel/amdxdna/amdnpu.rst             | 281 +++++++
 Documentation/accel/amdxdna/index.rst              |  11 +
 Documentation/accel/index.rst                      |   1 +
 .../bindings/display/brcm,bcm2711-hdmi.yaml        |   2 +
 .../bindings/display/brcm,bcm2835-hvs.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-pixelvalve0.yaml |   3 +
 .../bindings/display/brcm,bcm2835-txp.yaml         |   5 +-
 .../bindings/display/brcm,bcm2835-vc4.yaml         |   1 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |   2 +
 Documentation/gpu/drm-kms-helpers.rst              |   3 +
 MAINTAINERS                                        |  14 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   1 +
 drivers/accel/amdxdna/Kconfig                      |  18 +
 drivers/accel/amdxdna/Makefile                     |  21 +
 drivers/accel/amdxdna/TODO                         |   5 +
 drivers/accel/amdxdna/aie2_ctx.c                   | 900 +++++++++++++++++=
++++
 drivers/accel/amdxdna/aie2_error.c                 | 360 +++++++++
 drivers/accel/amdxdna/aie2_message.c               | 791 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h              | 370 +++++++++
 drivers/accel/amdxdna/aie2_pci.c                   | 762 +++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h                   | 259 ++++++
 drivers/accel/amdxdna/aie2_psp.c                   | 146 ++++
 drivers/accel/amdxdna/aie2_smu.c                   | 119 +++
 drivers/accel/amdxdna/aie2_solver.c                | 330 ++++++++
 drivers/accel/amdxdna/aie2_solver.h                | 154 ++++
 drivers/accel/amdxdna/amdxdna_ctx.c                | 553 +++++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h                | 162 ++++
 drivers/accel/amdxdna/amdxdna_gem.c                | 622 ++++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h                |  65 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c            | 576 +++++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h            | 124 +++
 drivers/accel/amdxdna/amdxdna_mailbox_helper.c     |  61 ++
 drivers/accel/amdxdna/amdxdna_mailbox_helper.h     |  42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c            | 409 ++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h            | 123 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c              |  67 ++
 drivers/accel/amdxdna/npu1_regs.c                  | 101 +++
 drivers/accel/amdxdna/npu2_regs.c                  | 118 +++
 drivers/accel/amdxdna/npu4_regs.c                  | 118 +++
 drivers/accel/amdxdna/npu5_regs.c                  | 118 +++
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   1 -
 drivers/accel/ivpu/ivpu_drv.c                      |   8 -
 drivers/accel/ivpu/ivpu_pm.c                       |   2 +-
 drivers/accel/qaic/qaic_drv.c                      |   1 -
 drivers/accel/qaic/sahara.c                        |   3 +-
 drivers/gpu/drm/Kconfig                            |  76 +-
 drivers/gpu/drm/Makefile                           |  10 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.h            |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |   2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |   1 -
 drivers/gpu/drm/arm/hdlcd_drv.c                    |   3 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   3 +-
 drivers/gpu/drm/armada/armada_drv.c                |   3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                      |   3 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   1 -
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   3 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c    |  28 -
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h    |   3 -
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   2 +-
 drivers/gpu/drm/clients/Kconfig                    |  73 ++
 drivers/gpu/drm/clients/Makefile                   |   5 +
 .../gpu/drm/clients/drm_client_internal.h          |   4 +-
 drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c   |   5 +-
 drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c   |   4 +-
 drivers/gpu/drm/display/drm_dp_helper.c            | 125 ++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  88 +-
 drivers/gpu/drm/drm_of.c                           |   4 +-
 drivers/gpu/drm/drm_panel_backlight_quirks.c       |  94 +++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c              |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |   3 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |   3 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |   1 -
 drivers/gpu/drm/gud/gud_drv.c                      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/Kconfig            |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   3 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |   1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |   2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   4 +-
 drivers/gpu/drm/i915/i915_driver.c                 |   1 -
 drivers/gpu/drm/i915/i915_driver.h                 |   1 -
 drivers/gpu/drm/i915/i915_gpu_error.c              |   1 -
 drivers/gpu/drm/imagination/pvr_drv.c              |   1 -
 drivers/gpu/drm/imagination/pvr_drv.h              |   1 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |   3 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   3 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   3 +-
 drivers/gpu/drm/kmb/kmb_drv.c                      |   3 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |   1 -
 drivers/gpu/drm/lima/lima_drv.c                    |   1 -
 drivers/gpu/drm/logicvc/logicvc_drm.c              |   3 +-
 drivers/gpu/drm/loongson/lsdc_drv.c                |  10 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   1 -
 drivers/gpu/drm/msm/msm_drv.c                      |   3 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |   3 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   3 +-
 drivers/gpu/drm/nouveau/include/nvif/log.h         |  51 ++
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |  21 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c          |  16 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.h          |  16 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  45 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |   1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     | 508 +++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   2 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c               |   2 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   8 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   1 -
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   4 +
 drivers/gpu/drm/panthor/panthor_device.c           |  22 +-
 drivers/gpu/drm/panthor/panthor_drv.c              |   1 -
 drivers/gpu/drm/panthor/panthor_fw.c               |  78 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   9 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |  23 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   3 +-
 drivers/gpu/drm/qxl/Kconfig                        |   1 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |   3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   8 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |  68 +-
 drivers/gpu/drm/radeon/Kconfig                     |   1 +
 drivers/gpu/drm/radeon/radeon.h                    |   7 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |  45 +-
 drivers/gpu/drm/radeon/radeon_drv.c                |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.h                |   1 -
 drivers/gpu/drm/radeon/radeon_gem.c                |  39 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  25 +-
 drivers/gpu/drm/radeon/radeon_object.h             |   2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |  10 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |   3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |   3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c       |   6 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |   3 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 216 ++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   5 +
 drivers/gpu/drm/solomon/ssd130x.c                  |   4 +-
 drivers/gpu/drm/sprd/sprd_drm.c                    |   2 -
 drivers/gpu/drm/sti/sti_drv.c                      |   4 +-
 drivers/gpu/drm/stm/drv.c                          |   3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                  |   3 +-
 drivers/gpu/drm/tegra/drm.c                        |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  28 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   5 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |   5 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |  34 +-
 drivers/gpu/drm/tidss/tidss_irq.h                  |   4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   8 +
 drivers/gpu/drm/tidss/tidss_plane.h                |   2 +
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   3 +-
 drivers/gpu/drm/tiny/Makefile                      |   2 +-
 drivers/gpu/drm/tiny/arcpgu.c                      |   6 +-
 drivers/gpu/drm/tiny/bochs.c                       |   3 +-
 drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c}   |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |   3 +-
 drivers/gpu/drm/tiny/ili9163.c                     |   3 +-
 drivers/gpu/drm/tiny/ili9225.c                     |   3 +-
 drivers/gpu/drm/tiny/ili9341.c                     |   3 +-
 drivers/gpu/drm/tiny/ili9486.c                     |   3 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |   3 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |   4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   3 +-
 drivers/gpu/drm/tiny/repaper.c                     |   3 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |   3 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |   4 +-
 drivers/gpu/drm/tiny/st7586.c                      |   3 +-
 drivers/gpu/drm/tiny/st7735r.c                     |   3 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  14 +-
 drivers/gpu/drm/tve200/tve200_drv.c                |   3 +-
 drivers/gpu/drm/udl/udl_drv.c                      |   3 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   1 -
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |   4 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   3 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   8 +
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |  57 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |  29 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  14 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |  10 +
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |   1 -
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |   8 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     | 106 +--
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  96 ++-
 drivers/gpu/drm/vc4/vc4_drv.c                      |  24 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  54 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 107 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   4 +
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 | 640 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                | 217 +++++
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 737 +++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c                      | 105 ++-
 drivers/gpu/drm/vc4/vc4_plane.c                    | 868 +++++++++++++++++=
++-
 drivers/gpu/drm/vc4/vc4_regs.h                     | 297 +++++++
 drivers/gpu/drm/vc4/vc4_txp.c                      |  91 ++-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  21 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c               |  23 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |  24 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             | 125 ++-
 drivers/gpu/drm/virtio/virtgpu_prime.c             | 178 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  35 +
 drivers/gpu/drm/vkms/vkms_composer.c               | 310 +++++--
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   9 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  63 +-
 drivers/gpu/drm/vkms/vkms_formats.c                | 413 +++++++---
 drivers/gpu/drm/vkms/vkms_formats.h                |   4 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |  49 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  19 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   1 -
 drivers/gpu/drm/xe/xe_bo_types.h                   |   1 -
 drivers/gpu/drm/xe/xe_device.c                     |   1 -
 drivers/gpu/drm/xe/xe_drv.h                        |   1 -
 drivers/gpu/drm/xe/xe_gt_pagefault.c               |   1 -
 drivers/gpu/drm/xe/xe_vm.c                         |   1 -
 drivers/gpu/drm/xe/xe_vm.h                         |   1 -
 drivers/gpu/drm/xen/xen_drm_front.c                |   6 -
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   3 +-
 include/drm/{ =3D> clients}/drm_client_setup.h       |   0
 include/drm/display/drm_dp_helper.h                |   5 +
 include/drm/drm_drv.h                              |   2 -
 include/drm/drm_utils.h                            |   4 +
 include/trace/events/amdxdna.h                     | 101 +++
 include/uapi/drm/amdxdna_accel.h                   | 436 ++++++++++
 include/uapi/drm/v3d_drm.h                         |  18 +
 249 files changed, 14126 insertions(+), 1203 deletions(-)
 create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
 create mode 100644 Documentation/accel/amdxdna/index.rst
 create mode 100644 drivers/accel/amdxdna/Kconfig
 create mode 100644 drivers/accel/amdxdna/Makefile
 create mode 100644 drivers/accel/amdxdna/TODO
 create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
 create mode 100644 drivers/accel/amdxdna/aie2_error.c
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/aie2_pci.c
 create mode 100644 drivers/accel/amdxdna/aie2_pci.h
 create mode 100644 drivers/accel/amdxdna/aie2_psp.c
 create mode 100644 drivers/accel/amdxdna/aie2_smu.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
 create mode 100644 drivers/accel/amdxdna/npu1_regs.c
 create mode 100644 drivers/accel/amdxdna/npu2_regs.c
 create mode 100644 drivers/accel/amdxdna/npu4_regs.c
 create mode 100644 drivers/accel/amdxdna/npu5_regs.c
 create mode 100644 drivers/gpu/drm/clients/Kconfig
 create mode 100644 drivers/gpu/drm/clients/Makefile
 rename include/drm/drm_fbdev_client.h =3D> drivers/gpu/drm/clients/drm_cli=
ent_internal.h (85%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_client_setup.c (96%)
 rename drivers/gpu/drm/{ =3D> clients}/drm_fbdev_client.c (98%)
 create mode 100644 drivers/gpu/drm/drm_panel_backlight_quirks.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h
 rename drivers/gpu/drm/tiny/{cirrus.c =3D> cirrus-qemu.c} (99%)
 rename include/drm/{ =3D> clients}/drm_client_setup.h (100%)
 create mode 100644 include/trace/events/amdxdna.h
 create mode 100644 include/uapi/drm/amdxdna_accel.h

--srgopkubhdo2twmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1G65AAKCRAnX84Zoj2+
diJHAX9RFAsm+9qxKUNZ1QAOV+vleBGbBDLPDCSkR3MMA6Z3LrylVQct9tff9KR+
dUd4ppgBf34B5biWAtyujx7dhpVUHxtG8suSMwEAgonwjtE81rSKgrNs3ABlX+k1
kqh4qmwNpg==
=4/0x
-----END PGP SIGNATURE-----

--srgopkubhdo2twmu--

