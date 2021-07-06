Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9F3BC72C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 09:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C337989895;
	Tue,  6 Jul 2021 07:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042989895
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 07:31:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A17B22537;
 Tue,  6 Jul 2021 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625556687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Sm5wfMsGBaax4uhPmvM5QSRfKxzLuCjuHLkfrCfmDik=;
 b=OK2WNPVNzWK9ysIyu+D/Z3OMS1q4MYUKE+XbBE0dQcb2pIa78BI+tx3C4Sn78F/TKr0pPL
 6g5JmJlI5E4mQAqKc1xMQgWVYusRXwuFpDH3VQRAXx5pBD0EmScEHbHosdebk+VbPyBqSk
 FRRPcQWp6fRHH6VwuqXJ1Y7wrrqG9bI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625556687;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Sm5wfMsGBaax4uhPmvM5QSRfKxzLuCjuHLkfrCfmDik=;
 b=QDR0fZxixzZrxnxX592514/swqzuvbiiin2lhm1TNAGc73cHwEfzyi49876ZmK2fb30S8F
 2K03mk5aSLU2I8BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F7B213A42;
 Tue,  6 Jul 2021 07:31:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f3LdAc8G5GB9aQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jul 2021 07:31:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/omapdrm: Remove outdated comment
Date: Tue,  6 Jul 2021 09:31:25 +0200
Message-Id: <20210706073125.7689-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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

The comment refers to drm_irq_install() et al, which are not used by
omapdrm. The functions are part of the DRM IRQ midlayer and shouldn't
be used any longer. Remove the comment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/omapdrm/omap_irq.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index bb6e3fc18204..4aca14dab927 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -253,13 +253,6 @@ static const u32 omap_underflow_irqs[] = {
 	[OMAP_DSS_VIDEO3] = DISPC_IRQ_VID3_FIFO_UNDERFLOW,
 };

-/*
- * We need a special version, instead of just using drm_irq_install(),
- * because we need to register the irq via omapdss.  Once omapdss and
- * omapdrm are merged together we can assign the dispc hwmod data to
- * ourselves and drop these and just use drm_irq_{install,uninstall}()
- */
-
 int omap_drm_irq_install(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
--
2.32.0

