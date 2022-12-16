Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D564EBBB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735A010E5C8;
	Fri, 16 Dec 2022 12:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1596E10E5C8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:58:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B2CC28524E;
 Fri, 16 Dec 2022 13:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671195495;
 bh=SrDWYfMXP5GCVS+pO3G0mGTpBp9pdPw42Cq2pX8q8qM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KPZijRocGGMbZLODSdUu5zi1QPYuieRl6RRdUI2pOuA0aLbY+UDojgkkC43G3A4F0
 YDT0IFgQayW7dGFc1/DoX26ldvtMc5gK1BXJFIeKNcwxollulS7+vl7fp9CyM1FWyk
 38wlzfekshUAFE6TLoZEf6ONwai5fHKaXJ0bIMoBoOB0baJ2q32xXnx+zVm7aVOu+I
 SwsEZAWvlvH+OCpzcUi/bvjydnYM0e7oKtIrEpMVapM0jJrz4QX3hKJu8GFuXMfTtI
 4mQnvR22NgWvONYiZj4gem1LW7mwT/yinZ3LqOPuoW0ey4ZUU8KtWjpkbIsu6Q4WZE
 GZ0ba6LgKk9NA==
Message-ID: <40166742-eb8c-26f6-cf09-2ff284772f3e@denx.de>
Date: Fri, 16 Dec 2022 13:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Alexander Stein <Alexander.Stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <kcEE.M8v6u+rKTzSz7sYJ8gOMcw.APTbwEsR2QE@vtuxmail01.tq-net.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <kcEE.M8v6u+rKTzSz7sYJ8gOMcw.APTbwEsR2QE@vtuxmail01.tq-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/22 13:41, Alexander Stein wrote:
> Hi,

Hi,

> thanks for the new update.
> 
> Am Mittwoch, 14. Dezember 2022, 13:58:49 CET schrieb Jagan Teki:
>> This series supports common bridge support for Samsung MIPI DSIM
>> which is used in Exynos and i.MX8MM SoC's.
>>
>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>>
>> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
>>
>> Patch 0005 - 0006: optional PHY, PMS_P offset
>>
>> Patch 0007       : introduce hw_type
>>
>> Patch 0008	 : fixing host init
>>
>> Patch 0009	 : atomic_check
>>
>> Patch 0010	 : input_bus_flags
>>
>> Patch 0011	 : atomic_get_input_bus_fmts
>>
>> Patch 0012 - 0013: component vs bridge
>>
>> Patch 0014	 : DSIM bridge
>>
>> Patch 0015 - 0016: i.MX8M Mini/Nano
>>
>> Patch 0017 - 0018: i.MX8M Plus
> 
> Tested using LVDS bridges and works on:
> * imx8mp-tqma8mpql-mba8mpxl (i.MX8M Plus)
> * imx8mm-tqma8mqml-mba8mx (i.MX8M Mini)
> * imx8mn-tqma8mqnl-mba8mx (i.MX8M Nano)
> 
> But I noticed that tqma8mqml and tqma8mqnl only have a stable output if I
> specify 'data-lanes = <0 1 2>' (not <0 1 2 3>!) on the DSI-LVDS-Bridge (TI
> SN65DSI83) input endpoint, e.g.
> 
> dsi_lvds_bridge: bridge@2d {
> 	compatible = "ti,sn65dsi83";
> 	reg = <0x2d>;
> 	enable-gpios = <&gpio_delays 0 130000 0>;
> 	vcc-supply = <&reg_sn65dsi83_1v8>;
> 	status = "okay";
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		port@0 {
> 			reg = <0>;
> 			lvds_bridge_in: endpoint {
> 				data-lanes = <0 1 2>;
> 				remote-endpoint = <&mipi_dsi_out>;
> 			};
> 		};
> 		port@2 {
> 			reg = <2>;
> 			lvds_bridge_out: endpoint {
> 				remote-endpoint = <&panel_in_lvds0>;
> 			};
> 		};
> 	};
> };
> 
> I have no idea if this is on the DSIM side or the DSI-LVDS bridge side.
> Register 0xe5 on sn65dsi83 shows that CHA_LPP_ERR and CHA_SOT_BIT_ERR error
> bits are set, indicating there are low level protocol and SoT leader sequence
> bit errors. I can't find any significant difference in sn65dsi83 driver
> compared to downstream-kernel, so I would assume something in DSIM driver is
> different.

Make sure the HS clock rate expected by the DSI83 bridge chip and the 
one generated by the DSIM bridge from PMS PLL match. There is currently 
no negotiation of this frequency and both sides divine it on their own.

See sn65dsi83_get_dsi_range() and samsung_dsim_set_pll().
