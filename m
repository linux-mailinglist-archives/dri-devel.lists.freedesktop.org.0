Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAEC999B35
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 05:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297310EA2C;
	Fri, 11 Oct 2024 03:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="hJyethe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D31410EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 03:39:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B3E24891FC;
 Fri, 11 Oct 2024 05:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728617991;
 bh=fv/JN3MQljG4mzTl445+5tx3NcTRrnwGCG0aSAOrlwY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hJyethe37grP0kHoQdjb2lmStpeUBI711TbqYzdVkmHuYU9EMvCu2sL64ftqkXLkS
 AcmBgDHQTZhDNk0XFu0BnO7/ElJA7yvZGsUP6OIdjkipSZeoY1rkKAwszNr/fDBq0X
 SSVB5mxwPjZH54xZ+UGf0SkjmMx7JdmpdbHNBFRA6WgCri/3pXMjmbnSrfZKuxmehL
 iFXtDwWVAD8vfnhmcNNM8nvTWGNb690MjVXMF4wVa1MxJHkwp6Zal+T84trlgfZW5e
 v0LJJkNMmZRP+V3I3DD8WnnudfMDibLfisiqwNpAMI1aeXgDyXbWb9ODTNMr5g++z5
 4mVHMKGb3tNKA==
Message-ID: <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
Date: Fri, 11 Oct 2024 03:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/24 7:22 AM, Liu Ying wrote:
> On 10/09/2024, Marek Vasut wrote:
>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>> results in accurate serializer clock.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>>   drivers/clk/imx/clk-imx8mp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>> index 516dbd170c8a3..2e61d340b8ab7 100644
>> --- a/drivers/clk/imx/clk-imx8mp.c
>> +++ b/drivers/clk/imx/clk-imx8mp.c
>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>   	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>   	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>   	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>> -	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>> +	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
> 
> This patch would cause the below in-flight LDB bridge driver
> patch[1] fail to do display mode validation upon display modes
> read from LVDS to HDMI converter IT6263's DDC I2C bus.

Why ?

Also, please Cc me on fsl-ldb.c patches.

> Unsupported display modes cannot be ruled out.  Note that
> "media_ldb" is derived from "video_pll1_out" by default as the
> parent is set in imx8mp.dtsi.  And, the only 4 rates supported
> by "video_pll1" are listed in imx_pll1443x_tbl[] - 1.0395GHz,
> 650MHz, 594MHz and 519.75MHz.
I disagree with this part, since commit b09c68dc57c9 ("clk: imx: 
pll14xx: Support dynamic rates") the 1443x PLLs can be configured to 
arbitrary rates which for video PLL is desirable as those should produce 
accurate clock.
