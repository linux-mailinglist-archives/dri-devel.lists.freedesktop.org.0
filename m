Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9017F4610
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1C510E61F;
	Wed, 22 Nov 2023 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FEC10E609
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7B82221978;
 Wed, 22 Nov 2023 12:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDMpHxi3CfSbDMFpjbwGj6/paOnTHc7oiIWqyece+D0=;
 b=PbkRU3sGzckXtDKkuQS08zImtZFJZU1z4YbBTRLTEaEdE/T+3a4NJP0/frdoB2Csdp9eL0
 +Ag9eR/Xl6CMiDbhHyWdO6GnorlidmO5Pgku8BGOolH1hlwzwkECIzS4yZu2QdVHCJjVDs
 oQ/iQIA3/9cDT6YjFMrrbUtkZO5Yf1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655894;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDMpHxi3CfSbDMFpjbwGj6/paOnTHc7oiIWqyece+D0=;
 b=rCeNEDhJUtSDRPIXE1C4THQeB5nsH6Ef3gAGDNt06O6XcZoJg04401Yp3cWk9PvCBddALv
 tJa1XsEwT3ZfzoAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C87113461;
 Wed, 22 Nov 2023 12:24:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJTGDRbzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 05/14] accel: Include <drm/drm_auth.h>
Date: Wed, 22 Nov 2023 13:09:34 +0100
Message-ID: <20231122122449.11588-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
References: <20231122122449.11588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.20
X-Spamd-Result: default: False [-3.20 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.90)[99.55%]
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of the source files includes <drm/drm_auth.h> via <drm/drm_legacy.h>,
which will be removed. Include drm_auth.h directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/drm_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 294b572a9c331..24cac4c0274bb 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -11,6 +11,7 @@
 #include <linux/idr.h>
 
 #include <drm/drm_accel.h>
+#include <drm/drm_auth.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
-- 
2.42.1

