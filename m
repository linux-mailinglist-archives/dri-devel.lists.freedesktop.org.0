Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C6B40666
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776A310E749;
	Tue,  2 Sep 2025 14:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="e0OJxaOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QeEflPOH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e0OJxaOc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QeEflPOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8B10E749
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:16:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64D982119C;
 Tue,  2 Sep 2025 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756822605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxxhJSlxfk2Yi7yEfx3r5n9Qqgy1EwGy5VL9+QeWKGY=;
 b=e0OJxaOcOButVV5dR+IzG+kJ6Kk7kBTofLTMr6jF79g1u19SQPxkvPHo+iY1aKdr/1FkxY
 1XCU6iURf1ajpTN4WMvePHipFEnpS+mbeOqwcFAxcdHCTS2Sjx8T8o5tHbohNziBMg9IC6
 /PQ/SwCHj34Dzk5HoWGR6VI9jda9smU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756822605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxxhJSlxfk2Yi7yEfx3r5n9Qqgy1EwGy5VL9+QeWKGY=;
 b=QeEflPOHz5hLB8BXv/fHC7DYgbek0pOu0ZzbA224MiLo7U8ETLept7aZAuhmc/QwZbK0gx
 STO1ZI4+XELaISBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e0OJxaOc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QeEflPOH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756822605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxxhJSlxfk2Yi7yEfx3r5n9Qqgy1EwGy5VL9+QeWKGY=;
 b=e0OJxaOcOButVV5dR+IzG+kJ6Kk7kBTofLTMr6jF79g1u19SQPxkvPHo+iY1aKdr/1FkxY
 1XCU6iURf1ajpTN4WMvePHipFEnpS+mbeOqwcFAxcdHCTS2Sjx8T8o5tHbohNziBMg9IC6
 /PQ/SwCHj34Dzk5HoWGR6VI9jda9smU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756822605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxxhJSlxfk2Yi7yEfx3r5n9Qqgy1EwGy5VL9+QeWKGY=;
 b=QeEflPOHz5hLB8BXv/fHC7DYgbek0pOu0ZzbA224MiLo7U8ETLept7aZAuhmc/QwZbK0gx
 STO1ZI4+XELaISBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1470D13882;
 Tue,  2 Sep 2025 14:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uhVJA038tmjSbQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 14:16:45 +0000
Message-ID: <acd4006a-9d8e-4747-8146-7d8d5a3dc670@suse.de>
Date: Tue, 2 Sep 2025 16:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vblank: Add vblank timer
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: louis.chauvet@bootlin.com, drawat.floss@gmail.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, mhklinux@outlook.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-2-tzimmermann@suse.de> <aLbww2PiyM8FLGft@intel.com>
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
In-Reply-To: <aLbww2PiyM8FLGft@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, bootlin.com:email, suse.de:mid, suse.de:dkim,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 64D982119C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 02.09.25 um 15:27 schrieb Ville Syrjälä:
> On Mon, Sep 01, 2025 at 01:06:58PM +0200, Thomas Zimmermann wrote:
>> The vblank timer simulates a vblank interrupt for hardware without
>> support. Rate-limits the display update frequency.
>>
>> DRM drivers for hardware without vblank support apply display updates
>> ASAP. A vblank event informs DRM clients of the completed update.
>>
>> Userspace compositors immediately schedule the next update, which
>> creates significant load on virtualization outputs. Display updates
>> are usually fast on virtualization outputs, as their framebuffers are
>> in regular system memory and there's no hardware vblank interrupt to
>> throttle the update rate.
>>
>> The vblank timer is a HR timer that signals the vblank in software.
>> It limits the update frequency of a DRM driver similar to a hardware
>> vblank interrupt. The timer is not synchronized to the actual vblank
>> interval of the display.
>>
>> The code has been adopted from vkms, which added the funtionality
>> in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
>> hrtimers").
> Does this suffer from the same deadlocks as well?
> https://lore.kernel.org/all/20250510094757.4174662-1-zengheng4@huawei.com/

Thanks for this pointer. It has not been fixed yet, right? If vkms is 
affected, this series probably is as well.

Best regards
Thomas

>
>> The new implementation is part of the existing vblank support,
>> which sets up the timer automatically. Drivers only have to start
>> and cancel the vblank timer as part of enabling and disabling the
>> CRTC. The new vblank helper library provides callbacks for struct
>> drm_crtc_funcs.
>>
>> The standard way for handling vblank is to call drm_crtc_handle_vblank().
>> Drivers that require additional processing, such as vkms, can init
>> handle_vblank_timeout in struct drm_crtc_helper_funcs to refer to
>> their timeout handler.
>>
>> v2:
>> - implement vblank timer entirely in vblank helpers
>> - downgrade overrun warning to debug
>> - fix docs
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   Documentation/gpu/drm-kms-helpers.rst    |  12 +++
>>   drivers/gpu/drm/Makefile                 |   3 +-
>>   drivers/gpu/drm/drm_vblank.c             | 122 ++++++++++++++++++++++-
>>   drivers/gpu/drm/drm_vblank_helper.c      |  96 ++++++++++++++++++
>>   include/drm/drm_modeset_helper_vtables.h |  12 +++
>>   include/drm/drm_vblank.h                 |  28 ++++++
>>   include/drm/drm_vblank_helper.h          |  33 ++++++
>>   7 files changed, 303 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
>>   create mode 100644 include/drm/drm_vblank_helper.h
>>
>> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
>> index 5139705089f2..781129f78b06 100644
>> --- a/Documentation/gpu/drm-kms-helpers.rst
>> +++ b/Documentation/gpu/drm-kms-helpers.rst
>> @@ -92,6 +92,18 @@ GEM Atomic Helper Reference
>>   .. kernel-doc:: drivers/gpu/drm/drm_gem_atomic_helper.c
>>      :export:
>>   
>> +VBLANK Helper Reference
>> +-----------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_vblank_helper.c
>> +   :doc: overview
>> +
>> +.. kernel-doc:: include/drm/drm_vblank_helper.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_vblank_helper.c
>> +   :export:
>> +
>>   Simple KMS Helper Reference
>>   ===========================
>>   
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 4dafbdc8f86a..5ba4ffdb8055 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -150,7 +150,8 @@ drm_kms_helper-y := \
>>   	drm_plane_helper.o \
>>   	drm_probe_helper.o \
>>   	drm_self_refresh_helper.o \
>> -	drm_simple_kms_helper.o
>> +	drm_simple_kms_helper.o \
>> +	drm_vblank_helper.o
>>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d..2a4ee41e2fcf 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -136,8 +136,17 @@
>>    * vblanks after a timer has expired, which can be configured through the
>>    * ``vblankoffdelay`` module parameter.
>>    *
>> - * Drivers for hardware without support for vertical-blanking interrupts
>> - * must not call drm_vblank_init(). For such drivers, atomic helpers will
>> + * Drivers for hardware without support for vertical-blanking interrupts can
>> + * use DRM vblank timers to send vblank events at the rate of the current
>> + * display mode's refresh. While not synchronized to the hardware's
>> + * vertical-blanking regions, the timer helps DRM clients and compositors to
>> + * adapt their update cycle to the display output. Drivers should set up
>> + * vblanking as usual, but call drm_crtc_vblank_start_timer() and
>> + * drm_crtc_vblank_cancel_timer() as part of their atomic mode setting.
>> + * See also DRM vblank helpers for more information.
>> + *
>> + * Drivers without support for vertical-blanking interrupts nor timers must
>> + * not call drm_vblank_init(). For these drivers, atomic helpers will
>>    * automatically generate fake vblank events as part of the display update.
>>    * This functionality also can be controlled by the driver by enabling and
>>    * disabling struct drm_crtc_state.no_vblank.
>> @@ -2162,3 +2171,112 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * VBLANK timer
>> + */
>> +
>> +static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
>> +{
>> +	struct drm_vblank_crtc_timer *vtimer =
>> +		container_of(timer, struct drm_vblank_crtc_timer, timer);
>> +	struct drm_crtc *crtc = vtimer->crtc;
>> +	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
>> +	struct drm_device *dev = crtc->dev;
>> +	u64 ret_overrun;
>> +	bool succ;
>> +
>> +	ret_overrun = hrtimer_forward_now(&vtimer->timer, vtimer->interval);
>> +	if (ret_overrun != 1)
>> +		drm_dbg_vbl(dev, "vblank timer overrun\n");
>> +
>> +	if (crtc_funcs->handle_vblank_timeout)
>> +		succ = crtc_funcs->handle_vblank_timeout(crtc);
>> +	else
>> +		succ = drm_crtc_handle_vblank(crtc);
>> +	if (!succ)
>> +		return HRTIMER_NORESTART;
>> +
>> +	return HRTIMER_RESTART;
>> +}
>> +
>> +/**
>> + * drm_crtc_vblank_start_timer - Starts the vblank timer on the given CRTC
>> + * @crtc: the CRTC
>> + *
>> + * Drivers should call this function from their CRTC's enable_vblank
>> + * function to start a vblank timer. The timer will fire after the duration
>> + * of a full frame. drm_crtc_vblank_cancel_timer() disables a running timer.
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + */
>> +int drm_crtc_vblank_start_timer(struct drm_crtc *crtc)
>> +{
>> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
>> +
>> +	if (!vtimer->crtc) {
>> +		vtimer->crtc = crtc;
>> +		hrtimer_setup(&vtimer->timer, drm_vblank_timer_function,
>> +			      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +	}
>> +
>> +	drm_calc_timestamping_constants(crtc, &crtc->mode);
>> +
>> +	vtimer->interval = ktime_set(0, vblank->framedur_ns);
>> +	hrtimer_start(&vtimer->timer, vtimer->interval, HRTIMER_MODE_REL);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_start_timer);
>> +
>> +/**
>> + * drm_crtc_vblank_start_timer - Cancels the given CRTC's vblank timer
>> + * @crtc: the CRTC
>> + *
>> + * Drivers should call this function from their CRTC's disable_vblank
>> + * function to stop a vblank timer.
>> + */
>> +void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc)
>> +{
>> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
>> +
>> +	hrtimer_cancel(&vtimer->timer);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_cancel_timer);
>> +
>> +/**
>> + * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
>> + * @crtc: The CRTC
>> + * @vblank_time: Returns the next vblank timestamp
>> + *
>> + * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
>> + * timestamp of the CRTC's vblank timer according to the timer's expiry
>> + * time.
>> + */
>> +void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
>> +{
>> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +	struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
>> +
>> +	if (!READ_ONCE(vblank->enabled)) {
>> +		*vblank_time = ktime_get();
>> +		return;
>> +	}
>> +
>> +	*vblank_time = READ_ONCE(vtimer->timer.node.expires);
>> +
>> +	if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, vblank->time)))
>> +		return; /* Already expired */
>> +
>> +	/*
>> +	 * To prevent races we roll the hrtimer forward before we do any
>> +	 * interrupt processing - this is how real hw works (the interrupt
>> +	 * is only generated after all the vblank registers are updated)
>> +	 * and what the vblank core expects. Therefore we need to always
>> +	 * correct the timestamp by one frame.
>> +	 */
>> +	*vblank_time = ktime_sub(*vblank_time, vtimer->interval);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
>> diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
>> new file mode 100644
>> index 000000000000..f94d1e706191
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_vblank_helper.c
>> @@ -0,0 +1,96 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_vblank_helper.h>
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * The vblank helper library provides functions for supporting vertical
>> + * blanking in DRM drivers.
>> + *
>> + * For vblank timers, several callback implementations are available.
>> + * Drivers enable support for vblank timers by setting the vblank callbacks
>> + * in struct &drm_crtc_funcs to the helpers provided by this library. The
>> + * initializer macro DRM_CRTC_VBLANK_TIMER_FUNCS does this conveniently.
>> + *
>> + * Once the driver enables vblank support with drm_vblank_init(), each
>> + * CRTC's vblank timer fires according to the programmed display mode. By
>> + * default, the vblank timer invokes drm_crtc_handle_vblank(). Drivers with
>> + * more specific requirements can set their own handler function in
>> + * struct &drm_crtc_helper_funcs.handle_vblank_timeout.
>> + */
>> +
>> +/*
>> + * VBLANK timer
>> + */
>> +
>> +/**
>> + * drm_crtc_vblank_helper_enable_vblank_timer - Implements struct &drm_crtc_funcs.enable_vblank
>> + * @crtc: The CRTC
>> + *
>> + * The helper drm_crtc_vblank_helper_enable_vblank_timer() implements
>> + * enable_vblank of struct drm_crtc_helper_funcs for CRTCs that require
>> + * a VBLANK timer. It sets up the timer on the first invocation. The
>> + * started timer expires after the current frame duration. See struct
>> + * &drm_vblank_crtc.framedur_ns.
>> + *
>> + * See also struct &drm_crtc_helper_funcs.enable_vblank.
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + */
>> +int drm_crtc_vblank_helper_enable_vblank_timer(struct drm_crtc *crtc)
>> +{
>> +	return drm_crtc_vblank_start_timer(crtc);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_helper_enable_vblank_timer);
>> +
>> +/**
>> + * drm_crtc_vblank_helper_disable_vblank_timer - Implements struct &drm_crtc_funcs.disable_vblank
>> + * @crtc: The CRTC
>> + *
>> + * The helper drm_crtc_vblank_helper_disable_vblank_timer() implements
>> + * disable_vblank of struct drm_crtc_funcs for CRTCs that require a
>> + * VBLANK timer.
>> + *
>> + * See also struct &drm_crtc_helper_funcs.disable_vblank.
>> + */
>> +void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc)
>> +{
>> +	drm_crtc_vblank_cancel_timer(crtc);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_helper_disable_vblank_timer);
>> +
>> +/**
>> + * drm_crtc_vblank_helper_get_vblank_timestamp_from_timer -
>> + *	Implements struct &drm_crtc_funcs.get_vblank_timestamp
>> + * @crtc: The CRTC
>> + * @max_error: Maximum acceptable error
>> + * @vblank_time: Returns the next vblank timestamp
>> + * @in_vblank_irq: True is called from drm_crtc_handle_vblank()
>> + *
>> + * The helper drm_crtc_helper_get_vblank_timestamp_from_timer() implements
>> + * get_vblank_timestamp of struct drm_crtc_funcs for CRTCs that require a
>> + * VBLANK timer. It returns the timestamp according to the timer's expiry
>> + * time.
>> + *
>> + * See also struct &drm_crtc_funcs.get_vblank_timestamp.
>> + *
>> + * Returns:
>> + * True on success, or false otherwise.
>> + */
>> +bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crtc,
>> +							    int *max_error,
>> +							    ktime_t *vblank_time,
>> +							    bool in_vblank_irq)
>> +{
>> +	drm_crtc_vblank_get_vblank_timeout(crtc, vblank_time);
>> +
>> +	return true;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_from_timer);
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
>> index ce7c7aeac887..fe32854b7ffe 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -490,6 +490,18 @@ struct drm_crtc_helper_funcs {
>>   				     bool in_vblank_irq, int *vpos, int *hpos,
>>   				     ktime_t *stime, ktime_t *etime,
>>   				     const struct drm_display_mode *mode);
>> +
>> +	/**
>> +	 * @handle_vblank_timeout: Handles timeouts of the vblank timer.
>> +	 *
>> +	 * Called by CRTC's the vblank timer on each timeout. Semantics is
>> +	 * equivalient to drm_crtc_handle_vblank(). Implementations should
>> +	 * invoke drm_crtc_handle_vblank() as part of processing the timeout.
>> +	 *
>> +	 * This callback is optional. If unset, the vblank timer invokes
>> +	 * drm_crtc_handle_vblank() directly.
>> +	 */
>> +	bool (*handle_vblank_timeout)(struct drm_crtc *crtc);
>>   };
>>   
>>   /**
>> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
>> index 151ab1e85b1b..f020415abd20 100644
>> --- a/include/drm/drm_vblank.h
>> +++ b/include/drm/drm_vblank.h
>> @@ -25,6 +25,7 @@
>>   #define _DRM_VBLANK_H_
>>   
>>   #include <linux/seqlock.h>
>> +#include <linux/hrtimer.h>
>>   #include <linux/idr.h>
>>   #include <linux/poll.h>
>>   #include <linux/kthread.h>
>> @@ -103,6 +104,24 @@ struct drm_vblank_crtc_config {
>>   	bool disable_immediate;
>>   };
>>   
>> +/**
>> + * struct drm_vblank_crtc_timer - vblank timer for a CRTC
>> + */
>> +struct drm_vblank_crtc_timer {
>> +	/**
>> +	 * @timer: The vblank's high-resolution timer
>> +	 */
>> +	struct hrtimer timer;
>> +	/**
>> +	 * @interval: Duration between two vblanks
>> +	 */
>> +	ktime_t interval;
>> +	/**
>> +	 * @crtc: The timer's CRTC
>> +	 */
>> +	struct drm_crtc *crtc;
>> +};
>> +
>>   /**
>>    * struct drm_vblank_crtc - vblank tracking for a CRTC
>>    *
>> @@ -254,6 +273,11 @@ struct drm_vblank_crtc {
>>   	 * cancelled.
>>   	 */
>>   	wait_queue_head_t work_wait_queue;
>> +
>> +	/**
>> +	 * @vblank_timer: Holds the state of the vblank timer
>> +	 */
>> +	struct drm_vblank_crtc_timer vblank_timer;
>>   };
>>   
>>   struct drm_vblank_crtc *drm_crtc_vblank_crtc(struct drm_crtc *crtc);
>> @@ -290,6 +314,10 @@ wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
>>   void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>>   				   u32 max_vblank_count);
>>   
>> +int drm_crtc_vblank_start_timer(struct drm_crtc *crtc);
>> +void drm_crtc_vblank_cancel_timer(struct drm_crtc *crtc);
>> +void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time);
>> +
>>   /*
>>    * Helpers for struct drm_crtc_funcs
>>    */
>> diff --git a/include/drm/drm_vblank_helper.h b/include/drm/drm_vblank_helper.h
>> new file mode 100644
>> index 000000000000..74a971d0cfba
>> --- /dev/null
>> +++ b/include/drm/drm_vblank_helper.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _DRM_VBLANK_HELPER_H_
>> +#define _DRM_VBLANK_HELPER_H_
>> +
>> +#include <linux/hrtimer_types.h>
>> +#include <linux/types.h>
>> +
>> +struct drm_crtc;
>> +
>> +/*
>> + * VBLANK timer
>> + */
>> +
>> +int drm_crtc_vblank_helper_enable_vblank_timer(struct drm_crtc *crtc);
>> +void drm_crtc_vblank_helper_disable_vblank_timer(struct drm_crtc *crtc);
>> +bool drm_crtc_vblank_helper_get_vblank_timestamp_from_timer(struct drm_crtc *crtc,
>> +							    int *max_error,
>> +							    ktime_t *vblank_time,
>> +							    bool in_vblank_irq);
>> +
>> +/**
>> + * DRM_CRTC_VBLANK_TIMER_FUNCS - Default implementation for VBLANK timers
>> + *
>> + * This macro initializes struct &drm_crtc_funcs to default helpers for
>> + * VBLANK timers.
>> + */
>> +#define DRM_CRTC_VBLANK_TIMER_FUNCS \
>> +	.enable_vblank = drm_crtc_vblank_helper_enable_vblank_timer, \
>> +	.disable_vblank = drm_crtc_vblank_helper_disable_vblank_timer, \
>> +	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp_from_timer
>> +
>> +#endif
>> -- 
>> 2.50.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


