Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A64B6685
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 09:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715D510E417;
	Tue, 15 Feb 2022 08:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AFF10E419
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 08:48:47 +0000 (UTC)
X-UUID: 24d0cb6b98a54a70bf9133c308b05be9-20220215
X-UUID: 24d0cb6b98a54a70bf9133c308b05be9-20220215
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1684363045; Tue, 15 Feb 2022 16:48:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 16:48:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 16:48:43 +0800
Message-ID: <0de5fc29ed65eb5c6e9f227ec5e77cd4312718f4.camel@mediatek.com>
Subject: Re: [v2,2/6] dt-bindings: display: mediatek: update supported SoC
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Tue, 15 Feb 2022 16:48:43 +0800
In-Reply-To: <20220215075953.3310-3-rex-bc.chen@mediatek.com>
References: <20220215075953.3310-1-rex-bc.chen@mediatek.com>
 <20220215075953.3310-3-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Tue, 2022-02-15 at 15:59 +0800, Rex-BC Chen wrote:
> Add decriptions about supported SoC: MT8186.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> t
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> t
> index 78044c340e20..f22b3d90d45a 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> t
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.tx
> t
> @@ -44,7 +44,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see
> mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> -  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> mt8183 and mt8192.
> +  the supported chips are mt2701, mt7623, mt2712, mt8167, mt8173,
> mt8183, mt8186 and mt8192.

I've applied [1], so please depend on [1] to send this patch.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd

Regards,
CK

>  - reg: Physical base address and length of the function block
> register space
>  - interrupts: The interrupt signal from the function block
> (required, except for
>    merge and split function blocks).

