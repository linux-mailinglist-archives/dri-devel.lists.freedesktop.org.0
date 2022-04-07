Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA614F75E1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 08:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5A10EE8B;
	Thu,  7 Apr 2022 06:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910D10EE8B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 06:22:29 +0000 (UTC)
X-UUID: 634795d8d3e34ebd85765f82cca8dd7e-20220407
X-UUID: 634795d8d3e34ebd85765f82cca8dd7e-20220407
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1335707426; Thu, 07 Apr 2022 14:22:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 14:22:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 14:22:22 +0800
Message-ID: <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
Date: Thu, 7 Apr 2022 14:22:22 +0800
In-Reply-To: <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-04-06 at 16:44 +0200, Krzysztof Kozlowski wrote:
> On 06/04/2022 11:46, Rex-BC Chen wrote:
> > The driver data of MT8183 and MT8173 are different.
> > The value of has_gamma for MT8173 is true while the value of MT8183
> > is
> > false. Therefore, the compatible of disp_aal for MT8183 is not
> > suitable
> > for the compatible for MT8173.
> 
> Just because one feature is not supported, it does not mean they are
> incompatible, which you claim in the patch below. Are you sure they
> are
> really incompatible and MT8173 fallback cannot be used?
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review.

The difference of disp_aal for each MediaTek SoCs is "has_gamma".
And we only control this variable for different MediaTek SoCs.

The value of has_gamma for MT8173 is true.
The value of has_gamma for MT8183 is false. (Moreover, the driver data
is null for MT8183)

From this situation, I think it's not compatible between MT8173 and
MT8183.

reference: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_disp_aal.c?h=v5.18-rc1#n153

BRs,
Rex

