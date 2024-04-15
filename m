Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CCC8A4893
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8911221B;
	Mon, 15 Apr 2024 06:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="W57Qlb4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJoyKw+k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W57Qlb4L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mJoyKw+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D2311221B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 06:59:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D68934A45;
 Mon, 15 Apr 2024 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713164390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NMP0mHn68SJwonTba0/3fUA3+732vI0M0+NXCMYPSYA=;
 b=W57Qlb4LxNBgl/Nn5Xngz6wB0TyfoSEGbUOQH1ALMauT4HZkdaIzlNOApsvGbhyyhgq12E
 bJs7TMDQk4MyDt828Ah/gr0GiZ1CMYYIuJZAjGS2Lwum7bQRSTfuIF2kLZEuyfPadOIUAQ
 uXEjkixaimKv82JZKtoR2VExLe2P5kY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713164390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NMP0mHn68SJwonTba0/3fUA3+732vI0M0+NXCMYPSYA=;
 b=mJoyKw+kBW7vGnjmSzeU1MK52hnWIVjiaAVqd3rccBF3T44/y2A7iyc/lH5s/W0lx1rmkG
 Y//StwTcaL6KbhBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W57Qlb4L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mJoyKw+k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713164390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NMP0mHn68SJwonTba0/3fUA3+732vI0M0+NXCMYPSYA=;
 b=W57Qlb4LxNBgl/Nn5Xngz6wB0TyfoSEGbUOQH1ALMauT4HZkdaIzlNOApsvGbhyyhgq12E
 bJs7TMDQk4MyDt828Ah/gr0GiZ1CMYYIuJZAjGS2Lwum7bQRSTfuIF2kLZEuyfPadOIUAQ
 uXEjkixaimKv82JZKtoR2VExLe2P5kY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713164390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NMP0mHn68SJwonTba0/3fUA3+732vI0M0+NXCMYPSYA=;
 b=mJoyKw+kBW7vGnjmSzeU1MK52hnWIVjiaAVqd3rccBF3T44/y2A7iyc/lH5s/W0lx1rmkG
 Y//StwTcaL6KbhBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC1F81368B;
 Mon, 15 Apr 2024 06:59:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id A2EFOGXQHGZzCAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Apr 2024 06:59:49 +0000
Message-ID: <65d0f3f4-24be-453e-89cc-502609357a8d@suse.de>
Date: Mon, 15 Apr 2024 08:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/43] drm/renesas/rcar-du: Use fbdev-dma
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-29-tzimmermann@suse.de>
 <20240412185724.GL31122@pendragon.ideasonboard.com>
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
In-Reply-To: <20240412185724.GL31122@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.00 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 FREEMAIL_CC(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,ideasonboard.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[8]; TAGGED_RCPT(0.00)[renesas];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2D68934A45
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.00
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

Am 12.04.24 um 20:57 schrieb Laurent Pinchart:
> Hi Thomas,
>
> Thank you for the patch.
>
> On Wed, Apr 10, 2024 at 03:02:24PM +0200, Thomas Zimmermann wrote:
>> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
>> damage handling, which is required by rcar-du. Avoids the overhead of
>> fbdev-generic's additional shadow buffering. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> On a side note, I noticed that drm_fbdev_generic_client_funcs and
> drm_fbdev_dma_client_funcs point to functions that are identical. Would
> there be a way to avoid the code duplication ?

I avoided this so far as I don't want to accidentally de-duplicate 
functions that later turn out to not be identical. But it is on the TODO 
list.

Best regards
Thomas

>
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>> index dee530e4c8b27..fb719d9aff10d 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
>> @@ -20,7 +20,7 @@
>>   
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>> -#include <drm/drm_fbdev_generic.h>
>> +#include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -716,7 +716,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>>   
>>   	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>>   
>> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
>> +	drm_fbdev_dma_setup(&rcdu->ddev, 32);
>>   
>>   	return 0;
>>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

