Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C782A8C75F0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960C110ECAF;
	Thu, 16 May 2024 12:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="o30T7B+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35E510ECA5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:21:17 +0000 (UTC)
X-UUID: c7f6e1b4137e11ef8065b7b53f7091ad-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VqP1QYcwPvehQiDGLMDFdLD0RzGBPSpThiQEXQE7PE0=; 
 b=o30T7B+XUKzLGCdbOD6BMZgGwwJSwdnCTwSUMcGS8H8CUtRToMLEwXcYreHSvQcwOgu7BtAAMsoDAm6/zk1MyKprAJofa70n2rcn6UkLEHeVP6w0rblObGoIaOYrlL6/O4xxizJ0gOEt8s5lgKVmH+kcJjcqgeYoCyOeTaJ68ME=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:dd4448df-b1ff-4853-9177-1fa69dc3881c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:50537087-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c7f6e1b4137e11ef8065b7b53f7091ad-20240516
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1956522864; Thu, 16 May 2024 20:21:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 20:21:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 20:21:09 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,02/24] v4l2: handle restricted memory flags in queue setup
Date: Thu, 16 May 2024 20:20:40 +0800
Message-ID: <20240516122102.16379-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516122102.16379-1-yunfei.dong@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Validates the restricted memory flags when setting up a queue and
ensures the queue has the proper capability.

Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 21 +++++++++++++++++++
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 358f1fe42975..fe4c0594ab81 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -831,6 +831,15 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
 	return true;
 }
 
+static bool verify_restricted_mem_flags(struct vb2_queue *q, bool restricted_mem)
+{
+	if (restricted_mem != q->restricted_mem) {
+		dprintk(q, 1, "restricted memory model mismatch\n");
+		return false;
+	}
+	return true;
+}
+
 static int vb2_core_allocated_buffers_storage(struct vb2_queue *q)
 {
 	if (!q->bufs)
@@ -864,6 +873,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
+	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
 	unsigned int i, first_index;
 	int ret = 0;
 
@@ -907,6 +917,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 			return 0;
 	}
 
+	if (restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF))
+		return -EINVAL;
+
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
@@ -924,6 +937,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	if (ret)
 		return ret;
 	set_queue_coherency(q, non_coherent_mem);
+	q->restricted_mem = restricted_mem;
 
 	/*
 	 * Ask the driver how many buffers and planes per buffer it requires.
@@ -1032,6 +1046,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
 	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
 	bool no_previous_buffers = !q_num_bufs;
 	int ret = 0;
 
@@ -1040,6 +1055,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		return -ENOBUFS;
 	}
 
+	if (restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF))
+		return -EINVAL;
+
 	if (no_previous_buffers) {
 		if (q->waiting_in_dqbuf && *count) {
 			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
@@ -1058,6 +1076,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			return ret;
 		q->waiting_for_buffers = !q->is_output;
 		set_queue_coherency(q, non_coherent_mem);
+		q->restricted_mem = restricted_mem;
 	} else {
 		if (q->memory != memory) {
 			dprintk(q, 1, "memory model mismatch\n");
@@ -1065,6 +1084,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		}
 		if (!verify_coherency_flags(q, non_coherent_mem))
 			return -EINVAL;
+		if (!verify_restricted_mem_flags(q, restricted_mem))
+			return -EINVAL;
 	}
 
 	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 293f3d5f1c4e..9ee24e537e0c 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -682,7 +682,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
 		*flags = 0;
 	} else {
 		/* Clear all unknown flags. */
-		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
+		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;
 	}
 
 	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
@@ -698,6 +698,8 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 	if (q->supports_requests)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
+	if (q->allow_restricted_mem && q->io_modes & VB2_DMABUF)
+		*caps |= V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM;
 	if (max_num_bufs) {
 		*max_num_bufs = q->max_num_buffers;
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
-- 
2.25.1

