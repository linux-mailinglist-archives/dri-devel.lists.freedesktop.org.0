Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2349F71C1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 02:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8855D10E111;
	Thu, 19 Dec 2024 01:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="bqsYXHXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49195.qiye.163.com (mail-m49195.qiye.163.com
 [45.254.49.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AA210E111
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 01:27:22 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 627357bb;
 Thu, 19 Dec 2024 09:27:17 +0800 (GMT+08:00)
Message-ID: <5562ec11-c3f5-4068-8ad0-6e93924228ed@rock-chips.com>
Date: Thu, 19 Dec 2024 09:27:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: dts: rockchip: Add nodes related to eDP1
 for RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-12-damon.ding@rock-chips.com> <2173171.OBFZWjSADL@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <2173171.OBFZWjSADL@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0YS1YZTEgeGkoaTEpCTUlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93dc86bce903a3kunm627357bb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSo6Njo4DjIQLhcOC1FILC5R
 GA0KFA5VSlVKTEhPTkxKTUhCTUxMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJT0pKNwY+
DKIM-Signature: a=rsa-sha256;
 b=bqsYXHXs55Yr1VKXFAqKwbG3pTDI6pOf1MH+lSZfIXS47nhvI1Ig1J6qFhY7XwkQ92eu8xbX6iLMyX+f5DDUzaXBQd6rTVL18AG8SKr3Vz0udw1E9ygX+EJ4UJUevWRSsgYJxph/dEguPtw/SkA/zmtiVeNxhnWtBYr0liA0y8I=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=UfV7vLRVNdO5jRgpw0XUomLCucGuvPX5lVmqJYm7acg=;
 h=date:mime-version:subject:message-id:from;
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

Hi Heiko,

On 2024/12/18 20:45, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Montag, 16. Dezember 2024, 04:12:25 CET schrieb Damon Ding:
>> The related nodes are hdptxphy1_grf, hdptxphy1 and edp1. And the
>> aliases edp0 and edp1 are added to separate two independent eDP
>> devices.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> index 0ce0934ec6b7..17cc0b619744 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
>> @@ -7,6 +7,11 @@
>>   #include "rk3588-extra-pinctrl.dtsi"
>>   
>>   / {
>> +	aliases {
>> +		edp0 = &edp0;
>> +		edp1 = &edp1;
>> +	};
>> +
> 
> drop aliases please

I will drop it and use the registers to separate edp0 and edp1 in the 
next version.

> 
> 
>> @@ -67,6 +72,11 @@ u2phy1_otg: otg-port {
>>   		};
>>   	};
>>   
>> +	hdptxphy1_grf: syscon@fd5e4000 {
>> +		compatible = "rockchip,rk3588-hdptxphy-grf", "syscon";
>> +		reg = <0x0 0xfd5e4000 0x0 0x100>;
>> +	};
>> +
>>   	i2s8_8ch: i2s@fddc8000 {
>>   		compatible = "rockchip,rk3588-i2s-tdm";
>>   		reg = <0x0 0xfddc8000 0x0 0x1000>;
> 
>> @@ -395,6 +434,22 @@ sata-port@0 {
>>   		};
>>   	};
>>   
>> +	hdptxphy1: phy@fed70000 {
>> +		compatible = "rockchip,rk3588-hdptx-phy";
>> +		reg = <0x0 0xfed70000 0x0 0x2000>;
>> +		clocks = <&cru CLK_USB2PHY_HDPTXRXPHY_REF>, <&cru PCLK_HDPTX1>;
>> +		clock-names = "ref", "apb";
>> +		#phy-cells = <0>;
>> +		resets = <&cru SRST_HDPTX1>, <&cru SRST_P_HDPTX1>,
>> +			 <&cru SRST_HDPTX1_INIT>, <&cru SRST_HDPTX1_CMN>,
>> +			 <&cru SRST_HDPTX1_LANE>, <&cru SRST_HDPTX1_ROPLL>,
>> +			 <&cru SRST_HDPTX1_LCPLL>;
>> +		reset-names = "phy", "apb", "init", "cmn", "lane", "ropll",
>> +			      "lcpll";
>> +		rockchip,grf = <&hdptxphy1_grf>;
>> +		status = "disabled";
>> +	};
> 
> the hdptxphy nodes should be their own patch, also because most likely
> Cristian's patch for hdmi1 [0] will be slightly faster.

Indeed, it is good to add edp1 node only.

> 
> 
> [0] https://lore.kernel.org/r/20241211-rk3588-hdmi1-v2-2-02cdca22ff68@collabora.com
> 
> 
> 
> 
> 
Best regards,
Damon

