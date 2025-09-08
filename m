Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55448B49BC5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA2310E5DC;
	Mon,  8 Sep 2025 21:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="qmZ97XLJ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="d4uCOw7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673710E5DC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:23:34 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 75F41EC023B;
 Mon,  8 Sep 2025 17:23:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 08 Sep 2025 17:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm3; t=1757366613; x=1757453013; bh=5/
 TBrTrTItocQ3nnjkaRH6zdwedtJCQEVNvNg9qx5Q4=; b=qmZ97XLJdloRyumrIw
 Oxt+m34ISc7FHdPXrgmOcXRHhVglLtZSsXwB7e0WYLo8hyGoX0X8lczADoGPHZW4
 rnaBCikBdgpJ+lqC5FLFBBRU2QQLY2gyIwbdB+cN8FhZanRpO3yNpn8oM/C9OJlv
 A6WP5u5P4laczDTmlIDkQP7X5ce43Z640e0aFFQJaBo7Et7gx3xwHSXWkr0NbKec
 ctiCDyHzQ1R3AeTD8ITOTF8YUhZr8QgFp5kDraBeCXmTzSbeKz9Dp+1d9EgPO0kU
 6MNOOgHydUvJ/VPCTpxHDa8eoewQN/9JC1UD89ZfEFCQjHTCOwJVLyL9CGCU5amC
 TzwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1757366613; x=1757453013; bh=5/TBrTrTItocQ3nnjkaRH6zdwedt
 JCQEVNvNg9qx5Q4=; b=d4uCOw7YzHNyv8UPAZoKxElX694g2rnRsTdH92+w4XkD
 BfCG+EitL54pFz1ql4tyP6/F8dudihZJSmPKy71EHKQPbF5KidSE7Ze6pof8Rg/p
 TMQXTZxVvN+ajukcE/6fO6KrpthidZDk+g+DXZcfQyE2ZWu1lhZpAJG1JOeaP27z
 Y4XeYESJSj3SbjUEhB8yvN8BoZZZq9fsFECg9WmtkPENQABJk/jxtfwdmMjxmxf7
 qmiiNTqh+1eyFBrPtUhiDVazSmsANsdWYgwxJ+y7wPzp1XRlqqUu9JOmKL9ewK4W
 VOfRTPChi6bNHYVgKibo9bJA26FbaebSmvJttPFewQ==
X-ME-Sender: <xms:VEm_aLi-ZkujrJ6Wy2A_sy9lUkIt8JXQ3FUAeu1Xp5hwGIT1voTkYw>
 <xme:VEm_aLGFLfxNWbCiI36tLbKxaStbfsdubBCCk6PmNuS6aMS46neqU4Z92Pbcz4f3X
 hMcTTwA2DLSillcWk8>
X-ME-Received: <xmr:VEm_aFvKyF75JxPiQ5jivAjN9MWXpIS1x-7vT5w1HdD7oS176Ngwc-I1FFvwmleKahgTKdTO38vg6I3ecM_ryaLIEhsjEannYvV6EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
 uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
 ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeelpdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtg
 hpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 hhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhgsuggvvh
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
 lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvggthhesthhoohhtrg
 hirdhnvghtpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggv
 shhkthhophdrohhrghdprhgtphhtthhopehtrhgvughinhhgsehnvhhiughirgdrtghomh
 dprhgtphhtthhopehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:VEm_aEdiMhAf4m9hPbzH4KvAf3lI0H4JSYvSGGbYKkf80ufRgKlsuQ>
 <xmx:VEm_aDkL9Og7D86exAuH0p0SEjpgp9ksgr0bA8A_jFWOo_hugpRtvA>
 <xmx:VEm_aPAN_Pq2T-rdHTzxwb0gqegkJpYYWx7TzHqEWpXkJMbB3ihbRg>
 <xmx:VEm_aFNRktRRcsXutrasiaxH4DIObpYuquWnVrDbXKylX2mbocDgOA>
 <xmx:VUm_aNTdIbhYWKLMBCMflulYoBDsy1LWveIaEbFpQH4QzSpBHiwqiQJq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Sep 2025 17:23:32 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 08 Sep 2025 23:23:28 +0200
Subject: [PATCH v2] fbdev/simplefb: Fix use after free in
 simplefb_detach_genpds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-simplefb-genpd-uaf-v2-1-f88a0d9d880f@jannau.net>
X-B4-Tracking: v=1; b=H4sIAE9Jv2gC/32NQQ6CMBBFr0Jm7Zi2FEldcQ/DotIpjNFCWiAaw
 t2tHMDle8l/f4NEkSnBtdgg0sqJx5BBnQroBht6QnaZQQlVCSMkJn5NT/J37ClMDhfrsaxULXR
 9kVYZyMMpkuf3Eb21mQdO8xg/x8cqf/ZvbpUoUTjjS1vqTruuedgQ7HIONEO77/sXlNKqD7UAA
 AA=
X-Change-ID: 20250901-simplefb-genpd-uaf-352704761a29
To: Hans de Goede <hansg@kernel.org>, Helge Deller <deller@gmx.de>, 
 Thierry Reding <treding@nvidia.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Huhardeaux <tech@tootai.net>, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6883; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=D4fTDyKt7m0DoPEY7fyNBQ/mWmRv3ZrJQMo02fP1EYA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoz9nkEuCXVfUh2O/YlsNjCsNXz3tvCydKo2l+2ktmtf1
 r7h61/cUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLxPxkZTnpw8UbfCjq+Jfa5
 XfnS7+9TI/bJS2WHXPb56fJpe8/s74wMs3+5bjq7z1L0ydVzofWsFowOfU/llvXu5z27/mmM5vQ
 d/AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

The pm_domain cleanup can not be devres managed as it uses struct
simplefb_par which is allocated within struct fb_info by
framebuffer_alloc(). This allocation is explicitly freed by
unregister_framebuffer() in simplefb_remove().
Devres managed cleanup runs after the device remove call and thus can no
longer access struct simplefb_par.
Call simplefb_detach_genpds() explicitly from simplefb_destroy() like
the cleanup functions for clocks and regulators.

Fixes an use after free on M2 Mac mini during
aperture_remove_conflicting_devices() using the downstream asahi kernel
with Debian's kernel config. For unknown reasons this started to
consistently dereference an invalid pointer in v6.16.3 based kernels.

[    6.736134] BUG: KASAN: slab-use-after-free in simplefb_detach_genpds+0x58/0x220
[    6.743545] Read of size 4 at addr ffff8000304743f0 by task (udev-worker)/227
[    6.750697]
[    6.752182] CPU: 6 UID: 0 PID: 227 Comm: (udev-worker) Tainted: G S                  6.16.3-asahi+ #16 PREEMPTLAZY
[    6.752186] Tainted: [S]=CPU_OUT_OF_SPEC
[    6.752187] Hardware name: Apple Mac mini (M2, 2023) (DT)
[    6.752189] Call trace:
[    6.752190]  show_stack+0x34/0x98 (C)
[    6.752194]  dump_stack_lvl+0x60/0x80
[    6.752197]  print_report+0x17c/0x4d8
[    6.752201]  kasan_report+0xb4/0x100
[    6.752206]  __asan_report_load4_noabort+0x20/0x30
[    6.752209]  simplefb_detach_genpds+0x58/0x220
[    6.752213]  devm_action_release+0x50/0x98
[    6.752216]  release_nodes+0xd0/0x2c8
[    6.752219]  devres_release_all+0xfc/0x178
[    6.752221]  device_unbind_cleanup+0x28/0x168
[    6.752224]  device_release_driver_internal+0x34c/0x470
[    6.752228]  device_release_driver+0x20/0x38
[    6.752231]  bus_remove_device+0x1b0/0x380
[    6.752234]  device_del+0x314/0x820
[    6.752238]  platform_device_del+0x3c/0x1e8
[    6.752242]  platform_device_unregister+0x20/0x50
[    6.752246]  aperture_detach_platform_device+0x1c/0x30
[    6.752250]  aperture_detach_devices+0x16c/0x290
[    6.752253]  aperture_remove_conflicting_devices+0x34/0x50
...
[    6.752343]
[    6.967409] Allocated by task 62:
[    6.970724]  kasan_save_stack+0x3c/0x70
[    6.974560]  kasan_save_track+0x20/0x40
[    6.978397]  kasan_save_alloc_info+0x40/0x58
[    6.982670]  __kasan_kmalloc+0xd4/0xd8
[    6.986420]  __kmalloc_noprof+0x194/0x540
[    6.990432]  framebuffer_alloc+0xc8/0x130
[    6.994444]  simplefb_probe+0x258/0x2378
...
[    7.054356]
[    7.055838] Freed by task 227:
[    7.058891]  kasan_save_stack+0x3c/0x70
[    7.062727]  kasan_save_track+0x20/0x40
[    7.066565]  kasan_save_free_info+0x4c/0x80
[    7.070751]  __kasan_slab_free+0x6c/0xa0
[    7.074675]  kfree+0x10c/0x380
[    7.077727]  framebuffer_release+0x5c/0x90
[    7.081826]  simplefb_destroy+0x1b4/0x2c0
[    7.085837]  put_fb_info+0x98/0x100
[    7.089326]  unregister_framebuffer+0x178/0x320
[    7.093861]  simplefb_remove+0x3c/0x60
[    7.097611]  platform_remove+0x60/0x98
[    7.101361]  device_remove+0xb8/0x160
[    7.105024]  device_release_driver_internal+0x2fc/0x470
[    7.110256]  device_release_driver+0x20/0x38
[    7.114529]  bus_remove_device+0x1b0/0x380
[    7.118628]  device_del+0x314/0x820
[    7.122116]  platform_device_del+0x3c/0x1e8
[    7.126302]  platform_device_unregister+0x20/0x50
[    7.131012]  aperture_detach_platform_device+0x1c/0x30
[    7.136157]  aperture_detach_devices+0x16c/0x290
[    7.140779]  aperture_remove_conflicting_devices+0x34/0x50
...

Reported-by: Daniel Huhardeaux <tech@tootai.net>
Cc: stable@vger.kernel.org
Fixes: 92a511a568e44 ("fbdev/simplefb: Add support for generic power-domains")
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- reworked change due to missed use of `par->num_genpds` before setting
  it. Missed in testing due to FB_SIMPLE vs. SYSFB_SIMPLEFB.
- Link to v1: https://lore.kernel.org/r/20250901-simplefb-genpd-uaf-v1-1-0d9f3a34c4dc@jannau.net
---
 drivers/video/fbdev/simplefb.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 1893815dc67f4c1403eea42c0e10a7ead4d96ba9..2f3e5449509d1824a3d26f73e103af82d56d558a 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -93,6 +93,7 @@ struct simplefb_par {
 
 static void simplefb_clocks_destroy(struct simplefb_par *par);
 static void simplefb_regulators_destroy(struct simplefb_par *par);
+static void simplefb_detach_genpds(void *res);
 
 /*
  * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
@@ -105,6 +106,7 @@ static void simplefb_destroy(struct fb_info *info)
 
 	simplefb_regulators_destroy(info->par);
 	simplefb_clocks_destroy(info->par);
+	simplefb_detach_genpds(info->par);
 	if (info->screen_base)
 		iounmap(info->screen_base);
 
@@ -451,7 +453,7 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 				  struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	unsigned int i;
+	unsigned int i, num_genpds;
 	int err;
 
 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
@@ -465,26 +467,33 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 		return err;
 	}
 
-	par->num_genpds = err;
+	num_genpds = err;
 
 	/*
 	 * Single power-domain devices are handled by the driver core, so
 	 * nothing to do here.
 	 */
-	if (par->num_genpds <= 1)
+	if (num_genpds <= 1)
 		return 0;
 
-	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
+	par->genpds = devm_kcalloc(dev, num_genpds, sizeof(*par->genpds),
 				   GFP_KERNEL);
 	if (!par->genpds)
 		return -ENOMEM;
 
-	par->genpd_links = devm_kcalloc(dev, par->num_genpds,
+	par->genpd_links = devm_kcalloc(dev, num_genpds,
 					sizeof(*par->genpd_links),
 					GFP_KERNEL);
 	if (!par->genpd_links)
 		return -ENOMEM;
 
+	/*
+	 * Set par->num_genpds only after genpds and genpd_links are allocated
+	 * to exit early from simplefb_detach_genpds() without full
+	 * initialisation.
+	 */
+	par->num_genpds = num_genpds;
+
 	for (i = 0; i < par->num_genpds; i++) {
 		par->genpds[i] = dev_pm_domain_attach_by_id(dev, i);
 		if (IS_ERR(par->genpds[i])) {
@@ -506,9 +515,10 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 			dev_warn(dev, "failed to link power-domain %u\n", i);
 	}
 
-	return devm_add_action_or_reset(dev, simplefb_detach_genpds, par);
+	return 0;
 }
 #else
+static void simplefb_detach_genpds(void *res) { }
 static int simplefb_attach_genpds(struct simplefb_par *par,
 				  struct platform_device *pdev)
 {

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250901-simplefb-genpd-uaf-352704761a29

Best regards,
-- 
Janne Grunau <j@jannau.net>

