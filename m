Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOyuHWhaoGlPigQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:36:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD31A7AC3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE8810E02A;
	Thu, 26 Feb 2026 14:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rVfOxoqk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3jovoUF5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rVfOxoqk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3jovoUF5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF1610E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 14:36:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C19344D2CA;
 Thu, 26 Feb 2026 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772116577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ViCdqe0bpYTKcIx1XAfOY6gorRDe3x5bL7W3bdskF0=;
 b=rVfOxoqko1dwPeMvXJo8bmZ64xCNBdwgS05nx8j3N7/0BatNRqD4FpSVwlKjE0Q2IIIQWZ
 HyUd4XwHgRCapK0Istl+jAT1yOegyFhQwr5mvXhiN7M2BYCVBe/byOzHqpRyQ8reRr6K+r
 XvHuo8jJR4q1Tl5WvOLgISKFk/VFRuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772116577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ViCdqe0bpYTKcIx1XAfOY6gorRDe3x5bL7W3bdskF0=;
 b=3jovoUF5GJ/Rp0PxAAOWo7LLtFMuKvJIXblE8meM7ggWlbfV4WtAJrCYXFU+HPaZsvKVkz
 ohCOcI0hW4y/W1Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772116577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ViCdqe0bpYTKcIx1XAfOY6gorRDe3x5bL7W3bdskF0=;
 b=rVfOxoqko1dwPeMvXJo8bmZ64xCNBdwgS05nx8j3N7/0BatNRqD4FpSVwlKjE0Q2IIIQWZ
 HyUd4XwHgRCapK0Istl+jAT1yOegyFhQwr5mvXhiN7M2BYCVBe/byOzHqpRyQ8reRr6K+r
 XvHuo8jJR4q1Tl5WvOLgISKFk/VFRuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772116577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0ViCdqe0bpYTKcIx1XAfOY6gorRDe3x5bL7W3bdskF0=;
 b=3jovoUF5GJ/Rp0PxAAOWo7LLtFMuKvJIXblE8meM7ggWlbfV4WtAJrCYXFU+HPaZsvKVkz
 ohCOcI0hW4y/W1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 544B73EA62;
 Thu, 26 Feb 2026 14:36:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 14w7E2FaoGnrIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Feb 2026 14:36:17 +0000
Date: Thu, 26 Feb 2026 15:36:15 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20260226143615.GA47200@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona.vetter@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:rodrigo.vivi@intel.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:ogabbay@kernel.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:dim-tools@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,gitlab.freedesktop.org:url,suse.de:dkim]
X-Rspamd-Queue-Id: 90CD31A7AC3
X-Rspamd-Action: no action

Hi Dave, Sima,

this is the first PR of drm-misc-next for kernel v7.1. Some note-worthy
changes are:

- We have new drivers for the Verisilicon DT8200 chip, several bridge
and panel chips, and a driver for coreboot system framebuffers. The
latter comes with a number of fixes to the coreboot module itself.

- Dma-buf got an improved mecahnism for buffer invalidation and DMA-buf
fences have improved lifetime management.

- Struct drm_private_state is now allocated via callback; like all other
object state.

- Nouveau can now provide Z-Cull information form hardware to user space.

And of course we have the usual list of clean ups, fixes and improvements
throughout the DRM subsystem.

Note that dim printed the following errors when I sent the PR:

dim: ee8bfb15d02d ("drm: drop lib from header search path."): Link tag missing.
dim: ee8bfb15d02d ("drm: drop lib from header search path."): mandatory review missing.
dim: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)"): Link tag missing.
dim: 4a9671a03f2b ("gpu: Move DRM buddy allocator one level up (part one)"): Link tag missing.

Best regards
Thomas

drm-misc-next-2026-02-26:
drm-misc-next for v7.1:

UAPI Changes:

connector:
- Add panel_type property

fourcc:
- Add ARM interleaved 64k modifier

nouveau:
- Query Z-Cull info with DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

Cross-subsystem Changes:

coreboot:
- Clean up coreboot framebuffer support

dma-buf:
- Provide revoke mechanism for shared buffers
- Rename move_notify callback to invalidate_mappings and update users.
- Always enable move_notify
- Support dma_fence_was_initialized() test
- Protect dma_fence_ops by RCU and improve locking
- Fix sparse warnings

Core Changes:

atomic:
- Allocate drm_private_state via callback and convert drivers

atomic-helper:
- Use system_percpu_wq

buddy:
- Make buddy allocator available to all DRM drivers
- Document flags and structures

colorop:
- Add destroy helper and convert drivers

fbdev-emulation:
- Clean up

gem:
- Fix drm_gem_objects_lookup() error cleanup

Driver Changes:

amdgpu:
- Set panel_type to OLED for eDP

atmel-hlcdc:
- Support sana5d65 LCD controller

bridge:
- anx7625: Support USB-C plus DT bindings
- connector: Fix EDID detection
- dw-hdmi-qp: Support Vendor-Specfic and SDP Infoframes; improve others
- fsl-ldb: Fix visual artifacts plus related DT property 'enable-termination-resistor'
- imx8qxp-pixel-link: Improve bridge reference handling
- lt9611: Support Port-B-only input plus DT bindings
- tda998x: Support DRM_BRIDGE_ATTACH_NO_CONNECTOR; Clean up
- Support TH1520 HDMI plus DT bindings
- Clean up

imagination:
- Clean up

komeda:
- Fix integer overflow in AFBC checks

mcde:
- Improve bridge handling

nouveau:
- Provide Z-cull info to user space
- gsp: Support GA100
- Shutdown on PCI device shutdown
- Clean up

panel:
- panel-jdi-lt070me05000: Use mipi-dsi multi functions
- panel-edp: Support Add AUO B116XAT04.1 (HW: 1A); Support CMN N116BCL-EAK (C2); Support FriendlyELEC plus DT changes
- Fix Kconfig dependencies

panthor:
- Add tracepoints for power and IRQs

rcar-du:
- dsi: fix VCLK calculation

rockchip:
- vop2: Use drm_ logging functions
- Support DisplayPort on RK3576

sysfb:
- corebootdrm: Support system framebuffer on coreboot firmware; detect orientation
- Clean up pixel-format lookup

sun4i:
- Clean up

tilcdc:
- Use DT bindings scheme
- Use managed DRM interfaces
- Support DRM_BRIDGE_ATTACH_NO_CONNECTOR
- Clean up a lot of obsolete code

v3d:
- Clean up

vc4:
- Use system_percpu_wq
- Clean up

verisilicon:
- Support DC8200 plus DT bindings

virtgpu:
- Support PRIME imports with enabled 3D
The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2026-02-26

for you to fetch changes up to 2622649ad6cdbb3e77bfafc8c0fe686090b77f70:

  dma-buf: Assign separate lockdep class to array lock (2026-02-25 01:19:41 -0800)

----------------------------------------------------------------
drm-misc-next for v7.1:

UAPI Changes:

connector:
- Add panel_type property

fourcc:
- Add ARM interleaved 64k modifier

nouveau:
- Query Z-Cull info with DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

Cross-subsystem Changes:

coreboot:
- Clean up coreboot framebuffer support

dma-buf:
- Provide revoke mechanism for shared buffers
- Rename move_notify callback to invalidate_mappings and update users.
- Always enable move_notify
- Support dma_fence_was_initialized() test
- Protect dma_fence_ops by RCU and improve locking
- Fix sparse warnings

Core Changes:

atomic:
- Allocate drm_private_state via callback and convert drivers

atomic-helper:
- Use system_percpu_wq

buddy:
- Make buddy allocator available to all DRM drivers
- Document flags and structures

colorop:
- Add destroy helper and convert drivers

fbdev-emulation:
- Clean up

gem:
- Fix drm_gem_objects_lookup() error cleanup

Driver Changes:

amdgpu:
- Set panel_type to OELD for eDP

atmel-hlcdc:
- Support sana5d65 LCD controller

bridge:
- anx7625: Support USB-C plus DT bindings
- connector: Fix EDID detection
- dw-hdmi-qp: Support Vendor-Specfic and SDP Infoframes; improve others
- fsl-ldb: Fix visual artifacts plus related DT property 'enable-termination-resistor'
- imx8qxp-pixel-link: Improve bridge reference handling
- lt9611: Support Port-B-only input plus DT bindings
- tda998x: Support DRM_BRIDGE_ATTACH_NO_CONNECTOR; Clean up
- Support TH1520 HDMI plus DT bindings
- Clean up

imagination:
- Clean up

komeda:
- Fix integer overflow in AFBC checks

mcde:
- Improve bridge handling

nouveau:
- Provide Z-cull info to user space
- gsp: Support GA100
- Shutdown on PCI device shutdown
- Clean up

panel:
- panel-jdi-lt070me05000: Use mipi-dsi multi functions
- panel-edp: Support Add AUO B116XAT04.1 (HW: 1A); Support CMN N116BCL-EAK (C2); Support FriendlyELEC plus DT changes
- Fix Kconfig dependencies

panthor:
- Add tracepoints for power and IRQs

rcar-du:
- dsi: fix VCLK calculation

rockchip:
- vop2: Use drm_ logging functions
- Support DisplayPort on RK3576

sysfb:
- corebootdrm: Support system framebuffer on coreboot firmware; detect orientation
- Clean up pixel-format lookup

sun4i:
- Clean up

tilcdc:
- Use DT bindings scheme
- Use managed DRM interfaces
- Support DRM_BRIDGE_ATTACH_NO_CONNECTOR
- Clean up a lot of obsolete code

v3d:
- Clean up

vc4:
- Use system_percpu_wq
- Clean up

verisilicon:
- Support DC8200 plus DT bindings

virtgpu:
- Support PRIME imports with enabled 3D

----------------------------------------------------------------
Alexander Konyukhov (1):
      drm/komeda: fix integer overflow in AFBC framebuffer size check

Andy Shevchenko (1):
      drm/nouveau/gsp: simplify code with acpi_get_local_u64_address()

Andy Yan (4):
      dt-bindings: display: rockchip: Add rk3576 DisplayPort
      drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
      drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
      drm/rockchip: dw_dp: Add DisplayPort support for rk3576

Caio Ishikawa (1):
      drm/panel: boe-th101mb31ig002: Remove use of deprecated mipi_dsi_dcs_nop()

Caterina Shablia (1):
      drm: add ARM interleaved 64k modifier

Chaitanya Kumar Borah (9):
      drm/colorop: Add destroy helper for colorop objects
      drm: Allow driver-managed destruction of colorop objects
      drm/amd/display: Hook up colorop destroy helper for plane pipelines
      drm/vkms: Hook up colorop destroy helper for plane pipelines
      drm/i915/display: Hook up intel_colorop_destroy
      drm: Clean up colorop objects during mode_config cleanup
      drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
      drm/colorop: Use destroy callback for color pipeline teardown
      drm/i915/color: Add failure handling in plane color pipeline init

Chintan Patel (1):
      drm/panel: jdi-lt070me05000: Use MIPI DSI multi functions

Christian König (9):
      dma-buf: add dma_fence_was_initialized function v2
      dma-buf: protected fence ops by RCU v8
      dma-buf: detach fence ops on signal v3
      dma-buf: abstract fence locking v2
      dma-buf: inline spinlock for fence protection v5
      dma-buf/selftests: test RCU ops and inline lock v2
      dma-buf: use inline lock for the stub fence v2
      dma-buf: use inline lock for the dma-fence-array
      dma-buf: use inline lock for the dma-fence-chain

Cong Yang (1):
      drm/panel-edp: Add CMN N116BCL-EAK (C2)

Cristian Ciocaltea (5):
      drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific InfoFrame
      drm/bridge: dw-hdmi-qp: Provide SPD InfoFrame
      drm/bridge: dw-hdmi-qp: Rework AVI InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework DRM InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler

Damon Ding (3):
      drm/display: bridge_connector: Ensure last bridge determines EDID/modes detection capabilities
      drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
      drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable

Dave Airlie (1):
      drm: drop lib from header search path.

Dmitry Baryshkov (3):
      dt-bindings: drm/bridge: anx7625: describe Type-C connector
      drm: bridge: anx7625: implement minimal Type-C support
      drm: bridge: anx7625: implement message sending

Ethan Tidmore (1):
      drm/sun4i: backend: fix error pointer dereference

Fabio Estevam (2):
      dt-bindings: display: bridge: ldb: Document nxp, enable-termination-resistor
      drm/bridge: fsl-ldb: Allow the termination resistor to be enabled

Hongyang Zhao (2):
      dt-bindings: display: lt9611: Support single Port B input
      drm/bridge: lt9611: Add support for single Port B input

Hsieh Hung-En (1):
      drm/rockchip: vop2: Use drm_err_ratelimited() for wait timeouts

Icenowy Zheng (7):
      dt-bindings: vendor-prefixes: add verisilicon
      dt-bindings: display: add verisilicon,dc
      drm: verisilicon: add a driver for Verisilicon display controllers
      dt-bindings: display/bridge: add binding for TH1520 HDMI controller
      drm/bridge: add a driver for T-Head TH1520 HDMI controller
      drm: verisilicon: suppress snprintf warning for pixel clock name
      drm: verisilicon: assign git tree to drm/misc in MAINTAINERS

Jernej Skrabec (1):
      drm/sun4i: mixer: Fix layer init code

Jocelyn Falempe (1):
      drm/panic: depends on PRINTK

Joel Fernandes (2):
      gpu: Move DRM buddy allocator one level up (part one)
      gpu: Move DRM buddy allocator one level up (part two)

Koen Koning (1):
      gpu: Fix uninitialized buddy for built-in drivers

Kory Maincent (TI.com) (25):
      dt-bindings: display: tilcdc: Convert to DT schema
      dt-bindings: display: tilcdc: Mark panel binding as deprecated
      drm/tilcdc: Remove simulate_vesa_sync flag
      drm/tilcdc: Add support for DRM bus flags and simplify panel config
      drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
      drm/tilcdc: Remove tilcdc panel driver
      drm/tilcdc: Remove component framework support
      drm/tilcdc: Remove tilcdc_panel_info structure
      drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
      drm/tilcdc: Remove unused encoder and connector tracking arrays
      drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
      drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
      drm/tilcdc: Remove the useless module list support
      drm/tilcdc: Use drm_module_platform_driver() helper
      drm/tilcdc: Move tilcdc_init/fini closer to probe/remove
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/tilcdc: Convert to DRM managed resources
      drm/tilcdc: Convert to drm_device-based logging helpers
      drm/tilcdc: Use devm_drm_of_get_bridge() helper
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

Leon Romanovsky (8):
      dma-buf: Rename .move_notify() callback to a clearer identifier
      dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings()
      dma-buf: Always build with DMABUF_MOVE_NOTIFY
      vfio: Wait for dma-buf invalidation to complete
      dma-buf: Make .invalidate_mapping() truly optional
      dma-buf: Add dma_buf_attach_revocable()
      vfio: Permit VFIO to work with pinned importers
      iommufd: Add dma_buf_pin()

Li Chen (1):
      nouveau: pci: quiesce GPU on shutdown

Luca Ceresoli (6):
      drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
      drm/mcde: dsi: mcde_dsi_bind: break when a panel or bridge is found
      drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
      drm/bridge: imx8qxp-pixel-link: get/put the next bridge

Marco Crivellari (4):
      drm/atomic-helper: replace use of system_unbound_wq with system_dfl_wq
      drm/probe-helper: replace use of system_wq with system_percpu_wq
      drm/self_refresh: replace use of system_wq with system_percpu_wq
      drm/vc4: hdmi: replace use of system_wq with system_percpu_wq

Marek Vasut (1):
      drm/rcar-du: dsi: Clean up VCLK divider calculation

Mario Limonciello (AMD) (2):
      drm/connector: Add a new 'panel_type' property
      drm/amd/display: Attach OLED property to eDP panels

Mark Brown (1):
      RDMA/uverbs: Update for semantic conflict with drm-misc

Matt Coster (3):
      drm/imagination: Use dev_pm_domain_attach_list()
      drm/imagination: Improve handling of unknown FWCCB commands
      drm/imagination: Mark FWCCB_CMD_UPDATE_STATS as known

Matthew Brost (3):
      drm/i915/selftests: Fix build after dma-fence locking rework
      dma-buf: Assign separate lockdep class to chain lock
      dma-buf: Assign separate lockdep class to array lock

Maxime Ripard (12):
      drm/atomic: Make drm_atomic_private_obj_init fallible
      drm/atomic: Add new atomic_create_state callback to drm_private_obj
      drm/atomic-helper: Add private_obj atomic_create_state helper
      drm/bridge: Switch private_obj initialization to atomic_create_state
      drm/dp_mst: Switch private_obj initialization to atomic_create_state
      drm/dp_tunnel: Switch private_obj initialization to atomic_create_state
      drm/arm: komeda: Switch private_obj initialization to atomic_create_state
      drm/ingenic: Switch private_obj initialization to atomic_create_state
      drm/msm: mdp5: Switch private_obj initialization to atomic_create_state
      drm/msm: dpu1: Switch private_obj initialization to atomic_create_state
      drm/vc4: Switch private_obj initialization to atomic_create_state
      Merge drm/drm-next into drm-misc-next

Maíra Canal (3):
      drm/panel: ilitek-ili9882t: Select DRM_DISPLAY_DSC_HELPER
      drm/v3d: Replace IDR with XArray for perfmon tracking
      drm/vc4: Replace IDR with XArray for perfmon tracking

Mel Henning (2):
      drm/nouveau: Fetch zcull info from device
      drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO

Nicolas Frattaroli (5):
      drm/panthor: Rework panthor_irq::suspended into panthor_irq::state
      drm/panthor: Extend IRQ helpers for mask modification/restoration
      drm/panthor: Add tracepoint for hardware utilisation changes
      drm/panthor: Add gpu_job_irq tracepoint
      drm/panthor: Add src path to includes of panthor_gpu.o

Randy Dunlap (1):
      drm/sun4i: fix kernel-doc warnings in sunxi_engine.h

Robin Murphy (2):
      dt-bindings: display: panel: Move FriendlyElec HD702E to eDP
      drm/panel-edp: Move FriendlyELEC HD702E

Ryan Wanner (1):
      drm: atmel-hlcdc: add LCD controller layer definition for sama7d65

Sanjay Yadav (2):
      drm/buddy: Add kernel-doc for allocator structures and flags
      drm/buddy: Move internal helpers to buddy.c

Srinivasan Shanmugam (1):
      drm/gem: Make drm_gem_objects_lookup() self-cleaning on failure v6

Terry Hsiao (1):
      drm/panel-edp: Add AUO B116XAT04.1 (HW: 1A)

Thomas Zimmermann (15):
      Merge drm/drm-next into drm-misc-next
      drm/fbdev-emulation: Remove empty placeholders
      drm/fbdev-emulation: Remove support for legacy emulation
      firmware: google: framebuffer: Do not unregister platform device
      firmware: google: framebuffer: Do not mark framebuffer as busy
      firmware: google: framebuffer: Init memory resource with helper macro
      firmware: google: framebuffer: Tie platform device to PCI hardware
      firmware: google: framebuffer: Fix dependencies
      firmware: google: Init coreboot bus with subsys_initcall()
      firmware: google: Clean up include statements in coreboot_table.h
      firmware: google: Export coreboot table entries
      firmware: google: Pack structures for coreboot table entries
      drm/sysfb: Generalize pixel-format matching
      drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
      drm/sysfb: corebootdrm: Support panel orientation

Timur Tabi (1):
      drm/nouveau/gsp: add support for GA100

Tvrtko Ursulin (1):
      dma-fence: Fix sparse warnings due __rcu annotations

Val Packett (1):
      drm/virtio: Allow importing prime buffers when 3D is enabled

 .../bindings/display/bridge/analogix,anx7625.yaml  |   98 +-
 .../bindings/display/bridge/fsl,ldb.yaml           |   18 +
 .../bindings/display/bridge/lontium,lt9611.yaml    |   15 +-
 .../display/bridge/thead,th1520-dw-hdmi.yaml       |  120 ++
 .../bindings/display/panel/panel-edp-legacy.yaml   |    2 +
 .../bindings/display/panel/panel-simple.yaml       |    2 -
 .../bindings/display/rockchip/rockchip,dw-dp.yaml  |   27 +-
 .../devicetree/bindings/display/tilcdc/panel.txt   |    1 +
 .../bindings/display/tilcdc/ti,am33xx-tilcdc.yaml  |  100 ++
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |   82 --
 .../bindings/display/verisilicon,dc.yaml           |  122 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/gpu/drm-mm.rst                       |   10 +-
 MAINTAINERS                                        |   18 +-
 drivers/dma-buf/Kconfig                            |   12 -
 drivers/dma-buf/dma-buf.c                          |   69 +-
 drivers/dma-buf/dma-fence-array.c                  |   19 +-
 drivers/dma-buf/dma-fence-chain.c                  |   16 +-
 drivers/dma-buf/dma-fence.c                        |  168 ++-
 drivers/dma-buf/st-dma-fence.c                     |   50 +-
 drivers/dma-buf/sw_sync.c                          |   14 +-
 drivers/dma-buf/sync_debug.h                       |    2 +-
 drivers/firmware/google/Kconfig                    |    5 +-
 drivers/firmware/google/cbmem.c                    |    1 +
 drivers/firmware/google/coreboot_table.c           |   13 +-
 drivers/firmware/google/coreboot_table.h           |   59 +-
 drivers/firmware/google/framebuffer-coreboot.c     |  126 +-
 drivers/firmware/google/memconsole-coreboot.c      |    1 +
 drivers/firmware/google/vpd.c                      |    1 +
 drivers/gpu/Kconfig                                |   13 +
 drivers/gpu/Makefile                               |    4 +-
 drivers/gpu/buddy.c                                | 1323 ++++++++++++++++++++
 drivers/gpu/drm/Kconfig                            |    8 +-
 drivers/gpu/drm/Kconfig.debug                      |    1 -
 drivers/gpu/drm/Makefile                           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   20 +-
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |    2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    7 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |   27 +-
 .../drm/arm/display/komeda/komeda_framebuffer.c    |    6 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |    2 +
 .../drm/arm/display/komeda/komeda_private_obj.c    |  208 ++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   81 ++
 drivers/gpu/drm/bridge/Kconfig                     |   10 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix/Kconfig            |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  161 +--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    4 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  223 +++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   34 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |    7 +
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   50 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   46 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |   12 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  224 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       |    3 +
 drivers/gpu/drm/bridge/tda998x_drv.c               |  263 ++--
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c            |  173 +++
 drivers/gpu/drm/display/drm_bridge_connector.c     |   18 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |   37 +-
 drivers/gpu/drm/display/drm_dp_tunnel.c            |   25 +-
 drivers/gpu/drm/drm_atomic.c                       |   32 +-
 drivers/gpu/drm/drm_atomic_helper.c                |    6 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |   23 +
 drivers/gpu/drm/drm_bridge.c                       |   31 +-
 drivers/gpu/drm/drm_buddy.c                        | 1272 +------------------
 drivers/gpu/drm/drm_colorop.c                      |   49 +-
 drivers/gpu/drm/drm_connector.c                    |   33 +
 drivers/gpu/drm/drm_crtc.c                         |    4 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   15 -
 drivers/gpu/drm/drm_gem.c                          |   45 +-
 drivers/gpu/drm/drm_mode_config.c                  |    6 +
 drivers/gpu/drm/drm_probe_helper.c                 |    2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c          |    2 +-
 drivers/gpu/drm/drm_writeback.c                    |    2 +-
 .../gpu/drm/i915/display/intel_color_pipeline.c    |  175 ++-
 drivers/gpu/drm/i915/display/intel_colorop.c       |    6 +
 drivers/gpu/drm/i915/display/intel_colorop.h       |    1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |    2 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |    2 +-
 drivers/gpu/drm/i915/i915_active.c                 |   19 +-
 drivers/gpu/drm/i915/i915_scatterlist.c            |   10 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c      |   55 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h      |    4 +-
 drivers/gpu/drm/i915/selftests/i915_active.c       |    4 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   20 +-
 drivers/gpu/drm/imagination/pvr_ccb.c              |   20 +-
 drivers/gpu/drm/imagination/pvr_device.h           |   10 +-
 drivers/gpu/drm/imagination/pvr_power.c            |   80 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   28 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   28 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   42 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   41 +-
 drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h   |   19 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   29 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h            |    1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   38 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |    3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   11 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c    |    4 -
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   |    9 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |    7 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c   |   34 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h  |   19 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |   18 +-
 drivers/gpu/drm/panel/Kconfig                      |    1 +
 .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   |    7 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   28 +
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  105 +-
 drivers/gpu/drm/panel/panel-simple.c               |   25 -
 drivers/gpu/drm/panthor/Makefile                   |    2 +
 drivers/gpu/drm/panthor/panthor_device.h           |  107 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   16 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   30 +-
 drivers/gpu/drm/panthor/panthor_gpu.h              |    2 +
 drivers/gpu/drm/panthor/panthor_hw.c               |   62 +
 drivers/gpu/drm/panthor/panthor_hw.h               |    8 +
 drivers/gpu/drm/panthor/panthor_mmu.c              |   47 +-
 drivers/gpu/drm/panthor/panthor_pwr.c              |    2 +-
 drivers/gpu/drm/panthor/panthor_trace.h            |   86 ++
 drivers/gpu/drm/qxl/qxl_release.c                  |    5 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   35 +-
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          |   27 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |    8 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |   10 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    3 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |    2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |    7 +-
 drivers/gpu/drm/sysfb/Kconfig                      |   16 +
 drivers/gpu/drm/sysfb/Makefile                     |    1 +
 drivers/gpu/drm/sysfb/corebootdrm.c                |  434 +++++++
 drivers/gpu/drm/sysfb/drm_sysfb.c                  |   24 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |    8 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c      |   30 -
 drivers/gpu/drm/sysfb/efidrm.c                     |    8 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |    8 +-
 drivers/gpu/drm/tests/Makefile                     |    1 -
 drivers/gpu/drm/tests/drm_exec_test.c              |    2 -
 drivers/gpu/drm/tests/drm_mm_test.c                |    2 -
 drivers/gpu/drm/tilcdc/Kconfig                     |   18 +
 drivers/gpu/drm/tilcdc/Makefile                    |    5 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |  192 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  496 +++-----
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |   99 +-
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |   69 +
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |    5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |  179 ---
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |   15 -
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c       |  185 +++
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso    |   29 +
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   35 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |    8 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h       |    4 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |    5 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   57 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |    5 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |    4 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   69 +-
 drivers/gpu/drm/vc4/vc4_perfmon.c                  |   51 +-
 drivers/gpu/drm/verisilicon/Kconfig                |   16 +
 drivers/gpu/drm/verisilicon/Makefile               |    5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c            |  371 ++++++
 drivers/gpu/drm/verisilicon/vs_bridge.h            |   39 +
 drivers/gpu/drm/verisilicon/vs_bridge_regs.h       |   54 +
 drivers/gpu/drm/verisilicon/vs_crtc.c              |  191 +++
 drivers/gpu/drm/verisilicon/vs_crtc.h              |   31 +
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h         |   60 +
 drivers/gpu/drm/verisilicon/vs_dc.c                |  207 +++
 drivers/gpu/drm/verisilicon/vs_dc.h                |   38 +
 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h       |   27 +
 drivers/gpu/drm/verisilicon/vs_drm.c               |  182 +++
 drivers/gpu/drm/verisilicon/vs_drm.h               |   28 +
 drivers/gpu/drm/verisilicon/vs_hwdb.c              |  150 +++
 drivers/gpu/drm/verisilicon/vs_hwdb.h              |   29 +
 drivers/gpu/drm/verisilicon/vs_plane.c             |  124 ++
 drivers/gpu/drm/verisilicon/vs_plane.h             |   72 ++
 drivers/gpu/drm/verisilicon/vs_primary_plane.c     |  173 +++
 .../gpu/drm/verisilicon/vs_primary_plane_regs.h    |   53 +
 drivers/gpu/drm/virtio/virtgpu_prime.c             |    4 +-
 drivers/gpu/drm/vkms/vkms_colorop.c                |   16 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |    3 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c              |    7 +-
 drivers/gpu/drm/xe/xe_bo.c                         |    2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |   14 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |    3 +-
 drivers/gpu/drm/xe/xe_res_cursor.h                 |   34 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |    4 +-
 drivers/gpu/drm/xe/xe_svm.c                        |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |   71 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h         |    4 +-
 drivers/gpu/tests/Makefile                         |    4 +
 .../drm_buddy_test.c => tests/gpu_buddy_test.c}    |  416 +++---
 .../{drm/lib/drm_random.c => tests/gpu_random.c}   |   18 +-
 .../{drm/lib/drm_random.h => tests/gpu_random.h}   |   18 +-
 drivers/infiniband/core/ib_core_uverbs.c           |    2 +-
 drivers/infiniband/core/umem_dmabuf.c              |   10 -
 drivers/infiniband/core/uverbs_std_types_dmabuf.c  |    2 +-
 drivers/infiniband/hw/mlx5/mr.c                    |    2 +-
 drivers/iommu/iommufd/pages.c                      |   11 +-
 drivers/iommu/iommufd/selftest.c                   |    2 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c                 |   80 +-
 drivers/video/Kconfig                              |    1 +
 include/drm/bridge/dw_dp.h                         |    7 +
 include/drm/drm_atomic.h                           |   21 +-
 include/drm/drm_atomic_state_helper.h              |    3 +
 include/drm/drm_buddy.h                            |  163 +--
 include/drm/drm_colorop.h                          |   32 +-
 include/drm/drm_connector.h                        |    1 +
 include/drm/drm_fb_helper.h                        |  105 --
 include/drm/drm_mode_config.h                      |    4 +
 include/linux/coreboot.h                           |   90 ++
 include/linux/dma-buf.h                            |   17 +-
 include/linux/dma-fence-array.h                    |    1 -
 include/linux/dma-fence-chain.h                    |    1 -
 include/linux/dma-fence.h                          |   97 +-
 include/linux/gpu_buddy.h                          |  239 ++++
 include/trace/events/dma_fence.h                   |   35 +-
 include/uapi/drm/drm_fourcc.h                      |   16 +
 include/uapi/drm/drm_mode.h                        |    4 +
 include/uapi/drm/nouveau_drm.h                     |   66 +
 234 files changed, 8540 insertions(+), 4247 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tilcdc/ti,am33xx-tilcdc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_trace.h
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 create mode 100644 drivers/gpu/drm/tilcdc/tilcdc_encoder.c
 rename drivers/gpu/drm/tilcdc/{tilcdc_external.h => tilcdc_encoder.h} (51%)
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_external.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_panel.h
 create mode 100644 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c
 create mode 100644 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.dtso
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (67%)
 rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (59%)
 rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (53%)
 create mode 100644 include/linux/coreboot.h
 create mode 100644 include/linux/gpu_buddy.h

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
