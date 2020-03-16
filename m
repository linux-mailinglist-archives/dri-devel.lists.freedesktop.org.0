Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B718872E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6756E217;
	Tue, 17 Mar 2020 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F4F6E33C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 21:17:04 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id f17so14324340qtq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FuZZoVTFoFF+1kD/gUu0wVHL7she4RE1ISWVv5X9/Y=;
 b=vS3P/SI72Ul6DR1lMgGssHto6g2grnX9qlthgAH3MQfmuXC8X32mBEV5vRMILYFoOq
 4onAUSdTQuBwhU0RuSci5/PTf1r4JBaUP8Pw0DyYOWja6pAkXMATZKnLyjyFZEGi+GA/
 eCDQlvBCRoEzFSHEzjyIod/Hajg3WiKRzy1Y3Ojd8TGeVi2RTyLkv2JxJXW+vsx5GDYY
 WNg2Xvb6E7w7rb+ylM+6oO9aGCkI3rJhKrXAXeRNMiFn7ivrSzDCkzvRnvwc/qzEBWn0
 IBtQ02xNfhoR+D4fAsK7NATVfiG+qj8CTzFQe2nPxlmTI1GBmzEoljvP0picHIgld4qx
 JMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FuZZoVTFoFF+1kD/gUu0wVHL7she4RE1ISWVv5X9/Y=;
 b=h+dLpGz85pZzWQ9GG8BG+AARE7/IQgSjpAyQeQcPc6dt7i458m/cQSN7eIlp8iMh40
 IcDyBVXF7lhJee1xJ7rkfCn5RF2PPTIFaJEminTCmqS3Fz7JVrrE4cEmXsFsp91znELh
 4n9a2GI7q9zXpx5QAzWPsFxigqRqaaFx2rpBhDHanE3uEZYKDRHtvbiuTo9IfcxuYVoC
 tT+kUmVatVrWnyTepw0Mn7832jf0jIRtwy1TekDZzfzjMyHn3plPMVcIp4JJWrn5q7D7
 IRFnLTKccveICYPaPwUc9BL/eodbgPaSOrtayb820XnHGCdrdKScTZc3fFJxcOJMB3XC
 23HA==
X-Gm-Message-State: ANhLgQ0sgx2CCHOwFZgHuklFDfuPnP4p5cnyLiVP2vBcTlLBPwa5M14V
 Osz2y1dt0ciJM0poDWEoB2U=
X-Google-Smtp-Source: ADFU+vvhoV+Um0FzZrMDfLcuJCaJUEsDuGqA2Mhz9ejyhF6zsDn0DKV3vmnWwROYKPClMo1LTYQOsA==
X-Received: by 2002:ac8:481a:: with SMTP id g26mr2174747qtq.267.1584393423506; 
 Mon, 16 Mar 2020 14:17:03 -0700 (PDT)
Received: from localhost.localdomain ([179.159.236.147])
 by smtp.googlemail.com with ESMTPSA id p23sm579055qkm.39.2020.03.16.14.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 14:17:02 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: drm_gem: Fix a misaligned comment block
Date: Mon, 16 Mar 2020 18:15:53 -0300
Message-Id: <20200316211553.2506-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: andrealmeid@collabora.com, Rodrigo.Siqueira@amd.com,
 rodrigosiqueiramelo@gmail.com,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a checkpatch warning caused by a misaligned comment block.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 000fa4a1899f..6e960d57371e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -222,10 +222,10 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before we
+	 * checked for a name
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
