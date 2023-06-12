Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1DA72C9B3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC5B10E2A7;
	Mon, 12 Jun 2023 15:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192F10E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:19:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 530DA6068E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC09C433A7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686583190;
 bh=2Q20y0Ssx+Qnm5l9jPWYn3Pa7yN/CQx6/2ZtlgetIYg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h67fcwz+ADhIo8Ww/uLQxiifaD81QYQYZR7hnm8BUFb0IMRitWiYAQmsWJdH99em0
 yatrjqAyaUpkLKyV1uY5IKIZhzW3t08h2o8oblkIl5QWbZi2mp9cxeXfXAmZp6Ajh3
 G04KaGsTY3cSG9TE3jSb/cOr3tQzlekHFuOkbuZaeJbXgNFR2okRX24Oo0HxFCW8Wm
 B/ByDO9+RET9IUVOJersCfr1r83wp2uUXxzpa8p/ned6mEe8Ti9MoLytRxsQACFh3A
 RxWlLhUgfhRDFB9yO7FIlD6ZHe2HFIZAjGoTrOlsMEpeAzM7uN6VrJDWYn1y3DTfhW
 ZNO4NI0M+IFmw==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f64fb05a8aso5326019e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:19:50 -0700 (PDT)
X-Gm-Message-State: AC+VfDzfr5jW04jPhb8lbacCTSKD6wW0XqrL/bSlk/sNbFb08Qp+KC1X
 S1swCt8NjGcyNz13dm5fj5HJjrpDoT6C79N3ow==
X-Google-Smtp-Source: ACHHUZ7YxJzSB669feL0VIOCXTzs7RUFULvVqeaRA4EK8WzrSV1+iAUrw39mOzvDWBX7fX2GbkgV+5Vu7419NCtE+ZQ=
X-Received: by 2002:a2e:a408:0:b0:2ad:d949:dd39 with SMTP id
 p8-20020a2ea408000000b002add949dd39mr3431947ljn.29.1686583188085; Mon, 12 Jun
 2023 08:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Jun 2023 23:19:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9H9qbPC411rRZrvwEC3dLEvz5m=tn=CysWCZErtyKdnw@mail.gmail.com>
Message-ID: <CAAOTY_9H9qbPC411rRZrvwEC3dLEvz5m=tn=CysWCZErtyKdnw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT8188
To: xinlei.lee@mediatek.com
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, shuijing.li@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<xinlei.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=8813=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.=
yaml
> index 4707b60238b0..13fa76299254 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yam=
l
> @@ -29,6 +29,7 @@ properties:
>        - mediatek,mt8173-dsi
>        - mediatek,mt8183-dsi
>        - mediatek,mt8186-dsi
> +      - mediatek,mt8188-dsi
>
>    reg:
>      maxItems: 1
> --
> 2.18.0
>
