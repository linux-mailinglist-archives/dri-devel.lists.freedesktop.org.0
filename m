Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0555A42167
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6210E4F2;
	Mon, 24 Feb 2025 13:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2Vg3z+uB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5/HWi+iG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Vg3z+uB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5/HWi+iG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87F10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:41:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03CAF21170;
 Mon, 24 Feb 2025 08:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740386505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0q0OFhnReu4nyG1O8BohYY6LE6BcFtozBowaB0rVrI=;
 b=2Vg3z+uBOa9ZlLVULS4UP8fCjNyWJybxsK37iUOSJwx/roH8dg8KWMN7TO49M+zreqiHtE
 in9LcfQ/1065C+7LvX+Lptz8mSaLOG7dRTzJS/En7s1xdVxdVYI0cTBc0YQbltiMtCKomm
 7oxyXDEbKVWmfxmcqs7h6XChfx34vTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740386505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0q0OFhnReu4nyG1O8BohYY6LE6BcFtozBowaB0rVrI=;
 b=5/HWi+iGK2xtm2UCHvyvFDbwkJlzHbTrwG05DZgDeNpYdTCtr/ETRJVsOrAxgaqEa5VEBC
 cL39gNQcOsMpgqCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740386505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0q0OFhnReu4nyG1O8BohYY6LE6BcFtozBowaB0rVrI=;
 b=2Vg3z+uBOa9ZlLVULS4UP8fCjNyWJybxsK37iUOSJwx/roH8dg8KWMN7TO49M+zreqiHtE
 in9LcfQ/1065C+7LvX+Lptz8mSaLOG7dRTzJS/En7s1xdVxdVYI0cTBc0YQbltiMtCKomm
 7oxyXDEbKVWmfxmcqs7h6XChfx34vTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740386505;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Q0q0OFhnReu4nyG1O8BohYY6LE6BcFtozBowaB0rVrI=;
 b=5/HWi+iGK2xtm2UCHvyvFDbwkJlzHbTrwG05DZgDeNpYdTCtr/ETRJVsOrAxgaqEa5VEBC
 cL39gNQcOsMpgqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3173C13332;
 Mon, 24 Feb 2025 08:41:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OXG/CsgwvGcoVgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Feb 2025 08:41:44 +0000
Message-ID: <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
Date: Mon, 24 Feb 2025 09:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com"
 <joe@perches.com>, "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
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
In-Reply-To: <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[32];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.com,goodmis.org,rasmusvillemoes.dk,chromium.org,lwn.net,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linux-foundation.org,canonical.com,perches.com,linaro.org,amd.com,kodeit.net,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,marcan.st,armlinux.org.uk,lists.linux.dev,svenpeter.dev,jannau.net];
 FREEMAIL_TO(0.00)[live.com,linux.intel.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)]
X-Spam-Score: -2.80
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

Am 22.02.25 um 10:07 schrieb Aditya Garg:
>> What padding, please? Why TCP UAPI headers do not have these attributes?
>> Think about it, and think about what actually __packed does and how it affects
>> (badly) the code generation. Otherwise it looks like a cargo cult.
>>
>>> I tried removing __packed btw and driver no longer works.
>> So, you need to find a justification why. But definitely not due to padding in
>> many of them. They can go without __packed as they are naturally aligned.
> Alright, I did some debugging, basically printk sizeof(struct). Did it for both packed and unpacked with the following results:
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_request_header is 16
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_request_header_unpacked is 16
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_response_header is 20
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_response_header_unpacked is 20
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_simple_request is 32
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_simple_request_unpacked is 32
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_information is 65
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_msg_information_unpacked is 68

In the unpacked version, there is a 3-byte gap after the 
'bits_per_pixel' to align the next field. Using __packed removes those 
gaps at the expense of runtime overhead.
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_frame is 12
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_frame_unpacked is 12
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_footer is 80
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_footer_unpacked is 80
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request is 48
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_unpacked is 48
>
> Feb 22 13:02:03 MacBook kernel: size of struct appletbdrm_fb_request_response is 40
> Feb 22 13:02:04 MacBook kernel: size of struct appletbdrm_fb_request_response_unpacked is 40
>
> So, the difference in sizeof in unpacked and packed is only in appletbdrm_msg_information. So, I kept this packed, and removed it from others. The Touch Bar still works.
>
> So maybe keep just this packed?

The fields in the TCP header are aligned by design. Unfortunately, this 
hardware's protocol is not. And there's no way of fixing this now. Just 
keep all of them packed if you want. At least it's clear then what 
happens. And if your hardware requires this, you can't do much anyway.

Best regards
Thomas


>>
>>
>> ...
>>
>>>>> + if (response->msg == APPLETBDRM_MSG_SIGNAL_READINESS) {
>>>>> + if (!readiness_signal_received) {
>>>>> + readiness_signal_received = true;
>>>>> + goto retry;
>>>>> + }
>>>>> +
>>>>> + drm_err(drm, "Encountered unexpected readiness signal\n");
>>>>> + return -EIO;
>>>>> + }
>>>>> +
>>>>> + if (actual_size != size) {
>>>>> + drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
>>>>> + actual_size, size);
>>>>> + return -EIO;
>>>>> + }
>>>>> +
>>>>> + if (response->msg != expected_response) {
>>>>> + drm_err(drm, "Unexpected response from device (expected %p4ch found %p4ch)\n",
>>>>> + &expected_response, &response->msg);
>>>>> + return -EIO;
>>>> For three different cases the same error code, can it be adjusted more to the
>>>> situation?
>>> All these are I/O errors, you got any suggestion?
>> Your email client mangled the code so badly that it's hard to read. But I would
>> suggest to use -EINTR in the first case, and -EBADMSG. But also you may consider
>> -EPROTO.
> Thanks
>>>>> + }
>> ...
>>
>>>>> + if (ret)
>>>>> + return ret;
>>>>> + else if (!new_plane_state->visible)
>>>> Why 'else'? It's redundant.
>>> I’ve just followed what other drm drivers are doing here:
>>>
>>> https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/tiny/bochs.c#L436
>>> https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/tiny/cirrus.c#L363
>>>
>>> And plenty more
>> A bad example is still a bad example. 'else' is simply redundant in this
>> case and add a noisy to the code.
>>
>>> I won’t mind removing else. You want that?
>> Sure.
>>
>> ...
>>
>>>>> + request_size = ALIGN(sizeof(struct appletbdrm_fb_request) +
>>>>> +        frames_size +
>>>>> +        sizeof(struct appletbdrm_fb_request_footer), 16);
>>>> Missing header for ALIGN().
>>>>
>>>> But have you checked overflow.h for the possibility of using some helper macros
>>>> from there? This is what should be usually done for k*alloc() in the kernel.
>>> I don’t really think we need a macro here.
>> Hmm... is frames_size known to be in a guaranteed range to make sure no
>> potential overflow happens?
> I don’t really find any cause of potential overflow.
>
>
>>>>> + appletbdrm_state->request = kzalloc(request_size, GFP_KERNEL);
>>>>> +
>>>>> + if (!appletbdrm_state->request)
>>>>> + return -ENOMEM;
>> ...
>>
>>>>> + request->msg_id = timestamp & 0xff;
>>>> Why ' & 0xff'?
>>> https://github.com/imbushuo/DFRDisplayKm/blob/master/src/DFRDisplayKm/DfrDisplay.c#L147
>> This is not an answer.
>> Why do you need this here? Isn't the type of msg_id enough?
> Hmm, I double checked this. msg_id is u8 in the Linux port so would anyways never exceed 0xff. I’ll remove this.
> Its different in the Windows driver.
>> ...
>>
>>>>> + adev->mode = (struct drm_display_mode) {
>>>> Why do you need a compound literal here? Perhaps you want to have that to be
>>>> done directly in DRM_MODE_INIT()?
>>> I really don’t find this as an issue. You want me to declare another structure, basically this?:
>> Nope, I'm asking if the DRM_MODE_INIT() is done in a way that it only can be
>> used for the static data. Seems like the case. Have you tried to convert
>> DRM_MODE_INIT() to be always a compound literal? Does it break things?
> Seems to be breaking things.
>>> struct drm_display_mode mode = {
>>> DRM_MODE_INIT(60, adev->height, adev->width,
>>> DRM_MODE_RES_MM(adev->height, 218),
>>> DRM_MODE_RES_MM(adev->width, 218))
>>> };
>>> adev->mode = mode;
>>>
>>>>> + DRM_MODE_INIT(60, adev->height, adev->width,
>>>>> +       DRM_MODE_RES_MM(adev->height, 218),
>>>>> +       DRM_MODE_RES_MM(adev->width, 218))
>>>>> + };
>> -- 
>> With Best Regards,
>> Andy Shevchenko
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

