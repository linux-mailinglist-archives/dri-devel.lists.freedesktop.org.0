Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6771C0F990
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3421110E160;
	Mon, 27 Oct 2025 17:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vDPIC4MJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A5A10E160
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:19:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B26E4C0BE89;
 Mon, 27 Oct 2025 17:18:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAA396062C;
 Mon, 27 Oct 2025 17:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E11B102F2511; Mon, 27 Oct 2025 18:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761585543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=sSU0ag5tU7UPuxm6wAIXvnDQvb8U9UV7G9NghSUTwJ8=;
 b=vDPIC4MJNxDtLNnkF1NFYRE7ziLEeBkhZnsjWFTYyVd6CyNvC56HlsjieAul1tBlUyUhTI
 lWAhLKDt40J5YFSRevHnRqFxbpILTj5XwxJ3hnF3t+Y5eu0WBMGOlCKcv3y9AnMV4RwWTS
 koL+bZ/CgpGWjXYA9rIWo8D3iUQqqpK+p4hX2Va4WMmojNUXHq4dXwHj1Qng66Bysq467A
 Egfz4mhjVztbNW0eh0q3HCsftk7G6/a5c1pSR8H4UN4C7mTFnwwwLyhwdDyd3fXWyxul5P
 uUHRakiaJwCwG+xbQg4CDRUyWTxvH/2MfZeWFnX6CJkGwwkw8Kwq137f2PVCQA==
Message-ID: <88099b50-3b19-4080-a241-d8caddbf06e9@bootlin.com>
Date: Mon, 27 Oct 2025 18:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] drm/vkms: Introduce configfs for connector EDID
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>
 <aP9GawE3nY082QJs@fedora>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <aP9GawE3nY082QJs@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 27/10/2025 à 11:16, José Expósito a écrit :
> On Sat, Oct 18, 2025 at 04:01:19AM +0200, Louis Chauvet wrote:
>> Introduce new attributes to configure EDID of a connector:
>> - edid_enable - chose if the connector will have an EDD or not
>> - edid - raw edid content
>>
>> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
>> x86), it should be sufficient for many tests. One possible evolution is
>> using a ConfigFS blob to allow bigger EDID.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
> 
> Hey Louis,
> 
> I wasn't able to set the EDID, could you provide an example?

Your usage is good, I expect it to work

But I forgot one very important call, probably lost during my multiple 
rebases: drm_connector_attach_edid_property

But you also need to call modetest to properly refresh the EDID property 
(I don't know exactly how it works, but if I don't call modetest first, 
drm_info does not see the EDID)

> This is what I tried:
> 
> # I'm using QEMU's EDID:
> $ cat /sys/class/drm/card0-Virtual-1/edid > qemu-edid.bin
> 
> # Create a simple device:
> $ sudo mkdir /sys/kernel/config/vkms/gpu1 && \
> sudo mkdir /sys/kernel/config/vkms/gpu1/planes/plane0  && \
> echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/type && \
> sudo mkdir /sys/kernel/config/vkms/gpu1/crtcs/crtc0 && \
> echo "0" | sudo tee /sys/kernel/config/vkms/gpu1/crtcs/crtc0/writeback && \
> sudo mkdir /sys/kernel/config/vkms/gpu1/encoders/encoder0 && \
> sudo mkdir /sys/kernel/config/vkms/gpu1/connectors/connector0 && \
> sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/planes/plane0/possible_crtcs && \
> sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/encoders/encoder0/possible_crtcs && \
> sudo ln -s /sys/kernel/config/vkms/gpu1/encoders/encoder0 /sys/kernel/config/vkms/gpu1/connectors/connector0/possible_encoders
> 
> $ cat qemu-edid.bin | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid
> 
> # The EDID is stored and it is correct:
> $ cat /sys/kernel/config/vkms/gpu1/connectors/connector0/edid | edid-decode
> 
> $ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid_enabled
> $ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/enabled
> 
> # After enabling the device, the EDID is not present:
> $ cat /sys/class/drm/card1-Virtual-2/edid
> <empty>
> 
> And drm_info does not show the EDID property.
> 
> Am I missing something?
> 
>>   Documentation/gpu/vkms.rst           |  5 ++-
>>   drivers/gpu/drm/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++++-
>>   2 files changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>> index 650d6f6e79fd..bbd03f61e61c 100644
>> --- a/Documentation/gpu/vkms.rst
>> +++ b/Documentation/gpu/vkms.rst
>> @@ -135,7 +135,7 @@ Last but not least, create one or more connectors::
>>   
>>     sudo mkdir /config/vkms/my-vkms/connectors/connector0
>>   
>> -Connectors have 3 configurable attribute:
>> +Connectors have 5 configurable attribute:
>>   
>>   - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>>     as those exposed by the "status" property of a connector)
>> @@ -144,6 +144,9 @@ Connectors have 3 configurable attribute:
>>     If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
>>     Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
>>     for full list.
>> +- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
>> +  EDID but just a list of modes, this attribute allows to disable EDID property.
>> +- edid: Content of the EDID. Ignored if edid_enabled is not set
>>   
>>   
>>   To finish the configuration, link the different pipeline items::
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index 909f4557caec..a977c0842cd6 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -1,5 +1,4 @@
>>   // SPDX-License-Identifier: GPL-2.0+
>> -#include "asm-generic/errno-base.h"
>>   #include <linux/cleanup.h>
>>   #include <linux/configfs.h>
>>   #include <linux/mutex.h>
>> @@ -1222,14 +1221,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
>>   	return count;
>>   }
>>   
>> +static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +	bool enabled;
>> +
>> +	connector = connector_item_to_vkms_configfs_connector(item);
>> +
>> +	scoped_guard(mutex, &connector->dev->lock)
>> +		enabled = vkms_config_connector_get_edid_enabled(connector->config);
>> +
>> +	return sprintf(page, "%d\n", enabled);
>> +}
>> +
>> +static ssize_t connector_edid_enabled_store(struct config_item *item,
>> +					    const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +	struct vkms_config_connector *connector_cfg;
>> +	bool enabled;
>> +
>> +	connector = connector_item_to_vkms_configfs_connector(item);
>> +	connector_cfg = connector->config;
>> +
>> +	if (kstrtobool(page, &enabled))
>> +		return -EINVAL;
>> +
>> +	scoped_guard(mutex, &connector->dev->lock)
>> +	{
>> +		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
>> +
>> +		if (connector->dev->enabled &&
>> +		    vkms_config_connector_get_status(connector_cfg) !=
>> +		    connector_status_disconnected)
>> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>> +	}
>> +	return count;
>> +}
>> +
>> +static ssize_t connector_edid_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +
>> +	connector = connector_item_to_vkms_configfs_connector(item);
>> +
>> +	scoped_guard(mutex, &connector->dev->lock)
>> +	{
>> +		unsigned int len = 0;
>> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
>> +
>> +		memcpy(page, edid, min(len, PAGE_SIZE));
>> +		return min(len, PAGE_SIZE);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static ssize_t connector_edid_store(struct config_item *item,
>> +				    const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +
>> +	connector = connector_item_to_vkms_configfs_connector(item);
>> +
>> +	scoped_guard(mutex, &connector->dev->lock)
>> +	{
>> +		vkms_config_connector_set_edid(connector->config, page, count);
>> +
>> +		if (connector->dev->enabled &&
>> +		    vkms_config_connector_get_status(connector->config) !=
>> +		    connector_status_disconnected)
>> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>>   CONFIGFS_ATTR(connector_, status);
>>   CONFIGFS_ATTR(connector_, type);
>>   CONFIGFS_ATTR(connector_, supported_colorspaces);
>> +CONFIGFS_ATTR(connector_, edid_enabled);
>> +CONFIGFS_ATTR(connector_, edid);
>>   
>>   static struct configfs_attribute *connector_item_attrs[] = {
>>   	&connector_attr_status,
>>   	&connector_attr_type,
>>   	&connector_attr_supported_colorspaces,
>> +	&connector_attr_edid_enabled,
>> +	&connector_attr_edid,
>>   	NULL,
>>   };
>>   
>>
>> -- 
>> 2.51.0
>>

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

