Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FFB48ABD4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322FF10FB29;
	Tue, 11 Jan 2022 10:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84A510F7CB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:57:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 182ED1F43A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641898665;
 bh=YF4OVUlLPdRcXd495FYHFEnvLOeAT5zjs+cfWkZQ59c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UumELe331t1PFXufN9ry/eKcEnjWq1ai+QnEAtw/Iq+rujrT6UazNURDOWpI4l/YS
 DaYfvjVzPHgd8i5WXITii9uvsu17sos/JR06eYl2pNqo+Yr2RHBy3lKtW8/48Wv26+
 /T6y448GWREpcy/pSXwcLPSx3BHCHHhnNgmSO0qD3b9QRxnkStz8HvxoDyTusUcCR3
 tnWG+OURtbhUhUZegFFSAF2zdAnzDrBoEP4vfOSPZ43mfYH+u4g+DgBhdcH0kUMYBl
 3uWGwmOxK0PkokHmXCkSwG/o2zipwv3ZRQACcJ/iFnUYKooefLBk8kgqcsBJBFK9s9
 bRSdTFDstZjwg==
Subject: Re: [PATCH v9 11/15] media: mtk-vcodec: dec: Remove
 mtk_vcodec_release_dec_pm
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-12-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <0a9e348b-fac5-c93b-b4c4-1d834c96c195@collabora.com>
Date: Tue, 11 Jan 2022 11:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211112105509.12010-12-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 devicetree@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com, yf.wang@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/11/21 11:55, Yong Wu ha scritto:
> After this patchset, mtk_vcodec_release_dec_pm has only one line.
> then remove that function. Use pm_runtime_disable directly instead.
> 
> For symmetry, move the pm_runtime_enable out from
> mtk_vcodec_init_dec_pm, then mtk_vcodec_init_dec_pm only operate for
> the clocks, rename it from the _pm to _clk.
> 
> No functional change.
> 
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> CC: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

