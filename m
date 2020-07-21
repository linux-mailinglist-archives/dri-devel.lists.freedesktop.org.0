Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC21227E82
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 13:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153516E175;
	Tue, 21 Jul 2020 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB46E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:20:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L9CtxF007329; Tue, 21 Jul 2020 11:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=q4cJixvw6MNxKZShEfqVrQUezj6sONSFD+NAWmLsois=;
 b=mNovSMgTc5zsIlYiUcYJgltIUoSElkk14PWIyKhUge2mllSNXADiD0UPI8214JyLM532
 2UibEmXshAtF1Bieutt63KjvnHu6uzrrt+Zuw2GMWPuqsnMbpVZRcwPm5bgLai0pMK2D
 n8VzT4zPaGVUdjSut0/TKqyPmalTi+fqhIQA2RyRnDRTDB0YRK5IhKctJ4l+rpGxgLgR
 EwYO4Dq/3earbrQuYugDxAAmIf7tZy+vjMXIapkBaI9WaeVdx3GYZXW6NCfEV3xIUR2U
 7vcvPfl1RfZfGolZ2gjnHTlsU0rj31ZxXVc/CCeRHnD/ZPiHKF27vSXqWGAtwrYpGXmU UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6uvykr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:19:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE35310002A;
 Tue, 21 Jul 2020 11:19:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76D8F2A8DA8;
 Tue, 21 Jul 2020 11:19:48 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 Jul
 2020 11:19:47 +0200
Subject: Re: [PATCH v5 0/8] Enable ili9341 and l3gd20 on stm32f429-disco
To: <dillon.minfei@gmail.com>, <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, 
 <mcoquelin.stm32@gmail.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <198ad79c-ab12-55f0-814f-afc454a7e8ef@st.com>
Date: Tue, 21 Jul 2020 11:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Mailman-Approved-At: Tue, 21 Jul 2020 11:16:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon

On 5/25/20 5:40 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> V5's update based on Mark Brown's suggestion, use 'SPI_MASTER_MUST_RX'
> for SPI_SIMPLEX_RX mode on stm32 spi controller.
> 
> V5:
> 1 instead of add send dummy data out under SIMPLEX_RX mode,
>     add flags 'SPI_CONTROLLER_MUST_TX' for stm32 spi driver
> 2 bypass 'SPI_CONTROLLER_MUST_TX' and 'SPI_CONTROLLER_MUST_RX' under
> 'SPI_3WIRE' mode
> 

Concerning DT patches, they look goods for me. However I'll merge them 
when drivers parts will be merged.

regards
Alex



> V4:
> According to alexandre torgue's suggestion, combine ili9341 and
> l3gd20's modification on stm32f429-disco board to one patchset.
> 
> Changes:
> 
> ili9341:
> 
> 1 update ili9341 panel driver according to Linus's suggestion
> 2 drop V1's No.5 patch, sumbit new changes for clk-stm32f4
> 3 merge l3gd20's change to this patchset
> 
> V3:
> 1 merge original tiny/ili9341.c driver to panel/panel-ilitek-ili9341.c
>    to support serial spi & parallel rgb interface in one driver.
> 2 update ilitek,ili9341.yaml dts binding documentation.
> 3 update stm32f429-disco dts binding
> 
> V2:
> 1 verify ilitek,ili9341.yaml with make O=../linux-stm32
>    dt_binding_check
>    DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/
>    ilitek,ili9341.yaml
> 
> V1:
> 1 add ili9341 drm panel driver
> 2 add ltdc, spi5 controller for stm32f429-disco
> 3 add ltdc, spi5 pin map for stm32f429-disco
> 4 add docs about ili9341
> 5 fix ltdc driver loading hang in clk set rate bug
> 
> 
> L3gd20:
> V3:
> 1 merge stm32f429-disco dtbs binding with ili9341 part
> 
> V2:
> 1 insert blank line at stm32f420-disco.dts line 143
> 2 add more description for l3gd20 in commit message
> 
> V1:
> 1 enable spi5 controller on stm32f429-disco (dts)
> 2 add spi5 pinmap for stm32f429-disco  (dts)
> 3 add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4
> 
> 
> dillon min (8):
>    ARM: dts: stm32: Add dma config for spi5
>    ARM: dts: stm32: Add pin map for ltdc & spi5 on stm32f429-disco board
>    ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on
>      stm32429-disco board
>    dt-bindings: display: panel: Add ilitek ili9341 panel bindings
>    clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate,
>      fix duplicated ltdc clock register to 'clk_core' case ltdc's clock
>        turn off by clk_disable_unused()
>    drm/panel: Add ilitek ili9341 panel driver
>    spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX' support for stm32f4
>    spi: flags 'SPI_CONTROLLER_MUST_RX' and 'SPI_CONTROLLER_MUST_TX' can't
>      be     coexit with 'SPI_3WIRE' mode
> 
>   .../bindings/display/panel/ilitek,ili9341.yaml     |   69 ++
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |   67 +
>   arch/arm/boot/dts/stm32f429-disco.dts              |   48 +
>   arch/arm/boot/dts/stm32f429.dtsi                   |    3 +
>   drivers/clk/clk-stm32f4.c                          |    7 +-
>   drivers/gpu/drm/panel/Kconfig                      |   12 +
>   drivers/gpu/drm/panel/Makefile                     |    1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 1301 ++++++++++++++++++++
>   drivers/spi/spi-stm32.c                            |   19 +-
>   drivers/spi/spi.c                                  |    3 +-
>   10 files changed, 1521 insertions(+), 9 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
