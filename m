Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFEB93E50
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DAE10E518;
	Tue, 23 Sep 2025 01:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="MjfxaMhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Tue, 23 Sep 2025 01:39:46 UTC
Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com
 [45.254.49.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F8210E518
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:39:46 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 23b40ab11;
 Tue, 23 Sep 2025 09:34:40 +0800 (GMT+08:00)
Message-ID: <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
Date: Tue, 23 Sep 2025 09:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997435663e03abkunm07394047b1283
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh4YGFYaGEpNHhgfTEMfTEhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=MjfxaMhNkqVIf6KIftsHcjWQjPy60e0dSApxnsFiS9Qu1sfUfcvJyU5z6a33gqxVLbb31H5++TZnQmck5JY8z57VOUa8oO42/qIsf6slYgGkDj/cgC6R8JawKVaFE3otXI8iphPEHWrsMK8FR4fierrjGEFZ3csE3Er9o1IYxn0=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=nqVqLM0pFpqbw/sVgseWDxAxw4GetnCa6cznE3P0mpg=;
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

On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:

> On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Add default DRM AUX HPD bridge device when register DisplayPort
>> altmode. That makes it redundant for each Type-C driver to implement
>> a similar registration process in embedded scenarios.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
>>   drivers/usb/typec/altmodes/displayport.h |  2 ++
>>   drivers/usb/typec/class.c                |  8 +++++++
>>   include/linux/usb/typec_altmode.h        |  2 ++
>>   4 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index 1dcb77faf85d..e026dc6e5430 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/property.h>
>>   #include <linux/usb/pd_vdo.h>
>>   #include <linux/usb/typec_dp.h>
>> +#include <drm/bridge/aux-bridge.h>
>>   #include <drm/drm_connector.h>
>>   #include "displayport.h"
>>   
>> @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>>   				dp->pending_irq_hpd = true;
>>   		}
>>   	} else {
>> +		if (dp->port->hpd_dev)
>> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>> +						  hpd ? connector_status_connected :
>> +							connector_status_disconnected);
> There should be no need for these calls. Once the HPD bridge is added to
> a correct fwnode, the drm_connector_oob_hotplug_event() calls should
> deliver the signal as expected.

It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.


>
>>   		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>   						hpd ? connector_status_connected :
>>   						      connector_status_disconnected);
>> @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>>   	 * configuration is complete to signal HPD.
>>   	 */
>>   	if (dp->pending_hpd) {
>> +		if (dp->port->hpd_dev)
>> +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>> +						  connector_status_connected);
>>   		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>   						connector_status_connected);
>>   		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>> @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>>   			dp->data.status = 0;
>>   			dp->data.conf = 0;
>>   			if (dp->hpd) {
>> +				if (dp->port->hpd_dev)
>> +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
>> +								  connector_status_disconnected);
>>   				drm_connector_oob_hotplug_event(dp->connector_fwnode,
>>   								connector_status_disconnected);
>>   				dp->hpd = false;
>> @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
>>   	NULL,
>>   };
>>   
>> +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
>> +{
>> +	if (alt->svid != USB_TYPEC_DP_SID)
>> +		return;
>> +
>> +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
>> +						  dev_of_node(alt->dev.parent->parent));
> This needs at least a comment, what is dev.parent->parent. Also, the
> of_node is not correct here. It should be a node of the connector,
> rather than the device itself. Consider USB-C controllers which handle
> several USB-C connectors (e.g. UCSI). The DRM core won't be able to
> identify the correct bridge.

I think  alt.dev->parent->parent is the connector device. Am I missing something?



>
>> +	if (IS_ERR(alt->hpd_dev))
>> +		alt->hpd_dev = NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);
> Having the function here will bring a typec -> displayport dependency
> between drivers (which you didn't document). It means it won't be
> possible to build typec core into the kernel, having the DP AltMode
> driver in the module (which also doesn't sound like a good idea).

It make sense. Perhaps moving it into class.c would be a good idea.


>
>> +
>>   int dp_altmode_probe(struct typec_altmode *alt)
>>   {
>>   	const struct typec_altmode *port = typec_altmode_get_partner(alt);

-- 
Best,
Chaoyi

