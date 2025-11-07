Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D357C3EAF0
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45310E19D;
	Fri,  7 Nov 2025 07:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Aacc5KGD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ewvCidHS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yl+arSRS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D9kONvfG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AA089D8E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:03:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B61362122D;
 Fri,  7 Nov 2025 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762498984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dkEIIQJ0+7fAB2++d0teBNNzb0HgdmwvHvhIkldA0Kk=;
 b=Aacc5KGDqMVeMEq5GClJZefl9m5t4ot0LosYGY0MDuMQ0VVXVNTPU5/RIh8QRPabpStqRT
 K1bMhe4at1gaPJ+Y7XVGIsNkWZaHOGnP4LorPMNglehHm05Hv0Nin/E+sZ+l8yVSjyrVJB
 In+A+X7fHUIarlSCenz6PjpZN0berIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762498984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dkEIIQJ0+7fAB2++d0teBNNzb0HgdmwvHvhIkldA0Kk=;
 b=ewvCidHSqfeiQhjZJBmVugnIxsnQy/snkoo8JT9HvYUO+PWyElVcLkEh/ZJm+RiOJPBNar
 cu8x6jdi/CWjDdBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762498983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dkEIIQJ0+7fAB2++d0teBNNzb0HgdmwvHvhIkldA0Kk=;
 b=yl+arSRSy5Kv0KBlVm6S/Ft5Rl/3DgtyQqfSOWGGPkMfDc4uQQrccyMGWB71Nk85IxwFQY
 tNbpPWwVEy2eZ1/fNSVFl/4wty5cXDIByZbeHXtRk++bmZLYqt+pbPWXWYUQUQuBwkFCeT
 QVMI2/J1ibEvr0EbNuIl1h/h3b5vCAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762498983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dkEIIQJ0+7fAB2++d0teBNNzb0HgdmwvHvhIkldA0Kk=;
 b=D9kONvfGfbnS9wR33SIuWPwysa1Kz9r8wCBhsNDO6PCKYm38yUk7DXBA0aAVL9AUbUSyIg
 y+eaiynYdq4YgTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FEED132DD;
 Fri,  7 Nov 2025 07:03:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CE2aJaeZDWmUdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Nov 2025 07:03:03 +0000
Message-ID: <6f440db9-c224-49f7-95b9-1465ed2cb29a@suse.de>
Date: Fri, 7 Nov 2025 08:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Set surface-framebuffer GEM objects
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zack.rusin@broadcom.com>
References: <20251104103611.167821-1-tzimmermann@suse.de>
 <CABQX2QPP-m8mFr5Ze3Ry1Yi70wT2neKf7OsbSjKqzcH9MMFe8A@mail.gmail.com>
 <2abf4e25-d081-40bd-9a83-79bb026d5239@suse.de>
Content-Language: en-US
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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
In-Reply-To: <2abf4e25-d081-40bd-9a83-79bb026d5239@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, suse.com:url,
 intel.com:email, broadcom.com:email, lists.freedesktop.org:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

cc'ing dri-devel, which apparently got lost somehow

Am 07.11.25 um 08:02 schrieb Thomas Zimmermann:
> Hi
>
> Am 07.11.25 um 06:06 schrieb Zack Rusin:
>> On Tue, Nov 4, 2025 at 5:36 AM Thomas Zimmermann 
>> <tzimmermann@suse.de> wrote:
>>> Set struct drm_framebuffer.obj[0] to the allocated GEM buffer object
>>> for surface framebuffers. Avoids a NULL-pointer deref in the client's
>>> vmap helpers.
>>>
>>> [   22.640191] Console: switching to colour frame buffer device 160x50
>>> [   22.641788] Oops: general protection fault, probably for
>>>    non-canonical address 0xdffffc000000001f: 0000 [#1] SMP KASAN NOPTI
>>> [   22.641795] KASAN: null-ptr-deref in range
>>> [0x00000000000000f8-0x00000000000000ff]
>>> [...]
>>> [   22.641809] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
>>>    Reference Platform, BIOS VMW201.00V.24928539.B64.2508260915 
>>> 08/26/2025
>>> [   22.641812] Workqueue: events drm_fb_helper_damage_work
>>> [   22.641824] RIP: 0010:drm_gem_lock+0x25/0x50
>>> [   22.641831] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
>>>    00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
>>>    c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 
>>> 2e 15
>>>    01 e8
>>> [...]
>>> [   22.641889] Call Trace:
>>> [   22.641891]  <TASK>
>>> [   22.641894]  drm_client_buffer_vmap_local+0x78/0x140
>>> [   22.641903]  drm_fbdev_ttm_helper_fb_dirty+0x20c/0x510 
>>> [drm_ttm_helper]
>>> [   22.641913]  ? __pfx_drm_fbdev_ttm_helper_fb_dirty+0x10/0x10 
>>> [drm_ttm_helper]
>>> [   22.641918]  ? __raw_spin_lock_irqsave+0x8c/0xf0
>>> [   22.641924]  ? __pfx___raw_spin_lock_irqsave+0x10/0x10
>>> [   22.641928]  ? __pfx_mutex_lock+0x10/0x10
>>> [   22.641936]  drm_fb_helper_fb_dirty+0x29a/0x5e0
>>> [   22.641942]  ? __pfx_drm_fb_helper_fb_dirty+0x10/0x10
>>> [...]
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: ea39f2e66e61 ("drm/client: Deprecate struct 
>>> drm_client_buffer.gem")
>>> Reported-by: Ian Forbes <ian.forbes@broadcom.com>
>>> Closes: 
>>> https://lore.kernel.org/dri-devel/CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com/
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> index 54ea1b513950..d32ce1cb579e 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> @@ -553,6 +553,9 @@ static int 
>>> vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
>>>          memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
>>>          vmw_user_object_ref(&vfbs->uo);
>>>
>>> +       if (vfbs->uo.buffer)
>>> +               vfbs->base.base.obj[0] = &vfbs->uo.buffer->tbo.base;
>>> +
>>>          *out = &vfbs->base;
>>>
>>>          ret = drm_framebuffer_init(dev, &vfbs->base.base,
>>> -- 
>>> 2.51.1
>>>
>> Thanks Thomas, that looks good. We'll have to figure out how to make
>> sure there's always a gem buffer backing those surfaces.
>
> That might not be much of a problem in practice. The commit that the 
> Fixes tag points to only streamlines some of the code around 
> drm_client_dev. But it always relied on having a GEM buffer allocated. 
> So AFAICT nothing really has changed; except that drm_client now looks 
> at the standard place for the GEM object.
>
>>
>> Would you like me to push it to drm-misc-next, or do you want to do it?
>
> I'll push it out in a bit.
>
> Best regards
> Thomas
>
>>
>> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
>>
>> z
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


