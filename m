Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE784586C69
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4133C911C1;
	Mon,  1 Aug 2022 13:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB90EC17E5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:50:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73BFD4DF19;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659361831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8tsSiUcjwfcZ+Zqt1YGyG3w6tB3AKlGHNxA15opI/0=;
 b=ds1/cbh7Mxa2/Wr4Ft6CjKEIc8v/wfX22alsHoznKnFAe32Qt5x79HhI1uWiH5IOz2rHZO
 JPYmiDgJ6TU/mFzrb9RAqEzs/PsHyy2trEvi44bkpV/Ao9jsczIMCaqKV2zHDswaBPGgD1
 XUygdUDM+LKXZIPxiTwHf2FF6uwDTQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659361831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8tsSiUcjwfcZ+Zqt1YGyG3w6tB3AKlGHNxA15opI/0=;
 b=xTSjkDqdYGG3w3GaXc9WwkufIOPfAAAHY7LbAGqdhxhoBYVrZ4daJHm/8U46o0uvEGZiLn
 dvMITsTPNQ0kMTDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5208213ADF;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qDAoEyfa52IDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 13:50:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, geert@linux-m68k.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 1/5] drm/simpledrm: Remove mem field from device structure
Date: Mon,  1 Aug 2022 15:50:24 +0200
Message-Id: <20220801135028.30647-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801135028.30647-1-tzimmermann@suse.de>
References: <20220801135028.30647-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the unused mem field from struct simpledrm_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 5422363690e7..c5a0dabfb6df 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -217,7 +217,6 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	struct resource *mem;
 	void __iomem *screen_base;
 
 	/* modesetting */
@@ -558,7 +557,6 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 	if (!screen_base)
 		return -ENOMEM;
 
-	sdev->mem = mem;
 	sdev->screen_base = screen_base;
 
 	return 0;
-- 
2.37.1

