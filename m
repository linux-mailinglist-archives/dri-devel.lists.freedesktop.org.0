Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D18D8233
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 14:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57BB10E1EC;
	Mon,  3 Jun 2024 12:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="T42Oqge3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 666 seconds by postgrey-1.36 at gabe;
 Mon, 03 Jun 2024 12:26:05 UTC
Received: from mail-m21474.qiye.163.com (mail-m21474.qiye.163.com
 [117.135.214.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC010E1EC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 12:26:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=T42Oqge3PEKYoJZXUq145DpeXsYrv+O067D/RS3vs6er2i0GA9sHqtmJ2luQq/kKwOfxPS4hp4qOSW9yZB4mpzODOhjHcaPwF8cFq4XoUwB2wrjOg9yyike18UrWIT+DWHb0ioInMIqp8AxgUWvkFrJYqgAxDQ7A7XzlBa2y6jI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=G3q+TZ2VuSr0ymGPTBfWfAom9TrDoxMifWuUO2g/VJI=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id A0E6F840DD8;
 Mon,  3 Jun 2024 20:14:33 +0800 (CST)
Message-ID: <ab0a6372-091b-4293-8907-a4b3ff4845c0@rock-chips.com>
Date: Mon, 3 Jun 2024 20:14:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: neil.armstrong@linaro.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkJJSlZKQ0sYTh4eQk9PQ0tVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8fde05d55303a4kunma0e6f840dd8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxg6Fww6EzMCEjghC00pNxhP
 NDkwFChVSlVKTEpMT0pNQ0xOQ0pNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQ09PTTcG
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

Hi Neil:

On 6/3/24 16:55, Neil Armstrong wrote:
> Hi Christian,
> 
> On 01/06/2024 15:12, Cristian Ciocaltea wrote:
>> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
>> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
>>
>> It is HDMI 2.1 compliant and supports the following features, among
>> others:
>>
> .
> 
> ..
> 
>> * SCDC I2C DDC access
>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>> * Multi-stream audio
>> * Enhanced Audio Return Channel (EARC)
> -> Those features were already supported by the HDMI 2.0a compliant HW, just
> list the _new_ features for HDMI 2.1
> 
> I did a quick review of your patchset and I don't understand why you need
> to add a separate dw-hdmi-qp.c since you only need simple variants of the I2C
> bus, infoframe and bridge setup.
> 
> Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller version
> detectable at runtime ?
> 
> I would prefer to keep a single dw-hdmi driver if possible.



The QP HDMI controller is a completely different variant with totally different
registers layout, see PATCH 13/14.
I think make it a separate driver will be easier for development and maintenance.
> 
> Thanks,
> Neil
> 
>>
>> This is the last required component that needs to be supported in order
>> to enable the HDMI output functionality on the RK3588 based SBCs, such
>> as the RADXA Rock 5B. The other components are the Video Output
>> Processor (VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for
>> which basic support has been already made available via [1] and [2],
>> respectively.
>>
>> The patches are grouped as follows:
>> * PATCH 1..7: DW HDMI TX driver refactor to minimize code duplication in
>>    the new QP driver (no functional changes intended)
>>
>> * PATCH 8..11: Rockchip DW HDMI glue driver cleanup/improvements (no
>>    functional changes intended)
>>
>> * PATCH 12..13: The new DW HDMI QP TX driver reusing the previously
>>    exported functions and structs from existing DW HDMI TX driver
>>
>> * PATCH 14: Rockchip DW HDMI glue driver update to support RK3588 and
>>    make use of DW HDMI QP TX
>>
>> They provide just the basic HDMI support for now, i.e. RGB output up to
>> 4K@60Hz, without audio, CEC or any of the HDMI 2.1 specific features.
>> Also note the vop2 driver is currently not able to properly handle all
>> display modes supported by the connected screens, e.g. it doesn't cope
>> with non-integer refresh rates.
>>
>> A possible workaround consists of enabling the display controller to
>> make use of the clock provided by the HDMI PHY PLL. This is still work
>> in progress and will be submitted later, as well as the required DTS
>> updates.
>>
>> To facilitate testing and experimentation, all HDMI output related
>> patches, including those part of this series, are available at [3].
>> So far I could only verify this on the RADXA Rock 3A and 5B boards.
>>
>> Thanks,
>> Cristian
>>
>> [1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
>> [2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
>> [3]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-v6.10-rc1
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Cristian Ciocaltea (14):
>>        drm/bridge: dw-hdmi: Simplify clock handling
>>        drm/bridge: dw-hdmi: Add dw-hdmi-common.h header
>>        drm/bridge: dw-hdmi: Commonize dw_hdmi_i2c_adapter()
>>        drm/bridge: dw-hdmi: Factor out AVI infoframe setup
>>        drm/bridge: dw-hdmi: Factor out vmode setup
>>        drm/bridge: dw-hdmi: Factor out hdmi_data_info setup
>>        drm/bridge: dw-hdmi: Commonize dw_hdmi_connector_create()
>>        drm/rockchip: dw_hdmi: Use modern drm_device based logging
>>        drm/rockchip: dw_hdmi: Simplify clock handling
>>        drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
>>        drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config
>>        dt-bindings: display: rockchip,dw-hdmi: Add compatible for RK3588
>>        drm/bridge: synopsys: Add DW HDMI QP TX controller driver
>>        drm/rockchip: dw_hdmi: Add basic RK3588 support
>>
>>   .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++-
>>   drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +-
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h   | 179 +++++
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 787 +++++++++++++++++++
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 831 +++++++++++++++++++++
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 353 +++------
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 351 +++++++--
>>   include/drm/bridge/dw_hdmi.h                       |   8 +
>>   8 files changed, 2290 insertions(+), 348 deletions(-)
>> ---
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
>> change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc
>>
> 
