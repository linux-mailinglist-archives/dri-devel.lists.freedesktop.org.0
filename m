Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3C48AD3A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C883710E75F;
	Tue, 11 Jan 2022 12:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6810E473
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 217E41F3BA;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhaMZsKiggxfoXgJGgW+8HI9G7JeFoN40oggtuF6bX0=;
 b=cpNnyjU3+XsNzaqL6GpwdjREvcqMgl6QC0Oo5BeMLbNloMco4uAQCqHuulgiLpWgv8Xgju
 aj91Vi8zyFoXNP+U5bKQ80Aj5Vju/2aHY6lzHKQKrraSULpWlr+renf+vvyih53EeV4BXy
 ySYHS5rzv7FjD1JHhXxKzbLyzqz9zF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhaMZsKiggxfoXgJGgW+8HI9G7JeFoN40oggtuF6bX0=;
 b=0nqj2XioEB2xRSRAwVr4g2uAVpzBkc7uxzygjcGDI5yPDblqSlbd4vZqSYC5vzEqIU7lD5
 4Pu+pEa3hpT8G9Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2E4513DD4;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ECqJMn1x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 3/8] drm/ast: Remove AST_TX_ITE66121 constant
Date: Tue, 11 Jan 2022 13:00:53 +0100
Message-Id: <20220111120058.10510-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111120058.10510-1-tzimmermann@suse.de>
References: <20220111120058.10510-1-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ITE66121 is an HDMI transmitter chip. There's no code for
detecting or programming the chip within ast. Remove the enum
constant.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 00bfa41ff7cb..6e77be1d06d3 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -69,7 +69,6 @@ enum ast_chip {
 enum ast_tx_chip {
 	AST_TX_NONE,
 	AST_TX_SIL164,
-	AST_TX_ITE66121,
 	AST_TX_DP501,
 };
 
-- 
2.34.1

