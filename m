Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA9A4214A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A1510E432;
	Mon, 24 Feb 2025 13:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="TtkboSsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973185.qiye.163.com (mail-m1973185.qiye.163.com
 [220.197.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2210E051
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 03:21:07 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id bf356a8d;
 Mon, 24 Feb 2025 11:21:02 +0800 (GMT+08:00)
Message-ID: <731abf8f-b157-47d4-a9e1-9aed6f5b4e37@rock-chips.com>
Date: Mon, 24 Feb 2025 11:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 algea.cao@rock-chips.com, rfoss@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com, dmitry.baryshkov@linaro.org,
 vkoul@kernel.org, andy.yan@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
 <C81810F2-6E9B-4DCC-85D1-CCB63CBFBFEA@gmail.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <C81810F2-6E9B-4DCC-85D1-CCB63CBFBFEA@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtLHlYYHkhNH0oeTh5DHkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9535f8f24203a3kunmbf356a8d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46Djo5AjIXNxwdLSo9TD1L
 FQMwClZVSlVKTE9LSE1MSU1PS09IVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITExLNwY+
DKIM-Signature: a=rsa-sha256;
 b=TtkboSslEuG3O6Q33PmEvHv28Jvg5WyhYR2LFUqcKFp4BOeB/mohA8ndDgbxGn5eNvpe7Fkf8HB8qjnmn2aLu9BlykbGs6RCVL395hZUmPJW9eyvlAmbaEAF23buy2DkdSvordvN2UaJJ3yxiUObEM3aHwA/1rf/oZ7kgAjYhgE=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=SUWTCb0GbfrLEePUqui3jDgm691jrzdjRDy4hq8S9z0=;
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

Hi Piotr,

On 2025/2/14 20:00, Piotr Oniszczuk wrote:
> 
> 
>> Wiadomość napisana przez Sebastian Reichel <sebastian.reichel@collabora.com> w dniu 13 lut 2025, o godz. 18:26:
>>
>> Hello Piotr,
>>
>>
>> The RK3588 has two different DP controllers. The one handled in this
>> series should get the eDP port running, which is routed to the
>> "eDP Panel" in the block diagram on page 3 of the Rock 5 ITX schematics.
>> So this series adds support for using "HDMI/eDP TX0" and "HDMI/eDP TX1"
>> in DP mode.
>>
>> The port routed to HDMI0 via RA620 is the other DP controller, which
>> also exists twice: "TYPEC0/DP0" and "TYPEC1/DP1". This DP controller
>> is not yet supported upstream and there is no pending patchset. As far
>> as I know Rockchip plans to work on preparing upstream support for that
>> soon.

Yes, Andy has recently updated the DP controller related patchset:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=936784

>>
> 
> Oh - this is very valuable info and explains a lot.
> Thx.
> 
>> Note, that the two DisplayPort controllers are completely different.
>> The HDMI/eDP controller is a design from Analogix and the TypeC/DP
>> controller is a design from Synopsys.
>>
>> P.S.: Heiko merged support for HDMI1 (RK3588 SoC level) recently. So you
>> should be able to get that running by some DT additions to the Rock 5
>> ITX board DT with the latest linux-next code :)
>>
> 
> And it works perfectly on all my 3588 bards (including audio and my cec addition)
> But only on boards using both hdmi tx0 and tx1 to hdmi0/hdmi1 ports.
> 
> on rock5 itx:

According to the schematic of ROCK 5 ITX, I find the display routes are:
- DP0 -> TYPEC0 Connector
- DP1 -> RA620 -> HDMI Connector (Andy's patch series will help it work)
- HDMI/eDP TX0 -> eDP Panel (This patch series will help it work)
- HDMI/eDP TX1 -> HDMI Connector

So the HDMI/eDP TX0 should be enabled as eDP in DTS. Maybe it's just a 
test to enable both HDMI0 and HDMI1 in the ROCK 5 ITX board?

> With both hdmi tx0 and tx1 enabled in dts it looks like kernel detects hdmi tx0 as connected and tries read edid.
> As nothing is connected to J11 (eDP con) - i’m getting i2c ddc timeouts
> [   54.188880] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
> [   54.292207] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
> [   54.395554] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
> 

I think the reason may be that HDMI0 is enabled, and HPD pin of HDMI0 is 
also configured, but the HPD pin is in an unstable state in the 
hardware, which is mistakenly detected as connected.

> 
> disabling hdmi0 makes kernel talking to hdmi1 but with issues:
> [    0.540446] dwhdmiqp-rockchip fdea0000.hdmi: registered DesignWare HDMI QP I2C bus driver
> [    0.541230] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops)
> [    0.542285] [drm] Initialized rockchip 1.0.0 for display-subsystem on minor 0
> [    0.542933] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> [    0.543605] rockchip-drm display-subsystem: [drm] Cannot find any crtc or sizes
> 
> and here i’m a bit puzzled as on other 3588 boards (i.e. rock5b) - when i connected monitor to hdmi1 - all works perfectly
> (kernel, OS and app nicely skipping hdmi0 and talking to actually connected hdmi1 port. all works)
> 
> on rock5 itx this not works.
> 
> my observations so far are:
> -on rock5 itx hdmi0 is falsely detected as connected - even when eDP connector (J11) has nothing connected
> -on rock5 itx disabling hdmi0 in dts breaks hdmi1
> -on other 3588 (e.g. rock 5b) disabling hdmi0 in dts NOT breaks hdmi1
> 
> strange….
> 
> 

Best regards
Damon

