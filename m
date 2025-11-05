Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD5C39C86
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66AF10E142;
	Thu,  6 Nov 2025 09:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="NhzFzh1W";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="zDAWe+oP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081310E7CC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 23:28:10 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 95B831400064;
 Wed,  5 Nov 2025 18:28:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 05 Nov 2025 18:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1762385289; x=1762471689; bh=IF
 G9LoInDO5UFENlRqUuT8o2P7vuWSbU2uYlFz3QN6c=; b=NhzFzh1WDk2Rq1DpJQ
 8rBbYCcIm1k0PxuNOmurxQaeKYVtGoAc2pJE5I9VHLnpF2QIIfo9uCjtI6uxrEwp
 PckH1PiQDyquUE/ayi/4MMErEZTtOSi70iMzmzoFk+OF6sEAEPftbB5KMEBy7DyJ
 X3Volh08lXTeZHZSII1Fahq8YVDVX/JsCuuPykSp5Lct2xCb6kzQ+PzyB+jLnVWh
 2h8qqFEKxc8mwgslEYrcKS8n057S30RLXzcHmMO+wtWBc8lkOSONn1cZ8ir0aVj9
 h9+l0OH6TUj8kKL91/W66gCN2p/zn9Xuq8awgl+kMIT0jZLqgWRJ6CvIf+sONq7l
 CoQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1762385289; x=1762471689; bh=IFG9LoInDO5UFENlRqUuT8o2P7vu
 WSbU2uYlFz3QN6c=; b=zDAWe+oP/QOtVCFSHbO61UcXOIGgHhlOZUTua8Yez99x
 IHtwKRJ/Veg5XlrReslCfr96KfwZzCF2okH5XEeqKrDlcD8FQi+Ob16yF0vj6Ul/
 khJj4Fa+ijx2E1o9cA4g1sqHVFZ96ZahU5sKHgVc7LdSvyZDLk86h6YLWuJwnJyW
 LY2tUYVMvfA74XOW3GmpmS8HrIi0Csm3kNaC+uiS195+ZRRpczHRLZ/FQZQ9MtUT
 tA6gULMXm3702UUfRoOZhoWrMaLQFelvL3e45jW/lsxGpI86JlXk0qKmJ8EViMot
 6FMcTPzyKu9SQSXzIohsZ4/4f0omkgkIkMDTpDsa+g==
X-ME-Sender: <xms:iN0LaWOCtY4dUxCYWUjxrSFVkH9xMQYzlpaUiHHn5FYK0fP1De0pwA>
 <xme:iN0LaRRAM5G-75dd-8kYHS5X30T2mC8KAQqhFMyDgmgd0SpQFqoeRWj5VV2pBUUTP
 w7AxSaiyGmNGDAaO_ykUyJld0iPPizL5xn8eyrrUd0X7aAaoxqwR_o>
X-ME-Received: <xmr:iN0Lae7iyQItoWZ5S2VOqD3lK3dFEOXpT5J6b5VKb95U46Z1FyGlzA9yXonYOmLeeZfUNWH7BkrrA1nRRLBMwzqE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:iN0LaT0yhHINqNKtGQgyGthb9buXaUVm98Lkplr33z6SXnVIcIYZuQ>
 <xmx:iN0LaTnOiYDNrvqyi8DIeDUStvtycJpzHIccISOTQ7fA5Q5JzHum9w>
 <xmx:iN0LaRjdJTfpn1abPkHhky5oHCJHVdL8EdMLeiszIUI9ZL0r9rhzTA>
 <xmx:iN0LaQRmoi5R1UJVB9GFJ2me3qZuwEkq7qEIzQIhd3E0W6oqMAnvYA>
 <xmx:id0LaTxzoMBRVbYlcUHHgsuT0AF4UxdIzIm7bgOcie-YSFz2cLeS-uSy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:28:08 -0500 (EST)
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
Subject: [PATCH 0/2] arm64: dts: renesas: Describe GPU on V3U
Date: Thu,  6 Nov 2025 00:27:35 +0100
Message-ID: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Nov 2025 09:19:09 +0000
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
depends that series.

I'm able to load the firmware from [2].

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

1. https://lore.kernel.org/linux-renesas-soc/20251104135716.12497-3-marek.vasut%2Brenesas@mailbox.org/
2. https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13

Niklas Söderlund (2):
  dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas
    R-Car V3U
  arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

 .../bindings/gpu/img,powervr-rogue.yaml         |  4 +++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi       | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.51.1

