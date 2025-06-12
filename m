Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51118AD73B6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F0F10E876;
	Thu, 12 Jun 2025 14:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E6yKpcpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9845510E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749738280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xKdHXiUMyTNNp4ZxwHbY+IUtzRUWbfAenzeu7i1rkUY=;
 b=E6yKpcpTDKBYHocjbKd19otFlEYSnXJ2zPwSWCYkZAQUA3uaJq39L5SJwm5yWoTR1bE/g8
 FwWyyL/FG2ePmnXsMIQCT8V53969yofM6/4NEFjPOhSwlkMgtI6HpcZNnDGND3g3XxFme4
 mXmDIYWmUUGCU1H7x2SSEgbOnHgG1Ko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336--iY4Ij4MN2edxF-IwT47Zg-1; Thu, 12 Jun 2025 10:24:38 -0400
X-MC-Unique: -iY4Ij4MN2edxF-IwT47Zg-1
X-Mimecast-MFC-AGG-ID: -iY4Ij4MN2edxF-IwT47Zg_1749738277
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4532ff43376so5266925e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749738277; x=1750343077;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKdHXiUMyTNNp4ZxwHbY+IUtzRUWbfAenzeu7i1rkUY=;
 b=eBuGAFeXi/+2L/pQCVW2ijhKvJVuUAIlD+Y9rVwi5Icc69tvnqPA9MvcXp7n6Uv6/j
 qXmV3kps0ehEuRVJPT6qpK+E8hnEdZQRQ1oAsVPZRB+0DeC9SEYCW9++B0um30UNlMzW
 cVnltoiM/frguqq68/xDHdfC+o52apcesAmf2yzeWmA6yW37zcl8YbGr8qsj0hSRdu4h
 sgamx8t44AYeQQmlUegafLlxPtHfma26wZDJF2yn8vbHumboekggaYmvwdzuC35Ru8+K
 FNv/B1MPmTi4iYr1bvpSnXWZ1VXQYCrc/sgQfgYaNxZx3+MbLju22b4hvoTu4+5gdXje
 JLMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkG9ItBIRZTei71vx7gr0qgGzFjaksVeifG/5gAXwVG7Yq1kmxl7Aiib4zgh7UU6d19Huoo+mAKX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1Zd//rDPi8iad73MOqDEd4uc75rrRgSQHQbdvx1i9CFqRRxpP
 to5zQppwtozKkomt1+wcXBqaUYBUC+yMzl5BNKrrBh1T1o85J0BZdz28/+UJ7iNpJSPMBbeJnlm
 D5/uOglDbDkjQDnEcCuT4whquxkOe9P16I8hCPmX2M1LD+xSs0nRwdVXpKiHHlbZY7fqQoYx6jY
 GWrQ==
X-Gm-Gg: ASbGncvISQG1ESvrsrX5Y/mM1ufx2noWQunnn1B406A0NNc5kvv3InWB+cDkAPlu8jh
 inxWUqlMYu1UVeEBGRUm/T5LyUJ1CSvaRC/8sntA1r70stNAtsDKpOuEkdXeLUsUllHU/xgrvyk
 E5uFTzkh21T0RSMyjYatWYAtke9TbFqCWlRQWmDt8dHusuILHreGTCP3ws2jELfe1XtsgjzKKjr
 iDUkRLO3v3zTOoAEryKh8TRJIlbLaZiZUhvXpRfoFHlnzJqVdNhp+7l7dSLAHg/2OLpW2WcRw==
X-Received: by 2002:a05:600c:4f8f:b0:442:ccfa:fa with SMTP id
 5b1f17b1804b1-4532d317885mr28165135e9.27.1749738276259; 
 Thu, 12 Jun 2025 07:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYK1C51UBA/BtMCxHReYIDSzSpA+ivcGQ8JptY+YfvYoLwZyIHeIvNCY/FOSG3tHSqyfuu1g==
X-Received: by 2002:a05:600c:4f8f:b0:442:ccfa:fa with SMTP id
 5b1f17b1804b1-4532d317885mr28164655e9.27.1749738275448; 
 Thu, 12 Jun 2025 07:24:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a561b653d5sm2119041f8f.86.2025.06.12.07.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 07:24:34 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:24:34 +0200
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
Message-ID: <20250612-coucal-of-impossible-cleaning-a5eecf@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gyryeohxtq3m4fsh"
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


--gyryeohxtq3m4fsh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi,

Here's the first drm-misc-next PR for 6.17.

Maxime

drm-misc-next-2025-06-12:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - atomic-helpers: Tune the enable / disable sequence
 - bridge: Add destroy hook
 - color management: Add helpers for hardware gamma LUT handling
 - HDMI: Add CEC handling, YUV420 output support
 - sched: tracing improvements

Driver Changes:
 - hyperv: Move out of simple-kms, drm_panic support
 - i915: drm_panel_follower support
 - imx: Add IMX8qxq Display Controller Support
 - lima: Add Rockchip RK3528 GPU Support
 - nouveau: fence handling cleanup
 - panfrost: Add BO labeling, 64-bit registers access
 - qaic: Add RAS Support
 - rz-du: Add RZ/V2H(P) Support, MIPI-DSI DCS Support
 - sun4i: Add H616 Support
 - tidss: Add TI AM62L Support
 - vkms: YUV and R* formats support

 - bridges:
   - Switched to reference counted drm_bridge allocations

 - panels:
   - Switched to reference counted drm_panel allocations
   - Add support for fwnode-based panel lookup
   - himax-hx8394: Support for Huiling hl055fhv028c
   - ilitek-ili9881c: Support for 7" Raspberry Pi 720x1280
   - panel-edp: Support for KDC KD116N3730A05, N160JCE-ELL CMN,
   - panel-simple: Support for AUO P238HAN01
   - st7701: Support for Winstar wf40eswaa6mnn0
   - visionox-rm69299: Support for rm69299-shift
   - New panels: Renesas R61307, Renesas R69328
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
5-06-12

for you to fetch changes up to c5b4393c5492555e35c08677a326c9c53b275abd:

  drm/file: add client id to drm_file_error (2025-06-12 14:33:51 +0200)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - atomic-helpers: Tune the enable / disable sequence
 - bridge: Add destroy hook
 - color management: Add helpers for hardware gamma LUT handling
 - HDMI: Add CEC handling, YUV420 output support
 - sched: tracing improvements

Driver Changes:
 - hyperv: Move out of simple-kms, drm_panic support
 - i915: drm_panel_follower support
 - imx: Add IMX8qxq Display Controller Support
 - lima: Add Rockchip RK3528 GPU Support
 - nouveau: fence handling cleanup
 - panfrost: Add BO labeling, 64-bit registers access
 - qaic: Add RAS Support
 - rz-du: Add RZ/V2H(P) Support, MIPI-DSI DCS Support
 - sun4i: Add H616 Support
 - tidss: Add TI AM62L Support
 - vkms: YUV and R* formats support

 - bridges:
   - Switched to reference counted drm_bridge allocations

 - panels:
   - Switched to reference counted drm_panel allocations
   - Add support for fwnode-based panel lookup
   - himax-hx8394: Support for Huiling hl055fhv028c
   - ilitek-ili9881c: Support for 7" Raspberry Pi 720x1280
   - panel-edp: Support for KDC KD116N3730A05, N160JCE-ELL CMN,
   - panel-simple: Support for AUO P238HAN01
   - st7701: Support for Winstar wf40eswaa6mnn0
   - visionox-rm69299: Support for rm69299-shift
   - New panels: Renesas R61307, Renesas R69328

----------------------------------------------------------------
Adri=E1n Larumbe (5):
      drm/panfrost: Add BO labelling to Panfrost
      drm/panfrost: Internally label some BOs
      drm/panfrost: Add driver IOCTL for setting BO labels
      drm/panfrost: show device-wide list of DRM GEM objects over DebugFS
      drm/panfrost: Fix panfrost device variable name in devfreq

Andr=E9 Almeida (1):
      drm: drm_auth: Convert mutex usage to guard(mutex)

Andy Shevchenko (2):
      accel/habanalabs: Switch to use %ptTs
      drm/panel: ili9341: Remove unused member from struct ili9341

Andy Yan (2):
      drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
      drm/gem-framebuffer: log errors when gem size < afbc_size

Anusha Srivatsa (76):
      panel/panel-elida-kd35t133: Use refcounted allocation in place of dev=
m_kzalloc()
      panel/feixin-k101-im2ba02: Use refcounted allocation in place of devm=
_kzalloc()
      panel/fy07024di26a30d: Use refcounted allocation in place of devm_kza=
lloc()
      panel/himax-hx83112a: Use refcounted allocation in place of devm_kzal=
loc()
      panel/himax-hx8394: Use refcounted allocation in place of devm_kzallo=
c()
      panel/ilitek-ili9322: Use refcounted allocation in place of devm_kzal=
loc()
      panel/ilitek-ili9341: Use refcounted allocation in place of devm_kzal=
loc()
      panel/panel-ili9805: Use refcounted allocation in place of devm_kzall=
oc()
      panel/ilitek-ili9806e: Use refcounted allocation in place of devm_kza=
lloc()
      panel/ilitek-ili9881c: Use refcounted allocation in place of devm_kza=
lloc()
      panel/innolux-ej030na: Use refcounted allocation in place of devm_kza=
lloc()
      panel/innolux-p079zca: Use refcounted allocation in place of devm_kza=
lloc()
      panel/jadard-jd9365da-h3: Use refcounted allocation in place of devm_=
kzalloc()
      panel/jdi-fhd-r63452: Use refcounted allocation in place of devm_kzal=
loc()
      panel/ltk050h3146w: Use refcounted allocation in place of devm_kzallo=
c()
      panel/ltk500hd1829: Use refcounted allocation in place of devm_kzallo=
c()
      panel/lg-lg4573: Use refcounted allocation in place of devm_kzalloc()
      panel/lincolntech-lcd197: Use refcounted allocation in place of devm_=
kzalloc()
      panel/magnachip-d53e6ea8966: Use refcounted allocation in place of de=
vm_kzalloc()
      panel/mantix-mlaf057we51: Use refcounted allocation in place of devm_=
kzalloc()
      panel/newvision-nv3051d: Use refcounted allocation in place of devm_k=
zalloc()
      panel/newvision-nv3052c: Use refcounted allocation in place of devm_k=
zalloc()
      panel/novatek-nt35510: Use refcounted allocation in place of devm_kza=
lloc()
      panel/novatek-nt35560: Use refcounted allocation in place of devm_kza=
lloc()
      panel/novatek-nt35950: Use refcounted allocation in place of devm_kza=
lloc()
      panel/novatek-nt36523: Use refcounted allocation in place of devm_kza=
lloc()
      panel/novatek-nt36672e: Use refcounted allocation in place of devm_kz=
alloc()
      panel/novatek-nt39016: Use refcounted allocation in place of devm_kza=
lloc()
      panel/lcd-olinuxino: Use refcounted allocation in place of devm_kzall=
oc()
      panel/orisetech-ota5601a: Use refcounted allocation in place of devm_=
kzalloc()
      panel/orisetech-otm8009a: Use refcounted allocation in place of devm_=
kzalloc()
      panel/raydium-rm67191: Use refcounted allocation in place of devm_kza=
lloc()
      panel/raydium-rm67200: Use refcounted allocation in place of devm_kza=
lloc()
      panel/raydium-rm68200: Use refcounted allocation in place of devm_kza=
lloc()
      panel/raydium-rm692e5: Use refcounted allocation in place of devm_kza=
lloc()
      panel/raydium-rm69380: Use refcounted allocation in place of devm_kza=
lloc()
      panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-ams581vf01: Use refcounted allocation in place of devm_=
kzalloc()
      panel/samsung-ams639rq08: Use refcounted allocation in place of devm_=
kzalloc()
      panel/samsung-atna33xc20: Use refcounted allocation in place of devm_=
kzalloc()
      panel/samsung-db7430: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-ld9040: Use refcounted allocation in place of devm_kzal=
loc()
      panel/samsung-s6d16d0: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6d27a1: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6d7aa0: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6e3fa7: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6e3ha2: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6e3ha8: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-s6e63j0x03: Use refcounted allocation in place of devm_=
kzalloc()
      panel/s6e88a0-ams427ap24: Use refcounted allocation in place of devm_=
kzalloc()
      panel/samsung-s6e8aa0: Use refcounted allocation in place of devm_kza=
lloc()
      panel/samsung-sofef00: Use refcounted allocation in place of devm_kza=
lloc()
      panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzall=
oc()
      panel/sharp-ls037v7dw01: Use refcounted allocation in place of devm_k=
zalloc()
      panel/sharp-ls060t1sx01: Use refcounted allocation in place of devm_k=
zalloc()
      panel/sitronix-st7701: Use refcounted allocation in place of devm_kza=
lloc()
      panel/sitronix-st7703: Use refcounted allocation in place of devm_kza=
lloc()
      panel/sitronix-st7789v: Use refcounted allocation in place of devm_kz=
alloc()
      panel/sony-acx565akm: Use refcounted allocation in place of devm_kzal=
loc()
      panel/sony-td4353-jdi: Use refcounted allocation in place of devm_kza=
lloc()
      panel/truly-nt35521: Use refcounted allocation in place of devm_kzall=
oc()
      panel/panel-summit: Use refcounted allocation in place of devm_kzallo=
c()
      panel/synaptics-r63353: allocation in place of devm_kzalloc()
      panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzal=
loc()
      panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzal=
loc()
      panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc()
      panel/visionox-r66451: Use refcounted allocation in place of devm_kza=
lloc()
      panel/visionox-rm69299: Use refcounted allocation in place of devm_kz=
alloc()
      panel/visionox-rm692e5.c: Use refcounted allocation in place of devm_=
kzalloc()
      panel/visionox-vtdr6130: Use refcounted allocation in place of devm_k=
zalloc()
      panel/widechips-ws2401: Use refcounted allocation in place of devm_kz=
alloc()
      panel/xinpeng-xpp055c272: Use refcounted allocation in place of devm_=
kzalloc()
      panel/s6e88a0-ams452ef01: Use refcounted allocation in place of devm_=
kzalloc()
      panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzal=
loc()
      panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc()
      panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc=
()

Aradhya Bhatia (4):
      drm/atomic-helper: Refactor crtc & encoder-bridge op loops into separ=
ate functions
      drm/atomic-helper: Separate out bridge pre_enable/post_disable from e=
nable/disable
      drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
      drm/bridge: cdns-dsi: Use pre_enable/post_disable to enable/disable

Arthur Grillo (5):
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions
      drm/vkms: Add how to run the Kunit tests

Asahi Lina (1):
      drm/shmem-helper: Add lockdep asserts to vmap/vunmap

Boris Brezillon (2):
      drm/panthor: Add missing explicit padding in drm_panthor_gpu_info
      drm/panthor: Fix the user MMIO offset logic for emulators

Casey Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible string
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq

Chris Brandt (1):
      drm: renesas: rz-du: Add atomic_pre_enable

Chris Morgan (3):
      dt-bindings: vendor-prefixes: Add prefix for Huiling
      dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
      drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c

Christian K=F6nig (2):
      drm/ttm: revert "Export ttm_bo_get_unless_zero()"
      drm/ttm: make ttm_bo_get internal

Cristian Ciocaltea (19):
      drm/connector: hdmi: Evaluate limited range after computing format
      drm/connector: hdmi: Add support for YUV420 format verification
      drm/connector: hdmi: Improve debug message for supported format
      drm/connector: hdmi: Add missing bpc debug info to hdmi_try_format_bp=
c()
      drm/connector: hdmi: Factor out bpc and format computation logic
      drm/connector: hdmi: Use YUV420 output format as an RGB fallback
      drm/tests: hdmi: Replace '[_]MHz' with 'mhz'
      drm/tests: hdmi: Switch to 'void *' type for EDID data
      drm/tests: hdmi: Add macro to simplify EDID setup
      drm/tests: hdmi: Replace open coded EDID setup
      drm/tests: hdmi: Drop unused drm_kunit_helper_connector_hdmi_init_fun=
cs()
      drm/tests: hdmi: Setup ycbcr_420_allowed before initializing connector
      drm/tests: hdmi: Switch to drm_atomic_get_new_connector_state() where=
 possible
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with YUV420 only
      drm/tests: hdmi: Add limited range tests for YUV420 mode
      drm/tests: hdmi: Rename max TMDS rate fallback tests
      drm/tests: hdmi: Provide EDID supporting 4K@30Hz with RGB/YUV
      drm/tests: hdmi: Add max TMDS rate fallback tests for YUV420 mode
      drm/tests: hdmi: Add test for unsuccessful fallback to YUV420

Dan Carpenter (1):
      drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()

Dave Airlie (2):
      ttm/pool: allow debugfs dumps for numa pools.
      drm/ttm: handle undefined printf arg evaluation order in debugfs

Devarsh Thakkar (3):
      dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
      drm/tidss: Update infrastructure to support K3 DSS cut-down versions
      drm/tidss: Add support for AM62L display subsystem

Dmitry Baryshkov (9):
      drm/bridge: move private data to the end of the struct
      drm/bridge: allow limiting I2S formats
      drm/connector: add CEC-related fields
      drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
      drm/display: add CEC helpers code
      drm/display: hdmi-state-helper: handle CEC physical address
      drm/display: bridge-connector: hook in CEC notifier support
      drm/display: bridge-connector: handle CEC adapters
      drm/bridge: adv7511: switch to the HDMI connector helpers

Douglas Anderson (1):
      drm/panel-edp: Clarify the `prepare_to_enable` description in comments

Emily Deng (1):
      drm/ttm: Should to return the evict error

Ernest Van Hoecke (1):
      drm/panel-edp: Add support for AUO G156HAN03.0 panel

Geert Uytterhoeven (1):
      drm/sitronix: Remove broken backwards-compatibility layer

Herbert Xu (1):
      dma-buf: Add forward declaration of struct seq_file in dma-fence.h

Huan Yang (2):
      Revert "udmabuf: fix vmap_udmabuf error page set"
      udmabuf: fix vmap missed offset page

Hugo Villeneuve (1):
      drm: renesas: rz-du: Implement MIPI DSI host transfers

Jani Nikula (5):
      drm/panel: abstract of_panel_find()
      drm/panel: use fwnode based lookups for panel followers
      drm/i915/panel: add panel register/unregister
      drm/i915/panel: register drm_panel and call prepare/unprepare for ICL=
+ DSI
      drm/i915/panel: sync panel prepared state at register

Jeff Hugo (2):
      accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)
      accel/qaic: Use dev_printk() in RAS

Jens Glathe (1):
      drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16

Jernej Skrabec (7):
      drm: sun4i: de2/de3: add mixer version enum
      drm: sun4i: de2/de3: refactor mixer initialisation
      drm: sun4i: de2/de3: add generic blender register reference function
      drm: sun4i: de2/de3: use generic register reference function for laye=
r configuration
      drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
      drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
      drm: sun4i: de33: mixer: add mixer configuration for the H616

Jessica Zhang (1):
      MAINTAINERS: Update my email address for DRM Panel reviews

Jocelyn Falempe (1):
      MAINTAINERS: Add entries for drm_panic, drm_panic_qr_code and drm_log

Jonas Karlman (1):
      dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible

Karol Wachowski (1):
      accel/ivpu: Add inference_timeout_ms module parameter

Karunika Choo (2):
      drm/panthor: Add 64-bit and poll register accessors
      drm/panthor: Clean up 64-bit register definitions

Lad Prabhakar (2):
      dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
      drm: renesas: rz-du: Add support for RZ/V2H(P) SoC

Langyan Ye (1):
      drm/panel-edp: Add KDC KD116N3730A05

Liu Ying (13):
      dt-bindings: display: imx: Add i.MX8qxp Display Controller processing=
 units
      dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
      dt-bindings: display: imx: Add i.MX8qxp Display Controller display en=
gine
      dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel engi=
ne
      dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI perfor=
mance counter
      dt-bindings: display: imx: Add i.MX8qxp Display Controller command se=
quencer
      dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller in=
terrupt controller
      dt-bindings: display: imx: Add i.MX8qxp Display Controller
      drm/imx: Add i.MX8qxp Display Controller display engine
      drm/imx: Add i.MX8qxp Display Controller pixel engine
      drm/imx: Add i.MX8qxp Display Controller interrupt controller
      drm/imx: Add i.MX8qxp Display Controller KMS
      MAINTAINERS: Add maintainer for i.MX8qxp Display Controller

Louis Chauvet (3):
      drm/vkms: Document pixel_argb_u16
      drm: Export symbols to use in tests
      drm/vkms: Add support for DRM_FORMAT_R*

Luca Ceresoli (24):
      drm/bridge: anx7625: convert to devm_drm_bridge_alloc() API
      drm/bridge: cdns-dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: convert to devm_drm_brid=
ge_alloc() API
      drm/bridge: nxp-ptn3460: convert to devm_drm_bridge_alloc() API
      drm/bridge: sii902x: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dpi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: dsi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi4: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: hdmi5: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: sdi: convert to devm_drm_bridge_alloc() API
      drm/omap: dss: venc: convert to devm_drm_bridge_alloc() API
      drm/rcar-du: dsi: convert to devm_drm_bridge_alloc() API
      drm/bridge: stm_lvds: convert to devm_drm_bridge_alloc() API
      drm/sti: dvo: convert to devm_drm_bridge_alloc() API
      drm: zynqmp_dp: convert to devm_drm_bridge_alloc() API
      drm/bridge: add devm_drm_put_bridge()
      drm/bridge: panel: convert to devm_drm_bridge_alloc() API
      drm/bridge: fix build with CONFIG_OF=3Dn
      drm: convert many bridge drivers from devm_kzalloc() to devm_drm_brid=
ge_alloc() API
      drm/todo: add entry to remove devm_drm_put_bridge()
      drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc(=
) API
      drm/tests: bridge: convert to devm_drm_bridge_alloc() API
      drm/bridge: add a .destroy func
      drm/tests: bridge: add KUnit tests for devm_drm_bridge_alloc()

Lucas De Marchi (2):
      drm/xe: Fix NPD when saving default context
      drm/ttm: Fix build with CONFIG_DEBUG_FS=3Dn

Marek Vasut (3):
      dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
      drm/panel: ilitek-ili9881c: Allow configuration of the number of lanes
      drm/panel: ilitek-ili9881c: Add configuration for 7" Raspberry Pi 720=
x1280

Maxim Schwalm (1):
      drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Maxime Ripard (1):
      Merge drm-next-2025-05-28 into drm-misc-next

Michael Walle (2):
      dt-bindings: display: simple: add AUO P238HAN01 panel
      drm/panel-simple: add AUO P238HAN01 panel entry

Neil Armstrong (3):
      drm/panel: visionox-rm69299: add plumbing to support panel variants
      drm/panel: visionox-rm69299: switch to _multi variants
      drm/panel: visionox-rm69299: switch to devm_regulator_bulk_get_const()

Philipp Stanner (8):
      drm/sched: Fix outdated comments referencing thread
      drm/sched: Remove kthread header
      drm/vmwgfx: Use non-hybrid PCI devres API
      drm/nouveau: nouveau_fence: Standardize list iterations
      drm/nouveau: Simplify calls to nvif_event_block()
      drm/nouveau: Simplify nouveau_fence_done()
      drm/nouveau: Check dma_fence in canonical way
      drm/sched/tests: Use one lock for fence context

Pierre-Eric Pelloux-Prayer (10):
      drm/debugfs: Output client_id in in drm_clients_info
      drm/sched: Store the drm client_id in drm_sched_fence
      drm/sched: Add device name to the drm_sched_process_job event
      drm/sched: Cleanup gpu_scheduler trace events
      drm/sched: Trace dependencies for GPU jobs
      drm/sched: Add the drm_client_id to the drm_sched_run/exec_job events
      drm/sched: Cleanup event names
      drm: Get rid of drm_sched_job.id
      drm/doc: Document some tracepoints as uAPI
      drm/amdgpu: update trace format to match gpu_scheduler_trace

Rob Clark (1):
      drm/panel-edp: Add BOE NV133WUM-N61 panel entry

Robert Mader (1):
      drm: drm_fourcc: add 10/12/16bit software decoder YCbCr formats

Ryan Walklin (1):
      dt-bindings: allwinner: add H616 DE33 mixer binding

Ryosuke Yasuoka (2):
      drm/hyperv: Replace simple-KMS with regular atomic helpers
      drm/hyperv: Add support for drm_panic

Shixiong Ou (3):
      drm/shmem-helper: Import dmabuf without mapping its sg_table
      drm/ast: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT
      drm/udl: use DRM_GEM_SHMEM_DRIVER_OPS_NO_MAP_SGT

Simona Vetter (1):
      accel/qaic: delete qaic_bo.handle

Stefan Eichenberger (2):
      drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
      dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel

Sunil Khatri (1):
      drm/file: add client id to drm_file_error

Svyatoslav Ryhel (3):
      dt-bindings: display: panel: Document Renesas R61307 based DSI panel
      drm: panel: Add support for Renesas R61307 based MIPI DSI panel
      dt-bindings: display: panel: Document Renesas R69328 based DSI panel

Thomas Zimmermann (11):
      drm: Add helpers for programming hardware gamma LUTs
      drm/ast: Use helpers for programming gamma ramps and palettes
      drm/mgag200: Use helpers for programming gamma ramps
      drm/ofdrm: Use helpers for programming gamma ramps
      drm/vesadrm: Use helpers for programming gamma ramps
      drm/client: Do not pin in drm_client_buffer_vmap()
      drm/gem-vram: Do not set pin and unpin callbacks
      drm/gem-vram: Un-export pin helpers
      drm/gem: Inline drm_gem_pin() into PRIME helpers
      Merge drm/drm-next into drm-misc-next
      drm/arm/hdlcd: Replace struct simplefb_format with custom type

Tommaso Merciai (2):
      drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into adv7511=
_mode_set()
      drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into adv7=
533_dsi_config_timing_gen()

Tvrtko Ursulin (7):
      dma-fence: Change signature of __dma_fence_is_later
      drm/ttm: Respect the shrinker core free target
      drm/ttm: Increase pool shrinker batch target
      dma-fence: Use a flag for 64-bit seqnos
      dma-fence: Add helpers for accessing driver and timeline name
      sync_file: Use dma-fence driver and timeline name helpers
      drm/i915: Use dma-fence driver and timeline name helpers

Vivek Kasireddy (1):
      drm/virtio: Fix NULL pointer deref in virtgpu_dma_buf_free_obj()

Wolfram Sang (1):
      drm: renesas: rcar-du: use proper naming for R-Car

Zhang Enpei (1):
      drm/nouveau/dp: convert to use ERR_CAST()

hienhuynh (1):
      drm: rz-du: Support panels connected directly to the DPAD output

 Documentation/ABI/testing/sysfs-driver-qaic        |  18 +
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml    |  34 +-
 .../fsl,imx8qxp-dc-axi-performance-counter.yaml    |  57 ++
 .../display/imx/fsl,imx8qxp-dc-blit-engine.yaml    | 204 +++++++
 .../display/imx/fsl,imx8qxp-dc-blitblend.yaml      |  41 ++
 .../bindings/display/imx/fsl,imx8qxp-dc-clut.yaml  |  44 ++
 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml      |  67 +++
 .../display/imx/fsl,imx8qxp-dc-constframe.yaml     |  44 ++
 .../display/imx/fsl,imx8qxp-dc-display-engine.yaml | 152 +++++
 .../display/imx/fsl,imx8qxp-dc-dither.yaml         |  45 ++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml         |  72 +++
 .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml      | 141 +++++
 .../display/imx/fsl,imx8qxp-dc-filter.yaml         |  43 ++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml       |  64 ++
 .../display/imx/fsl,imx8qxp-dc-gammacor.yaml       |  32 +
 .../display/imx/fsl,imx8qxp-dc-layerblend.yaml     |  39 ++
 .../display/imx/fsl,imx8qxp-dc-matrix.yaml         |  44 ++
 .../display/imx/fsl,imx8qxp-dc-pixel-engine.yaml   | 250 ++++++++
 .../bindings/display/imx/fsl,imx8qxp-dc-rop.yaml   |  43 ++
 .../display/imx/fsl,imx8qxp-dc-safety.yaml         |  34 ++
 .../display/imx/fsl,imx8qxp-dc-scaling-engine.yaml |  83 +++
 .../display/imx/fsl,imx8qxp-dc-signature.yaml      |  53 ++
 .../bindings/display/imx/fsl,imx8qxp-dc-store.yaml |  96 +++
 .../bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml  |  45 ++
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml       | 236 ++++++++
 .../bindings/display/panel/himax,hx8394.yaml       |  17 +-
 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../bindings/display/panel/renesas,r61307.yaml     |  94 +++
 .../bindings/display/panel/renesas,r69328.yaml     |  73 +++
 .../bindings/display/panel/sitronix,st7701.yaml    |   1 +
 .../bindings/display/panel/visionox,rm69299.yaml   |   4 +-
 .../bindings/display/renesas,rzg2l-du.yaml         |  23 +-
 .../bindings/display/ti/ti,am65x-dss.yaml          |  21 +-
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |   2 +
 .../interrupt-controller/fsl,imx8qxp-dc-intc.yaml  | 318 ++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/drm-uapi.rst                     |  19 +
 Documentation/gpu/todo.rst                         |  15 +
 Documentation/gpu/vkms.rst                         |  15 +-
 MAINTAINERS                                        |  39 +-
 drivers/accel/amdxdna/aie2_ctx.c                   |   3 +-
 drivers/accel/habanalabs/common/device.c           |  25 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   1 +
 drivers/accel/ivpu/ivpu_hw.c                       |   4 +
 drivers/accel/ivpu/ivpu_pm.c                       |  15 +-
 drivers/accel/qaic/Makefile                        |   1 +
 drivers/accel/qaic/qaic.h                          |  10 +-
 drivers/accel/qaic/qaic_data.c                     |   1 -
 drivers/accel/qaic/qaic_drv.c                      |   6 +
 drivers/accel/qaic/qaic_ras.c                      | 642 +++++++++++++++++=
+++
 drivers/accel/qaic/qaic_ras.h                      |  10 +
 drivers/dma-buf/Kconfig                            |   1 -
 drivers/dma-buf/dma-fence-chain.c                  |   7 +-
 drivers/dma-buf/dma-fence.c                        |  66 ++-
 drivers/dma-buf/sw_sync.c                          |   2 +-
 drivers/dma-buf/sync_file.c                        |   8 +-
 drivers/dma-buf/udmabuf.c                          |  23 +-
 drivers/gpu/drm/adp/adp-mipi.c                     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |  32 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c   |   5 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |  23 +-
 drivers/gpu/drm/ast/ast_drv.c                      |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  69 ++-
 drivers/gpu/drm/bridge/adv7511/Kconfig             |   5 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  53 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |  77 +--
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c       |  57 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 357 +++++------
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   9 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   9 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   7 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |   8 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   9 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  72 +--
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   8 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   8 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   8 +-
 drivers/gpu/drm/bridge/cros-ec-anx7688.c           |   8 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   7 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   8 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   8 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  27 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   8 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   8 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   8 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   8 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   8 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   7 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   8 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |   9 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  11 +-
 drivers/gpu/drm/bridge/microchip-lvds.c            |   8 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   8 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   9 +-
 drivers/gpu/drm/bridge/panel.c                     |  12 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   8 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   7 +-
 drivers/gpu/drm/bridge/sii9234.c                   |   8 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   8 +-
 drivers/gpu/drm/bridge/simple-bridge.c             |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |   8 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358764.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   8 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   8 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   8 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |   8 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   8 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   8 +-
 drivers/gpu/drm/display/Kconfig                    |  13 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 107 ++++
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |   3 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 192 ++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  64 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 129 ++--
 drivers/gpu/drm/drm_atomic_helper.c                | 160 ++++-
 drivers/gpu/drm/drm_auth.c                         |  64 +-
 drivers/gpu/drm/drm_bridge.c                       |  19 +
 drivers/gpu/drm/drm_client.c                       |  35 +-
 drivers/gpu/drm/drm_color_mgmt.c                   | 209 +++++++
 drivers/gpu/drm/drm_connector.c                    |  41 ++
 drivers/gpu/drm/drm_debugfs.c                      |  10 +-
 drivers/gpu/drm/drm_file.c                         |   6 +-
 drivers/gpu/drm/drm_fourcc.c                       |  27 +
 drivers/gpu/drm/drm_gem.c                          |  32 -
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |   5 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  61 ++
 drivers/gpu/drm/drm_gem_vram_helper.c              |  79 +--
 drivers/gpu/drm/drm_internal.h                     |   4 -
 drivers/gpu/drm/drm_panel.c                        |  51 +-
 drivers/gpu/drm/drm_prime.c                        |  58 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   2 +-
 drivers/gpu/drm/hyperv/hyperv_drm.h                |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        | 210 +++++--
 drivers/gpu/drm/i915/display/icl_dsi.c             |   4 +
 drivers/gpu/drm/i915/display/intel_connector.c     |  23 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   4 +
 drivers/gpu/drm/i915/display/intel_panel.c         | 131 +++++
 drivers/gpu/drm/i915/display/intel_panel.h         |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_requests.c        |   4 +-
 drivers/gpu/drm/i915/i915_request.c                |   2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   4 +-
 drivers/gpu/drm/imagination/pvr_job.c              |   2 +-
 drivers/gpu/drm/imagination/pvr_queue.c            |   5 +-
 drivers/gpu/drm/imagination/pvr_queue.h            |   2 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   1 +
 drivers/gpu/drm/imx/dc/Kconfig                     |  13 +
 drivers/gpu/drm/imx/dc/Makefile                    |   7 +
 drivers/gpu/drm/imx/dc/dc-cf.c                     | 172 ++++++
 drivers/gpu/drm/imx/dc/dc-crtc.c                   | 555 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-de.c                     | 177 ++++++
 drivers/gpu/drm/imx/dc/dc-de.h                     |  59 ++
 drivers/gpu/drm/imx/dc/dc-drv.c                    | 293 ++++++++++
 drivers/gpu/drm/imx/dc/dc-drv.h                    | 102 ++++
 drivers/gpu/drm/imx/dc/dc-ed.c                     | 288 +++++++++
 drivers/gpu/drm/imx/dc/dc-fg.c                     | 376 ++++++++++++
 drivers/gpu/drm/imx/dc/dc-fl.c                     | 185 ++++++
 drivers/gpu/drm/imx/dc/dc-fu.c                     | 258 ++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h                     | 129 ++++
 drivers/gpu/drm/imx/dc/dc-fw.c                     | 222 +++++++
 drivers/gpu/drm/imx/dc/dc-ic.c                     | 282 +++++++++
 drivers/gpu/drm/imx/dc/dc-kms.c                    | 143 +++++
 drivers/gpu/drm/imx/dc/dc-kms.h                    | 131 +++++
 drivers/gpu/drm/imx/dc/dc-lb.c                     | 325 ++++++++++
 drivers/gpu/drm/imx/dc/dc-pe.c                     | 158 +++++
 drivers/gpu/drm/imx/dc/dc-pe.h                     | 101 ++++
 drivers/gpu/drm/imx/dc/dc-plane.c                  | 224 +++++++
 drivers/gpu/drm/imx/dc/dc-tc.c                     | 141 +++++
 drivers/gpu/drm/lima/lima_gem.c                    |   2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   6 +-
 drivers/gpu/drm/lima/lima_sched.h                  |   3 +-
 drivers/gpu/drm/lima/lima_trace.h                  |   6 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   8 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   8 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   8 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  10 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  10 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  10 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   8 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  82 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   8 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  72 +--
 drivers/gpu/drm/nouveau/nouveau_sched.c            |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c |   2 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |   7 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   7 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  26 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  26 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |  25 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |  23 +-
 drivers/gpu/drm/panel/Kconfig                      |  26 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-edp.c                  |   6 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |  10 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |  11 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  10 +-
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       |  10 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         | 153 ++++-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  10 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |  11 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9805.c       |  12 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      |  10 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 236 +++++++-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |  11 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  11 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   |  10 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c       |  10 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |  11 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |  11 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c          |  10 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c            |  11 +-
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c   |  11 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |  12 +-
 .../gpu/drm/panel/panel-magnachip-d53e6ea8966.c    |  11 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |  11 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |  10 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |  11 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  10 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |  12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35560.c      |  12 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c      |  10 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      |   9 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  10 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |  10 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |  11 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |  11 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |  11 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |  10 +-
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |  11 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |  11 +-
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |  10 +-
 drivers/gpu/drm/panel/panel-raydium-rm69380.c      |  10 +-
 drivers/gpu/drm/panel/panel-renesas-r61307.c       | 325 ++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c       | 281 +++++++++
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |  11 +-
 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c   |  10 +-
 drivers/gpu/drm/panel/panel-samsung-ams639rq08.c   |  10 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |  11 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c       |  11 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |  11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |  11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c      |  11 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  10 +-
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   |  10 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  11 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |  10 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |  11 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |  11 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |  10 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |  11 +-
 drivers/gpu/drm/panel/panel-simple.c               |  27 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      | 132 ++++-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |  11 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |  10 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |  10 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |  11 +-
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  11 +-
 drivers/gpu/drm/panel/panel-summit.c               |  10 +-
 drivers/gpu/drm/panel/panel-synaptics-r63353.c     |  11 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |  11 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |  10 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |  11 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |   9 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 257 +++++---
 drivers/gpu/drm/panel/panel-visionox-rm692e5.c     |  10 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    |  11 +-
 drivers/gpu/drm/panel/panel-widechips-ws2401.c     |  11 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |  10 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   5 +
 drivers/gpu/drm/panfrost/panfrost_device.h         |  15 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |  81 ++-
 drivers/gpu/drm/panfrost/panfrost_gem.c            | 186 ++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h            |  66 +++
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   2 +
 drivers/gpu/drm/panthor/panthor_device.h           |  89 +++
 drivers/gpu/drm/panthor/panthor_drv.c              |  63 +-
 drivers/gpu/drm/panthor/panthor_fw.c               |   9 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              | 159 ++---
 drivers/gpu/drm/panthor/panthor_gpu.h              |  12 +-
 drivers/gpu/drm/panthor/panthor_mmu.c              |  36 +-
 drivers/gpu/drm/panthor/panthor_regs.h             |  90 +--
 drivers/gpu/drm/panthor/panthor_sched.c            |   5 +-
 drivers/gpu/drm/panthor/panthor_sched.h            |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h    |   2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   8 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |  11 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |  44 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     | 206 ++++++-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h    |  54 ++
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c         |   9 +-
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h    | 103 +++-
 drivers/gpu/drm/scheduler/sched_entity.c           |  25 +-
 drivers/gpu/drm/scheduler/sched_fence.c            |   5 +-
 drivers/gpu/drm/scheduler/sched_internal.h         |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |  36 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |   8 +-
 drivers/gpu/drm/scheduler/tests/sched_tests.h      |   1 -
 drivers/gpu/drm/sitronix/Kconfig                   |  10 -
 drivers/gpu/drm/sti/sti_dvo.c                      |  29 +-
 drivers/gpu/drm/stm/lvds.c                         |   7 +-
 drivers/gpu/drm/sun4i/sun8i_csc.c                  |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                | 168 ++++--
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |  31 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |  27 +-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c            |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |  14 +-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c            |   6 +-
 drivers/gpu/drm/sysfb/ofdrm.c                      |  80 +--
 drivers/gpu/drm/sysfb/vesadrm.c                    | 100 ++--
 drivers/gpu/drm/tests/drm_bridge_test.c            | 176 ++++--
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 651 +++++++++++++++--=
----
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 232 ++++++++
 drivers/gpu/drm/tidss/tidss_crtc.c                 |   4 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                | 195 ++++--
 drivers/gpu/drm/tidss/tidss_dispc.h                |  13 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   1 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   1 +
 drivers/gpu/drm/ttm/ttm_bo_internal.h              |  58 ++
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |   2 +
 drivers/gpu/drm/ttm/ttm_device.c                   |   1 +
 drivers/gpu/drm/ttm/ttm_pool.c                     |  30 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |   3 +
 drivers/gpu/drm/udl/udl_drv.c                      |   2 +-
 drivers/gpu/drm/v3d/v3d_submit.c                   |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   1 +
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   3 +-
 drivers/gpu/drm/vkms/tests/Makefile                |   1 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c      | 280 +++++++++
 drivers/gpu/drm/vkms/vkms_drv.h                    |  35 ++
 drivers/gpu/drm/vkms/vkms_formats.c                | 467 ++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h                |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c                  |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  14 +-
 drivers/gpu/drm/xe/xe_hw_fence.c                   |   2 +-
 drivers/gpu/drm/xe/xe_sched_job.c                  |  17 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  31 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |   1 -
 include/drm/display/drm_hdmi_audio_helper.h        |   1 +
 include/drm/display/drm_hdmi_cec_helper.h          |  72 +++
 include/drm/drm_bridge.h                           | 337 ++++++++---
 include/drm/drm_color_mgmt.h                       |  27 +
 include/drm/drm_connector.h                        |  48 ++
 include/drm/drm_gem.h                              |   3 +-
 include/drm/drm_gem_shmem_helper.h                 |  15 +
 include/drm/drm_gem_vram_helper.h                  |   2 -
 include/drm/drm_prime.h                            |   3 +
 include/drm/gpu_scheduler.h                        |  15 +-
 include/drm/ttm/ttm_bo.h                           |  28 -
 include/linux/dma-fence.h                          |  32 +-
 include/trace/events/dma_fence.h                   |   4 +-
 include/uapi/drm/drm_fourcc.h                      |  36 ++
 include/uapi/drm/panfrost_drm.h                    |  21 +
 include/uapi/drm/panthor_drm.h                     |  41 ++
 381 files changed, 15325 insertions(+), 2785 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-qaic
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-axi-performance-counter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-blit-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-blitblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-clut.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-command-sequencer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-display-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-fetchunit.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-filter.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-gammacor.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-matrix.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-pixel-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-rop.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-safety.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-scaling-engine.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-signature.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-store.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc-tcon.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8q=
xp-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas=
,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas=
,r69328.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
fsl,imx8qxp-dc-intc.yaml
 create mode 100644 drivers/accel/qaic/qaic_ras.c
 create mode 100644 drivers/accel/qaic/qaic_ras.h
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_cec_helper.c
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
 create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dc/Makefile
 create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
 create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
 create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c
 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_internal.h
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_format_test.c
 create mode 100644 include/drm/display/drm_hdmi_cec_helper.h

--gyryeohxtq3m4fsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaErjIQAKCRAnX84Zoj2+
dknDAX9y0uKeelceWdgfQ0o9Z/nc6Q1x19gr5GZjJ/1l7KB10fQ3bjdtZ8A/DSil
wZqAhOMBgNspLdgJxgmpc+s9+Q05zodIDTDzs0TvTgvSVG1ltbSuv8oE8Rl57sJZ
091LqF3+9Q==
=dbfM
-----END PGP SIGNATURE-----

--gyryeohxtq3m4fsh--

