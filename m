Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFA58A2A5F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8A310F194;
	Fri, 12 Apr 2024 09:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QxHFHHBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948E810EE64
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:09:01 +0000 (UTC)
X-UUID: 4c633864f8ac11ee935d6952f98a51a9-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v/IBSzocl3Yiga2cPy9L+5G1aprSvwxrWeSsTo8+72s=; 
 b=QxHFHHBxrrrIhfYAmho66afAurzuI+xQt3rV1T1v54WfeyX7PR7UA1A1Y9Ihm+MgGg3ikkAsPMcJpe6YXz9tXo+N28mW6qIHTOvsGB5KcpoxfKukyci2mxmEayUOy+zxHkBAh1xkLjpv4PaaNVswX3yfhEOO8l4i2qVr3ZdUOs0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:41bdc4d5-fb1f-46cd-a0c0-8fdca68542f2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:10e4d5fa-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4c633864f8ac11ee935d6952f98a51a9-20240412
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 375629115; Fri, 12 Apr 2024 17:08:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:08:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:08:56 +0800
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
Subject: [PATCH v5,02/23] v4l2: handle restricted memory flags in queue setup
Date: Fri, 12 Apr 2024 17:08:30 +0800
Message-ID: <20240412090851.24999-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.317900-8.000000
X-TMASE-MatchedRID: D0Pm2dEMlxOWHmpvkeKJB57tR0mnRAg1TJDl9FKHbrk1LB46LFAAkq/H
 ZLCMsEf9UVB7I/2CDSABbn1cvMDZHaEAqPOtlpvtjtK7dC6UBnni00wyvVXZxXFH8OB0gvDr95r
 i4fhj2G9xttE7/wo1AsmkHeNGy+ZUBEKiKihS7U5+7IhLVmN+u0GtrAxy5ENOf9MKmZKnOiVJwa
 hvtZ99jMfhzwiCcm5egDLqnrRlXrZ8nn9tnqel2LI7zVffJqTzDlqvFt3mQn4SqF8eiSCiqSALY
 Wkum7ugjM2uhuY/9X+aHrNAFYL8eX7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.317900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D5C6C5BB917ED96256855338E5447C68C51A2FD9CD7EFC9F872F4CFDBDF51CDA2000:8
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
index 0b2b48e1b2df..bd951ca5f5b5 100644
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
 
+	if (restricted_mem && (!q->allow_restricted_mem || memory != V4L2_MEMORY_DMABUF))
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
 
+	if (restricted_mem && (!q->allow_restricted_mem || memory != V4L2_MEMORY_DMABUF))
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
2.18.0

