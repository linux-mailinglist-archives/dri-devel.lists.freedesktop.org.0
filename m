Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895DBB0C05
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD6D10E702;
	Wed,  1 Oct 2025 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DYZgpA4E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9y65HclI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DYZgpA4E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9y65HclI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0710E6EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:39:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 48B171F7B7;
 Wed,  1 Oct 2025 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759329594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bFaBz7DcwAUQoUHhDf1TjuNHYD70SQcIcwLIkpMDcsY=;
 b=DYZgpA4EnII86+UPEeXZxENEv1c7mAJagKcA7is5UDPjzutxTvVI2joDGFAj+aMaadXK5i
 sTydPurSWcS/HDarZ5MLcOv5XAiVP/JcRBUaigU6N8eFRxpwHsxj3EwqyMoaZSgUgVs2eD
 beBRIFHl/+9HGa1GCkgw9UDao4w6hrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759329594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bFaBz7DcwAUQoUHhDf1TjuNHYD70SQcIcwLIkpMDcsY=;
 b=9y65HclIusmbVhRREH82MoGESNTZTxPDv36r7fFDHxHlux7rkYSfequi19kBboksvhXO+b
 W3EN717TRw8cLDDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DYZgpA4E;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9y65HclI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759329594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bFaBz7DcwAUQoUHhDf1TjuNHYD70SQcIcwLIkpMDcsY=;
 b=DYZgpA4EnII86+UPEeXZxENEv1c7mAJagKcA7is5UDPjzutxTvVI2joDGFAj+aMaadXK5i
 sTydPurSWcS/HDarZ5MLcOv5XAiVP/JcRBUaigU6N8eFRxpwHsxj3EwqyMoaZSgUgVs2eD
 beBRIFHl/+9HGa1GCkgw9UDao4w6hrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759329594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bFaBz7DcwAUQoUHhDf1TjuNHYD70SQcIcwLIkpMDcsY=;
 b=9y65HclIusmbVhRREH82MoGESNTZTxPDv36r7fFDHxHlux7rkYSfequi19kBboksvhXO+b
 W3EN717TRw8cLDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C16B713A42;
 Wed,  1 Oct 2025 14:39:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 70bCLTk93WgVKgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Oct 2025 14:39:53 +0000
Message-ID: <eecf1071-55a4-4cbe-bd8e-a00e5ef9b8ce@suse.de>
Date: Wed, 1 Oct 2025 16:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Nirmoy Das <nirmoyd@nvidia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, lyude@redhat.com, dakr@kernel.org,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20251001121610.367243-1-tzimmermann@suse.de>
 <f0cc9358-98b2-48c4-b080-c16728dcd40b@nvidia.com>
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
In-Reply-To: <f0cc9358-98b2-48c4-b080-c16728dcd40b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[18]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 48B171F7B7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 01.10.25 um 14:46 schrieb Nirmoy Das:
>
> On 01.10.25 14:15, Thomas Zimmermann wrote:
>> No caller of the client resume/suspend helpers holds the console
>> lock. The last such cases were removed from radeon in the patch
>> series at [1]. Now remove the related parameter and the TODO items.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Link: https://patchwork.freedesktop.org/series/151624/ # [1]
> Acked-by: Nirmoy Das <nirmoyd@nvidia.com>

Thanks. I sent out an update that addresses the CI issue before seeing 
your a-b, but it will be included when the patch lands.

Best regards
Thomas

>> ---
>> This patch would preferably be merged through drm-misc.
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++----
>>   drivers/gpu/drm/clients/drm_fbdev_client.c | 14 ++++----------
>>   drivers/gpu/drm/clients/drm_log.c          |  4 ++--
>>   drivers/gpu/drm/drm_client_event.c         | 16 ++++++++--------
>>   drivers/gpu/drm/drm_modeset_helper.c       |  6 +++---
>>   drivers/gpu/drm/i915/i915_driver.c         |  6 +++---
>>   drivers/gpu/drm/nouveau/nouveau_display.c  |  4 ++--
>>   drivers/gpu/drm/radeon/radeon_device.c     |  4 ++--
>>   drivers/gpu/drm/xe/display/xe_display.c    |  6 +++---
>>   include/drm/drm_client.h                   | 14 ++------------
>>   include/drm/drm_client_event.h             |  4 ++--
>>   11 files changed, 35 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index a77000c2e0bb..f068e26d5080 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5212,7 +5212,7 @@ int amdgpu_device_suspend(struct drm_device 
>> *dev, bool notify_clients)
>>           dev_warn(adev->dev, "smart shift update failed\n");
>>         if (notify_clients)
>> -        drm_client_dev_suspend(adev_to_drm(adev), false);
>> +        drm_client_dev_suspend(adev_to_drm(adev));
>> cancel_delayed_work_sync(&adev->delayed_init_work);
>>   @@ -5346,7 +5346,7 @@ int amdgpu_device_resume(struct drm_device 
>> *dev, bool notify_clients)
>>       flush_delayed_work(&adev->delayed_init_work);
>>         if (notify_clients)
>> -        drm_client_dev_resume(adev_to_drm(adev), false);
>> +        drm_client_dev_resume(adev_to_drm(adev));
>>         amdgpu_ras_resume(adev);
>>   @@ -5951,7 +5951,7 @@ int amdgpu_device_reinit_after_reset(struct 
>> amdgpu_reset_context *reset_context)
>>                   if (r)
>>                       goto out;
>>   -                drm_client_dev_resume(adev_to_drm(tmp_adev), false);
>> +                drm_client_dev_resume(adev_to_drm(tmp_adev));
>>                     /*
>>                    * The GPU enters bad state once faulty pages
>> @@ -6286,7 +6286,7 @@ static void 
>> amdgpu_device_halt_activities(struct amdgpu_device *adev,
>>            */
>>           amdgpu_unregister_gpu_instance(tmp_adev);
>>   -        drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
>> +        drm_client_dev_suspend(adev_to_drm(tmp_adev));
>>             /* disable ras on ALL IPs */
>>           if (!need_emergency_restart && !amdgpu_reset_in_dpc(adev) &&
>> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c 
>> b/drivers/gpu/drm/clients/drm_fbdev_client.c
>> index f894ba52bdb5..ec5ab9f30547 100644
>> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
>> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
>> @@ -62,26 +62,20 @@ static int drm_fbdev_client_hotplug(struct 
>> drm_client_dev *client)
>>       return ret;
>>   }
>>   -static int drm_fbdev_client_suspend(struct drm_client_dev *client, 
>> bool holds_console_lock)
>> +static int drm_fbdev_client_suspend(struct drm_client_dev *client)
>>   {
>>       struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>>   -    if (holds_console_lock)
>> -        drm_fb_helper_set_suspend(fb_helper, true);
>> -    else
>> -        drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>> +    drm_fb_helper_set_suspend_unlocked(fb_helper, true);
>>         return 0;
>>   }
>>   -static int drm_fbdev_client_resume(struct drm_client_dev *client, 
>> bool holds_console_lock)
>> +static int drm_fbdev_client_resume(struct drm_client_dev *client)
>>   {
>>       struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>>   -    if (holds_console_lock)
>> -        drm_fb_helper_set_suspend(fb_helper, false);
>> -    else
>> -        drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>> +    drm_fb_helper_set_suspend_unlocked(fb_helper, false);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/clients/drm_log.c 
>> b/drivers/gpu/drm/clients/drm_log.c
>> index d239f1e3c456..fd8556dd58ed 100644
>> --- a/drivers/gpu/drm/clients/drm_log.c
>> +++ b/drivers/gpu/drm/clients/drm_log.c
>> @@ -319,7 +319,7 @@ static int drm_log_client_hotplug(struct 
>> drm_client_dev *client)
>>       return 0;
>>   }
>>   -static int drm_log_client_suspend(struct drm_client_dev *client, 
>> bool _console_lock)
>> +static int drm_log_client_suspend(struct drm_client_dev *client)
>>   {
>>       struct drm_log *dlog = client_to_drm_log(client);
>>   @@ -328,7 +328,7 @@ static int drm_log_client_suspend(struct 
>> drm_client_dev *client, bool _console_l
>>       return 0;
>>   }
>>   -static int drm_log_client_resume(struct drm_client_dev *client, 
>> bool _console_lock)
>> +static int drm_log_client_resume(struct drm_client_dev *client)
>>   {
>>       struct drm_log *dlog = client_to_drm_log(client);
>>   diff --git a/drivers/gpu/drm/drm_client_event.c 
>> b/drivers/gpu/drm/drm_client_event.c
>> index c83196ad8b59..c3baeb4d4e6b 100644
>> --- a/drivers/gpu/drm/drm_client_event.c
>> +++ b/drivers/gpu/drm/drm_client_event.c
>> @@ -122,7 +122,7 @@ void drm_client_dev_restore(struct drm_device *dev)
>>       mutex_unlock(&dev->clientlist_mutex);
>>   }
>>   -static int drm_client_suspend(struct drm_client_dev *client, bool 
>> holds_console_lock)
>> +static int drm_client_suspend(struct drm_client_dev *client)
>>   {
>>       struct drm_device *dev = client->dev;
>>       int ret = 0;
>> @@ -131,7 +131,7 @@ static int drm_client_suspend(struct 
>> drm_client_dev *client, bool holds_console_
>>           return 0;
>>         if (client->funcs && client->funcs->suspend)
>> -        ret = client->funcs->suspend(client, holds_console_lock);
>> +        ret = client->funcs->suspend(client);
>>       drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>>         client->suspended = true;
>> @@ -139,20 +139,20 @@ static int drm_client_suspend(struct 
>> drm_client_dev *client, bool holds_console_
>>       return ret;
>>   }
>>   -void drm_client_dev_suspend(struct drm_device *dev, bool 
>> holds_console_lock)
>> +void drm_client_dev_suspend(struct drm_device *dev)
>>   {
>>       struct drm_client_dev *client;
>>         mutex_lock(&dev->clientlist_mutex);
>>       list_for_each_entry(client, &dev->clientlist, list) {
>>           if (!client->suspended)
>> -            drm_client_suspend(client, holds_console_lock);
>> +            drm_client_suspend(client);
>>       }
>>       mutex_unlock(&dev->clientlist_mutex);
>>   }
>>   EXPORT_SYMBOL(drm_client_dev_suspend);
>>   -static int drm_client_resume(struct drm_client_dev *client, bool 
>> holds_console_lock)
>> +static int drm_client_resume(struct drm_client_dev *client)
>>   {
>>       struct drm_device *dev = client->dev;
>>       int ret = 0;
>> @@ -161,7 +161,7 @@ static int drm_client_resume(struct 
>> drm_client_dev *client, bool holds_console_l
>>           return 0;
>>         if (client->funcs && client->funcs->resume)
>> -        ret = client->funcs->resume(client, holds_console_lock);
>> +        ret = client->funcs->resume(client);
>>       drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
>>         client->suspended = false;
>> @@ -172,14 +172,14 @@ static int drm_client_resume(struct 
>> drm_client_dev *client, bool holds_console_l
>>       return ret;
>>   }
>>   -void drm_client_dev_resume(struct drm_device *dev, bool 
>> holds_console_lock)
>> +void drm_client_dev_resume(struct drm_device *dev)
>>   {
>>       struct drm_client_dev *client;
>>         mutex_lock(&dev->clientlist_mutex);
>>       list_for_each_entry(client, &dev->clientlist, list) {
>>           if  (client->suspended)
>> -            drm_client_resume(client, holds_console_lock);
>> +            drm_client_resume(client);
>>       }
>>       mutex_unlock(&dev->clientlist_mutex);
>>   }
>> diff --git a/drivers/gpu/drm/drm_modeset_helper.c 
>> b/drivers/gpu/drm/drm_modeset_helper.c
>> index 988735560570..a57f6a10ada4 100644
>> --- a/drivers/gpu/drm/drm_modeset_helper.c
>> +++ b/drivers/gpu/drm/drm_modeset_helper.c
>> @@ -203,10 +203,10 @@ int drm_mode_config_helper_suspend(struct 
>> drm_device *dev)
>>       if (dev->mode_config.poll_enabled)
>>           drm_kms_helper_poll_disable(dev);
>>   -    drm_client_dev_suspend(dev, false);
>> +    drm_client_dev_suspend(dev);
>>       state = drm_atomic_helper_suspend(dev);
>>       if (IS_ERR(state)) {
>> -        drm_client_dev_resume(dev, false);
>> +        drm_client_dev_resume(dev);
>>             /*
>>            * Don't enable polling if it was never initialized
>> @@ -252,7 +252,7 @@ int drm_mode_config_helper_resume(struct 
>> drm_device *dev)
>>           DRM_ERROR("Failed to resume (%d)\n", ret);
>>       dev->mode_config.suspend_state = NULL;
>>   -    drm_client_dev_resume(dev, false);
>> +    drm_client_dev_resume(dev);
>>         /*
>>        * Don't enable polling if it is not initialized
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index 95165e45de74..162e50315beb 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -978,7 +978,7 @@ void i915_driver_shutdown(struct drm_i915_private 
>> *i915)
>>       intel_runtime_pm_disable(&i915->runtime_pm);
>>       intel_power_domains_disable(display);
>>   -    drm_client_dev_suspend(&i915->drm, false);
>> +    drm_client_dev_suspend(&i915->drm);
>>       if (intel_display_device_present(display)) {
>>           drm_kms_helper_poll_disable(&i915->drm);
>>           intel_display_driver_disable_user_access(display);
>> @@ -1060,7 +1060,7 @@ static int i915_drm_suspend(struct drm_device 
>> *dev)
>>       /* We do a lot of poking in a lot of registers, make sure they 
>> work
>>        * properly. */
>>       intel_power_domains_disable(display);
>> -    drm_client_dev_suspend(dev, false);
>> +    drm_client_dev_suspend(dev);
>>       if (intel_display_device_present(display)) {
>>           drm_kms_helper_poll_disable(dev);
>>           intel_display_driver_disable_user_access(display);
>> @@ -1257,7 +1257,7 @@ static int i915_drm_resume(struct drm_device *dev)
>>         intel_opregion_resume(display);
>>   -    drm_client_dev_resume(dev, false);
>> +    drm_client_dev_resume(dev);
>>         intel_power_domains_enable(display);
>>   diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c 
>> b/drivers/gpu/drm/nouveau/nouveau_display.c
>> index 54aed3656a4c..00515623a2cc 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> @@ -765,7 +765,7 @@ nouveau_display_suspend(struct drm_device *dev, 
>> bool runtime)
>>   {
>>       struct nouveau_display *disp = nouveau_display(dev);
>>   -    drm_client_dev_suspend(dev, false);
>> +    drm_client_dev_suspend(dev);
>>         if (drm_drv_uses_atomic_modeset(dev)) {
>>           if (!runtime) {
>> @@ -796,7 +796,7 @@ nouveau_display_resume(struct drm_device *dev, 
>> bool runtime)
>>           }
>>       }
>>   -    drm_client_dev_resume(dev, false);
>> +    drm_client_dev_resume(dev);
>>   }
>>     int
>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c 
>> b/drivers/gpu/drm/radeon/radeon_device.c
>> index 9e35b14e2bf0..60afaa8e56b4 100644
>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>> @@ -1635,7 +1635,7 @@ int radeon_suspend_kms(struct drm_device *dev, 
>> bool suspend,
>>       }
>>         if (notify_clients)
>> -        drm_client_dev_suspend(dev, false);
>> +        drm_client_dev_suspend(dev);
>>         return 0;
>>   }
>> @@ -1739,7 +1739,7 @@ int radeon_resume_kms(struct drm_device *dev, 
>> bool resume, bool notify_clients)
>>           radeon_pm_compute_clocks(rdev);
>>         if (notify_clients)
>> -        drm_client_dev_resume(dev, false);
>> +        drm_client_dev_resume(dev);
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c 
>> b/drivers/gpu/drm/xe/display/xe_display.c
>> index 19e691fccf8c..d3cc6181842c 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -324,7 +324,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>        * properly.
>>        */
>>       intel_power_domains_disable(display);
>> -    drm_client_dev_suspend(&xe->drm, false);
>> +    drm_client_dev_suspend(&xe->drm);
>>         if (intel_display_device_present(display)) {
>>           drm_kms_helper_poll_disable(&xe->drm);
>> @@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>>           return;
>>         intel_power_domains_disable(display);
>> -    drm_client_dev_suspend(&xe->drm, false);
>> +    drm_client_dev_suspend(&xe->drm);
>>         if (intel_display_device_present(display)) {
>>           drm_kms_helper_poll_disable(&xe->drm);
>> @@ -481,7 +481,7 @@ void xe_display_pm_resume(struct xe_device *xe)
>>         intel_opregion_resume(display);
>>   -    drm_client_dev_resume(&xe->drm, false);
>> +    drm_client_dev_resume(&xe->drm);
>>         intel_power_domains_enable(display);
>>   }
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index bdd845e383ef..3556928d3938 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -70,13 +70,8 @@ struct drm_client_funcs {
>>        * Called when suspending the device.
>>        *
>>        * This callback is optional.
>> -     *
>> -     * FIXME: Some callers hold the console lock when invoking this
>> -     *        function. This interferes with fbdev emulation, which
>> -     *        also tries to acquire the lock. Push the console lock
>> -     *        into the callback and remove 'holds_console_lock'.
>>        */
>> -    int (*suspend)(struct drm_client_dev *client, bool 
>> holds_console_lock);
>> +    int (*suspend)(struct drm_client_dev *client);
>>         /**
>>        * @resume:
>> @@ -84,13 +79,8 @@ struct drm_client_funcs {
>>        * Called when resuming the device from suspend.
>>        *
>>        * This callback is optional.
>> -     *
>> -     * FIXME: Some callers hold the console lock when invoking this
>> -     *        function. This interferes with fbdev emulation, which
>> -     *        also tries to acquire the lock. Push the console lock
>> -     *        into the callback and remove 'holds_console_lock'.
>>        */
>> -    int (*resume)(struct drm_client_dev *client, bool 
>> holds_console_lock);
>> +    int (*resume)(struct drm_client_dev *client);
>>   };
>>     /**
>> diff --git a/include/drm/drm_client_event.h 
>> b/include/drm/drm_client_event.h
>> index 1d544d3a3228..c3f318788b71 100644
>> --- a/include/drm/drm_client_event.h
>> +++ b/include/drm/drm_client_event.h
>> @@ -11,8 +11,8 @@ struct drm_device;
>>   void drm_client_dev_unregister(struct drm_device *dev);
>>   void drm_client_dev_hotplug(struct drm_device *dev);
>>   void drm_client_dev_restore(struct drm_device *dev);
>> -void drm_client_dev_suspend(struct drm_device *dev, bool 
>> holds_console_lock);
>> -void drm_client_dev_resume(struct drm_device *dev, bool 
>> holds_console_lock);
>> +void drm_client_dev_suspend(struct drm_device *dev);
>> +void drm_client_dev_resume(struct drm_device *dev);
>>   #else
>>   static inline void drm_client_dev_unregister(struct drm_device *dev)
>>   { }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


