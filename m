Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA94FF0B5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 09:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6B10FBCB;
	Wed, 13 Apr 2022 07:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83BA10FB59
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:03:31 +0000 (UTC)
X-UUID: 39bf8af5510d4113b01a9f422c92c0b9-20220413
X-UUID: 39bf8af5510d4113b01a9f422c92c0b9-20220413
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 85817476; Wed, 13 Apr 2022 15:03:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 15:03:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 15:03:24 +0800
Message-ID: <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, "yunfei.dong@mediatek.com"
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Wed, 13 Apr 2022 15:03:24 +0800
In-Reply-To: <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-Mailman-Approved-At: Wed, 13 Apr 2022 07:39:54 +0000
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
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Steve Cho <stevecho@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

On Tue, 2022-04-12 at 10:48 -0400, Nicolas Dufresne wrote:
> Le lundi 11 avril 2022 à 11:41 +0800, yunfei.dong@mediatek.com a
> écrit :
> > Hi Nicolas,
> > 
> > On Thu, 2022-03-31 at 16:48 -0400, Nicolas Dufresne wrote:
> > > Hi Yunfei,
> > > 
> > > thanks for the update, I should be testing this really soon.
> > > 
> > > Le jeudi 31 mars 2022 à 10:47 +0800, Yunfei Dong a écrit :
> > > > This series adds support for mt8192 h264/vp8/vp9 decoder
> > > > drivers.
> > > > Firstly, refactor
> > > > power/clock/interrupt interfaces for mt8192 is lat and core
> > > > architecture.
> > > 
> > > Similarly to MT8173 and MT8183, a shared* firmware is needed for
> > > this
> > > CODEC to
> > > work (scp.img). I looked into linux-firmware[1] it has not been
> > > added
> > > for mt8192
> > > yet. As your patches are getting close to be ready, it would be
> > > important to
> > > look into this so the patchset does not get blocked due to that.
> > > 
> > > best regards,
> > > Nicolas
> > > 
> > > [1] 
> > > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBrZfMIcvQ$
> > >  
> > > * Shared at least between MDP3 and MTK VCODEC from my knowledge
> > > 
> > 
> > Thanks for your remind.
> > 
> > I have already sent mt8192 scp.img to github.
> > 
> > 
https://urldefense.com/v3/__https://github.com/yunfeidongmediatek/linux_fw_scp_8192/commit/3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d__;!!CTRNKA9wMg0ARbw!zy4N6JDroSXtumXXa7MuxAgYAPAink8uyW-978vpWct8S3vOjBqXirFE8uTEHopHCovbSl0FNP9LPgWCEBpf9F_nWA$
> >  
> > 
> > Waiting for to be merged.
> 
> On boards I have, the firmware is loaded from /lib/firmware/scp.img,
> but with
> this submission it will be in lib/firmware/mediatek/mt8192/scp.img .
> I haven't
> found anything around:
> 
>  drivers/remoteproc/mtk_scp.c:812:       char *fw_name = "scp.img";
> 
> That would use the platform path. This seems like a problem to me,
> the
> upstreaming of the firmware isn't being aligned with the were the
> firmware is
> picked by the upstream driver. Correct me if I got this wrong, but
> I'd really
> like to clarify this.
> 
> Nicolas
> 

I am not sure why it's accepted the fw path of scp is
/lib/firmware/scp.img in mt8173/8183 but we upload scp.ing in
/lib/firmware/mediatek/mt8173(mt8183)/scp.img to

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek

Currently, the scp driver will load firmware in /lib/firmware/scp.img.
that means there is only one firmware for a specific platform.
I think we can send a PATCH to make firmware name of scp being more
flexible.

Maybe get firmware name from dts. e.g.,
&scp {
	status = "okay";
	firmware-name = "mediatek/mt81xx/scp.img";
};

Do you think it feasible?
If you have any concerns, please let us know.

Thanks,
Allen

> > 
> > Best Regards,
> > Yunfei Dong
> > 
> > > > 
> > > > Secondly, add new functions to get frame buffer size and
> > > > resolution
> > > > according
> > > > to decoder capability from scp side. Then add callback function
> > > > to
> > > > get/put
> > > > capture buffer in order to enable lat and core decoder in
> > > > parallel,
> > > > need to
> > > > adjust GStreamer at the same time. 
> > > > 
> > > > Then add to support MT21C compressed mode and fix v4l2-
> > > > compliance
> > > > fail.
> > > > 
> > > > Next, extract H264 request api driver to let mt8183 and mt8192
> > > > use
> > > > the same
> > > > code, and adds mt8192 frame based h264 driver for stateless
> > > > decoder.
> > > > 
> > > > Lastly, add vp8 and vp9 stateless decoder drivers.
> > > > 
> > > > Patches 1 refactor power/clock/interrupt interface.
> > > > Patches 2~4 get frame buffer size and resolution according to
> > > > decoder capability.
> > > > Patches 5 set capture queue bytesused.
> > > > Patches 6 adjust GStreamer.
> > > > Patch 7~11 add to support MT21C compressed mode and fix v4l2-
> > > > compliance fail.
> > > > patch 12 record capture queue format type.
> > > > Patch 13~14 extract h264 driver and add mt8192 frame based
> > > > driver
> > > > for h264 decoder.
> > > > Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> > > > Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
> > > > ---
> > > > changes compared with v6:
> > > > - adjust GStreamer, separate src buffer done with
> > > > v4l2_ctrl_request_complete for patch 6.
> > > > - remove v4l2_m2m_set_dst_buffered.
> > > > - add new patch to set each plane bytesused in buf prepare for
> > > > patch 5.
> > > > - using upstream interface to update vp9 prob tables for patch
> > > > 16.
> > > > - fix maintainer comments.
> > > > - test the driver with chrome VD and
> > > > GStreamer(H264/VP9/VP8/AV1).
> > > > changes compared with v6:
> > > > - rebase to the latest media stage and fix conficts
> > > > - fix memcpy to memcpy_fromio or memcpy_toio
> > > > - fix h264 crash when test field bitstream
> > > > changes compared with v5:
> > > > - fix vp9 comments for patch 15
> > > > - fix vp8 comments for patch 14.
> > > > - fix comments for patch 12.
> > > > - fix build errors.
> > > > changes compared with v4:
> > > > - fix checkpatch.pl fail.
> > > > - fix kernel-doc fail.
> > > > - rebase to the latest media codec driver.
> > > > changes compared with v3:
> > > > - remove enum mtk_chip for patch 2.
> > > > - add vp8 stateless decoder drivers for patch 14.
> > > > - add vp9 stateless decoder drivers for patch 15.
> > > > changes compared with v2:
> > > > - add new patch 11 to record capture queue format type.
> > > > - separate patch 4 according to tzung-bi's suggestion.
> > > > - re-write commit message for patch 5 according to tzung-bi's
> > > > suggestion.
> > > > changes compared with v1:
> > > > - rewrite commit message for patch 12.
> > > > - rewrite cover-letter message.
> > > > ---
> > > > Yunfei Dong (17):
> > > >   media: mediatek: vcodec: Add vdec enable/disable hardware
> > > > helpers
> > > >   media: mediatek: vcodec: Using firmware type to separate
> > > > different
> > > >     firmware architecture
> > > >   media: mediatek: vcodec: get capture queue buffer size from
> > > > scp
> > > >   media: mediatek: vcodec: Read max resolution from
> > > > dec_capability
> > > >   media: mediatek: vcodec: set each plane bytesused in buf
> > > > prepare
> > > >   media: mediatek: vcodec: Refactor get and put capture buffer
> > > > flow
> > > >   media: mediatek: vcodec: Refactor supported vdec formats and
> > > >     framesizes
> > > >   media: mediatek: vcodec: Getting supported decoder format
> > > > types
> > > >   media: mediatek: vcodec: Add format to support MT21C
> > > >   media: mediatek: vcodec: disable vp8 4K capability
> > > >   media: mediatek: vcodec: Fix v4l2-compliance fail
> > > >   media: mediatek: vcodec: record capture queue format type
> > > >   media: mediatek: vcodec: Extract H264 common code
> > > >   media: mediatek: vcodec: support stateless H.264 decoding for
> > > > mt8192
> > > >   media: mediatek: vcodec: support stateless VP8 decoding
> > > >   media: mediatek: vcodec: support stateless VP9 decoding
> > > >   media: mediatek: vcodec: prevent kernel crash when rmmod
> > > >     mtk-vcodec-dec.ko
> > > > 
> > > >  .../media/platform/mediatek/vcodec/Makefile   |    4 +
> > > >  .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
> > > >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
> > > >  .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
> > > >  .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
> > > >  .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
> > > >  .../vcodec/mtk_vcodec_dec_stateless.c         |  257 +-
> > > >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
> > > >  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
> > > >  .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
> > > >  .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
> > > >  .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
> > > >  .../vcodec/vdec/vdec_h264_req_common.h        |  272 +++
> > > >  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
> > > >  .../vcodec/vdec/vdec_h264_req_multi_if.c      |  619 +++++
> > > >  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
> > > >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2072
> > > > +++++++++++++++++
> > > >  .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
> > > >  .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
> > > >  .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
> > > >  .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
> > > >  .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
> > > >  .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
> > > >  .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
> > > >  .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
> > > >  include/linux/remoteproc/mtk_scp.h            |    2 +
> > > >  26 files changed, 4274 insertions(+), 601 deletions(-)
> > > >  create mode 100644
> > > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_commo
> > > > n.c
> > > >  create mode 100644
> > > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_commo
> > > > n.h
> > > >  create mode 100644
> > > > drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi
> > > > _if.
> > > > c
> > > >  create mode 100644
> > > > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
> > > >  create mode 100644
> > > > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if
> > > > .c
> > > > 
> > > 
> > > 
> 
> 

