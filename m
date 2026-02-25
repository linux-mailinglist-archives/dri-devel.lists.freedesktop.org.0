Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH1oDwS0nmnZWwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:34:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A4194498
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 09:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4810E710;
	Wed, 25 Feb 2026 08:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qAe0uNl4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tWX6GY+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f5obbsT4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r6VZIOL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14610E710
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 08:34:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E99225BD50;
 Wed, 25 Feb 2026 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772008447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oeJldWxRNuPHpqZ/hxtT7DtJjLtK7CgYtdenhhdc87E=;
 b=qAe0uNl4AYJJBLgqu2gBArwx3fJmKwoiKRVpDCl0gOgnHmHWfrCQ53XboL8JOdHi09WokX
 LNwgBUQ/rxmZViZqWmPmpLS+3ly+b/UJvRk8TVYy9reGT0GHKasRXL/3WO85qDJDtcuaZC
 NlkI1kVyzpahSTDdryT+3Ib5ZgAf2jM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772008447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oeJldWxRNuPHpqZ/hxtT7DtJjLtK7CgYtdenhhdc87E=;
 b=tWX6GY+GLUC212Iw/1bJ0ACMglOnwQAEXphtEfoWtO7OCMYyaMgD00Z50OF1YOyHsCNMH1
 U5hTFjlQFvh/WUAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f5obbsT4;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="r6VZIOL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772008446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oeJldWxRNuPHpqZ/hxtT7DtJjLtK7CgYtdenhhdc87E=;
 b=f5obbsT44Gi7HA9J3xYEh0ALtPriTT5zWetDTqkQCnPlToGH6KekFy+aHr50T4tLCMZgqG
 SjtpzhfnwADfuaAfow9Dti/RoDkf6JCQB4eTQJAEaTxq70KTaMnpMN99W2GL4fyyE5HaRi
 AAILMfn/50bWDGsDSwKSQR8KH4yvrxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772008446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oeJldWxRNuPHpqZ/hxtT7DtJjLtK7CgYtdenhhdc87E=;
 b=r6VZIOL/UqiKy+JDhdxFFeO/2eqGiezcGeMZpfEqO1yFOvkYCUGhDWMGC9UDiYtPQ0D8+z
 O9DGbI/wNjIoAXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ABB273EA65;
 Wed, 25 Feb 2026 08:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZDS9KP6znmksXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 08:34:06 +0000
Message-ID: <3316784a-d9e4-4199-a32a-44b4d0e7b4c2@suse.de>
Date: Wed, 25 Feb 2026 09:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/dumb-buffers: document that it's only for linear FB
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260225061315.1003811-1-zhengxingda@iscas.ac.cn>
 <6515820a-3bb3-4868-9b30-9c1f80709ab2@suse.de>
 <35fba9692636a2f6ba9fabc8e67f5684a54b17f1.camel@iscas.ac.cn>
 <131b54f7-a611-4a02-aca8-5613643a6276@suse.de>
 <80590bdf692add75da321a6fc595012d10192a14.camel@iscas.ac.cn>
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
In-Reply-To: <80590bdf692add75da321a6fc595012d10192a14.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.com:url,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 989A4194498
X-Rspamd-Action: no action

Hi

Am 25.02.26 um 09:10 schrieb Icenowy Zheng:
> 在 2026-02-25三的 08:47 +0100，Thomas Zimmermann写道：
>>
>> Am 25.02.26 um 08:38 schrieb Icenowy Zheng:
>>> 在 2026-02-25三的 08:26 +0100，Thomas Zimmermann写道：
>>>> Hi,
>>>>
>>>> Am 25.02.26 um 07:13 schrieb Icenowy Zheng:
>>>>> The ioctl interfaces for dumb buffers currently only properly
>>>>> support
>>>>> linear buffers.
>>>>>
>>>>> Mention this in the documentation snippet of dumb-buffers
>>>>> source
>>>>> code,
>>>>> which is referenced by drm-kms.rst and will end up in the built
>>>>> kernel
>>>>> documentation.
>>>>>
>>>>> Also mention the existence of current drivers abusing dumb
>>>>> buffers
>>>>> for
>>>>> AFBC to reduce confusion about this.
>>>>>
>>>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_dumb_buffers.c | 7 ++++++-
>>>> We documented the meaning of the color bits and the behavior of
>>>> the
>>>> dumb-buffer interface at [1]. If anything is missing, it should
>>>> be
>>>> added
>>>> there.
>>> Yes, I saw this piece of document; however it's part of the
>>> interface
>>> document instead of a concept document, and the whole existence of
>>> the
>> What is a concept document?
> Well I am patching this document snippet because it becomes part of the
> document at [1] (by being referenced in the .rst file).

That question was a joke, but also not entirely untrue.

These overview sections usually introduce the purpose of a module and 
give readers a sense of how to use the code; like a tutorial. We don't 
have concept documents. As the concepts keep changing, they'd bitrot 
quickly.

For example, not too long ago we discussed the possibility of a 
CREATE_DUMB2 ioctl that would allow for specifying the DRM format 
directly. It would also allow formats with multiple planes and 
non-linear layouts. My point is that whatever we write here today could 
be obsolete tomorrow. The only stable thing is the user-space interfaces.

IMHO if you think the overview should mention the supported formats, you 
should link to the UAPI documentation of the ioctl. If we ever get that 
CREATE2 ioctl, we can refer to this as well.

Best regards
Thomas

>
> [1] https://docs.kernel.org/gpu/drm-kms.html#dumb-buffer-objects
>
>>> document snippet I am changing can be considered a duplicate of the
>>> interface document.
>>>
>>> Thanks
>>> Icenowy
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/v6.19/source/include/uapi/drm/drm_mode.h#L1200
>>>>
>>>>>     1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c
>>>>> b/drivers/gpu/drm/drm_dumb_buffers.c
>>>>> index e2b62e5fb891b..06f74460adf62 100644
>>>>> --- a/drivers/gpu/drm/drm_dumb_buffers.c
>>>>> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
>>>>> @@ -57,7 +57,12 @@
>>>>>      *
>>>>>      * Note that dumb objects may not be used for gpu
>>>>> acceleration,
>>>>> as has been
>>>>>      * attempted on some ARM embedded platforms. Such drivers
>>>>> really
>>>>> must have
>>>>> - * a hardware-specific ioctl to allocate suitable buffer
>>>>> objects.
>>>>> + * a hardware-specific ioctl to allocate suitable buffer
>>>>> objects.
>>>>> They are
>>>>> + * also currently meant for only linear buffers, and using
>>>>> them
>>>>> with any
>>>>> + * modifier other than DRM_FORMAT_MOD_LINEAR is undefined
>>>>> behavior. There
>>>>> + * exist some KMS drivers abusing dumb objects for AFBC
>>>>> framebuffers, but this
>>>>> + * behavior is discouraged, only exists as a hack now and
>>>>> shouldn't be
>>>>> + * replicated.
>>>>>      */
>>>>>     
>>>>>     static int drm_mode_align_dumb(struct drm_mode_create_dumb
>>>>> *args,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


