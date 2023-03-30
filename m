Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C266CFCC2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061210ED07;
	Thu, 30 Mar 2023 07:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B1F10ED07
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:30:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99A091FE8B;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRARA2JOGwkKN3GuqmGeJK8JevwbZMv+7XbBIMWuabY=;
 b=unbfdeg/ZoUnytZNk2qoOkKj5B37e3TnRni/4HEbWDFClip1rnhg4rldqA4uFWyzfXqnJf
 v2cJMHaO4uEuFeGyOJZzw8xeTAuoPxUsZDKsHAqk5fSDoKE92p9m1dykMOV8yf5eDIMg8O
 Cyv47mpOlv7vMIydXGG7qeIO1VAUDxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRARA2JOGwkKN3GuqmGeJK8JevwbZMv+7XbBIMWuabY=;
 b=ycsAv8H3u2O+J2ENL0iHLoI19HmptPI6nHeIPUORsMMV+qcLLtov4eGDFVXWkaErDPLSKN
 XdOsZYCteyhkBtCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B3021390D;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Ng6Gak6JWRNeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:30:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 1/4] drm/armada: Include <linux/of.h>
Date: Thu, 30 Mar 2023 09:30:43 +0200
Message-Id: <20230330073046.7150-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073046.7150-1-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
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

Include <linux/of.h> to get declarations of of_node_put() and
of_device_is_available(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..fd9842740a08 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 
-- 
2.40.0

