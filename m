Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F3B3DE00
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B19C10E3E7;
	Mon,  1 Sep 2025 09:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="jJkFmExS";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="mxt9M1w0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Mon, 01 Sep 2025 09:21:10 UTC
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B1810E3E7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:21:10 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B976A7A00E2;
 Mon,  1 Sep 2025 05:12:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Mon, 01 Sep 2025 05:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1756717974; x=1756804374; bh=SP
 HadFh9HxajytO1/5tbW7NlX857Ehz5RAZeJmX89Yg=; b=jJkFmExSFSC1eUsvzh
 zgQqexcH+p+PtKGuPtu9c7InDWOwum8OdNz4JH7O2w1ntpJd6Lzm8q+uLScqUtPZ
 XD0+QNvO55dhvKz9q+OQ4P7q7gcKsXmscx+9IEb/xJJm7MWKNgqnAE4vbK/1ha8c
 N+ehWsHBi0RTn6ODkgWqwJd5lNGRHFo6M24T3hFprIOf/r5e8M2D33xO0qLHblrC
 ZDzvn/x6SRp0TwJu/Cq12IePLB2Qa83Fob/XjBr/zyoGB3Ol2T87ZdpfrVvXwGsr
 K/adJFyD1h8SN+x7WP0Rmcd1TYklKf88tmiDe/aAmqXHnA+dTAHa3yF1JsRpNEiT
 XlyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1756717974; x=1756804374; bh=SPHadFh9HxajytO1/5tbW7NlX857
 Ehz5RAZeJmX89Yg=; b=mxt9M1w0cW0DptNYPyjYfDc6ZaTcC6FprKcYmyuaYoqF
 2VO2E1kV8O1FSYIwjF2HDLeD30ZkLmXZIJ/xMNaxk7Y81hk+nLN+xZ6BXF0xj346
 ZrKdTVdsgiT1yfyVOn8ICxlFTfizSIvrqClwK4fNsvmB0jT+EEm1XEGeA4/Uxa9g
 eoVRhCA+c25jUc8I6ACV/gI1OAtfWt66HhncFGVziEWgE6xTkbcejTjDdlyPtwwa
 rMlpzcDmH7zfiQB8hzlrb0Z+MmO1CupbGDcCPHgDLhmSpuwPK7XdBkvef6KV3Mdp
 TO1oTdd4im+4ftO8mK3T6KTVRFDRWjtLX8EONxHL5A==
X-ME-Sender: <xms:lWO1aET5GBi-W7rahTwEyS3GN4-x_DyuFcPoe2j0H2DDWTaJQJvMjg>
 <xme:lWO1aNdy6-iqHYmHHUMirUriEGKuhgMqemkWIXkmAPS2EHFgY89ir_RIT5p9Q4WyX
 DiyhH-ICMC_74DDYPU>
X-ME-Received: <xmr:lWO1aOQQFjY2xl3iogA2C5ZVXFXciBwt9_kaDNnvnMyQezvxO_2LNoKnkpj0VLdnZMYT0B_H6uDRH7QJD-ahxsVYIesladM3kVBs_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledujeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfffie
 ffteeuffetuefggefhgfehtdfhkefgtdejueeuvdevkeetveevvdffkeehnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
 hnvghtpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
 pehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 epughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgt
 phhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopeguvghllhgvrhesghhmgi
 druggvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
 rdhorhhgpdhrtghpthhtohepthgvtghhsehtohhothgrihdrnhgvthdprhgtphhtthhope
 hsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhg
 sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrhgvughinhhgsehnvhhiughirgdrtg
 homh
X-ME-Proxy: <xmx:lWO1aBLh34AXbBGfsbg-fU0EvJBzHX7krwbkkb8hBTcVto7LvzsTnA>
 <xmx:lWO1aDJ4I_WKHs00ZVjMLKuKIBQd1SLj2_CPOioWYTbIhjIf2fPXuA>
 <xmx:lWO1aEiC7_uIURdNsgMs9MH5kgBN9sFGbdC2v5B-qPisEyXkxN69Dw>
 <xmx:lWO1aFM52cAQX-LPI5caDTy2YIjvbh5chB7m9ivw730Y0Zjptr9vqg>
 <xmx:lmO1aDUWv4nxEDAc6S2suqcfXxgeH_HC42d17FBk4HoMu6VkdxNOfHYE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 05:12:53 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 01 Sep 2025 11:12:45 +0200
Subject: [PATCH] fbdev/simplefb: Fix use after free in simplefb_detach_genpds()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-simplefb-genpd-uaf-v1-1-0d9f3a34c4dc@jannau.net>
X-B4-Tracking: v=1; b=H4sIAIxjtWgC/x3MTQqAIBBA4avIrBtQ+8OuEi2sxhooE6UIorsnL
 b/Few8kikwJOvFApIsTHz5DFQKm1fqFkOds0FLX0kiFifewkRtxIR9mPK3DstatrNpGWW0ghyG
 S4/uf9sP7fsK6ROdkAAAA
X-Change-ID: 20250901-simplefb-genpd-uaf-352704761a29
To: Hans de Goede <hansg@kernel.org>, Helge Deller <deller@gmx.de>, 
 Thierry Reding <treding@nvidia.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Huhardeaux <tech@tootai.net>, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6069; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wutNVAbp3dfG7ym5Z5nxrvnUXjfIKhxTM7oCA1K2ZZ8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoytyZPfqtrvt+I4c9IiRXCO8mr5pxPSBFac1JeUPb4qM
 Xa1a0FURykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkwzGT4K2i+JeZJQFZ8xHpd
 B24p/gmZtxpEzQ+Uu0V9/13ittNzGyPDg2sH8+5f3v3zXoZL4MpjC+5I6DNPUPfXzOvfwCMbJ5j
 BDQA=
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
 drivers/video/fbdev/simplefb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 1893815dc67f4c1403eea42c0e10a7ead4d96ba9..cd5193e704ffe1ccc178c13916a462446af9cb14 100644
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
 
@@ -465,13 +467,11 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 		return err;
 	}
 
-	par->num_genpds = err;
-
 	/*
 	 * Single power-domain devices are handled by the driver core, so
 	 * nothing to do here.
 	 */
-	if (par->num_genpds <= 1)
+	if (err <= 1)
 		return 0;
 
 	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
@@ -485,6 +485,12 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
 	if (!par->genpd_links)
 		return -ENOMEM;
 
+	/*
+	 * Set num_genpds only after genpds and genpd_links are allocated to
+	 * exit early from simplefb_detach_genpds() without full initialisation.
+	 */
+	par->num_genpds = err;
+
 	for (i = 0; i < par->num_genpds; i++) {
 		par->genpds[i] = dev_pm_domain_attach_by_id(dev, i);
 		if (IS_ERR(par->genpds[i])) {
@@ -506,9 +512,10 @@ static int simplefb_attach_genpds(struct simplefb_par *par,
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

