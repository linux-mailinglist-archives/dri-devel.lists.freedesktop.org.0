Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB67280C3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D4910E26F;
	Thu,  8 Jun 2023 13:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1050 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jun 2023 13:00:29 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C510E26F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:00:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3589A91B001978; Thu, 8 Jun 2023 14:42:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=73FqTMHLfZiM2PDdNj01tEfDAdrx6SjM7RVnmCFe2B8=;
 b=4U+Z3T3jg8g0fU7KYtC97DzZXEbG/CAEbEU6Ff39w/KzY01TVklN0VgZfSesjS6ImUIE
 cR9q12YfpIQ/ZO+prvC0PTY57NcV+wQL5vAJdmDN6ZfQbLYv6VusPCHP1vRz3VKuCoPW
 LZ9wEDDOJ3d1Bp6aj9qQT/qJXk43jqh5jZrY8CmR/uBCBRn/nMXMtdNNlVc54fG3i/HP
 ndfZz0jJXQor7SWg28LhXAh8AJX1oVO3aoF9JGnqGz5K6x9v+gWmkZFy6K/M9HWO119R
 BVypJk1UkpS6nTOl1e/w4c9QEhg8EMIYBx4mF5s1KivCcRLWtbeFvmANioXVkdW32qJ4 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r3c4ahc5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jun 2023 14:42:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1458610003D;
 Thu,  8 Jun 2023 14:42:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06624209BA9;
 Thu,  8 Jun 2023 14:42:44 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 8 Jun
 2023 14:42:43 +0200
Message-ID: <7139fb21-6a1d-a26f-fef3-d3154d234ca2@foss.st.com>
Date: Thu, 8 Jun 2023 14:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v2 2/6] ARM: dts: stm32: add pin map for LTDC on
 stm32f7
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-3-dario.binacchi@amarulasolutions.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230607063139.621351-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_09,2023-06-08_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario

On 6/7/23 08:31, Dario Binacchi wrote:
> Add pin configurations for using LTDC (LCD-tft Display Controller) on
> stm32f746-disco board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>   arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> index 9f65403295ca..f3f90b9bcd61 100644
> --- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> @@ -365,6 +365,41 @@ pins2 {
>   					bias-pull-up;
>   				};
>   			};
> +
> +
> +			ltdc_pins_a: ltdc-pins-a-0 {

  ltdc-pins-a-0 -->  ltdc-pins-0 is a bit cleaner. I know that I have to 
fix sdio pins nodes in this file to keep the same spirit for all group 
names.

If there is no V3 I wil do it directly when I'll apply DT patches if you 
agree.

Alex


> +				pins {
> +					pinmux = <STM32_PINMUX('E', 4, AF14)>, /* LCD_B0 */
> +						 <STM32_PINMUX('G',12, AF9)>,  /* LCD_B4 */
> +						 <STM32_PINMUX('I', 9, AF14)>, /* LCD_VSYNC */
> +						 <STM32_PINMUX('I',10, AF14)>, /* LCD_HSYNC */
> +						 <STM32_PINMUX('I',14, AF14)>, /* LCD_CLK */
> +						 <STM32_PINMUX('I',15, AF14)>, /* LCD_R0 */
> +						 <STM32_PINMUX('J', 0, AF14)>, /* LCD_R1 */
> +						 <STM32_PINMUX('J', 1, AF14)>, /* LCD_R2 */
> +						 <STM32_PINMUX('J', 2, AF14)>, /* LCD_R3 */
> +						 <STM32_PINMUX('J', 3, AF14)>, /* LCD_R4 */
> +						 <STM32_PINMUX('J', 4, AF14)>, /* LCD_R5 */
> +						 <STM32_PINMUX('J', 5, AF14)>, /* LCD_R6 */
> +						 <STM32_PINMUX('J', 6, AF14)>, /* LCD_R7 */
> +						 <STM32_PINMUX('J', 7, AF14)>, /* LCD_G0 */
> +						 <STM32_PINMUX('J', 8, AF14)>, /* LCD_G1 */
> +						 <STM32_PINMUX('J', 9, AF14)>, /* LCD_G2 */
> +						 <STM32_PINMUX('J',10, AF14)>, /* LCD_G3 */
> +						 <STM32_PINMUX('J',11, AF14)>, /* LCD_G4 */
> +						 <STM32_PINMUX('J',13, AF14)>, /* LCD_B1 */
> +						 <STM32_PINMUX('J',14, AF14)>, /* LCD_B2 */
> +						 <STM32_PINMUX('J',15, AF14)>, /* LCD_B3 */
> +						 <STM32_PINMUX('K', 0, AF14)>, /* LCD_G5 */
> +						 <STM32_PINMUX('K', 1, AF14)>, /* LCD_G6 */
> +						 <STM32_PINMUX('K', 2, AF14)>, /* LCD_G7 */
> +						 <STM32_PINMUX('K', 4, AF14)>, /* LCD_B5 */
> +						 <STM32_PINMUX('K', 5, AF14)>, /* LCD_B6 */
> +						 <STM32_PINMUX('K', 6, AF14)>, /* LCD_B7 */
> +						 <STM32_PINMUX('K', 7, AF14)>; /* LCD_DE */
> +					slew-rate = <2>;
> +				};
> +			};
>   		};
>   	};
>   };

