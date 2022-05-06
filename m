Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A3E51D454
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 11:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C458310F56B;
	Fri,  6 May 2022 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9D510F56B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 09:26:34 +0000 (UTC)
X-UUID: 9beafb3a830248e9b83f2ea36d21e084-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:38918bd6-b015-4132-a85f-715ef2a5f7e0, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:bf2e7416-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9beafb3a830248e9b83f2ea36d21e084-20220506
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1742012006; Fri, 06 May 2022 17:26:30 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 6 May 2022 17:26:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 17:26:28 +0800
Message-ID: <e02ab5098878f4c59cecb84a277fb89fb5ca9da1.camel@mediatek.com>
Subject: Re: [DKIM] [PATCH v10, 00/15] media: mtk-vcodec: support for M8192
 decoder
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, "Tomasz Figa" <tfiga@google.com>
Date: Fri, 6 May 2022 17:26:27 +0800
In-Reply-To: <4334520e-af49-fe32-fb23-ef9af6388529@xs4all.nl>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
 <4334520e-af49-fe32-fb23-ef9af6388529@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

Thanks for your suggestion.

I will fix below check fails in patch v11.

Best Regards,
Yunfei Dong
On Fri, 2022-04-29 at 11:44 +0200, Hans Verkuil wrote:
> Hi Yunfei,
> 
> On 26/04/2022 12:08, Yunfei Dong wrote:
> > This series adds support for mt8192 h264/vp8/vp9 decoder drivers.
> > Firstly, refactor
> > power/clock/interrupt interfaces for mt8192 is lat and core
> > architecture.
> > 
> > Secondly, add new functions to get frame buffer size and resolution
> > according
> > to decoder capability from scp side. Then add callback function to
> > get/put
> > capture buffer in order to enable lat and core decoder in parallel,
> > need to
> > adjust GStreamer at the same time. 
> > 
> > Then add to support MT21C compressed mode and fix v4l2-compliance
> > fail.
> > 
> > Next, extract H264 request api driver to let mt8183 and mt8192 use
> > the same
> > code, and adds mt8192 frame based h264 driver for stateless
> > decoder.
> > 
> > Lastly, add vp8 and vp9 stateless decoder drivers.
> > 
> > Patches 1 refactor power/clock/interrupt interface.
> > Patches 2~4 get frame buffer size and resolution according to
> > decoder capability.
> > Patches 5 set capture queue bytesused.
> > Patches 6 adjust GStreamer.
> > Patch 7~11 add to support MT21C compressed mode and fix v4l2-
> > compliance fail.
> > patch 12 record capture queue format type.
> > Patch 13~14 extract h264 driver and add mt8192 frame based driver
> > for h264 decoder.
> > Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> > Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
> 
> I'm getting loads of sparse and smatch warnings/errors:
> 
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c:20:28: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c:176:21: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.
> c:179:21: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:463:26: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:647:60: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:723:30: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:740:48: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1995:44: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :532:34: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :673:40: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :674:48: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :675:45: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :678:37: warning: incorrect type in argument 2 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :684:21: warning: incorrect type in argument 1 (different address
> spaces)
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1912:45: warning: Using plain integer as NULL pointer
> SPARSE:/home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1924:44: warning: incorrect type in argument 2 (different address
> spaces)
> 
> 
> smatch: ERRORS
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1192 vdec_vp9_slice_map_counts_eob_coef() error: buffer overflow
> 'counts->coef_probs[i][j][k]->band_0'
> 3 <= 5
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1194 vdec_vp9_slice_map_counts_eob_coef() error: buffer overflow
> 'counts->eob_branch[i][j][k]->band_0'
> 3 <= 5
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :1196 vdec_vp9_slice_map_counts_eob_coef() error: buffer overflow
> 'counts->coef_probs[i][j][k]->band_0'
> 3 <= 5
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> :2018 vdec_vp9_slice_core_decode() error: we previously assumed 'pfc'
> could be null (see line 1963)
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:700 vdec_h264_slice_single_decode() warn: unsigned
> 'nal_start_idx' is never less than zero.
> 
> And also one compile warning when compiling on a 32 bit platform
> (i.e. arm or i686):
> 
> In file included from /home/hans/work/build/media-
> git/include/linux/kernel.h:29,
>                  from /home/hans/work/build/media-
> git/include/linux/cpumask.h:10,
>                  from /home/hans/work/build/media-
> git/include/linux/mm_types_task.h:14,
>                  from /home/hans/work/build/media-
> git/include/linux/mm_types.h:5,
>                  from /home/hans/work/build/media-
> git/include/linux/buildid.h:5,
>                  from /home/hans/work/build/media-
> git/include/linux/module.h:14,
>                  from /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:7:
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c: In function 'vdec_h264_slice_single_decode':
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:684:76: warning: cast from pointer to integer of different size
> [-Wpointer-to-int-cast]
>   684 |                          inst->ctx->decoded_frame_cnt,
> y_fb_dma, c_fb_dma, (u64)fb);
>       |                                                              
>               ^
> /home/hans/work/build/media-git/include/linux/printk.h:418:33: note:
> in definition of macro 'printk_index_wrap'
>   418 |                 _p_func(_fmt,
> ##__VA_ARGS__);                           \
>       |                                 ^~~~~~~~~~~
> /home/hans/work/build/media-git/include/linux/printk.h:132:17: note:
> in expansion of macro 'printk'
>   132 |                 printk(fmt, ##__VA_ARGS__);             \
>       |                 ^~~~~~
> /home/hans/work/build/media-git/include/linux/printk.h:576:9: note:
> in expansion of macro 'no_printk'
>   576 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~~
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:
> 45:9: note: in expansion of macro 'pr_debug'
>    45 |         pr_debug("[MTK_VCODEC][%d]: " fmt
> "\n",                 \
>       |         ^~~~~~~~
> /home/hans/work/build/media-
> git/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_i
> f.c:683:9: note: in expansion of macro 'mtk_vcodec_debug'
>   683 |         mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx
> c_dma=%llx va=0x%llx",
>       |         ^~~~~~~~~~~~~~~~
> 
> Regards,
> 
> 	Hans
> 
> > ---
> > changes compared with v9:
> > - fix kernel robot build fail for patch 16
> > changes compared with v8:
> > - fix vp9 build error
> > - fix kernel-doc fail
> > changes compared with v7:
> > - adjust GStreamer, separate src buffer done with
> > v4l2_ctrl_request_complete for patch 6.
> > - remove v4l2_m2m_set_dst_buffered.
> > - add new patch to set each plane bytesused in buf prepare for
> > patch 5.
> > - using upstream interface to update vp9 prob tables for patch 16.
> > - fix maintainer comments.
> > - test the driver with chrome VD and GStreamer(H264/VP9/VP8/AV1).
> > changes compared with v6:
> > - rebase to the latest media stage and fix conficts
> > - fix memcpy to memcpy_fromio or memcpy_toio
> > - fix h264 crash when test field bitstream
> > changes compared with v5:
> > - fix vp9 comments for patch 15
> > - fix vp8 comments for patch 14.
> > - fix comments for patch 12.
> > - fix build errors.
> > changes compared with v4:
> > - fix checkpatch.pl fail.
> > - fix kernel-doc fail.
> > - rebase to the latest media codec driver.
> > changes compared with v3:
> > - remove enum mtk_chip for patch 2.
> > - add vp8 stateless decoder drivers for patch 14.
> > - add vp9 stateless decoder drivers for patch 15.
> > changes compared with v2:
> > - add new patch 11 to record capture queue format type.
> > - separate patch 4 according to tzung-bi's suggestion.
> > - re-write commit message for patch 5 according to tzung-bi's
> > suggestion.
> > changes compared with v1:
> > - rewrite commit message for patch 12.
> > - rewrite cover-letter message.
> > ---
> > Yunfei Dong (17):
> >   media: mediatek: vcodec: Add vdec enable/disable hardware helpers
> >   media: mediatek: vcodec: Using firmware type to separate
> > different
> >     firmware architecture
> >   media: mediatek: vcodec: get capture queue buffer size from scp
> >   media: mediatek: vcodec: Read max resolution from dec_capability
> >   media: mediatek: vcodec: set each plane bytesused in buf prepare
> >   media: mediatek: vcodec: Refactor get and put capture buffer flow
> >   media: mediatek: vcodec: Refactor supported vdec formats and
> >     framesizes
> >   media: mediatek: vcodec: Getting supported decoder format types
> >   media: mediatek: vcodec: Add format to support MT21C
> >   media: mediatek: vcodec: disable vp8 4K capability
> >   media: mediatek: vcodec: Fix v4l2-compliance fail
> >   media: mediatek: vcodec: record capture queue format type
> >   media: mediatek: vcodec: Extract H264 common code
> >   media: mediatek: vcodec: support stateless H.264 decoding for
> > mt8192
> >   media: mediatek: vcodec: support stateless VP8 decoding
> >   media: mediatek: vcodec: support stateless VP9 decoding
> >   media: mediatek: vcodec: prevent kernel crash when rmmod
> >     mtk-vcodec-dec.ko
> > 
> >  .../media/platform/mediatek/vcodec/Makefile   |    4 +
> >  .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
> >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
> >  .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
> >  .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
> >  .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
> >  .../vcodec/mtk_vcodec_dec_stateless.c         |  257 ++-
> >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
> >  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
> >  .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
> >  .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
> >  .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
> >  .../vcodec/vdec/vdec_h264_req_common.h        |  274 +++
> >  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
> >  .../vcodec/vdec/vdec_h264_req_multi_if.c      |  626 +++++
> >  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
> >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2031
> > +++++++++++++++++
> >  .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
> >  .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
> >  .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
> >  .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
> >  .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
> >  .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
> >  .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
> >  .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
> >  include/linux/remoteproc/mtk_scp.h            |    2 +
> >  26 files changed, 4242 insertions(+), 601 deletions(-)
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.
> > c
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > 
> 
> 

