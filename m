Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834C579438
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C76010E55D;
	Tue, 19 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927911B26B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 02:35:03 +0000 (UTC)
X-UUID: 0ffd32be15984aac9ca7584fee2400a4-20220719
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:3b02963d-af1e-42b0-be2d-f8c19bb72bbc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:3b02963d-af1e-42b0-be2d-f8c19bb72bbc, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:f8ead6d7-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:4264e2e65220,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0ffd32be15984aac9ca7584fee2400a4-20220719
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 357985203; Tue, 19 Jul 2022 10:34:58 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 19 Jul 2022 10:34:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 19 Jul 2022 10:34:58 +0800
Message-ID: <21830ca88914215c5e98aba49e2e879dcbfde1ab.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: add power-domains
 property
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Date: Tue, 19 Jul 2022 10:34:56 +0800
In-Reply-To: <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
References: <20220718052217.29729-1-allen-kh.cheng@mediatek.com>
 <b2439e75-88a3-5f04-5fe6-b53e8d5232a7@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Tue, 19 Jul 2022 07:33:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

On Mon, 2022-07-18 at 15:59 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/07/22 07:22, Allen-KH Cheng ha scritto:
> > DPI is part of the display / multimedia block in MediaTek SoCs
> > and is managed using power controller in some platforms. We add
> > the power-domains property to the binding documentation.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> For the contents of this commit:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> ...but I'm not sure whether this one requires a Fixes tag (because,
> effectively,
> the DPI hardware *requires* that power domain to get up) - and if it
> does,
> which commit to reference: the first commit for this file is a TXT-
> >schema
> conversion, but the TXT didn't have power-domains as well.
> 
> 
> 
> Regards,
> Angelo

For commit 9273cf7d3 "convert the dpi bindings to yaml"

We add mt8173-dpi compatible but there is no power-domains property in
binding doc.

Yes, I think it should be added Fixes tag.

Thanks for your suggestion.


Best Regards,
Allen


