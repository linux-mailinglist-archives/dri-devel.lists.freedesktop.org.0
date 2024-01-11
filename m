Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632D82A967
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA36610E80F;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 446E110E070;
 Thu, 11 Jan 2024 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=+fG4AXicLXIqBy2X4Q
 F4COIcQVewS78vBq1OfsVfqfI=; b=ToJ47kxQrvs2DSsZxlEHCZWqlm4FCaOt3S
 yPdjGkFEbjyHON3/6t6OSoDUlzwXp49oKzw4BvV1kMHCGstcR2peMIeSehL8RZGo
 zr8eV7MHx+M7TqibpVpJa5oUe7zbS8RZNm2cUYv3cHEEuiRbHFeTpI9i1wSYpju+
 FbFXLJKWU=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wDX_9rGX59llvsuAA--.18065S2;
 Thu, 11 Jan 2024 11:25:58 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amd/include/sienna_cichlid_ip_offset: Clean up errors in
 sienna_cichlid_ip_offset.h
Date: Thu, 11 Jan 2024 03:25:57 +0000
Message-Id: <20240111032557.7578-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDX_9rGX59llvsuAA--.18065S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KF47Kw1DGw4DArb_yoWfWFX_Ca
 yxtwn3GrW7ZFnrWF1xCFZrZ3y293WkuF1kXw1fta4SyrnrAw1ru3y5Jr47X3yruFn3KFZr
 XayrZFy5WrnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOgpixWVEuXtJ5QAAsY
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

ERROR: open brace '{' following struct go on the same line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h b/drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h
index b07bc2dd895d..054790470800 100644
--- a/drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/sienna_cichlid_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                         5
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 } __maybe_unused;
 
-- 
2.17.1

