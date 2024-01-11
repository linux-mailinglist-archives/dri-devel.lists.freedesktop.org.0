Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFFD82AAEC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F1C88D18;
	Thu, 11 Jan 2024 09:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92A6010E805;
 Thu, 11 Jan 2024 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=SKtrUrIGdRmsfBc9it
 8ZXLO8jM/D3LjDPZUsNHDws34=; b=aMENAKH1QAo+qZGdbNe6CU75Q2pnw6Y3zD
 a29K234H81vIu972ctzSRIXiIFT6a977M1SUPNxv0u/JyaAIfYnD8CUk+DwuP+bD
 aVtPxH8AvZPSyrvh20p9zYf7LZFN45DbmDJ5jrJz5xskE4J1CUkFJXNWwYsCJjs7
 SrtKW6rYM=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3X6VItZ9lwjsoAA--.52777S2;
 Thu, 11 Jan 2024 17:30:48 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in clearstate_cayman.h
Date: Thu, 11 Jan 2024 09:30:39 +0000
Message-Id: <20240111093039.13914-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X6VItZ9lwjsoAA--.52777S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxCFWUWw43uryfZF17GFg_yoW8Xr1fpF
 4DWrn5Cw4rGa15XryxJr1DGryfGa92vFyIyrWDKw1fCw1kArZ7Was8JayxAryUtr97tr17
 tFykZry2qa18Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRRbyNUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAtixWVLZWlXQgAAsD
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
Cc: XueBing Chen <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/clearstate_cayman.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/clearstate_cayman.h b/drivers/gpu/drm/radeon/clearstate_cayman.h
index 4774e04c4da6..7693fb6624a3 100644
--- a/drivers/gpu/drm/radeon/clearstate_cayman.h
+++ b/drivers/gpu/drm/radeon/clearstate_cayman.h
@@ -23,8 +23,7 @@
 
 #include "clearstate_defs.h"
 
-static const u32 SECT_CONTEXT_def_1[] =
-{
+static const u32 SECT_CONTEXT_def_1[] = {
     0x00000000, // DB_RENDER_CONTROL
     0x00000000, // DB_COUNT_CONTROL
     0x00000000, // DB_DEPTH_VIEW
@@ -514,8 +513,7 @@ static const u32 SECT_CONTEXT_def_1[] =
     0x00000000, // CB_BLEND6_CONTROL
     0x00000000, // CB_BLEND7_CONTROL
 };
-static const u32 SECT_CONTEXT_def_2[] =
-{
+static const u32 SECT_CONTEXT_def_2[] = {
     0x00000000, // PA_CL_POINT_X_RAD
     0x00000000, // PA_CL_POINT_Y_RAD
     0x00000000, // PA_CL_POINT_SIZE
@@ -523,8 +521,7 @@ static const u32 SECT_CONTEXT_def_2[] =
     0x00000000, // VGT_DMA_BASE_HI
     0x00000000, // VGT_DMA_BASE
 };
-static const u32 SECT_CONTEXT_def_3[] =
-{
+static const u32 SECT_CONTEXT_def_3[] = {
     0x00000000, // DB_DEPTH_CONTROL
     0x00000000, // DB_EQAA
     0x00000000, // CB_COLOR_CONTROL
-- 
2.17.1

