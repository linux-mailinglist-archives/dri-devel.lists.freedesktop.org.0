Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDDECF169B
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 23:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F710E1FE;
	Sun,  4 Jan 2026 22:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="QjHera+H";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="csyfBFOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BD310E1CE
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 22:28:43 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3E5457A00C4;
 Sun,  4 Jan 2026 17:28:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 04 Jan 2026 17:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm1; t=1767565722; x=1767652122; bh=DN
 I9SlYSsxQZ5zIwbhqK2NavWhLhE+JXTMeM6sCSlvk=; b=QjHera+H3ZFBTBoVhl
 wOjuUhhdBgc0+TNdqgf49yFol5qAlP8rNKpKdcW7epjwPes+CFv51pOoJ92abhAJ
 WW1sWy7tuOYfhWr9Zo8gUCIXe0QsN2XROias3uqnAsesyfmKp5KDl1sUR9EPAdJv
 PV2ZJJmY7PelYaSQMxeGhfzaZf50exU9OS6V5GOAOGA/2eaIfCGkYIG2+VYipGoC
 rBTltf03Cr2/JkWk3A9ygyD5OM21/prwhV31HAmL9pihGyat40PZrQxDns74btXT
 xkVWu+XqcJbQNiP586UhPCHCPF/Rl8EDjOoe3VvBwMxuUZk6bU/PPsA3x11RsBrZ
 pKEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1767565722; x=1767652122; bh=DNI9SlYSsxQZ5zIwbhqK2NavWhLh
 E+JXTMeM6sCSlvk=; b=csyfBFOmO6Qc/TDeDIHS2rC56KPkroxY4iXK3x9LZkhA
 Vp0CMcuDvAwdVAxY5zTnF1u7voFYnOuW0rMNdmjPRS5Gy+5zrNOii7GQ07azPcB1
 ZlwOXFK8LGxF353xWX6jf3NE8o8xPeiqu7CNd7Ai0Vq0pM27jvlzT5FBNV0nZ5Mm
 fdzPVJr6ocxPyT1X/hQqRTxQV4fNPl7BurNSpQlbExFhHWBzvpWQ6QkEYMxz4zXC
 aAF9tyW0q0BhckVumQlGqxNujDEy1Sjq1VKYIrivHHy/9EdXI1n2GuAiRFc1I9K1
 APNDbXmypilQlJtYNUXsm9U33BM2ZiGEWKkVBz0nhw==
X-ME-Sender: <xms:mOlaaZzSXJl1J0GWxuVdaK8HUOCc7m-CRQKIi8jRxjytUlIHdXMw7A>
 <xme:mOlaaVmeD8_iyrvbR3y-C8RLMJCiW_04jpQLIf5yQV44lFNlef70wsjWM2P24SSin
 Gg6xcyWZFlNggZX_hAXgCsKJ-jJQuDhS9tCsFDhc_y7IMc1FLWbaw>
X-ME-Received: <xmr:mOlaaU8E7BP4v39aK1LoF0JSAOtCyHA2BNONwIa1GySNQDmgPLSxvR-qSkaiaRhBF0Va5NDWi94-XayaYlEjkTo1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelheeivdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
 npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
 hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnheptdehveefiedtvdekheff
 vddtgfffiefgudffieevuddvfeelieefteekgeevgeetnecuffhomhgrihhnpehkvghrnh
 gvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnug
 esrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhht
 phhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrih
 hlsghogidrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggv
 rhdrsggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
 htthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrghnkhdr
 sghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhi
 nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmh
 grihhlrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsthgvrhesihhmghhtvggtrdgt
 ohhm
X-ME-Proxy: <xmx:mOlaaYqOdUvbHlpGrpotCjy4EMZ_aN5wXpXI-4MwutXgKpDbOcmjxA>
 <xmx:mOlaaQJJN5UqohPJVCB9jX1SyJ8Cx4WnSx57Jn3lUxqiOojzKvD0GA>
 <xmx:mOlaaa26n2D4HH40CkCZ_p7_smxtO28AHlQDxQOhT2wO0MaBOlJP0Q>
 <xmx:mOlaaXWc9c-HPdrYNSKUMjr-lji_m57lgAzQnpomNhGOFhogEDsozg>
 <xmx:mulaaWld1ZzdhECyl84oHkRwOaAGy6O0JH7Lw_p8uOpLfD4VXt_wOH5k>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jan 2026 17:28:40 -0500 (EST)
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
Subject: [PATCH 0/2] arm64: dts: renesas: Describe GPU on D3
Date: Sun,  4 Jan 2026 23:26:51 +0100
Message-ID: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
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
D3 SoC.

Together with the D3 clock changes [1] and a still OOT patch for the PVR 
driver [2], I'm able to load firmware.

    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_22.67.54.30_v1.fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6889268 OS)
    powervr fd000000.gpu: [drm] Unsupported quirks in firmware image
    powervr fd000000.gpu: [drm] Unsupported enhancements in firmware image
    powervr fd000000.gpu: [drm] Unsupported features in firmware image
    [drm] Initialized powervr 1.0.0 for fd000000.gpu on minor 1

I can run vulkaninfo from mesa (need to add the driver to 
pvr_drm_configs):

    $ PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 meson devenv -C builddir vulkaninfo --summary
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: Warning: The available RAM is below the minimum required by the Vulkan specification!
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
    	deviceID           = 0x22054030
    	deviceType         = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
    	deviceName         = PowerVR Rogue GE8300
    	driverID           = DRIVER_ID_IMAGINATION_OPEN_SOURCE_MESA
    	driverName         = Imagination open-source Mesa driver
    	driverInfo         = Mesa 26.0.0-devel (git-8fb0621f2d)
    	conformanceVersion = 1.3.8.4
    	deviceUUID         = 19031a08-e22f-9565-d78b-ddda8240380a
    	driverUUID         = 48685174-7bd0-6840-5716-9d00003566aa
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
    	driverUUID         = 6c6c766d-7069-7065-5555-49440000000

I can't run test Vulkan applications such as gears as the PVR driver do 
not support all features need for GE8300, for example 
simple_internal_parameter_format_v1, see [3].

1. https://lore.kernel.org/linux-renesas-soc/20260104205601.1587576-1-niklas.soderlund+renesas@ragnatech.se/T/#u
2. https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38211#note_3177232
3. https://gitlab.freedesktop.org/imagination/mesa/-/issues/13

Niklas Söderlund (2):
  dt-bindings: gpu: img,powervr-rogue: Document GE8300 GPU in Renesas
    R-Car D3
  arm64: dts: renesas: r8a77995: Add GE8300 GPU node

 .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 15 ++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.52.0

