Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E51C3D7C2
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 22:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF22710E9D6;
	Thu,  6 Nov 2025 21:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="DggvZJ/h";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Nqd1d4pV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B3410E9D6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 21:24:01 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id E51B7EC0469;
 Thu,  6 Nov 2025 16:24:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 06 Nov 2025 16:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1762464240; x=1762550640; bh=9o
 KQwTXEDExuDpePu4/IiryecEusRNGDeOjxnQACPII=; b=DggvZJ/hbuQo/reuDP
 VgGrqgOoLIz7h2VTLuw3a8tLqjmqYsvcKxykOhB8vWU7aDjPMALXsIw3+9JoJY1N
 OHB5APzbun/ATYquFKRFQGB1u0/omVBCfaWFA1cC2ZJ688hVPK8Ptwbpk48Iu3jX
 murHM19Hy6SWrsb/V7TaLTmjF+Qkdu04o57RVI3uIELNLRCYX1oaCWEacEVXcR8T
 Qk+C4hdwb3uLkJX5agPGtfPKKUIBAPC2mY+VYjw2xxdU3X9QuMYbsoegpH9t5rV8
 QhIaV9pdNr2yIIFRQa9m6onh7TIMfJdn6XTTiT8VynNKT1A/xWYsl5Y+mgCMJjn4
 qQXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1762464240; x=1762550640; bh=9oKQwTXEDExuDpePu4/IiryecEus
 RNGDeOjxnQACPII=; b=Nqd1d4pV5/FRV397u72ol8ZZHdnXjE5Lif3sFBr738Tr
 0AtV0FvimsKscOlMIaRgvEXE3V1XhnbWjH2rLO95fUHqekgcP/8TmMrxuFX2yzCT
 5ivXHG1s1aim7SADs489sYLIQeiL+tmi7+eNurKd6h/8Cwol2SL6Qj+yJo+rd3lY
 ruMQSd9pel9QCxw+21mFay0h2Xl5cZcm34HGGQbbwPD+EZZNjqJ751cQskakvaJC
 pjCxO6jdyWlkpMFu3b6CXTb3TOOqH+LhU0ITMpxCCdjS+QmE0qZ3oGSITnym0oNh
 1Us5ngAc9wQjIiCtJzF4mm488bTvcNhpRllFd1Uutg==
X-ME-Sender: <xms:7xENaZKDQ-f0H8dipz7LmuqHyDvsvBVXBn1vUtZMY_l9C6rft_2VQg>
 <xme:7xENaRf7DbT9_Fibb6JPXsQ4PFBHpYTr4b6UywKuv5NE7971hNpC1WiUMALSRo_EA
 dnD5yiv8UnEF5Wfu8ffrhYT7sZz6QI1PaGniPuoW4dgHtZZJqaaw8U>
X-ME-Received: <xmr:7xENaTU1tF6Q8lqvbuA1NHqKONFerS-Xlmi6xK-Cg0a4w2m1IdbGc39C-WX4XFCkhZGedQkWqfqlQ54Si2lYaCeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
 ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
 esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedtheevfeeitddvkeeh
 ffdvtdfgffeigfduffeiveduvdefleeifeetkeegveegteenucffohhmrghinhepkhgvrh
 hnvghlrdhorhhgpdhfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
 gusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhm
 thhpohhuthdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrg
 hilhgsohigrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihgu
 vghrrdgsvgdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehfrhgrnhhk
 rdgsihhnnhhssehimhhgthgvtgdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehl
 ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesgh
 hmrghilhdrtghomhdprhgtphhtthhopehmrghtthdrtghoshhtvghrsehimhhgthgvtgdr
 tghomh
X-ME-Proxy: <xmx:7xENaXgEqYayuUJsvDwpDXQjhsJ35rE8ywSxpnEExcn3FrlIwWLD7g>
 <xmx:7xENaVhTfCFYfal8ykPc769Q9kIaKGlI6PrdPIYMVHE7NyXWsvpyIw>
 <xmx:7xENaUtlljyWtdtu-hPN0kojZbiUf4acGChKgndGy1KlkWf3oAis-Q>
 <xmx:7xENabs17mKqp3bZBnZBW-Iub0rf3vrbG_oJMKDHoSzCHiXEIa3evA>
 <xmx:8BENaed0UvF0zQMsFzkA12fZkJueziqw9hu30RYi3qBYcaOIPZZ7EdUO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:23:59 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] arm64: dts: renesas: Describe GPU on V3U
Date: Thu,  6 Nov 2025 22:23:40 +0100
Message-ID: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello,

This series adds the needed bindings to operate the PowerVR GPU on R-Car
V3U SoCs. The works build on the efforts of Marek in [1], and patch 1/2
depends that series. While patch 2/2 depends on the new clock id for the 
ZG clock posted [2].

I'm able to load the firmware from [3].

    powervr fd000000.gsx: [drm] loaded firmware powervr/rogue_15.5.1.64_v1.fw
    powervr fd000000.gsx: [drm] FW version v1.0 (build 6889268 OS)
    powervr fd000000.gsx: [drm] Unsupported quirks in firmware image
    [drm] Initialized powervr 1.0.0 for fd000000.gsx on minor 1

I can get run vulkaninfo from mesa.

    # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 meson devenv -C builddir vulkaninfo --summary
    'DISPLAY' environment variable not set... skipping surface info
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:73: FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:521: FINISHME: Missing support for brn62269
    MESA: warning: ../src/imagination/vulkan/pvr_border.c:117: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    ==========
    VULKANINFO
    ==========

    Vulkan Instance Version: 1.4.328


    Instance Extensions: count = 20
    -------------------------------
    VK_EXT_debug_report                    : extension revision 10
    VK_EXT_debug_utils                     : extension revision 2
    VK_EXT_headless_surface                : extension revision 1
    VK_EXT_surface_maintenance1            : extension revision 1
    VK_EXT_swapchain_colorspace            : extension revision 5
    VK_KHR_device_group_creation           : extension revision 1
    VK_KHR_display                         : extension revision 23
    VK_KHR_external_fence_capabilities     : extension revision 1
    VK_KHR_external_memory_capabilities    : extension revision 1
    VK_KHR_external_semaphore_capabilities : extension revision 1
    VK_KHR_get_display_properties2         : extension revision 1
    VK_KHR_get_physical_device_properties2 : extension revision 2
    VK_KHR_get_surface_capabilities2       : extension revision 1
    VK_KHR_portability_enumeration         : extension revision 1
    VK_KHR_surface                         : extension revision 25
    VK_KHR_surface_protected_capabilities  : extension revision 1
    VK_KHR_wayland_surface                 : extension revision 6
    VK_KHR_xcb_surface                     : extension revision 6
    VK_KHR_xlib_surface                    : extension revision 6
    VK_LUNARG_direct_driver_loading        : extension revision 1

    Instance Layers:
    ----------------

    Devices:
    ========
    GPU0:
            apiVersion         = 1.2.330
            driverVersion      = 25.99.99
            vendorID           = 0x1010
            deviceID           = 0x15001064
            deviceType         = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
            deviceName         = PowerVR Rogue GE7800
            driverID           = DRIVER_ID_IMAGINATION_OPEN_SOURCE_MESA
            driverName         = Imagination open-source Mesa driver
            driverInfo         = Mesa 26.0.0-devel (git-8fb0621f2d)
            conformanceVersion = 1.3.8.4
            deviceUUID         = 10131290-a76c-6b0d-6850-cdf5a340a60d
            driverUUID         = 2e8b7d4b-71a8-3b5a-e19f-86a7a450b7ab
    GPU1:
            apiVersion         = 1.4.330
            driverVersion      = 25.99.99
            vendorID           = 0x10005
            deviceID           = 0x0000
            deviceType         = PHYSICAL_DEVICE_TYPE_CPU
            deviceName         = llvmpipe (LLVM 21.1.4, 128 bits)
            driverID           = DRIVER_ID_MESA_LLVMPIPE
            driverName         = llvmpipe
            driverInfo         = Mesa 26.0.0-devel (git-8fb0621f2d) (LLVM 21.1.4)
            conformanceVersion = 1.3.1.1
            deviceUUID         = 6d657361-3236-2e30-2e30-2d6465766500

And test applications such as gears work as they should.

See individual patch for changelog.

1. https://lore.kernel.org/linux-renesas-soc/20251104135716.12497-1-marek.vasut+renesas@mailbox.org/
2. https://lore.kernel.org/linux-renesas-soc/20251106211604.2766465-1-niklas.soderlund%2Brenesas@ragnatech.se/
3. https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13

Niklas Söderlund (2):
  dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas
    R-Car V3U
  arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

 .../bindings/gpu/img,powervr-rogue.yaml         |  4 +++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi       | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.51.1

