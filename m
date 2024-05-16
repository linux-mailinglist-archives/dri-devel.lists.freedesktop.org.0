Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164A8C75E9
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB5C10ECA7;
	Thu, 16 May 2024 12:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="oX1rFwxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F8A10ECA4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:21:15 +0000 (UTC)
X-UUID: c77b1160137e11efb92737409a0e9459-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FxoURd+7DdicAsZp6Obc64kWMKrH1ZdhW0yeI+412bo=; 
 b=oX1rFwxC6xYs8wBbLvjTJ/f/F1sKJxRZWQ22/yjqMQQWT5L6r6a715+QavxAVhYP3PrNR+J+nzJj9Nfk9lxIJlUF9imlOlzDc4wKxIJDLvtr4qBYEKhkGtWaWo2AfLFQasGE0lBCDokXBuAUxb0cBEZI6hz6ejOFn9kzhWSD3lM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:a40e379d-d61c-4694-8506-bcd342458ce5, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:881fd792-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c77b1160137e11efb92737409a0e9459-20240516
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 142435461; Thu, 16 May 2024 20:21:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 20:21:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 20:21:06 +0800
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
Subject: [PATCH v6,
 00/24] media: mediatek: add driver to support secure video decoder
Date: Thu, 16 May 2024 20:20:38 +0800
Message-ID: <20240516122102.16379-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.525400-8.000000
X-TMASE-MatchedRID: QITTs0Q4iULtzSKzUmDUVwI0yP/uoH+DHgnyJJNAX/hGL0g1nVmkYTjh
 cV1z6ih5WiaTAptjMRWkCf2vRV+wnagSz5LfW6gEtgGefYRQNetUNS+xp6iMXWsxtqQk3w552Fx
 nSUK+m7/6scB2izTfK0mdI2aa3IoLfjm4FmbDbT0zw5Ejs3g1loab/1O/b86BknxabN/DinjEBp
 jowVhUR9Gzq011f5lgCmjHXhV21s3GHadaRuAOv1z+axQLnAVBnp/1DQXYWrUR34ro7k23nYNaw
 NhHLl62sC7QIHAmtIQgnvrgPYqDApQxl2LaGeYA7spMO3HwKCAxXH/dlhvLv8NNczdXNJoiFKP4
 b2zaNX37+OrNHOBlyuv5q3xJofu6uafWgMhNYLlC4WIP7GtYLLqGBW9J0YqjCgNjqBgJU5MNMop
 f6MGUQFSwGvCl8Crex941uW1B9Op9wUnSp+FsXh+WEMjoO9WWfS0Ip2eEHnz3IzXlXlpamPoLR4
 +zsDTt+GYUedkXNWoXADxe84YEoo7Q0rMD985fLIwZeEGGR5d/AtGCJzTumc2YhbbKlG2xUnF/R
 Asu5gOkOBPc9OLr6KXB9+VMLv+Q7kVCNKrk7cvyNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmE
 MVvLtmcjFnImzvyS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.525400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 15170411066990259493C61E6FD2C86217DBACA2787740452B30594821C292B52000:8
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

The patch series used to enable secure video playback (SVP) on MediaTek
hardware in the Linux kernel.

Memory Definitions:
secure memory - Memory allocated in the TEE (Trusted Execution
Environment) which is inaccessible in the REE (Rich Execution
Environment, i.e. linux kernel/user space).
secure handle - Integer value which acts as reference to 'secure
memory'. Used in communication between TEE and REE to reference
'secure memory'.
secure buffer - 'secure memory' that is used to store decrypted,
compressed video or for other general purposes in the TEE.
secure surface - 'secure memory' that is used to store graphic buffers.

Memory Usage in SVP:
The overall flow of SVP starts with encrypted video coming in from an
outside source into the REE. The REE will then allocate a 'secure
buffer' and send the corresponding 'secure handle' along with the
encrypted, compressed video data to the TEE. The TEE will then decrypt
the video and store the result in the 'secure buffer'. The REE will
then allocate a 'secure surface'. The REE will pass the 'secure
handles' for both the 'secure buffer' and 'secure surface' into the
TEE for video decoding. The video decoder HW will then decode the
contents of the 'secure buffer' and place the result in the 'secure
surface'. The REE will then attach the 'secure surface' to the overlay
plane for rendering of the video.

Everything relating to ensuring security of the actual contents of the
'secure buffer' and 'secure surface' is out of scope for the REE and
is the responsibility of the TEE.

This patch series is consists of four parts. The first is from Jeffrey,
adding secure memory flag in v4l2 framework to support request secure
buffer.

The second and third parts are from John and T.J, adding some heap
interfaces, then our kernel users could allocate buffer from special
heap. The patch v1 is inside below dmabuf link.
https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@mediatek.com/
To avoid confusing, move them into vcodec patch set since we use the
new interfaces directly.

The last part is mediatek video decoder driver, adding tee interface and
decoder driver to support secure video playback.

This patch set depends on "dma-buf: heaps: Add restricted heap"[1]

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=853380
---
Changed in v6:
- fix review unreasonable logic for patch 2/3/23
- add to support vp9 for patch 24

Changed in v5:
- fix merge conflict when rebase to latest media stage for patch 1/2
- change allocate memory type to cma for patch 12
- add to support av1 for patch 23

Changed in v4:
- change the driver according to maintainer advice for patch 1/2/3/4
- replace secure with restricted for patch 1/2/3/4
- fix svp decoder error for patch 21
- add to support hevc for patch 22

Changed in v3:
- rewrite the cover-letter of this patch series
- disable irq for svp mode
- rebase the driver based on the latest media stage

Changed in v2:
- remove setting decoder mode and getting secure handle from decode
- add Jeffrey's patch
- add John and T.J's patch
- getting secure flag with request buffer
- fix some comments from patch v1
---
Jeffrey Kardatzke (4):
  v4l2: add restricted memory flags
  v4l2: handle restricted memory flags in queue setup
  v4l2: verify restricted dmabufs are used in restricted queue
  v4l: add documentation for restricted memory flag

John Stultz (2):
  dma-heap: Add proper kref handling on dma-buf heaps
  dma-heap: Provide accessors so that in-kernel drivers can allocate
    dmabufs from specific heaps

T.J. Mercier (1):
  dma-buf: heaps: Deduplicate docs and adopt common format

Xiaoyong Lu (1):
  media: mediatek: vcodec: support av1 svp decoder for mt8188

Yilong Zhou (1):
  media: mediatek: vcodec: support vp9 svp decoder for mt8188

Yunfei Dong (15):
  media: mediatek: vcodec: add tee client interface to communiate with
    optee-os
  media: mediatek: vcodec: allocate tee share memory
  media: mediatek: vcodec: send share memory data to optee
  media: mediatek: vcodec: initialize msg and vsi information
  media: mediatek: vcodec: add interface to allocate/free secure memory
  media: mediatek: vcodec: using shared memory as vsi address
  media: mediatek: vcodec: Add capture format to support one plane
    memory
  media: mediatek: vcodec: Add one plane format
  media: mediatek: vcodec: support one plane capture buffer
  media: mediatek: vcodec: re-construct h264 driver to support svp mode
  media: mediatek: vcodec: remove parse nal_info in kernel
  media: mediatek: vcodec: disable wait interrupt for svp mode
  media: mediatek: vcodec: support tee decoder
  media: mediatek: vcodec: move vdec init interface to setup callback
  media: mediatek: vcodec: support hevc svp for mt8188

 .../userspace-api/media/v4l/buffer.rst        |  10 +-
 .../media/v4l/pixfmt-reserved.rst             |   8 +
 drivers/dma-buf/dma-heap.c                    | 139 +++++--
 .../media/common/videobuf2/videobuf2-core.c   |  21 +
 .../common/videobuf2/videobuf2-dma-contig.c   |   8 +
 .../media/common/videobuf2/videobuf2-dma-sg.c |   8 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +-
 .../media/platform/mediatek/vcodec/Kconfig    |   1 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
 .../platform/mediatek/vcodec/decoder/Makefile |   1 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 150 ++++---
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   8 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   7 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  34 +-
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 383 ++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 156 +++++++
 .../vcodec/decoder/mtk_vcodec_dec_pm.c        |   6 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  35 +-
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |  97 +++--
 .../decoder/vdec/vdec_h264_req_common.c       |  18 +-
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 334 +++++++++------
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  89 ++--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  91 +++--
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |   4 +-
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  57 ++-
 .../mediatek/vcodec/decoder/vdec_vpu_if.h     |   4 +
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/linux/dma-heap.h                      |  29 +-
 include/media/videobuf2-core.h                |   8 +-
 include/uapi/linux/videodev2.h                |   3 +
 33 files changed, 1456 insertions(+), 394 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h

-- 
2.25.1

