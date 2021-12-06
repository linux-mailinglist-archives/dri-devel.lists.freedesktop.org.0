Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E465E46955C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CC273D65;
	Mon,  6 Dec 2021 12:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 572 seconds by postgrey-1.36 at gabe;
 Mon, 06 Dec 2021 12:02:35 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A073CAC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 12:02:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4F708396; Mon,  6 Dec 2021 12:52:58 +0100 (CET)
Date: Mon, 6 Dec 2021 12:52:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Message-ID: <Ya35hNY0iAR/JPmI@8bytes.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112105509.12010-1-yong.wu@mediatek.com>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 06:54:54PM +0800, Yong Wu wrote:
> Yong Wu (14):
>   dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
>   iommu/mediatek-v1: Free the existed fwspec if the master dev already
>     has
>   iommu/mediatek: Return ENODEV if the device is NULL
>   iommu/mediatek: Add probe_defer for smi-larb
>   iommu/mediatek: Add device_link between the consumer and the larb
>     devices
>   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
>   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
>   drm/mediatek: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
>   media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
>   media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
>   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
>   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
>   arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes
> 
> Yongqiang Niu (1):
>   drm/mediatek: Add pm runtime support for ovl and rdma

What is the plan for merging this? If Matthias has no objections I can
take the iommu-parts, or will this go through another tree?

Regards,

	Joerg
