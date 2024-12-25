Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEE9FC46A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 10:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78EA10E100;
	Wed, 25 Dec 2024 09:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="kaQs319T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49245.qiye.163.com (mail-m49245.qiye.163.com
 [45.254.49.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAE610E100
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 09:34:21 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6c6e1666;
 Wed, 25 Dec 2024 17:34:17 +0800 (GMT+08:00)
Message-ID: <32c7ef0a-8da6-449a-8f2d-59965aa622ec@rock-chips.com>
Date: Wed, 25 Dec 2024 17:34:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-15-damon.ding@rock-chips.com>
 <cg7bnhol4gvzji7agxazas7nkxy7zammzy67rjvhp35yqyraju@73daepsbmuae>
 <d2b47813-45fa-4148-8a4a-6cf4a18ee7ca@rock-chips.com>
 <CAA8EJpp0Smtqx7VQ5zdg9x3EhuLpk4u4vGv=rv8DHJ0rhei18w@mail.gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <CAA8EJpp0Smtqx7VQ5zdg9x3EhuLpk4u4vGv=rv8DHJ0rhei18w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUweGVYeQk1KSx1MHR9OTEhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93fd2abf9b03a3kunm6c6e1666
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Ehw4NjIcNk4LOEswEgEB
 KDhPCxJVSlVKTEhOSkpCSU5CSUhKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPSk1INwY+
DKIM-Signature: a=rsa-sha256;
 b=kaQs319TgZLgE3daBx/HJEGlYlzgtVyLFOX29FOzekUTHT2VO0cM3Rtl3ZVhJA+lzlxZk0zUL2BKuKKG4P8vmv29QCBtfzvhrskZJiATdGo4/HQ9nqRotKayLndUOxQ8Dww+D7xUD3qnxGbJptgP0wpZI0e4HT7SiKdehVWUlMg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=pWriVfSDH2sEpg8pcOmkXvybXUKi737yhk7CRzVorzU=;
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

Hi Dmitry,

On 2024/12/20 13:38, Dmitry Baryshkov wrote:
> On Fri, 20 Dec 2024 at 04:38, Damon Ding <damon.ding@rock-chips.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 2024/12/20 8:20, Dmitry Baryshkov wrote:
>>> On Thu, Dec 19, 2024 at 04:06:03PM +0800, Damon Ding wrote:
>>>> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
>>>> - Add edp-panel node
>>>> - Set pinctrl of pwm12 for backlight
>>>> - Enable edp0/hdptxphy0/vp2
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - Remove brightness-levels and default-brightness-level properties in
>>>>     backlight node.
>>>> - Add the detail DT changes to commit message.
>>>>
>>>> Changes in v3:
>>>> - Use aux-bus instead of platform bus for edp-panel.
>>>> ---
>>>>    .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
>>>>    1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>> index bc4077575beb..9547ab18e596 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
>>>> @@ -9,6 +9,7 @@
>>>>    #include <dt-bindings/gpio/gpio.h>
>>>>    #include <dt-bindings/input/input.h>
>>>>    #include <dt-bindings/pinctrl/rockchip.h>
>>>> +#include <dt-bindings/soc/rockchip,vop2.h>
>>>>    #include <dt-bindings/usb/pd.h>
>>>>    #include "rk3588s.dtsi"
>>>>
>>>> @@ -238,6 +239,41 @@ &combphy2_psu {
>>>>       status = "okay";
>>>>    };
>>>>
>>>> +&edp0 {
>>>> +    force-hpd;
>>>> +    status = "okay";
>>>> +
>>>> +    aux-bus {
>>>> +            panel {
>>>> +                    compatible = "lg,lp079qx1-sp0v";
>>>
>>> Why do you need the particular compat string here? Can you use the
>>> generic "edp-panel" instead? What if the user swaps the panel?
>>>
>>
>> The eDP panels used in conjunction with the RK3588S EVB1 have broken
>> identification, which is one of the valid reasons for using a particular
>> compat string. So the generic_edp_panel_probe() can not return success
>> when using the "edp-panel".
> 
> Broken how? I don't see such info in the commit message.
> 

The log related to the broken identification may be like:

[    0.623793] panel-simple-dp-aux aux-fdec0000.edp: Unknown panel ETC 
0x0000, using conservative timings

The eDP panel used in RK3588S EVB1 is indeed the LP079QX1_SP0V model, it 
should be also reasonable to use the "lg,lp079qx1-sp0v".

And I will mention all of the above in the commit message for the next 
version.

>>
>>>> +                    backlight = <&backlight>;
>>>> +                    power-supply = <&vcc3v3_lcd_edp>;
>>>> +
>>>> +                    port {
>>>> +                            panel_in_edp: endpoint {
>>>> +                                    remote-endpoint = <&edp_out_panel>;
>>>> +                            };
>>>> +                    };
>>>> +            };
>>>> +    };
>>>> +};
>>>> +
>>>> +&edp0_in {
>>>> +    edp0_in_vp2: endpoint {
>>>> +            remote-endpoint = <&vp2_out_edp0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&edp0_out {
>>>> +    edp_out_panel: endpoint {
>>>> +            remote-endpoint = <&panel_in_edp>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&hdptxphy0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>>    &i2c3 {
>>>>       status = "okay";
>>>>
>>>> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>>>>    };
>>>>
>>>>    &pwm12 {
>>>> +    pinctrl-0 = <&pwm12m1_pins>;
>>>>       status = "okay";
>>>>    };
>>>>
>>>> @@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>>>>               };
>>>>       };
>>>>    };
>>>> +
>>>> +&vop_mmu {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&vop {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&vp2 {
>>>> +    vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
>>>> +            reg = <ROCKCHIP_VOP2_EP_EDP0>;
>>>> +            remote-endpoint = <&edp0_in_vp2>;
>>>> +    };
>>>> +};
>>>> --
>>>> 2.34.1
>>>>

Best regards
Damon

