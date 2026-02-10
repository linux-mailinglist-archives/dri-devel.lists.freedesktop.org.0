Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJB+J8k4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4C1220B7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9F410E21E;
	Wed, 11 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fI+pmvjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896610E523
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:34:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so3009031f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770716058; x=1771320858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
 b=fI+pmvjLuoThW9IBNhF4DhKZJ01mbgCJk3L4CKCsme/pt9k0Ks2td/xzS3JR3x2xz5
 NPMqLEIyIazRqPLMaGhNYO8AYQ1jDaKpsV2Xe7zzhEHyMCcUtxfY9CXvqJZS8EHCe9JH
 u5k4+utlkdOeTCrIkt/fd7/qjDBGRLc73/9CFj7E19NjRuEzPTeFsjB/CFyjV4AtNF81
 D96YVTmYZvNA4QEFxTs/3lswotEYOrNeWsBfzYCaCbCwcWjWnao+uNY4FgDX3o/Hw9EC
 R8QI1+WRkcPeKGdu3p+4Q1/WSAxCtloYH714L4nJyR9SAZgMd/xwMMwB6aLNjzdwrZMH
 cgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770716058; x=1771320858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4pWXM8MAKWeYJmoBAYToovJi1wgFNm1p75GzaAUFNs=;
 b=TpgifMyzROyEyLBGucr3hqspDOz8Vwlg0gkjVpe0qWen5yuvEfa8jvmPYbRhpFRbYC
 VSEfOApa5liybhT5aJgLGQSUOld2PbUhKCY6f7Mf9YJjIcAEMyFLeQcOEGwxp0m2BZ4O
 wyADUKEw2BpPTye8BYvNhuO+3APrvrvTHnDHDc5PWoqaB8ATYFfulJxqOu1Nmc4Al+e6
 SjJTREVzTyd3TpTmsT5wBP8uJCoD3IU3CMXiVpwyNUSLqbxO9HugALJOd+Jdb4xiTUtx
 1Qyj+uUffWQ2cTzrm23ogwxo7CQP0O7xhBnHd4hqhIqBJ8VA3pnhY0l/UY4iB0TZRVSM
 RUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ6otBw6FjDPY52O25yje+5jfLQ+Th5JgortawYFHnfNDWRErsvNlSEx20KhxafufvzFbZSaBwr98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2NcKGBsiBLnFNqScYFtVVW6XnN3HUUoC+EMbg02CVuapIHiZs
 pTfmmuCqs0uGaYLctCPwe+0JObCxEIVO2sAbPz/XtZr//T6aIbhC/dGB
X-Gm-Gg: AZuq6aKjCmcMQC1FhOUUVHBUSjkA6+Lau5tyOWfs2brlAWRcdxHeV3uvEW87vDAKOVx
 fcxkw6JJ2ZVPM/4UE6zSj+ldo+iJr3/qjeYY6YENiyDh72ysEjv2OAWSgDNUabDlxfZeAdfWfvI
 9pH3VFwF/DdkyuzAqRH+4VHSEyKVUJmMlASRVO/yVZ852NGqpCYPmB5C1dt6nrgg+28FdY9UIon
 hg2bTzOLEpuK5pTiv4HG6P+avymCOpDPWxpqxnlUAIFOQS0TJUAEoBEB07QzErnqdGWgcfSuz+7
 DzC7UfwJdCpwSzdDvObOYsMm/dbUpVCzAAtJt1ILAH5cnHY/wSxbtPL7AYwuCbjhsrUKMTGom9i
 Zs3UDGvmhYdHvQYW50H5kNrZeTCWxCP0DqIK19xZrCgIXEjrW5GoKv2p74lX8LXwPhNdKcKGm0g
 8MAeanBYJ8jABvzS63Gvg=
X-Received: by 2002:a05:600c:621a:b0:47d:92bb:2723 with SMTP id
 5b1f17b1804b1-48320928d7cmr202536005e9.3.1770716057605; 
 Tue, 10 Feb 2026 01:34:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376a78d796sm16571660f8f.20.2026.02.10.01.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:34:17 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC] drm/mediatek: Remove all conflicting aperture devices
 during probe
Date: Tue, 10 Feb 2026 08:39:43 +0000
Message-ID: <20260210093333.5112-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mediatek.com:email]
X-Rspamd-Queue-Id: 04B4C1220B7
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
display by calling aperture_remove_all_conflicting_devices as we probe
mediatek-drm. This takes care of unloading other fb devices/drivers
and disconnects fbcon which then automatically reconnects to
mediatekdrmfb as soon as it's available.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
This patch has been tested on Xiaomi Mi Smart Clock, however
I'd like to get some feedback from more knowledgeable people,
especially about those points:
1. Is aperture support on mtk-drm desired at all?
2. mtk-drm does not know about the fb address therefore as far 
   as I can see we can't use the more specific function
   aperture_remove_conflicting_devices. This means that all generic
   aperture drivers will be unloaded. It might not be a real world issue 
   as I can't see why one might want to load mtk-drm while keeping 
   other aperture  device drivers active, but my experience is very limited.
Thanks!

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..17e45b93fe49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -4,6 +4,7 @@
  * Author: YT SHEN <yt.shen@mediatek.com>
  */
 
+#include <linux/aperture.h>
 #include <linux/component.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1116,6 +1117,11 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private->all_drm_private)
 		return -ENOMEM;
 
+	/* Remove framebuffer owners, this will release fbcon if active */
+	ret = aperture_remove_all_conflicting_devices(DRIVER_NAME);
+	if (ret < 0)
+		dev_err(dev, "Failed to remove conflicting aperture devices (%d)", ret);
+
 	/* Bringup ovl_adaptor */
 	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {
 		ovl_adaptor = platform_device_register_data(dev, "mediatek-disp-ovl-adaptor",
-- 
2.43.0

