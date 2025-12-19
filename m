Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD90CD212C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 23:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F4710F0E2;
	Fri, 19 Dec 2025 22:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gtS0+pfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A2610F0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 22:01:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CAD1F4E41CC2;
 Fri, 19 Dec 2025 22:01:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8D0956071D;
 Fri, 19 Dec 2025 22:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8F0A10AA90A2; Fri, 19 Dec 2025 23:01:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766181665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Hcf0kFeXH7oqQdJ4h33PEPQp1m05Fo5cD4GMBj4xBKU=;
 b=gtS0+pfgoBfTSfM9F/q5Z7G1JYvo665vPP3BBhqlA/6Fgg8JOoH8ciosrqWz2XqfoumeDZ
 SancNmCsbKVYM/Qpqs9ifM3be8rO9U4M30KU7CLfl9XODUA92b26YbB770X9J9F1veL+FJ
 Ss7s2lYFjP0jwGZLj7m9BUuARtEGFRu3Gn4pHPWuK5OQu3MUlcoplL8kH810zLh74x/XLn
 pQDFAIla9RBTRICecWBNvYz1vNOuBnf0YpECNwlVMCcKSlwvCSkc62dy27OmP4ZpAQRA1D
 2ttaYZcGAcSU5moCcSKCGZ0wjDXZg6sZL9PM377hwncs8xHlgLHljHZv5Q2Kbw==
Message-ID: <5b173e9e-bcff-4b19-b16f-fe57796b99ae@bootlin.com>
Date: Fri, 19 Dec 2025 23:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 32/32] drm/vkms: Introduce configfs for dynamic
 connector creation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-32-a49a2d4cba26@bootlin.com>
 <DF2HL69KF83U.GX59AN7IN8L@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2HL69KF83U.GX59AN7IN8L@bootlin.com>
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



On 12/19/25 21:47, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
>> DRM allows the connector to be created after the device. To allows
>> emulating this, add two configfs attributes to connector to allows this.
>>
>> Using the dynamic attribute you can set if a connector will be dynamic or
>> not.
>> Using the enabled attribute, you can set at runtime if a dynamic connector
>> is present or not.
>>
>> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> 
>> @@ -1215,8 +1223,10 @@ static ssize_t connector_type_store(struct config_item *item,
>>   	}
>>
>>   	scoped_guard(mutex, &connector->dev->lock) {
>> -		if (connector->dev->enabled)
>> -			return -EINVAL;
>> +		if (connector->dev->enabled) {
>> +			if (connector_is_enabled(connector->config))
>> +				return -EBUSY;
>> +		}
> 
> You are changing from -EINVAL to -EBUSY. Why? Was -EINVAL wrong in the
> first place?

EINVAL was wrong in the first place, we try to remove EBUSY when you 
can't do something because the device is already enabled and EINVAL when 
the value is false.

> 
> And you can avoid the nested if:
> 
> 		if (connector->dev->enabled && connector_is_enabled(connector->config))
> 			return -E<WHATEVER>;

It is probably a remaining of previous implementation, thanks!

>> +static ssize_t connector_dynamic_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +	bool enabled;
>               ^^^^^^^
>               dynamic
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

