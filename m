Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E001ADEF17
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A579E10E85B;
	Wed, 18 Jun 2025 14:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LzYoS/8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0F810E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SL9nDZol3vs1cqOSgVmLrfLfF1zwBsP/o0wOZK4nMI=; b=LzYoS/8K+xp4/lhbEcGDSbZO+u
 laJCqBSzveNaPlUQYEVydU0Yv93W/KpRmxEzRTRg/3ZuH5YAlo0d3Vv+H7UkMLBZeZ08SQH0wvyRN
 6Z9OcBuJqqKeL0f9/VBbOz0Wnsj0suvU8LcE5ENbptedFzshcqmZBV5fOe9/G6/447zzFoIIdTOoO
 YsKwF2NgPpMXSTui1/5/wP+73U8tB/xULk1yZpKGzNgltdqI66s/nlezRmMK8EaxJh77BuOEMnFrl
 V1qCgAOAyZPWFPin9K5PcMy3Gw7pWlfP5vKqRhTNPNhRulcn0LcYh2c4ob+51rL9DbdFVG/Qrn1OU
 vzGZIk5Q==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRtgY-0056EK-58; Wed, 18 Jun 2025 16:22:42 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/2] drm: Add missing struct drm_wedge_task_info kernel doc
Date: Wed, 18 Jun 2025 11:22:30 -0300
Message-ID: <20250618142230.2407354-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618142230.2407354-1-andrealmeid@igalia.com>
References: <20250618142230.2407354-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix the following kernel doc warning:

include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'

Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 include/drm/drm_device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..aae0800ccef1 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -33,6 +33,8 @@ struct pci_controller;
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
+ * @pid:	the pid of the task
+ * @comm:	the command name of the task
  */
 struct drm_wedge_task_info {
 	pid_t pid;
-- 
2.49.0

