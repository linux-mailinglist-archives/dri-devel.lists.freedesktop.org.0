Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3543992027
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 19:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8D10E185;
	Sun,  6 Oct 2024 17:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="LNrJaNqz";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ocfEBbqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Sun, 06 Oct 2024 17:56:08 UTC
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209910E185
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 17:56:08 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 6E80A138018A;
 Sun,  6 Oct 2024 13:49:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 06 Oct 2024 13:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
 t=1728236988; x=1728323388; bh=AfSsgTqM5w43AUCeKZ3QLusnX3h3Z379
 cmP5qn+dYAM=; b=LNrJaNqz8VaPGMzwvq5l16hRvny6mgjuy/mYeWaAwXmm6KA4
 t3KWAFcun2CbGTGE4Eo26VzmpASMCbf2Zn0X7ArxZAkK0ookxOlrC9vPsgSzqBqE
 EtaSvCAjvagr3z23ZN8P5KTV+iniq4V3QrZwMXvjD/V9LRUsPOnSaVpNZla5+Pr3
 0wmFeOC72oySLMw2QdcNv9v+OOp0rA8kn6H2j/BL68Emj4zakWPX3bKK7oEo9Hjy
 3fg77b1MGYDXsVgHEIHxAyWywVx41NUdU+N9kI8iryrLjtL766clkvVkh05XJnDU
 CNuoKO7OWUfBcIpny9vHSUBZQfM51X+g+95UUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1728236988; x=1728323388; bh=AfSsgTqM5w43AUCeKZ3QLusnX3h3Z379cmP
 5qn+dYAM=; b=ocfEBbqhfakLxZfZiBTowg0OHklfPJdtee3ESSzKxB6V2FdE18V
 pY8OeipuYl4ZgMlgJ9Jy615WlI7lEkAy6xDR7Ah+pGRx3sHJq5iY7oTr+9rmiMmk
 r5FJIud9K0CAjgRs4cNEowY8+cy5y+OgAQsjsqx83rH6c/AKWC5DVPaUo2lsJ9J+
 EtncqWyidg72CcV5gvZnKpP2XgFMoYaFtoSdhPjdJX0HAMiX2wLclq5brt0Cun8G
 5utt/LyHxQCgrGSkbWJCFOXJbJcPQr37Ml/XzGCJ8Wt1XO3c4deeAwDysUT+NTeq
 T9owpjS2ghVEpOeiIHX0Fg2eIf/hHX3xRzw==
X-ME-Sender: <xms:u80CZ33EbKiLqnkfsQu_u9Ymkv9i8ORODErLt6sqqSGqEke16u2SsQ>
 <xme:u80CZ2ETCkBpEhqmLKNP-gn0824OlOEnOeRry4O-xBTKwjhFuKifyI7LK_aMeXSGT
 Ld8H1XPysiHPVm768k>
X-ME-Received: <xmr:u80CZ36-f0RyyMV-8aMMyzAEssr9-9-jPLvjVh-njRZr11OJ1pLpZIXaD22JWvknAe6jXFCiZnXpMF80y49IRZAZb-5ybLv9nE8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvjedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttdejnecu
 hfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecugg
 ftrfgrthhtvghrnhepkeduueegfeefleeludefffevkefggedujeeiteeggeeutdffveff
 gefgkeeitddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeelpdhmohguvgepshhm
 thhpohhuthdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuh
 igrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtth
 hopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigr
 lhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrrdhvvghtth
 gvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdr
 fhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
 esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgv
 th
X-ME-Proxy: <xmx:u80CZ827lBQJwCeFqz1YtAnfAbMJwb5QopVptQVXJqRGfNLvhJdhSQ>
 <xmx:u80CZ6HoTYfogn9AarxbxmhkTRm33Q94njD7Z0MAuv8cTSiexKTu3g>
 <xmx:u80CZ99Ofy7gYCcrVkbu7v-B0KdUSnPA8dEes_w37znV2jrNdJC-jA>
 <xmx:u80CZ3mAQrcZtc4Awcbfq0DR8Qq3MI8v95TTeUnDYJvbzpdPHL67lA>
 <xmx:vM0CZ9BpNHkclMZSmdwAgcJNn1MDRpibuhSXBKHljCdKsAuzUvUdWjic>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Oct 2024 13:49:47 -0400 (EDT)
Date: Sun, 6 Oct 2024 19:49:45 +0200
From: Janne Grunau <j@jannau.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: [PATCH] drm/fbdev-dma: Only cleanup deferred I/O if necessary
Message-ID: <ZwLNuZL-8Gh5UUQb@robin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Commit 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if
necessary") initializes deferred I/O only if it is used.
drm_fbdev_dma_fb_destroy() however calls fb_deferred_io_cleanup()
unconditionally with struct fb_info.fbdefio == NULL. KASAN with the
out-of-tree Apple silicon display driver posts following warning from
__flush_work() of a random struct work_struct instead of the expected
NULL pointer derefs.

[   22.053799] ------------[ cut here ]------------
[   22.054832] WARNING: CPU: 2 PID: 1 at kernel/workqueue.c:4177 __flush_work+0x4d8/0x580
[   22.056597] Modules linked in: uhid bnep uinput nls_ascii ip6_tables ip_tables i2c_dev loop fuse dm_multipath nfnetlink zram hid_magicmouse btrfs xor xor_neon brcmfmac_wcc raid6_pq hci_bcm4377 bluetooth brcmfmac hid_apple brcmutil nvmem_spmi_mfd simple_mfd_spmi dockchannel_hid cfg80211 joydev regmap_spmi nvme_apple ecdh_generic ecc macsmc_hid rfkill dwc3 appledrm snd_soc_macaudio macsmc_power nvme_core apple_isp phy_apple_atc apple_sart apple_rtkit_helper apple_dockchannel tps6598x macsmc_hwmon snd_soc_cs42l84 videobuf2_v4l2 spmi_apple_controller nvmem_apple_efuses videobuf2_dma_sg apple_z2 videobuf2_memops spi_nor panel_summit videobuf2_common asahi videodev pwm_apple apple_dcp snd_soc_apple_mca apple_admac spi_apple clk_apple_nco i2c_pasemi_platform snd_pcm_dmaengine mc i2c_pasemi_core mux_core ofpart adpdrm drm_dma_helper apple_dart apple_soc_cpufreq leds_pwm phram
[   22.073768] CPU: 2 UID: 0 PID: 1 Comm: systemd-shutdow Not tainted 6.11.2-asahi+ #asahi-dev
[   22.075612] Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
[   22.077032] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   22.078567] pc : __flush_work+0x4d8/0x580
[   22.079471] lr : __flush_work+0x54/0x580
[   22.080345] sp : ffffc000836ef820
[   22.081089] x29: ffffc000836ef880 x28: 0000000000000000 x27: ffff80002ddb7128
[   22.082678] x26: dfffc00000000000 x25: 1ffff000096f0c57 x24: ffffc00082d3e358
[   22.084263] x23: ffff80004b7862b8 x22: dfffc00000000000 x21: ffff80005aa1d470
[   22.085855] x20: ffff80004b786000 x19: ffff80004b7862a0 x18: 0000000000000000
[   22.087439] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000005
[   22.089030] x14: 1ffff800106ddf0a x13: 0000000000000000 x12: 0000000000000000
[   22.090618] x11: ffffb800106ddf0f x10: dfffc00000000000 x9 : 1ffff800106ddf0e
[   22.092206] x8 : 0000000000000000 x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000001
[   22.093790] x5 : ffffc000836ef728 x4 : 0000000000000000 x3 : 0000000000000020
[   22.095368] x2 : 0000000000000008 x1 : 00000000000000aa x0 : 0000000000000000
[   22.096955] Call trace:
[   22.097505]  __flush_work+0x4d8/0x580
[   22.098330]  flush_delayed_work+0x80/0xb8
[   22.099231]  fb_deferred_io_cleanup+0x3c/0x130
[   22.100217]  drm_fbdev_dma_fb_destroy+0x6c/0xe0 [drm_dma_helper]
[   22.101559]  unregister_framebuffer+0x210/0x2f0
[   22.102575]  drm_fb_helper_unregister_info+0x48/0x60
[   22.103683]  drm_fbdev_dma_client_unregister+0x4c/0x80 [drm_dma_helper]
[   22.105147]  drm_client_dev_unregister+0x1cc/0x230
[   22.106217]  drm_dev_unregister+0x58/0x570
[   22.107125]  apple_drm_unbind+0x50/0x98 [appledrm]
[   22.108199]  component_del+0x1f8/0x3a8
[   22.109042]  dcp_platform_shutdown+0x24/0x38 [apple_dcp]
[   22.110357]  platform_shutdown+0x70/0x90
[   22.111219]  device_shutdown+0x368/0x4d8
[   22.112095]  kernel_restart+0x6c/0x1d0
[   22.112946]  __arm64_sys_reboot+0x1c8/0x328
[   22.113868]  invoke_syscall+0x78/0x1a8
[   22.114703]  do_el0_svc+0x124/0x1a0
[   22.115498]  el0_svc+0x3c/0xe0
[   22.116181]  el0t_64_sync_handler+0x70/0xc0
[   22.117110]  el0t_64_sync+0x190/0x198
[   22.117931] ---[ end trace 0000000000000000 ]---

Signed-off-by: Janne Grunau <j@jannau.net>
Fixes: 5a498d4d06d6 ("drm/fbdev-dma: Only install deferred I/O if necessary")
---
 drivers/gpu/drm/drm_fbdev_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index b0602c4f3628..51c2d742d199 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -50,7 +50,8 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 	if (!fb_helper->dev)
 		return;
 
-	fb_deferred_io_cleanup(info);
+	if (info->fbdefio)
+		fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(fb_helper);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241006-drm_fbdev_dma_deferred_io_cleanup-de87ee345dbc

Best regards,
-- 
Janne Grunau <j@jannau.net>
