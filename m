Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201008A2A64
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAACB10F368;
	Fri, 12 Apr 2024 09:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ujsn0eY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5210F28C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:09:06 +0000 (UTC)
X-UUID: 4e9c9c42f8ac11eeb8927bc1f75efef4-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=khLeNmeFr4dEE7zUUulOnX9v44u9sQtomfWBa91taAk=; 
 b=Ujsn0eY83HUTvWXWgwbuHFV12eTFG59Vyjqy9eJTo0cWmxIKF2X5VlrZIcWfppOOV66lzyzFsQumJb4AdG2K9WcgcnmMfe5yc8fRkWxsBSqq+2lCCyth1/5Uo80QvsfrQ5txnNbVCvxZv/EGhG2Hs46k1TVQ4jkgA5HjxLFnELQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:9e3c438b-6b14-4c2e-9898-eca7b0b96211, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:20408091-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4e9c9c42f8ac11eeb8927bc1f75efef4-20240412
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 40800353; Fri, 12 Apr 2024 17:09:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:08:59 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 "Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,04/23] v4l: add documentation for restricted memory flag
Date: Fri, 12 Apr 2024 17:08:32 +0800
Message-ID: <20240412090851.24999-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.051000-8.000000
X-TMASE-MatchedRID: QL+jDTIbnJ8LImHVm5AelymjEOrcO6AyTJDl9FKHbrkGxREerP+37XVX
 4shSYpPIU5vypzAbVDHVv08+TJnoOz5RuU5LdcresgYw1+LBrk1D3kXYiJVSRHXDIkXAltiwo8W
 MkQWv6iXBcIE78YqRWo6HM5rqDwqt0665cBZqmv9WTaozwvRatithsKIE2Il2f+7rfOJbz4f7GK
 jDoopvq10xL6zkd6Digk9AEdlxs5azFz6j2+UpZYwAN2uiT6+64sOrsb4iT/K/bbEolHIgZUOc7
 GjOamnWv5a9cmIodEs3UeAnV+tV65RMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.051000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1A9376DACE1A482320D81B544C05D506A5E08BCEB3D040B61916C77BEE04C8112000:8
X-MTK: N
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

From: Jeffrey Kardatzke <jkardatzke@google.com>

Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 52bbee81c080..807e43bfed2b 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -696,7 +696,7 @@ enum v4l2_memory
 
 .. _memory-flags:
 
-Memory Consistency Flags
+Memory Flags
 ------------------------
 
 .. raw:: latex
@@ -728,6 +728,14 @@ Memory Consistency Flags
 	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
 	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
 	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
+    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
+
+      - ``V4L2_MEMORY_FLAG_RESTRICTED``
+      - 0x00000002
+      - The queued buffers are expected to be in restricted memory. If not, an
+	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
+	Typically restricted buffers are allocated using a restricted dma-heap. This flag
+	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.
 
 .. raw:: latex
 
-- 
2.18.0

