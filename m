Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD1C937F6A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9E10E18C;
	Sat, 20 Jul 2024 07:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UzUCGDVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4868F10E18C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:16 +0000 (UTC)
X-UUID: f1506bb8466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EdAs1weRfnXAf3MugcpLFugaC1pT5jW7JMNcKSNeugk=; 
 b=UzUCGDVoDCKd95FC6xcDxTJX2kw3VVTNgH+OjVc9x4AevPahQO1cHWydEM2y7iLdwUELHI3wSUHBK/Uit9QSTNPWk6YjqOeBw/sQF5A0Z8bo1yIZo+oBm24hDvZMhnGN3F2X3yosL0+OvL1OlsjY1DVswGhC99x6GQ1Y1e85a50=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:c7b8d443-cc2c-4ae3-8e4c-035dd99d101c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:77c9ad0d-46b0-425a-97d3-4623fe284021,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: f1506bb8466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 196629985; Sat, 20 Jul 2024 15:16:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:07 +0800
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
Subject: [PATCH v7 00/28] media: mediatek: add driver to support secure video
 decoder
Date: Sat, 20 Jul 2024 15:15:38 +0800
Message-ID: <20240720071606.27930-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.923600-8.000000
X-TMASE-MatchedRID: UCRb5awSya3tzSKzUmDUVwI0yP/uoH+DHgnyJJNAX/hGL0g1nVmkYTjh
 cV1z6ih5WiaTAptjMRWkCf2vRV+wnagSz5LfW6gEtgGefYRQNetUNS+xp6iMXWsxtqQk3w552Fx
 nSUK+m7/6scB2izTfK0mdI2aa3IoLfjm4FmbDbT0zw5Ejs3g1loab/1O/b86BknxabN/DinjEBp
 jowVhUR9Gzq011f5lgCmjHXhV21s3GHadaRuAOv1z+axQLnAVBnp/1DQXYWrUR34ro7k23nYNaw
 NhHLl62M4Cy4e3S8WLRulxaGH1cMyZywmJvYiNpwCZxkTHxccl51GakW92m5gnnMzd3ORpB2VC1
 QWKKKPphZzqJazAr2ev5q3xJofu6uafWgMhNYLkMH4SsGvRsAyKRTjFAWBvu6PPBanTHTInv8kZ
 Fnw+AJ/VsyTtlUxkI4rz9nnOxxGUBOHW58ozCWgPZZctd3P4BVX7TxgU0dK74JkeQZhmPNV2kxK
 IqW9ov4vM1YF6AJbbCCfuIMF6xLcK21zBg2KlfrXT/QMyU2NwZhhkXJLJyemxvnWgm/4wDXmxfe
 npNxnHCR4PmRCAjVsfoSk5yMK1aT8omgjK7aRYzL9YEHFyRwUdR2mhSiz4SRC4FP+bFQP+jJ0yU
 SNFyJ318FBJtaLg8yw2MRQtf+64wgUA8tQSUnMC+ksT6a9fy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.923600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 49B51B8754C4E41DDC0D865904996A3C04FCCE0CAD1A9508D689F44F7DB119382000:8
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
Changed in v7:
- fix many reviewer's comments
- build optee driver to ko
- support h264 svp and non svp vsi

Changed in v6:
- fix unreasonable logic for patch 2/3/23
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
Jeffrey Kardatzke (2):
  v4l2: add restricted memory flags
  v4l2: handle restricted memory flags in queue setup

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

Yunfei Dong (21):
  media: videobuf2: calculate restricted memory size
  media: mediatek: vcodec: add tee client interface to communiate with
    optee-os
  media: mediatek: vcodec: build decoder OPTEE driver as module
  media: mediatek: vcodec: allocate tee share memory
  media: mediatek: vcodec: send share memory data to optee
  media: mediatek: vcodec: initialize msg and vsi information
  media: mediatek: vcodec: add interface to allocate/free secure memory
  media: mediatek: vcodec: using shared memory as vsi address
  media: mediatek: vcodec: add single allocation format
  media: mediatek: vcodec: support single allocation format
  media: mediatek: vcodec: support single allocation buffer
  media: mediatek: vcodec: re-construct h264 driver to support svp mode
  media: mediatek: vcodec: remove parse nal_info in kernel
  media: mediatek: vcodec: disable wait interrupt for svp mode
  media: mediatek: vcodec: support tee decoder
  media: mediatek: vcodec: move vdec init interface to setup callback
  media: mediatek: vcodec: support hevc svp for mt8188
  media: mediatek: vcodec: remove vsi data from common interface
  media: mediatek: vcodec: rename vsi to extend vsi
  media: mediatek: vcodec: adding non extend struct
  media: mediatek: vcodec: support extend h264 driver

 .../userspace-api/media/v4l/buffer.rst        |  10 +-
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 .../media/v4l/vidioc-reqbufs.rst              |   6 +
 drivers/dma-buf/dma-heap.c                    | 139 ++++-
 .../media/common/videobuf2/videobuf2-core.c   |  29 +
 .../common/videobuf2/videobuf2-dma-contig.c   |  34 +-
 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +-
 .../media/platform/mediatek/vcodec/Kconfig    |  13 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 117 +++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   8 +-
 .../platform/mediatek/vcodec/decoder/Makefile |   4 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 152 +++--
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   8 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  11 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  34 +-
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 391 +++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 198 +++++++
 .../vcodec/decoder/mtk_vcodec_dec_pm.c        |   6 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  35 +-
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 104 ++--
 .../decoder/vdec/vdec_h264_req_common.c       |  18 +-
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 536 +++++++++++++++++-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  88 +--
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 101 ++--
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |   4 +-
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  51 +-
 .../mediatek/vcodec/decoder/vdec_vpu_if.h     |   4 +
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/linux/dma-heap.h                      |  29 +-
 include/media/videobuf2-core.h                |   8 +-
 include/uapi/linux/videodev2.h                |   3 +
 33 files changed, 1868 insertions(+), 296 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h

-- 
2.18.0

