Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC991BCEC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C943210EC15;
	Fri, 28 Jun 2024 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AbxrbH7a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WgcP9xHw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbxrbH7a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WgcP9xHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39A10E29F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:59:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EEC31F44F;
 Fri, 28 Jun 2024 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719572348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=38Y8eVOjnbg68cwDqPhTRv0eNk/Wv7VFA4l168Mor4Q=;
 b=AbxrbH7aQEms6Je3/yH4M4nY9qb9ORj7twriIxoFLzDvICz1HtEwS2J1v9IPmwxs1B3g3B
 u0E9rw2OH0dZPo0Tks+HEHKDA7xW4P+7VbtfggxRldyf3VXyqvNjwzutNj9VY6qK67l3bJ
 HRx40EXH7xcH2RjeMyi9ObRmzj9DzLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719572348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=38Y8eVOjnbg68cwDqPhTRv0eNk/Wv7VFA4l168Mor4Q=;
 b=WgcP9xHw84vuzbqxwG2odonBov6o2HFzHfJ1hGVcCsj9u9OiAT9uOLlKa8qK/FZz0i0cXy
 PAokAPUeZ8VjQNBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AbxrbH7a;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WgcP9xHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719572348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=38Y8eVOjnbg68cwDqPhTRv0eNk/Wv7VFA4l168Mor4Q=;
 b=AbxrbH7aQEms6Je3/yH4M4nY9qb9ORj7twriIxoFLzDvICz1HtEwS2J1v9IPmwxs1B3g3B
 u0E9rw2OH0dZPo0Tks+HEHKDA7xW4P+7VbtfggxRldyf3VXyqvNjwzutNj9VY6qK67l3bJ
 HRx40EXH7xcH2RjeMyi9ObRmzj9DzLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719572348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=38Y8eVOjnbg68cwDqPhTRv0eNk/Wv7VFA4l168Mor4Q=;
 b=WgcP9xHw84vuzbqxwG2odonBov6o2HFzHfJ1hGVcCsj9u9OiAT9uOLlKa8qK/FZz0i0cXy
 PAokAPUeZ8VjQNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05D911373E;
 Fri, 28 Jun 2024 10:59:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aqQJAHyXfmYvUAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jun 2024 10:59:08 +0000
Message-ID: <872cdcb3-8e4d-42b5-bde2-6d0a4cd8004f@suse.de>
Date: Fri, 28 Jun 2024 12:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
 <ZnxXGKXbVHUyXB3u@phenom.ffwll.local> <Zn0Y-L8i_8V-F92H@phenom.ffwll.local>
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
In-Reply-To: <Zn0Y-L8i_8V-F92H@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3EEC31F44F
X-Spam-Score: -4.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[linaro.org,redhat.com,linux.intel.com,kernel.org,gmail.com,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email, suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 27.06.24 um 09:47 schrieb Daniel Vetter:
> On Wed, Jun 26, 2024 at 07:59:52PM +0200, Daniel Vetter wrote:
>> On Wed, Jun 26, 2024 at 11:01:11AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
>>>> On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
>>>>> The function drm_simple_encoder_init() is a trivial helper and
>>>>> deprecated. Replace it with the regular call to drm_encoder_init().
>>>>> Resolves the dependency on drm_simple_kms_helper.h. No functional
>>>>> changes.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>    drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
>>>>>    1 file changed, 40 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>>>>> index 6695af70768f..2fd9c78eab73 100644
>>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>>> @@ -45,7 +45,6 @@
>>>>>    #include <drm/drm_managed.h>
>>>>>    #include <drm/drm_panic.h>
>>>>>    #include <drm/drm_probe_helper.h>
>>>>> -#include <drm/drm_simple_kms_helper.h>
>>>>>    #include "ast_ddc.h"
>>>>>    #include "ast_drv.h"
>>>>> @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
>>>>>    	return 0;
>>>>>    }
>>>>> +/*
>>>>> + * VGA Encoder
>>>>> + */
>>>>> +
>>>>> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
>>>>> +	.destroy = drm_encoder_cleanup,
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * VGA Connector
>>>>>     */
>>>>> @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
>>>>>    	struct drm_connector *connector = &ast->output.vga.connector;
>>>>>    	int ret;
>>>>> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
>>>>> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
>>>>> +			       DRM_MODE_ENCODER_DAC, NULL);
>>>> What about using drmm_encoder_init() instead? It will call
>>>> drm_encoder_cleanup automatically.
>>> IIRC the original use case for the drmm_encoder_*() funcs was to solve
>>> problems with the clean-up order if the encoder was added dynamically. The
>>> hardware for ast is entirely static and ast uses drmm_mode_config_init() for
>>> auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
>>> like a bit of wasted resources for no gain.
>> The idea of drmm_ is that you use them all. That the managed version of
>> drm_mode_config_init also happens to still work with the unmanaged
>> encoder/connector/crtc/plane cleanup is just to facilitate gradual
>> conversions.
>>
>> And see my other reply, for drmm_encoder_init supporting the NULL funcs
>> case actually makes full sense.
>>
>> Also, any driver can be hotunbound through sysfs, no hotunplug of the hw
>> needed at all.
> I pondered this some more, I think we could embed the drmm tracking
> structure into struct drm_encoder (and anywhere else we need one), which
>
> - would mean a lot of the drmm_ versions again get a void return value,
>    like their non-managed counterparts.
>
> - we could truly roll out drmm_ versions everywhere and deprecate the
>    unmanaged ones in a lot more cases, since drivers like ast could then
>    also use it.
>
> I'm not sure this is a bright idea at scale, since devm_ doesn't do it
> afaik. But maybe we should just try.
>
> Thoughts?

I cannot say whether it's a good idea. At least it's sounds better then 
kcalloc-ing drm_res for each object. The drm_res instance could directly 
into struct drm_mode_object, so it's available for all the relevant 
stages of the modesetting pipeline.

Best regards
Thomas

>
> Cheers, Sima

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

