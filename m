Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D9LJympnmntWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:47:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B1193B1B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6610E6D7;
	Wed, 25 Feb 2026 07:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="leMgShkJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y2ighZs1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pzGSu68u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ogq0jHd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFAC10E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:47:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F5673F6B9;
 Wed, 25 Feb 2026 07:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772005666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GXcXBIPwk/nrxk+kPcbphRuderA+jrBf/lMk0e/kpsE=;
 b=leMgShkJlk5p4ur3hMzfybEKC1N0iU9aocsLnvjWi3+cA1uL30lx/si4EW6ZCYoH6gPeoT
 tFfmZgoxNJq+EjJgyZTdng4mbNbudm2KzDlyggJmFTx1fd3w/yOhH3BPApB/iYC6Cx62Pa
 yY4Aoj/8GrHHfPOAKscWF7J1A3Ffktg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772005666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GXcXBIPwk/nrxk+kPcbphRuderA+jrBf/lMk0e/kpsE=;
 b=Y2ighZs1rg8EA5UuhIU4GrECATcZBkJijyD6jVyVEdt3errugpZKyRl4rG1ARwrbBSH+dd
 e5AZyla2K5uetHDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pzGSu68u;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ogq0jHd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772005664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GXcXBIPwk/nrxk+kPcbphRuderA+jrBf/lMk0e/kpsE=;
 b=pzGSu68u82Z0solw9fxyCUoVHyZTVwp6L++uAGEc7qt2ZYrdbA+rWP1PLjPRIHZnTQF8zN
 IogQhh4/WpsS3WLuLIIQlDgxNSg1WBYMw0M2xxSMi0lahz0zBF9jsq5llQihgmT8ecTYdj
 dNFepfQ5cpQUUrpPIOeACtm1KMC7SAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772005664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GXcXBIPwk/nrxk+kPcbphRuderA+jrBf/lMk0e/kpsE=;
 b=Ogq0jHd2GoilRSdExkitCBaoxySgK1KaEfZ4dX1WeTC1BjitDAnfgef6p5Q/4aAsw3MLFr
 bx1ukKMVuhHzVLDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E55A3EA65;
 Wed, 25 Feb 2026 07:47:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m+aRFSCpnmmuLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 07:47:44 +0000
Message-ID: <131b54f7-a611-4a02-aca8-5613643a6276@suse.de>
Date: Wed, 25 Feb 2026 08:47:43 +0100
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
In-Reply-To: <35fba9692636a2f6ba9fabc8e67f5684a54b17f1.camel@iscas.ac.cn>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,iscas.ac.cn:email,suse.de:mid,suse.de:dkim,bootlin.com:url,suse.com:url]
X-Rspamd-Queue-Id: 189B1193B1B
X-Rspamd-Action: no action



Am 25.02.26 um 08:38 schrieb Icenowy Zheng:
> 在 2026-02-25三的 08:26 +0100，Thomas Zimmermann写道：
>> Hi,
>>
>> Am 25.02.26 um 07:13 schrieb Icenowy Zheng:
>>> The ioctl interfaces for dumb buffers currently only properly
>>> support
>>> linear buffers.
>>>
>>> Mention this in the documentation snippet of dumb-buffers source
>>> code,
>>> which is referenced by drm-kms.rst and will end up in the built
>>> kernel
>>> documentation.
>>>
>>> Also mention the existence of current drivers abusing dumb buffers
>>> for
>>> AFBC to reduce confusion about this.
>>>
>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>> ---
>>>    drivers/gpu/drm/drm_dumb_buffers.c | 7 ++++++-
>> We documented the meaning of the color bits and the behavior of the
>> dumb-buffer interface at [1]. If anything is missing, it should be
>> added
>> there.
> Yes, I saw this piece of document; however it's part of the interface
> document instead of a concept document, and the whole existence of the

What is a concept document?

> document snippet I am changing can be considered a duplicate of the
> interface document.
>
> Thanks
> Icenowy
>
>> Best regards
>> Thomas
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.19/source/include/uapi/drm/drm_mode.h#L1200
>>
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c
>>> b/drivers/gpu/drm/drm_dumb_buffers.c
>>> index e2b62e5fb891b..06f74460adf62 100644
>>> --- a/drivers/gpu/drm/drm_dumb_buffers.c
>>> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
>>> @@ -57,7 +57,12 @@
>>>     *
>>>     * Note that dumb objects may not be used for gpu acceleration,
>>> as has been
>>>     * attempted on some ARM embedded platforms. Such drivers really
>>> must have
>>> - * a hardware-specific ioctl to allocate suitable buffer objects.
>>> + * a hardware-specific ioctl to allocate suitable buffer objects.
>>> They are
>>> + * also currently meant for only linear buffers, and using them
>>> with any
>>> + * modifier other than DRM_FORMAT_MOD_LINEAR is undefined
>>> behavior. There
>>> + * exist some KMS drivers abusing dumb objects for AFBC
>>> framebuffers, but this
>>> + * behavior is discouraged, only exists as a hack now and
>>> shouldn't be
>>> + * replicated.
>>>     */
>>>    
>>>    static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


