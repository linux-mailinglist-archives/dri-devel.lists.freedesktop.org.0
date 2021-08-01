Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A843DCE3A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 02:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38B76E047;
	Mon,  2 Aug 2021 00:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A266E047
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 00:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61EA761057
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627862403;
 bh=5P5WW6486esvrl1w9nWW3mnfsqIMCtE21IsdFLyNPYM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t4ZOjcCZSnjTqCdQGSSfU7kK7YClQbaDDzdogAaA35ze3fzNsvDpJ7voEtTOTdF1i
 FEDwXA0Oq6tHu7G5YevSF+HJkJBdfTWIAq4HRSMoF0A47t0Vf74RR2fNBg5oRxVa3B
 AOfs0fQi2j6GzZ3qsL2lqGHfNofBtmsI8sH1UuWHD34FuF7Nd+2Cfl0xErHggh0mYj
 ulbesmXAqR7eTHPwELWzdiGdruUfn01AqWLsqhaVkcxcAlgB3AAqFww4v6/sqCoZPM
 6rcDHmn0Rjjz4EdM+v09cjcPqcFGnn0CWjUgOyIG0ftvH6Id/lLGeVQRAxe2CW396h
 lScQpUFkEz2XA==
Received: by mail-ej1-f43.google.com with SMTP id x11so27028106ejj.8
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Aug 2021 17:00:03 -0700 (PDT)
X-Gm-Message-State: AOAM533z5Cfh7aSlbbyqk2D4qR+NWWnJ/wrTMQZ/nWZdgfioSIUqMvnM
 nwfdJajR062s2MlEAER8JU9dsY4YUPRaJFI70A==
X-Google-Smtp-Source: ABdhPJwLhvPNChdJl+3BZnur1WssTSiE+2mRYb40oKWRSxPub5BYLVF5/p5xkaBqtwjxWpIMXY0t7uFUGmSnYhh7o/k=
X-Received: by 2002:a17:906:3707:: with SMTP id
 d7mr13160933ejc.127.1627862401906; 
 Sun, 01 Aug 2021 17:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210801040544.104135-1-jitao.shi@mediatek.com>
 <20210801040544.104135-2-jitao.shi@mediatek.com>
In-Reply-To: <20210801040544.104135-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 2 Aug 2021 07:59:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-KORHyePSbDSmc6Tdk=GpbTWewYmg9Q1ebQ0PgKADSug@mail.gmail.com>
Message-ID: <CAAOTY_-KORHyePSbDSmc6Tdk=GpbTWewYmg9Q1ebQ0PgKADSug@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mediatek: add
 force_dsi_end_without_null
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
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

Hi, Jitao:

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=881=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8812:06=E5=AF=AB=E9=81=93=EF=BC=9A

Move this patch before the patch "drm/mediatek: force hsa hbp hfp
packets multiple of lanenum to avoid screen shift",
and this patch's title should be "dt-bindings: drm/bridge: anx7625:
add force_dsi_end_without_null"

Regards,
Chun-Kuang.

>
> The force_dsi_end_without_null requires the dsi host ent at
> the same time in line.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7=
625.yaml
> index ab48ab2f4240..8b868a6a3d60 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.y=
aml
> @@ -43,6 +43,11 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>
> +  force_dsi_end_without_null:
> +    description: |
> +      Requires the dsi host send the dsi packets on all lanes aligned
> +      at the end.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> @@ -87,6 +92,7 @@ examples:
>              vdd10-supply =3D <&pp1000_mipibrdg>;
>              vdd18-supply =3D <&pp1800_mipibrdg>;
>              vdd33-supply =3D <&pp3300_mipibrdg>;
> +            force_dsi_end_without_null;
>
>              ports {
>                  #address-cells =3D <1>;
> --
> 2.25.1
