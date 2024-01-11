Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC582A992
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B2C10E854;
	Thu, 11 Jan 2024 08:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA34810E070;
 Thu, 11 Jan 2024 02:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=6XnZjv2AWPiI5dqzax
 Rd+P/BdNiXsS2TWUib8qNZYKo=; b=iBgjqxt4vjbfmHHDs60si/oISpoy7ig8nT
 LTK3ltXA48wnW8Dfpbju1D9ZlHi6q3+y9JA7wVMbIHRZDJ9hVEfU1mH3MSmd1kOQ
 t72tNk3nr6O7uRAIWUHmJ7tx21VrbISJjXZdpfV3GqZO85BDGMh+9t0VPDEVgoqk
 D09sQzXRE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDnD9uXWJ9lwy+dAA--.10032S2;
 Thu, 11 Jan 2024 10:55:19 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: Xinhui.Pan@amd.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com
Subject: [PATCH] drm/amd/include: Clean up errors in arct_ip_offset.h
Date: Thu, 11 Jan 2024 02:55:17 +0000
Message-Id: <20240111025517.6687-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnD9uXWJ9lwy+dAA--.10032S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1DCF48Kry8Zr1xWw4rKrg_yoWfJrc_Ca
 4xJ395W3y7uFnFqF1akFn3u34j9a1ruFnYqw1fta4rtrZFkr4UW395Jr42qr4ruFs3CFsr
 Z3WkXFW5ZrnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUj2NtUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGA5ixWVLZWL-aQADsN
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
 drivers/gpu/drm/amd/include/arct_ip_offset.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/arct_ip_offset.h b/drivers/gpu/drm/amd/include/arct_ip_offset.h
index af1c46991429..7dd876f7df74 100644
--- a/drivers/gpu/drm/amd/include/arct_ip_offset.h
+++ b/drivers/gpu/drm/amd/include/arct_ip_offset.h
@@ -25,13 +25,11 @@
 #define MAX_SEGMENT                                         6
 
 
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

