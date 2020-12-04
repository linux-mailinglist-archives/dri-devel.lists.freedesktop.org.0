Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F612CE9C8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690016EC7C;
	Fri,  4 Dec 2020 08:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB3E6E120
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 03:20:01 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CnHxZ59R5z15XCk;
 Fri,  4 Dec 2020 11:19:30 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.9) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 11:19:54 +0800
Subject: Re: [PATCH 0/1] dt-bindings: eliminate yamllint warnings
To: Rob Herring <robh+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>, David Airlie <airlied@linux.ie>,
 "Daniel Vetter" <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Ricardo
 Ribalda" <ribalda@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>, linux-mmc
 <linux-mmc@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, alsa-devel
 <alsa-devel@alsa-project.org>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <5dba4db6-dc66-44a8-ac4c-c5fe288c3430@huawei.com>
Date: Fri, 4 Dec 2020 11:19:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201204024226.1222-1-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, Forgot to say: This patch is based on the latest linux-next code.


On 2020/12/4 10:42, Zhen Lei wrote:
> There're too many people, I just send to the maintainer, reviewer, supporter.
> 
> Eliminate below warnings:
> ./Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml:32:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
> ./Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/display/intel,keembay-msscam.yaml:21:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:52:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
> ./Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml:42:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> ./Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml:45:8: [warning] wrong indentation: expected 8 but found 7 (indentation)
> ./Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml:25:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/adv7604.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: [error] missing document start "---" (document-start)
> ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:29:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:32:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml:79:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml:88:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:72:17: [warning] wrong indentation: expected 18 but found 16 (indentation)
> ./Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml:75:17: [warning] wrong indentation: expected 18 but found 16 (indentation)
> ./Documentation/devicetree/bindings/mmc/mtk-sd.yaml:20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/mmc/mtk-sd.yaml:30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/mmc/mtk-sd.yaml:33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
> 
> 
> Zhen Lei (1):
>   dt-bindings: eliminate yamllint warnings
> 
>  .../devicetree/bindings/clock/imx8qxp-lpcg.yaml    | 20 ++++++++---------
>  .../bindings/display/bridge/analogix,anx7625.yaml  |  4 ++--
>  .../bindings/display/bridge/intel,keembay-dsi.yaml |  4 ++--
>  .../bindings/display/intel,keembay-msscam.yaml     |  4 ++--
>  .../bindings/display/panel/novatek,nt36672a.yaml   |  2 +-
>  .../devicetree/bindings/media/i2c/adv7604.yaml     |  4 ++--
>  .../devicetree/bindings/media/i2c/mipi-ccs.yaml    | 11 ++++-----
>  .../devicetree/bindings/media/i2c/ovti,ov772x.yaml | 12 +++++-----
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml | 12 +++++-----
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml  | 26 +++++++++++-----------
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml         |  4 ++--
>  11 files changed, 52 insertions(+), 51 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
