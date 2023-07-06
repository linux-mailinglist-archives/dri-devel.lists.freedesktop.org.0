Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764C7499BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A38210E4D0;
	Thu,  6 Jul 2023 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE2710E4CF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:48:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5F9120527;
 Thu,  6 Jul 2023 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688640535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IQse9Ci+6BuJu92+Tlb4VQ/loHLj6fZX2PSRhDLRfs=;
 b=rPiQO52hmp/q6FguwE88lYtcvI1sL9Nta/vMBo2Oc9eISn+vWsTbL+XMOe9N9SofDdiygZ
 w01dH8jLKkkuJzfkC8VKGtLq2cF7LyWshdb5oTTTcyFiqhyo3+N9sUGodHZuUYMq6Ho8MR
 rklpliiQDVjGRVnJqnnY8DbYjLM8txc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688640535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6IQse9Ci+6BuJu92+Tlb4VQ/loHLj6fZX2PSRhDLRfs=;
 b=4IBVpZARJrETGFFUgtTFeYGsq3n4Y0+wJgPKohJ7VUGz4fmN2NSPLil1ZsPhVcHnNYxSmF
 yDcG2dfMZuiSRYCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88862138EE;
 Thu,  6 Jul 2023 10:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6Bh1IBecpmSDAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 10:48:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	suijingfeng@loongson.cn,
	arnd@arndb.de
Subject: [PATCH v2 4/4] staging/sm750fb: Do not include <linux/screen_info.h>
Date: Thu,  6 Jul 2023 12:42:17 +0200
Message-ID: <20230706104852.27451-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706104852.27451-1-tzimmermann@suse.de>
References: <20230706104852.27451-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongarch@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Teddy Wang <teddy.wang@siliconmotion.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sm750fb driver does not need anything from <linux/screen_info.h>.
Remove the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
---
 drivers/staging/sm750fb/sm750.c        | 1 -
 drivers/staging/sm750fb/sm750_accel.c  | 1 -
 drivers/staging/sm750fb/sm750_cursor.c | 1 -
 drivers/staging/sm750fb/sm750_hw.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 55e302a27847..c260f73cf570 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -14,7 +14,6 @@
 #include <linux/mm_types.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
-#include <linux/screen_info.h>
 #include <linux/console.h>
 
 #include "sm750.h"
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 24b9077a634a..44b9e3fe3a41 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -14,7 +14,6 @@
 #include <linux/pagemap.h>
 #include <linux/console.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 
 #include "sm750.h"
 #include "sm750_accel.h"
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 43e6f52c2551..eea4d1bd36ce 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -14,7 +14,6 @@
 #include <linux/pagemap.h>
 #include <linux/console.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 
 #include "sm750.h"
 #include "sm750_cursor.h"
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 55cb00e8b0d1..71247eaf26ee 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -17,7 +17,6 @@
 #include <asm/mtrr.h>
 #endif
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.41.0

