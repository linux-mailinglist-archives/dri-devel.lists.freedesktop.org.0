Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKc1Mux0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9C90FEA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C34710E029;
	Tue, 27 Jan 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="bd+v51sk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m4920.qiye.163.com (mail-m4920.qiye.163.com [45.254.49.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C4D10E4C5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:20:56 +0000 (UTC)
Received: from [127.0.1.1] (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 321ac1ebf;
 Tue, 27 Jan 2026 15:20:53 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 27 Jan 2026 15:20:52 +0800
Subject: [PATCH] drm/bridge: lt9611: Remove I2C address change in sleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rubikpi-next-20260116-bugfix-v1-1-46e3396533ac@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIAFNneGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNz3aLSpMzsgkzdvNSKEl2IqKGZblJpelpmha65aUqShaGBSYqRkaE
 S0IiColSgMNj46NjaWgBtaGcubgAAAA==
X-Change-ID: 20260127-rubikpi-next-20260116-bugfix-75db8104d221
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769498453; l=1845;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=VS58Z6EWxMLfwvmOEduOtWU+4OTrNArKm/ZRO0F+hoI=;
 b=QTHmefZIyGgEeq8CcgfTzda7meeeWhCCf7XtOcEBlYzB4LT7Dq4fo2geQYTtKbtzZ9mpOO3ax
 Eu7v6E3R2iXBipZQTuPz6TF0WnJh09aHqh6H/jiINA0VJHcOX76afyo
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9bfe53a43609d5kunm0a7e89bd88b7c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSxhCVhkfQk4ZGE4fQ0NDHVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
 VLWQY+
DKIM-Signature: a=rsa-sha256;
 b=bd+v51skleHJMFbVi3MuPWA83yUujCUe4WNY2khyMfnBmjuUoIKzOIwE3ZnlzoHmGThv08wwc/nb3AFTsiz52Z7hwxj+AM8ONLoJKYM+05RMF2ibfZgt/bgh/s6FRNmbw6yKQh1o0oM8YWb8PE/D1/0DM9vPG3L6hgK2TrwULgU=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=oe2MUH1cOcaJeonnVebb/N5MTE1ndKMnPoRJ3/avaUg=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C7D9C90FEA
X-Rspamd-Action: no action

The lt9611_sleep_setup() modifies the chip's I2C address via registers
0x8023/0x8024 and reconfigures GPIO0 via 0x8157/0x8149. Since there is
no corresponding restore in the wake-up path, I2C communication fails
after resume.

Remove the I2C address and GPIO reconfiguration from sleep setup. The
MIPI Rx power-down and TX PHY disable sequences are sufficient.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
The lt9611_sleep_setup() function modifies the chip's I2C address via
registers 0x8023/0x8024 and reconfigures GPIO0. However, there is no
corresponding restore in the wake-up path, which causes I2C communication
to fail after resume.

This patch removes the I2C address and GPIO reconfiguration from sleep
setup. The MIPI Rx power-down and TX PHY disable sequences are sufficient
for proper sleep operation.

Tested on RubikPi3 (QCS6490) platform with the LT9611 HDMI bridge.
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744..ae47efe9d77f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -424,11 +424,6 @@ static void lt9611_enable_hpd_interrupts(struct lt9611 *lt9611)
 static void lt9611_sleep_setup(struct lt9611 *lt9611)
 {
 	const struct reg_sequence sleep_setup[] = {
-		{ 0x8024, 0x76 },
-		{ 0x8023, 0x01 },
-		{ 0x8157, 0x03 }, /* set addr pin as output */
-		{ 0x8149, 0x0b },
-
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260127-rubikpi-next-20260116-bugfix-75db8104d221

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

