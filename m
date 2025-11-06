Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA0C39B73
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109D110E2C3;
	Thu,  6 Nov 2025 09:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fWpcasVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0825A10E2C3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 09:02:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7686DC0FA8A;
 Thu,  6 Nov 2025 09:02:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 815866068C;
 Thu,  6 Nov 2025 09:02:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EEBC91185075F; Thu,  6 Nov 2025 10:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762419759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=f078UojWE0VpYxjs1DoEL0Omm+9Iq3KqJfAoCFG0lj8=;
 b=fWpcasVFqNPzgfUscMnEvCCqpwUQxWYIYMZN96Wxu8cJoKVXr5PS4BAa0+vjEwVJtU1c/m
 eO9akXbk1NLq8S/SHNB7wU0BCjDIxrZbAvLeGfwYJrLC1L54qhRdx1EFp6RiZ9A31ncQlE
 gvDkycGhpItL3yWQ+DQ4MLktjkI+w3qqRu3W3WgsIVktDsB986QR4en9Hc65UKe0FCvb6L
 6/YIKq3NkMUimp9SBhpd1Kypf1scAEKuhzOPhv2S1I+2yR+nIPwC7BV0kHVEjY0XcWZQlp
 rvDuBttirFsN7xIgpZ/idYw1p0D6nVX4HcT8ZS15BHfyEA97pZwa+dJT6jh3eA==
Message-ID: <1e76e3de-6bf6-4886-83ed-407c96a049ae@bootlin.com>
Date: Thu, 6 Nov 2025 10:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/vkms: Add polling for HPD
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, daniel.stone@collabora.com
References: <20251103174558.7709-1-marius.vlad@collabora.com>
 <20251103174558.7709-4-marius.vlad@collabora.com>
 <cb53bb27-66d8-44ef-beec-48b093f50d8c@bootlin.com>
 <aQoLifqzUrYpZnWW@xpredator>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <aQoLifqzUrYpZnWW@xpredator>
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



Le 04/11/2025 à 15:19, Marius Vlad a écrit :
> On Tue, Nov 04, 2025 at 11:21:28AM +0100, Louis Chauvet wrote:
>>
>>
>> Le 03/11/2025 à 18:45, Marius Vlad a écrit :
>>> vkms is missing any kind of HPD (polling/irq), so add polling to handle
>>> hotplug events.
>>
>> Hi,
> Hi Louis, thanks for the quick reply!
>>
>> I am a bit surprised by this addition, we currently have hotplug/unplug in
>> VKMS using configFS, and it seems to work. The current "irq" system is
>> writing in configFS the status and call drm_kms_helper_hotplug_event after
>> the status is updated [1].
> The situation is that the VKMS connectors/card are also being exposed
> through sysfs similar to real devices. That's where we trigger/simulate
> a connector hot-plug without physically unplugging cables. Wasn't aware
> that VKMS had something similar to that with ConfigFS, so that needs
> adjusting.

Yes, that very recent, I am not surprised that you missed it.

>> I think the polling will not work, I read in the drm_kms_helper_poll_init
>> documentation that the connector is not polled if some connector flags are
>> not set [2]/[3].
> In this case the loop will be no-op, but prior to the loop
> `changed` is set to `changed = dev->mode_config.delayed_event` [1] so
> the code at [2] will do run.

Ho, make sense, thanks for the explanation!

>>
>> If the polling works, I don't think it will be enough for the current VKMS
>> implementation. Currently setting status using configFS will do everything
>> synchronously:
>> - Set the connector status (next call to connector->detect will have the new
>> value)
>> - Call drm_kms_helper_hotplug_event
>>
>> With your implementation, I think you expect something to update
>> connector->status_changed in between, using polling if I understood
>> correctly, which will probably happen after the call to
>> drm_kms_helper_hotplug_event.
> Right, that's another path for VKMS.

Let me know if you have any question about the current implementation, I 
can help if needed.

> [1] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_probe_helper.c#L769
> [2] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_probe_helper.c#L846
> 
>>
>> [1]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/vkms/vkms_connector.c?ref_type=heads#L91-96
>> [2]:https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_probe_helper.c#L917-L918
>> [3]:https://elixir.bootlin.com/linux/v6.17.7/source/drivers/gpu/drm/drm_probe_helper.c#L793
>>
>>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>>> ---
>>>    drivers/gpu/drm/vkms/vkms_drv.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>>> index e8472d9b6e3b..ec815c42ef04 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>> @@ -198,6 +198,9 @@ static int vkms_create(struct vkms_config *config)
>>>    	if (ret)
>>>    		goto out_devres;
>>> +	/* init kms poll for handling hpd */
>>> +	drm_kms_helper_poll_init(&vkms_device->drm);
>>> +
>>>    	drm_client_setup(&vkms_device->drm, NULL);
>>>    	return 0;
>>> @@ -240,6 +243,7 @@ static void vkms_destroy(struct vkms_config *config)
>>>    	fdev = config->dev->faux_dev;
>>> +	drm_kms_helper_poll_fini(&config->dev->drm);
>>>    	drm_dev_unregister(&config->dev->drm);
>>>    	drm_atomic_helper_shutdown(&config->dev->drm);
>>>    	devres_release_group(&fdev->dev, NULL);
>>
>> -- 
>> --
>> Louis Chauvet, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

