Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD87BC6D5E
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 01:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C248610E8E7;
	Wed,  8 Oct 2025 23:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="b6q9RRm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Wed, 08 Oct 2025 23:06:17 UTC
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3E10E8E7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 23:06:17 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id DB3671D0028F;
 Wed,  8 Oct 2025 18:59:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Wed, 08 Oct 2025 18:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1759964361; x=1760050761; bh=b16CgqUYwDhd7yU4NyNftQntXr1J
 c5ksgcWR+Afr8vs=; b=b6q9RRm0hObBdglvYpOTO4AfTSPdlI5aWmCmXt4CEnWn
 egFl0nUuOGD4TCMMMnWeTM1s35hFo4Z+DQcKt86TCWkxtVxZTw4PVrqa2LVWwlh7
 nrovtGu1o0V7s5fZNte3RGQ2HWHwDTCGqd+SFb2usHgG+5Qu2Gd3UGE9TohhaCKg
 JXdU7qj6TlxaDQn2g5iJBcym5f4dqGbHqJuRlYFIwVEbp02bLcLHn9dO9WoR4tIa
 /LIV6CK1WfjWB9NJlvw6TPzHOUbF1hjtwUGm3SBkWCRcSSrjBiC4tTc6XqbO4z7W
 B36Sm9eYG2FCizSOpPJV/GL2/ildsAiMRAIWdQch0g==
X-ME-Sender: <xms:yezmaPr_LF8cX12FzBlGMQeXsXXuRINbYADjYCb_z8nq0Vjzd0-vhQ>
 <xme:yezmaMN5T-3_S8VI0lhKWdTmAr0mVGsS2zg1hGmb-AvvQ9JrrJvQ021uI3RggxkDm
 m3IJV4woiMzLaks1uXYCJTZmVyJUTeAEAw8PEFge-P2HkgZ60L29FU>
X-ME-Received: <xmr:yezmaP3eHVMk8XiR-e2ecL2MFkeOrjRN2U9A43rX83BDvsekieb28CUMaHjTalsX3Df_CmJyzqbmlFlYZAA0IKCdrIY_3pxceP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdegheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
 oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
 ehfffggeefveegvedtiefffeevuedtgefhueehieetffejfefggeevfeeuvdduleenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinh
 eslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
 thhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoh
 epuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehs
 uhhsvgdruggvpdhrtghpthhtohepjhgrvhhivghrmhesrhgvughhrghtrdgtohhmpdhrtg
 hpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqfhgsuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
 gurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghp
 thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yezmaDD11z4k02BTrdh8hYr7-7Q1XeRDGpuL1M1HskbQHvI8pdVj7g>
 <xmx:yezmaEK1_PH76SO-1RxUx7QBTXB7Dwni9OhKOscm11Ti3DEN4c7j1w>
 <xmx:yezmaEkv7HkKbwC2AjSkW9R1pAESS2eMEDlXzaZ6uctkPJkDwaFDaw>
 <xmx:yezmaFa0Xsr_0tEaNprULfO0bsTlg_TgMFZuKv_5f-XdpWB1h-rRaA>
 <xmx:yezmaNP7n09jyketXJs9Uwz3kxlKGf4Ugpj42Lr9LH06m8clrkyIkIm7>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Oct 2025 18:59:18 -0400 (EDT)
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: stable@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <f91c6079ef9764c7e23abd80ceab39a35f39417f.1759964186.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] fbdev: Fix logic error in "offb" name match
Date: Thu, 09 Oct 2025 09:56:25 +1100
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

A regression was reported to me recently whereby /dev/fb0 had disappeared
from a PowerBook G3 Series "Wallstreet". The problem shows up when the
"video=ofonly" parameter is passed to the kernel, which is what the
bootloader does when "no video driver" is selected. The cause of the
problem is the "offb" string comparison, which got mangled when it got
refactored. Fix it.

Cc: stable@vger.kernel.org
Fixes: 93604a5ade3a ("fbdev: Handle video= parameter in video/cmdline.c")
Reported-and-tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 drivers/video/fbdev/core/fb_cmdline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 4d1634c492ec..594b60424d1c 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -40,7 +40,7 @@ int fb_get_options(const char *name, char **option)
 	bool enabled;
 
 	if (name)
-		is_of = strncmp(name, "offb", 4);
+		is_of = !strncmp(name, "offb", 4);
 
 	enabled = __video_get_options(name, &options, is_of);
 
-- 
2.49.1

