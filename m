Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC35BCC81
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D010E627;
	Mon, 19 Sep 2022 13:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74110E616
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2630D1F91B;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiJP+dkq3P85+NRrF7ZXr+S0FVn1eHVRV4NNsW0DgkI=;
 b=jMQ8VpYxjNRxaK6NLrJgKR3jchp64W9oUhGMXSy6HA7droJ0yU20Qpbru0VeNbuE7VbR7+
 TA73ynJumX79zYAnIepLkjm4DuhjcPV9qcWzTsPbvv+9Dm6ByeHLOCWQmyrIahisz1Q2wT
 8BvYNMRxg5rqUHAFNsr4oUnuPBi7WU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiJP+dkq3P85+NRrF7ZXr+S0FVn1eHVRV4NNsW0DgkI=;
 b=cYhW8ucMc+Nu1wZq473KoHmMPF1CE6vNKvPTN6jCaSMYCg6BYIiNkYY23Z0I+XJjA9w5vC
 WGm9ud3CYjQCTJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08B0913A96;
 Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sH9WAc5oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 13/16] drm/udl: Add register constants for color depth
Date: Mon, 19 Sep 2022 15:04:05 +0200
Message-Id: <20220919130408.21486-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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

Add the register constants for setting the color depth. The driver
only uses 16bpp. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 2 +-
 drivers/gpu/drm/udl/udl_proto.h   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 04135ebd41d3..1e28eb1e295f 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -56,7 +56,7 @@ static char *udl_set_blank_mode(char *buf, u8 mode)
 
 static char *udl_set_color_depth(char *buf, u8 selection)
 {
-	return udl_set_register(buf, 0x00, selection);
+	return udl_set_register(buf, UDL_REG_COLORDEPTH, selection);
 }
 
 static char *udl_set_base16bpp(char *wrptr, u32 base)
diff --git a/drivers/gpu/drm/udl/udl_proto.h b/drivers/gpu/drm/udl/udl_proto.h
index 5a6c960bd10d..22bc1ae8420c 100644
--- a/drivers/gpu/drm/udl/udl_proto.h
+++ b/drivers/gpu/drm/udl/udl_proto.h
@@ -3,7 +3,10 @@
 #ifndef UDL_PROTO_H
 #define UDL_PROTO_H
 
+/* Color depth */
+#define UDL_REG_COLORDEPTH		0x00
 #define UDL_COLORDEPTH_16BPP		0
+#define UDL_COLORDEPTH_24BPP		1
 
 /* Display-mode settings */
 #define UDL_REG_XDISPLAYSTART		0x01
-- 
2.37.3

