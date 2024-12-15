Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9B9F21EF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 03:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6746B10E35E;
	Sun, 15 Dec 2024 02:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="PFRY8Kix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m10165.netease.com (mail-m10165.netease.com
 [154.81.10.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39D410E35E
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 02:47:48 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 5bf41739;
 Sun, 15 Dec 2024 10:32:38 +0800 (GMT+08:00)
Message-ID: <e1f0610d-bb63-4b11-88a2-29432529b9f4@rock-chips.com>
Date: Sun, 15 Dec 2024 10:32:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 00/10] Add eDP support for RK3588
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <5939852.zQ0Gbyo6oJ@diego>
Content-Language: en-US
In-Reply-To: <5939852.zQ0Gbyo6oJ@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5JSlYZTUhLT0wfTENJTh5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93c8291fde03a3kunm5bf41739
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PD46CSo4TzIPUSM#ChdCKTgy
 SjwKCghVSlVKTEhPSUlCQk1LSklDVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTEtCNwY+
DKIM-Signature: a=rsa-sha256;
 b=PFRY8KixxPIQEViF7qwLqT/gkORCvKmT17vHXMLWltSgq+Blf9mwMLC2/jBR7T9ZCjXX+xz/TCfaztVTyz+EKWltg6diYHIKj+8z+Hon7+TJazNFF5qSoXvbM+iadgYafNwFWxKxjCPnyaki93zTVanXhcQMY6Csg+ZkKLeRDgU=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=g1p9y8WVTZB74L//6+ABz7CWQWr9pmRvHJbZBmlw+AM=;
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

On 2024/12/6 22:35, Heiko Stübner wrote:
> Hi Daemon,
> 
> Am Mittwoch, 27. November 2024, 08:51:47 CET schrieb Damon Ding:
>> These patchs have been tested with a 1536x2048p60 eDP panel on
>> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
>> on RK3588 EVB1 board.
>>
>> Patch 1~3 are the RK3588 eDP support of Rockchip analogix_dp driver.
>> Patch 4   is the eDP mode support of samsung hdptx phy driver.
>> Patch 5~6 are the Rk3588 eDP support of Aanalogix DP driver. Add phy
>>            interfaces is to configure the HDMI/eDP TX Combo PHY.
>> Patch 7~8 are the renaming of hdptxphy node. It is not only used by
>>            HDMI display but also for the eDP display.
>> Patch 9   is the addition of RK3588 eDP0 node.
>> Patch 10  is to enable the eDP0 display on RK3588S EVB1 board.
> 
> Could you maybe also bring over functionality for real bridge-handling?
> That way we'd have support for things like the dp-connector bridge.
> 
> In the 6.1 vendor-tree I've found commits
> 94e598190128 ("drm/rockchip: analogix_dp: Add support for external bridge")
> 437e0a901b14 ("drm/bridge: analogix_dp: Support split mode for bridge chain")
> 
> needing a bit of cleanup of course, but that would get rid of the driver
> not handling the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag too.
> 
> With a bit of streamlining, we could maybe even get rid of the panel-part
> completely, similar to how the dw-dsi controllers do it [0]
> 
> 

Indeed, the patches related to the bridge support have not been included 
in this series. My intention was to first implement the basic display 
functionality, and then gradually add other features, including the 
support for bridge-handling. Otherwise, this series of patches may be 
too large. :-)

What's more, RK3576 SoC also supports the eDP display, so the subsequent 
patch series will come soon.

> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#n335
> devm_drm_of_get_bridge() combines drm_of_find_panel_or_bridge()
> with devm_drm_panel_bridge_add(), so indepent of it being either a
> panel or other bridge, the driver below only needs to handle bridges.
> 
>> Damon Ding (10):
>>    drm/rockchip: analogix_dp: Use formalized struct definition for grf
>>      field
>>    dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
>>    drm/rockchip: analogix_dp: Add support for RK3588
>>    phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
>>    drm/bridge: analogix_dp: add support for RK3588
>>    drm/bridge: analogix_dp: Add support for phy configuration.
>>    dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
>>      HDMI TX Controller
>>    arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
>>    arm64: dts: rockchip: Add eDP0 node for RK3588
>>    arch64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board
>>
>>   .../rockchip/rockchip,analogix-dp.yaml        |   1 +
>>   .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  33 +-
>>   .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
>>   .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
>>   .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
>>   .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
>>   .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
>>   .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
>>   .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
>>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  84 ++
>>   .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
>>   .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
>>   .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
>>   .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
>>   .../drm/bridge/analogix/analogix_dp_core.c    |   8 +-
>>   .../drm/bridge/analogix/analogix_dp_core.h    |   2 +
>>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  90 ++
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 112 ++-
>>   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 936 +++++++++++++++++-
>>   include/drm/bridge/analogix_dp.h              |   3 +-
>>   26 files changed, 1206 insertions(+), 97 deletions(-)
>>
>>
> 
> 
> 
> 
> 
> 
Best regards,
Damon


