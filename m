Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420644F52D1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 05:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589E610ED3F;
	Wed,  6 Apr 2022 03:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74510ED3F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 03:29:13 +0000 (UTC)
X-UUID: 5086c79da67943cfa6bcfb5a68627ddb-20220406
X-UUID: 5086c79da67943cfa6bcfb5a68627ddb-20220406
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 456243619; Wed, 06 Apr 2022 11:29:06 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 11:29:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 11:29:04 +0800
Message-ID: <751374a287a70831c09da51daef1ee286285359b.camel@mediatek.com>
Subject: Re: [PATCH v10 2/4] dt-bindings: display: mediatek: change to use
 enum for mutex
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Wed, 6 Apr 2022 11:29:04 +0800
In-Reply-To: <20220406030009.2357-3-rex-bc.chen@mediatek.com>
References: <20220406030009.2357-1-rex-bc.chen@mediatek.com>
 <20220406030009.2357-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 airlied@linux.ie, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Wed, 2022-04-06 at 11:00 +0800, Rex-BC Chen wrote:
> All single entry cases in mutex can be merged as a single enum.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,mutex.yaml      | 24 +++++++--------
> ----
>  1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> index 00e6a1041a9b..b470fbb1b40a 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.y
> aml
> @@ -23,21 +23,15 @@ description: |
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - items:
> -          - const: mediatek,mt2701-disp-mutex
> -      - items:
> -          - const: mediatek,mt2712-disp-mutex
> -      - items:
> -          - const: mediatek,mt8167-disp-mutex
> -      - items:
> -          - const: mediatek,mt8173-disp-mutex
> -      - items:
> -          - const: mediatek,mt8183-disp-mutex
> -      - items:
> -          - const: mediatek,mt8192-disp-mutex
> -      - items:
> -          - const: mediatek,mt8195-disp-mutex
> +    enum:
> +      - mediatek,mt2701-disp-mutex
> +      - mediatek,mt2712-disp-mutex
> +      - mediatek,mt8167-disp-mutex
> +      - mediatek,mt8173-disp-mutex
> +      - mediatek,mt8183-disp-mutex
> +      - mediatek,mt8192-disp-mutex
> +      - mediatek,mt8195-disp-mutex
> +
>    reg:
>      maxItems: 1
>  

