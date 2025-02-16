Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CDA372EA
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C6310E22D;
	Sun, 16 Feb 2025 09:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="pqvTlHDg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="eE/hQFSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Sun, 16 Feb 2025 09:02:43 UTC
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A507010E22D
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:43 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfout.stl.internal (Postfix) with ESMTP id C739211400C9;
 Sun, 16 Feb 2025 03:55:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 03:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1739696136; x=1739782536; bh=yc/OGNNe0t
 7oweukj3agJIukSLwXQE6GK5Qx/JrDtk8=; b=pqvTlHDgxcvSRiOk1Vu6gKjz0G
 uPDoT3sgzQ8fqZ66roibPrXJcHxksmye9M6X850bDr6YyaLVs+yk7hcsvmPS52lB
 2HORsPvg9pZGYJaOuSN5B5g+ja1vu6nVqqsDLcFP4ch0v0KCilKFPv2k6GeTq7Wj
 1cL71t/fKIddN0n2V3duQVAybF0XEPm2kw/PHZr7MgcvZ8x+bVzX9McBfBB/RUtV
 6UAm8pAFVLCxmspDfg+zBVju5pJNcb0dXd8KMars7TMMGKoDYJ4t0eYqQstynAwO
 0MHkBd69zCg4Bfym2f9KvixUJYrDQpEdo2IzdHHlNCC36mWreOzMbbVBilBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739696136; x=1739782536; bh=yc/OGNNe0t7oweukj3agJIukSLwXQE6GK5Q
 x/JrDtk8=; b=eE/hQFSjSwcXTb1Tv+26nn1UpiYZQRLKfNsX1RQOrrrUt7OIvcl
 ZEbZ96MoEo6pMy0l46e4WQ9dQg28coy1zd818Tk4OesnH6awLqERzrs901N7raB2
 Wxu584u9pEEDNnOBF2DqakT2FR4fek8VIR2qKvjNkeEE0e6epqkwccq5bD0hRNIt
 KIkLvIiNh99qjmfUIY1CRmHBAy56jLPBR6GkQ3E6Nbj82pwoKdN87XuQTJGiBTq5
 kuO6j9QZ3SZFIyf4Gfv44AC4zSnSw7F81uC4qmXLIM4KscOdNE4NEEdJQJH7Fcc9
 Sjt2O37FS0IP83Rt/k11/Vy8oyRIyBj/Cow==
X-ME-Sender: <xms:B6ixZ7EfeotdF9l8TO4VnIy2jT2oHkf5ju3vgQ_csQRlVyduqb3Sww>
 <xme:B6ixZ4WgmhhsZmgCeNXZwTMr9vSLa2DMECLkCdWr5DC2t7O4qL9JZLcnGwggcN6Jk
 vMOkyIgxnKybFUu_g>
X-ME-Received: <xmr:B6ixZ9IuCq4ZogM0_dy_jwXAlAPzmHzDNS6IPjD_-ra8KoAOkPUHyJt1dOH5CAEmFM48_XyBv3qYKPjNLWplzibib5zJLbaZi4DM2AfLqhmH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
 hfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtg
 homheqnecuggftrfgrthhtvghrnhepuddvueduueegtdeuffetveevgeehhedvhfefuddu
 veekgffgfedtheegtefhhfffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphht
 thhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrugeskh
 gvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
 thhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtoh
 hmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthho
 pegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlsehffh
 iflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdr
 tghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpth
 htoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:B6ixZ5EH4sq8ub-RBV97g1YTr-zUax7ZDNaxL9bLhY8pr2DeQP9AoA>
 <xmx:B6ixZxVD-WgU1ham-IYZHMi61Hqq8UOn_8unwYY3braeuaTGZQEDWA>
 <xmx:B6ixZ0MKqTLGF9pa_6hdaGm8wveGOPu1Dg4-Ma3Y6DXvNMyeCgTxhg>
 <xmx:B6ixZw0ik3MZiiQ-EABRRb-IqF72KeE2SvHkBcTtuzCrUhUFNvHgdA>
 <xmx:CKixZ_nhGtM9uf_sAXpN3W4VjOyNhC3ICod7VkZEsSj-zmMzmocGS_NA>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:55:28 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>
Subject: drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sun, 16 Feb 2025 21:50:31 +1300
Message-ID: <20250216085432.6373-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

Subject: [PATCH v6 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support

Hi All,

v6 of this patch adding support for the Allwinner DE33 display engine, used in the H616 family of SoCs. v6 includes some small fixes to the device tree documentation, improves naming of an enum type, moves colorspace configuration from the sunxi engine object to the mixer object, and a handful of very small style and whitespace changes. All comments/tags from previous versions addressed. No functional change from v5. 

A v1 patch to enable LCD output for the Anbernic RGnnXX family of devices which use this SoC with an RGB LCD will be submitted shortly.

Thanks to those who have reviewed and tested previous versions, and to Jernej for the initial patch.

Original blurb below:

There is existing mainline support for the DE2 and DE3 AllWinner display pipeline IP blocks, used in the A64 and H6 among others, however the H700 (as well as the H616/H618 and the T507 automotive SoC) have a newer version of the Display Engine (v3.3/DE33) which adds additional high-resolution support as well as YUV colour formats and AFBC compression support.

This patch set adds DE33 support, following up from the previous RFC [1], with significant rework to break down the previous relatively complex set into more logical steps, detailed below.

1. Refactor the existing DE2/DE3 code in readiness to support YUV colour formats in the DE3 engine (patches 1-4).
2. Add YUV420 colour format support in the DE3 driver (patches 5-13).
3. Replace the is_de3 mixer flag with an enum to support multiple DE versions (patch 14).
4. Refactor the mixer, vi_scaler and some register code to merge common init code and more easily support multiple DE versions (patches 15-18).
5. Add Arm Frame Buffer Compression (AFBC) compressed buffer support to the DE3 driver. This is currently only supported for VI layers (for HW-decoded video output) but is well integrated into these changes and a subsequent patchset to enable the Video Engine is planned. (patch 19).
6. Add DT bindings for the DE33 engine. (patches 20-22).
7. Extend the DE2/3 driver for the DE33, comprising clock, mixer, vi_scaler, fmt and csc module support (patches 23-27).

Further patchsets are planned to support HDMI and the LCD timing controller present in these SoCs.

Regards,

Ryan

--
Changelog v5..v6:
- Rename color format enum from format_type to sun8i_format_type
- Move color format and encoding flags from engine to mixer and add sun8i_color_model struct.
- Add commit updating the sun50i_fmt_setup function signature
- Pass mixer instead of engine in several places now that mixer holds color information.
- Update sun8i_mixer_cfg struct comment regarding change from is_de3 flag to de_type
- convert usage of uint64_t to u64 as suggested by checkpatch.pl
- Increase reg maxItems to 3 for bus and mixer binding documentation, and add constraint for h616-de33-mixer.
- Add Tested-by: tags


Jernej Skrabec (21):
  drm: sun4i: de2/de3: Change CSC argument
  drm: sun4i: de2/de3: Merge CSC functions into one
  drm: sun4i: de2/de3: call csc setup also for UI layer
  drm: sun4i: de2: Initialize layer fields earlier
  drm: sun4i: de3: Add YUV formatter module
  drm: sun4i: de3: add format enumeration function to engine
  drm: sun4i: de3: add formatter flag to mixer config
  drm: sun4i: de3: add YUV support to the DE3 mixer
  drm: sun4i: de3: pass mixer reference to ccsc setup function
  drm: sun4i: de3: add YUV support to the color space correction module
  drm: sun4i: de3: add YUV support to the TCON
  drm: sun4i: support YUV formats in VI scaler
  drm: sun4i: de2/de3: add mixer version enum
  drm: sun4i: de2/de3: refactor mixer initialisation
  drm: sun4i: vi_scaler refactor vi_scaler enablement
  drm: sun4i: de2/de3: add generic blender register reference function
  drm: sun4i: de2/de3: use generic register reference function for layer
    configuration
  drm: sun4i: de3: Implement AFBC support
  drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support

Ryan Walklin (6):
  drm: sun4i: de3: refactor YUV formatter module setup
  dt-bindings: allwinner: add H616 DE33 bus binding
  dt-bindings: allwinner: add H616 DE33 clock binding
  dt-bindings: allwinner: add H616 DE33 mixer binding
  clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
  drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support

 .../bus/allwinner,sun50i-a64-de2.yaml         |   7 +-
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml   |   1 +
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  21 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  25 ++
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  28 +-
 drivers/gpu/drm/sun4i/sun50i_afbc.c           | 250 +++++++++++++
 drivers/gpu/drm/sun4i/sun50i_afbc.h           |  87 +++++
 drivers/gpu/drm/sun4i/sun50i_fmt.c            | 100 ++++++
 drivers/gpu/drm/sun4i/sun50i_fmt.h            |  32 ++
 drivers/gpu/drm/sun4i/sun8i_csc.c             | 330 +++++++++++++++---
 drivers/gpu/drm/sun4i/sun8i_csc.h             |  20 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 226 +++++++++---
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  53 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  41 ++-
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c       |   2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 133 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c       | 115 +++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h       |   2 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h          |  29 ++
 20 files changed, 1291 insertions(+), 214 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_afbc.h
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_fmt.h

-- 
2.48.1

