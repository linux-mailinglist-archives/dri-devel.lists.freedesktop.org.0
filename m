Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F4018192A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8A6E977;
	Wed, 11 Mar 2020 13:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71F196E977
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:07:56 +0000 (UTC)
X-UUID: 428ecd7073f44e89a7ac1fcf3f96f3d5-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ClGTqPIGoVqVr3jF7yujqXX6Xpj7o2+++464APlQxj8=; 
 b=LV46WzqoLmIqPw8Wv7lHymUdjdvBT1Cdo1c9eAdaXElWx/V/xGaSci8c7/+kVw80LuR0ok4gaXOXA2U18MZyKJ968MVMcJFrIGbjg9jJXctJ5YS7Fs0uWX8k+FmYXas41unGSKcfzTk+LzNeEisLSZaRX6qdRpUhpQOYjZnegyM=;
X-UUID: 428ecd7073f44e89a7ac1fcf3f96f3d5-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 888826361; Wed, 11 Mar 2020 21:07:52 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:07:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:06:53 +0800
Message-ID: <1583932064.29614.6.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 11 Mar 2020 21:07:44 +0800
In-Reply-To: <20200311115614.1425528-5-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-5-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D78B7E686CD1B535834D80DC0678BB113F1681C82C2C2E34388BCBCE202CC48B2000:8
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
> Those functions will allow DRM driver and others to control the data
> path routing.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
> Changes in v11: None
> Changes in v10:
> - Select CONFIG_MTK_MMSYS (CK)
> - Pass device pointer of mmsys device instead of config regs (CK)
> 
> Changes in v9:
> - Introduced a new patch to move routing control into mmsys driver.
> - Removed the patch to use regmap as is not needed anymore.
> 
> Changes in v8: None
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>  drivers/soc/mediatek/mtk-mmsys.c        | 279 ++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
>  8 files changed, 316 insertions(+), 282 deletions(-)
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
