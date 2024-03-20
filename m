Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3423880EC9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6F10F3B0;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D18kue0y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7nFsVn4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D18kue0y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i7nFsVn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5D010E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84C7320BD0;
 Wed, 20 Mar 2024 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=D18kue0ySrdj44P1R1Jb4uRuBhIADfAAMUQuROlGkBuZYRyINEHQLalehGHAeJrt/waZdA
 BclqNW34mD2Bu6GugMMeCfbFgRT+XNcvF446UoT9rjIDb0XGDYtlW25wouAJvKvFm6jhqi
 EheWHZmIS6zNAmQneNE/4mUpsagBX+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=i7nFsVn4DpOlFDrO4oHOyU5lrwwI2JuGeNBKQVzWWkVluStrpnu30GSBSzFFBFSU1O8dan
 IfEUwEbk7Tzti4Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=D18kue0ySrdj44P1R1Jb4uRuBhIADfAAMUQuROlGkBuZYRyINEHQLalehGHAeJrt/waZdA
 BclqNW34mD2Bu6GugMMeCfbFgRT+XNcvF446UoT9rjIDb0XGDYtlW25wouAJvKvFm6jhqi
 EheWHZmIS6zNAmQneNE/4mUpsagBX+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOfQtfo/1L7gMe0Sbdigwc7rzNJoqtsz9o9w9aMMdLA=;
 b=i7nFsVn4DpOlFDrO4oHOyU5lrwwI2JuGeNBKQVzWWkVluStrpnu30GSBSzFFBFSU1O8dan
 IfEUwEbk7Tzti4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 496E013892;
 Wed, 20 Mar 2024 09:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8FnDEGeu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 04/13] drm/ast: Allocate instance of struct ast_i2c_chan
 with managed helpers
Date: Wed, 20 Mar 2024 10:34:09 +0100
Message-ID: <20240320093738.6341-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D18kue0y;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=i7nFsVn4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.48 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.01)[45.20%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.48
X-Rspamd-Queue-Id: 84C7320BD0
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

Replace kzalloc() with drmm_kzalloc() and thereby put the release of
the I2C instance into a separate action. Avoids explicit error roll-
back in ast_i2c_chan_create(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_i2c.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index c3046223a4919..dc28a5cbb1c2a 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -107,7 +107,6 @@ static void ast_i2c_release(struct drm_device *dev, void *res)
 	struct ast_i2c_chan *i2c = res;
 
 	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
 }
 
 struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
@@ -115,7 +114,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	struct ast_i2c_chan *i2c;
 	int ret;
 
-	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
+	i2c = drmm_kzalloc(dev->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return ERR_PTR(-ENOMEM);
 
@@ -137,7 +136,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
-		goto out_kfree;
+		return ERR_PTR(ret);
 	}
 
 	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
@@ -145,8 +144,4 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 		return ERR_PTR(ret);
 
 	return i2c;
-
-out_kfree:
-	kfree(i2c);
-	return ERR_PTR(ret);
 }
-- 
2.44.0

