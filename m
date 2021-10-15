Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E242F805
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 18:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1E6E054;
	Fri, 15 Oct 2021 16:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6D36E054
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:21:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24F2A6109E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634314885;
 bh=z0VMHYGv4k9YfLpE9FUSGVn3TrO3Twply7c7zgpVmYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J6WxXOGI05KDKCcMlAcj6PkNDAZRgenVWkTidMhwoD3JNTz/4l51EERh5Ql1ZSJpj
 BbHXZvif3Y2gIy8npj+nEwwpC4iH9jXA+7X6nBWvHtWo3FA5Re2BU3Gw+OHqxb4Ihu
 MjbChxxUI5SnJkj8X4h78uz8Lan/JnmbKUTSNM65fO6nU8rNG1Vmeu/QJoYZQgVcMb
 CexyF34RQoOQiSJuK+q00/JxapoJ3X9lV7FBcS/BSlxwEHkvP94K0v/4b4Gj5lX88F
 siBr2i5g4cd21v++Pfceo+bb/ofBufDtCzga5cQiXB7M1Eb29Rm1529svUV4SJ0X3H
 wr9CZNQCkOeaQ==
Received: by mail-ed1-f46.google.com with SMTP id i20so39337766edj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 09:21:25 -0700 (PDT)
X-Gm-Message-State: AOAM531iTLGk+2aB8iA0tsekH0jNbxSE+clG9UD1I1mt+Oik3iBNMhq3
 MZ5K32HDjOdE+0QBAMCEFSF627TEk7OzkltYDg==
X-Google-Smtp-Source: ABdhPJx6achLWZwzx6ovEoDXmzSv+wCsdnSRUuajZYLhkxDFusi9eOjTSSXm7nZir+rTOgxfNjDkLV4a3hqmrLpqCmU=
X-Received: by 2002:a50:ef10:: with SMTP id m16mr15859060eds.224.1634314883576; 
 Fri, 15 Oct 2021 09:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-3-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-3-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Oct 2021 00:21:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3KBXyBvMW8zC1fukkDFGczcP6t+CjRbvGh6uQtOSnTA@mail.gmail.com>
Message-ID: <CAAOTY_-3KBXyBvMW8zC1fukkDFGczcP6t+CjRbvGh6uQtOSnTA@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] dt-bindings: mediatek: add vdosys1 MERGE
 property for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> MT8195 vdosys1 merge1 to merge4 have HW mute function.
> Add MERGE additional mute property description.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,merge.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index 6007e00679a8..d7d0eda813d1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -54,6 +54,10 @@ properties:
>        command to SMI to speed up the data rate.
>      type: boolean
>
> +  mediatek,merge-mute:
> +    description: Support mute function. Mute the content of merge output=
.
> +    type: boolean
> +
>    mediatek,gce-client-reg:
>      description:
>        The register of client driver can be configured by gce with 4 argu=
ments
> --
> 2.18.0
>
