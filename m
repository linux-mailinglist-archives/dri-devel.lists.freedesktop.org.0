Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B678CFB24
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8B10F95E;
	Mon, 27 May 2024 08:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ALkYoEfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CAB10F95E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 08:19:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so4796691e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716797970; x=1717402770;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZUe7DIvArz3n1ykN9cVWpsQE+NjHm9EnxfeFqL1+IA=;
 b=ALkYoEfkTsalIYd90eN7kbg34D5GlKuJwdjF52EhwwVx6RzvUCvdHM7WI7JfJQwdhG
 2/qRPBdxaMWu8o2h/ZG6AkA1U5bbZk11BfySyf24E6aYg+pyUqWk4xwsuqqxeczyyFLG
 04pPUXKDzZr9JGmVSAMVKc7r2HB2NcyE6e54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716797970; x=1717402770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZUe7DIvArz3n1ykN9cVWpsQE+NjHm9EnxfeFqL1+IA=;
 b=gna1btfap/UvD0BXA3AUYxHlDkMAJ+vrDUovulgsHras+12Id2tL4ZfnMpj1CItiQW
 lXlUhJorXEoWLsDcAr1Y3VmXelUO1Kfc4+ixUmvreH6NmfcIAbdosh+k2ajc3B1M0GkR
 2H1hygnjGPVIxP7HTFwgbhNuG9fTZd9JWApKxpdPFOSLbJzWs/mBO+/bn5aiUhn+cral
 3lsiSawJ3NJhuucrGZFmew4XLaeK6TQIXZzpAsNNnEl0VD9Ek6pQygsl4fCZQsP0x64Y
 iHj4QXfR0lKUo5TIM48Qqy+mCA1nABOZtVh4XorMTfb/czwxM6UelDDssayvb/xkQ/od
 UeoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg36Ircr49euLAFkYlhvyAd7OZ3SIPpZCLwTv96PYzFPgvjkiTg77v/b96PJY0M9dKuCR1wHs2FkyDpueQr8JG8Yib0rup7hTONps7d9yB
X-Gm-Message-State: AOJu0YzqJ0JeY5JVT1arbbg2Ev5/MnU5xwAtPV8rO1t1Yod2WskPguSG
 jOFpwFnZW44o9yxdWMZbDMZLH3mG2ItT9lD/6rl/lVwhg+SHP3uOGx5EhuJhfpzT3DeCPmbjghs
 uyBeqdLMWzF79pUWApTza5A50Qy2NODxqPqKI
X-Google-Smtp-Source: AGHT+IGSDgYGfmlxT8nBsMTbI8Am1JUNIpZlJd7e7q6U8OmHvqxiI5dM+HF1/Yffodo/j4NV3nOKgOlOT2VF/OnaM5U=
X-Received: by 2002:a05:6512:488c:b0:51a:cdc4:dd48 with SMTP id
 2adb3069b0e04-527eee35cd8mr3593718e87.3.1716797969857; Mon, 27 May 2024
 01:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-9-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-9-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 16:19:18 +0800
Message-ID: <CAGXv+5FN9m7fp8tXkzEqkwZ33BCW8GZSJ2iNm+gXpHXQ7xevuw@mail.gmail.com>
Subject: Re: [PATCH v6,08/24] media: mediatek: vcodec: add tee client
 interface to communiate with optee-os
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
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

Hi,

On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Open tee context to initialize the environment in order to communication
> with optee-os, then open tee session as the communication pipeline for
> lat and core to send data for hardware decode.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/decoder/Makefile |   1 +
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
>  .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 165 ++++++++++++++++++
>  .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  73 ++++++++
>  4 files changed, 244 insertions(+)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vc=
odec_dec_optee.c
>  create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vc=
odec_dec_optee.h
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/Makefile b/dr=
ivers/media/platform/mediatek/vcodec/decoder/Makefile
> index 904cd22def84..1624933dfd5e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/Makefile
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
> @@ -21,5 +21,6 @@ mtk-vcodec-dec-y :=3D vdec/vdec_h264_if.o \
>                 mtk_vcodec_dec_stateful.o \
>                 mtk_vcodec_dec_stateless.o \
>                 mtk_vcodec_dec_pm.o \
> +               mtk_vcodec_dec_optee.o \
>
>  mtk-vcodec-dec-hw-y :=3D mtk_vcodec_dec_hw.o
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index f975db4293da..76a0323f993c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -11,6 +11,7 @@
>  #include "../common/mtk_vcodec_dbgfs.h"
>  #include "../common/mtk_vcodec_fw_priv.h"
>  #include "../common/mtk_vcodec_util.h"
> +#include "mtk_vcodec_dec_optee.h"
>  #include "vdec_msg_queue.h"
>
>  #define MTK_VCODEC_DEC_NAME    "mtk-vcodec-dec"
> @@ -261,6 +262,8 @@ struct mtk_vcodec_dec_ctx {
>   * @dbgfs: debug log related information
>   *
>   * @chip_name: used to distinguish platforms and select the correct code=
c configuration values
> + *
> + * @optee_private: optee private data
>   */
>  struct mtk_vcodec_dec_dev {
>         struct v4l2_device v4l2_dev;
> @@ -303,6 +306,8 @@ struct mtk_vcodec_dec_dev {
>         struct mtk_vcodec_dbgfs dbgfs;
>
>         enum mtk_vcodec_dec_chip_name chip_name;
> +
> +       struct mtk_vdec_optee_private *optee_private;
>  };
>
>  static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *f=
h)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_o=
ptee.c
> new file mode 100644
> index 000000000000..38d9c1c1785a
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee=
.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include "mtk_vcodec_dec_drv.h"
> +#include "mtk_vcodec_dec_optee.h"
> +
> +/*
> + * Randomly generated, and must correspond to the GUID on the TA side.
> + */
> +static const uuid_t mtk_vdec_lat_uuid =3D
> +       UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
> +                 0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x90);
> +
> +static const uuid_t mtk_vdec_core_uuid =3D
> +       UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
> +                 0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x91);
> +
> +/*
> + * Check whether this driver supports decoder TA in the TEE instance,
> + * represented by the params (ver/data) of this function.
> + */
> +static int mtk_vcodec_dec_optee_match(struct tee_ioctl_version_data *ver=
_data, const void *not_used)
> +{
> +       if (ver_data->impl_id =3D=3D TEE_IMPL_ID_OPTEE)
> +               return 1;
> +       else
> +               return 0;
> +}
> +
> +int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_=
dev)
> +{
> +       vcodec_dev->optee_private =3D devm_kzalloc(&vcodec_dev->plat_dev-=
>dev,
> +                                                sizeof(*vcodec_dev->opte=
e_private),
> +                                                GFP_KERNEL);
> +       if (!vcodec_dev->optee_private)
> +               return -ENOMEM;
> +
> +       vcodec_dev->optee_private->vcodec_dev =3D vcodec_dev;
> +
> +       atomic_set(&vcodec_dev->optee_private->tee_active_cnt, 0);
> +       mutex_init(&vcodec_dev->optee_private->tee_mutex);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
> +
> +static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_priva=
te *optee_private,
> +                                            enum mtk_vdec_hw_id hardware=
_index)
> +{
> +       struct device *dev =3D &optee_private->vcodec_dev->plat_dev->dev;
> +       struct tee_ioctl_open_session_arg session_arg;
> +       struct mtk_vdec_optee_ca_info *ca_info;
> +       int err =3D 0, session_func;
> +
> +       /* Open lat and core session with vdec TA. */
> +       switch (hardware_index) {
> +       case MTK_VDEC_LAT0:
> +               export_uuid(session_arg.uuid, &mtk_vdec_lat_uuid);
> +               session_func =3D MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND;
> +               ca_info =3D &optee_private->lat_ca;
> +               break;
> +       case MTK_VDEC_CORE:
> +               export_uuid(session_arg.uuid, &mtk_vdec_core_uuid);
> +               session_func =3D MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND;
> +               ca_info =3D &optee_private->core_ca;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       session_arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> +       session_arg.num_params =3D 0;
> +
> +       err =3D tee_client_open_session(optee_private->tee_vdec_ctx, &ses=
sion_arg, NULL);
> +       if (err < 0 || session_arg.ret !=3D 0) {
> +               dev_err(dev, MTK_DBG_VCODEC_STR "open vdec tee session fa=
il hw_id:%d err:%x.\n",
> +                       hardware_index, session_arg.ret);
> +               return -EINVAL;
> +       }
> +       ca_info->vdec_session_id =3D session_arg.session;
> +       ca_info->hw_id =3D hardware_index;
> +       ca_info->vdec_session_func =3D session_func;
> +
> +       dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d s=
ession_id=3D%x.\n",
> +               hardware_index, ca_info->vdec_session_id);
> +
> +       return err;
> +}
> +
> +static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_pr=
ivate *optee_private,
> +                                               enum mtk_vdec_hw_id hw_id=
)
> +{
> +       struct mtk_vdec_optee_ca_info *ca_info;
> +
> +       if (hw_id =3D=3D MTK_VDEC_LAT0)
> +               ca_info =3D &optee_private->lat_ca;
> +       else
> +               ca_info =3D &optee_private->core_ca;
> +
> +       tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vd=
ec_session_id);

All the tee_* function calls make the driver depend on the TEE driver.
Either you need to make the whole vcodec driver depend on CONFIG_TEE
(which is probably not that good an idea), or isolate this OPTEE client
into a separate module, and make it depend on CONFIG_TEE. You then need
to add stub functions for the mtk_vcodec_dec_optee_* and
mtk_vcodec_dec_get_shm_* functions for when CONFIG_TEE=3Dn and thus your
VIDEO_MEDIATEK_VCODEC_TEE=3Dn.

Otherwise it's possible to build this driver with  CONFIG_TEE=3Dn, and the
kernel will fail to link together, or if built as a module, modpost will
fail.


ChenYu

> +}
> +
> +int mtk_vcodec_dec_optee_open(struct mtk_vdec_optee_private *optee_priva=
te)
> +{
> +       struct device *dev =3D &optee_private->vcodec_dev->plat_dev->dev;
> +       int ret;
> +
> +       mutex_lock(&optee_private->tee_mutex);
> +       if (atomic_inc_return(&optee_private->tee_active_cnt) > 1) {
> +               mutex_unlock(&optee_private->tee_mutex);
> +               dev_dbg(dev, MTK_DBG_VCODEC_STR "already init vdec optee =
private data!\n");
> +               return 0;
> +       }
> +
> +       /* Open context with TEE driver */
> +       optee_private->tee_vdec_ctx =3D tee_client_open_context(NULL, mtk=
_vcodec_dec_optee_match,
> +                                                             NULL, NULL)=
;
> +       if (IS_ERR(optee_private->tee_vdec_ctx)) {
> +               dev_err(dev, MTK_DBG_VCODEC_STR "optee vdec tee context f=
ailed.\n");
> +               ret =3D PTR_ERR(optee_private->tee_vdec_ctx);
> +               goto err_ctx_open;
> +       }
> +
> +       ret =3D mtk_vcodec_dec_optee_init_hw_info(optee_private, MTK_VDEC=
_LAT0);
> +       if (ret < 0)
> +               goto err_lat_init;
> +
> +       if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_ar=
ch)) {
> +               ret =3D mtk_vcodec_dec_optee_init_hw_info(optee_private, =
MTK_VDEC_CORE);
> +               if (ret < 0)
> +                       goto err_core_init;
> +       }
> +
> +       mutex_unlock(&optee_private->tee_mutex);
> +       return 0;
> +err_core_init:
> +       mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_LAT0)=
;
> +err_lat_init:
> +       tee_client_close_context(optee_private->tee_vdec_ctx);
> +err_ctx_open:
> +
> +       mutex_unlock(&optee_private->tee_mutex);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_open);
> +
> +void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_p=
rivate)
> +{
> +       mutex_lock(&optee_private->tee_mutex);
> +       if (!atomic_dec_and_test(&optee_private->tee_active_cnt)) {
> +               mutex_unlock(&optee_private->tee_mutex);
> +               return;
> +       }
> +
> +       mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_LAT0)=
;
> +       if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_ar=
ch))
> +               mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VD=
EC_CORE);
> +
> +       tee_client_close_context(optee_private->tee_vdec_ctx);
> +       mutex_unlock(&optee_private->tee_mutex);
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_release);
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_o=
ptee.h
> new file mode 100644
> index 000000000000..8b1dca49331e
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee=
.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#ifndef _MTK_VCODEC_DEC_OPTEE_H_
> +#define _MTK_VCODEC_DEC_OPTEE_H_
> +
> +#include <linux/tee_drv.h>
> +#include <linux/uuid.h>
> +
> +#include "mtk_vcodec_dec_drv.h"
> +
> +/* The TA ID implemented in this TA */
> +#define MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND  (0x10)
> +#define MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND  (0x20)
> +
> +#define MTK_OPTEE_MAX_TEE_PARAMS 4
> +
> +/**
> + * struct mtk_vdec_optee_ca_info - ca related param
> + * @vdec_session_id:   optee TA session identifier.
> + * @hw_id:             hardware index.
> + * @vdec_session_func: trusted application function id used specific to =
the TA.
> + */
> +struct mtk_vdec_optee_ca_info {
> +       u32 vdec_session_id;
> +       enum mtk_vdec_hw_id hw_id;
> +       u32 vdec_session_func;
> +};
> +
> +/**
> + * struct mtk_vdec_optee_private - optee private data
> + * @vcodec_dev:     pointer to the mtk_vcodec_dev of the device
> + * @tee_vdec_ctx:   decoder TEE context handler.
> + * @lat_ca:         lat hardware information used to communicate with TA=
.
> + * @core_ca:        core hardware information used to communicate with T=
A.
> + *
> + * @tee_active_cnt: used to mark whether need to init optee
> + * @tee_mutex:      mutex lock used for optee
> + */
> +struct mtk_vdec_optee_private {
> +       struct mtk_vcodec_dec_dev *vcodec_dev;
> +       struct tee_context *tee_vdec_ctx;
> +
> +       struct mtk_vdec_optee_ca_info lat_ca;
> +       struct mtk_vdec_optee_ca_info core_ca;
> +
> +       atomic_t tee_active_cnt;
> +       /* mutext used to lock optee open and release information. */
> +       struct mutex tee_mutex;
> +};
> +
> +/**
> + * mtk_vcodec_dec_optee_open - setup the communication channels with TA.
> + * @optee_private: optee private context
> + */
> +int mtk_vcodec_dec_optee_open(struct mtk_vdec_optee_private *optee_priva=
te);
> +
> +/**
> + * mtk_vcodec_dec_optee_private_init - init optee parameters.
> + * @vcodec_dev: pointer to the mtk_vcodec_dev of the device
> + */
> +int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_=
dev);
> +
> +/**
> + * mtk_vcodec_dec_optee_release - close the communication channels with =
TA.
> + * @optee_private: optee private context
> + */
> +void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_p=
rivate);
> +
> +#endif /* _MTK_VCODEC_FW_OPTEE_H_ */
> --
> 2.25.1
>
