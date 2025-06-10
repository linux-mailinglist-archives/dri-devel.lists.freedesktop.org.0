Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E2AD3D6B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1E710E08D;
	Tue, 10 Jun 2025 15:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KUrmNtZL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y3lj1sqs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VxUT/P0W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eYnjU2tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D79210E100
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 15:36:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D22B6210F3;
 Tue, 10 Jun 2025 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749569793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQeVmqzuDx8T11tzAp4//+RKapBPir1cG8RoUEQn4Q4=;
 b=KUrmNtZLWBz9Za3YMByEyT2yKdEb9kOzUoCPqNlZS11CoNFloUaYwZ8ayMx6SnWQ+yGCSV
 iHU5YQMTf1em+qCn5bpI3yUEggH4jSg0y0/r9tXo6Cb8vq8cGTuZCcBpKjakdgcxjy1dcR
 uuzfEYf2AAupjg8TrHNz1V/0/Qw0oO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749569793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQeVmqzuDx8T11tzAp4//+RKapBPir1cG8RoUEQn4Q4=;
 b=y3lj1sqsDqRkNEtsKC41JvhuK4aDZaxw3cvpfJjZ75AgYQ+49Sz9QCO7Rj8FaSqpR6mZhn
 GfgZMD/3cJQXxXDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="VxUT/P0W";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eYnjU2tj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749569792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQeVmqzuDx8T11tzAp4//+RKapBPir1cG8RoUEQn4Q4=;
 b=VxUT/P0W1ZH44FMzQtyjwCKM0g6PG+Uljd5Y49f43N2YhhgrCp5dkxbg5RPEcHP93t17wx
 PAqEx+6ZDLcQhoL8uH7YF6prGx5VG1xWmdB2yHZAyd/Jp+PmtNkVhmUSphybwTAftemShu
 Inq55CxI0s+S4xpDB/3yS1v2jQvNJZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749569792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hQeVmqzuDx8T11tzAp4//+RKapBPir1cG8RoUEQn4Q4=;
 b=eYnjU2tjuUELLGYgMcsFCoSKutSJLdjYpvi33BPxaDPbv7sw6ZbXeH8a5B4FEyFqmG3kl+
 TPfL0ubHD/8KDTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 685CB13964;
 Tue, 10 Jun 2025 15:36:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M7QfGABRSGihUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 15:36:32 +0000
Message-ID: <48f5a294-ab53-4cad-bb92-e1a90ee41fd0@suse.de>
Date: Tue, 10 Jun 2025 17:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/vblank: Add vblank timer
To: Louis Chauvet <louis.chauvet@bootlin.com>, mhklinux@outlook.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, drawat.floss@gmail.com, javierm@redhat.com,
 kraxel@redhat.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20250605152637.98493-1-tzimmermann@suse.de>
 <20250605152637.98493-2-tzimmermann@suse.de>
 <b6b43b7f-f3bd-442a-9174-97d3ada0f695@bootlin.com>
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
In-Reply-To: <b6b43b7f-f3bd-442a-9174-97d3ada0f695@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[bootlin.com,outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,suse.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[]; TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D22B6210F3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 06.06.25 um 10:43 schrieb Louis Chauvet:
>
>
> Le 05/06/2025 à 17:24, Thomas Zimmermann a écrit :
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
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks for looking through the series. I'll add the tags when I prepare 
the next iteration, but the interfaces will change quite a bit. You may 
want to take another look at the series then.

Best regards
Thomas

>
>> ---
>>   drivers/gpu/drm/Makefile           |   3 +-
>>   drivers/gpu/drm/drm_vblank_timer.c | 100 +++++++++++++++++++++++++++++
>>   include/drm/drm_vblank_timer.h     |  26 ++++++++
>>   3 files changed, 128 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/drm_vblank_timer.c
>>   create mode 100644 include/drm/drm_vblank_timer.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index b5d5561bbe5f..6722e2d1aa7e 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -146,7 +146,8 @@ drm_kms_helper-y := \
>>       drm_plane_helper.o \
>>       drm_probe_helper.o \
>>       drm_self_refresh_helper.o \
>> -    drm_simple_kms_helper.o
>> +    drm_simple_kms_helper.o \
>> +    drm_vblank_timer.o
>>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>> diff --git a/drivers/gpu/drm/drm_vblank_timer.c 
>> b/drivers/gpu/drm/drm_vblank_timer.c
>> new file mode 100644
>> index 000000000000..be46d3135c8e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_vblank_timer.c
>> @@ -0,0 +1,100 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +
>> +#include <linux/hrtimer.h>
>> +
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_vblank_timer.h>
>> +
>> +static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer 
>> *timer)
>> +{
>> +    struct drm_vblank_timer *vtimer = container_of(timer, struct 
>> drm_vblank_timer, timer);
>> +    struct drm_crtc *crtc = vtimer->crtc;
>> +    struct drm_device *dev = crtc->dev;
>> +    u64 ret_overrun;
>> +    bool succ;
>> +
>> +    ret_overrun = hrtimer_forward_now(&vtimer->timer, 
>> vtimer->period_ns);
>> +    if (ret_overrun != 1)
>> +        drm_warn(dev, "vblank timer overrun\n");
>> +
>> +    if (vtimer->crtc_handle_vblank)
>> +        succ = vtimer->crtc_handle_vblank(crtc);
>> +    else
>> +        succ = drm_crtc_handle_vblank(crtc);
>> +    if (!succ)
>> +        return HRTIMER_NORESTART;
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> +static void drmm_vblank_timer_release(struct drm_device *dev, void 
>> *res)
>> +{
>> +    struct drm_vblank_timer *vtimer = res;
>> +
>> +    hrtimer_cancel(&vtimer->timer);
>> +}
>> +
>> +int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct 
>> drm_crtc *crtc,
>> +               bool (*crtc_handle_vblank)(struct drm_crtc *crtc))
>> +{
>> +    struct hrtimer *timer = &vtimer->timer;
>> +
>> +    vtimer->crtc = crtc;
>> +    vtimer->crtc_handle_vblank = crtc_handle_vblank;
>> +
>> +    hrtimer_setup(timer, drm_vblank_timer_function, CLOCK_MONOTONIC, 
>> HRTIMER_MODE_REL);
>> +
>> +    return drmm_add_action_or_reset(crtc->dev, 
>> drmm_vblank_timer_release, vtimer);
>> +}
>> +EXPORT_SYMBOL(drmm_vblank_timer_init);
>> +
>> +void drm_vblank_timer_start(struct drm_vblank_timer *vtimer)
>> +{
>> +    struct drm_crtc *crtc = vtimer->crtc;
>> +    struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +
>> +    drm_calc_timestamping_constants(crtc, &crtc->mode);
>> +
>> +    vtimer->period_ns = ktime_set(0, vblank->framedur_ns);
>> +    hrtimer_start(&vtimer->timer, vtimer->period_ns, HRTIMER_MODE_REL);
>> +}
>> +EXPORT_SYMBOL(drm_vblank_timer_start);
>> +
>> +void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer)
>> +{
>> +    hrtimer_cancel(&vtimer->timer);
>> +}
>> +EXPORT_SYMBOL(drm_vblank_timer_cancel);
>> +
>> +bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer 
>> *vtimer,
>> +                       int *max_error, ktime_t *vblank_time,
>> +                       bool in_vblank_irq)
>> +{
>> +    struct drm_crtc *crtc = vtimer->crtc;
>> +    struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +
>> +    if (!READ_ONCE(vblank->enabled)) {
>> +        *vblank_time = ktime_get();
>> +        return true;
>> +    }
>> +
>> +    *vblank_time = READ_ONCE(vtimer->timer.node.expires);
>> +
>> +    if (WARN_ON(*vblank_time == vblank->time))
>> +        return true;
>> +
>> +    /*
>> +     * To prevent races we roll the hrtimer forward before we do any
>> +     * interrupt processing - this is how real hw works (the 
>> interrupt is
>> +     * only generated after all the vblank registers are updated) 
>> and what
>> +     * the vblank core expects. Therefore we need to always correct the
>> +     * timestampe by one frame.
>> +     */
>> +    *vblank_time -= vtimer->period_ns;
>> +
>> +    return true;
>> +}
>> +EXPORT_SYMBOL(drm_vblank_timer_get_vblank_timestamp);
>> diff --git a/include/drm/drm_vblank_timer.h 
>> b/include/drm/drm_vblank_timer.h
>> new file mode 100644
>> index 000000000000..0b827ff1f59c
>> --- /dev/null
>> +++ b/include/drm/drm_vblank_timer.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#ifndef _DRM_VBLANK_TIMER_H_
>> +#define _DRM_VBLANK_TIMER_H_
>> +
>> +#include <linux/hrtimer_types.h>
>> +#include <linux/types.h>
>> +
>> +struct drm_crtc;
>> +
>> +struct drm_vblank_timer {
>> +    struct drm_crtc *crtc;
>> +    bool (*crtc_handle_vblank)(struct drm_crtc *crtc);
>> +    ktime_t period_ns;
>> +    struct hrtimer timer;
>> +};
>> +
>> +int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct 
>> drm_crtc *crtc,
>> +               bool (*handle_vblank)(struct drm_crtc *crtc));
>> +void drm_vblank_timer_start(struct drm_vblank_timer *vtimer);
>> +void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer);
>> +bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer 
>> *vtimer,
>> +                       int *max_error, ktime_t *vblank_time,
>> +                       bool in_vblank_irq);
>> +
>> +#endif
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

