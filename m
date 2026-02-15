Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE5NCZMHkmnCpgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 18:51:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667DD13F4CE
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 18:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6D10E199;
	Sun, 15 Feb 2026 17:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="QNBfCUzu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PxHDBkmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Sun, 15 Feb 2026 17:51:09 UTC
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C889C10E199
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 17:51:09 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 394C4EC0658;
 Sun, 15 Feb 2026 12:43:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 15 Feb 2026 12:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1771177386; x=1771263786; bh=sc
 QgAVxVgqOJys8W+gujBo5wP01cbiK3aqH/Vwsgpew=; b=QNBfCUzu+XGswyGF7E
 0HrGal6S1408Hq85fOtCZurEouMFVSiBXH1/7KmeCElpVfZikfjAtQfpxAJ9A3+R
 RO2ZN0gIb2luyXMHJ6UJmzLqaE+t8WMEsDqS9rDEgTyJ7hvdBRIoivK4DttUB16c
 f+hXAK4Ybk9SgGV+CrNIltSf8Y/QCQTXbZGRoXEhyUsHniBvIL28NkZKTY4t2/MZ
 8T7ooyjIQTeZQn6yvwvr/AH2Kah3LkwqtDwL5xl27QxgMWAfS7sELdcYX9LEZHMI
 d5lyB7yO0HI/J6jcKEUUTf5cMKDJrYWFpseGpyFeCoWfD8DTNx+OP6UrDFdbs5od
 i5WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1771177386; x=1771263786; bh=scQgAVxVgqOJys8W+gujBo5wP01c
 biK3aqH/Vwsgpew=; b=PxHDBkmoAHH4yoAj5IWgZ7qytieoNV+myX/ErHLZui99
 C+e0OMFwy4urQiRh8Xpl9SafWvlAxmak9AZe1+4OlHvbJ9JMMJu5iJOUs7mcvEpk
 E3KAkOsRlivXPY9ULkDVLgYyLvksdH17TBJ+jchEYGJcRnTrc2LhvsuLrq8FTljR
 bp4QMDCNTHOvd22U4QxTTvpvKG2KhSDARSC4RkmMKsEhsofDQHlq2rjV4yoJAbuc
 VBUpa1A2nRM92JCtq/xbtC4/04LrP52PiNu4RlT7n7zCj2sNTQah2AVZ+J7WPZnt
 K+zonKpV+iyVFD5r3yNuePNAHTejZYSroBCtMkcJyQ==
X-ME-Sender: <xms:qAWSacfzOW2t8rIOVD9-Fzd42s_3s6hf3FTrDKSSxSUVqe9-LD0NEw>
 <xme:qAWSaXnhi7EFbRFWBDxGJHQOT6Y9Rxs8gMSBa9bzBejSirB4CqW4GGQ5p7EbkqqhG
 3JljLoBaaolRbXHtZ6szJOWC8vNsEJp54ROx-aecD2amKfxrrNPbw>
X-ME-Received: <xmr:qAWSaWD0rN69pIcKL3PVZmjV9gVmUQiH_7EKu-ADoH8DdTGg1dgvkMzL8dZQ9WpI4HxV3U63IV1XrDm-Vs7kLEnjpW3R9aE106etzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudegiedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfeehle
 dtheefteejfedvheetuedttdetleegudeuteejveetieefuedvfeffvdeinecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepudei
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrdhsiiihphhrohifshhkihessh
 grmhhsuhhnghdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
 hrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdho
 rhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehjse
 hjrghnnhgruhdrnhgvthdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtoheprghnughriigvjhdrphesshgrmhhsuhhnghdrtghomhdprhgtph
 htthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:qAWSaRfL6vdEm1C2qkoXfwvMeoo1YeGDAT14JvQTrBXwpHxHCxmv3g>
 <xmx:qAWSaZ4oUIt12MBSqmo-erRRLunYhYxrnlKCppKeX4UYXQDIzVuukQ>
 <xmx:qAWSaTMJyXjpyg7qR9Nda4eMBwO32KXALb0g3GEczidXsHuPwDPgiA>
 <xmx:qAWSaSFf1nqf5a6KNXgU0yZsxgSelSgV4324waqxfvCXBRo4_bvL1Q>
 <xmx:qgWSaahN6oabijPrFOjFSR08-K-hD88wBYDIkx703jBmqyRHGasX7pi1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Feb 2026 12:43:03 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 15 Feb 2026 18:42:59 +0100
Subject: [PATCH] media: videobuf2: Set vma_flags in vb2_dma_sg_mmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-media-vb2-dma-sg-v1-1-91b6aa6c1cec@jannau.net>
X-B4-Tracking: v=1; b=H4sIAKIFkmkC/x3MPQqAMAxA4atIZgP9QQevIg7RpDVDq7Qggnh3i
 +M3vPdAlaJSYeoeKHJp1SM32L6DbaccBZWbwRk3GmcHTMJKeK0OORHWiCaQ94EpMAu07CwS9P6
 X8/K+H/k1qEViAAAA
X-Change-ID: 20260215-media-vb2-dma-sg-0fa33fdafdde
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Andrzej Pietrasiewicz <andrzej.p@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5294; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=5MO24xI2BDGeb+100l8k8E9pFIay5d55n+ZsgN9zhQA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxJrMsOptyrmOTte/zG/Ycrfv9YOI/5zWZHqVPcUQ0r7
 Obt1Z5yv6OUhUGMi0FWTJElSftlB8PqGsWY2gdhMHNYmUCGMHBxCsBETl1g+Kd7Y82dlfM6Pgkq
 F5pvexNzMV33b0ZIfCd7nuz3UxWux1oY/meuTmVk/209Z4JPcp97e0AYw9RJ3aFreEytLB43H3A
 +xAMA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tfiga@chromium.org,m:m.szyprowski@samsung.com,m:mchehab@kernel.org,m:andrzej.p@samsung.com,m:kyungmin.park@samsung.com,m:hverkuil@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:j@jannau.net,s:lists@lfdr.de];
	DMARC_NA(0.00)[jannau.net];
	FREEMAIL_TO(0.00)[chromium.org,samsung.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[j@jannau.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:mid,jannau.net:dkim,jannau.net:email,messagingengine.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 667DD13F4CE
X-Rspamd-Action: no action

vb2_dma_contig sets VMA flags VM_DONTEXPAND and VM_DONTDUMP and I do not
see a reason why vb2_dma_sg should behave differently. This avoids
hitting `WARN_ON(!(vma->vm_flags & VM_DONTEXPAND));` in
drm_gem_mmap_obj() during mmap() of an imported dma-buf from the out of
tree Apple ISP camera capture driver which uses vb2_dma_sg_memops.

gst-launch-1.0 v4l2src ! gtk4paintablesink

[   38.201528] ------------[ cut here ]------------
[   38.202135] WARNING: CPU: 7 PID: 2362 at drivers/gpu/drm/drm_gem.c:1144 drm_gem_mmap_obj+0x1f8/0x210
[   38.203278] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
snd_seq snd_seq_device uinput nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr bnep
nls_ascii i2c_dev loop fuse dm_multipath nfnetlink brcmfmac_wcc
hid_magicmouse hci_bcm4377 brcmfmac brcmutil bluetooth ecdh_generic
cfg80211 ecc btrfs xor xor_neon rfkill hid_apple raid6_pq joydev
aop_als apple_nvmem_spmi industrialio snd_soc_aop apple_z2
snd_soc_cs42l84 tps6598x snd_soc_tas2764 macsmc_reboot spi_nor
macsmc_hwmon rtc_macsmc gpio_macsmc macsmc_power regmap_spmi
macsmc_input dockchannel_hid panel_summit appledrm nvme_apple dwc3
snd_soc_macaudio drm_client_lib nvme_core phy_apple_atc hwmon
apple_sart apple_dockchannel macsmc apple_rtkit_helper
spmi_apple_controller aop apple_wdt mfd_core nvmem_apple_efuses
pinctrl_apple_gpio apple_isp apple_dcp videobuf2_dma_sg mux_core
spi_apple
[   38.203300]  videobuf2_memops i2c_pasemi_platform snd_soc_apple_mca videobuf2_v4l2 videodev clk_apple_nco videobuf2_common snd_pcm_dmaengine adpdrm asahi apple_admac adpdrm_mipi drm_dma_helper pwm_apple i2c_pasemi_core drm_display_helper mc cec apple_dart ofpart apple_soc_cpufreq leds_pwm phram
[   38.217677] CPU: 7 UID: 1000 PID: 2362 Comm: gst-launch-1.0 Tainted: G        W           6.17.6+ #asahi-dev PREEMPT(full)
[   38.219040] Tainted: [W]=WARN
[   38.219398] Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
[   38.220213] pstate: 21400005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[   38.221088] pc : drm_gem_mmap_obj+0x1f8/0x210
[   38.221643] lr : drm_gem_mmap_obj+0x78/0x210
[   38.222178] sp : ffffc0008dc678e0
[   38.222579] x29: ffffc0008dc678e0 x28: 0000000000042a97 x27: ffff8000b701b480
[   38.223465] x26: 00000000000000fb x25: ffffc0008dc67d20 x24: ffffc0008dc67968
[   38.224402] x23: ffff8000e3ca5600 x22: ffff8000265b7800 x21: ffff80003000c0c0
[   38.225279] x20: 0000000000000000 x19: ffff8000b68c5200 x18: ffffc0008dc67968
[   38.226151] x17: 0000000000000000 x16: 0000000000000000 x15: ffffc000810a30a8
[   38.227042] x14: 00007fff637effff x13: 00005555de91ffff x12: 00007fff63293fff
[   38.227942] x11: 0000000000000000 x10: ffff8000184ecf08 x9 : ffffc0007a1900c8
[   38.228824] x8 : ffffc0008dc67968 x7 : 0000000000000012 x6 : ffffc0015cf1c000
[   38.229703] x5 : ffffc0008dc676a0 x4 : ffffc00081a27dc0 x3 : 0000000000000038
[   38.230607] x2 : 0000000000000003 x1 : 0000000000000003 x0 : 00000000100000fb
[   38.231488] Call trace:
[   38.231806]  drm_gem_mmap_obj+0x1f8/0x210 (P)
[   38.232342]  drm_gem_mmap+0x140/0x260
[   38.232813]  __mmap_region+0x488/0x9a0
[   38.233277]  mmap_region+0xd0/0x148
[   38.233703]  do_mmap+0x350/0x5c0
[   38.234148]  vm_mmap_pgoff+0x14c/0x200
[   38.234612]  ksys_mmap_pgoff+0x150/0x208
[   38.235107]  __arm64_sys_mmap+0x34/0x50
[   38.235611]  invoke_syscall+0x50/0x120
[   38.236075]  el0_svc_common.constprop.0+0x48/0xf0
[   38.236680]  do_el0_svc+0x24/0x38
[   38.237113]  el0_svc+0x38/0x168
[   38.237507]  el0t_64_sync_handler+0xa0/0xe8
[   38.238034]  el0t_64_sync+0x198/0x1a0
[   38.238491] ---[ end trace 0000000000000000 ]---

There were discussions in [1] at the end of 2023 that mmap() on imported
dma-bufs should not be supported but as of v6.17 drm_gem_shmem_mmap() in
drm_gem_shmem_helper.c still supports it.
This might affect all gpu or accel drivers using drm_gem_shmem_mmap() or
the wrapper drm_gem_shmem_object_mmap().

[1] https://lore.kernel.org/dri-devel/bc7f7844-0aa3-4802-b203-69d58e8be2fa@linux.intel.com/

Cc: stable@vger.kernel.org
Fixes: 5ba3f757f059 ("[media] v4l: videobuf2: add DMA scatter/gather allocator")
Signed-off-by: Janne Grunau <j@jannau.net>
---
included DRM maintainers due to warning triggered from DRM code.
---
 drivers/media/common/videobuf2/videobuf2-dma-sg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index b3bf2173c14e1b3bedb8ab0bd60c889a0b97cbe3..7c30731cb9a57bebb3cf418e627e7c9f09ba8642 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -345,6 +345,7 @@ static int vb2_dma_sg_mmap(void *buf_priv, struct vm_area_struct *vma)
 		return err;
 	}
 
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	/*
 	 * Use common vm_area operations to track buffer refcount.
 	 */

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-media-vb2-dma-sg-0fa33fdafdde

Best regards,
-- 
Janne Grunau <j@jannau.net>

