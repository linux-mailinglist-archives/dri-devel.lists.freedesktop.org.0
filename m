Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B5C859FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 16:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BB410E2A6;
	Tue, 25 Nov 2025 15:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MeMLYvOI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HZ9HoaGr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CZCopwUT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cJtVhDSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2610E438
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 15:03:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB6CC5BD95;
 Tue, 25 Nov 2025 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764083030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t6c0JIr3JV24agNEYsU6GeNEwCMn9HHhKrcfhB/PVC4=;
 b=MeMLYvOIQm0PQWfD3UBO9QnmQNH6vWaQ7hqx/Wt7eIge3bCkBq3fyTNKB1FMEYmW5/G9/J
 UU730ytQ756s0UWVHqMa3vCOYcvtp5B2dhbquMtNcnpLg80cNx5E91Pf9TqjCgsr0epa2G
 +BOGQnMJ8Q4g59SQ+WmHgzml1L6p5Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764083030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t6c0JIr3JV24agNEYsU6GeNEwCMn9HHhKrcfhB/PVC4=;
 b=HZ9HoaGrQMuKtj6drZ7EoukRoNuUO4l2erKX3BLnChSz0rBzze1RXd5Yuom8T0bdDCieMn
 cqhpDfNxHL/8CaAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CZCopwUT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cJtVhDSR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764083027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t6c0JIr3JV24agNEYsU6GeNEwCMn9HHhKrcfhB/PVC4=;
 b=CZCopwUTcY+A/L7rZ7hx6PUAoVzxsQaz6VKywNSdqiIVG+9Hmen0N5mgb+Xpt16ZWJLBwL
 d6sRWjuJdHj5/RJkAarOMFPW7/CsqlWHeJEZvX1zk6W/2dOrRRvrgj2EqC1Vq08eBWPtdh
 kuimNUmnISiMDhyrmmTZWp1VsUu/ONE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764083027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t6c0JIr3JV24agNEYsU6GeNEwCMn9HHhKrcfhB/PVC4=;
 b=cJtVhDSRR+o9VWz6Yazw2qpbBdRDJ0H8iUig4wpW+NdNmNvUjP02PtwdGzrWA6t7d419+a
 uJb59PIuV23OjwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E19F3EA63;
 Tue, 25 Nov 2025 15:03:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id STfTCVPFJWmMCQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 15:03:47 +0000
Message-ID: <a11c195d-197c-45a4-962a-e2336c7360c2@suse.de>
Date: Tue, 25 Nov 2025 16:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Ludovic.Desroches@microchip.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-4-tzimmermann@suse.de>
 <52600bf4-2c1c-49a6-82c5-b31818141a43@microchip.com>
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
In-Reply-To: <52600bf4-2c1c-49a6-82c5-b31818141a43@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CB6CC5BD95
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[microchip.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[21];
 TO_DN_NONE(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.com:url, suse.de:email, suse.de:mid,
 suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Am 25.11.25 um 15:39 schrieb Ludovic.Desroches@microchip.com:
> On 8/21/25 10:17, Thomas Zimmermann wrote:
>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
>> buffer size. Align the pitch to a multiple of 8.

I missed a chance to explain it here. :/

>>
>> Push the current calculation into the only direct caller imx. Imx's
>> hardware requires the framebuffer width to be aligned to 8. The
>> driver's current approach is actually incorrect, as it only guarantees
>> this implicitly and requires bpp to be a multiple of 8 already. A
>> later commit will fix this problem by aligning the scanline pitch
>> such that an aligned width still fits into each scanline's memory.
>>
>> A number of other drivers are build on top of gem-dma helpers and
>> implement their own dumb-buffer allocation. These drivers invoke
>> drm_gem_dma_dumb_create_internal(), which is not affected by this
>> commit.
>>
>> v5:
>> - avoid reset of arguments (Tomi)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>    drivers/gpu/drm/drm_gem_dma_helper.c     | 7 +++++--
>>    drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 4 +++-
>>    2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
>> index 4f0320df858f..ab1a70b1d6f1 100644
>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
>> @@ -20,6 +20,7 @@
>>    #include <drm/drm.h>
>>    #include <drm/drm_device.h>
>>    #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>>    #include <drm/drm_gem_dma_helper.h>
>>    #include <drm/drm_vma_manager.h>
>>    
>> @@ -304,9 +305,11 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
>>    			    struct drm_mode_create_dumb *args)
>>    {
>>    	struct drm_gem_dma_object *dma_obj;
>> +	int ret;
>>    
>> -	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>> -	args->size = args->pitch * args->height;
>> +	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
>> +	if (ret)
>> +		return ret;
> Hi,
>
> Was it intentional for this change to alter the pitch?

Most hardware does not need the pitch to be of a certain alignment. But 
these buffers are possibly shared with other hardware, which sometimes 
needs alignment to certain values. Using SZ_8 improves compatible with 
that hardware.

>
> The alignment requirement has been updated—from 8-bit alignment to
> 64-bit alignment. Since the pitch is expressed in bytes, we should pass
> SZ_1 instead of SZ_8 for hw_patch_align.
>
> For example, for an 850×480 framebuffer at 16 bpp, the pitch should be
> 1700 bytes. With the new alignment, the pitch becomes 1704 bytes.

Many display modes have an 8-byte alignment in their width. 850 pixels 
is somewhat of an exception.

>
> Please let me know if you’d like me to submit a fix.

Do you see a bug with your hardware? Unless this creates a real problem, 
I'd like to keep it as it is now.

Best regards
Thomas

>
> Regards,
> Ludovic
>
>
>>    
>>    	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
>>    						 &args->handle);
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> index ec5fd9a01f1e..af4a30311e18 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> @@ -145,8 +145,10 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
>>    	int ret;
>>    
>>    	args->width = ALIGN(width, 8);
>> +	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>> +	args->size = args->pitch * args->height;
>>    
>> -	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
>> +	ret = drm_gem_dma_dumb_create_internal(file_priv, drm, args);
>>    	if (ret)
>>    		return ret;
>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


