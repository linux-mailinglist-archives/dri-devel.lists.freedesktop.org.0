Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF7EC013E8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED72110E8F6;
	Thu, 23 Oct 2025 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="19OppV/K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="42G4UDpO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2YtpurY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kvr9kMkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83B310E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:59:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B9511F441;
 Thu, 23 Oct 2025 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761224380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lLm9LdBx7gu+c99Yn0HQHE1LkyJE3l/KYkfgmbBJat0=;
 b=19OppV/KDKZ8CpLv4tmFR12O22d/u0cEcaupPyfBSP58HmevMmRefSSJ9OokMUshSi/sT9
 sNZSXuH1pl81FouRq5e5tzLT144UQ//dTza9O1d+VMvgEIrmORhWPFFAxJ+pPlzRIwb+Yz
 9xgULfr79wE2hzz2WJSP8ANEX9gxa2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761224380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lLm9LdBx7gu+c99Yn0HQHE1LkyJE3l/KYkfgmbBJat0=;
 b=42G4UDpOW5H882499R5lROQGeJNcnBJWK1joZWqSJgH9oFIwpTNhbFHYLv+aLFvXA131mf
 cRRYEwt6qu11ztCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O2YtpurY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kvr9kMkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761224376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lLm9LdBx7gu+c99Yn0HQHE1LkyJE3l/KYkfgmbBJat0=;
 b=O2YtpurYkaRA8IMXCFtcOW8N/P0Jj4YXiTwprE6IH9sMz0WCEjG+cWSCJ9xqHRvSBSACWh
 zvP9pgC5O+rseEyWwWaxf7jGK5VT40uPfq0pC+fTyhUOb2xcOYmMs9vf+A0XwLPuqkVB7L
 AdMKKVhou4Tw64g5gyJ3h6tAeUmq5RI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761224376;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lLm9LdBx7gu+c99Yn0HQHE1LkyJE3l/KYkfgmbBJat0=;
 b=kvr9kMkqT7VPI/YXZsaanKYy5gOYwaiqUt0MOpmVtBaO6/bCPhV/NVi/0I3IChoYohnFvT
 zzCIhM2mWi2ODRDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2A1E13285;
 Thu, 23 Oct 2025 12:59:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BvAeNrcm+mh2DgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 12:59:35 +0000
Message-ID: <3bc25289-57c8-4c7c-84dd-5ec961c8b2ac@suse.de>
Date: Thu, 23 Oct 2025 14:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tidss: Add some support for splash-screen
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Devarsh Thakkar <devarsht@ti.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
References: <20250908-tidss-splash-v2-1-e388b0581dfa@ideasonboard.com>
 <348086ac-b5bc-4ca9-9e5b-82106d319eeb@ti.com>
 <qljdrluxqi3abg7opwvp24ki7255jxrpowf47rpumzlcbnlnon@pccj5wm2kbxt>
 <0d1affe1-1e3c-452a-9052-104acaabef62@suse.de>
 <7ebf501a-68f5-4644-9419-49e391caacd8@ideasonboard.com>
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
In-Reply-To: <7ebf501a-68f5-4644-9419-49e391caacd8@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3B9511F441
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[iki.fi,linux.intel.com,gmail.com,ffwll.ch,lists.freedesktop.org,ideasonboard.com,vger.kernel.org];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
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

Am 22.10.25 um 18:37 schrieb Tomi Valkeinen:
> Hi,
>
> On 22/10/2025 17:59, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.10.25 um 16:06 schrieb Maxime Ripard:
>>> Hi,
>>>
>>> On Wed, Oct 22, 2025 at 07:25:10PM +0530, Devarsh Thakkar wrote:
>>>> On 08/09/25 14:43, Tomi Valkeinen wrote:
>>>>> Currently when the driver's probe is called, we do a full DSS reset. If
>>>>> the bootloader has set up a splash-screen, the reset will disable the
>>>>> video output, and after that it may still take time until the
>>>>> display is
>>>>> usable (all the kernel modules have been loaded) and even more time
>>>>> until the userspace is able to use the display.
>>>>>
>>>>> If fbdev is enabled, in a perfect case tidss would take over the fb
>>>>> memory set up by the bootloader, and use that memory for tidss's fbdev,
>>>>> thus retaining the splash-screen. However, we're not there yet.
>>>>>
>>>>> As a partial solution, this patch changes the driver so that the driver
>>>>> will not reset (or change) the DSS registers until tidss_runtime_get()
>>>>> is called when the display is being set up (because of fbdev
>>>>> modesetting
>>>>> or modesetting from the userspace).
>>>>>
>>>>> This is achieved in two parts:
>>>>>
>>>>> 1. Probe
>>>>>
>>>>> At probe time, in dispc_init_hw(), we check if the DSS is idle
>>>>> (videoports disabled). If yes, do a reset and continue as before. If
>>>>> not, we know that there's a splash-screen, and we set the
>>>>> 'tidss->boot_enabled_vp_mask' field to reflect the enabled VPs.
>>>>>
>>>>> We then enable the corresponding VP clocks (to ensure they stay on),
>>>>> set
>>>>> the IRQENABLE to 0 to make sure we won't get any interrupts, and then
>>>>> exit leaving the fclk and VP clocks enabled, and the runtime PM status
>>>>> active.
>>>>>
>>>>> 2. Runtime get
>>>>>
>>>>> Later, when the tidss_runtime_get() is called the first time, we check
>>>>> the 'boot_enabled_vp_mask'. If set, we know that we have the
>>>>> splash-screen showing on the screen, and thus the clocks are enabled
>>>>> and
>>>>> runtime PM status is active. This indicates that
>>>>> pm_runtime_resume_and_get() call just before in tidss_runtime_get() did
>>>>> not cause a runtime_resume callback to get called, so we need to do
>>>>> that
>>>>> manually.
>>>>>
>>>>> We call dispc_splash_fini() which essentially returns the DSS into the
>>>>> state where it would be in a non-splash-screen case:
>>>>> dispc_splash_fini()
>>>>> will do a DSS reset, manually call the runtime_resume callback, and
>>>>> then
>>>>> call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
>>>>> actions at probe time.
>>>>>
>>>>> Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
>>>>> longer in the "splash-screen mode".
>>>>>
>>>>> A note about fbdev emulation:
>>>>>
>>>>> If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
>>>>> This will cause a modeset, and the blank framebuffer from tidss's fbdev
>>>>> will be shown instead of the splash-screen.
>>>>>
>>>>> I see two improvements to this: either we should memcpy the pixel data
>>>>> from the bootloader's splash-screen to the new fbdev buffer, or the
>>>>> fbdev could use the splash-screen directly as its buffer. I have done
>>>>> some hacks for the former, but I'm not sure how to implement either of
>>>>> these properly.
>>> I still think it's not the kind of driver-specific driver behaviour we
>>> want to have.
>>>
>>> Even more so when we have a generic solution to this problem in the
>>> works.
>> I agree with that sentiment. We want atomic-state readout plus a
>> bootsplash DRM client. This would give us flicker-free booting with
>> smooth transitions across drivers and user space.
> I like the sound of it. What does a bootsplash DRM client do? Would this
> give us the ability for the userspace to do some small modifications to
> the fb (e.g. progress bar), and would it work with a built-in dummy
> driver (simpledrm), and the main DRM driver as a module?

Plymouth currently shows the image that it finds in 
/sys/firmware/acpi/bgrt/ . The bootsplash client would do the same. I 
think we could also make the client more flexible so that it shows the 
Tux logo or a preconfigured image. Animation is not likely to happen 
within the kernel.

The client would work with any driver. But by the time the kernel can 
load the native driver's module, it's better to switch to Plymouth anyway.

Best regards
Thomas

>
>   Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


