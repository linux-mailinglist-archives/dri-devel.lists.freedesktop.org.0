Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0771B16A76
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 04:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C6710E013;
	Thu, 31 Jul 2025 02:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="RO16iif7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Thu, 31 Jul 2025 02:35:09 UTC
Received: from mail-m6092.netease.com (mail-m6092.netease.com [210.79.60.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0D10E013
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 02:35:09 +0000 (UTC)
Received: from [172.16.12.153]
 (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1dcdf18ba;
 Thu, 31 Jul 2025 10:19:51 +0800 (GMT+08:00)
Message-ID: <63ec11cf-7927-431a-995e-a5fc35ef1ba7@rock-chips.com>
Date: Thu, 31 Jul 2025 10:19:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add Type-C DP support for RK3399 EVB IND board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20250729090032.97-1-kernel@airkyi.com>
 <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3kefqzjewmsyzfvyi33kvlgjd6jphjg3fsnixb3of7yb3xkgs2@hgi6xfkgd653>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a985e475b1003abkunm77c0d17969e27b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpLHlZKTE5DQhgfSUsZSBlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=RO16iif7fvE2I/NqgFVWubst7c5eff+ThID3ba+yjSGE1Deh2av4GXUdv8xcfOjIoQRF5I8v1uaoBxKb/+DD1K1YmFe3nXoNmqmLqsqYOc6GjQA/eU0CqsQeM8yRVB7HTls4tRM/6RHXOdZnkUd6HI2cIMr02K/o8X0yNF8Ofbc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=+TiEqyL1AH0iOF6kXInInA83bu0TufgWM4xm6RFb5sQ=;
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

On 7/31/2025 3:13 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 05:00:27PM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> This series focuses on adding Type-C DP support for USBDP PHY and DP
>> driver. The USBDP PHY and DP will perceive the changes in cable status
>> based on the USB PD and Type-C state machines provided by TCPM. Before
>> this, the USBDP PHY and DP controller of RK3399 sensed cable state
>> changes through extcon, and devices such as the RK3399 Gru-Chromebook
>> rely on them. This series should not break them.
>>
> [....]
>
>> ====
>> 2. DP HPD event notify
>>
>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>> the CDN-DP can be switched to output to one of the PHYs.
>>
>> USB/DP PHY0 ---+
>>                 | <----> CDN-DP controller
>> USB/DP PHY1 ---+
> Could you please clarify this, can you switch DP stream between two
> USB-C outputs? What happens if user plugs in DP dongles in both USB-C
> ports?

Currently, the software simply selects the first available port. So if 
user plugs in DP dongles in both USB-C ports, the DP driver will select 
the first port. This process is implemented in cdn_dp_connected_port() .



>
>> BTW, one of the important things to do is to implement extcon-like
>> notifications. I found include/drm/bridge/aux-bridge.h , but if the
>> aux-bridge is used, the bridge chain would look like this:
>>
>> PHY0 aux-bridge ---+
>>                     | ----> CDN-DP bridge
>> PHY1 aux-bridge ---+
>>
>> Oh, CDN-DP bridge has two previous aux-bridge!
>>
>> Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
>> state between PHY and CDN-DP controller.
> Does it actually work? The OOB HPD event will be repoted for the usb-c
> connector's fwnode, but the DP controller isn't connected to that node
> anyhow. If I'm not mistaken, the HPD signal will not reach DP driver in
> this case.

Yes.  What you mentioned is the case in 
drivers/usb/typec/altmodes/displayport.c . I have also added a new OOB 
event notify in the PHY driver in Patch 3, where the expected fwnode is 
used in the PHY. So now we have two OOB HPD events, one from 
altmodes/displayport.c and the other from PHY. Only the HPD from PHY is 
eventually passed to the DP driver.



>
>> Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
>> Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
>> Patch3 drops CDN-DP's extcon dependency when Type-C is present.
>> Patch4 add missing dp_out port for RK3399 CDN-DP.
>> Patch5 add Type-C DP support for RK3399 EVB IND board.
>>
