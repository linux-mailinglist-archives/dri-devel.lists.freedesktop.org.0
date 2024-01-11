Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1082A968
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5510E803;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id C752B10E08C;
 Thu, 11 Jan 2024 03:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=aEcTpox9RCNPCYEUFL
 +GBRnJlzPshU0S0hi+Stnhftw=; b=oPMlqLtj7agSMf7fa0r31pi6jl/aXLB5Ck
 hpebhpy44Zoztsi+AQMhp/1vLYJskOzkiOeq/jXvg88TYnJ5JdbTkV950cCPXqg3
 DbOK0d9NSSit7uXGZFVK/1HzN42LX/rBv50LGSrX5QZZOocUQQpHT8qknzQjH3pA
 btyRsiemc=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3H9usYp9lhT8vAA--.20674S2;
 Thu, 11 Jan 2024 11:38:20 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amd/amdgpu: Clean up errors in beige_goby_ip_offset.h
Date: Thu, 11 Jan 2024 03:38:18 +0000
Message-Id: <20240111033818.7968-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3H9usYp9lhT8vAA--.20674S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF13Kr4kWFWxWFg_yoWfJrX_Ca
 srGwn3GrWxZFs3XFyakFn3u34S93WF9F1kWw1SgFyrtr9ruF18W3yUJr4xXr4ruF9xCFsr
 A3WkXFy5XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHAtixWV2zz-88wAAsc
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
Cc: chenxuebing <chenxb_99091@126.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/beige_goby_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/beige_goby_ip_offset.h b/drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
index 26044cb285d2..48542ea6882a 100644
--- a/drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/beige_goby_ip_offset.h
@@ -26,13 +26,11 @@
 #define MAX_SEGMENT                                         6
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 };
 
-- 
2.17.1

