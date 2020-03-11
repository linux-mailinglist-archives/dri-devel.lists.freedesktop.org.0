Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C477218191C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4276E47A;
	Wed, 11 Mar 2020 13:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B4A56E47A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:05:57 +0000 (UTC)
X-UUID: a88d23ee84d24c6f87ab8de3e23780a0-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Mp2aZPUa6vRdl4F4YlSPXJ1sI5MSD/01Q/eOy0GtTQI=; 
 b=iyj05Fw0ZIkoFngYSieienICJb8iu/QUVoBTVNlGmL+GyI5SB+CJ59Cq8HqSyTeO4MJQ7s3q3FxEE1+RhG1IhFZvT4bP32K4AzR1jDPhL4jZjPjQ8oBpIWtb64oiqmQQ2uiAKz6A4NMBGx6gWHuUGcQN/xX66qoKzUDU9JKN+9k=;
X-UUID: a88d23ee84d24c6f87ab8de3e23780a0-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 257172720; Wed, 11 Mar 2020 21:05:54 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:05:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:05:01 +0800
Message-ID: <1583931952.29614.5.camel@mtksdaap41>
Subject: Re: [PATCH v11 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 11 Mar 2020 21:05:52 +0800
In-Reply-To: <20200311115614.1425528-4-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
 <20200311115614.1425528-4-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D784D3DAEEA661B9A0D6E2A96065163283990E8ECB339D1E7BA070311362A5752000:8
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
 linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 wens@csie.org, linux-arm-kernel@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Wed, 2020-03-11 at 12:56 +0100, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> There is no strong reason for this to use CLK_OF_DECLARE instead of
> being a platform driver. Plus, MMSYS provides clocks but also a shared
> register space for the mediatek-drm and the mediatek-mdp
> driver. So move the MMSYS clocks to a new platform driver and also
> create a new MMSYS platform driver in drivers/soc/mediatek that
> instantiates the clock driver.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v11:
> - Leave the clocks part in drivers/clk (clk-mt8173-mm)
> - Instantiate the clock driver from the mtk-mmsys driver.
> - Add default config option to not break anything.
> - Removed the Reviewed-by CK tag as changed the organization.
> 
> Changes in v10:
> - Renamed to be generic mtk-mmsys
> - Add driver data support to be able to support diferent SoCs
> 
> Changes in v9:
> - Move mmsys to drivers/soc/mediatek (CK)
> 
> Changes in v8:
> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> 
> Changes in v7:
> - Free clk_data->clks as well
> - Get rid of private data structure
> 
>  drivers/clk/mediatek/Kconfig         |   7 ++
>  drivers/clk/mediatek/Makefile        |   1 +
>  drivers/clk/mediatek/clk-mt8173-mm.c | 146 +++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8173.c    | 104 -------------------
>  drivers/soc/mediatek/Kconfig         |   8 ++
>  drivers/soc/mediatek/Makefile        |   1 +
>  drivers/soc/mediatek/mtk-mmsys.c     |  50 +++++++++
>  7 files changed, 213 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> 

>  obj-$(CONFIG_COMMON_CLK_MT8183_CAMSYS) += clk-mt8183-cam.o


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
