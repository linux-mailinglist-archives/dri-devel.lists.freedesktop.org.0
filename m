Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03A99C0C1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF44710E396;
	Mon, 14 Oct 2024 07:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aYLT/vuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vh2CdH8N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aYLT/vuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vh2CdH8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1386610E393;
 Mon, 14 Oct 2024 07:07:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C19821F3D;
 Mon, 14 Oct 2024 07:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728889675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljSern5tZ0V7ON+PH2MzVLA7aqFwEZATrehZwFhcxKA=;
 b=aYLT/vufvzUmve8bvBKmdt7hWazgyBLWzVxK8GjnSx4/Swatsr9QvFnEQgmIJMjC91K2kG
 3nuECGP3uCl4b1uatvMN/CaBUN6PJTZhzsxWkr+OutYBYTuU308r4M6tsIsb/Uu82JrPGY
 vzsCfQ2j6Q6gm2stIDrVzsin+1Of1o0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728889675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljSern5tZ0V7ON+PH2MzVLA7aqFwEZATrehZwFhcxKA=;
 b=vh2CdH8N3Zco4ihXq7nF4g99xlYzY398dD7WO6CtbNvIHE4n79zrzv/zm97oRNTeSP/YBT
 tVkr5x8jWRkONVCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728889675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljSern5tZ0V7ON+PH2MzVLA7aqFwEZATrehZwFhcxKA=;
 b=aYLT/vufvzUmve8bvBKmdt7hWazgyBLWzVxK8GjnSx4/Swatsr9QvFnEQgmIJMjC91K2kG
 3nuECGP3uCl4b1uatvMN/CaBUN6PJTZhzsxWkr+OutYBYTuU308r4M6tsIsb/Uu82JrPGY
 vzsCfQ2j6Q6gm2stIDrVzsin+1Of1o0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728889675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ljSern5tZ0V7ON+PH2MzVLA7aqFwEZATrehZwFhcxKA=;
 b=vh2CdH8N3Zco4ihXq7nF4g99xlYzY398dD7WO6CtbNvIHE4n79zrzv/zm97oRNTeSP/YBT
 tVkr5x8jWRkONVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79EAB13A42;
 Mon, 14 Oct 2024 07:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tEGKHErDDGezVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 07:07:54 +0000
Message-ID: <062b4b40-60d3-40c5-87b7-e7c94223d482@suse.de>
Date: Mon, 14 Oct 2024 09:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] drm/client: Move suspend/resume into DRM client
 callbacks
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>, "javierm@redhat.com" <javierm@redhat.com>,
 "jfalempe@redhat.com" <jfalempe@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-8-tzimmermann@suse.de>
 <CH0PR11MB5444C981845CAE455287FCF5E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CH0PR11MB5444C981845CAE455287FCF5E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,ffwll.ch,gmail.com,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_EQ_ADDR_SOME(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:email, suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

Hi

Am 08.10.24 um 23:21 schrieb Cavitt, Jonathan:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas Zimmermann
> Sent: Tuesday, October 8, 2024 4:59 AM
> To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat.com
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann <tzimmermann@suse.de>
> Subject: [PATCH v3 07/12] drm/client: Move suspend/resume into DRM client callbacks
>> Suspend and resume is still tied to fbdev emulation. Modeset helpers
>> and several drivers call drm_fb_helper_set_suspend_unlocked() to inform
>> the fbdev client about suspend/resume events.
>>
>> To make it work with arbitrary clients, add per-client callback
>> functions for suspend and resume. Implement them for fbdev emulation
>> with the existing drm_fb_helper_set_suspend_unlocked(). Then update
>> DRM's modeset helpers to call the new interface.
>>
>> Clients that are not fbdev can now implement suspend/resume to their
>> requirements.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Some questions below, but nothing blocking.
>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Thanks for reviewing this series.

>
>> ---
>>   drivers/gpu/drm/drm_client_event.c   | 60 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_fbdev_client.c   | 30 +++++++++++++-
>>   drivers/gpu/drm/drm_modeset_helper.c | 14 ++++---
>>   include/drm/drm_client.h             | 35 ++++++++++++++++
>>   include/drm/drm_client_event.h       |  2 +
>>   5 files changed, 133 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
>> index d13d44320c5c..c52e93643672 100644
>> --- a/drivers/gpu/drm/drm_client_event.c
>> +++ b/drivers/gpu/drm/drm_client_event.c
>> @@ -107,6 +107,66 @@ void drm_client_dev_restore(struct drm_device *dev)
>>   	mutex_unlock(&dev->clientlist_mutex);
>>   }
>>   
>> +static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	struct drm_device *dev = client->dev;
>> +	int ret = 0;
>> +
>> +	if (drm_WARN_ON_ONCE(dev, client->suspended))
>> +		return 0;
>> +
>> +	if (client->funcs && client->funcs->suspend)
>> +		ret = client->funcs->suspend(client, holds_console_lock);
>> +	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>> +
>> +	client->suspended = true;
>> +
>> +	return ret;
>> +}
>> +
>> +void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
>> +{
>> +	struct drm_client_dev *client;
>> +
>> +	mutex_lock(&dev->clientlist_mutex);
>> +	list_for_each_entry(client, &dev->clientlist, list) {
>> +		if (!client->suspended)
>> +			drm_client_suspend(client, holds_console_lock);
>> +	}
>> +	mutex_unlock(&dev->clientlist_mutex);
>> +}
>> +EXPORT_SYMBOL(drm_client_dev_suspend);
>> +
>> +static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	struct drm_device *dev = client->dev;
>> +	int ret = 0;
>> +
>> +	if (drm_WARN_ON_ONCE(dev, !client->suspended))
>> +		return 0;
>> +
>> +	if (client->funcs && client->funcs->resume)
>> +		ret = client->funcs->resume(client, holds_console_lock);
>> +	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>> +
>> +	client->suspended = false;
>> +
>> +	return ret;
>> +}
>> +
>> +void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
>> +{
>> +	struct drm_client_dev *client;
>> +
>> +	mutex_lock(&dev->clientlist_mutex);
>> +	list_for_each_entry(client, &dev->clientlist, list) {
>> +		if  (client->suspended)
>> +			drm_client_resume(client, holds_console_lock);
>> +	}
>> +	mutex_unlock(&dev->clientlist_mutex);
>> +}
>> +EXPORT_SYMBOL(drm_client_dev_resume);
> I had to double check, as it seemed a bit weird to have a Boolean "holds_console_lock"
> if it was always going to be False in the use cases presented in this patch, but we do set
> it to True in the Radeon use case in patch 10, so that makes more sense.

I can mention this in the commit message.

>
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
>>   {
>> diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/drm_fbdev_client.c
>> index a09382afe2fb..246fb63ab250 100644
>> --- a/drivers/gpu/drm/drm_fbdev_client.c
>> +++ b/drivers/gpu/drm/drm_fbdev_client.c
>> @@ -61,11 +61,37 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
>>   	return ret;
>>   }
>>   
>> +static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>> +
>> +	if (holds_console_lock)
>> +		drm_fb_helper_set_suspend(fb_helper, true);
>> +	else
>> +		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>> +
>> +	return 0;
>> +}
>> +
>> +static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>> +
>> +	if (holds_console_lock)
>> +		drm_fb_helper_set_suspend(fb_helper, false);
>> +	else
>> +		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>   	.owner		= THIS_MODULE,
>>   	.unregister	= drm_fbdev_client_unregister,
>>   	.restore	= drm_fbdev_client_restore,
>>   	.hotplug	= drm_fbdev_client_hotplug,
>> +	.suspend	= drm_fbdev_client_suspend,
>> +	.resume		= drm_fbdev_client_resume,
>>   };
> Just a question for my own understanding:
>
>
> The expected order of operations here is:
>
> drm_mode_config_helper_suspend calls drm_client_dev_suspend
>
> drm_client_dev_suspend calls drm_client_suspend
>
> drm_client_suspend calls client->funcs->suspend, which for fbdev is
> drm_fbdev_client_suspend
>
> drm_fbdev_client_suspend calls drm_fb_helper_set_suspend(_unlocked)
>
> And, circling back to the start, drm_mode_config_helper_suspend is called by
> several drivers in the suspend case.
>
>
> Is this correct?

Yes, that's what's happening. This patch pushes the driver's direct call 
to drm_fb_helper_() interfaces into a callback of the client. That 
releases the module dependency and other clients can be used as well.

>
>>   
>>   /**
>> @@ -76,8 +102,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>    *
>>    * This function sets up fbdev emulation. Restore, hotplug events and
>>    * teardown are all taken care of. Drivers that do suspend/resume need
>> - * to call drm_fb_helper_set_suspend_unlocked() themselves. Simple
>> - * drivers might use drm_mode_config_helper_suspend().
>> + * to call drm_client_dev_suspend() and drm_client_dev_resume() by
>> + * themselves. Simple drivers might use drm_mode_config_helper_suspend().
>>    *
>>    * This function is safe to call even when there are no connectors present.
>>    * Setup will be retried on the next hotplug event.
>> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
>> index 2c582020cb42..5565464c1734 100644
>> --- a/drivers/gpu/drm/drm_modeset_helper.c
>> +++ b/drivers/gpu/drm/drm_modeset_helper.c
>> @@ -21,7 +21,7 @@
>>    */
>>   
>>   #include <drm/drm_atomic_helper.h>
>> -#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_client_event.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_modeset_helper.h>
>> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(drm_crtc_init);
>>    * Zero on success, negative error code on error.
>>    *
>>    * See also:
>> - * drm_kms_helper_poll_disable() and drm_fb_helper_set_suspend_unlocked().
>> + * drm_kms_helper_poll_disable() and drm_client_dev_suspend().
>>    */
>>   int drm_mode_config_helper_suspend(struct drm_device *dev)
>>   {
>> @@ -199,10 +199,11 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
>>   	if (dev->mode_config.poll_enabled)
>>   		drm_kms_helper_poll_disable(dev);
>>   
>> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
>> +	drm_client_dev_suspend(dev, false);
>>   	state = drm_atomic_helper_suspend(dev);
>>   	if (IS_ERR(state)) {
>> -		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
>> +		drm_client_dev_resume(dev, false);
>> +
>>   		/*
>>   		 * Don't enable polling if it was never initialized
>>   		 */
>> @@ -230,7 +231,7 @@ EXPORT_SYMBOL(drm_mode_config_helper_suspend);
>>    * Zero on success, negative error code on error.
>>    *
>>    * See also:
>> - * drm_fb_helper_set_suspend_unlocked() and drm_kms_helper_poll_enable().
>> + * drm_client_dev_resume() and drm_kms_helper_poll_enable().
>>    */
>>   int drm_mode_config_helper_resume(struct drm_device *dev)
>>   {
>> @@ -247,7 +248,8 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
>>   		DRM_ERROR("Failed to resume (%d)\n", ret);
>>   	dev->mode_config.suspend_state = NULL;
>>   
>> -	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
>> +	drm_client_dev_resume(dev, false);
>> +
>>   	/*
>>   	 * Don't enable polling if it is not initialized
>>   	 */
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index dfd5afcc9463..c03c4b0f3e94 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -63,6 +63,34 @@ struct drm_client_funcs {
>>   	 * This callback is optional.
>>   	 */
>>   	int (*hotplug)(struct drm_client_dev *client);
>> +
>> +	/**
>> +	 * @suspend:
>> +	 *
>> +	 * Called when suspending the device.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * FIXME: Some callers hold the console lock when invoking this
>> +	 *        function. This interferes with fbdev emulation, which
>> +	 *        also tries to acquire the lock. Push the console lock
>> +	 *        into the callback and remove 'holds_console_lock'.
>> +	 */
> Is there an estimated time for the fix to this FIXME?  It's out of scope
> for this series, so I won't insist on fixing it immediately, but if it's a
> "quick" fix (relatively speaking), then we should definitely try to get
> this FIXME resolved in short order.

There's no quick fix AFAICT. Radeon, i915 and xe call 
drm_fb_helper_set_suspend() from various places. These drivers always 
had their own code, so they likely need some work to make the change to 
the _unlocked() helper.

Best regards
Thomas

>
> -Jonathan Cavitt
>
>> +	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
>> +
>> +	/**
>> +	 * @resume:
>> +	 *
>> +	 * Called when resuming the device from suspend.
>> +	 *
>> +	 * This callback is optional.
>> +	 *
>> +	 * FIXME: Some callers hold the console lock when invoking this
>> +	 *        function. This interferes with fbdev emulation, which
>> +	 *        also tries to acquire the lock. Push the console lock
>> +	 *        into the callback and remove 'holds_console_lock'.
>> +	 */
>> +	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
>>   };
>>   
>>   /**
>> @@ -107,6 +135,13 @@ struct drm_client_dev {
>>   	 */
>>   	struct drm_mode_set *modesets;
>>   
>> +	/**
>> +	 * @suspended:
>> +	 *
>> +	 * The client has been suspended.
>> +	 */
>> +	bool suspended;
>> +
>>   	/**
>>   	 * @hotplug_failed:
>>   	 *
>> diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
>> index 2c8915241120..72c97d111169 100644
>> --- a/include/drm/drm_client_event.h
>> +++ b/include/drm/drm_client_event.h
>> @@ -8,5 +8,7 @@ struct drm_device;
>>   void drm_client_dev_unregister(struct drm_device *dev);
>>   void drm_client_dev_hotplug(struct drm_device *dev);
>>   void drm_client_dev_restore(struct drm_device *dev);
>> +void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
>> +void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
>>   
>>   #endif
>> -- 
>> 2.46.0
>>
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

