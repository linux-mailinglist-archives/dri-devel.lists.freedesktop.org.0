Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628883FE58
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 07:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D81124B2;
	Mon, 29 Jan 2024 06:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047EB11235D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 06:30:51 +0000 (UTC)
X-UUID: eb750f12be6f11eea2298b7352fd921d-20240129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=C/OGro1janqRONvnMFT1FiQzIRsc4A6uoqFDFkQusCM=; 
 b=hBsQf5DgyzkR4GtSZmW/mKcNoMDMroG/bdHLouJVSbcD4YsDYAp/aII1WNjJx/Vlhp0yhAMn4/GDUAjli8zBrSJxzgrX06f/U7nkkMgrNkoqv1IZZQtP3JqVmVNokR3tZkPbZIZghsfQY5ny9/Y89nNRHZZh9PmEPTMbtNXDRh0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36, REQID:6ff4e0bf-4fde-4d88-8151-4790df6d0d57, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6e16cf4, CLOUDID:56b5c38e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: eb750f12be6f11eea2298b7352fd921d-20240129
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1332636231; Mon, 29 Jan 2024 14:30:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:34 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v4,00/22] media: add driver to support secure video decoder
Date: Mon, 29 Jan 2024 14:30:03 +0800
Message-ID: <20240129063025.29251-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.251900-8.000000
X-TMASE-MatchedRID: uedTeJZqUh/tzSKzUmDUVwI0yP/uoH+DHgnyJJNAX/hGL0g1nVmkYTjh
 cV1z6ih5WiaTAptjMRWkCf2vRV+wnagSz5LfW6gEtgGefYRQNetUNS+xp6iMXWsxtqQk3w552Fx
 nSUK+m7/6scB2izTfK0mdI2aa3IoLfjm4FmbDbT0zw5Ejs3g1loab/1O/b86BknxabN/DinjEBp
 jowVhUR9Gzq011f5lgCmjHXhV21s3GHadaRuAOv8AmcZEx8XHJSz8yxOq7x340QmmUihPzrJasf
 A8Y/RCFMpLTlBvu1zO61NiYskObR/m9WstcRwZxnW/laudJFeEW40XiUkbrGznKpbGL4ChVbbB5
 gILr2S8eZVk5Ikjfw0GaeX/AzQEVDEVT5M0HH4Vn+WBSNyyzIVY5BBJri9sd31GU/N5W5BCVyZ5
 Pyy3fJ75fIMEc1N7loFW8SPM0GkIfE8yM4pjsDwtuKBGekqUpm+MB6kaZ2g6tMGYd48rTPPYEPD
 9dmjTkmSUnf7mUR4UfQ6PbsE+WaMScto1ePGW50008tz//eRRjO+xjVjmqjgXksIPwfWR5tlbo2
 UhhjlfyNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtmcjFnImzvyS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.251900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0E92D4020EBEC5579E735F6FF6A8B7CC3B62D31C5AEFBDFC2718420F12E457F42000:8
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org, "T
 . J . Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
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

The last part is mediaTek video decoder driver, adding tee interface to
support secure video decoder.

---
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
 .../decoder/vdec/vdec_h264_req_common.c       |  18 +-
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 334 +++++++++------
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  89 ++--
 .../mediatek/vcodec/decoder/vdec_drv_if.c     |   4 +-
 .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  57 ++-
 .../mediatek/vcodec/decoder/vdec_vpu_if.h     |   4 +
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/linux/dma-heap.h                      |  29 +-
 include/media/videobuf2-core.h                |   8 +-
 include/uapi/linux/videodev2.h                |   3 +
 31 files changed, 1334 insertions(+), 328 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h

-- 
2.18.0

