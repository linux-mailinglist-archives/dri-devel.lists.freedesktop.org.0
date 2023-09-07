Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2590479710B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C310E7A8;
	Thu,  7 Sep 2023 08:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513D10E7A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:54:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05DBA21864;
 Thu,  7 Sep 2023 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694076852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4B1OE7yKWqlV3goj2C/YTh/xuKA45lLwm9oARh4/H4=;
 b=PwNT75lztJ5BNelcSODug76J/bAGpitxTDk7mBKjhVutw7JDmHB25xN1HQDLuPRrA6S/rN
 nmCZgtdGHr/DNjWYk+aa3BW40//x6z8+a478JsXq6NmFpSVpCTyMrQnPU4DqrI4vezPP/U
 U85XMyvs0ZJgY2phMIkbjMcGFopM/LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694076852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4B1OE7yKWqlV3goj2C/YTh/xuKA45lLwm9oARh4/H4=;
 b=0t0X/KyJEEcLFPyvD61i/HcmKEjl1DePe4g9Om0D5aoG0cPkyQos0RE9BPXfRIy4ypnsWL
 xBIa7X5qIHFmnPDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD60C138FA;
 Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJQoMbOP+WT6JgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:54:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/7] fbdev/core: Clean up include statements in fbmem.c
Date: Thu,  7 Sep 2023 10:52:06 +0200
Message-ID: <20230907085408.9354-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907085408.9354-1-tzimmermann@suse.de>
References: <20230907085408.9354-1-tzimmermann@suse.de>
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
Cc: linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove all unnecessary include statements from fbmem.c. Most of
them were for functionality that has meanwhile been moved into
other files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fbmem.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1a662a606ba6..fc206755f5f6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -11,29 +11,12 @@
  * for more details.
  */
 
-#include <linux/module.h>
-
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/mman.h>
-#include <linux/vt.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
 #include <linux/console.h>
-#include <linux/kmod.h>
-#include <linux/err.h>
-#include <linux/device.h>
-#include <linux/efi.h>
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
-#include <linux/mem_encrypt.h>
-#include <linux/pci.h>
 
 #include <video/nomodeset.h>
-#include <video/vga.h>
 
 #include "fb_internal.h"
 
-- 
2.42.0

