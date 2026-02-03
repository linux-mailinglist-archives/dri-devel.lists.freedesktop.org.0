Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC2KB4hCgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:46:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E61DDCB7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B1410E012;
	Tue,  3 Feb 2026 18:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kaspersky.com header.i=@kaspersky.com header.b="mYRx472b";
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="xhVlMZXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Tue, 03 Feb 2026 13:56:30 UTC
Received: from mailhub9-fb.kaspersky-labs.com (mailhub9-fb.kaspersky-labs.com
 [195.122.169.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F010E67F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202505; t=1770126600;
 bh=Go0PwiQjX16SnL67toeGr3+NtiinJJYyk8SWsJkyAFo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=mYRx472b29bH1A0w4NG2FIX4CNIcdJU7J0XWH9mb7dXpogkmbm+5Co5dq7E/mJGZJ
 S6Ehvb827nYBf/9NYlgG7+7aHWzuu/twsQ67w95o24EHva8IVmWEy+Mm+gQdLiX3Sv
 SRBOwMrwaysVK7kyhGqOi5SpQWZIlEttZclE0XLngK2kcRh9AkcGOp9858pjSBqcj+
 ISj81Q7grGcrZR2ICuUiBJJqsFBQJo96izJGZdX3GJ8OKShpJiFPKU2STBBtdnU7x7
 jYqgB6Stf7r0neYIDBfAmfIuJMHcoNtRb/6/jKFT33UDD3GU6shquu7iQBV+jShxdH
 K1dH8FFEEZcmw==
Received: from mailhub9-fb.kaspersky-labs.com (localhost [127.0.0.1])
 by mailhub9-fb.kaspersky-labs.com (Postfix) with ESMTP id C13B7902AB4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:50:00 +0300 (MSK)
Received: from mx9.kaspersky-labs.com (mx9.kaspersky-labs.com [195.122.169.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "mx9.kaspersky-labs.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub9-fb.kaspersky-labs.com (Postfix) with ESMTPS id A0115902AE7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:50:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202505; t=1770126597;
 bh=Go0PwiQjX16SnL67toeGr3+NtiinJJYyk8SWsJkyAFo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=xhVlMZXWDkPzFyVdQrSYTgR+P4sfltj4p0kvlvWMiBb2mjd2hNf4kRgUR1w0Ze/F3
 P4RJKlvO7wVy+Xold8i8+MqWKWQMMJC4WwN9OEarfILHywJ4WSCYqY80XDc+QYWkmF
 bS+uNZRprmkJeavdGXTLl2sy/0lcpVCEuhFeG3ym2WKP+TOVQhudL7xP0oGK7PVZo9
 SEtDGP3zlruLwEaGUSgSaUuex48iiYmgoui5WnYEfReQ8FlcFlKtOrJkGSTwWGqDnE
 df60ktyQJC2EiRHPjr/azPB1uV+N7JAUcq2pIKTvXuV8idQGL1pPh/K4s0/oRSGkXe
 xnWofXsurOieQ==
Received: from relay9.kaspersky-labs.com (localhost [127.0.0.1])
 by relay9.kaspersky-labs.com (Postfix) with ESMTP id 423CA8A0742;
 Tue,  3 Feb 2026 16:49:57 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub9.kaspersky-labs.com (Postfix) with ESMTPS id BE4678A080C;
 Tue,  3 Feb 2026 16:49:55 +0300 (MSK)
Received: from konyukhov.avp.ru (10.16.104.193) by HQMAILSRV1.avp.ru
 (10.64.57.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Feb
 2026 16:49:54 +0300
From: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
To: Liviu Dudau <liviu.dudau@arm.com>
CC: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/komeda: fix integer overflow in AFBC framebuffer size
 check
Date: Tue, 3 Feb 2026 16:48:46 +0300
Message-ID: <20260203134907.1587067-1-Alexander.Konyukhov@kaspersky.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.16.104.193]
X-ClientProxiedBy: HQMAILSRV5.avp.ru (10.64.57.55) To HQMAILSRV1.avp.ru
 (10.64.57.51)
X-KSE-ServerInfo: HQMAILSRV1.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/03/2026 13:36:41
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 200098 [Feb 03 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: Alexander.Konyukhov@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 86 0.3.86
 47cb2a3d3f5c7e795bff2d0998e8c196722872ab
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_black_eng_exceptions}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; konyukhov.avp.ru:5.0.1,7.1.1; kaspersky.com:5.0.1,7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/03/2026 13:38:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/3/2026 11:55:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2026/02/03 10:20:00 #28174714
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-Mailman-Approved-At: Tue, 03 Feb 2026 18:46:26 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kaspersky.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kaspersky.com:s=mail202505];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kaspersky.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,linuxtesting.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:liviu.dudau@arm.com,m:Alexander.Konyukhov@kaspersky.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Alexander.Konyukhov@kaspersky.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxtesting.org:url];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Alexander.Konyukhov@kaspersky.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kaspersky.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29E61DDCB7
X-Rspamd-Action: no action

The AFBC framebuffer size validation calculates the minimum required
buffer size by adding the AFBC payload size to the framebuffer offset.
This addition is performed without checking for integer overflow.

If the addition oveflows, the size check may incorrectly succed and
allow userspace to provide an undersized drm_gem_object, potentially
leading to out-of-bounds memory access.

Add usage of check_add_overflow() to safely compute the minimum
required size and reject the framebuffer if an overflow is detected.
This makes the AFBC size validation more robust against malformed.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 65ad2392dd6d ("drm/komeda: Added AFBC support for komeda driver")
Signed-off-by: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 3ca461eb0a24..3cb34d03f7f8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -4,6 +4,8 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <linux/overflow.h>
+
 #include <drm/drm_device.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem.h>
@@ -93,7 +95,9 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
 	kfb->afbc_size = kfb->offset_payload + n_blocks *
 			 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
 			       AFBC_SUPERBLK_ALIGNMENT);
-	min_size = kfb->afbc_size + fb->offsets[0];
+	if (check_add_overflow(kfb->afbc_size, fb->offsets[0], &min_size)) {
+		goto check_failed;
+	}
 	if (min_size > obj->size) {
 		DRM_DEBUG_KMS("afbc size check failed, obj_size: 0x%zx. min_size 0x%llx.\n",
 			      obj->size, min_size);
-- 
2.43.0

