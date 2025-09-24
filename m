Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5255B99413
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8ED10E6DE;
	Wed, 24 Sep 2025 09:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Y1KCTSO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3294.qiye.163.com (mail-m3294.qiye.163.com
 [220.197.32.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81DF10E6DA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:55:44 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 23e8469d7;
 Wed, 24 Sep 2025 17:55:40 +0800 (GMT+08:00)
Message-ID: <86753f21-1996-4b93-acca-575a193a5bb8@rock-chips.com>
Date: Wed, 24 Sep 2025 17:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
 <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
 <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
 <sgvrzhbhkzxbuybmws44kyenhfyppm3blijkarypcin4fiscvx@mnajrlmicyxi>
 <18f55fe7-7c68-4982-916d-11752325c667@rock-chips.com>
 <bh73nttewwhom2pqccfnapnfkrys3zljkykgqmh4hsdalqgyzi@gbl5oejxsp3z>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <bh73nttewwhom2pqccfnapnfkrys3zljkykgqmh4hsdalqgyzi@gbl5oejxsp3z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997b266d6203abkunm01a8f59e308014
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0aQ1YeGB4eGh4eQ0xDSU1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Y1KCTSO4JB2Doz2nmVMLfKoz+r0EQxAq+gYoHGZXqvPXCT0mGRZDywZEZRoz9311tm43dTuZoGPmpZjkh2jazaj46gvMoh7juipwzZ2A8MY5Xj1mu7G0oCk2vrCsLZaW5K1yYMFNQT3KLOdDEpcrpdoC/5TwZRDqAq6RE9DQtMQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=yJbQmL+TOmkpM0cLVkYWJb1/IVWYDpFb9n/hCp+37zE=;
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

On 9/23/2025 6:40 PM, Dmitry Baryshkov wrote:

> On Tue, Sep 23, 2025 at 05:07:25PM +0800, Chaoyi Chen wrote:
>> On 9/23/2025 11:11 AM, Dmitry Baryshkov wrote:
>>
>>> On Tue, Sep 23, 2025 at 09:34:39AM +0800, Chaoyi Chen wrote:
>>>> On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:
>>>>
>>>>> On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
>>>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> Add default DRM AUX HPD bridge device when register DisplayPort
>>>>>> altmode. That makes it redundant for each Type-C driver to implement
>>>>>> a similar registration process in embedded scenarios.
>>>>>>
>>>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>> ---
>>>>>>     drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
>>>>>>     drivers/usb/typec/altmodes/displayport.h |  2 ++
>>>>>>     drivers/usb/typec/class.c                |  8 +++++++
>>>>>>     include/linux/usb/typec_altmode.h        |  2 ++
>>>>>>     4 files changed, 39 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>>>>>> index 1dcb77faf85d..e026dc6e5430 100644
>>>>>> --- a/drivers/usb/typec/altmodes/displayport.c
>>>>>> +++ b/drivers/usb/typec/altmodes/displayport.c
>>>>>> @@ -14,6 +14,7 @@
>>>>>>     #include <linux/property.h>
>>>>>>     #include <linux/usb/pd_vdo.h>
>>>>>>     #include <linux/usb/typec_dp.h>
>>>>>> +#include <drm/bridge/aux-bridge.h>
>>>>>>     #include <drm/drm_connector.h>
>>>>>>     #include "displayport.h"
>>>>>> @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>>>>>>     				dp->pending_irq_hpd = true;
>>>>>>     		}
>>>>>>     	} else {
>>>>>> +		if (dp->port->hpd_dev)
>>>>>> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>>>>>> +						  hpd ? connector_status_connected :
>>>>>> +							connector_status_disconnected);
>>>>> There should be no need for these calls. Once the HPD bridge is added to
>>>>> a correct fwnode, the drm_connector_oob_hotplug_event() calls should
>>>>> deliver the signal as expected.
>>>> It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.
>>> Other connectors can implement the .oob_hotplug_event call. Calling
>>> drm_bridge_hpd_notify() also depends on the connector setting the
>>> callbacks via drm_bridge_hpd_enable(), a step which is done by only a
>>> few drivers.
>> Hmm, let's go over this again. First, drm_connector_oob_hotplug_event() requires a connector fwnode.
>>
>> On the Qualcomm platforms, the fwnode corresponds to the USB-C controller device node, so
>>
>> drm_connector_oob_hotplug_event(dp->connector_fwnode, ..) can handle them directly.
>>
>> But our platform doesn't use the USB-C controller device node as drm connector fwnode :(
> This sounds like an issue to be fixed. Alternative option would be make
> the AltMode code find your fwnode and report OOB events against it.
> But... I reallly think that using connector's fwnode is the cleanest
> solution. In the end, your final 'display' connector is the USB-C
> connector present on the board. If your display has a USB-C connector,
> that will be the socket that gets the cable from the display, etc.
>
>> So I use drm_dp_hpd_bridge_register() and drm_aux_hpd_bridge_notify() here, I think it just create a simple hpd bridge to bridge_list.
>>
>> But drm_connector_oob_hotplug_event() use connector_list instead of bridge_list.
> The OOB interface was created by x86 people, but we successfully reused
> it. I think that addign drm_bridge_hpd_notify() calls just duplicates
> the effort unnecessarily.

Yes, that commit comment said,  "It was proposed to add the displayport OF property to the DT bindings, but it was rejected in favor of properly describing the electrical signal path using of_graph."

But in the embedded case, we don't seem to have the opportunity to describe this kind of of_graph relationship between drm connector and usb connector in usb-connector.yaml. On the Qualcomm platform, the DRM connector fwnode to correspond to the USB-C controller, which is a clean solution.

However, on our platform we are using external USB-C controllers. In v4 and the previous versions, I focused on directly linking the USB-C controller with the DP controller. Referring to your suggest in [0], I think maybe this can be achieved with the help of the drm bridge chain. Assuming the bridge chain is like this:


Other birdges ... ->PHY drm aux hpd bridge -> CDN-DP bridge -> DP to HDMI bridge or other bridge or nothing...


We can use drm_bridge_chain_get_first_bridge() to get first bridge. In this case, that is drm aux hpd bridge from USB-C controller device. Next, we can obtain the fwnode corresponding to this bridge, and once we have it, we can set the connector's fwnode to it. In this way, drm_connector_oob_hotplug_event() can take effect.


Would this be a good idea? Thanks.


[0] https://lore.kernel.org/all/p3kgqn3euumhysckh4yyqavqv5y6any5zcrgkrcg3j5a7z7cyw@lfpkla5p3put/


>
>>
>>
>>>>>>     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>>>>>     						hpd ? connector_status_connected :
>>>>>>     						      connector_status_disconnected);
>>>>>> @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>>>>>>     	 * configuration is complete to signal HPD.
>>>>>>     	 */
>>>>>>     	if (dp->pending_hpd) {
>>>>>> +		if (dp->port->hpd_dev)
>>>>>> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>>>>>> +						  connector_status_connected);
>>>>>>     		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>>>>>     						connector_status_connected);
>>>>>>     		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>>>>>> @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>>>>>>     			dp->data.status = 0;
>>>>>>     			dp->data.conf = 0;
>>>>>>     			if (dp->hpd) {
>>>>>> +				if (dp->port->hpd_dev)
>>>>>> +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>>>>>> +								  connector_status_disconnected);
>>>>>>     				drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>>>>>     								connector_status_disconnected);
>>>>>>     				dp->hpd = false;
>>>>>> @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
>>>>>>     	NULL,
>>>>>>     };
>>>>>> +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
>>>>>> +{
>>>>>> +	if (alt->svid != USB_TYPEC_DP_SID)
>>>>>> +		return;
>>>>>> +
>>>>>> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>>>>>> +						  dev_of_node(alt->dev.parent->parent));
>>>>> This needs at least a comment, what is dev.parent->parent. Also, the
>>>>> of_node is not correct here. It should be a node of the connector,
>>>>> rather than the device itself. Consider USB-C controllers which handle
>>>>> several USB-C connectors (e.g. UCSI). The DRM core won't be able to
>>>>> identify the correct bridge.
>>>> I think  alt.dev->parent->parent is the connector device. Am I missing something?
>>> As I wrote, it needs a comment (in the source file). No, it's not a
>>> connector device, it's a USB-C controller device. There is no guarantee
>>> that there is a separate struct device for the USB-C connector. On
>>> Qualcomm platforms, the device will point to the USB-C controller (TCPM
>>> or UCSI), which contain usb-c-connector(s) as child node(s) in DT.
>> Thanks for the clarification.
> I think it should be fine to pass the fwnode of the usb-c connector that
> is outside of the USB-C controller device (if that's what your platform
> uses). But I think this should be:
> - the usb-c-connector node
> - it should be coming from the Type-C controller driver, you can't guess
>    it here.
>
>>
>>
>>>>
>>>>>> +	if (IS_ERR(alt->hpd_dev))
>>>>>> +		alt->hpd_dev = NULL;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);
>>>>> Having the function here will bring a typec -> displayport dependency
>>>>> between drivers (which you didn't document). It means it won't be
>>>>> possible to build typec core into the kernel, having the DP AltMode
>>>>> driver in the module (which also doesn't sound like a good idea).
>>>> It make sense. Perhaps moving it into class.c would be a good idea.
>>>>
>>>>
>>>>>> +
>>>>>>     int dp_altmode_probe(struct typec_altmode *alt)
>>>>>>     {
>>>>>>     	const struct typec_altmode *port = typec_altmode_get_partner(alt);
>>>> -- 
>>>> Best,
>>>> Chaoyi
>>>>
>>>>
>>>> -- 
>>>> linux-phy mailing list
>>>> linux-phy@lists.infradead.org
>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
>> -- 
>> Best,
>> Chaoyi
>>
-- 
Best,
Chaoyi

