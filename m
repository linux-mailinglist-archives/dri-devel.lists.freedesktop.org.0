Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C29C6EEF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4D510E338;
	Wed, 13 Nov 2024 12:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="f2CuR81N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D2910E338
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 12:21:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731500460; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YU32egpaxQ3LPMkiCEiwlYinPgTJcYopTk+puFDwuHW/9RO5p79wjM2Ui4SYu+wL/frHuZzuy8fUUQTuKVqqr0T0NMV/4+9fM7PJU9cqkYbDQ6Gq107WiMmUYHcuOuX8UKmuuA16yr0+peWn38u9D2nDz6YNXKAJ+ZJ7WY8pYqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731500460;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YAXiNxl+L7WvMZzLtoh1AuLuo/AJ/EmyL8yk+YhQn7E=; 
 b=Z+/3iUD44BYjzAGUq1cHO2bPj4wbjXN+ayl1Ka83L0+w1xcfYti/g3ZFtC2uZ4mtChZTn2nwlwi+DvPH2yfq9ezukDbOMZrolxlGcZ8mmfaBdeihUssIFVoz4iAz8trakaEKK0Fp/Th+ulWtxq/OnFN2UcGPl3JXDgO03ORpffc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
 dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731500460; 
 s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=YAXiNxl+L7WvMZzLtoh1AuLuo/AJ/EmyL8yk+YhQn7E=;
 b=f2CuR81N5f/eoPkL/+BDc6R275zeJ5SoF4H0cw9lo8TS+M/VEfcid4otwyE/SIj4
 TbuBF/mb2W5vpti7JxV6wbckZ3lQNM1JlQER4u9BpJT2NKBkm5CPoLyH7wDWMVnR8OX
 FZ7TlWHYFnUhP4hgflIVi4h5U8IU5DiK5qae+G2I=
Received: by mx.zohomail.com with SMTPS id 1731500458968391.5228104021975;
 Wed, 13 Nov 2024 04:20:58 -0800 (PST)
Date: Wed, 13 Nov 2024 13:20:51 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 00/28] media: mediatek: add driver to support secure
 video decoder
Message-ID: <20241113122051.u3iq3ci7iwrvt3mx@basti-XPS-13-9310>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
X-ZohoMailClient: External
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

Hey Yunfei,

On 20.07.2024 15:15, Yunfei Dong wrote:
>The patch series used to enable secure video playback (SVP) on MediaTek
>hardware in the Linux kernel.

I will set this series as obsolete for now, please answer the open
questions on your patches and then send a new series.

Regards,
Sebastian

>
>Memory Definitions:
>secure memory - Memory allocated in the TEE (Trusted Execution
>Environment) which is inaccessible in the REE (Rich Execution
>Environment, i.e. linux kernel/user space).
>secure handle - Integer value which acts as reference to 'secure
>memory'. Used in communication between TEE and REE to reference
>'secure memory'.
>secure buffer - 'secure memory' that is used to store decrypted,
>compressed video or for other general purposes in the TEE.
>secure surface - 'secure memory' that is used to store graphic buffers.
>
>Memory Usage in SVP:
>The overall flow of SVP starts with encrypted video coming in from an
>outside source into the REE. The REE will then allocate a 'secure
>buffer' and send the corresponding 'secure handle' along with the
>encrypted, compressed video data to the TEE. The TEE will then decrypt
>the video and store the result in the 'secure buffer'. The REE will
>then allocate a 'secure surface'. The REE will pass the 'secure
>handles' for both the 'secure buffer' and 'secure surface' into the
>TEE for video decoding. The video decoder HW will then decode the
>contents of the 'secure buffer' and place the result in the 'secure
>surface'. The REE will then attach the 'secure surface' to the overlay
>plane for rendering of the video.
>
>Everything relating to ensuring security of the actual contents of the
>'secure buffer' and 'secure surface' is out of scope for the REE and
>is the responsibility of the TEE.
>
>This patch series is consists of four parts. The first is from Jeffrey,
>adding secure memory flag in v4l2 framework to support request secure
>buffer.
>
>The second and third parts are from John and T.J, adding some heap
>interfaces, then our kernel users could allocate buffer from special
>heap. The patch v1 is inside below dmabuf link.
>https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@mediatek.com/
>To avoid confusing, move them into vcodec patch set since we use the
>new interfaces directly.
>
>The last part is mediatek video decoder driver, adding tee interface and
>decoder driver to support secure video playback.
>
>This patch set depends on "dma-buf: heaps: Add restricted heap"[1]
>
>[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=853380
>---
>Changed in v7:
>- fix many reviewer's comments
>- build optee driver to ko
>- support h264 svp and non svp vsi
>
>Changed in v6:
>- fix unreasonable logic for patch 2/3/23
>- add to support vp9 for patch 24
>
>Changed in v5:
>- fix merge conflict when rebase to latest media stage for patch 1/2
>- change allocate memory type to cma for patch 12
>- add to support av1 for patch 23
>
>Changed in v4:
>- change the driver according to maintainer advice for patch 1/2/3/4
>- replace secure with restricted for patch 1/2/3/4
>- fix svp decoder error for patch 21
>- add to support hevc for patch 22
>
>Changed in v3:
>- rewrite the cover-letter of this patch series
>- disable irq for svp mode
>- rebase the driver based on the latest media stage
>
>Changed in v2:
>- remove setting decoder mode and getting secure handle from decode
>- add Jeffrey's patch
>- add John and T.J's patch
>- getting secure flag with request buffer
>- fix some comments from patch v1
>---
>Jeffrey Kardatzke (2):
>  v4l2: add restricted memory flags
>  v4l2: handle restricted memory flags in queue setup
>
>John Stultz (2):
>  dma-heap: Add proper kref handling on dma-buf heaps
>  dma-heap: Provide accessors so that in-kernel drivers can allocate
>    dmabufs from specific heaps
>
>T.J. Mercier (1):
>  dma-buf: heaps: Deduplicate docs and adopt common format
>
>Xiaoyong Lu (1):
>  media: mediatek: vcodec: support av1 svp decoder for mt8188
>
>Yilong Zhou (1):
>  media: mediatek: vcodec: support vp9 svp decoder for mt8188
>
>Yunfei Dong (21):
>  media: videobuf2: calculate restricted memory size
>  media: mediatek: vcodec: add tee client interface to communiate with
>    optee-os
>  media: mediatek: vcodec: build decoder OPTEE driver as module
>  media: mediatek: vcodec: allocate tee share memory
>  media: mediatek: vcodec: send share memory data to optee
>  media: mediatek: vcodec: initialize msg and vsi information
>  media: mediatek: vcodec: add interface to allocate/free secure memory
>  media: mediatek: vcodec: using shared memory as vsi address
>  media: mediatek: vcodec: add single allocation format
>  media: mediatek: vcodec: support single allocation format
>  media: mediatek: vcodec: support single allocation buffer
>  media: mediatek: vcodec: re-construct h264 driver to support svp mode
>  media: mediatek: vcodec: remove parse nal_info in kernel
>  media: mediatek: vcodec: disable wait interrupt for svp mode
>  media: mediatek: vcodec: support tee decoder
>  media: mediatek: vcodec: move vdec init interface to setup callback
>  media: mediatek: vcodec: support hevc svp for mt8188
>  media: mediatek: vcodec: remove vsi data from common interface
>  media: mediatek: vcodec: rename vsi to extend vsi
>  media: mediatek: vcodec: adding non extend struct
>  media: mediatek: vcodec: support extend h264 driver
>
> .../userspace-api/media/v4l/buffer.rst        |  10 +-
> .../media/v4l/pixfmt-reserved.rst             |   7 +
> .../media/v4l/vidioc-reqbufs.rst              |   6 +
> drivers/dma-buf/dma-heap.c                    | 139 ++++-
> .../media/common/videobuf2/videobuf2-core.c   |  29 +
> .../common/videobuf2/videobuf2-dma-contig.c   |  34 +-
> .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +-
> .../media/platform/mediatek/vcodec/Kconfig    |  13 +
> .../mediatek/vcodec/common/mtk_vcodec_util.c  | 117 +++-
> .../mediatek/vcodec/common/mtk_vcodec_util.h  |   8 +-
> .../platform/mediatek/vcodec/decoder/Makefile |   4 +
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 152 +++--
> .../vcodec/decoder/mtk_vcodec_dec_drv.c       |   8 +
> .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  11 +
> .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  34 +-
> .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 391 +++++++++++++
> .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 198 +++++++
> .../vcodec/decoder/mtk_vcodec_dec_pm.c        |   6 +-
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c |  35 +-
> .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 104 ++--
> .../decoder/vdec/vdec_h264_req_common.c       |  18 +-
> .../decoder/vdec/vdec_h264_req_multi_if.c     | 536 +++++++++++++++++-
> .../decoder/vdec/vdec_hevc_req_multi_if.c     |  88 +--
> .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 101 ++--
> .../mediatek/vcodec/decoder/vdec_drv_if.c     |   4 +-
> .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
> .../mediatek/vcodec/decoder/vdec_vpu_if.c     |  51 +-
> .../mediatek/vcodec/decoder/vdec_vpu_if.h     |   4 +
> drivers/media/v4l2-core/v4l2-common.c         |   2 +
> drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> include/linux/dma-heap.h                      |  29 +-
> include/media/videobuf2-core.h                |   8 +-
> include/uapi/linux/videodev2.h                |   3 +
> 33 files changed, 1868 insertions(+), 296 deletions(-)
> create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
> create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
>
>-- 
>2.18.0
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.
