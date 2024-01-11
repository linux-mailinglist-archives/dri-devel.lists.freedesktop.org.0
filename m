Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E682A963
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035410E814;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0103610E18A;
 Thu, 11 Jan 2024 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=GbOAo++7oysYIAnWef
 V3Jn+5qb8czDoPosnXjp6SIEM=; b=QfemAd+L8FqnQ1bjDeYAB6DSoS8SBadTeh
 cHqOcyBHhilHX/unh86Au+adIkLgmXDSwOKuBYGX5aTsnNHYyxunsgouiCaTzAgl
 o+mJUx8eq9REF7XsxURVnvLQZOFwbN3hHQXjSALI9U2+UzeS8oI1qCrdxxBQ/gFa
 3FVfpj7gI=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD331Q2op9lFNkQAA--.1687S2; 
 Thu, 11 Jan 2024 16:09:27 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, airlied@gmail.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/dpm: Clean up errors in trinity_dpm.h
Date: Thu, 11 Jan 2024 08:09:23 +0000
Message-Id: <20240111080923.11317-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD331Q2op9lFNkQAA--.1687S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kXF13tr13WFyDWFWDtwb_yoWxKFg_C3
 4UX3yDXrW2kFn5uF18AFsxAryIva1FvF48Cr1ft348Jry2vr1fuayv9r9rXayUGFn3ZFn8
 Aa1kXrs3ZFsrXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUtC7UUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBti1mVOBk9XvwAAs1
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/trinity_dpm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/trinity_dpm.h b/drivers/gpu/drm/radeon/trinity_dpm.h
index c261657750ca..431e2b68d21e 100644
--- a/drivers/gpu/drm/radeon/trinity_dpm.h
+++ b/drivers/gpu/drm/radeon/trinity_dpm.h
@@ -64,8 +64,7 @@ struct trinity_ps {
 
 #define TRINITY_NUM_NBPSTATES   4
 
-struct trinity_uvd_clock_table_entry
-{
+struct trinity_uvd_clock_table_entry {
 	u32 vclk;
 	u32 dclk;
 	u8 vclk_did;
-- 
2.17.1

