Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1315990268
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281C10E25D;
	Fri,  4 Oct 2024 11:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1AaiS6Fd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BtaIz3u9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1AaiS6Fd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BtaIz3u9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24610E9E2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 11:47:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D58E91FB76;
 Fri,  4 Oct 2024 11:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728042477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9Ug8e3biK/ICfpkcDXT77RkdImDRSwsz1d2f8HF6wSo=;
 b=1AaiS6FdsoIPWGx5iIfKIzdTRo4Ss9xIuvuNUIAgaWYuJGxt75kgquns/MFdu+mcld+oFy
 azFupRva69nOfmmJAJAarbaXGvBXj/r/HYkwM2cfIFaMFk0bTPvLUhF6i7gtrQur/mSkSI
 MseFdR9pfE7Lg1jnLcy/YQJIESvFKNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728042477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9Ug8e3biK/ICfpkcDXT77RkdImDRSwsz1d2f8HF6wSo=;
 b=BtaIz3u9+WEGzntRPU9gaGMRDwKDssvliY20h9dwMIQ/CjCmCLnbj2Fz6JgDdXKyX2SqwA
 h9pb/2TcZrCdNcCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1AaiS6Fd;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BtaIz3u9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728042477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9Ug8e3biK/ICfpkcDXT77RkdImDRSwsz1d2f8HF6wSo=;
 b=1AaiS6FdsoIPWGx5iIfKIzdTRo4Ss9xIuvuNUIAgaWYuJGxt75kgquns/MFdu+mcld+oFy
 azFupRva69nOfmmJAJAarbaXGvBXj/r/HYkwM2cfIFaMFk0bTPvLUhF6i7gtrQur/mSkSI
 MseFdR9pfE7Lg1jnLcy/YQJIESvFKNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728042477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9Ug8e3biK/ICfpkcDXT77RkdImDRSwsz1d2f8HF6wSo=;
 b=BtaIz3u9+WEGzntRPU9gaGMRDwKDssvliY20h9dwMIQ/CjCmCLnbj2Fz6JgDdXKyX2SqwA
 h9pb/2TcZrCdNcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F6F013A6E;
 Fri,  4 Oct 2024 11:47:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 07zSIe3V/2YiNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 11:47:57 +0000
Message-ID: <55f1042d-e2a1-4f14-bd4b-78131e862bff@suse.de>
Date: Fri, 4 Oct 2024 13:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
 "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de> <Zv-84gdD85CqVeh5@intel.com>
 <f034dcb4-fe1d-4a2d-b917-1ca489b1d00b@suse.de> <Zv_PM8-x5GZWFLGk@intel.com>
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
In-Reply-To: <Zv_PM8-x5GZWFLGk@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D58E91FB76
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[intel.com,redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[11]; TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 04.10.24 um 13:19 schrieb Ville Syrjälä:
> On Fri, Oct 04, 2024 at 01:03:21PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> thanks for your help.
>>
>>
>> Am 04.10.24 um 12:01 schrieb Ville Syrjälä:
>>> On Fri, Oct 04, 2024 at 11:17:02AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 02.10.24 um 18:15 schrieb Luck, Tony:
>>>>>> Thanks for the bug report. Can you provide the output of 'sudo lspci
>>>>>> -vvv' for the graphics device?
>>>>> Thomas,
>>>>>
>>>>> Sure. Here's the output (run on the v6.11.0 kernel)
>>>> Thanks. It doesn't look much different from other systems. IRQ is also
>>>> assigned.
>>>>
>>>> Attached is a patch that fixes a possible off-by-one error in the
>>>> register settings. This would affect the bug you're reporting. If
>>>> possible, please apply the patch to your 6.12-rc1, test and report the
>>>> result.
>>> Didn't one of these weird variants have some bug where the
>>> CRTC startadd was not working? Is this one of those?
>> Yeah, but it seems unrelated.
>>
>>> That to me sounds like maybe linecomp has internally been
>>> tied to be always active somehow. Perhaps that would
>>> also prevent it from generating the interrupt...
>> Linecomp is usually set to vtotal and that disables the irq. When set to
>> vblank_start/vdisplay_end, it acts like a vblank IRQ. But the other
>> matrox drivers I saw (fbdev, Xorg-video-matrox) set the value -1, while
>> mgag200 doesn't. So there really is an off-by-one error.
> For the purposes of the interrupt it shouldn't matter
> at all what the linecomp value is, as long as it's
> between 0 and vtotal. The patch seemed to just care
> about vblkstr which doesn't seem relevant to me.

vblkstr is "vblank start" and equal to vdisplay_end. Then linecomp = 
vblkstr; happens at some later point in the function.

I've run into several mysterious vblank timeouts while making this 
patchset and they all seemed to be related to the exact values in these 
registers. So I'm not sure if linecomp really fires an interrupt if it 
happens too late after vdisplay_end/vblank_start. The official 
documentation is a bit confusing IIRC. So my first step here is to make 
mgag200 behave like other existing drivers and see if that fixes the 
issue. Hence the off-by-one fix.

>
>>> Anyways, sounds like someone should just double check whether
>>> the status bit ever get asserted or not. If yes, then the
>>> problem must be with interrupt delivery, otherwise the
>>> problem is that the internal interrupt is never even
>>> generated. In the latter case you could try using the
>>> vsync interrupt instead.
>> I didn't want to go into full debugging while there's a low-hanging fix
>> to try first. I'll probably take that patch anyway even if it doesn't
>> fix the reported bug.
>>
>> Wrt. vsync: isn't that way to late for vblank events? Does DRM give any
>> timing guarantees? (It doesn't AFAIK.) Or does it just mean that a
>> vblank has happened at some point in the past?
> It doesn't really matter when the interrupt gets signalled
> as long as it's after vblank start. And since the hardware
> doesn't even have double buffered register and IIRC doesn't
> really care when you reprogram eg. the start address it should
> matter even less. Not that it looks like you even try to
> do any atomic updates from the vblank handler, so I guess
> you just want this for throttling purposes?

I see. VSYNC would likely work for that. Throttling is the main purpose.

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

