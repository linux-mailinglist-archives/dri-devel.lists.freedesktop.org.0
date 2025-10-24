Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1AC05EBD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0110EA5F;
	Fri, 24 Oct 2025 11:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WYwTsGU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BB910EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:26:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47114a40161so20047635e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1761305207; x=1761910007; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K/+xEao2WpvZ/Qdr/CjYXg1AG1PCu0XffvMBBbK936Y=;
 b=WYwTsGU4dMl8a7F8gkASwsT6811eTktsnf4/74ZLFzJsoTqza90xLLnGRsgn1mbYz2
 qALNrOzHKPERM4okZZDUz+dp9wA5yfz3q9jm8I3kT45SG6mXUQ7HHNSzNBivmMd9AvOP
 JQx6LG+7pMqt1X7KEhbFCSlaP3Qsd6hWxn1H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761305207; x=1761910007;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/+xEao2WpvZ/Qdr/CjYXg1AG1PCu0XffvMBBbK936Y=;
 b=tmsb1y277NbHfOvQB76vTypj+KYa3SjGRi/QsdiOHt9TXxuGISob8A0W1j+OnyLirb
 yh98lIzr4v26jYrI3K4WBC92/KBSPOpCFy3WhX+T+QN5COcYt1v/0hCCUIyLoUncdIM/
 Ck5fW03kldpDG4i1iYV7rcV6zVUpVzFIRJZ2HJ6dHQWs6vhaqAigmO2J3q/O8fDQ2VPF
 JNZqnx7WwEDgbRg/OJ9LmX71zMQIO1K2mNnrnnrRB55obgch7Sg5fBpE9xhc/BJaOe+4
 QZk8yoiPYRLnYjTl7IcQsiKBkSpXt3aIZ7bBHMq+P2K8sFwocsw4EU6AIln0vC35Oza0
 /bfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4L3FFN+b0ktwE0gkN/kQpVKkZILtLsVjqmfwtEs47dae7iiNDPbtkf+jur4whe+GRVjNEQUp51K0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5pDO8hgyZ8XIgBZQevGpkwwNG+g6OufXYKRQ9DCnmu8oKuOnu
 GuhMFyab9HA3x4qG32gvl+b9wH4zMMFASbaIGAj36/MSG6t/zGcYXRiEZJPitmLfpuw=
X-Gm-Gg: ASbGnct4n/9uMYw+wCSj9Bs/dWCPEwgEBNRV9sSUUZYtXQy71AX2s5z4JH7I0FyL/3l
 t7crxhUmb17Yuvo/+472IypVaPbtTHnqfcTXz/uEX0P/xh7qpc0bh0pEh7roZHBZ0+Dgv1hP2gB
 ctmt91tBRzCNgBq76tyg94KkVwJXoVvxViAupmoJZGsB7l2OA0Shph4UJWz0SdPFxeBTndGNRb1
 iYS9yLIvAnmIcsHwCBnuO65HftJoQ4RgSrMi0Sa/3URHHJ+aUpZV2+AbIpgxmFyMzGLAeRy8rvH
 6exTcXPvKwNiQn0RQxAErF+jTTMvEbfqCST7A7pEy2WOFP2kD4+OycBN1Npr3ofO8gR3qE+XX1L
 Gfhi66D0tlbuA4Ly2Ipj/f2fdKQXhaZBzQCYJpGWiXEuP0+GnZgmvTuxAX8c9E38ZJ/tA4gLXwi
 p79lUGnJesUOaJPqxONh3HeA==
X-Google-Smtp-Source: AGHT+IGd6uVKsEMDZb8zlNQWnz+8e1dW6fSSJrzcO+5O6KOxLxBh//ZsMqjLckW+IG7Ln5tgTlZahg==
X-Received: by 2002:a05:600c:45c9:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-47117913764mr212036465e9.31.1761305206089; 
 Fri, 24 Oct 2025 04:26:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2ef9fsm86186855e9.13.2025.10.24.04.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:26:45 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:26:43 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <aPtic8NE0nLhpf1M@phenom.ffwll.local>
References: <20251021111837.GA40643@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251021111837.GA40643@linux.fritz.box>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Oct 21, 2025 at 01:18:37PM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's the latest PR from drm-misc-next. Helpers for atomic-state
> handling have been renamed and improved; with fallout throughout
> drivers. There's work on improving dma-buf heap allocation, but
> without the uapi so far. More drivers support vblank timers for
> rate- limiting output on virtual displays. There are plenty of
> other changes to drivers, plus the usual small cleanups and fixes.
> 
> Best regards
> Thomas
> 
> drm-misc-next-2025-10-21:
> drm-misc-next for v6.19:
> 
> UAPI Changes:
> 
> amdxdna:
> - Support reading last hardware error
> 
> Cross-subsystem Changes:
> 
> dma-buf:
> - heaps: Create heap per CMA reserved location; Improve user-space documentation
> 
> Core Changes:
> 
> atomic:
> - Clean up and improve state-handling interfaces, update drivers
> 
> bridge:
> - Improve ref counting
> 
> buddy:
> - Optimize block management
> 
> Driver Changes:
> 
> amdxdna:
> - Fix runtime power management
> - Support firmware debug output
> 
> ast:
> - Set quirks for each chip model
> 
> atmel-hlcdc:
> - Set LCDC_ATTRE register in plane disable
> - Set correct values for plane scaler
> 
> bochs:
> - Use vblank timer
> 
> bridge:
> - synopsis: Support CEC; Init timer with correct frequency
> 
> cirrus-qemu:
> - Use vblank timer
> 
> imx:
> - Clean up
> 
> ivu:
> - Update JSM API to 3.33.0
> - Reset engine on more job errors
> - Return correct error codes for jobs
> 
> komeda:
> - Use drm_ logging functions
> 
> panel:
> - edp: Support AUO B116XAN02.0
> 
> panfrost:
> - Embed struct drm_driver in Panfrost device
> - Improve error handling
> - Clean up job handling
> 
> panthor:
> - Support custom ASN_HASH for mt8196
> 
> renesas:
> - rz-du: Fix dependencies
> 
> rockchip:
> - dsi: Add support for RK3368
> - Fix LUT size for RK3386
> 
> sitronix:
> - Fix output position when clearing screens
> 
> qaic:
> - Support dma-buf exports
> - Support new firmware's READ_DATA implementation
> - Replace kcalloc with memdup
> - Replace snprintf() with sysfs_emit()
> - Avoid overflows in arithmetics
> - Clean up
> - Fixes
> 
> qxl:
> - Use vblank timer
> 
> rockchip:
> - Clean up mode-setting code
> 
> vgem:
> - Fix fence timer deadlock
> 
> virtgpu:
> - Use vblank timer
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2025-10-21
> 
> for you to fetch changes up to 7ea0468380216c10b73633b976d33efa8c12d375:
> 
>   accel/amdxdna: Support firmware debug buffer (2025-10-20 09:07:12 -0700)

Pulled into drm-next, thanks.
-Sima

> 
> ----------------------------------------------------------------
> drm-misc-next for v6.19:
> 
> UAPI Changes:
> 
> amdxdna:
> - Support reading last hardware error
> 
> Cross-subsystem Changes:
> 
> dma-buf:
> - heaps: Create heap per CMA reserved location; Improve user-space documentation
> 
> Core Changes:
> 
> atomic:
> - Clean up and improve state-handling interfaces, update drivers
> 
> bridge:
> - Improve ref counting
> 
> buddy:
> - Optimize block management
> 
> Driver Changes:
> 
> amdxdna:
> - Fix runtime power management
> - Support firmware debug output
> 
> ast:
> - Set quirks for each chip model
> 
> atmel-hlcdc:
> - Set LCDC_ATTRE register in plane disable
> - Set correct values for plane scaler
> 
> bochs:
> - Use vblank timer
> 
> bridge:
> - synopsis: Support CEC; Init timer with correct frequency
> 
> cirrus-qemu:
> - Use vblank timer
> 
> imx:
> - Clean up
> 
> ivu:
> - Update JSM API to 3.33.0
> - Reset engine on more job errors
> - Return correct error codes for jobs
> 
> komeda:
> - Use drm_ logging functions
> 
> panel:
> - edp: Support AUO B116XAN02.0
> 
> panfrost:
> - Embed struct drm_driver in Panfrost device
> - Improve error handling
> - Clean up job handling
> 
> panthor:
> - Support custom ASN_HASH for mt8196
> 
> renesas:
> - rz-du: Fix dependencies
> 
> rockchip:
> - dsi: Add support for RK3368
> - Fix LUT size for RK3386
> 
> sitronix:
> - Fix output position when clearing screens
> 
> qaic:
> - Support dma-buf exports
> - Support new firmware's READ_DATA implementation
> - Replace kcalloc with memdup
> - Replace snprintf() with sysfs_emit()
> - Avoid overflows in arithmetics
> - Clean up
> - Fixes
> 
> qxl:
> - Use vblank timer
> 
> rockchip:
> - Clean up mode-setting code
> 
> vgem:
> - Fix fence timer deadlock
> 
> virtgpu:
> - Use vblank timer
> 
> ----------------------------------------------------------------
> Adrián Larumbe (13):
>       drm/panfrost: Name scheduler queues after their job slots
>       drm/panfrost: Replace DRM driver allocation method with newer one
>       drm/panfrost: Handle inexistent GPU during probe
>       drm/panfrost: Handle job HW submit errors
>       drm/panfrost: Handle error when allocating AS number
>       drm/panfrost: Check sgt to know whether pages are already mapped
>       drm/panfrost: Handle page mapping failure
>       drm/panfrost: Don't rework job IRQ enable mask in the enable path
>       drm/panfrost: Make re-enabling job interrupts at device reset optional
>       drm/panfrost: Add forward declaration and types header
>       drm/panfrost: Remove unused device property
>       drm/panfrost: Rename panfrost_job functions to reflect real role
>       MAINTAINERS: Panfrost: Add Steven Price and Adrian Larumbe
> 
> Alexandr Sapozhnikov (1):
>       drm/virtio: Handle drm_crtc_init_with_planes() errors
> 
> Andrzej Kacprowski (3):
>       accel/ivpu: Update JSM API header to 3.33.0
>       accel/ivpu: Trigger engine reset for additional job status codes
>       accel/ivpu: Return correct job error status
> 
> Arunpravin Paneer Selvam (3):
>       drm/buddy: Optimize free block management with RB tree
>       drm/buddy: Separate clear and dirty free block trees
>       drm/buddy: Add KUnit tests for allocator performance under fragmentation
> 
> Aswin Venkatesan (1):
>       accel/qaic: Fix incorrect error return path
> 
> Carl Vanderlip (1):
>       accel/qaic: Use overflow check function instead of division
> 
> Chelsy Ratnawat (1):
>       accel/qaic: Replace snprintf() with sysfs_emit() in sysfs show functions
> 
> Chia-I Wu (2):
>       dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
>       drm/panthor: add custom ASN_HASH support for mt8196
> 
> Cristian Ciocaltea (5):
>       drm/bridge: dw-hdmi-qp: Add CEC support
>       drm/bridge: dw-hdmi-qp: Fixup timer base setup
>       drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
>       drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
>       drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
> 
> Cyrille Pitchen (1):
>       drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
> 
> Damon Ding (1):
>       drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
> 
> Daniel Stone (5):
>       drm/rockchip: Demote normal drm_err to debug
>       drm/rockchip: Declare framebuffer width/height bounds
>       drm/rockchip: Return error code for errors
>       drm/rockchip: Rename variables for clarity
>       drm/rockchip: Use temporary variables
> 
> Eslam Khafagy (1):
>       drm: atmel-hlcdc: replace dev_* print functions with drm_* variants
> 
> Janusz Krzysztofik (1):
>       drm/vgem-fence: Fix potential deadlock on release
> 
> Jeff Hugo (1):
>       accel/qaic: Support the new READ_DATA implementation
> 
> Jesse.Zhang (1):
>       drm/ttm: Add safety check for NULL man->bdev in ttm_resource_manager_usage
> 
> Jessica Zhang (1):
>       MAINTAINERS: Update Jessica Zhang's email address
> 
> Jonathan Cavitt (1):
>       drm: Prevent sign extension on hdisplay and vdisplay
> 
> Lad Prabhakar (1):
>       drm: renesas: rz-du: Drop ARCH_RZG2L dependency
> 
> Lizhi Hou (3):
>       accel/amdxdna: Resume power for creating and destroying hardware context
>       accel/amdxdna: Support getting last hardware error
>       accel/amdxdna: Support firmware debug buffer
> 
> Luca Ceresoli (2):
>       drm/display: bridge_connector: get/put the stored bridges
>       drm/bridge: refcount last_bridge in drm_atomic_bridge_chain_select_bus_fmts()
> 
> Manikandan Muralidharan (1):
>       drm: atmel-hlcdc: update the LCDC_ATTRE register in plane atomic_disable
> 
> Marcus Folkesson (1):
>       drm/sitronix/st7571-i2c: reset position before clearing display
> 
> Marek Vasut (1):
>       drm/imx: dc: Sort bits and bitfields in descending order
> 
> Maxime Ripard (47):
>       drm/atomic: Convert drm_atomic_get_connector_state() to use new connector state
>       drm/atomic: Remove unused drm_atomic_get_existing_connector_state()
>       drm/atomic: Document __drm_connectors_state state pointer
>       drm/atomic: Convert __drm_atomic_get_current_plane_state() to modern accessor
>       drm/atomic: Convert drm_atomic_get_plane_state() to use new plane state
>       drm/vkms: Convert vkms_crtc_atomic_check() to use new plane state
>       drm/tilcdc: crtc: Use drm_atomic_helper_check_crtc_primary_plane()
>       drm/atomic: Remove unused drm_atomic_get_existing_plane_state()
>       drm/atomic: Document __drm_planes_state state pointer
>       drm/atomic: Convert drm_atomic_get_crtc_state() to use new connector state
>       drm/ingenic: ipu: Switch to drm_atomic_get_new_crtc_state()
>       drm/arm/malidp: Switch to drm_atomic_get_new_crtc_state()
>       drm/armada: Drop always true condition in atomic_check
>       drm/armada: Switch to drm_atomic_get_new_crtc_state()
>       drm/atmel-hlcdc: Switch to drm_atomic_get_new_crtc_state()
>       drm/exynos: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-dc: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-dcss: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-ipuv3: Switch to drm_atomic_get_new_crtc_state()
>       drm/ingenic: Switch to drm_atomic_get_new_crtc_state()
>       drm/kmb: Switch to drm_atomic_get_new_crtc_state()
>       drm/logicvc: Switch to drm_atomic_get_new_crtc_state()
>       drm/loongson: Switch to drm_atomic_get_new_crtc_state()
>       drm/mediatek: Switch to drm_atomic_get_new_crtc_state()
>       drm/msm/mdp5: Switch to drm_atomic_get_new_crtc_state()
>       drm/omap: Switch to drm_atomic_get_new_crtc_state()
>       drm/rockchip: Switch to drm_atomic_get_new_crtc_state()
>       drm/sun4i: Switch to drm_atomic_get_new_crtc_state()
>       drm/tegra: Switch to drm_atomic_get_new_crtc_state()
>       drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
>       drm/vboxvideo: Switch to drm_atomic_get_new_crtc_state()
>       drm/vc4: Switch to drm_atomic_get_new_crtc_state()
>       drm/atomic: Switch to drm_atomic_get_new_crtc_state()
>       drm/framebuffer: Switch to drm_atomic_get_new_crtc_state()
>       drm/atomic: Remove unused drm_atomic_get_existing_crtc_state()
>       drm/atomic: Document __drm_crtcs_state state pointer
>       drm/ingenic: crtc: Switch to ingenic_drm_get_new_priv_state()
>       drm/atomic: Convert drm_atomic_get_private_obj_state() to use new plane state
>       drm/atomic: Document __drm_private_objs_state state pointer
>       Documentation: dma-buf: heaps: Add naming guidelines
>       drm/atomic: Change state pointers to a more meaningful name
>       MAINTAINERS: Remove myself for sun4i DRM driver
>       doc: dma-buf: List the heaps by name
>       dma-buf: heaps: cma: Register list of CMA regions at boot
>       dma: contiguous: Register reusable CMA regions at boot
>       dma: contiguous: Reserve default CMA heap
>       dma-buf: heaps: cma: Create CMA heap for each CMA reserved region
> 
> Mehdi Ben Hadj Khelifa (1):
>       drm/gud: Use kmalloc_array() instead of kmalloc()
> 
> Pranjal Ramajor Asha Kanojiya (1):
>       accel/qaic: Add support to export dmabuf fd
> 
> Rahul Kumar (1):
>       drm/komeda: Convert logging in komeda_crtc.c to drm_* with drm_device parameter
> 
> Rain Yang (2):
>       dt-bindings: gpu: mali-valhall: make mali-supply optional
>       drm/panthor: skip regulator setup if no such prop
> 
> Ruben Wauters (1):
>       MAINTAINERS: add myself as maintainer for GUD
> 
> Svyatoslav Ryhel (1):
>       gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
> 
> Thomas Zimmermann (11):
>       drm/virtgpu: Use vblank timer
>       Merge drm/drm-next into drm-misc-next
>       drm/ast: Store DRAM clock table in struct ast_device
>       drm/ast: Support device quirks
>       drm/ast: Store CRTC memory request threshold in device quirks
>       drm/ast: Store precatch settings in struct ast_device_quirks
>       drm/ast: Store HSync adjustment in device quirks
>       drm/bochs: Use vblank timer
>       drm/cirrus-qemu: Use vblank timer
>       drm/qxl: Use vblank timer
>       drm/client: Remove holds_console_lock parameter from suspend/resume
> 
> Thorsten Blum (2):
>       accel/qaic: Replace kzalloc + copy_from_user with memdup_user
>       accel/qaic: Replace kcalloc + copy_from_user with memdup_array_user
> 
> WeiHao Li (3):
>       dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3368 DSI
>       drm/rockchip: dsi: Add support for RK3368
>       drm/rockchip: vop: add lut_size for RK3368 vop_data
> 
> Wludzik, Jozef (1):
>       accel/ivpu: Fix race condition when mapping dmabuf
> 
> Youssef Samir (3):
>       accel/qaic: Use kvcalloc() for slice requests allocation
>       accel/qaic: Remove redundant retry_count = 0 statement
>       accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()
> 
> Zack McKevitt (3):
>       accel/qaic: Include signal.h in qaic_control.c
>       accel/qaic: Use check_add_overflow in sahara for 64b types
>       accel/qaic: Fix mismatched types in min()
> 
>  .clang-format                                      |    2 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml         |   12 +
>  .../bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml  |   69 ++
>  .../bindings/display/panel/ilitek,ili9881c.yaml    |    2 +
>  .../bindings/display/panel/panel-simple.yaml       |    2 +
>  .../bindings/display/panel/sharp,lq079l1sx01.yaml  |   99 ++
>  .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         |    4 +-
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  Documentation/gpu/drm-kms-helpers.rst              |   12 +
>  Documentation/gpu/todo.rst                         |   37 +
>  Documentation/userspace-api/dma-buf-heaps.rst      |   59 +-
>  MAINTAINERS                                        |   13 +-
>  drivers/accel/amdxdna/Makefile                     |    1 +
>  drivers/accel/amdxdna/TODO                         |    1 -
>  drivers/accel/amdxdna/aie2_ctx.c                   |  167 ++-
>  drivers/accel/amdxdna/aie2_error.c                 |   95 +-
>  drivers/accel/amdxdna/aie2_message.c               |   59 +-
>  drivers/accel/amdxdna/aie2_msg_priv.h              |   18 +
>  drivers/accel/amdxdna/aie2_pci.c                   |   89 +-
>  drivers/accel/amdxdna/aie2_pci.h                   |   11 +-
>  drivers/accel/amdxdna/aie2_smu.c                   |   28 +-
>  drivers/accel/amdxdna/amdxdna_ctx.c                |  101 +-
>  drivers/accel/amdxdna/amdxdna_ctx.h                |   16 +-
>  drivers/accel/amdxdna/amdxdna_error.h              |   59 ++
>  drivers/accel/amdxdna/amdxdna_gem.c                |   50 +-
>  drivers/accel/amdxdna/amdxdna_gem.h                |    6 +
>  drivers/accel/amdxdna/amdxdna_mailbox.c            |   13 +-
>  drivers/accel/amdxdna/amdxdna_pci_drv.c            |   60 +-
>  drivers/accel/amdxdna/amdxdna_pci_drv.h            |    3 +
>  drivers/accel/amdxdna/amdxdna_pm.c                 |   94 ++
>  drivers/accel/amdxdna/amdxdna_pm.h                 |   18 +
>  drivers/accel/amdxdna/npu1_regs.c                  |    1 +
>  drivers/accel/amdxdna/npu4_regs.c                  |    1 +
>  drivers/accel/ivpu/ivpu_debugfs.c                  |   38 +-
>  drivers/accel/ivpu/ivpu_drv.c                      |    6 +-
>  drivers/accel/ivpu/ivpu_fw.c                       |  221 ++--
>  drivers/accel/ivpu/ivpu_fw.h                       |   14 +-
>  drivers/accel/ivpu/ivpu_gem.c                      |  116 ++-
>  drivers/accel/ivpu/ivpu_gem.h                      |   10 +-
>  drivers/accel/ivpu/ivpu_hw.c                       |   59 +-
>  drivers/accel/ivpu/ivpu_hw.h                       |   10 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.c                  |    2 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.h                  |    2 +-
>  drivers/accel/ivpu/ivpu_job.c                      |  179 +++-
>  drivers/accel/ivpu/ivpu_job.h                      |   49 +-
>  drivers/accel/ivpu/ivpu_mmu_context.c              |    2 +-
>  drivers/accel/ivpu/ivpu_pm.c                       |   11 +-
>  drivers/accel/ivpu/vpu_jsm_api.h                   |  653 +++++++-----
>  drivers/accel/qaic/qaic_control.c                  |    9 +-
>  drivers/accel/qaic/qaic_data.c                     |   96 +-
>  drivers/accel/qaic/qaic_ras.c                      |    6 +-
>  drivers/accel/qaic/sahara.c                        |  165 ++-
>  drivers/dma-buf/heaps/Kconfig                      |   10 -
>  drivers/dma-buf/heaps/cma_heap.c                   |   47 +-
>  drivers/gpu/drm/Makefile                           |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    4 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   31 +-
>  drivers/gpu/drm/arm/malidp_planes.c                |    2 +-
>  drivers/gpu/drm/armada/armada_plane.c              |    7 +-
>  drivers/gpu/drm/ast/Makefile                       |    3 +-
>  drivers/gpu/drm/ast/ast_2000.c                     |  108 ++
>  drivers/gpu/drm/ast/ast_2100.c                     |   92 ++
>  drivers/gpu/drm/ast/ast_2200.c                     |   92 ++
>  drivers/gpu/drm/ast/ast_2300.c                     |  135 +++
>  drivers/gpu/drm/ast/ast_2400.c                     |  100 ++
>  drivers/gpu/drm/ast/ast_2500.c                     |  106 ++
>  drivers/gpu/drm/ast/ast_2600.c                     |   72 ++
>  drivers/gpu/drm/ast/ast_drv.c                      |   69 +-
>  drivers/gpu/drm/ast/ast_drv.h                      |  100 +-
>  drivers/gpu/drm/ast/ast_main.c                     |  268 -----
>  drivers/gpu/drm/ast/ast_mode.c                     |   46 +-
>  drivers/gpu/drm/ast/ast_tables.h                   |   60 --
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   21 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   14 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |    3 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |    3 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   52 +-
>  drivers/gpu/drm/bridge/imx/Kconfig                 |   11 +
>  drivers/gpu/drm/bridge/imx/Makefile                |    1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       |  158 +++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c        |   65 +-
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |    7 +-
>  drivers/gpu/drm/bridge/synopsys/Kconfig            |    8 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c |    5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  224 +++-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |   14 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   18 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  112 ++
>  drivers/gpu/drm/clients/drm_fbdev_client.c         |   14 +-
>  drivers/gpu/drm/clients/drm_log.c                  |    4 +-
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  119 ++-
>  drivers/gpu/drm/display/drm_dp_helper.c            |   76 +-
>  drivers/gpu/drm/drm_atomic.c                       |   48 +-
>  drivers/gpu/drm/drm_atomic_helper.c                |    8 +-
>  drivers/gpu/drm/drm_bridge.c                       |   58 +-
>  drivers/gpu/drm/drm_buddy.c                        |  390 ++++---
>  drivers/gpu/drm/drm_client_event.c                 |   16 +-
>  drivers/gpu/drm/drm_client_modeset.c               |   44 +
>  drivers/gpu/drm/drm_dumb_buffers.c                 |  170 ++-
>  drivers/gpu/drm/drm_fb_helper.c                    |   30 +-
>  drivers/gpu/drm/drm_format_helper.c                |   91 --
>  drivers/gpu/drm/drm_framebuffer.c                  |    2 +-
>  drivers/gpu/drm/drm_gem.c                          |   16 +-
>  drivers/gpu/drm/drm_gem_dma_helper.c               |    9 +-
>  drivers/gpu/drm/drm_gem_shmem_helper.c             |  136 ++-
>  drivers/gpu/drm/drm_gem_vram_helper.c              |    8 +-
>  drivers/gpu/drm/drm_mipi_dbi.c                     |    2 +-
>  drivers/gpu/drm/drm_modeset_helper.c               |    6 +-
>  drivers/gpu/drm/drm_vblank.c                       |  172 ++-
>  drivers/gpu/drm/drm_vblank_helper.c                |  176 ++++
>  drivers/gpu/drm/exynos/exynos_drm_gem.c            |    8 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c          |    2 +-
>  drivers/gpu/drm/gma500/fbdev.c                     |   43 -
>  drivers/gpu/drm/gud/gud_connector.c                |    8 +-
>  drivers/gpu/drm/gud/gud_pipe.c                     |   12 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   11 +
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    4 +-
>  drivers/gpu/drm/i915/i915_driver.c                 |    6 +-
>  drivers/gpu/drm/imx/dc/dc-ed.c                     |    8 +-
>  drivers/gpu/drm/imx/dc/dc-fg.c                     |    4 +-
>  drivers/gpu/drm/imx/dc/dc-fu.c                     |   10 +-
>  drivers/gpu/drm/imx/dc/dc-fu.h                     |    4 +-
>  drivers/gpu/drm/imx/dc/dc-lb.c                     |   28 +-
>  drivers/gpu/drm/imx/dc/dc-plane.c                  |    2 +-
>  drivers/gpu/drm/imx/dcss/dcss-plane.c              |    4 +-
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   29 +-
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   17 +-
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |    3 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c       |    4 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   13 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c              |    4 +-
>  drivers/gpu/drm/kmb/kmb_plane.c                    |    3 +-
>  drivers/gpu/drm/logicvc/logicvc_layer.c            |    4 +-
>  drivers/gpu/drm/loongson/lsdc_gem.c                |   31 +-
>  drivers/gpu/drm/loongson/lsdc_plane.c              |    2 +-
>  drivers/gpu/drm/mcde/mcde_clk_div.c                |   13 +-
>  drivers/gpu/drm/mediatek/mtk_plane.c               |    3 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |    7 +-
>  drivers/gpu/drm/msm/msm_gem.c                      |   27 +-
>  drivers/gpu/drm/nouveau/Kconfig                    |    1 +
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |    2 +
>  drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h  |    1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.h               |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c          |   11 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c              |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_platform.c         |   20 +
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |    1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |    4 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild     |    2 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c    |    5 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.h    |    1 +
>  .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c    |  320 ++++++
>  .../drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h    |   24 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c    |    5 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c    |  185 ++++
>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h    |   18 +
>  drivers/gpu/drm/omapdrm/omap_encoder.c             |    4 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c                 |   15 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c               |    2 +-
>  drivers/gpu/drm/panel/Kconfig                      |   15 +
>  drivers/gpu/drm/panel/Makefile                     |    1 +
>  drivers/gpu/drm/panel/panel-edp.c                  |    9 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 1098 ++++++++++++--------
>  drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c    |  225 ++++
>  drivers/gpu/drm/panel/panel-simple.c               |   35 +
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   71 +-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c        |    4 +-
>  drivers/gpu/drm/panfrost/panfrost_device.c         |   68 +-
>  drivers/gpu/drm/panfrost/panfrost_device.h         |   24 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c            |  242 +++--
>  drivers/gpu/drm/panfrost/panfrost_dump.c           |    8 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c            |    8 +-
>  drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c   |    4 +-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c            |   66 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c            |  346 ++++--
>  drivers/gpu/drm/panfrost/panfrost_job.h            |   38 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c            |  114 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.h            |    3 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   26 +-
>  drivers/gpu/drm/panthor/panthor_devfreq.c          |    3 +-
>  drivers/gpu/drm/panthor/panthor_device.c           |    2 +
>  drivers/gpu/drm/panthor/panthor_device.h           |   14 +
>  drivers/gpu/drm/panthor/panthor_drv.c              |    8 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c              |   25 +-
>  drivers/gpu/drm/panthor/panthor_regs.h             |    4 +
>  drivers/gpu/drm/panthor/panthor_sched.c            |   40 +-
>  drivers/gpu/drm/panthor/panthor_sched.h            |    3 +-
>  drivers/gpu/drm/pl111/pl111_display.c              |   13 +-
>  drivers/gpu/drm/qxl/qxl_display.c                  |   29 +
>  drivers/gpu/drm/qxl/qxl_gem.c                      |    2 +-
>  drivers/gpu/drm/radeon/radeon_device.c             |    4 +-
>  drivers/gpu/drm/radeon/radeon_gem.c                |    2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |    7 +-
>  drivers/gpu/drm/renesas/rz-du/Kconfig              |    2 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   12 +-
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   20 +
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |   77 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |   12 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    6 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |   83 +-
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |    1 +
>  drivers/gpu/drm/scheduler/tests/sched_tests.h      |    3 +-
>  drivers/gpu/drm/sitronix/st7571-i2c.c              |    1 +
>  drivers/gpu/drm/solomon/ssd130x.c                  |   86 +-
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   14 +-
>  drivers/gpu/drm/stm/lvds.c                         |   12 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c         |   12 +-
>  drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c            |   18 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |    3 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |    3 +-
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   34 +-
>  drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |  153 ++-
>  drivers/gpu/drm/sysfb/simpledrm.c                  |    3 +-
>  drivers/gpu/drm/sysfb/vesadrm.c                    |    3 +-
>  drivers/gpu/drm/tegra/dc.c                         |    2 +-
>  drivers/gpu/drm/tegra/gem.c                        |    8 +-
>  drivers/gpu/drm/tegra/hdmi.c                       |    4 +-
>  drivers/gpu/drm/tegra/sor.c                        |    4 +-
>  drivers/gpu/drm/tests/.kunitconfig                 |    2 +
>  drivers/gpu/drm/tests/drm_buddy_test.c             |  105 ++
>  drivers/gpu/drm/tidss/tidss_crtc.c                 |   33 +-
>  drivers/gpu/drm/tidss/tidss_dispc.c                |   10 +-
>  drivers/gpu/drm/tidss/tidss_drv.c                  |   16 -
>  drivers/gpu/drm/tidss/tidss_kms.c                  |    4 -
>  drivers/gpu/drm/tidss/tidss_plane.c                |    8 -
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |    9 +-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c              |    3 +-
>  drivers/gpu/drm/tiny/bochs.c                       |   10 +
>  drivers/gpu/drm/tiny/cirrus-qemu.c                 |   11 +
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   12 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |   60 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                       |   15 +-
>  drivers/gpu/drm/ttm/ttm_bo_internal.h              |    2 +
>  drivers/gpu/drm/ttm/ttm_resource.c                 |    3 +
>  drivers/gpu/drm/vboxvideo/vbox_mode.c              |    8 +-
>  drivers/gpu/drm/vc4/Kconfig                        |    1 +
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  137 +--
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |    1 -
>  drivers/gpu/drm/vc4/vc4_plane.c                    |    6 +-
>  drivers/gpu/drm/vgem/vgem_fence.c                  |    2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c           |   36 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c                   |   87 +-
>  drivers/gpu/drm/vkms/vkms_drv.h                    |    2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |    2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   21 +-
>  drivers/gpu/drm/xe/display/xe_display.c            |    6 +-
>  drivers/gpu/drm/xe/xe_bo.c                         |   10 +-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c                  |    7 +-
>  drivers/gpu/host1x/bus.c                           |   12 +
>  drivers/gpu/host1x/dev.c                           |   11 +-
>  drivers/gpu/host1x/hw/channel_hw.c                 |  112 +-
>  drivers/gpu/host1x/syncpt.c                        |    4 +-
>  drivers/video/fbdev/Kconfig                        |    8 +-
>  drivers/video/fbdev/core/Kconfig                   |    2 +-
>  drivers/video/fbdev/core/bitblit.c                 |  122 +--
>  drivers/video/fbdev/core/fbcon.c                   |  459 ++++----
>  drivers/video/fbdev/core/fbcon.h                   |   17 +-
>  drivers/video/fbdev/core/fbcon_ccw.c               |  151 +--
>  drivers/video/fbdev/core/fbcon_cw.c                |  151 +--
>  drivers/video/fbdev/core/fbcon_rotate.c            |   47 +-
>  drivers/video/fbdev/core/fbcon_rotate.h            |   18 +-
>  drivers/video/fbdev/core/fbcon_ud.c                |  167 +--
>  drivers/video/fbdev/core/softcursor.c              |   18 +-
>  drivers/video/fbdev/core/tileblit.c                |   32 +-
>  drivers/video/fbdev/simplefb.c                     |    6 +-
>  include/drm/bridge/dw_hdmi.h                       |   11 +-
>  include/drm/bridge/dw_hdmi_qp.h                    |    2 +
>  include/drm/display/drm_dp.h                       |    3 +
>  include/drm/display/drm_dp_helper.h                |    8 +
>  include/drm/drm_atomic.h                           |  152 +--
>  include/drm/drm_bridge.h                           |   61 +-
>  include/drm/drm_buddy.h                            |   11 +-
>  include/drm/drm_client.h                           |   15 +-
>  include/drm/drm_client_event.h                     |    8 +-
>  include/drm/drm_crtc.h                             |    2 +-
>  include/drm/drm_dumb_buffers.h                     |   14 +
>  include/drm/drm_format_helper.h                    |    4 -
>  include/drm/drm_gem_shmem_helper.h                 |    2 +
>  include/drm/drm_modeset_helper_vtables.h           |   12 +
>  include/drm/drm_vblank.h                           |   32 +
>  include/drm/drm_vblank_helper.h                    |   56 +
>  include/drm/gpu_scheduler.h                        |    2 +-
>  include/drm/ttm/ttm_bo.h                           |    2 +-
>  include/linux/dma-buf/heaps/cma.h                  |   16 +
>  include/sound/asoundef.h                           |    9 +
>  include/uapi/drm/amdxdna_accel.h                   |   13 +
>  include/uapi/drm/drm_mode.h                        |   50 +-
>  include/uapi/drm/ivpu_accel.h                      |   11 +
>  include/uapi/drm/panfrost_drm.h                    |   50 +
>  kernel/dma/contiguous.c                            |   11 +
>  293 files changed, 9208 insertions(+), 3921 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq079l1sx01.yaml
>  create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
>  create mode 100644 drivers/accel/amdxdna/amdxdna_pm.c
>  create mode 100644 drivers/accel/amdxdna/amdxdna_pm.h
>  create mode 100644 drivers/gpu/drm/ast/ast_2200.c
>  create mode 100644 drivers/gpu/drm/ast/ast_2400.c
>  delete mode 100644 drivers/gpu/drm/ast/ast_main.c
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>  create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a_devfreq.h
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
>  create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq079l1sx01.c
>  create mode 100644 include/drm/drm_dumb_buffers.h
>  create mode 100644 include/drm/drm_vblank_helper.h
>  create mode 100644 include/linux/dma-buf/heaps/cma.h
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
