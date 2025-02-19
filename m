Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155AA3B33A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 09:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF6810E24E;
	Wed, 19 Feb 2025 08:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fEytPdbB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TDRvwp9j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fEytPdbB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TDRvwp9j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08C10E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 08:08:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42B4622320;
 Wed, 19 Feb 2025 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739952534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXWxnFMHJa9a8U+SQEz26XZ3j5LfQZZJq9rvFv/nYcw=;
 b=fEytPdbB7vEzobk73HzZO2QIAsu7xb9wuNWkksdZCOJs6EQWp17ICaXZxgxlHL1do3lcE6
 ZTFpQzugbMFLPe/eKGVHbjoy60lQGBxhGmU22I1HkY4dXrwNTAmjM0RhwAvE0PPrVOAYmd
 onM4b3Upsb8874P2K2/vnjsRzJyqcGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739952534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXWxnFMHJa9a8U+SQEz26XZ3j5LfQZZJq9rvFv/nYcw=;
 b=TDRvwp9jlCeS6uN5CbUeQlbXNO4Rbjt8LGgeabXDBgRB11pUqvwi0GuKFf1YvvOqk2favY
 g5eex6t86X8xLrBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fEytPdbB;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TDRvwp9j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739952534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXWxnFMHJa9a8U+SQEz26XZ3j5LfQZZJq9rvFv/nYcw=;
 b=fEytPdbB7vEzobk73HzZO2QIAsu7xb9wuNWkksdZCOJs6EQWp17ICaXZxgxlHL1do3lcE6
 ZTFpQzugbMFLPe/eKGVHbjoy60lQGBxhGmU22I1HkY4dXrwNTAmjM0RhwAvE0PPrVOAYmd
 onM4b3Upsb8874P2K2/vnjsRzJyqcGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739952534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXWxnFMHJa9a8U+SQEz26XZ3j5LfQZZJq9rvFv/nYcw=;
 b=TDRvwp9jlCeS6uN5CbUeQlbXNO4Rbjt8LGgeabXDBgRB11pUqvwi0GuKFf1YvvOqk2favY
 g5eex6t86X8xLrBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD52513806;
 Wed, 19 Feb 2025 08:08:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uHZlLJWRtWcmFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Feb 2025 08:08:53 +0000
Message-ID: <c011ec88-3b68-486b-9fda-ef18a0906c8e@suse.de>
Date: Wed, 19 Feb 2025 09:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 42B4622320
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+]
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

Am 18.02.25 um 20:32 schrieb Geert Uytterhoeven:
[...]
>> +                                args->bpp);
>> +                       fallthrough;
>> +               case 12:
>> +               case 15:
>> +               case 30: /* see drm_gem_afbc_get_bpp() */
>> +               case 10:
> Perhaps keep them sorted numerically?

The first block comes from the afbc helper; the second block from Mesa; 
hence the odd order. I'll reorder and comment each case individually.

>
>> +               case 64: /* used by Mesa */
>> +                       pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
>> +                       break;
>> +               }
>> +       }
>> +
>> +       if (!pitch || pitch > U32_MAX)
>> +               return -EINVAL;
>> +
>> +       args->pitch = pitch;
>> +
>> +       return drm_mode_align_dumb(args, pitch_align, size_align);
>> +}
>> +EXPORT_SYMBOL(drm_mode_size_dumb);
>> +
>>   int drm_mode_create_dumb(struct drm_device *dev,
>>                           struct drm_mode_create_dumb *args,
>>                           struct drm_file *file_priv)
>> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
>> new file mode 100644
>> index 000000000000..6fe36004b19d
>> --- /dev/null
>> +++ b/include/drm/drm_dumb_buffers.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef __DRM_DUMB_BUFFERS_H__
>> +#define __DRM_DUMB_BUFFERS_H__
>> +
>> +struct drm_device;
>> +struct drm_mode_create_dumb;
>> +
>> +int drm_mode_size_dumb(struct drm_device *dev,
>> +                      struct drm_mode_create_dumb *args,
>> +                      unsigned long pitch_align,
>> +                      unsigned long size_align);
>> +
>> +#endif
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index c082810c08a8..eea09103b1a6 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>>    * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>>    * @height: buffer height in pixels
>>    * @width: buffer width in pixels
>> - * @bpp: bits per pixel
>> + * @bpp: color mode
>>    * @flags: must be zero
>>    * @handle: buffer object handle
>>    * @pitch: number of bytes between two consecutive lines
>> @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
>>    *
>>    * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>>    * the kernel fills @handle, @pitch and @size.
>> + *
>> + * The value of @bpp is a color-mode number describing a specific format
>> + * or a variant thereof. The value often corresponds to the number of bits
>> + * per pixel for most modes, although there are exceptions. Each color mode
>> + * maps to a DRM format plus a number of modes with similar pixel layout.
>> + * Framebuffer layout is always linear.
>> + *
>> + * Support for all modes and formats is optional. Even if dumb-buffer
>> + * creation with a certain color mode succeeds, it is not guaranteed that
>> + * the DRM driver supports any of the related formats. Most drivers support
>> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
>> + * plane.
>> + *
>> + * +------------+------------------------+------------------------+
>> + * | Color mode | Framebuffer format     | Compatibles            |
>> + * +============+========================+========================+
>> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
>> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
>> + * |            |                        |  * DRM_FORMAT_BGRX8888 |
>> + * +------------+------------------------+------------------------+
>> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
>> + * +------------+------------------------+------------------------+
>> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
>> + * +------------+------------------------+------------------------+
>> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
>> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
>> + * |            |                        |  * DRM_FORMAT_BGRX1555 |
>> + * +------------+------------------------+------------------------+
>> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |
> + DRM_FORMAT_D8? (and 4/2/1 below)

Right, missed that.

>
> And DRM_FORMAT_Y8, if/when Tomi's series introducing that is accepted...

Sure, if it is compatible, it can also go into the third column.

Best regards
Thomas

>
>> + * +------------+------------------------+------------------------+
>> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
>> + * +------------+------------------------+------------------------+
>> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
>> + * +------------+------------------------+------------------------+
>> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
>> + * +------------+------------------------+------------------------+
>> + *
>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
>> + * legacy user space. Please don't use them in new code. Other modes
>> + * are not support.
>> + *
>> + * Do not attempt to allocate anything but linear framebuffer memory
>> + * with single-plane RGB data. Allocation of other framebuffer
>> + * layouts requires dedicated ioctls in the respective DRM driver.
>>    */
>>   struct drm_mode_create_dumb {
>>          __u32 height;
> Gr{oetje,eeting}s,
>
>                          Geert
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

