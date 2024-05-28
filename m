Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D09298D1569
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5894C10FFD4;
	Tue, 28 May 2024 07:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bN65bzlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0AB10FFD4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:38:12 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5295a66e775so630238e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716881890; x=1717486690;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHdXY7trRCe9IqJRK/4uBBat10D4WSsZDyKrE9GQue8=;
 b=bN65bzltrI/3OSTIOUklEnIkegq6eZ0cEsHfBGyhLT42cKEn/JV/ZjmiqEyAAMXMCy
 Vp1uYbOoL29st2x/z2HGnECGwZshzK6NCEZ1GUvaaig+6W4wLtCKn6x2/OgEK8vJI8vp
 RUSsDW5kZ1CmcExdNC+YuYx3UhxirKW29hkbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716881890; x=1717486690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHdXY7trRCe9IqJRK/4uBBat10D4WSsZDyKrE9GQue8=;
 b=PCe6iyveRJ24MRZVR0eRX1i4+X54SavKc8PE04clTZENVTttKbpWnTdwp6KkxLd1lm
 wH0XRPiWip4yx9Ctvf7ZGva5sW5I9lXTlEZ5AvQTMLhPdur2JFUCqZX/L6sWCvpYaD8T
 pMzvhtUwsHWWM1nUFiRhSoXH0+ZBEKZykqA3gWeRPfoU02i9RGuU9gRkIPI4ZI4+eGWw
 G8H+vh0UAFHvw9zvkorrMrwarpEFyGY52jwT5aXHyVqt77yfAQGKZzPQgMquhGShrTGB
 dWEfYYuwvogCbLKg8mh7wvcDASfZO0gtw9aONTgc6CSTNmy8uGNP30N+SCnzmEmCQdrP
 jCFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9T0AK/jKuLCWlppHDYBei85BEVndCxWfachuH8ucArrX2zqHxp4rvZfydMPAbidK+m74IMEPGV+u8hiOx1LB2OBBAiXR/HLPRi3rq0yWm
X-Gm-Message-State: AOJu0YwQTtzk6N1POpAjTC6vqpxji6dHANvkws673mVe2XJjAA9+HfQI
 sklnZ5WnzzpZA9L/CmlM9QR6a1IKVQCAzWbchAzqvcnmFRaWm6yT9Fjb6IoEAqi/vzWPFr9FkuU
 vfEehQDLjwwlDyyDxBU5P8cA8MGaxJAKjGqFA
X-Google-Smtp-Source: AGHT+IEESmnCk94ID8RyrB6cRTBo9f0DWrhYYsx4FRrRpoOrxYJNYHEAK+0vR3o7nbq7TzrcAkc8czY/yq0ZvncHf9E=
X-Received: by 2002:ac2:4a6e:0:b0:51f:2f2:d66 with SMTP id
 2adb3069b0e04-52967465409mr9501570e87.61.1716881890203; 
 Tue, 28 May 2024 00:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-18-yunfei.dong@mediatek.com>
 <CAGXv+5FR8iLHgJGJP0C3UKhVXGzf7y44YUggpe3M=gB1mYtJ5A@mail.gmail.com>
In-Reply-To: <CAGXv+5FR8iLHgJGJP0C3UKhVXGzf7y44YUggpe3M=gB1mYtJ5A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 May 2024 15:37:59 +0800
Message-ID: <CAGXv+5HjEo3a2BSaUunVqv-eFJoKpn5FNC91P33D=-wf=-voYQ@mail.gmail.com>
Subject: Re: [PATCH v6,17/24] media: mediatek: vcodec: re-construct h264
 driver to support svp mode
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 27, 2024 at 1:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek=
.com> wrote:
> >
> > Need secure buffer size to convert secure handle to secure
> > pa in optee-os, re-construct the vsi struct to store each
> > secure buffer size.
> >
> > Separate svp and normal wait interrupt condition for svp mode
> > waiting hardware interrupt in optee-os.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../decoder/vdec/vdec_h264_req_multi_if.c     | 261 +++++++++++-------
> >  .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
> >  2 files changed, 168 insertions(+), 102 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h=
264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vd=
ec_h264_req_multi_if.c
> > index d7fec1887ab5..40836673f7fe 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req=
_multi_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req=
_multi_if.c
> > @@ -60,14 +60,36 @@ struct vdec_h264_slice_lat_dec_param {
> >   * @crc:               Used to check whether hardware's status is righ=
t
> >   */
> >  struct vdec_h264_slice_info {
> > +       u64 wdma_end_addr_offset;
> >         u16 nal_info;
> >         u16 timeout;
> > -       u32 bs_buf_size;
> > -       u64 bs_buf_addr;
> > -       u64 y_fb_dma;
> > -       u64 c_fb_dma;
> >         u64 vdec_fb_va;
> >         u32 crc[8];
> > +       u32 reserved;
> > +};
> > +
> > +/*
> > + * struct vdec_h264_slice_mem - memory address and size
> > + */
> > +struct vdec_h264_slice_mem {
> > +       union {
> > +               u64 buf;
> > +               u64 dma_addr;
> > +       };
> > +       union {
> > +               size_t size;
> > +               u64 dma_addr_end;
> > +       };
> > +};
> > +
> > +/**
> > + * struct vdec_h264_slice_fb - frame buffer for decoding
> > + * @y:  current y buffer address info
> > + * @c:  current c buffer address info
> > + */
> > +struct vdec_h264_slice_fb {
> > +       struct vdec_h264_slice_mem y;
> > +       struct vdec_h264_slice_mem c;
> >  };
> >
> >  /**
> > @@ -92,18 +114,16 @@ struct vdec_h264_slice_info {
> >   */
> >  struct vdec_h264_slice_vsi {
> >         /* LAT dec addr */
> > -       u64 wdma_err_addr;
> > -       u64 wdma_start_addr;
> > -       u64 wdma_end_addr;
> > -       u64 slice_bc_start_addr;
> > -       u64 slice_bc_end_addr;
> > -       u64 row_info_start_addr;
> > -       u64 row_info_end_addr;
> > -       u64 trans_start;
> > -       u64 trans_end;
> > -       u64 wdma_end_addr_offset;
> > +       struct vdec_h264_slice_mem bs;
> > +       struct vdec_h264_slice_fb fb;
> >
> > -       u64 mv_buf_dma[H264_MAX_MV_NUM];
> > +       struct vdec_h264_slice_mem ube;
> > +       struct vdec_h264_slice_mem trans;
> > +       struct vdec_h264_slice_mem row_info;
> > +       struct vdec_h264_slice_mem err_map;
> > +       struct vdec_h264_slice_mem slice_bc;
> > +
> > +       struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
> >         struct vdec_h264_slice_info dec;
> >         struct vdec_h264_slice_lat_dec_param h264_slice_params;
> >  };
>
> Hard NAK.
>
> You are changing the interface with the firmware without any backward
> compatibility. This breaks H.264 decoding on other platforms that use
> this code path, including MT8192, MT8195, and MT8186. You cannot just
> consider the current platform you are working on.
>
> This is already showing in our downstream test results for Asurada / MT81=
92
> on v6.1, same branch as MT8188, which has these patches applied.

Also breaks MT8195 Cherry video decoding on v6.10-rc1 with all patches appl=
ied.

ChenYu

> The kernel needs to be able to run with older firmware. The firmware
> needs to signal that it wants the new layout either with a version
> number (which probably won't work with SCP here) or with capability
> flags, like with 4K or AV1 or HEVC support we had before. The kernel
> driver sees the capability flag and uses the new data structures.
>
> Or you make changes to the layout in some backward compatible way, like
> only expanding the data structure and keeping all the old fields, and
> duplicating fields for new structures you add.
>
>
> Regards
> ChenYu
>
> > @@ -392,6 +412,100 @@ static void vdec_h264_slice_get_crop_info(struct =
vdec_h264_slice_inst *inst,
> >                        cr->left, cr->top, cr->width, cr->height);
> >  }
> >
> > +static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_in=
st *inst,
> > +                                            struct mtk_vcodec_mem *bs,
> > +                                            struct vdec_lat_buf *lat_b=
uf)
> > +{
> > +       struct mtk_vcodec_mem *mem;
> > +       int i;
> > +
> > +       inst->vsi->bs.dma_addr =3D (u64)bs->dma_addr;
> > +       inst->vsi->bs.size =3D bs->size;
> > +
> > +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > +               mem =3D &inst->mv_buf[i];
> > +               inst->vsi->mv_buf_dma[i].dma_addr =3D mem->dma_addr;
> > +               inst->vsi->mv_buf_dma[i].size =3D mem->size;
> > +       }
> > +       inst->vsi->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_addr.d=
ma_addr;
> > +       inst->vsi->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.size;
> > +
> > +       inst->vsi->row_info.dma_addr =3D 0;
> > +       inst->vsi->row_info.size =3D 0;
> > +
> > +       inst->vsi->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma_addr=
;
> > +       inst->vsi->err_map.size =3D lat_buf->wdma_err_addr.size;
> > +
> > +       inst->vsi->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.dma_add=
r;
> > +       inst->vsi->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> > +
> > +       inst->vsi->trans.dma_addr_end =3D inst->ctx->msg_queue.wdma_rpt=
r_addr;
> > +       inst->vsi->trans.dma_addr =3D inst->ctx->msg_queue.wdma_wptr_ad=
dr;
> > +}
> > +
> > +static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_in=
st *inst,
> > +                                            struct vdec_h264_slice_sha=
re_info *share_info,
> > +                                            struct vdec_lat_buf *lat_b=
uf)
> > +{
> > +       struct mtk_vcodec_mem *mem;
> > +       struct mtk_vcodec_dec_ctx *ctx =3D inst->ctx;
> > +       struct vb2_v4l2_buffer *vb2_v4l2;
> > +       struct vdec_fb *fb;
> > +       u64 y_fb_dma, c_fb_dma =3D 0;
> > +       int i;
> > +
> > +       fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> > +       if (!fb) {
> > +               mtk_vdec_err(ctx, "fb buffer is NULL");
> > +               return -EBUSY;
> > +       }
> > +
> > +       y_fb_dma =3D (u64)fb->base_y.dma_addr;
> > +       if (!ctx->is_secure_playback) {
> > +               if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes =3D=3D =
1)
> > +                       c_fb_dma =3D
> > +                               y_fb_dma + inst->ctx->picinfo.buf_w * i=
nst->ctx->picinfo.buf_h;
> > +               else
> > +                       c_fb_dma =3D (u64)fb->base_c.dma_addr;
> > +       }
> > +
> > +       mtk_vdec_debug(ctx, "[h264-core] y/c addr =3D 0x%llx 0x%llx", y=
_fb_dma, c_fb_dma);
> > +
> > +       inst->vsi_core->fb.y.dma_addr =3D y_fb_dma;
> > +       inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[0];
> > +       inst->vsi_core->fb.c.dma_addr =3D c_fb_dma;
> > +       inst->vsi_core->fb.c.size =3D ctx->picinfo.fb_sz[1];
> > +
> > +       inst->vsi_core->dec.vdec_fb_va =3D (unsigned long)fb;
> > +       inst->vsi_core->dec.nal_info =3D share_info->nal_info;
> > +
> > +       inst->vsi_core->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_a=
ddr.dma_addr;
> > +       inst->vsi_core->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.=
size;
> > +
> > +       inst->vsi_core->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma=
_addr;
> > +       inst->vsi_core->err_map.size =3D lat_buf->wdma_err_addr.size;
> > +
> > +       inst->vsi_core->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.dm=
a_addr;
> > +       inst->vsi_core->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> > +
> > +       inst->vsi_core->row_info.dma_addr =3D 0;
> > +       inst->vsi_core->row_info.size =3D 0;
> > +
> > +       inst->vsi_core->trans.dma_addr =3D share_info->trans_start;
> > +       inst->vsi_core->trans.dma_addr_end =3D share_info->trans_end;
> > +
> > +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > +               mem =3D &inst->mv_buf[i];
> > +               inst->vsi_core->mv_buf_dma[i].dma_addr =3D mem->dma_add=
r;
> > +               inst->vsi_core->mv_buf_dma[i].size =3D mem->size;
> > +       }
> > +
> > +       vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > +       v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> > +
> > +       return 0;
> > +}
> > +
> >  static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
> >  {
> >         struct vdec_h264_slice_inst *inst;
> > @@ -457,64 +571,22 @@ static void vdec_h264_slice_deinit(void *h_vdec)
> >
> >  static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
> >  {
> > -       struct vdec_fb *fb;
> > -       u64 vdec_fb_va;
> > -       u64 y_fb_dma, c_fb_dma;
> > -       int err, timeout, i;
> > +       int err, timeout;
> >         struct mtk_vcodec_dec_ctx *ctx =3D lat_buf->ctx;
> >         struct vdec_h264_slice_inst *inst =3D ctx->drv_handle;
> > -       struct vb2_v4l2_buffer *vb2_v4l2;
> >         struct vdec_h264_slice_share_info *share_info =3D lat_buf->priv=
ate_data;
> > -       struct mtk_vcodec_mem *mem;
> >         struct vdec_vpu_inst *vpu =3D &inst->vpu;
> >
> >         mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
> >         memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_sl=
ice_params,
> >                sizeof(share_info->h264_slice_params));
> >
> > -       fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> > -       if (!fb) {
> > -               err =3D -EBUSY;
> > -               mtk_vdec_err(ctx, "fb buffer is NULL");
> > +       err =3D vdec_h264_slice_setup_core_buffer(inst, share_info, lat=
_buf);
> > +       if (err)
> >                 goto vdec_dec_end;
> > -       }
> > -
> > -       vdec_fb_va =3D (unsigned long)fb;
> > -       y_fb_dma =3D (u64)fb->base_y.dma_addr;
> > -       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes =3D=3D 1)
> > -               c_fb_dma =3D
> > -                       y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx=
->picinfo.buf_h;
> > -       else
> > -               c_fb_dma =3D (u64)fb->base_c.dma_addr;
> > -
> > -       mtk_vdec_debug(ctx, "[h264-core] y/c addr =3D 0x%llx 0x%llx", y=
_fb_dma, c_fb_dma);
> > -
> > -       inst->vsi_core->dec.y_fb_dma =3D y_fb_dma;
> > -       inst->vsi_core->dec.c_fb_dma =3D c_fb_dma;
> > -       inst->vsi_core->dec.vdec_fb_va =3D vdec_fb_va;
> > -       inst->vsi_core->dec.nal_info =3D share_info->nal_info;
> > -       inst->vsi_core->wdma_start_addr =3D
> > -               lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
> > -       inst->vsi_core->wdma_end_addr =3D
> > -               lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
> > -               lat_buf->ctx->msg_queue.wdma_addr.size;
> > -       inst->vsi_core->wdma_err_addr =3D lat_buf->wdma_err_addr.dma_ad=
dr;
> > -       inst->vsi_core->slice_bc_start_addr =3D lat_buf->slice_bc_addr.=
dma_addr;
> > -       inst->vsi_core->slice_bc_end_addr =3D lat_buf->slice_bc_addr.dm=
a_addr +
> > -               lat_buf->slice_bc_addr.size;
> > -       inst->vsi_core->trans_start =3D share_info->trans_start;
> > -       inst->vsi_core->trans_end =3D share_info->trans_end;
> > -       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > -               mem =3D &inst->mv_buf[i];
> > -               inst->vsi_core->mv_buf_dma[i] =3D mem->dma_addr;
> > -       }
> > -
> > -       vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > -       v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> >
> >         vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264=
_slice_params,
> >                                             share_info);
> > -
> >         err =3D vpu_dec_core(vpu);
> >         if (err) {
> >                 mtk_vdec_err(ctx, "core decode err=3D%d", err);
> > @@ -573,12 +645,11 @@ static int vdec_h264_slice_lat_decode(void *h_vde=
c, struct mtk_vcodec_mem *bs,
> >         struct vdec_h264_slice_inst *inst =3D h_vdec;
> >         struct vdec_vpu_inst *vpu =3D &inst->vpu;
> >         struct mtk_video_dec_buf *src_buf_info;
> > -       int nal_start_idx, err, timeout =3D 0, i;
> > +       int nal_start_idx, err, timeout =3D 0;
> >         unsigned int data[2];
> >         struct vdec_lat_buf *lat_buf;
> >         struct vdec_h264_slice_share_info *share_info;
> >         unsigned char *buf;
> > -       struct mtk_vcodec_mem *mem;
> >
> >         if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
> >                                 vdec_h264_slice_core_decode,
> > @@ -617,11 +688,9 @@ static int vdec_h264_slice_lat_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs,
> >         if (err)
> >                 goto err_free_fb_out;
> >
> > -       vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
> > -                                  &share_info->h264_slice_params.pps);
> > -
> > -       inst->vsi->dec.bs_buf_addr =3D (uint64_t)bs->dma_addr;
> > -       inst->vsi->dec.bs_buf_size =3D bs->size;
> > +       if (!inst->ctx->is_secure_playback)
> > +               vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->si=
ze,
> > +                                          &share_info->h264_slice_para=
ms.pps);
> >
> >         *res_chg =3D inst->resolution_changed;
> >         if (inst->resolution_changed) {
> > @@ -634,38 +703,27 @@ static int vdec_h264_slice_lat_decode(void *h_vde=
c, struct mtk_vcodec_mem *bs,
> >                 }
> >                 inst->resolution_changed =3D false;
> >         }
> > -       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> > -               mem =3D &inst->mv_buf[i];
> > -               inst->vsi->mv_buf_dma[i] =3D mem->dma_addr;
> > -       }
> > -       inst->vsi->wdma_start_addr =3D lat_buf->ctx->msg_queue.wdma_add=
r.dma_addr;
> > -       inst->vsi->wdma_end_addr =3D lat_buf->ctx->msg_queue.wdma_addr.=
dma_addr +
> > -               lat_buf->ctx->msg_queue.wdma_addr.size;
> > -       inst->vsi->wdma_err_addr =3D lat_buf->wdma_err_addr.dma_addr;
> > -       inst->vsi->slice_bc_start_addr =3D lat_buf->slice_bc_addr.dma_a=
ddr;
> > -       inst->vsi->slice_bc_end_addr =3D lat_buf->slice_bc_addr.dma_add=
r +
> > -               lat_buf->slice_bc_addr.size;
> > -
> > -       inst->vsi->trans_end =3D inst->ctx->msg_queue.wdma_rptr_addr;
> > -       inst->vsi->trans_start =3D inst->ctx->msg_queue.wdma_wptr_addr;
> > -       mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%llx) err:0x%llx"=
,
> > -                      inst->vsi->wdma_start_addr,
> > -                      inst->vsi->wdma_end_addr,
> > -                      inst->vsi->wdma_err_addr);
> > -
> > -       mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%llx) rprt((0x%llx 0x=
%llx))",
> > -                      inst->vsi->slice_bc_start_addr,
> > -                      inst->vsi->slice_bc_end_addr,
> > -                      inst->vsi->trans_start,
> > -                      inst->vsi->trans_end);
> > +
> > +       vdec_h264_slice_setup_lat_buffer(inst, bs, lat_buf);
> > +       mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
> > +                      inst->vsi->ube.dma_addr, (unsigned long)inst->vs=
i->ube.size,
> > +                      inst->vsi->err_map.dma_addr);
> > +
> > +       mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%=
llx))",
> > +                      inst->vsi->slice_bc.dma_addr, (unsigned long)ins=
t->vsi->slice_bc.size,
> > +                      inst->vsi->trans.dma_addr, inst->vsi->trans.dma_=
addr_end);
> >         err =3D vpu_dec_start(vpu, data, 2);
> >         if (err) {
> >                 mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
> >                 goto err_free_fb_out;
> >         }
> >
> > -       share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.dma_ad=
dr +
> > -               inst->vsi->wdma_end_addr_offset;
> > +       if (inst->ctx->is_secure_playback)
> > +               share_info->trans_end =3D inst->vsi->dec.wdma_end_addr_=
offset;
> > +       else
> > +               share_info->trans_end =3D inst->ctx->msg_queue.wdma_add=
r.dma_addr +
> > +                       inst->vsi->dec.wdma_end_addr_offset;
> > +
> >         share_info->trans_start =3D inst->ctx->msg_queue.wdma_wptr_addr=
;
> >         share_info->nal_info =3D inst->vsi->dec.nal_info;
> >
> > @@ -691,8 +749,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs,
> >                 return -EINVAL;
> >         }
> >
> > -       share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.dma_ad=
dr +
> > -               inst->vsi->wdma_end_addr_offset;
> > +       if (inst->ctx->is_secure_playback)
> > +               share_info->trans_end =3D inst->vsi->dec.wdma_end_addr_=
offset;
> > +       else
> > +               share_info->trans_end =3D inst->ctx->msg_queue.wdma_add=
r.dma_addr +
> > +                       inst->vsi->dec.wdma_end_addr_offset;
> >         vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_=
info->trans_end);
> >
> >         if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
> > @@ -737,10 +798,10 @@ static int vdec_h264_slice_single_decode(void *h_=
vdec, struct mtk_vcodec_mem *bs
> >         mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=3D%llx c_dma=
=3D%llx",
> >                        inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma=
);
> >
> > -       inst->vsi_ctx.dec.bs_buf_addr =3D (u64)bs->dma_addr;
> > -       inst->vsi_ctx.dec.bs_buf_size =3D bs->size;
> > -       inst->vsi_ctx.dec.y_fb_dma =3D y_fb_dma;
> > -       inst->vsi_ctx.dec.c_fb_dma =3D c_fb_dma;
> > +       inst->vsi_ctx.bs.dma_addr =3D (u64)bs->dma_addr;
> > +       inst->vsi_ctx.bs.size =3D bs->size;
> > +       inst->vsi_ctx.fb.y.dma_addr =3D y_fb_dma;
> > +       inst->vsi_ctx.fb.c.dma_addr =3D c_fb_dma;
> >         inst->vsi_ctx.dec.vdec_fb_va =3D (u64)(uintptr_t)fb;
> >
> >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> > @@ -770,7 +831,7 @@ static int vdec_h264_slice_single_decode(void *h_vd=
ec, struct mtk_vcodec_mem *bs
> >
> >                 for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> >                         mem =3D &inst->mv_buf[i];
> > -                       inst->vsi_ctx.mv_buf_dma[i] =3D mem->dma_addr;
> > +                       inst->vsi_ctx.mv_buf_dma[i].dma_addr =3D mem->d=
ma_addr;
> >                 }
> >         }
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_qu=
eue.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> > index f283c4703dc6..c1310176ae05 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> > @@ -308,8 +308,13 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg=
_queue,
> >                 msg_queue->wdma_addr.size =3D 0;
> >                 return -ENOMEM;
> >         }
> > -       msg_queue->wdma_rptr_addr =3D msg_queue->wdma_addr.dma_addr;
> > -       msg_queue->wdma_wptr_addr =3D msg_queue->wdma_addr.dma_addr;
> > +       if (ctx->is_secure_playback) {
> > +               msg_queue->wdma_rptr_addr =3D 0;
> > +               msg_queue->wdma_wptr_addr =3D 0;
> > +       } else {
> > +               msg_queue->wdma_rptr_addr =3D msg_queue->wdma_addr.dma_=
addr;
> > +               msg_queue->wdma_wptr_addr =3D msg_queue->wdma_addr.dma_=
addr;
> > +       }
> >
> >         msg_queue->empty_lat_buf.ctx =3D ctx;
> >         msg_queue->empty_lat_buf.core_decode =3D NULL;
> > --
> > 2.25.1
> >
