Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26431A3202C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 08:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FF10E7CE;
	Wed, 12 Feb 2025 07:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TmdmSgio";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NVKopFeR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TmdmSgio";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NVKopFeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D883A10E7CD;
 Wed, 12 Feb 2025 07:43:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 877F91F450;
 Wed, 12 Feb 2025 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739346220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LRWq2SDFTnEC7/kGGHyv03xdltaUccl+g904ZIIwzqs=;
 b=TmdmSgiokCUpcAMuil+nVlSwQkR8MlERuMyo/dLI9XR8fbYh/0QuExQanZ66F9N9TGc0aT
 V5ChJB7yIxBtGJZ+oqWfCGUFq4+erYthnEjo0S3YN6ZzNcHEl/StC+zwK645wid3NpsDxk
 y9ptAMlXcrW9N2nx4nZkcaOWOgW/rFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739346220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LRWq2SDFTnEC7/kGGHyv03xdltaUccl+g904ZIIwzqs=;
 b=NVKopFeR3sESO43bv1YYL6xLke79Ze/HBcq4qj3x2UrplTscxe14ftUd8m4xok/ki5tiUG
 pJ60Znfpp0EM8EAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739346220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LRWq2SDFTnEC7/kGGHyv03xdltaUccl+g904ZIIwzqs=;
 b=TmdmSgiokCUpcAMuil+nVlSwQkR8MlERuMyo/dLI9XR8fbYh/0QuExQanZ66F9N9TGc0aT
 V5ChJB7yIxBtGJZ+oqWfCGUFq4+erYthnEjo0S3YN6ZzNcHEl/StC+zwK645wid3NpsDxk
 y9ptAMlXcrW9N2nx4nZkcaOWOgW/rFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739346220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LRWq2SDFTnEC7/kGGHyv03xdltaUccl+g904ZIIwzqs=;
 b=NVKopFeR3sESO43bv1YYL6xLke79Ze/HBcq4qj3x2UrplTscxe14ftUd8m4xok/ki5tiUG
 pJ60Znfpp0EM8EAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 291D713AEF;
 Wed, 12 Feb 2025 07:43:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Fmm7CCxRrGfbHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Feb 2025 07:43:40 +0000
Message-ID: <fd9de5b4-0031-4f42-9787-87d8266dd2cd@suse.de>
Date: Wed, 12 Feb 2025 08:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/{i915, xe}: Suspend/resume fbdev emulation via
 client interfaces
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, jfalempe@redhat.com,
 javierm@redhat.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <20241212170913.185939-2-tzimmermann@suse.de> <Z6u5Xari1HKZ4gz8@intel.com>
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
In-Reply-To: <Z6u5Xari1HKZ4gz8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[15];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,ursulin.net,intel.com,ffwll.ch,gmail.com,kernel.org,redhat.com,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
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

Am 11.02.25 um 21:55 schrieb Rodrigo Vivi:
> On Thu, Dec 12, 2024 at 06:08:42PM +0100, Thomas Zimmermann wrote:
>> Implement drm_client_dev_suspend() and drm_client_dev_resume() for
>> i915's fbdev emulation and call the helper via DRM client interfaces.
>> This is required to convert i915 and xe to DRM's generic fbdev client.
>> No functional changes.
> Well, there is one functional change that is the clientlist iterator
> and the clientlist_mutex hold. So I would avoid the statement of
> no functional change. But indeed it seems there's not relevant
> functional changes...

Fair point. I'll reword this.

>
> the code itself looks right to me:
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks

Best regards
Thomas

>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/i915/i915_driver.c         |  9 +++++----
>>   drivers/gpu/drm/xe/display/xe_display.c    |  9 +++++----
>>   3 files changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index 00852ff5b247..a51d1dfd1b58 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -642,11 +642,27 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>>   	return ret;
>>   }
>>   
>> +static int intel_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_SUSPENDED, true);
>> +
>> +	return 0;
>> +}
>> +
>> +static int intel_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
>> +{
>> +	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_RUNNING, false);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_client_funcs intel_fbdev_client_funcs = {
>>   	.owner		= THIS_MODULE,
>>   	.unregister	= intel_fbdev_client_unregister,
>>   	.restore	= intel_fbdev_client_restore,
>>   	.hotplug	= intel_fbdev_client_hotplug,
>> +	.suspend	= intel_fbdev_client_suspend,
>> +	.resume		= intel_fbdev_client_resume,
>>   };
>>   
>>   void intel_fbdev_setup(struct drm_i915_private *i915)
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index eb3fcc9e77a5..e385e4947a91 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -41,6 +41,8 @@
>>   #include <linux/vt.h>
>>   
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_client.h>
>> +#include <drm/drm_client_event.h>
>>   #include <drm/drm_ioctl.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -55,7 +57,6 @@
>>   #include "display/intel_dp.h"
>>   #include "display/intel_dpt.h"
>>   #include "display/intel_encoder.h"
>> -#include "display/intel_fbdev.h"
>>   #include "display/intel_hotplug.h"
>>   #include "display/intel_overlay.h"
>>   #include "display/intel_pch_refclk.h"
>> @@ -958,7 +959,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
>>   	intel_runtime_pm_disable(&i915->runtime_pm);
>>   	intel_power_domains_disable(display);
>>   
>> -	intel_fbdev_set_suspend(&i915->drm, FBINFO_STATE_SUSPENDED, true);
>> +	drm_client_dev_suspend(&i915->drm, false);
>>   	if (HAS_DISPLAY(i915)) {
>>   		drm_kms_helper_poll_disable(&i915->drm);
>>   		intel_display_driver_disable_user_access(display);
>> @@ -1041,7 +1042,7 @@ static int i915_drm_suspend(struct drm_device *dev)
>>   	/* We do a lot of poking in a lot of registers, make sure they work
>>   	 * properly. */
>>   	intel_power_domains_disable(display);
>> -	intel_fbdev_set_suspend(dev, FBINFO_STATE_SUSPENDED, true);
>> +	drm_client_dev_suspend(dev, false);
>>   	if (HAS_DISPLAY(dev_priv)) {
>>   		drm_kms_helper_poll_disable(dev);
>>   		intel_display_driver_disable_user_access(display);
>> @@ -1227,7 +1228,7 @@ static int i915_drm_resume(struct drm_device *dev)
>>   
>>   	intel_opregion_resume(display);
>>   
>> -	intel_fbdev_set_suspend(dev, FBINFO_STATE_RUNNING, false);
>> +	drm_client_dev_resume(dev, false);
>>   
>>   	intel_power_domains_enable(display);
>>   
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index 317fa66adf18..bc73c9999c57 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -8,6 +8,8 @@
>>   
>>   #include <linux/fb.h>
>>   
>> +#include <drm/drm_client.h>
>> +#include <drm/drm_client_event.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -25,7 +27,6 @@
>>   #include "intel_dmc_wl.h"
>>   #include "intel_dp.h"
>>   #include "intel_encoder.h"
>> -#include "intel_fbdev.h"
>>   #include "intel_hdcp.h"
>>   #include "intel_hotplug.h"
>>   #include "intel_opregion.h"
>> @@ -336,7 +337,7 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>   	 */
>>   	intel_power_domains_disable(display);
>>   	if (!runtime)
>> -		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>> +		drm_client_dev_suspend(&xe->drm, false);
>>   
>>   	if (!runtime && has_display(xe)) {
>>   		drm_kms_helper_poll_disable(&xe->drm);
>> @@ -374,7 +375,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>>   		return;
>>   
>>   	intel_power_domains_disable(display);
>> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>> +	drm_client_dev_suspend(&xe->drm, false);
>>   	if (has_display(xe)) {
>>   		drm_kms_helper_poll_disable(&xe->drm);
>>   		intel_display_driver_disable_user_access(display);
>> @@ -494,7 +495,7 @@ static void __xe_display_pm_resume(struct xe_device *xe, bool runtime)
>>   	intel_opregion_resume(display);
>>   
>>   	if (!runtime)
>> -		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>> +		drm_client_dev_resume(&xe->drm, false);
>>   
>>   	intel_power_domains_enable(display);
>>   }
>> -- 
>> 2.47.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

