Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAD1FA9AC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C96E821;
	Tue, 16 Jun 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154E56E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 08:50:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F8lwYA021890; Mon, 15 Jun 2020 10:49:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VJv/B5BqqCzIrb2NhvcIyxQJgblrWvMESlW9XtRoNEA=;
 b=0kZKh1SbuXWQB7p9qxsFxBRqM5mfwfpwfQppSZHbAi7aGlAxJMn6HF+ePByVUQeWhP5n
 KHEOUmeg4EKm8z+vwmjt3IOBgkxpIr2YfeCVj8ChuRaXXCTBuIspiTs1/dAn8wURSGv3
 Y6blL4F1iGve6mV/JSA2Pyx58BOe+zFpXoYwH56D9UtIt/jTmZ8DZ9aR36vl+fmDipKB
 R2v0LPU2N1A8tx4U+bnCxdr1YQs9SwTSs/TW9vbPuAGsUovU8eMdffUak45+mjdEPJwW
 S7cPK9U9RSfiHWTSauFsD/Mg20ZYaYQu+bkEKaSI52QL+y3Vo08SpxeK1fP9HowPDr67 wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph0ecj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 10:49:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76ACA10002A;
 Mon, 15 Jun 2020 10:49:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4485B2BE225;
 Mon, 15 Jun 2020 10:49:45 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 10:49:44 +0200
Subject: Re: [PATCH v6 0/9] Enable ili9341 and l3gd20 on stm32f429-disco
To: <dillon.minfei@gmail.com>, <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, 
 <mcoquelin.stm32@gmail.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <andy.shevchenko@gmail.com>, <noralf@tronnes.org>,
 <linus.walleij@linaro.org>, <broonie@kernel.org>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <bfb78ded-11bf-e9e3-4211-5fa86c6e0f0f@st.com>
Date: Mon, 15 Jun 2020 10:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon,

On 5/27/20 9:27 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>

...

> dillon min (9):
>    ARM: dts: stm32: Add dma config for spi5
>    ARM: dts: stm32: Add pin map for ltdc & spi5 on stm32f429-disco board
>    ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on
>      stm32429-disco board
>    dt-bindings: display: panel: Add ilitek ili9341 panel bindings
>    clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
>    clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>      kernel     startup
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
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 1288 ++++++++++++++++++++
>   drivers/spi/spi-stm32.c                            |   19 +-
>   drivers/spi/spi.c                                  |    3 +-
>   10 files changed, 1508 insertions(+), 9 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> 

DT patches (patch 1 to 3) applied on stm32-next. I assume that binding 
one will go with drm/panel driver patch.

Thanks
Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
