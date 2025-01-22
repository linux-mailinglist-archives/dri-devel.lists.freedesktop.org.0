Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FEA18E0C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 10:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240610E2E6;
	Wed, 22 Jan 2025 09:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="CG+gEnx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49213.qiye.163.com (mail-m49213.qiye.163.com
 [45.254.49.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678D610E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:05:41 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 96647672;
 Wed, 22 Jan 2025 17:05:37 +0800 (GMT+08:00)
Message-ID: <26c55255-2671-4bb1-aaee-c3145f8698f7@rock-chips.com>
Date: Wed, 22 Jan 2025 17:05:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/20] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, dmitry.baryshkov@linaro.org,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-21-damon.ding@rock-chips.com>
 <8927876.291e.19454e86e8f.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <8927876.291e.19454e86e8f.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkIdHlZMTx4eGRlIGh9LTUxWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a948d42906703a3kunm96647672
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6Iio4STIXEi9IPh5LDBYV
 KTAaCQ5VSlVKTEhMTkhNTEhCSkpLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISkxMNwY+
DKIM-Signature: a=rsa-sha256;
 b=CG+gEnx+XPdVro1zdFzCtUaeVySUsXtaffUl3mFF+lfs47HUrqfKK/fVH37Afw5wPC0Kqr4qZ/Iy2hmAuSnfp6ix+7g6MKIZ7LKrZ7eR1gKfBCu5oy7Kgp7rXs1q97nz1ATOSJb8cQyspPDbsna3Iaagk6FtyLDygDm6807jCQw=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=hsQBhgtpgyLUVlhj2uOdXGpB5uzrnxpQS3g2lRTQAn8=;
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

Hi Andy,

On 2025/1/11 18:28, Andy Yan wrote:
> 
> Hi Damon,
> 
> At 2025-01-09 11:27:25, "Damon Ding" <damon.ding@rock-chips.com> wrote:
>> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
>> - Set pinctrl of pwm12 for backlight
>> - Enable edp0/hdptxphy0/vp2
>> - Add aux-bus/panel nodes
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Remove brightness-levels and default-brightness-level properties in
>>   backlight node.
>> - Add the detail DT changes to commit message.
>>
>> Changes in v3:
>> - Use aux-bus instead of platform bus for edp-panel.
>>
>> Changes in v4:
>> - Add comments related to the use of panel compatible "lg,lp079qx1-sp0v"
>>   in the commit message.
>>
>> Changes in v5:
>> - Use "edp-panel" instead of "lg,lp079qx1-sp0v"
>> - Remove unnecessary comments in commit message
>> - Assign the parent of DCLK_VOP2_SRC to PLL_V0PLL
>> ---
>> .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 54 +++++++++++++++++++
>> 1 file changed, 54 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> index bc4077575beb..a8c151b41e21 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>> @@ -9,6 +9,7 @@
>> #include <dt-bindings/gpio/gpio.h>
>> #include <dt-bindings/input/input.h>
>> #include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/soc/rockchip,vop2.h>
>> #include <dt-bindings/usb/pd.h>
>> #include "rk3588s.dtsi"
>>
>> @@ -238,6 +239,41 @@ &combphy2_psu {
>> 	status = "okay";
>> };
>>
>> +&edp0 {
>> +	force-hpd;
>> +	status = "okay";
>> +
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			backlight = <&backlight>;
>> +			power-supply = <&vcc3v3_lcd_edp>;
>> +
>> +			port {
>> +				panel_in_edp: endpoint {
>> +					remote-endpoint = <&edp_out_panel>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&edp0_in {
>> +	edp0_in_vp2: endpoint {
>> +		remote-endpoint = <&vp2_out_edp0>;
>> +	};
>> +};
>> +
>> +&edp0_out {
>> +	edp_out_panel: endpoint {
>> +		remote-endpoint = <&panel_in_edp>;
>> +	};
>> +};
>> +
>> +&hdptxphy0 {
>> +	status = "okay";
>> +};
>> +
>> &i2c3 {
>> 	status = "okay";
>>
>> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>> };
>>
>> &pwm12 {
>> +	pinctrl-0 = <&pwm12m1_pins>;
>> 	status = "okay";
>> };
>>
>> @@ -1168,3 +1205,20 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>> 		};
>> 	};
>> };
>> +
>> +&vop_mmu {
>> +	status = "okay";
>> +};
>> +
>> +&vop {
>> +	assigned-clocks = <&cru DCLK_VOP2_SRC>;
>> +	assigned-clock-parents = <&cru PLL_V0PLL>;
> 
> It's necessary to explain why we need to  assign V0PLL for DCLK_VOP2_SRC in commit message.
> 
> 

I will add relevant explainations in next version.

>> +	status = "okay";
>> +};
>> +
>> +&vp2 {
>> +	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
>> +		reg = <ROCKCHIP_VOP2_EP_EDP0>;
>> +		remote-endpoint = <&edp0_in_vp2>;
>> +	};
>> +};
>> -- 
>> 2.34.1
>>

Best regards,
Damon

