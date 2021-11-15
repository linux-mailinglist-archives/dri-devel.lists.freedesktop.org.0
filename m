Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3626451A5A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 00:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F85C6E503;
	Mon, 15 Nov 2021 23:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5795E6E503
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:34:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E6306325C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019297;
 bh=FVoHwv6pHc6/6XgellUtHB1/7EFg1uG9jPVCejpir7c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qsl+5FNENbc0k27C3spFWxSg6s8O7fi7SluuoB5HnfClaxMEDiVlwxbNPRSlX6cAM
 TO2rnQ5fssRyJU2YXnQVwWcx00vE6rWoed64fA14OSlUdizF4ccQWT3+CmBMl4eWj2
 yiYHP2nMoBJ5owOEpyk1CPf0KoZ0wH5kMxwylJIZ7SxzmmPf0zPDIpAkYrDeZv1+sN
 umbo0G9OF9Ysjal6vS5K1f69PuXGtUvouExEXeSCDyKRI5BfHlU4eo4vj55qp5lZ0d
 N+4BDECfWJtAhzEXU44QqV3p7THZNxVp6613mDYHZ9HJTK8PTOv3NpM7UukZQSnfMm
 5Y6Rg8GP2lnhg==
Received: by mail-ed1-f49.google.com with SMTP id y13so4219108edd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 15:34:57 -0800 (PST)
X-Gm-Message-State: AOAM530MdmuQsAckWYHtDrTn65rfFMKI0C0Wnc1bKhvOWbAmTpa58LHz
 EdzcBV5jiKr+q+fwanlTKM35Xj32JLS15flPVw==
X-Google-Smtp-Source: ABdhPJyAPUR8GQnQdfQ/dYtoPvmL7xu/FHsDaxqbWig0ok/Gn8g9Eu8SXqp+w5jYbe0YDdBmmqGHHyMrlvvqlvxjdb0=
X-Received: by 2002:a17:906:79c8:: with SMTP id
 m8mr3449107ejo.511.1637019295668; 
 Mon, 15 Nov 2021 15:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-4-yongqiang.niu@mediatek.com>
In-Reply-To: <20210930155222.5861-4-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 16 Nov 2021 07:34:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8DPwrJMR3rJXHbBw31ex40h=T_e=Y+v8y_1CfbL1BYBQ@mail.gmail.com>
Message-ID: <CAAOTY_8DPwrJMR3rJXHbBw31ex40h=T_e=Y+v8y_1CfbL1BYBQ@mail.gmail.com>
Subject: Re: [PATCH v10, 3/5] drm/mediatek: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:52=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> This patch add component RDMA4

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 89170ad825fd..6491eadf34c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -402,6 +402,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_RDMA0]           =3D { MTK_DISP_RDMA,      0, &ddp=
_rdma },
>         [DDP_COMPONENT_RDMA1]           =3D { MTK_DISP_RDMA,      1, &ddp=
_rdma },
>         [DDP_COMPONENT_RDMA2]           =3D { MTK_DISP_RDMA,      2, &ddp=
_rdma },
> +       [DDP_COMPONENT_RDMA4]           =3D { MTK_DISP_RDMA,      4, &ddp=
_rdma },
>         [DDP_COMPONENT_UFOE]            =3D { MTK_DISP_UFOE,      0, &ddp=
_ufoe },
>         [DDP_COMPONENT_WDMA0]           =3D { MTK_DISP_WDMA,      0, NULL=
 },
>         [DDP_COMPONENT_WDMA1]           =3D { MTK_DISP_WDMA,      1, NULL=
 },
> --
> 2.25.1
>
