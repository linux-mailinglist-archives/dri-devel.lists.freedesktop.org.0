Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14930B143B6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 23:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F01410E041;
	Mon, 28 Jul 2025 21:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="T9jhr2ru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EF210E041
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 21:08:53 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4ab6416496dso59599771cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1753736933; x=1754341733;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RTQ6vqx28Dz0uqFmhv3LGEMxqXRH7t8/cVDuISwhels=;
 b=T9jhr2ruSFy+ibFf329gzHtcRAo5ugIlbKr59aaBjQguimK5ZYjL6sHf7KaRMVbI9Y
 7hbWDZgdSHSzsxO8t91yqgsbGTS4vt1TfNr4Kggkijpadus8pNR4L7ZayZ7hPVboJIdB
 m+o6xTF8yvYPfMX6Hxvv4EAMiixESy0UP2z20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753736933; x=1754341733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RTQ6vqx28Dz0uqFmhv3LGEMxqXRH7t8/cVDuISwhels=;
 b=CuB/9tDuAlrez0krrUGpTp7NtuCQwqdmrlRTp/X9zG6gWM+/+qOkh+c63VSj9bwm22
 QsqC+1afUu4ORDqMRfrJot1llLRfOA/OigsoHdKwNVLcT/7LViNU7+9GWJ3njENViiNK
 4eF6iSs8xLVndq210MQYWs7BVqOqCOp8NYL1ZWi0yfDNXHMUkqdm8+aTKfoFE9A+dgM5
 qCo5CGJLop5GYcwposkUQzAS9cuaAkd0lNHwcmftQ75dMTCt1JF6O1YPcZQsR/jtWOEa
 RhEnxX/qMdDs0xEKPXTuPCoplHlbnMl0OZOHE35ox7GY/9AWf1swFW4bYp27haYjhYqk
 P3jg==
X-Gm-Message-State: AOJu0Ywm/CqDSSUjrWCewJIYHegb/9z8liLqyK5okq9ig04S7N8Lpl7n
 VGWDd1pTcVOH4lRSSC4oPLyy6qsrex0BYIZuuUhIN+e2pkxyMAcLWVbWL//C6rMOa75L8RLA462
 VM99rct9n3n5T9ZL5uEdk3sKHUBrw1I2SIO1ncjucwhj2afEbKqErT8dmQKPMH5HRyHPUaVHCWc
 FljtsGuUJetccQiept3jKnhZbb97SRp6qcUSlRq28ml4MKxWyhZYBheg==
X-Gm-Gg: ASbGnct/nPtmG4VL2bn8dtgkMAoMh39svd6T6CvDvW+mec8654FBtxqsqwCFe5GKBI5
 sI9PNJnMCOuuG5bXWFABbO9t7KO+zSPcKJ2xFbRFODV3hjjuKZAuOpv8/QE6l9knGSlgYnmmnqU
 M5o6YEac6VnyjXHMyl1TDdTfjJk4h68juRzwtw19iegMYvo59AIrcfPIimlVUXvBImLP34FMWVS
 /XISC0GM/FW3J01KsT9znm5CMv+AZ2MdcNUrC45iijWXiDIVqY2sqB0Z3pH956FWC7tiypRfRBK
 xYexHz1o7b9LjfO1zUkPh7HUAZUgT+Fw6kuLLnmn+vj6RC1krhy1rFNSa5lnGW/8HzAZLvJdm72
 YIen9886QQn7QnsJhrTG2Qatxzuy7vO/+1VckGYowGWbFhAmcrNc+L34fjYD2eqGRzPM=
X-Google-Smtp-Source: AGHT+IFzpOlsIsYr0/wxNPbh2BPW05kTk0qCfyhL5tkmrL+atIi+g8l6GS1g3z5Ei70yxcNRhTyOKg==
X-Received: by 2002:ac8:7dd6:0:b0:4ab:71a2:6149 with SMTP id
 d75a77b69052e-4ae8f0b4b03mr215035931cf.50.1753736932546; 
 Mon, 28 Jul 2025 14:08:52 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4aeb2e7a7fdsm21452311cf.4.2025.07.28.14.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 14:08:51 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Clamp the max COTable size
Date: Mon, 28 Jul 2025 16:08:45 -0500
Message-ID: <20250728210845.102771-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.50.1
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

Due to a quirk of the SVGA device the MOB that backs the COTable cannot
exceed SVGA_COTABLE_MAX_IDS elements. This causes issues because MOBs
are allocated in PAGE_SIZE chunks which means we always round up the
size to the next page. This causes the device to error out when we try
to set a COTable that can store SVGA_COTABLE_MAX_IDS but is slightly
over-allocated by some fraction of a page. This then leaves the device
in an indeterminate state.

Due to the doubling logic in vmw_cotable_create this occurs when we
allocate slightly more than half the available IDs. As a result the
validation logic in vmw_cotable_notify never trips which is what we
currently rely on to limit the size of the COTable indirectly.

By reducing SVGA_COTABLE_MAX_IDS to a slightly smaller value we can avoid
this quirk. Any application getting close to this limit is likely
leaking resources so reducing the size by less than 1% should not have
any noticeable impact on well behaving applications.

Fixes: d80efd5cb3de ("drm/vmwgfx: Initial DX support")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 98331c4c0335..366e97a95179 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -74,6 +74,11 @@ struct vmw_cotable_info {
 			    bool);
 };
 
+/*
+ * Due to a quirk of SVGA device we can't actually allocate SVGA_COTABLE_MAX_IDS
+ * for all resource types. This new limit will work regardless of type.
+ */
+#define SVGA_COTABLE_EFFECTIVE_MAX_IDS (SVGA_COTABLE_MAX_IDS - 510)
 
 /*
  * Getting the initial size right is difficult because it all depends
@@ -545,6 +550,7 @@ static int vmw_cotable_create(struct vmw_resource *res)
 {
 	struct vmw_cotable *vcotbl = vmw_cotable(res);
 	size_t new_size = res->guest_memory_size;
+	size_t max_size = co_info[vcotbl->type].size * SVGA_COTABLE_EFFECTIVE_MAX_IDS;
 	size_t needed_size;
 	int ret;
 
@@ -553,6 +559,8 @@ static int vmw_cotable_create(struct vmw_resource *res)
 	while (needed_size > new_size)
 		new_size *= 2;
 
+	new_size = MIN(new_size, max_size);
+
 	if (likely(new_size <= res->guest_memory_size)) {
 		if (vcotbl->scrubbed && vmw_resource_mob_attached(res)) {
 			ret = vmw_cotable_unscrub(res);
@@ -650,7 +658,7 @@ int vmw_cotable_notify(struct vmw_resource *res, int id)
 {
 	struct vmw_cotable *vcotbl = vmw_cotable(res);
 
-	if (id < 0 || id >= SVGA_COTABLE_MAX_IDS) {
+	if (id < 0 || id >= SVGA_COTABLE_EFFECTIVE_MAX_IDS) {
 		DRM_ERROR("Illegal COTable id. Type is %u. Id is %d\n",
 			  (unsigned) vcotbl->type, id);
 		return -EINVAL;
-- 
2.50.1

