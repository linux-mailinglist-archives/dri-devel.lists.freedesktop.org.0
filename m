Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMcqIph0oGmtjwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:28:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04891AA505
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 17:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC0A10E9C0;
	Thu, 26 Feb 2026 16:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jj7WrCHN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f3ui27VK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XhgK+y0/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KU//Abyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92E010E9C0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 16:28:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42E474D221;
 Thu, 26 Feb 2026 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772123283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7OzRAhMeZQL8q2h2b++YGnNVZBcTS3noQFvdVVpUYiI=;
 b=jj7WrCHNjgLSgeqf1ocTKPa417KkjsAAnjavnkAD8GNCFgkFnah88+9u4vJyfW1uKANYYU
 5QGRp1JWNqomUAQm89r8KjaPk8q45Js2AlIX8TwtyPPXFST8U0BTXZW4vyrf6faS9oWABp
 jzVdgUxvtPFmAZKzlH9hyqixkXwWCkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772123283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7OzRAhMeZQL8q2h2b++YGnNVZBcTS3noQFvdVVpUYiI=;
 b=f3ui27VKtEjcxWOhqpDtI3urA5KSdCUP80U5l2EwontfFWygByBUbjIV68LURZplR3bpw+
 A8ZKACMlzHZo3lBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772123282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7OzRAhMeZQL8q2h2b++YGnNVZBcTS3noQFvdVVpUYiI=;
 b=XhgK+y0/Vs1pFiv+W0wrlTEIajBYkcl0gGZvEUhNup3XSbuCBAVYbEoh1CQd2g4InrrZor
 SeD9uKteJbvgBlc4I4PZgA3wAgubvNyVgchabYyX/VYiNy0G0J7qwDaCSIh2v/Q1UfN8E/
 CC08AAK//q5jjVJw2nspNY9l6TwWGm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772123282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7OzRAhMeZQL8q2h2b++YGnNVZBcTS3noQFvdVVpUYiI=;
 b=KU//AbypvhvIgXwFQBDJhp+rCkqk6gO3BdrWvYelINypKhJY2+FutpWFFVS8ROLYeAddV/
 XytgGzjZ1pdvDiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D07E3EA62;
 Thu, 26 Feb 2026 16:28:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2Aa+AZJ0oGlKGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Feb 2026 16:28:02 +0000
Message-ID: <72fc0fd8-f604-4f88-8664-8079b779ed4f@suse.de>
Date: Thu, 26 Feb 2026 17:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/dumb-buffers: document abuses in the UAPI document
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226063740.2872016-1-zhengxingda@iscas.ac.cn>
 <20260226063740.2872016-2-zhengxingda@iscas.ac.cn>
 <4380ab4e-6b40-4f72-91f3-2dc0362ce2a5@suse.de>
 <6bfa80c659d0f1336bcddd844874693766791b6e.camel@iscas.ac.cn>
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
In-Reply-To: <6bfa80c659d0f1336bcddd844874693766791b6e.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,bootlin.com:url,iscas.ac.cn:email,suse.com:url]
X-Rspamd-Queue-Id: D04891AA505
X-Rspamd-Action: no action

Hi

Am 26.02.26 um 17:06 schrieb Icenowy Zheng:
> 在 2026-02-26四的 17:01 +0100，Thomas Zimmermann写道：
>> Hi
>>
>> Am 26.02.26 um 07:37 schrieb Icenowy Zheng:
>>> Although the current DRM_IOCTL_MODE_CREATE_DUMB interface design
>>> only
>>> suits linear buffers, some KMS drivers abuse it for AFBC
>>> framebuffers.
>>>
>>> Mention it in the interface document, and clarifying that it's not
>>> recommended.
>>>
>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>> ---
>>>    include/uapi/drm/drm_mode.h | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h
>>> b/include/uapi/drm/drm_mode.h
>>> index cbbbfc1dfe2b8..02b6fa7ade355 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -1256,6 +1256,10 @@ struct drm_mode_crtc_page_flip_target {
>> Since you're at it, you should move the line at [1] right here as the
>> first sentence of this paragraph. Then continue with 'Do not
>> attempt'.
>>
>> With that change, the previous paragraphs refer to pixel formats and
>> the
>> final one refers to framebuffer layout.
>>
>>
>>>     * Do not attempt to allocate anything but linear framebuffer
>>> memory
>>>     * with single-plane RGB data. Allocation of other framebuffer
>>>     * layouts requires dedicated ioctls in the respective DRM
>>> driver.
>>> + * There exists drivers exploiting this interface for framebuffers
>> 'exists user-space software'
> Ah the drivers seem to be also criminal to accept this kind of usage,
> it's why I thought about writing "drivers" here.

Each driver implements dumb buffers on top of its own memory manager. 
They are complicit in the sense that they often never tested against the 
limitations of the dumb-buffer ioctl. But OTOH the limitations where 
never written down clearly. Only very recently did we add the code and 
documentation to clarify dumb-buffer semantics. [1] And not all drivers 
have been updated yet.

Therefore several user-space programs used dumb-buffers in an 
"out-of-scope fashion" and got away with it. The comments in 
drm_mode_size_dumb() list the known exceptions.

Best regards
Thomas

[1] https://lore.kernel.org/all/20250821081918.79786-3-tzimmermann@suse.de/

>
> Thanks
> Icenowy
>
>>> + * with modifiers other than DRM_FORMAT_MOD_LINEAR, but this is
>> Rather 'with non-linear layout'.  The reference to MOD_LINEAR seems
>> out
>> of place here.
>>
>>> + * incorrect usage with undefined behavior, and should not be
>>> + * replicated.
>> Best regards
>> Thomas
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.19/source/include/uapi/drm/drm_mode.h#L1216
>>
>>>     */
>>>    struct drm_mode_create_dumb {
>>>    	__u32 height;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


