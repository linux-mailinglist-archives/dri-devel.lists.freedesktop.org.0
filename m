Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBvgIIFUg2mJlQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:15:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA2E6EBC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 15:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBE610E654;
	Wed,  4 Feb 2026 14:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="A7N6wJ1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com
 [203.205.221.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981C010E654
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1770214518;
 bh=99I5DbkTSmZC/kRPBwhG5U1q3BZLwtXpliXP1JgLj+I=;
 h=From:To:Cc:Subject:Date;
 b=A7N6wJ1rr/AB9cXV+LJyCgVDnh/Zq8GM/uoU6gHqEH5c2X2ELSXnsne6AhSHXOQbT
 S4TtszZlT9apIedEU/r89a8uctDolKV1QRWnIXsOHoSLZYD3OX/5BOZ3vnusmCye2/
 1YS1nj5/yOucX7OZQrx2htz/6/ZwAsxAyCjbFB/c=
Received: from localhost.localdomain ([171.223.167.132])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id 3CF18C9C; Wed, 04 Feb 2026 22:15:15 +0800
X-QQ-mid: xmsmtpt1770214515ti5vr6cyj
Message-ID: <tencent_78CE07AD804905B05466486B299306C51B08@qq.com>
X-QQ-XMAILINFO: OfxHHOU34G6pD+7ribdQoEWc8G/UDiMfDAQdfLHs1ewTep6GOzvPiApg18Aeoe
 EdzNSp+C5fbSKqCktQHvwjhUSa2FfS1NY9g+K/jOg9bdlWH+lMGMObhIn4G+q3Ax/ih7q3EkY69e
 0RaEkU+ZBolvowvxja2uZp3BtxbUzSaRTSAgb0gjx2cAoXHMtObX9rbW2X/xj6DZW/l07A9Mb2i5
 F39MMFrvKWyFR5vZiyVS5KrYg3//JO4gs9MfN8dsUmfdxGj66m5E5O2y/D63Vih1qqcN0sXbDAGB
 rsswUPnMa5Xh8pUE9dDqXSc42aFPkVvYo11JdLsV49T4ME/BJuDXE6/g2cm5JoAHmLOp91KIRgV0
 yf9ZSEjLrWjQFkK5/e0gKOTXcxCmGBcKK43JWfXZpPhdFj744sZGOiyYNuIHJ1PuPiIwpce8KS+c
 blnGCgdibMgbzssHDvl4jhSB5aCrBekETsc+5e27DW/a/36U1n7fr04CoJVX7tXPAJB9UhSQ0HAZ
 +oHAMcxuAT8szqtFX56ToWu+a1rSHJET+liLwnxX5fxbAyMX4ePRlbe7zBdvsYnPU7TxI3+Xj1ja
 Ga0WhbnYOYXSVk8y8AZtUKhVlAz+RAlO7sLNZVt8Kh03XXEKPpKpFV0L3NFq736mplv4bJK4vrtS
 zbW5ApJW8bKzHOrijoVgaj4zNAXl1+NluzoKfcQf4Cru1qp+6X8hfwVk6FkDzyRar1z4FptpT8yd
 mz1iFOX5naSH7OxJ/KdCZREa2Vdnl8k1M90qZGdSQgjTFhfvHKQcEV+t3JQ4dLOAzQZoSr5d2D6A
 vHWy7lahtm4nxKUm3SAbHocq/S0xIS/nOnZ4oDPSSPa3BJph+4JpZQfUVWM0AZleRKQwpbEwwbLo
 fuUDIDUgOFldShECtUPARLr51uKpkTEDl8vz60tcAIngKWqPL5x8leN8OjjZH5ydAdzJJSyzmZ4g
 ZOUQuQo48W5WKtR0DQ5R8H931Fup41MZzS7RcSBrdfF2npS7+jrYQM8tIiUL/wLDsKjnBLNxff3Z
 lcSfD6C6HEmR+m18b1345Vt0f1wWsk3eOKbSZT/ZB1fRrGACRAtfFnKw7mRQIQzwAkQfD5ag==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Renjun Wang <renjunw0@foxmail.com>
To: louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH] drm/vkms: fix gamma LUT size check
Date: Wed,  4 Feb 2026 22:15:13 +0800
X-OQ-MSGID: <20260204141513.8171-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.47.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:renjunw0@foxmail.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[foxmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,foxmail.com];
	FROM_NEQ_ENVFROM(0.00)[renjunw0@foxmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foxmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,foxmail.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: CAFA2E6EBC
X-Rspamd-Action: no action

vkms_atomic_check() computed the gamma LUT entry count using
sizeof(struct drm_color_lut *), which uses pointer size and
can incorrectly reject or accept LUT sizes. Use
drm_color_lut_size() instead to validate against VKMS_LUT_SIZE.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd1402f43773..a09589949f48 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
@@ -111,8 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_state *st
 		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
 			continue;
 
-		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
-		    > VKMS_LUT_SIZE)
+		if (drm_color_lut_size(new_crtc_state->gamma_lut) > VKMS_LUT_SIZE)
 			return -EINVAL;
 	}
 
-- 
2.47.3

