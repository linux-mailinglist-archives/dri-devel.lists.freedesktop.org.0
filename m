Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C991E4810A6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 08:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79D10E357;
	Wed, 29 Dec 2021 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF310E357
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 07:27:23 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so19235151pjp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZSNki/251fDYLWVkOPn8gWn57CxzUzo65fAsecZzSY=;
 b=C2b0u1tClTPmdQioW+rxkZ+V7pqKZXRaISlUmt8iCW927RhgQrOFUcbd6meMPzDYNJ
 vx/XLkZIkznWTkZgvAJ0ypkuBP40ipDUo3JMy4vf3JbUxpYhuOGGxI3JuXXye7pCnNXn
 OHFvXOdT2LXYXBGWmxRgIZgz0RV/Sdkl5FYD5J82qNlhU2jZNlaB03hEd6b34lmLCcpQ
 YED6khoDbdY0+qbd/rqXiy3pREdcFpr0WizTcRnrPvPmpwUgw5+wkuXI7xO9d6X8xnTE
 021Ucv5pypqtaIcTorUmLe52PUYDNHSXbPkhRRZ6tIZ/1Yr4jRcacTFc0vZ6xiGpSehi
 KHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZSNki/251fDYLWVkOPn8gWn57CxzUzo65fAsecZzSY=;
 b=ksGAvumTPz/55l8ZTrhQ2wazmg+hlTlYvG9U5Wk/DdlIzzl6D8xD4pbWaf+0dxye/v
 ZxROkqULeu5WeYAron0hmQMimInyeBnFhb9iDtya7uKDCFjvckr9Owdl0b+S+FGOrIM+
 9PG02NrdYx9zSSVcruuZINucChnVwCDhMbN0n9BKAPVEVFphgdxVjYEaNHhvuZ4vw3B5
 IDEOM5a/0iFWC9FjpEmH59Z7mc0ERaE28LjcomR66tDg1aZ/n5bq6pI2vloadchK6hHp
 AkE3WUEbwPFlUyF9X9vmzumkv7FZn2kaBBKJhqSX9eX2SJNJ9pXsDYYnRMfrdxKHaHz8
 HJ0Q==
X-Gm-Message-State: AOAM532VzsKrFi//IRkwS3T9mYXJ90oEm1sXVFWlx8wrIEvctwVSyqtA
 Ja3c9UDFG/BvPUkEE5B30ZSa2OntLejgo+3bIkvrWA==
X-Google-Smtp-Source: ABdhPJwdorV9rKsCXwNUTFsMyMCJcCadilIxzOqhyG+k64txb8IQphCdPdY79KAgaFh5MoE1tQRj+5vGer2dfAH87+8=
X-Received: by 2002:a17:902:b591:b0:149:66d6:7589 with SMTP id
 a17-20020a170902b59100b0014966d67589mr19576058pls.24.1640762843190; Tue, 28
 Dec 2021 23:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-4-yunfei.dong@mediatek.com>
 <Ycvz4UrmbngVzIv2@google.com>
 <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
In-Reply-To: <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 29 Dec 2021 15:27:11 +0800
Message-ID: <CA+Px+wU2aU_t2F2XOsjf5vRUikQPaftRa9062CCCNwRJK-WA3w@mail.gmail.com>
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
To: "yunfei.dong@mediatek.com" <Yunfei.Dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 29, 2021 at 2:52 PM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
> On Wed, 2021-12-29 at 13:36 +0800, Tzung-Bi Shih wrote:
> > On Tue, Dec 28, 2021 at 05:41:37PM +0800, Yunfei Dong wrote:
> > > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> >
> > [...]
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > index 130ecef2e766..87891ebd7246 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > @@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file,
> > > void *priv,
> > >                     }
> > >                     ctx->state = MTK_STATE_INIT;
> > >             }
> > > +   } else {
> > > +           ctx->capture_fourcc = fmt->fourcc;
> > >     }
> > >
> > >     /*
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > index a23a7646437c..95e07cf2cd3e 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > @@ -277,6 +277,7 @@ struct vdec_pic_info {
> > >   *              to be used with encoder and stateful decoder.
> > >   * @is_flushing: set to true if flushing is in progress.
> > >   * @current_codec: current set input codec, in V4L2 pixel format
> > > + * @capture_fourcc: capture queue type in V4L2 pixel format
> > >   *
> > >   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
> > >   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> > > @@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
> > >     bool is_flushing;
> > >
> > >     u32 current_codec;
> > > +   u32 capture_fourcc;
> >
> > What is the purpose of capture_fourcc?  It is not used.
> >
> Need to calculate each plane size according to capture fourcc type from
> scp. The plane size of MM21 is different with MT21C. And the capture
> fourcc type of different codec maybe different.

Purpose of capture_fourcc in the context is not obvious and looks
irrelevant to the patch.  Could it move to somewhere patch that makes
more sense?

> > > +/**
> > > + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
> > > + * @msg_id : AP_IPIMSG_DEC_START
> > > + * @inst_id     : instance ID. Used if the ABI version >= 2.
> > > + * @data   : picture information
> > > + * @param_type     : get param type
> > > + * @codec_type     : Codec fourcc
> > > + */
> > > +struct vdec_ap_ipi_get_param {
> > > +   uint32_t msg_id;
> > > +   uint32_t inst_id;
> > > +   uint32_t data[4];
> > > +   uint32_t param_type;
> > > +   uint32_t codec_type;
> > > +};
> >
> > Are AP_IPIMSG_SET_PARAM and AP_IPIMSG_DEC_START typos?
> >
> It's getting message from scp side. It's looks much better to add one
> new path from ap to scp.

Pardon me, I failed to understand it.  I thought the struct could be
for AP_IPIMSG_DEC_GET_PARAM.

> > > +/**
> > > + * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
> > > + * @msg_id : VPU_IPIMSG_DEC_INIT_ACK
> > > + * @status : VPU exeuction result
> > > + * @ap_inst_addr   : AP vcodec_vpu_inst instance address
> > > + * @data     : picture information from SCP.
> > > + * @param_type     : get param type
> > > + */
> > > +struct vdec_vpu_ipi_get_param_ack {
> > > +   uint32_t msg_id;
> > > +   int32_t status;
> > > +   uint64_t ap_inst_addr;
> > > +   uint32_t data[4];
> > > +   uint32_t param_type;
> > > +   uint32_t reserved;
> > > +};
> >
> > Same here: is VPU_IPIMSG_DEC_INIT_ACK a typo?
> >
> It's getting message from scp side. It's looks much better to add one new path from ap to scp.

Same here: I thought it was for VPU_IPIMSG_DEC_GET_PARAM_ACK.

> > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > index 4cb3c7f5a3ad..963f8d4877b7 100644
> > > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
> > >   * @wq          : wait queue to wait VPU message ack
> > >   * @handler     : ipi handler for each decoder
> > >   * @codec_type     : use codec type to separate different codecs
> > > + * @capture_type    : used capture type to separate different
> > > capture format
> > > + * @fb_sz  : frame buffer size of each plane
> > >   */
> > >  struct vdec_vpu_inst {
> > >     int id;
> > > @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
> > >     wait_queue_head_t wq;
> > >     mtk_vcodec_ipi_handler handler;
> > >     unsigned int codec_type;
> > > +   unsigned int capture_type;
> > > +   unsigned int fb_sz[2];
> > >  };
> >
> > capture_type is not used in the patch.
> >
> Capture type will be used in scp to get capture plane size according to
> capture buffer type.

Pardon me, I failed to understand it.  I may misunderstand, however,
it doesn't look like a shared memory structure between AP and SCP.

At least to me, capture_type is not used in the patch.  It could be
better to move it to somewhere patch that makes more sense.

> > Does fb_sz take effect in later patches?
>
> Don't have effect to later patches.

Is the fb_sz used somewhere "later"?  The patch gets fb_sz from SCP,
however, fb_sz is never used in some control or configuration paths.
