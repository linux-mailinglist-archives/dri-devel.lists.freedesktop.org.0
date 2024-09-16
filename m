Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E74D979CC9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EAA10E2ED;
	Mon, 16 Sep 2024 08:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ol9sPKQj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pHm2rIvl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ol9sPKQj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pHm2rIvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD7D10E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:29:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C49F1F88B;
 Mon, 16 Sep 2024 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+be+b5xG77NN5bRYZt/R3Rv93GRb63IpHi7vINOwG0=;
 b=ol9sPKQjvrbrK14skg8sth14y7Veg4MRWRa9hoF00Cd/Eo5PH8vmOsEh3KZHGLJtbSB1sN
 NIvlC87z19pA/qIJNzVe2INHNJ90wFQwiyZdCnhWjC8RatazR3Qup6a3tUy8yO++D8yCQQ
 ASLU3mRCOOzY7kDzsIxc55qWwxJUvSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+be+b5xG77NN5bRYZt/R3Rv93GRb63IpHi7vINOwG0=;
 b=pHm2rIvloMZyg3e20s7s0cVTs2dETNwvgGaGsC8pYTL09Cqw36YbX7ZAC8LZHfI+b4/hjP
 BEAIDkNt88LZicAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ol9sPKQj;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pHm2rIvl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+be+b5xG77NN5bRYZt/R3Rv93GRb63IpHi7vINOwG0=;
 b=ol9sPKQjvrbrK14skg8sth14y7Veg4MRWRa9hoF00Cd/Eo5PH8vmOsEh3KZHGLJtbSB1sN
 NIvlC87z19pA/qIJNzVe2INHNJ90wFQwiyZdCnhWjC8RatazR3Qup6a3tUy8yO++D8yCQQ
 ASLU3mRCOOzY7kDzsIxc55qWwxJUvSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+be+b5xG77NN5bRYZt/R3Rv93GRb63IpHi7vINOwG0=;
 b=pHm2rIvloMZyg3e20s7s0cVTs2dETNwvgGaGsC8pYTL09Cqw36YbX7ZAC8LZHfI+b4/hjP
 BEAIDkNt88LZicAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD41E139CE;
 Mon, 16 Sep 2024 08:29:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0InQNGXs52bOPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Sep 2024 08:29:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/ast: Warn about unsupported TX chips
Date: Mon, 16 Sep 2024 10:25:15 +0200
Message-ID: <20240916082920.56234-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916082920.56234-1-tzimmermann@suse.de>
References: <20240916082920.56234-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0C49F1F88B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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

A number of TX chips are listed in VGACRD1, but not supported by
the ast driver. Whether any existing product uses such a chip is
unknown. Warn if the driver encounters any. We can then add
support as necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 7289bdc6066e..bc37c65305d4 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -76,7 +76,22 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	};
 
 	struct drm_device *dev = &ast->base;
-	u8 jreg;
+	u8 jreg, vgacrd1;
+
+	/*
+	 * Several of the listed TX chips are not explicitly supported
+	 * by the ast driver. If these exist in real-world devices, they
+	 * are most likely reported as VGA or SIL164 outputs. We warn here
+	 * to get bug reports for these devices. If none come in for some
+	 * time, we can begin to fail device probing on these values.
+	 */
+	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK);
+	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ITE66121_VBIOS,
+		 "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
+	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_CH7003_VBIOS,
+		 "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
+	drm_WARN(dev, vgacrd1 == AST_IO_VGACRD1_TX_ANX9807_VBIOS,
+		 "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
 
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip = AST_TX_NONE;
-- 
2.46.0

