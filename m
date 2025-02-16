Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F3A372F3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 10:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12FA10E245;
	Sun, 16 Feb 2025 09:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Ile7MGPc";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Odj4lsrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E94C10E231
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 09:02:44 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 2FE8811400FC;
 Sun, 16 Feb 2025 03:56:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 03:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739696192; x=
 1739782592; bh=z3pfBs7YzSNuzdyOnOJTsOCqr/BPrhVKuBEh6b67oZY=; b=I
 le7MGPcoHf1hOwtxjnEufpPuTyl6umRCR9Wg58M0lfLXwtvrdHpZpfHDnq0r0QL2
 MaWz7Gul29uAF8eQh2vyrJaIY6WO9nnNQPbuwU0+5pwkyqKPE12SeVjbzJlBrvst
 3LwzH4lby767hL+GrAsdJYyOlq58JRBIbBksDOvOa6Ubj20/oHge9p+6mbP4SyWV
 /DhOFnswXiXoRm6tF1TmzcsltEvKfvmiJufIZ6pSjbAzyUsbDBCnh8R1j2i20Lwi
 YjEFaBZPVFVZMplxmwygFBllBQy+hHGJ0yjbysEjFzPui/8czzauNGpWbA5CsNH2
 asZrwhBeqDQQdehSdjSwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739696192; x=1739782592; bh=z
 3pfBs7YzSNuzdyOnOJTsOCqr/BPrhVKuBEh6b67oZY=; b=Odj4lsrPeO+Nkp+rS
 Wd2iniGZ3F8Rfx9PlAbgDNrzLRcFmyexfJgGfpKLgyhAAjcniDPfqSydfiGsYSnD
 waoEsJXjymTpu6oPtCG/1gGaI01iRMbkN2iYy4gm+EiKKPzr9EBp3V0EwAEtMcCQ
 0PW7hnVBp0MeJlkbX0hgvs38REovm61QbadRwtJo8VTuLl9DxiJuRDxfv7Y1ZYsW
 nor7WwLEF4Vj8i0JHLWjfgDGZqxGOHHXTZ63q/MIOeLV7+aQphntSBlG9/3YsbAe
 OS0vhJVSw21/Vzldjabnee/lX5GHHbNg215PPSW5N+yBDH2eyw62KqHv6KP0IJl5
 PKlvw==
X-ME-Sender: <xms:P6ixZ0gC8c0Ds2l1rXok0gNgG2MCfCCSBiyPqu_k0061fmzBn80qvg>
 <xme:P6ixZ9DEAAqB9e10vNOc3_P5_cl231geGtUNgtF6GdAC6KHiu71M02YODlgmg2CsN
 o75rWYkdeONvBWFqA>
X-ME-Received: <xmr:P6ixZ8EER7qsaWPRc5Wsbxitynzzajk9YMKXFUG93RxLiR4cB0V_qBBRYBDLkZOse5AVgQzEpKEvOcSJKLqudCdx6R4LS4-W3MRGdoXCoCuB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:P6ixZ1TYUSNtdbWM7A0jXKjK6x3XUnN-mG4tz_uKEU4seLFLQESRBQ>
 <xmx:P6ixZxxY6BN8DJhWGAfgJ8JCLwkteDGSsNAxNtNocueetzqXxq-91w>
 <xmx:P6ixZz5IzTudUTjPkFDryfzVE8h5oGUTktFIntx-v7pZMyZoQOcqUQ>
 <xmx:P6ixZ-wHFbW8dNcVLre9FoCvm9Q3ggLYa5l6Mby6-Y3kQ-BLBoAMYQ>
 <xmx:QKixZ2hbvGLw_xtrq-v9L__roDkJKvGKBwzTMQ73N_Oz1djCohNlpJ-M>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:56:25 -0500 (EST)
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
Subject: [PATCH v6 07/27] drm: sun4i: de3: add formatter flag to mixer config
Date: Sun, 16 Feb 2025 21:50:38 +1300
Message-ID: <20250216085432.6373-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Only the DE3 (and newer) display engines have a formatter module. This
could be inferred from the is_de3 flag alone, however this will not
scale with addition of future DE versions in subsequent patches.

Add a separate flag to signal this in the mixer configuration.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa309..a170f68708b1f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -717,6 +717,7 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.is_de3		= true,
+	.has_formatter	= 1,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
 	.scanline_yuv	= 4096,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0c..8417b8fef2e1f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -163,6 +163,7 @@ enum {
  * @mod_rate: module clock rate that needs to be set in order to have
  *	a functional block.
  * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
+ * @has_formatter: true, if mixer has formatter core, for 10-bit and YUV handling
  * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
  */
 struct sun8i_mixer_cfg {
@@ -172,6 +173,7 @@ struct sun8i_mixer_cfg {
 	int		ccsc;
 	unsigned long	mod_rate;
 	unsigned int	is_de3 : 1;
+	unsigned int    has_formatter : 1;
 	unsigned int	scanline_yuv;
 };
 
-- 
2.48.1

