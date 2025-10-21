Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7738BF592E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 11:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1F10E2F6;
	Tue, 21 Oct 2025 09:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="g6OhVZ/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32112.qiye.163.com (mail-m32112.qiye.163.com
 [220.197.32.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8932F10E303
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 09:44:17 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26a698a5f;
 Tue, 21 Oct 2025 17:44:12 +0800 (GMT+08:00)
Message-ID: <1221dd6c-2035-4e5d-8052-341da279fe81@rock-chips.com>
Date: Tue, 21 Oct 2025 17:44:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251016022741.91-1-kernel@airkyi.com>
 <20251016022741.91-2-kernel@airkyi.com> <aPYImGmesrZWwyqh@kuha.fi.intel.com>
 <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
 <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a0627a3a903abkunm5cd7977fb8e2b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpDS1YaGRpIHUpDTBlKGU1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=g6OhVZ/yiqpa03UuI1XX7K9vWZ8zWP3G2Gzz5rhk0AcJK/U+UJws7ashU78Y+//2Cp1XYy8iR5A+1sB1SdjmB78dMX58786reFgEn7dhTHoMucj84RbJ6zYHbg7CDu7vWXLe8oopZFd6uuDFaXjD2L3+MUHefnrApM/1yNbvoa0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=qUewYvs5quWL8CZ5KUc8yRAa2rvIV3/2PN0yp7OZqoo=;
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

On 10/21/2025 4:48 PM, Heikki Krogerus wrote:

> Hi,
>
> On Mon, Oct 20, 2025 at 07:07:46PM +0800, Chaoyi Chen wrote:
>> Hi Heikki,
>>
>> On 10/20/2025 6:02 PM, Heikki Krogerus wrote:
>>> On Thu, Oct 16, 2025 at 10:27:34AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> Add default DRM AUX HPD bridge device when register DisplayPort
>>>> altmode. That makes it redundant for each Type-C driver to implement
>>>> a similar registration process in embedded scenarios.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v6:
>>>> - Fix depend in Kconfig.
>>>>
>>>> Changes in v5:
>>>> - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
>>>> - Place the helper functions in the same compilation unit.
>>>> - Add more comments about parent device.
>>>>
>>>>    drivers/usb/typec/Kconfig         |  2 ++
>>>>    drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
>>>>    include/linux/usb/typec_altmode.h |  2 ++
>>>>    3 files changed, 30 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
>>>> index 2f80c2792dbd..a6730fbb576b 100644
>>>> --- a/drivers/usb/typec/Kconfig
>>>> +++ b/drivers/usb/typec/Kconfig
>>>> @@ -2,6 +2,8 @@
>>>>    menuconfig TYPEC
>>>>    	tristate "USB Type-C Support"
>>>> +	depends on DRM || DRM=n
>>>> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>>> This is wrong. DRM should not dictate how this entire subsystem core
>>> is configured. The dependency needs to be on the DRM bridge side.
>>>
>>> You can for example use the bus notification there to see when a new
>>> alternate mode is being registered, or use some other notification
>>> mechanism.
>> Is it a good idea to implement notification functions like
>> drivers/usb/core/notify.c in TCPM, and then let other subsystems (such as DRM)
>> listen to these notifications?
> Don't limit this to tcpm only. I would suggest something similar what
> we have for usb bus: drivers/usb/core/notify.c
>
> So that, but for the typec bus. Then in DRM bridge code you just use
> typec_register/unregister_notify().

I will try to add drivers/usb/typec/notify.c in v7 to implement this. Thank you.


>
> thanks,
>
-- 
Best,
Chaoyi

