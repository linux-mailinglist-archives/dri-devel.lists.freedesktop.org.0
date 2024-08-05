Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E0947747
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 10:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81F310E15C;
	Mon,  5 Aug 2024 08:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y/QHR+Hx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7A1B/NeN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y/QHR+Hx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7A1B/NeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4B10E008
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 08:26:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 855591F7DB;
 Mon,  5 Aug 2024 08:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722846409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XngiWkeZHwMWBjYpZ7hK4nOZ2LMnPUOIWVb5vuenUgw=;
 b=y/QHR+HxjGxD37J14rGQdE/mOj0HqDbfTgrqx6C4Y+Me22cjI/2KdJXYIBoW9qhqw6GCgy
 FI5cczf0qQ67ex0a4wbfmHfti7KxFgs0biY0Uc1rAcnBNho56hZvU0Cw5meHi8bcuvsEyJ
 gZqv0j2VRx27VI+yTqDo9+VVR1E1vYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722846409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XngiWkeZHwMWBjYpZ7hK4nOZ2LMnPUOIWVb5vuenUgw=;
 b=7A1B/NeNf+JH3BBKwwgfEGYS+CyRTviKm+0HSeIcq7o4GL5nHuhXiaeP08fKiGvu6p1uJD
 jGB1bJlwNkcz5UCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="y/QHR+Hx";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7A1B/NeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722846409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XngiWkeZHwMWBjYpZ7hK4nOZ2LMnPUOIWVb5vuenUgw=;
 b=y/QHR+HxjGxD37J14rGQdE/mOj0HqDbfTgrqx6C4Y+Me22cjI/2KdJXYIBoW9qhqw6GCgy
 FI5cczf0qQ67ex0a4wbfmHfti7KxFgs0biY0Uc1rAcnBNho56hZvU0Cw5meHi8bcuvsEyJ
 gZqv0j2VRx27VI+yTqDo9+VVR1E1vYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722846409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XngiWkeZHwMWBjYpZ7hK4nOZ2LMnPUOIWVb5vuenUgw=;
 b=7A1B/NeNf+JH3BBKwwgfEGYS+CyRTviKm+0HSeIcq7o4GL5nHuhXiaeP08fKiGvu6p1uJD
 jGB1bJlwNkcz5UCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4798113254;
 Mon,  5 Aug 2024 08:26:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id U1pBEMmMsGbQWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 08:26:49 +0000
Message-ID: <da27771e-fa16-4356-bb0f-69245cc98098@suse.de>
Date: Mon, 5 Aug 2024 10:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/fb-helper: Don't schedule_work() to flush
 frame buffer during panic()
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Luck, Tony" <tony.luck@intel.com>, "Wang, Yudong" <yudong.wang@intel.com>
References: <20240703141737.75378-1-qiuxu.zhuo@intel.com>
 <20240805071355.42636-1-qiuxu.zhuo@intel.com>
 <c349e2c6-027e-4e65-800e-f30ac0a0a785@suse.de>
 <CY8PR11MB7134F297DE1D5F61A9FEA41689BE2@CY8PR11MB7134.namprd11.prod.outlook.com>
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
In-Reply-To: <CY8PR11MB7134F297DE1D5F61A9FEA41689BE2@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.50 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.50
X-Rspamd-Queue-Id: 855591F7DB
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

Am 05.08.24 um 10:10 schrieb Zhuo, Qiuxu:
> Hi Thomas,
>
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Monday, August 5, 2024 3:31 PM
>> [...]
>>> Hi Maarten and maintainers,
>>>
>>> A gentle ping :-).
>>>
>>> Could you please help push this v2 fix upstream?
>>> If you have any concerns, please let me know.
>> I already acked this patch, but I still have a question: during a panic, will fbcon
> Thanks for your kind review of this patch and ACK.
>
>> still print a panic message? I think that would likely require scheduling that
>> worker.
> During the error injection testing:
>
> 1) Without this v2 fix:
>
>     1.1) If panic() is not blocked on [1] (~99 times in 100 cycles),
>          then the console/fbcon can print normal panic-related messages like [2],
>          and the system can reboot successfully.
>
>     1.2) If panic() is blocked on [1] (~1 time in 100 cycles),
>          then the console/fbcon is silent and the system gets hung without reboot.
>           This is not the expected behavior. The system is expected to reboot.
>
> 2) With this v2 fix:
>
>     2.1) The console/fbcon can always print normal panic related messages like[2],
>          and the system can reboot successfully. Same behavior to 1.1).
>          [ we tested it ~1500 cycles. ]
>
> [1] panic() -> ... drm_fb_helper_damage() -> schedule_work().
>      For details, pls see the v2 commit message.
>
> [2] Panic messages:
>      [  133.900042] mce: [Hardware Error]: CPU 0: Machine Check Exception: 5 Bank 4: ba00000000000e0b
>      [  133.900046] mce: [Hardware Error]: RIP !INEXACT! 10:<ffffffff8229ebec> {intel_idle_xstate+0x6c/0xc0}
>      [  133.900055] mce: [Hardware Error]: TSC 9701dd289b MISC 29100000 PPIN 9000d7561bb0e340
>      [  133.900057] mce: [Hardware Error]: PROCESSOR 0:a06d1 TIME 1715827713 SOCKET 0 APIC 0 microcode 810001d0
>      [  133.900060] mce: [Hardware Error]: Run the above through 'mcelog --ascii'
>      [  134.053858] mce: [Hardware Error]: Machine check: Processor context corrupt
>      [  134.053866] Kernel panic - not syncing: Fatal machine check
>      [  134.075183] Kernel Offset: disabled
>      [  134.111372] pstore: backend (erst) writing error (-28)

Thanks for the detailed reply.

I've found that your patch has already been merged and should now be in 
v6.11-rc2. It'll probably be backported to older kernels as well.

 > dim cite 833cd3e9ad8360785b6c23c82dd3856df00732d9
833cd3e9ad83 ("drm/fb-helper: Don't schedule_work() to flush frame 
buffer during panic()")
 > git tag --contains 833cd3e9ad8360785b6c23c82dd3856df00732d9
drm-fixes-2024-08-02
drm-misc-fixes-2024-08-01
v6.11-rc2

Best regards
Thomas

>
> Thanks!
> -Qiuxu
>   
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

