Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CBC6D3C08
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 05:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584FF10E041;
	Mon,  3 Apr 2023 03:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6D010E041
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:12:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77371B810FB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E34C433A1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 03:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680491554;
 bh=Ap+BpBTEBvJlF+gYmcxKPrUbwIF2D8NME4iCc6mm8XI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ox9yXbG4kq8D2Laabb25D1FCQq+ipQrdmcgXDds+jeRkctXVetC4ohfLigpI3pM7q
 UBbZfJNnO7TcOFVZg6F1J5QMHR70sK6FAMZ6z3bS866sVWfXOEAAyfwX9OzheUgXyB
 Ui1s6kDcqRLAzPRTMiz845zRNsvovUXTFjI6wudl8OycNMqPXs6XhLRR94PFhMVBD8
 khhbaz986L0vFh3fVKtcCjdD1HkpdIXzUQC4w2Y7ehrEDSfqbc195QK6K5+jbndSeo
 qVtkOBfGlA1bErTk1Uh2QICYD8jKCh38vCywt7XrkPzJtGAy9Zp7gpWz3DpR7cGpEc
 iX/ynfmWLFaTQ==
Received: by mail-lf1-f49.google.com with SMTP id y20so36247596lfj.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 20:12:34 -0700 (PDT)
X-Gm-Message-State: AAQBX9c0kB0E30IqmCfzsqFwEQ7FQ/m3k2pQCL6HKI7sWrqzC2thwqqd
 qxRp5PADZuf1v5S/X9qb7/Mnfo/y9KigB8Xbog==
X-Google-Smtp-Source: AKy350boR7KBqqJZ6IIHymcrLLLozW883feUdZ6Y2V3HnUd9E4OfcuL63cyZJDY0w5iiNe1NgefP4M7Cd9UwzPb3jmM=
X-Received: by 2002:ac2:50d9:0:b0:4ea:fa15:5bce with SMTP id
 h25-20020ac250d9000000b004eafa155bcemr10220977lfm.7.1680491552651; Sun, 02
 Apr 2023 20:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
 <20230330032614.18837-2-nancy.lin@mediatek.com>
In-Reply-To: <20230330032614.18837-2-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 11:12:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8hU9j2KfFcpvhz-TRzrz0hiSTiPgy_yHqEQ8VWvoYzTg@mail.gmail.com>
Message-ID: <CAAOTY_8hU9j2KfFcpvhz-TRzrz0hiSTiPgy_yHqEQ8VWvoYzTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 shawn.sung@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:26=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add mdp_rdma get_format and get_num_formats function.

For the series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 0d28b2e2069c..17b169530beb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cm=
dq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cf=
g,
>                          struct cmdq_pkt *cmdq_pkt);
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/me=
diatek/mtk_mdp_rdma.c
> index eecfa98ff52e..e06db6e56b5f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -62,6 +62,20 @@
>  #define RDMA_CSC_FULL709_TO_RGB                        5
>  #define RDMA_CSC_BT601_TO_RGB                  6
>
> +static const u32 formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  enum rdma_format {
>         RDMA_INPUT_FORMAT_RGB565 =3D 0,
>         RDMA_INPUT_FORMAT_RGB888 =3D 1,
> @@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struct =
mtk_mdp_rdma_cfg *cfg,
>                            MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
>  }
>
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
> +{
> +       return formats;
> +}
> +
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
> +{
> +       return ARRAY_SIZE(formats);
> +}
> +
>  int mtk_mdp_rdma_clk_enable(struct device *dev)
>  {
>         struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> --
> 2.18.0
>
