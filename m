Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03E82A95E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C3410E7FE;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1C10E085;
 Thu, 11 Jan 2024 03:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=+2DGeQL1MVpOSJxUNH
 cxtwdXajYv/cXBWYf6yhOsiEo=; b=oK1I6Jy597rgzqAc9BeAm5JlYjgD7Z74Hh
 cwf3qe6U+CLWKfFAqqelhc7L/7dIqB7bCwOy6Vwsglr/zbnGTrvkHi9Q9Quco8gr
 hfnr2ejQG3sDCYPi3eF+dHHT18KbApx8WOtbHBNHrBj+GRXbLtFOa2RxgP537jQ9
 Lw+l5CIlE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3X4VtXJ9lba+dAA--.60099S2;
 Thu, 11 Jan 2024 11:11:41 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH] drm/amd: Clean up errors in vega10_ip_offset.h
Date: Thu, 11 Jan 2024 03:11:39 +0000
Message-Id: <20240111031139.7135-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X4VtXJ9lba+dAA--.60099S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48Kr4kJw1Dtr48Crg_yoWfCrc_Ca
 4xXr4fGry7uFnFqF1IyFsrA3yjk3W8ZFn7Ww1ftF13JrsrGr18Way5Grs7XrWrur9IgFsr
 Aan5XFW5XrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRK9atUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGBJixWVLZWPjuAAAse
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
 drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h b/drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h
index ce79e5de8ce3..1a73296a9a74 100644
--- a/drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/cyan_skillfish_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                        5
 
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 } __maybe_unused;
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 } __maybe_unused;
 
-- 
2.17.1

