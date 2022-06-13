Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BD549E8C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4098C10F7D4;
	Mon, 13 Jun 2022 20:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569710F7D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 20:08:03 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id ea7so5050301qvb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=xifdCraHcIxYY3MTfP8K7bOdeapBu8VZQjERub4Anzs=;
 b=gh+Q42U23TeefnkyOKLrRV86U/g+jPWh07ZDRJUOE0F3bBwPYlZOJ/FqX9+IfUN6do
 sw0mmi8UZNobznXi61Q4oGCRIhIawAlspkbEEScragHLEBGWh/kdvUGm3fdg/qmWNdX0
 MEAhWySUgRVw42NcJvJTKfezi2QHUj47Gdrp9ct2KzfMNpcFlNlQ5dYp47IXrcDKZiDO
 o0C9V2+H/VPfeKmShxPqHosFJ3x8KFF5zhxFRqlA+UuGg+ISCyDRLixEZpPvCqgyg0MK
 1OvSP/WrDHbglZk7fagp0GTxQwFj8uF/9mnwva+ATrIj60He6mw1uD/che+0Rstjlsmv
 ZCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=xifdCraHcIxYY3MTfP8K7bOdeapBu8VZQjERub4Anzs=;
 b=7ataCo50wdF1/FpDy/X20bErG6EAmAXp7p8w2fLiWFuELcglRxNink0TejobsVr3vd
 cchn90N3YjDcjf7e3Vjyr0bLJP0RN1QkOmooyQnOYepV3wtG6tAl/FgPBalBtRQY2JE5
 zGKNTdWAEr/Kuuo6odatBvRrlxkaWYPiBqSXPJTi9EjMxpCsYn3vB6/ebFMYV6nU/wRU
 YHZQiIHJv4gyba03rZvWgo+4/eK4iiYpN5yIZIQ4t/+gBGA9On8wFpGGB4fWjoXG4ZyQ
 l69H2r9bW4BJN7V2vOeGV6jMDQhvVp8DVoIuyziR/s7fRsNFpPUTyQtyEyarXS2zm8yo
 bhXA==
X-Gm-Message-State: AJIora8JULF/oqwY/hQkU7l0D8TYgk1MFSfqWsMLNawR6PP2KvN1pmKK
 Aiv+8up7G+CAiFeIQff+ZqBydA==
X-Google-Smtp-Source: AGRyM1u9Ap8wS24rhb3V+Pafk33dKY/7Pd5la6pC2oAyYBumIK0XXUWKRiyMu3xC9PTG0GoZsuGV8A==
X-Received: by 2002:a05:6214:c45:b0:46b:bd43:6dfe with SMTP id
 r5-20020a0562140c4500b0046bbd436dfemr722356qvj.93.1655150882330; 
 Mon, 13 Jun 2022 13:08:02 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 br30-20020a05620a461e00b006a726b03ad1sm7530996qkb.52.2022.06.13.13.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:08:01 -0700 (PDT)
Message-ID: <7c0ab49b01c4e80835000eb1d3fd58db542385f2.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 3/3] media: mediatek: vcodec: add h264 decoder
 driver for mt8186
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Date: Mon, 13 Jun 2022 16:08:00 -0400
In-Reply-To: <20220512034620.30500-4-yunfei.dong@mediatek.com>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
 <20220512034620.30500-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
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
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeudi 12 mai 2022 =C3=A0 11:46 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> Add h264 decode driver to support mt8186. For the architecture
> is single core, need to add new interface to decode.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../vcodec/vdec/vdec_h264_req_multi_if.c      | 177 +++++++++++++++++-
>  1 file changed, 176 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_mu=
lti_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_=
if.c
> index a96f203b5d54..1d9e753cf894 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.=
c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.=
c
> @@ -140,6 +140,9 @@ struct vdec_h264_slice_share_info {
>   * @vsi:		vsi used for lat
>   * @vsi_core:		vsi used for core
>   *
> + * @vsi_ctx:		Local VSI data for this decoding context
> + * @h264_slice_param:	the parameters that hardware use to decode
> + *
>   * @resolution_changed:resolution changed
>   * @realloc_mv_buf:	reallocate mv buffer
>   * @cap_num_planes:	number of capture queue plane
> @@ -157,6 +160,9 @@ struct vdec_h264_slice_inst {
>  	struct vdec_h264_slice_vsi *vsi;
>  	struct vdec_h264_slice_vsi *vsi_core;
> =20
> +	struct vdec_h264_slice_vsi vsi_ctx;
> +	struct vdec_h264_slice_lat_dec_param h264_slice_param;
> +
>  	unsigned int resolution_changed;
>  	unsigned int realloc_mv_buf;
>  	unsigned int cap_num_planes;
> @@ -208,6 +214,61 @@ static int vdec_h264_slice_fill_decode_parameters(st=
ruct vdec_h264_slice_inst *i
>  	return 0;
>  }
> =20
> +static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *i=
nst)
> +{
> +	const struct v4l2_ctrl_h264_decode_params *dec_params;
> +	const struct v4l2_ctrl_h264_sps *sps;
> +	const struct v4l2_ctrl_h264_pps *pps;
> +	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> +	struct vdec_h264_slice_lat_dec_param *slice_param =3D &inst->h264_slice=
_param;
> +	struct v4l2_h264_reflist_builder reflist_builder;
> +	u8 *p0_reflist =3D slice_param->decode_params.ref_pic_list_p0;
> +	u8 *b0_reflist =3D slice_param->decode_params.ref_pic_list_b0;
> +	u8 *b1_reflist =3D slice_param->decode_params.ref_pic_list_b1;
> +
> +	dec_params =3D
> +		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_P=
ARAMS);
> +	if (IS_ERR(dec_params))
> +		return PTR_ERR(dec_params);
> +
> +	sps =3D mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_S=
PS);
> +	if (IS_ERR(sps))
> +		return PTR_ERR(sps);
> +
> +	pps =3D mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_P=
PS);
> +	if (IS_ERR(pps))
> +		return PTR_ERR(pps);
> +
> +	scaling_matrix =3D
> +		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SCALING_=
MATRIX);
> +	if (IS_ERR(scaling_matrix))
> +		return PTR_ERR(scaling_matrix);
> +
> +	mtk_vdec_h264_update_dpb(dec_params, inst->dpb);
> +
> +	mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
> +	mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
> +	mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, scaling=
_matrix);
> +
> +	mtk_vdec_h264_copy_decode_params(&slice_param->decode_params, dec_param=
s, inst->dpb);
> +	mtk_vdec_h264_fill_dpb_info(inst->ctx, &slice_param->decode_params,
> +				    slice_param->h264_dpb_info);
> +
> +	/* Build the reference lists */
> +	v4l2_h264_init_reflist_builder(&reflist_builder, dec_params, sps, inst-=
>dpb);
> +	v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
> +
> +	v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist, b1_reflist);
> +	/* Adapt the built lists to the firmware's expectations */
> +	mtk_vdec_h264_fixup_ref_list(p0_reflist, reflist_builder.num_valid);
> +	mtk_vdec_h264_fixup_ref_list(b0_reflist, reflist_builder.num_valid);
> +	mtk_vdec_h264_fixup_ref_list(b1_reflist, reflist_builder.num_valid);
> +	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
> +	       sizeof(inst->vsi_ctx.h264_slice_params));

This function looks very redundant across multiple variants, could you try =
and
make a helper to reduce the duplication ?

> +
> +	return 0;
> +}
> +
>  static void vdec_h264_slice_fill_decode_reflist(struct vdec_h264_slice_i=
nst *inst,
>  						struct vdec_h264_slice_lat_dec_param *slice_param,
>  						struct vdec_h264_slice_share_info *share_info)
> @@ -596,6 +657,120 @@ static int vdec_h264_slice_lat_decode(void *h_vdec,=
 struct mtk_vcodec_mem *bs,
>  	return err;
>  }
> =20
> +static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec=
_mem *bs,
> +					 struct vdec_fb *unused, bool *res_chg)
> +{
> +	struct vdec_h264_slice_inst *inst =3D h_vdec;
> +	struct vdec_vpu_inst *vpu =3D &inst->vpu;
> +	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
> +	struct vdec_fb *fb;
> +	unsigned char *buf;
> +	unsigned int data[2], i;
> +	u64 y_fb_dma, c_fb_dma;
> +	struct mtk_vcodec_mem *mem;
> +	int err, nal_start_idx;
> +
> +	/* bs NULL means flush decoder */
> +	if (!bs)
> +		return vpu_dec_reset(vpu);
> +
> +	fb =3D inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
> +	src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	dst_buf_info =3D container_of(fb, struct mtk_video_dec_buf, frame_buffe=
r);
> +
> +	y_fb_dma =3D fb ? (u64)fb->base_y.dma_addr : 0;
> +	c_fb_dma =3D fb ? (u64)fb->base_c.dma_addr : 0;
> +	mtk_vcodec_debug(inst, "[h264-dec] [%d] y_dma=3D%llx c_dma=3D%llx",
> +			 inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
> +
> +	inst->vsi_ctx.dec.bs_buf_addr =3D (u64)bs->dma_addr;
> +	inst->vsi_ctx.dec.bs_buf_size =3D bs->size;
> +	inst->vsi_ctx.dec.y_fb_dma =3D y_fb_dma;
> +	inst->vsi_ctx.dec.c_fb_dma =3D c_fb_dma;
> +	inst->vsi_ctx.dec.vdec_fb_va =3D (u64)(uintptr_t)fb;
> +
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &dst_buf_info->m2m_buf.vb, true);
> +	err =3D get_vdec_sig_decode_parameters(inst);
> +	if (err)
> +		goto err_free_fb_out;
> +
> +	buf =3D (unsigned char *)bs->va;
> +	nal_start_idx =3D mtk_vdec_h264_find_start_code(buf, bs->size);
> +	if (nal_start_idx < 0) {
> +		err =3D -EINVAL;
> +		goto err_free_fb_out;
> +	}
> +	inst->vsi_ctx.dec.nal_info =3D buf[nal_start_idx];
> +
> +	*res_chg =3D inst->resolution_changed;
> +	if (inst->resolution_changed) {
> +		mtk_vcodec_debug(inst, "- resolution changed -");
> +		if (inst->realloc_mv_buf) {
> +			err =3D vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
> +			inst->realloc_mv_buf =3D false;
> +			if (err)
> +				goto err_free_fb_out;
> +		}
> +		inst->resolution_changed =3D false;
> +
> +		for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> +			mem =3D &inst->mv_buf[i];
> +			inst->vsi_ctx.mv_buf_dma[i] =3D mem->dma_addr;
> +		}
> +	}
> +
> +	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
> +	err =3D vpu_dec_start(vpu, data, 2);
> +	if (err)
> +		goto err_free_fb_out;
> +
> +	/* wait decoder done interrupt */
> +	err =3D mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
> +					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
> +	if (err)
> +		mtk_vcodec_err(inst, "decode timeout: pic_%d",
> +			       inst->ctx->decoded_frame_cnt);
> +
> +	inst->vsi->dec.timeout =3D !!err;
> +	err =3D vpu_dec_end(vpu);
> +	if (err)
> +		goto err_free_fb_out;
> +
> +	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
> +	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x=
 0x%x",
> +			 inst->ctx->decoded_frame_cnt,
> +			 inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
> +			 inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
> +			 inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
> +			 inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
> +
> +	inst->ctx->decoded_frame_cnt++;
> +	return 0;
> +
> +err_free_fb_out:
> +	mtk_vcodec_err(inst, "dec frame number: %d err: %d",
> +		       inst->ctx->decoded_frame_cnt, err);
> +	return err;
> +}
> +
> +static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *b=
s,
> +				  struct vdec_fb *unused, bool *res_chg)
> +{
> +	struct vdec_h264_slice_inst *inst =3D h_vdec;
> +	int ret;
> +
> +	if (!h_vdec)
> +		return -EINVAL;
> +
> +	if (inst->ctx->dev->vdec_pdata->hw_arch =3D=3D MTK_VDEC_PURE_SINGLE_COR=
E)
> +		ret =3D vdec_h264_slice_single_decode(h_vdec, bs, unused, res_chg);
> +	else
> +		ret =3D vdec_h264_slice_lat_decode(h_vdec, bs, unused, res_chg);
> +
> +	return ret;
> +}
> +
>  static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_t=
ype type,
>  				     void *out)
>  {
> @@ -620,7 +795,7 @@ static int vdec_h264_slice_get_param(void *h_vdec, en=
um vdec_get_param_type type
> =20
>  const struct vdec_common_if vdec_h264_slice_multi_if =3D {
>  	.init		=3D vdec_h264_slice_init,
> -	.decode		=3D vdec_h264_slice_lat_decode,
> +	.decode		=3D vdec_h264_slice_decode,
>  	.get_param	=3D vdec_h264_slice_get_param,
>  	.deinit		=3D vdec_h264_slice_deinit,
>  };

