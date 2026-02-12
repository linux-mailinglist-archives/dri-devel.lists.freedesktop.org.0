Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC0uERLhjmluFgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 09:30:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7D1340CD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 09:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C14310E7A7;
	Fri, 13 Feb 2026 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XZ0NnIj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29EC10E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 19:26:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso22975815e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770924403; x=1771529203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
 b=XZ0NnIj43fxQ2k6T+PgkTLcDXjLXk0ZnR4f8QY0++AaiG2AZn4qgS/DoPYAnOJTYj/
 n4Vco6VDxqv1hD9ScyvtYhuUDsoSqH3geDh1sByEmo+xUpTf6lTPVQWwmPYJey80WZ3p
 ynDdTO0GsMyIvIjHcWiOaO25J9IDy5b3c98kbY9gI1oV+x611jGoFFpKErX/hLp9eIbW
 JemCyd+MnViH+Yif/mTJWObevCaclZPn+uv3u3TQ6xnpZQWb4B2LTQhEfPiFZvs/036X
 AZkkkBa9G59/soD/RqSUCmOXvkZE+Y49zJK++zAxBtlGmIfTNU9HpPCvAZdPkHV/LxUy
 s8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770924403; x=1771529203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VbOs3cQtoIqcba8ksEIev4JgP5sJJiSr7MKbA/ghxVg=;
 b=ceqruBxq6pZG8MWSgFChbx3dSZHNIKtubFEOqs3DEd2jfVyKWUraLkfhb2xJvA92e5
 7UZSQGuJPJZsp3UfyTOKQYYCXUv8gM+Sum09LF0WtIOOqgxDYrr2cpTEIwpr0nsaj+CQ
 k6F9Fo5tDNfV2B6Sk5cxUgPQC5NE3WzaOLdUIo4/k5hv5t5ytIM0SetyNWOQ4qCXohQh
 6T/yJShwMyxuv4MK/wRoLHDPx5PPQBjsCOoscggob9CmPQ78WH3HS8EL2LwUGh87QTzJ
 bySPBxH6J2RO8/sIQzjShbVCWrGksa3Nud4ctgfZ+6cKkJNrq9XD6kJa0q/OR89TEvS9
 yvMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMnbr0GqVDnvVi2zLPQgm8Ip/ZZny2BCalAseu3qoBYvy2pEPQZUqUGzr30mHunz7n6zO295TJwdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvsn0A8jXt8EMo82GfBceA6CjsnBAfcODcfShYe3Wlpk1rUWYP
 OURiF8jVMEKCoG6m3Q8GPsp/seYW03ibHRbPPlmub0mkaqPtwm8sSlva
X-Gm-Gg: AZuq6aIDyENCYfkeeSZRbmvlTEh1jylTefngsFRGAUBbxHxYWXDMqlX1fzrxwUqx/pN
 XuASoWwhSzw0yHuhzyvfD/7j7JbptqMjDGpA3XhEMDt8GUuCVRymDkqBYsOM4YjbFYOfl4X29t8
 hNxPj6pfqXqIpyu+obpshQLiICmjEU337WJmX6GOWBBnAIQ3aq8/2iccfbUkojq7Kc52qTCpZOL
 eyVloGfyBmM6G5VtkiJlJpOEmv+VVywacBqIRq2jXY0prSMhfdkNSuLO1OClprBZlpnQagULYlW
 jXAn/Bbl0dPW2hV+7L7AVEU72iWLeUY9K6/ho4v9zSoMb34VvTot+t1ojOZCjv1CbKs2EKkjpa3
 yZNIoMCelB88nqDMYiqsC9sE9ffJ7b6irVa6ZwWlscIL4YEJOD27swk3MpykYvRF1s9Y/D3xG9O
 gyZHEGnnL3CfnhXTh4DHM=
X-Received: by 2002:a05:600c:1f8d:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-4836601387bmr57305525e9.11.1770924402981; 
 Thu, 12 Feb 2026 11:26:42 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483719b8e71sm20405e9.2.2026.02.12.11.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 11:26:42 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
Date: Thu, 12 Feb 2026 19:22:47 +0000
Message-ID: <20260212192605.263160-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Feb 2026 08:30:03 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9AD7D1340CD
X-Rspamd-Action: no action

If a device has a framebuffer available it might be already used as
display by simple-framebuffer or simpledrm when mediatek-drm is probed.
This is actually helpful when porting to a new device as
framebuffers are simple to setup in device trees and fbcon can be
used to monitor the kernel boot process.

When drm-mediatek loads a new fb device is initialized, however
fbcon remains attached to the initial framebuffer which is no longer
connected to the actual display - the early fb is never removed.

We can gracefully transition from framebuffer handling to drm-managed
display by calling aperture_remove_all_conflicting_devices before
registering mediatek-drm. This takes care of unloading other fb
devices/drivers and disconnects fbcon which then automatically
reconnects to mediatekdrmfb as soon as it's available.

The function is invoked just before drm_dev_register() to kick out
the existing framebuffer as late as possible to reduce the time the
screen is unresponsive.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
v2: Moved the call to aperture_remove_all_conflicting_devices to 
    right before drm_dev_register()

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..02effd9fc698 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -670,6 +671,10 @@ static int mtk_drm_bind(struct device *dev)
 	if (ret < 0)
 		goto err_free;
 
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Error %d while removing conflicting aperture devices", ret);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto err_deinit;
-- 
2.43.0

