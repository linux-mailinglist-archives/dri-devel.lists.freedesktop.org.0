Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC948C080A
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 01:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0F4112A56;
	Wed,  8 May 2024 23:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Rl5C93v9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA2951123F6;
 Wed,  8 May 2024 23:45:49 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.1.144])
 by linux.microsoft.com (Postfix) with ESMTPSA id AC85D20B2C82;
 Wed,  8 May 2024 16:45:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC85D20B2C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1715211949;
 bh=ESOO7vcC8nw070xfZPv4kHKylJK5PcWPFkA3TGLgTXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rl5C93v97PiXj7e7b6rfgI9bl04lop2/yhEatpsUACNRzLcSXpXNSHno98LeoAQB7
 gS+0i+obuI0+IENonaQaGjUv8p/CBuF643J8XjETiK+E5V+je01jXkIq8MFqgXuezN
 yIAJI05Tc3ELeVIzZK9bzaksGSVwXWFhHgkGQfHg=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
 Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org (open list:SMSC UFX6000 and UFX7000 USB to VGA
 DRIVER), dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/6] fbdev/smscufx: Make I2C terminology more inclusive
Date: Wed,  8 May 2024 23:43:41 +0000
Message-Id: <20240508234342.2927398-6-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508234342.2927398-1-eahariha@linux.microsoft.com>
References: <20240508234342.2927398-1-eahariha@linux.microsoft.com>
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

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
the approved verbiage exists in the specification.

Compile tested, no functionality changes intended

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/video/fbdev/smscufx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 35d682b110c42..5f0dd01fd8349 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1292,7 +1292,7 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 	return 0;
 }
 
-/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, master,
+/* sets up DDC channel for 100 Kbps, std. speed, 7-bit addr, controller mode,
  * restart enabled, but no start byte, enable controller */
 static int ufx_i2c_init(struct ufx_data *dev)
 {
@@ -1321,7 +1321,7 @@ static int ufx_i2c_init(struct ufx_data *dev)
 	/* 7-bit (not 10-bit) addressing */
 	tmp &= ~(0x10);
 
-	/* enable restart conditions and master mode */
+	/* enable restart conditions and controller mode */
 	tmp |= 0x21;
 
 	status = ufx_reg_write(dev, 0x1000, tmp);
-- 
2.34.1

