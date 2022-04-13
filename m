Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE05001AE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4910F156;
	Wed, 13 Apr 2022 22:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DAE10F152
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:19:50 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C2EC85C0347;
 Wed, 13 Apr 2022 18:19:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 13 Apr 2022 18:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649888389; x=1649974789; bh=Ix
 LBprYD2crzgvrunvWymMhkE+BNBrBvN21E3wbwSFs=; b=F0pVSeeJEeN1Z2J7WT
 2sMD/Ww3ziFwKcYXwvLoicHMtLPYxUv98wFKu8AoOtsK00YNmglvA8b++NZ/DxLg
 OtcCt2AZjZfa/qVRgVDqwPyCOFuKEeKof/AiOp8kgUnZof16PdUbH+X/t5gmHLuv
 s6p7OrBqffK+IT8QVY32iD+oyVNWFnkma9/q9mLy4sZq/IuukJmv7IhPS09/j/Mq
 cJbaT3w2lH9pQPmThQhf4ir3Ka5IL0rK+uc7DQkx7n/8OajV8Y4TAOzEFPjheBdo
 G0Tum5uKE+RSsr3yr/OAFoKtlSMeiGpTqvndwMHSWzGURbvbT2OKxGRzhQottMaF
 2IBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1649888389; x=1649974789; bh=IxLBprYD2crzgvrunvWymMhkE+BNBrBvN21
 E3wbwSFs=; b=WHBYwoeJdEcfsRY7exrnwpuzazuw+st4toSxu0pPTvq2UaKL/+a
 hyzHJM1H4mohKKXkkyM0NOygsRl1XqqIGjwSX7Jj5s7F8R58wWbVSQye0psNMAnd
 +U7TZYi053Tk13RPWLCP/EqiahCyQteZk+dB3FMgOhzQ3nfTI1DHcjEUndB7tbza
 reNqUjwq8EmnHJpDPGZYg04pAnFYH8oBlvJACrrlB3eoDI8RjURVYckVxKwQPe1H
 ziPmtc1FZTC5exk5RP9I7iiW2VzYsW4Q40QH4pm7wii4LsJdUuXTsPJY5PiYVNAZ
 vtj8D14l++mzYOgkQ6DYfgEK22Qc3O3sphQ==
X-ME-Sender: <xms:hUxXYpviu3SplvEBuzVQzCxj24wSzkkb3cPrkmcMqquTXkZzBm2N2Q>
 <xme:hUxXYifacBrxLBK_zklbk_BlLX8F6du3M0-ha3STfxLuffbb80Wrkws23DwXeIsRv
 JTm9x19gI6E254Scg>
X-ME-Received: <xmr:hUxXYsxEYIs_KwvGV7BKkf5udtjZFV8QOkleoGfeKBalk-OqfXFOjVM76Te_-kWXcVM5apxcizGh9ybnUlOpj86p4n73TQF5GMCmMy0gmNpVoYZN-j0RH7x0DK-y2HuAkG2Scg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelvddguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefhvddvjeevleduteevveeiieetudejheetgeevgefhveehtdegieet
 jeevgeduveenucffohhmrghinhepphhinhgvieegrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:hUxXYgP_v27Gd3MKzFtDqt2kVC3JGeqelAOByojBEsBMJoSpO9ibXQ>
 <xmx:hUxXYp8K5JPfkOl_4YkzTZKl4Cd_UvJ8PGSXBD5eSAyMR-G6JSj4dQ>
 <xmx:hUxXYgX8HQdle_OqA-eBsXLQqvGcAfEgQJ9OIR6qsKmz0rNZ6C9s8A>
 <xmx:hUxXYp_pyOQeLmYo3hEfuOCGDXR-rM59OZmdIQ4to7qpz5SM2bT-xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Apr 2022 18:19:48 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 14/16] drm/panel-simple: Add eInk ED103TC2
Date: Wed, 13 Apr 2022 17:19:14 -0500
Message-Id: <20220413221916.50995-15-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413221916.50995-1-samuel@sholland.org>
References: <20220413221916.50995-1-samuel@sholland.org>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <x@xff.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Andreas Kemnade <andreas@kemnade.info>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ED103TC2 is a 10.3" 1872x1404 eInk panel which supports up to 16 levels
of grayscale and an 85 Hz frame rate. The timings and polarities here
were taken from the manufacturer's datasheet.

Since this panel is an electrophoretic display (EPD), the color depth is
independent from the bus width. Instead, it is largely determined by the
number of frames in the selected waveform. Each pixel uses two parallel
data lines to specify one of only three states each frame: positive,
negative, or no voltage.

This specific panel has a 16-bit data bus, allowing it to update 8
pixels during each source driver (horizontal) clock cycle. As a result,
the horizontal timings given in the datasheet were all multiplied by 8
to convert the units from clock cycles to pixels.

Since the 16-bit data bus is double the width of the usual 8-bit bus
used by eInk panels, the source driver clock will be half the usual
frequency. This is signified by the DRM_MODE_FLAG_CLKDIV2 flag.

The hskew parameter provides the spacing between the horizontal sync
puls and the gate driver (vertical) clock pulse. This spacing is
symmetrical on both sides, so it can be used to compute the gate
driver clock pulse width.

Datasheet: https://files.pine64.org/doc/quartz64/Eink%20P-511-828-V1_ED103TC2%20Formal%20Spec%20V1.0_20190514.pdf
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..c6b104ba01ee 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1686,6 +1686,34 @@ static const struct panel_desc edt_etmv570g2dhu = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode eink_ed103tc2_mode = {
+	.clock = 266693,
+	.hdisplay = 1872,
+	.hsync_start = 1872 + 184,
+	.hsync_end = 1872 + 184 + 88,
+	.htotal = 1872 + 184 + 88 + 64,
+	.hskew = 136,
+	.vdisplay = 1404,
+	.vsync_start = 1404 + 12,
+	.vsync_end = 1404 + 12 + 1,
+	.vtotal = 1404 + 12 + 1 + 4,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC |
+		 DRM_MODE_FLAG_HSKEW | DRM_MODE_FLAG_CLKDIV2,
+};
+
+static const struct panel_desc eink_ed103tc2 = {
+	.modes = &eink_ed103tc2_mode,
+	.num_modes = 1,
+	.bpc = 4,
+	.size = {
+		.width = 210,
+		.height = 157,
+	},
+	.bus_format = MEDIA_BUS_FMT_FIXED,
+	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing eink_vb3300_kca_timing = {
 	.pixelclock = { 40000000, 40000000, 40000000 },
 	.hactive = { 334, 334, 334 },
@@ -3807,6 +3835,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,etmv570g2dhu",
 		.data = &edt_etmv570g2dhu,
+	}, {
+		.compatible = "eink,ed103tc2",
+		.data = &eink_ed103tc2,
 	}, {
 		.compatible = "eink,vb3300-kca",
 		.data = &eink_vb3300_kca,
-- 
2.35.1

