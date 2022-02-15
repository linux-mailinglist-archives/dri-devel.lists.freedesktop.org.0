Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43314B60FD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 03:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E1310E317;
	Tue, 15 Feb 2022 02:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1980A10E317
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 02:27:39 +0000 (UTC)
X-UUID: 7c965cb11cb840179b068fbfb5380b89-20220215
X-UUID: 7c965cb11cb840179b068fbfb5380b89-20220215
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 143493579; Tue, 15 Feb 2022 10:27:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 10:27:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 10:27:33 +0800
Message-ID: <2a39dc9465761a16587bfe82189f581c1d52da6a.camel@mediatek.com>
Subject: Re: [PATCH 20/23] ASoC: codecs: wcd938x: Make use of the helper
 component_compare/release_of
From: Yong Wu <yong.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 15 Feb 2022 10:27:33 +0800
In-Reply-To: <67b2e6e8-e4fe-06ca-3d12-9bba83743989@collabora.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-21-yong.wu@mediatek.com>
 <YgpNqLQzpx4J6d8K@sirena.org.uk>
 <67b2e6e8-e4fe-06ca-3d12-9bba83743989@collabora.com>
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 James Wang <james.qian.wang@arm.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-14 at 13:43 +0100, AngeloGioacchino Del Regno wrote:
> Il 14/02/22 13:40, Mark Brown ha scritto:
> > On Mon, Feb 14, 2022 at 02:08:16PM +0800, Yong Wu wrote:
> > > Use the common compare/release helpers from component.
> > 
> > What's the story with dependencies here?  I've just got this one
> > patch
> > with no cover letter...

Sorry for this. I will add in cover letter next time.
Maybe in next week. Just to see if there is any other comment.

Thanks.

> 
> Hello Mark,
> I agree, the cover letter should be sent to everyone; Yong, please
> add the
> proper Ccs to it next time.
> 
> Anyway, context:
> 
https://patchwork.kernel.org/project/linux-mediatek/cover/20220214060819.7334-1-yong.wu@mediatek.com/

Thanks very much:)

> 
> Cheers,
> Angelo

