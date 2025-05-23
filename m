Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FDAC1D32
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FC10E77A;
	Fri, 23 May 2025 06:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Ens5UNJd";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rkrx2fJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BFC10E77A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1747982457; x=1779518457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ba/0s2zFjBwwDkrqACm+IAKb2aRWgGWa14NBTiYnyo=;
 b=Ens5UNJdJHxayLsyRTrGB9FRf/EFWfgpV3fiiVvk2N/Nzk9qyKakhmmM
 7t9nX1IcwtPFQ2g6BsptAnP/xyEJMLJmrKQrYO7iWXtkiBFVyyUXQ+G9V
 Q5eGwOV9u+jbBO3jaO0cOaYiNCLDUvP7RY/ZC9CKKUdPt7TP0D/hPYrEH
 4rd8dqhkvwi8yvO3joKeZCctd/WET4UO+FTGH53lWAVti+361n9GqrPww
 j3NxOW/7mGnZ+E2G2PU5gaujZIl9+yuyVKhW5Cg5gNC0pRNmJHNdPnq+a
 c3Hph9euf5XbVFSjoTDnWZdXp84ToST1q3CMvs1G/wthzfEUznDgt32zG w==;
X-CSE-ConnectionGUID: Bc6uYe24Q1axwAqz6lju6g==
X-CSE-MsgGUID: zmRHm4bBRAqJfuYF9TVn8g==
X-IronPort-AV: E=Sophos;i="6.15,308,1739833200"; d="scan'208";a="44249799"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 23 May 2025 08:40:51 +0200
X-CheckPoint: {68301873-11-C7E25413-F4312D34}
X-MAIL-CPID: 171ABC288E9D9E5597BFF0440F2CF286_4
X-Control-Analysis: str=0001.0A006368.68301888.007D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 92EEE160FB1; Fri, 23 May 2025 08:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1747982447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ba/0s2zFjBwwDkrqACm+IAKb2aRWgGWa14NBTiYnyo=;
 b=rkrx2fJytEk4czfUkL69PwevR4A+69LLk9RAnojbuVnur1H8md5HjciRHBAxlBC57y8/yb
 SwSq9e5VSiO4R4pFE3uSpPzKKY/8hAVECSPylZe6vtuEkobFTuhPRf2F44cgiBMR8bbuF5
 TybSU9hdrfqB88FyWMlCLu3JvSYWBaOXZvkHmWHW0t6FHP4X5oORRbiEMr1maz2cqxxShO
 +vhGcbfFvLjnqSSE2Wq48c0HcY/Ve4hc5jwyxqbdVizv3DhfHNDaNAsKIQyaZe64JfbMSk
 UV7yIFJ4D+LClXrZkzJ9d6a7jUtlhKy1X0duqw84UgvUTTx+xKTBONedBICCBw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/arm/malidp: Silence informational message
Date: Fri, 23 May 2025 08:40:41 +0200
Message-ID: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

When checking for unsupported expect an error is printed every time.
This spams the log for platforms where this is expected, e.g. ls1028a
having a Vivante (etnaviv) GPU and Mali display processor.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Every time glmark2-es2-wayland is started on a downstream kernel raises the error:
> [drm:malidp_format_mod_supported [mali_dp]] *ERROR* Unknown modifier (not Arm)

 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 34547edf1ee3c..87f2e5ee87907 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -159,7 +159,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 	}
 
 	if (!fourcc_mod_is_vendor(modifier, ARM)) {
-		DRM_ERROR("Unknown modifier (not Arm)\n");
+		DRM_DEBUG_KMS("Unknown modifier (not Arm)\n");
 		return false;
 	}
 
-- 
2.43.0

