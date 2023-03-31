Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F086D1BF0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACCF10F166;
	Fri, 31 Mar 2023 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7432C10F148
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC90621B29;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680254596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6BDvmewT6vFBYy0qV6Q+CaZOwbZvK96nQnL6lmGYCY=;
 b=jFm88v83K7Z04zSb1JZMKXO4epA0Xgyv/YDucnMj5HWoAy/jFN/c36XX6jdkvJeKrKNvW3
 9A3sc3ZOPl8nOSADJEBdNW2Ae8EsJUOqUelELvHgKLepxFC5GJtUmikUxNWOrD44IIc1vC
 njhCcxngMrk5EjWkwiVA1r1QIf6n8OQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680254596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6BDvmewT6vFBYy0qV6Q+CaZOwbZvK96nQnL6lmGYCY=;
 b=CugmJ83sHI2XltuKmZR/tFHs723oq4Xl+11VGja9k5GFdFGi3yb/qo1pkDf2SFRh6qTs7g
 QnQkrsKdFlu2JbDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5FA3133B6;
 Fri, 31 Mar 2023 09:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SMmQK4SmJmTsOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Mar 2023 09:23:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Subject: [PATCH 02/15] fbdev/atmel_lcdfb: Remove trailing whitespaces
Date: Fri, 31 Mar 2023 11:23:01 +0200
Message-Id: <20230331092314.2209-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331092314.2209-1-tzimmermann@suse.de>
References: <20230331092314.2209-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/atmel_lcdfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 8187a7c4f910..987c5f5f0241 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -317,7 +317,7 @@ static inline void atmel_lcdfb_free_video_memory(struct atmel_lcdfb_info *sinfo)
 /**
  *	atmel_lcdfb_alloc_video_memory - Allocate framebuffer memory
  *	@sinfo: the frame buffer to allocate memory for
- * 	
+ *
  * 	This function is called only from the atmel_lcdfb_probe()
  * 	so no locking by fb_info->mm_lock around smem_len setting is needed.
  */
-- 
2.40.0

