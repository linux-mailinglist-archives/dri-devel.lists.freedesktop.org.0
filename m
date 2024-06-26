Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6F917C51
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF5D89349;
	Wed, 26 Jun 2024 09:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XgTkwkJS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oz9F8uD8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XgTkwkJS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oz9F8uD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FDE89349
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:19:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 14F851F6E6;
 Wed, 26 Jun 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719393551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0/+6VUEWGrSM/tRYt8p7qbOQ8w8nnL4qrar8/aiT8R8=;
 b=XgTkwkJSjHYstr7fZzxqggZbN1Xets0rGhbUpb17rNSwA0mLipIqmqe1zo3HYR6XY1P/LR
 RopIeZ928ZbmDwLKUjppfUkmxeXAwVNQdWhHVJD0H2u5kvOhqPs1FCnFIdvWtwWzsixi3f
 EkbYrz7Kj2FSqM+bpGcRY4rLRX9ptF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719393551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0/+6VUEWGrSM/tRYt8p7qbOQ8w8nnL4qrar8/aiT8R8=;
 b=oz9F8uD8VjU+NJ+CZHgmGCofxEm7TnU8jFsjTvHfvDD+ew9XtuSm8C4EFbPnmyyMUNBvhD
 3sxOUXAzfiPppADA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XgTkwkJS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oz9F8uD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719393551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0/+6VUEWGrSM/tRYt8p7qbOQ8w8nnL4qrar8/aiT8R8=;
 b=XgTkwkJSjHYstr7fZzxqggZbN1Xets0rGhbUpb17rNSwA0mLipIqmqe1zo3HYR6XY1P/LR
 RopIeZ928ZbmDwLKUjppfUkmxeXAwVNQdWhHVJD0H2u5kvOhqPs1FCnFIdvWtwWzsixi3f
 EkbYrz7Kj2FSqM+bpGcRY4rLRX9ptF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719393551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0/+6VUEWGrSM/tRYt8p7qbOQ8w8nnL4qrar8/aiT8R8=;
 b=oz9F8uD8VjU+NJ+CZHgmGCofxEm7TnU8jFsjTvHfvDD+ew9XtuSm8C4EFbPnmyyMUNBvhD
 3sxOUXAzfiPppADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF6B513AAD;
 Wed, 26 Jun 2024 09:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EIJrMA7de2ZIbwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jun 2024 09:19:10 +0000
Message-ID: <d8859a60-bbb4-4139-85e2-00b4ff694a8f@suse.de>
Date: Wed, 26 Jun 2024 11:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: airlied@redhat.com, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
 <cq7xbwehvdyopndjjmxl2ekq2v7gpynxrhzh5yqkt5etao6hee@ifxdrp4gmtmb>
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
In-Reply-To: <cq7xbwehvdyopndjjmxl2ekq2v7gpynxrhzh5yqkt5etao6hee@ifxdrp4gmtmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 14F851F6E6
X-Spam-Flag: NO
X-Spam-Score: -6.50
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

Hi

Am 26.06.24 um 11:10 schrieb Dmitry Baryshkov:
> On Wed, Jun 26, 2024 at 11:01:11AM GMT, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
>>> On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
>>>> The function drm_simple_encoder_init() is a trivial helper and
>>>> deprecated. Replace it with the regular call to drm_encoder_init().
>>>> Resolves the dependency on drm_simple_kms_helper.h. No functional
>>>> changes.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>    drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
>>>>    1 file changed, 40 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>>>> index 6695af70768f..2fd9c78eab73 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -45,7 +45,6 @@
>>>>    #include <drm/drm_managed.h>
>>>>    #include <drm/drm_panic.h>
>>>>    #include <drm/drm_probe_helper.h>
>>>> -#include <drm/drm_simple_kms_helper.h>
>>>>    #include "ast_ddc.h"
>>>>    #include "ast_drv.h"
>>>> @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
>>>>    	return 0;
>>>>    }
>>>> +/*
>>>> + * VGA Encoder
>>>> + */
>>>> +
>>>> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
>>>> +	.destroy = drm_encoder_cleanup,
>>>> +};
>>>> +
>>>>    /*
>>>>     * VGA Connector
>>>>     */
>>>> @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
>>>>    	struct drm_connector *connector = &ast->output.vga.connector;
>>>>    	int ret;
>>>> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>>>> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
>>>> +			       DRM_MODE_ENCODER_DAC, NULL);
>>> What about using drmm_encoder_init() instead? It will call
>>> drm_encoder_cleanup automatically.
>> IIRC the original use case for the drmm_encoder_*() funcs was to solve
>> problems with the clean-up order if the encoder was added dynamically. The
>> hardware for ast is entirely static and ast uses drmm_mode_config_init() for
>> auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
>> like a bit of wasted resources for no gain.
> I'd say it's qui pro quo. We are wasting resources on drmm handling, but
> then keep it by dropping all drm_encoder_funcs instances.

With drm_encoder_init() there's a static-const declared struct in RO 
memory. With drmm_encoder_init(), there's a kalloc for the managed 
callback data. It's RW memory and the alloc can fail. Therefore I prefer 
drm_encoder_init() in this case.

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

