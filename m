Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306804EE2E2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273010E657;
	Thu, 31 Mar 2022 20:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA1010E657
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:48:07 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id s11so594571qtc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=3sKDeBT0Bybpz0Cwpb0hpKqxHi3J/peqolQfUVYmQ+A=;
 b=hU52InW/YEHpPqnwM0BOrRTaDS0GWqdS0Qxm1+YxtdSqZ62Cvp6J8Wa6VW3vtzzQLE
 OqoihkSGii4UeWenrhZqk+3/ignl8uB0HYNcuLFiZIVilTzRNAmp3/6eSLYPQI42TOaP
 eSyB3eB4jwyDjdZBxFx01YIT5KEVLTN9bJTmi5NF3b8fuslAXn4Oz/v9ptcWniukaG4o
 rCkSEdBS3y3pw7n0rxogms8il/hyaQYESJ06sbFU3qOAo1dJuiKDaMC0A73HmCbZ2zSy
 x0L2svgfuQSUyAWwIbmsWZW7jb4eYePsVERoDDe2QhaAcvCLHrmwX4hbLzsL8y6ZvFcq
 LeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=3sKDeBT0Bybpz0Cwpb0hpKqxHi3J/peqolQfUVYmQ+A=;
 b=Lkd9xthhlDi3fqP/IXYYPh6mcONHVzsToMdY4aKatV23wp4iCAEJCTzpqJrfyqeE6B
 tvylRR5GQdbiBIIDPoOP3zspyhTD256NPM+LNruIrMmNF/3usBTZO7XjmEodJ6m3GmVi
 Jf5HG5x7/HHHZyzLSedLhqa+AcyWeLRI59HtV45cgoHtlaJt/1a8h8VxdiDH0HJv1qOB
 OD6OxrFxBRp2vhp6uRINiOZUo3i0c/6+Pooiv5MSd6iNcwlL2jB7QQ4kDlxJ/oXI2MI4
 Vtplh22DB3uVGVdX9kWbNvIBog86zMSSpyor+k4lqthrE7aDMtsDVVkYd7e2Z77vhFIb
 QYlQ==
X-Gm-Message-State: AOAM531oF9rNXmjA7ZShmEhP/gP/rM3eLgXlls86XQBzIpJ1Pjbxpkyc
 BUeJU5t3XU3wyYoQzvv2R1l7pg==
X-Google-Smtp-Source: ABdhPJyCAQjeol4XLsD3HSDNkSTrQJJcEUQFkY5CC10RGVl8vJRMiYpPlRRNrSYxf3PDnPuKtdG97Q==
X-Received: by 2002:a05:622a:d5:b0:2e1:df97:b37e with SMTP id
 p21-20020a05622a00d500b002e1df97b37emr5964126qtw.333.1648759686118; 
 Thu, 31 Mar 2022 13:48:06 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a410100b0067ec5ecac66sm306731qko.19.2022.03.31.13.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:48:05 -0700 (PDT)
Message-ID: <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Date: Thu, 31 Mar 2022 16:48:04 -0400
In-Reply-To: <20220331024801.29229-1-yunfei.dong@mediatek.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

thanks for the update, I should be testing this really soon.

Le jeudi 31 mars 2022 =C3=A0 10:47 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly=
, refactor
> power/clock/interrupt interfaces for mt8192 is lat and core architecture.

Similarly to MT8173 and MT8183,=C2=A0a shared* firmware is needed for this =
CODEC to
work (scp.img). I looked into linux-firmware[1] it has not been added for m=
t8192
yet. As your patches are getting close to be ready, it would be important t=
o
look into this so the patchset does not get blocked due to that.

best regards,
Nicolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git/tree/mediatek
* Shared at least between MDP3 and MTK VCODEC from my knowledge

>=20
> Secondly, add new functions to get frame buffer size and resolution accor=
ding
> to decoder capability from scp side. Then add callback function to get/pu=
t
> capture buffer in order to enable lat and core decoder in parallel, need =
to
> adjust GStreamer at the same time.=20
>=20
> Then add to support MT21C compressed mode and fix v4l2-compliance fail.
>=20
> Next, extract H264 request api driver to let mt8183 and mt8192 use the sa=
me
> code, and adds mt8192 frame based h264 driver for stateless decoder.
>=20
> Lastly, add vp8 and vp9 stateless decoder drivers.
>=20
> Patches 1 refactor power/clock/interrupt interface.
> Patches 2~4 get frame buffer size and resolution according to decoder cap=
ability.
> Patches 5 set capture queue bytesused.
> Patches 6 adjust GStreamer.
> Patch 7~11 add to support MT21C compressed mode and fix v4l2-compliance f=
ail.
> patch 12 record capture queue format type.
> Patch 13~14 extract h264 driver and add mt8192 frame based driver for h26=
4 decoder.
> Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
> ---
> changes compared with v6:
> - adjust GStreamer, separate src buffer done with v4l2_ctrl_request_compl=
ete for patch 6.
> - remove v4l2_m2m_set_dst_buffered.
> - add new patch to set each plane bytesused in buf prepare for patch 5.
> - using upstream interface to update vp9 prob tables for patch 16.
> - fix maintainer comments.
> - test the driver with chrome VD and GStreamer(H264/VP9/VP8/AV1).
> changes compared with v6:
> - rebase to the latest media stage and fix conficts
> - fix memcpy to memcpy_fromio or memcpy_toio
> - fix h264 crash when test field bitstream
> changes compared with v5:
> - fix vp9 comments for patch 15
> - fix vp8 comments for patch 14.
> - fix comments for patch 12.
> - fix build errors.
> changes compared with v4:
> - fix checkpatch.pl fail.
> - fix kernel-doc fail.
> - rebase to the latest media codec driver.
> changes compared with v3:
> - remove enum mtk_chip for patch 2.
> - add vp8 stateless decoder drivers for patch 14.
> - add vp9 stateless decoder drivers for patch 15.
> changes compared with v2:
> - add new patch 11 to record capture queue format type.
> - separate patch 4 according to tzung-bi's suggestion.
> - re-write commit message for patch 5 according to tzung-bi's suggestion.
> changes compared with v1:
> - rewrite commit message for patch 12.
> - rewrite cover-letter message.
> ---
> Yunfei Dong (17):
>   media: mediatek: vcodec: Add vdec enable/disable hardware helpers
>   media: mediatek: vcodec: Using firmware type to separate different
>     firmware architecture
>   media: mediatek: vcodec: get capture queue buffer size from scp
>   media: mediatek: vcodec: Read max resolution from dec_capability
>   media: mediatek: vcodec: set each plane bytesused in buf prepare
>   media: mediatek: vcodec: Refactor get and put capture buffer flow
>   media: mediatek: vcodec: Refactor supported vdec formats and
>     framesizes
>   media: mediatek: vcodec: Getting supported decoder format types
>   media: mediatek: vcodec: Add format to support MT21C
>   media: mediatek: vcodec: disable vp8 4K capability
>   media: mediatek: vcodec: Fix v4l2-compliance fail
>   media: mediatek: vcodec: record capture queue format type
>   media: mediatek: vcodec: Extract H264 common code
>   media: mediatek: vcodec: support stateless H.264 decoding for mt8192
>   media: mediatek: vcodec: support stateless VP8 decoding
>   media: mediatek: vcodec: support stateless VP9 decoding
>   media: mediatek: vcodec: prevent kernel crash when rmmod
>     mtk-vcodec-dec.ko
>=20
>  .../media/platform/mediatek/vcodec/Makefile   |    4 +
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
>  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
>  .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
>  .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
>  .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
>  .../vcodec/mtk_vcodec_dec_stateless.c         |  257 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
>  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
>  .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
>  .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
>  .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
>  .../vcodec/vdec/vdec_h264_req_common.h        |  272 +++
>  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
>  .../vcodec/vdec/vdec_h264_req_multi_if.c      |  619 +++++
>  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
>  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2072 +++++++++++++++++
>  .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
>  .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
>  .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
>  .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
>  .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
>  .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
>  .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
>  .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
>  include/linux/remoteproc/mtk_scp.h            |    2 +
>  26 files changed, 4274 insertions(+), 601 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264=
_req_common.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264=
_req_common.h
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264=
_req_multi_if.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_=
req_if.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_=
req_lat_if.c
>=20

