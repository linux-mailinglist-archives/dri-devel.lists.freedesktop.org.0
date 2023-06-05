Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9F1722567
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 14:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646B010E28E;
	Mon,  5 Jun 2023 12:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DB810E28E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 12:18:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3558WwJS016759; Mon, 5 Jun 2023 14:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=atnfwiK6Q0P8mro3RmnESTGq/63rKA2UZraorjLfXCs=;
 b=j0LtofPZmMII8sNb8zBLS0ZTJLLtJNpHU/KY3ZF7jq+G8vEWYhvm5N2Nwsn9p1SnFXaR
 fVghK4vsv40SWNdZ6s1UjFGwr+SqkQ/2BCcJKpYHQes2tWdI4LnfOSJSTJJIJ60rVRFn
 lziEaGEuHJJjRtXdrQ43RJd5TYof3PMLdeQgfNDDCWra7N+3MfYsminXiL6sO2xVYReO
 8c24ths+0S2T6wald4Lvsmh7HTbasX8XysWroFNd94hwCypYZl0YaLO4Mb5f22wPQn2J
 xw58tsxHXDl/f0UJfDtqByDBm/cJyP8IU+jXszSNrvco2prjWAIiFvcR6yjQoBnUfzOc WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r1c9s9f1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jun 2023 14:18:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56C4610002A;
 Mon,  5 Jun 2023 14:18:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 463F5227EE0;
 Mon,  5 Jun 2023 14:18:33 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 5 Jun
 2023 14:18:32 +0200
Message-ID: <4fb3f166-69b1-f06a-b395-d7c5d8be00bb@foss.st.com>
Date: Mon, 5 Jun 2023 14:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/6] Add display support on the stm32f746-disco board
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, michael@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dario,


Thanks for this serie. I'll look at it shortly.

In the meantime, would it be possible to send it again as I think it is not
complete.

patchwork and lore.kernel.org both prompt incomplete parts of your serie.

https://patchwork.freedesktop.org/series/118814/?_sm_au_=iVVrkQQkv5r1r0rQcLpsvK618Vf61

https://lore.kernel.org/dri-devel/20230602102123.3345587-1-dario.binacchi@amarulasolutions.com/


Thanks,

Raphaël

On 6/2/23 12:21, Dario Binacchi wrote:
> The series adds support for the display on the stm32f746-disco board,
> along with a generic patch that adds the "bpp" parameter to the stm-drm
> module. The intention is to allow users to size, within certain limits,
> the memory footprint required by the framebuffer.
>
> Changes in v2:
> - Add 'Acked-by' tag of Conor Dooley.
> - Fix build warning reported by kernel test robot.
> - Add 'Reported-by' tag of kernel test robot.
>
> Dario Binacchi (6):
>   ARM: dts: stm32: add ltdc support on stm32f746 MCU
>   ARM: dts: stm32: add pin map for LTDC on stm32f7
>   ARM: dts: stm32: support display on stm32f746-disco board
>   dt-bindings: display: simple: add Rocktech RK043FN48H
>   drm/panel: simple: add support for Rocktech RK043FN48H panel
>   drm/stm: add an option to change FB bpp
>
>  .../bindings/display/panel/panel-simple.yaml  |  2 +
>  arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 35 +++++++++++++
>  arch/arm/boot/dts/stm32f746-disco.dts         | 51 +++++++++++++++++++
>  arch/arm/boot/dts/stm32f746.dtsi              | 10 ++++
>  drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++
>  drivers/gpu/drm/stm/drv.c                     |  8 ++-
>  6 files changed, 134 insertions(+), 1 deletion(-)
>
