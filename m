Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700782A980
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B57910E839;
	Thu, 11 Jan 2024 08:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4D10E08C;
 Thu, 11 Jan 2024 03:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=En1CBR0kBxa9quIwfp
 /NIa2YsneYuX52TYhnjn5Zx/c=; b=pxEA2lEBZijLftPdfXwtP3vOjvN2IXaO8c
 FWlVJ81D6ptczWK5Ecs8a4pfMgzBdi2c6XRxUDFiJD0zXg0q2Y3iGU3iBTcpV2Wo
 qY89z6+TezDtesKBKDG0yYvrucHgLCBKAVC/shFGeM7+4BSja48SxeptdwhVTAA0
 2W7/0VVEQ=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wD3f6f7YZ9l2LwgAA--.42672S2;
 Thu, 11 Jan 2024 11:35:23 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: daniel@ffwll.ch, alexander.deucher@amd.com, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amd/include/navi14_ip_offset: Clean up errors in
 navi14_ip_offset.h
Date: Thu, 11 Jan 2024 03:35:22 +0000
Message-Id: <20240111033522.7791-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3f6f7YZ9l2LwgAA--.42672S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48KrW7JryUCrWruFg_yoW3KFX_Ca
 4xJ3s3WayxuFnFvFnFkFZ7Z34Ik3W09Fn3Xw1ftFy5trnrAr18W3y5Jrs7XrWruFnF9FZr
 Z3WrXFy5ZrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiHARixWV2zz-RdwABs7
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
 drivers/gpu/drm/amd/include/navi14_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/navi14_ip_offset.h b/drivers/gpu/drm/amd/include/navi14_ip_offset.h
index c39ef651adc6..508011288dea 100644
--- a/drivers/gpu/drm/amd/include/navi14_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/navi14_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                        5
 
 
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

