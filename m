Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC78BE31E
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5641112183;
	Tue,  7 May 2024 13:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IqwLfFM+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eMTVnqcf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lGeY4DQ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SBZE+Idd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03A610FDAA;
 Tue,  7 May 2024 13:10:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 39AF1209F6;
 Tue,  7 May 2024 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715087449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=42sqKkRZzBgWEgDyspu4KXMhxsCmeR1S4xXJoSVfm5E=;
 b=IqwLfFM+Hu2YaEEcAQTcodL6pTl0RWcpO3WDWfJIFP53WJvvr6iQRkXlxE4dyvlNg3sQ72
 ixY72XOy8Tfthetbsj0lMCYneuOEqRJs+zfXKgDP0ElUXRL/J8QoUlOAm7lRW1dI3Pq6T+
 p9pWGH356aj57WwlmuAVZtIDfAXnVcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715087449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=42sqKkRZzBgWEgDyspu4KXMhxsCmeR1S4xXJoSVfm5E=;
 b=eMTVnqcfX0NzW1dC/AvFEcX09A0+rSYUeqw55lGmAxdgKDi8MRUIre5cCXLdxxuA7JvNjY
 0rkwx0nccqses7DA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lGeY4DQ6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SBZE+Idd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715087448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=42sqKkRZzBgWEgDyspu4KXMhxsCmeR1S4xXJoSVfm5E=;
 b=lGeY4DQ6knpn5emLVJhT+bw6mPy+WSxzOxT/BTDRcO+fqOpPBOiMGnS4DpbwIGAEhUEj34
 MUzhsPOwUsxuapAlojjBUqiitb6sGKaMYYq09Z2FvMxFEVBK0L0FGJfKFbajufua2X60Ps
 VhXojJ+f9kkTAcXmdegoeHN1pamcFds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715087448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=42sqKkRZzBgWEgDyspu4KXMhxsCmeR1S4xXJoSVfm5E=;
 b=SBZE+IddVAPX2Bi6qbigiV7YukmQHu4QQWtbQHtdvUODTW3mMSEb9GyPGWO7EoEpXG13Hz
 c+xhHqiC2JL4pNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8348B139CB;
 Tue,  7 May 2024 13:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zE3CHlcoOmahIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 May 2024 13:10:47 +0000
Message-ID: <f54de97b-5b52-4510-b54d-0aeb6266eb51@suse.de>
Date: Tue, 7 May 2024 15:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/i915: Use drm_fbdev_helper_client_unregister()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: javierm@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, linux@armlinux.org.uk, krzk@kernel.org,
 alim.akhtar@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-9-tzimmermann@suse.de> <ZjodweGCM0_zd2L0@intel.com>
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
In-Reply-To: <ZjodweGCM0_zd2L0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 39AF1209F6
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 XM_UA_NO_VERSION(0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[30]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,linux.intel.com,kernel.org,samsung.com,armlinux.org.uk,gmail.com,ursulin.net,quicinc.com,linaro.org,poorly.run,somainline.org,ideasonboard.com,amd.com,nvidia.com,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, intel.com:email]
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

Am 07.05.24 um 14:25 schrieb Rodrigo Vivi:
> On Tue, May 07, 2024 at 01:58:29PM +0200, Thomas Zimmermann wrote:
>> Implement struct drm_client_funcs.unregister with the helpers
>> drm_fbdev_helper_client_unregister() and remove the custom code
>> from the driver. The generic helper is equivalent in functionality.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/i915/display/intel_fbdev.c | 21 ++-------------------
>>   1 file changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index bda702c2cab8e..f1b4543bffc02 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -38,7 +38,6 @@
>>   #include <linux/vga_switcheroo.h>
>>   
>>   #include <drm/drm_crtc.h>
>> -#include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>> @@ -580,25 +579,9 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
>>   }
>>   
>>   /*
>> - * Fbdev client and struct drm_client_funcs
>> + * struct drm_client_funcs
>>    */
>>   
>> -static void intel_fbdev_client_unregister(struct drm_client_dev *client)
>> -{
>> -	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>> -	struct drm_device *dev = fb_helper->dev;
>> -	struct pci_dev *pdev = to_pci_dev(dev->dev);
>> -
>> -	if (fb_helper->info) {
>> -		vga_switcheroo_client_fb_set(pdev, NULL);
>> -		drm_fb_helper_unregister_info(fb_helper);
>> -	} else {
>> -		drm_fb_helper_unprepare(fb_helper);
>> -		drm_client_release(&fb_helper->client);
> The only real difference is that these 2 calls are inverted in the new
> drm_fbdev_helper_client_unregister.

The condition in this if statement is different for some drivers, but 
not i915. The setup code first does a _prepare and then an 
_init+_register, hence the _release goes first and then comes the 
_unprepare.

>
> I feel that the releasing after the unprepare sounds more logical,
> but if there's no actual issue with that and it is working for
> everybody, let's do that.

It should make no difference in practice, but doing the release first is 
the inverse of the setup; hence conceptually cleaner.

>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> (to get through drm-misc with everything else if you prefer)

Thanks.

Best regards
Thomas

>
>> -		kfree(fb_helper);
>> -	}
>> -}
>> -
>>   static int intel_fbdev_client_restore(struct drm_client_dev *client)
>>   {
>>   	struct drm_i915_private *dev_priv = to_i915(client->dev);
>> @@ -644,7 +627,7 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
>>   
>>   static const struct drm_client_funcs intel_fbdev_client_funcs = {
>>   	.owner		= THIS_MODULE,
>> -	.unregister	= intel_fbdev_client_unregister,
>> +	.unregister	= drm_fbdev_helper_client_unregister,
>>   	.restore	= intel_fbdev_client_restore,
>>   	.hotplug	= intel_fbdev_client_hotplug,
>>   };
>> -- 
>> 2.44.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

