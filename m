Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7D82A96E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084710E82D;
	Thu, 11 Jan 2024 08:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id B08E310E070;
 Thu, 11 Jan 2024 02:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=IXEHNXRuUcKt6IyGJd
 ZD0CF1X7wE5BQBAI9i8Netnf8=; b=nbG+wwG9elFeqSBa8+vCi5EROJYYOh5gfc
 +5DRlJSzTNnyM7xEei0IzN2FIGYeaVw09mGO5KKfrmNsfIDqjkT966u9yWf9U6Id
 TQro4ck9N++4njxitGozKN3DtBPAuicSoMsEKXfVHa6gHtGiuDYFhTqfQf8HTcTF
 NAF+p21fE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3v4WAT59lAXGcAA--.59409S2;
 Thu, 11 Jan 2024 10:16:33 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_drv.c
Date: Thu, 11 Jan 2024 02:16:31 +0000
Message-Id: <20240111021631.5974-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3v4WAT59lAXGcAA--.59409S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ury8Gw48Zw1rKr4DtF4DXFb_yoW8Jw1fpa
 1rWrn3tryUZF1UtrWDZas7WF90qa48XFyxGw1DZ347Xan8JF95Wa4rt3Z5WF9rWF4fCayx
 tF97J3y3u3Wa9FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjtC7UUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHAJixWV2zz5jswAAsL
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: do not initialise globals to 0

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 880137774b4e..86d829055418 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -592,7 +592,7 @@ module_param_named(timeout_period, amdgpu_watchdog_timer.period, uint, 0644);
 #ifdef CONFIG_DRM_AMDGPU_SI
 
 #if IS_ENABLED(CONFIG_DRM_RADEON) || IS_ENABLED(CONFIG_DRM_RADEON_MODULE)
-int amdgpu_si_support = 0;
+int amdgpu_si_support;
 MODULE_PARM_DESC(si_support, "SI support (1 = enabled, 0 = disabled (default))");
 #else
 int amdgpu_si_support = 1;
@@ -611,7 +611,7 @@ module_param_named(si_support, amdgpu_si_support, int, 0444);
 #ifdef CONFIG_DRM_AMDGPU_CIK
 
 #if IS_ENABLED(CONFIG_DRM_RADEON) || IS_ENABLED(CONFIG_DRM_RADEON_MODULE)
-int amdgpu_cik_support = 0;
+int amdgpu_cik_support;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled (default))");
 #else
 int amdgpu_cik_support = 1;
-- 
2.17.1

