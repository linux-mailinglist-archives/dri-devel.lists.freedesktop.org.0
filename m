Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC58AB43E87
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787B710EA57;
	Thu,  4 Sep 2025 14:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QnOhQ3mp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zDWa5pz1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbCJuyU7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R6l4ynBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661A710EA57
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 14:21:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBB0E5FEF9;
 Thu,  4 Sep 2025 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756995698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RaEkAYhCu20p/vmzEe3SSuBc5WbFH3P8LiOLqlBMM8A=;
 b=QnOhQ3mpNBbD0SYTPrtKHclotNqq4ApeU0zpPJddvVwuJmdatNfle6hqDgckAOjVNKVEnq
 2DOCnd50LsPMHkARQXsEaakUCM/2PWpoqn2jdpCUv61WaKlG9+1QWeeaD3ZYRw9sFOtPGD
 8QuHAv8XeaanEqnwt4vqTfX8PuXtaXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756995698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RaEkAYhCu20p/vmzEe3SSuBc5WbFH3P8LiOLqlBMM8A=;
 b=zDWa5pz18ramNB8iUR2xngKTXRCz64FGIFx75FetJbdFD1O2H66fd4qAmqDWy/zX/QtJJ1
 Kkcws7ttWDjOdNAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AbCJuyU7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R6l4ynBK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756995697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RaEkAYhCu20p/vmzEe3SSuBc5WbFH3P8LiOLqlBMM8A=;
 b=AbCJuyU7yUO6PLFz8nCjHn6nzPhsR+RwYQlMNMsR8C4XcAH59i6ZaXUGZoHiPnT6AYaZh5
 /8kg+Ylp+QSdiGKaJUnCWFRvV8uah1ntpVBeB//POBYS2O8uCZ4gAZQKwSlesigzHzIjN4
 6VtYId8sJNG8kw5s+r5Xcmz223MP3eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756995697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RaEkAYhCu20p/vmzEe3SSuBc5WbFH3P8LiOLqlBMM8A=;
 b=R6l4ynBKYJ0pPbywEz79yGAyUE7TsgUeYFTV/AVPxDngemol7+jU74T8fX+9x1VVH5wbKD
 fW0bLhd8lI3klxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9426913675;
 Thu,  4 Sep 2025 14:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nJx+InGguWhHdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Sep 2025 14:21:37 +0000
Message-ID: <0f723805-1c51-4cf0-85b4-0923792bd513@suse.de>
Date: Thu, 4 Sep 2025 16:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vblank: Add vblank timer
To: Lyude Paul <lyude@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: louis.chauvet@bootlin.com, drawat.floss@gmail.com,
 hamohammed.sa@gmail.com, melissa.srw@gmail.com, mhklinux@outlook.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-2-tzimmermann@suse.de> <aLbww2PiyM8FLGft@intel.com>
 <acd4006a-9d8e-4747-8146-7d8d5a3dc670@suse.de>
 <363bea2eb447d85d07e793b4a3e0abbbaea7c788.camel@redhat.com>
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
In-Reply-To: <363bea2eb447d85d07e793b4a3e0abbbaea7c788.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 FREEMAIL_CC(0.00)[bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url, bootlin.com:url,
 suse.de:mid, suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EBB0E5FEF9
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

Hi,

thanks for the reply.

Am 02.09.25 um 17:58 schrieb Lyude Paul:
> A solution down below + some other things you should be aware of :)
>
> On Tue, 2025-09-02 at 16:16 +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 02.09.25 um 15:27 schrieb Ville Syrjälä:
>>> On Mon, Sep 01, 2025 at 01:06:58PM +0200, Thomas Zimmermann wrote:
>>>> The vblank timer simulates a vblank interrupt for hardware without
>>>> support. Rate-limits the display update frequency.
>>>>
>>>> DRM drivers for hardware without vblank support apply display updates
>>>> ASAP. A vblank event informs DRM clients of the completed update.
>>>>
>>>> Userspace compositors immediately schedule the next update, which
>>>> creates significant load on virtualization outputs. Display updates
>>>> are usually fast on virtualization outputs, as their framebuffers are
>>>> in regular system memory and there's no hardware vblank interrupt to
>>>> throttle the update rate.
>>>>
>>>> The vblank timer is a HR timer that signals the vblank in software.
>>>> It limits the update frequency of a DRM driver similar to a hardware
>>>> vblank interrupt. The timer is not synchronized to the actual vblank
>>>> interval of the display.
>>>>
>>>> The code has been adopted from vkms, which added the funtionality
>>>> in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
>>>> hrtimers").
>>> Does this suffer from the same deadlocks as well?
>>> https://lore.kernel.org/all/20250510094757.4174662-1-zengheng4@huawei.com/
>> Thanks for this pointer. It has not been fixed yet, right? If vkms is
>> affected, this series probably is as well.
>>
>> Best regards
>> Thomas
>>
> Hi! I am glad I saw this mail fly by the list because I actually have a fix
> for this deadlock in my very incomplete vkms port to rust:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs#L336
>
> Basically what we do is keep track of when we're reporting a vblank event from
> the hrtimer thread we use to emulate vblanks along with if we're trying to
> stop the vblank timer:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs#L336
>
> Stopping the timer happens like this:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs#L232
>
> We grab the lock protecting cancelled and reporting, set cancelled, and then
> only attempt to cancel the timer if it's not busy reporting. If it is, we
> simply leave the timer be and rely on it noticing that cancelled has been set.

That code still contains race conditions AFAICT.

There are a number of ways to resolve this. I think the best would be to 
remove the softirq_expiry_lock from the hrtimer's cancel logic. The 
comment at [1] sounds like it is not really necessary to use that 
specific lock.

[1] 
https://elixir.bootlin.com/linux/v6.16.4/source/kernel/time/hrtimer.c#L1453

But IDK about the implications. Another idea is to push 
drm_handle_vblank() out of the vblank timer callback. But that might 
confuse DRM's vblank logic.

I ended up with a solution similar to yours, but much simpler. The 
cancel function signals to the timer to not restart itself. The start 
function waits for any dangling timer callback to stop itself. The code 
further uses hrtimer_try_to_cancel(), which is not affected by the deadlock.


>
> The place where we actually unconditionally stop the timer is on
> atomic_disable:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs#L136
>
> Which works fine since unlike vblank_disable(), we're outside of the various
> vblank_time locks - and thus can wait on hrtimer_cancel() to complete without
> worrying about a deadlock.

I'd be careful with that. You're modifying the vblank state behind the 
back of the vblank helpers. Probably works here, but can also backfire.

>
> JFYI, there is one other fix here you might want too. When vkms disables the
> vblank timer and then re-enables it later, I'm fairly certain it doesn't
> actually schedule the timer for the correct time:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/vkms/vkms_crtc.c#L68
>
> Notice that it's a relative timer, and in enable_vblank() we schedule the
> timer to happen at now + frame_duration. The problem with this is that we
> should be rescheduling the hrtimer for when the next vblank would happen in
> relation to when the display pipe originally had vblank events enabled - not
> in relation to the current time.
>
> In other words: you could have vblanks enabled, disable them, and then
> (frame_duration / 2) nanoseconds later re-enable the timer - meaning that
> every vblank interrupt is now (frame_duration / 2) nanoseconds offset from
> when the vblank interval should actually be occurring. I'm not sure if this
> actually breaks anything though, but it certainly doesn't seem correct. To fix
> this in rvkms, we keep a timestamp of when we originally enabled the pipe and
> do some modulus fun to figure out the exact timestamp for the next vblank
> interval:
>
> https://gitlab.freedesktop.org/lyudess/linux/-/blob/rvkms-slim/drivers/gpu/drm/rvkms/crtc.rs#L168
>
> We also use absolute timers instead of relative to really make sure things get
> scheduled at just the right tie.

I've been wondering about this problem as well, but never found any 
issues with it. See [2] for how it's currently done in vkms. If the 
timer is still off, it takes the current time for the last vblank. And 
if the timer is on, it computes the previous vblank time. So the values 
should be fine.

[2] 
https://elixir.bootlin.com/linux/v6.17-rc4/source/drivers/gpu/drm/vkms/vkms_crtc.c#L83

On the problem in general: we have the get_scanout_position [3] 
callback, which would be the right thing to call here. The timeout could 
be computed from the returned values. For virtual displays it wouldn't 
matter much. But for hardware, the vblank timer could be synced to the 
real vblank if the hardware provides the necessary information.

[3] 
https://elixir.bootlin.com/linux/v6.17-rc4/source/include/drm/drm_modeset_helper_vtables.h#L489

Best regards
Thomas

>
> (I will try to port these fixes over to vkms at some point unless someone else
> gets to them first…)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


