Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D758A11F49
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8C310E3D0;
	Wed, 15 Jan 2025 10:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Mljgl0Dv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qI2Y6oN0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mljgl0Dv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qI2Y6oN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796710E5BC;
 Wed, 15 Jan 2025 10:26:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A60921285;
 Wed, 15 Jan 2025 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736936763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o5OaTSBvndaqL7pmKVkJ0tKcrkXR4wXg7zZA1xwdifc=;
 b=Mljgl0DvQXsyKMdMzmz5ZwZ3V789zCdVdhgaCjuMtwHrT61J2CLPcsqyigpgNfMgt5s9ED
 NQBLa2bFnxQBC6Lh8kmGl4ElL6IbxkHaMKnpSDKgAWvZ5RgKmpAEVOTkk2jS/7Dqz07SiL
 vCLaFHZP1mmjRXmvQ/ScFe4UhJimBB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736936763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o5OaTSBvndaqL7pmKVkJ0tKcrkXR4wXg7zZA1xwdifc=;
 b=qI2Y6oN0l9JxGfh+RN+mqlivvJYcBaYsV/e1PTdXmK0ZMZeCqm75AAiZVcbCx5W/dssHYm
 9npljUHucuH2iADw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736936763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o5OaTSBvndaqL7pmKVkJ0tKcrkXR4wXg7zZA1xwdifc=;
 b=Mljgl0DvQXsyKMdMzmz5ZwZ3V789zCdVdhgaCjuMtwHrT61J2CLPcsqyigpgNfMgt5s9ED
 NQBLa2bFnxQBC6Lh8kmGl4ElL6IbxkHaMKnpSDKgAWvZ5RgKmpAEVOTkk2jS/7Dqz07SiL
 vCLaFHZP1mmjRXmvQ/ScFe4UhJimBB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736936763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o5OaTSBvndaqL7pmKVkJ0tKcrkXR4wXg7zZA1xwdifc=;
 b=qI2Y6oN0l9JxGfh+RN+mqlivvJYcBaYsV/e1PTdXmK0ZMZeCqm75AAiZVcbCx5W/dssHYm
 9npljUHucuH2iADw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2519139CB;
 Wed, 15 Jan 2025 10:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yds5KjqNh2dqKAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jan 2025 10:26:02 +0000
Message-ID: <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
Date: Wed, 15 Jan 2025 11:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
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
In-Reply-To: <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[20]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
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


Am 15.01.25 um 11:13 schrieb Tomi Valkeinen:
> Hi!
>
> On 09/01/2025 16:57, Thomas Zimmermann wrote:
>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
>> buffer size. Align the pitch according to hardware requirements.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c 
>> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> index b47463473472..7ea0cd4f71d3 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> @@ -19,6 +19,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>>   #include <drm/drm_encoder.h>
>>   #include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct 
>> drm_file *file_priv,
>>                       struct drm_mode_create_dumb *args)
>>   {
>>       struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
>> -    unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>> +    int ret;
>>         /* Enforce the alignment constraints of the DMA engine. */
>> -    args->pitch = ALIGN(pitch, dpsub->dma_align);
>> +    ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
>> +    if (ret)
>> +        return ret;
>>         return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
>>   }
>
> I have some trouble with this one.
>
> I have sent a series to add some pixel formats:
>
> https://lore.kernel.org/all/20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com/ 
>
>
> Let's look at XV15. It's similar to NV12, but 10 bits per component, 
> and some packing and padding.
>
> First plane: 3 pixels in a 32 bit group
> Second plane: 3 pixels in a 64 bit group, 2x2 subsampled
>
> So, on average, a pixel on the first plane takes 32 / 3 = 10.666... 
> bits on a line. That's not a usable number for the 
> DRM_IOCTL_MODE_CREATE_DUMB ioctl.
>
> What I did was to use the pixel group size as "bpp" for 
> DRM_IOCTL_MODE_CREATE_DUMB. So, e.g., for 720 x 576:
>
> Stride for first plane: 720 * (32 / 3) / 8 = 960 bytes
> Stride for second plane: 720 / 2 * (64 / 3) / 8 = 960 bytes
>
> First plane: 720 / 3 = 240 pixel groups
> Second plane: 720 / 2 / 3 = 120 pixel groups
>
> So I allocated the two planes with:
> 240 x 576 with 32 bitspp
> 120 x 288 with 64 bitspp
>
> This worked, and if I look at the DRM_IOCTL_MODE_CREATE_DUMB in the 
> docs, I can't right away see anything there that says my tactic was 
> not allowed.
>
> The above doesn't work anymore with this patch, as the code calls 
> drm_driver_color_mode_format(), which fails for 64 bitspp. It feels a 
> bit odd that DRM_IOCTL_MODE_CREATE_DUMB will try to guess the RGB 
> fourcc for a dumb buffer allocation.
>
> So, what to do here? Am I doing something silly? What's the correct 
> way to allocate the buffers for XV15? Should I just use 32 bitspp for 
> the plane 2 too, and double the width (this works)?
>
> Is DRM_IOCTL_MODE_CREATE_DUMB only meant for simple RGB formats? The 
> xilinx driver can, of course, just not use drm_mode_size_dumb(). But 
> if so, I guess the limitations of drm_mode_size_dumb() should be 
> documented.
>
> Do we need a new dumb-alloc ioctl that takes the format and plane 
> number as parameters? Or alternatively a simpler dumb-alloc that 
> doesn't have width and bpp, but instead takes a stride and height as 
> parameters? I think those would be easier for the userspace to use, 
> instead of trying to adjust the parameters to be suitable for the kernel.

These are all good points. Did you read my discussion with Andy on patch 
2? I think it resolves all the points you have. The current CREATE_DUMB 
ioctl is unsuited for anything but the simple RGB formats. The bpp 
parameter is not very precise. The solution would be a new ioctl call 
that receives the DRM format and returns a buffer for each individual plane.

I provided a workaround patch that uses the bpp value directly if 
drm_driver_color_mode_format() does not support the bpp value. 
User-space code has to allocate a large enough buffer via the current 
CREATE_DUMB and compute the individual planes itself. See [1] for an 
example. [1] 
https://gitlab.freedesktop.org/mesa/drm/-/blob/main/tests/modetest/buffers.c?ref_type=heads#L302 
Does this work for you? Otherwise, I guess we should be talking about a 
possible CREATE_DUMB2 that fixes these shortcomings. Best regards Thomas
>
>  Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

