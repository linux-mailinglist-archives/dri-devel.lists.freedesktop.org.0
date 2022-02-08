Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711F4ADB2C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 15:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70C10E1F0;
	Tue,  8 Feb 2022 14:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D910A10E1F0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 14:31:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 37B241F383;
 Tue,  8 Feb 2022 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644330715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8eXl9w9huskA5UfhxMUFp9g1LEG5boeqqob+ARgQeNo=;
 b=e3uqgJysirY35ArDJkwysllJhSpzUSExK0ZFagNeS2bsYzsCt2U8eyT55+Kxf3QNonM/nC
 cqueD8hVc+RfI46uyyyHgVC6d3HXNgscZQGoGs6Wg0xb2KL+JlB+MrWfKUrJ5QCcxqascW
 4RozEYhOZm03xEOh2vz+/3BgoWJlO9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644330715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8eXl9w9huskA5UfhxMUFp9g1LEG5boeqqob+ARgQeNo=;
 b=vNS+aTgGpm0O/FqVKkDiMIbSLX8vlsu0ChjRC+ryEgrsSjX2huGk0quapomniw00x/4zY3
 o2qyIN9gvEhzATAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07C8413C79;
 Tue,  8 Feb 2022 14:31:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /C2XO9p+AmJABgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Feb 2022 14:31:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	airlied@redhat.com,
	sean@poorly.run
Subject: [PATCH] drm/udl: Set VGA connector
Date: Tue,  8 Feb 2022 15:31:52 +0100
Message-Id: <20220208143152.5846-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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

Set the connector type to VGA. The previously exported DVII type
isn't even supported by the driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index 930574ad2bca..318fdb38b47a 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -128,7 +128,7 @@ struct drm_connector *udl_connector_init(struct drm_device *dev)
 
 	connector = &udl_connector->connector;
 	drm_connector_init(dev, connector, &udl_connector_funcs,
-			   DRM_MODE_CONNECTOR_DVII);
+			   DRM_MODE_CONNECTOR_VGA);
 	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD |
-- 
2.34.1

