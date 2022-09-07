Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129705B02CC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC3E10E5A4;
	Wed,  7 Sep 2022 11:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116510E5A4;
 Wed,  7 Sep 2022 11:22:24 +0000 (UTC)
X-QQ-mid: bizesmtp75t1662549737tb47k330
Received: from localhost.localdomain ( [182.148.14.0])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 07 Sep 2022 19:22:15 +0800 (CST)
X-QQ-SSF: 01000000002000D0F000B00A0000000
X-QQ-FEAT: KdN0SWBFoH7UMzyW8EPeWYXI1PlM16NaqZ033qT+4v1Jdp8YqqCiqA3S37Erx
 AxZ2ilvPBERPpuKozNZ1XlnVLL8CQQasmmgGUhWxj4iuoe7S2PlO3l9isDwSszp0nsCYW5s
 qlnpciI3oGhFuLOcWUNDk68XFHSGDsXzoVyALFEHkuiK27SpxYD0/2Ro9nbab+50szLecvT
 7e/wt/6cdRIp24Mgb3Nd/+N344/J1Nyw+NICUQDf0MmHRxFmWFPuX/epI9K/pimdsxx7VIB
 0wu//vt2d+2Ngi/ORDpYjTyvArHrMoGj+FL0QvlKE4AlJ8+dQebNyQk8Ej8fbFNlZlQY8aO
 evQcySOMceBeKalikhEx6Azr1n5a/aumj9YZZrJlx7/NTMV7urnjESzs4tlXg==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdkfd: fix repeated words in comments
Date: Wed,  7 Sep 2022 19:22:09 +0800
Message-Id: <20220907112209.22879-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Delete the redundant word 'to'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 24b414cff3ec..cd5f8b219bf9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -2284,7 +2284,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 
 	/* Fill in Subtype: IO_LINKS
 	 *  Only direct links are added here which is Link from GPU to
-	 *  to its NUMA node. Indirect links are added by userspace.
+	 *  its NUMA node. Indirect links are added by userspace.
 	 */
 	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
 		cache_mem_filled);
-- 
2.36.1

