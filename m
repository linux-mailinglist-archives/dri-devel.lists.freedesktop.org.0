Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF21B2FE28
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA93310E079;
	Thu, 21 Aug 2025 15:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="StHPbQLe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8sPAy9W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="StHPbQLe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8sPAy9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECB310E9C5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 15:21:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5FADC1F395;
 Thu, 21 Aug 2025 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755789689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nmSnyb/lB8zbI9rXb8ew2bCBx5DaMuoD9C3hcxhezg0=;
 b=StHPbQLeCH/7DfwdT+tup/VlU3Lr6SoFDXPJTBhZycvkuTlWrmtye55G+A58Q99yoq1muO
 RKchKOGFSIUkU6Iz4i4I3YtHKqa9sS+9Bfqbl5FNOLxxdCorOMhJc3YNJp68kYUh2Vxgq/
 572HfDJURj+YGFIwmHdUD+UTJFia6M0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755789689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nmSnyb/lB8zbI9rXb8ew2bCBx5DaMuoD9C3hcxhezg0=;
 b=T8sPAy9Wkl8VS4LI3zSVd0HNWYG6A0rWqroAjZGFMKcRK+Vj1M4bMZfM9vjxB5I3wCLHua
 vDCgqteDxpUCU7BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=StHPbQLe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T8sPAy9W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755789689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nmSnyb/lB8zbI9rXb8ew2bCBx5DaMuoD9C3hcxhezg0=;
 b=StHPbQLeCH/7DfwdT+tup/VlU3Lr6SoFDXPJTBhZycvkuTlWrmtye55G+A58Q99yoq1muO
 RKchKOGFSIUkU6Iz4i4I3YtHKqa9sS+9Bfqbl5FNOLxxdCorOMhJc3YNJp68kYUh2Vxgq/
 572HfDJURj+YGFIwmHdUD+UTJFia6M0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755789689;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nmSnyb/lB8zbI9rXb8ew2bCBx5DaMuoD9C3hcxhezg0=;
 b=T8sPAy9Wkl8VS4LI3zSVd0HNWYG6A0rWqroAjZGFMKcRK+Vj1M4bMZfM9vjxB5I3wCLHua
 vDCgqteDxpUCU7BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CFEA139A8;
 Thu, 21 Aug 2025 15:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PmfoAXk5p2jADwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 15:21:29 +0000
Message-ID: <1655b1d2-7725-419a-b677-d751b44b3d47@suse.de>
Date: Thu, 21 Aug 2025 17:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9 v3] drm/i915: Move struct_mutex to drm_i915_private
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
 <20250813135035.144762-2-luiz.mello@estudante.ufscar.br>
 <aJ8wYnTKv9_0udT2@intel.com> <aJ-xgHEZEw4am8-i@intel.com>
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
In-Reply-To: <aJ-xgHEZEw4am8-i@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,ffwll.ch,gmail.com,ursulin.net,lists.freedesktop.org,riseup.net];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim, intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 5FADC1F395
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

Am 16.08.25 um 00:15 schrieb Rodrigo Vivi:
> On Fri, Aug 15, 2025 at 09:04:34AM -0400, Rodrigo Vivi wrote:
>> On Wed, Aug 13, 2025 at 10:50:25AM -0300, Luiz Otavio Mello wrote:
>>> Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
>>> is the last remaining user.
>>>
>>> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_drv.c                  |  2 --
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>>>   drivers/gpu/drm/i915/i915_driver.c         |  2 ++
>>>   drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
>>>   drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
>>>   include/drm/drm_device.h                   | 10 ----------
>> drm, drm-misc maintainers, ack to merge this through drm-intel-next?
> Thomas, I'm sorry but I had forgotten to cc you in this patch as well.
>
> is your ack for the patch 9 also valid in this patch 1?

Yes, please send this whole series via i915's tree.

Best regards
Thomas

>
>>>   6 files changed, 17 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index cdd591b11488..ad3aee354ba3 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>>>   	mutex_destroy(&dev->master_mutex);
>>>   	mutex_destroy(&dev->clientlist_mutex);
>>>   	mutex_destroy(&dev->filelist_mutex);
>>> -	mutex_destroy(&dev->struct_mutex);
>>>   }
>>>   
>>>   static int drm_dev_init(struct drm_device *dev,
>>> @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
>>>   	INIT_LIST_HEAD(&dev->vblank_event_list);
>>>   
>>>   	spin_lock_init(&dev->event_lock);
>>> -	mutex_init(&dev->struct_mutex);
>>>   	mutex_init(&dev->filelist_mutex);
>>>   	mutex_init(&dev->clientlist_mutex);
>>>   	mutex_init(&dev->master_mutex);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> index 09a64f224c49..65ffcaeee4b9 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>>> @@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>>>   	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>>>   		return -EINVAL;
>>>   
>>> -	mutex_lock(&i915->drm.struct_mutex);
>>> +	mutex_lock(&i915->struct_mutex);
>>>   
>>>   	if (log->level == level)
>>>   		goto out_unlock;
>>> @@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>>>   	log->level = level;
>>>   
>>>   out_unlock:
>>> -	mutex_unlock(&i915->drm.struct_mutex);
>>> +	mutex_unlock(&i915->struct_mutex);
>>>   
>>>   	return ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>> index c6263c6d3384..d1559fd8ad3d 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>>   
>>>   	intel_sbi_init(display);
>>>   	vlv_iosf_sb_init(dev_priv);
>>> +	mutex_init(&dev_priv->struct_mutex);
>>>   	mutex_init(&dev_priv->sb_lock);
>>>   
>>>   	i915_memcpy_init_early(dev_priv);
>>> @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>>>   	i915_workqueues_cleanup(dev_priv);
>>>   
>>>   	mutex_destroy(&dev_priv->sb_lock);
>>> +	mutex_destroy(&dev_priv->struct_mutex);
>>>   	vlv_iosf_sb_fini(dev_priv);
>>>   	intel_sbi_fini(display);
>>>   
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index 4e4e89746aa6..15f66a7d496d 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -222,6 +222,17 @@ struct drm_i915_private {
>>>   
>>>   	bool irqs_enabled;
>>>   
>>> +	/*
>>> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
>>> +	 * for BKL.
>>> +	 *
>>> +	 * For this reason, it is no longer part of struct drm_device.
>>> +	 */
>>> +	struct mutex struct_mutex;
>>> +
>>> +	/* LPT/WPT IOSF sideband protection */
>>> +	struct mutex sbi_lock;
>>> +
>>>   	/* VLV/CHV IOSF sideband */
>>>   	struct {
>>>   		struct mutex lock; /* protect sideband access */
>>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>>> index 191ed8bb1d9c..cdfb09464134 100644
>>> --- a/drivers/gpu/drm/i915/i915_irq.c
>>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>>> @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
>>>   	 * In order to prevent a get/put style interface, acquire struct mutex
>>>   	 * any time we access those registers.
>>>   	 */
>>> -	mutex_lock(&dev_priv->drm.struct_mutex);
>>> +	mutex_lock(&dev_priv->struct_mutex);
>>>   
>>>   	/* If we've screwed up tracking, just let the interrupt fire again */
>>>   	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
>>> @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
>>>   	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
>>>   	spin_unlock_irq(gt->irq_lock);
>>>   
>>> -	mutex_unlock(&dev_priv->drm.struct_mutex);
>>> +	mutex_unlock(&dev_priv->struct_mutex);
>>>   }
>>>   
>>>   static irqreturn_t valleyview_irq_handler(int irq, void *arg)
>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>> index a33aedd5e9ec..016df5529d46 100644
>>> --- a/include/drm/drm_device.h
>>> +++ b/include/drm/drm_device.h
>>> @@ -188,16 +188,6 @@ struct drm_device {
>>>   	/** @unique: Unique name of the device */
>>>   	char *unique;
>>>   
>>> -	/**
>>> -	 * @struct_mutex:
>>> -	 *
>>> -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
>>> -	 *
>>> -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
>>> -	 *       lock into i915, which is the only remaining user.
>>> -	 */
>>> -	struct mutex struct_mutex;
>>> -
>>>   	/**
>>>   	 * @master_mutex:
>>>   	 *
>>> -- 
>>> 2.50.1
>>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


