Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F29A0B050
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 08:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF6610E355;
	Mon, 13 Jan 2025 07:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UGec6fOB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOUzlPap";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UGec6fOB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOUzlPap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44810E355;
 Mon, 13 Jan 2025 07:52:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A63632116C;
 Mon, 13 Jan 2025 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736754724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ej5S2FqsrLfl2DOy4vNFP4EEenMuOKkjeg5fw8+ryy8=;
 b=UGec6fOBbSuM5/YwhFmAlt57APKx49vUpyhM2dXq1qgH2DoUQhtCvTHDVkyM651h37cY2Q
 uD4kKgyMcjO1ejhDqihQZvOXJQHXYign5PDQ9q3y7owQZu1PjY3kMxXXe+u58a/fXQOt4G
 aR9MrTbpgoH33QqMdIkoQeIltEIWK0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736754724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ej5S2FqsrLfl2DOy4vNFP4EEenMuOKkjeg5fw8+ryy8=;
 b=wOUzlPapnGL4hQxyY/3aso3HpttkWYzvxJpGlSsgxagHXECdZeo0Rlkl3bAbpwoe5tO7D/
 0F0cjrpaEuMdmxCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736754724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ej5S2FqsrLfl2DOy4vNFP4EEenMuOKkjeg5fw8+ryy8=;
 b=UGec6fOBbSuM5/YwhFmAlt57APKx49vUpyhM2dXq1qgH2DoUQhtCvTHDVkyM651h37cY2Q
 uD4kKgyMcjO1ejhDqihQZvOXJQHXYign5PDQ9q3y7owQZu1PjY3kMxXXe+u58a/fXQOt4G
 aR9MrTbpgoH33QqMdIkoQeIltEIWK0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736754724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ej5S2FqsrLfl2DOy4vNFP4EEenMuOKkjeg5fw8+ryy8=;
 b=wOUzlPapnGL4hQxyY/3aso3HpttkWYzvxJpGlSsgxagHXECdZeo0Rlkl3bAbpwoe5tO7D/
 0F0cjrpaEuMdmxCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 320C113310;
 Mon, 13 Jan 2025 07:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id myLrCiTGhGcsNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Jan 2025 07:52:04 +0000
Message-ID: <44f1170e-ad76-4dae-abae-986b5482dfc6@suse.de>
Date: Mon, 13 Jan 2025 08:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Andy Yan <andyshrk@163.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-3-tzimmermann@suse.de>
 <94f78e1.19bf.1944de709b0.Coremail.andyshrk@163.com>
 <e800ebc2-39b5-46d5-89ec-883ed1c7626b@suse.de>
 <443491d4.4087.1945dcc04e3.Coremail.andyshrk@163.com>
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
In-Reply-To: <443491d4.4087.1945dcc04e3.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[163.com]; RCPT_COUNT_TWELVE(0.00)[19];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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


Am 13.01.25 um 04:53 schrieb Andy Yan:
[...]
>> Thanks for taking a look. That NV-related code at [0] is a 'somewhat
>> non-idiomatic use' of the UAPI. The dumb-buffer interface really just
>> supports a single plane. The fix would be a new ioctl that takes a DRM
>> 4cc constant and returns a buffer handle/pitch/size for each plane. But
>> that's separate series throughout the various components.
> So is there a standard way to create buffer for NV-related format now ?

I don't know, but it doesn't look like there is. As I outlined, a new 
dumb-buffer interface seems required.

> With a quick search, I can see many user space use dumb-buffer for NV-releated
> buffer alloc:
>
> [0]https://github.com/tomba/kmsxx/blob/master/kms%2B%2B/src/pixelformats.cpp
> [1]https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_fb.c?ref_type=heads
> [2]https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-bad/sys/kms/gstkmsutils.c?ref_type=heads#L116
>
>> There's also code XRGB16161616F. This is a viable format for the UAPI,
>> but seems not very useful in practice.
>>
>>> And there are also some AFBC based format with bpp can't be handled here, see:
>>> static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
>>>                                     const struct drm_mode_fb_cmd2 *mode_cmd)
>>> {
>>>           const struct drm_format_info *info;
>>>                   
>>>           info = drm_get_format_info(dev, mode_cmd);
>>>                   
>>>           switch (info->format) {
>>>           case DRM_FORMAT_YUV420_8BIT:
>>>                   return 12;
>>>           case DRM_FORMAT_YUV420_10BIT:
>>>                   return 15;
>>>           case DRM_FORMAT_VUY101010:
>>>                   return 30;
>>>           default:
>>>                   return drm_format_info_bpp(info, 0);
>>>           }
>>> }
>> Same problem here. These YUV formats are multi-planar and there should
>> be no dumb buffers for them.
> These afbc based format are one plane, see:

Apologies. I confused them with other YUV formats.

>
> /*
>   * 1-plane YUV 4:2:0
>   * In these formats, the component ordering is specified (Y, followed by U
>   * then V), but the exact Linear layout is undefined.
>   * These formats can only be used with a non-Linear modifier.
>   */
> #define DRM_FORMAT_YUV420_8BIT  fourcc_code('Y', 'U', '0', '8')
> #define DRM_FORMAT_YUV420_10BIT fourcc_code('Y', 'U', '1', '0')
>
>> As we still have to support these all use cases, I've modified the new
>> helper to fallback to computing the pitch from the given bpp value.
>> That's what drivers currently do. Could you please apply the attached
>> patch on top of the series and report back the result of the test? You
>> should see a kernel warning about the unknown color mode, but allocation
>> should succeed.
> Yes, the attached patch works for my test case.

Thanks for testing. I'll include the changes in the patch' next iteration.

Best regards
Thomas

>
>> Best regards
>> Thomas
>>
>>>
>>> [0]https://gitlab.freedesktop.org/mesa/drm/-/blob/main/tests/modetest/buffers.c?ref_type=heads#L159
>>>
>>> This introduce a modetest failure on rockchip platform:
>>> # modetest -M rockchip -s 70@68:1920x1080 -P 32@68:1920x1080@NV30
>>> setting mode 1920x1080-60.00Hz on connectors 70, crtc 68
>>> testing 1920x1080@NV30 overlay plane 32
>>> failed to create dumb buffer: Invalid argument
>>>
>>> I think other platform with bpp can't handler by  drm_mode_legacy_fb_format will
>>> also see this kind of failure:
>>>
>>>
>>>
>>>> +	if (fourcc == DRM_FORMAT_INVALID)
>>>> +		return -EINVAL;
>>>> +	info = drm_format_info(fourcc);
>>>> +	if (!info)
>>>> +		return -EINVAL;
>>>> +	pitch = drm_format_info_min_pitch(info, 0, args->width);
>>>> +	if (!pitch || pitch > U32_MAX)
>>>> +		return -EINVAL;
>>>> +
>>>> +	args->pitch = pitch;
>>>> +
>>>> +	return drm_mode_align_dumb(args, pitch_align, size_align);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_mode_size_dumb);
>>>> +
>>>> int drm_mode_create_dumb(struct drm_device *dev,
>>>> 			 struct drm_mode_create_dumb *args,
>>>> 			 struct drm_file *file_priv)
>>>> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
>>>> new file mode 100644
>>>> index 000000000000..6fe36004b19d
>>>> --- /dev/null
>>>> +++ b/include/drm/drm_dumb_buffers.h
>>>> @@ -0,0 +1,14 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +
>>>> +#ifndef __DRM_DUMB_BUFFERS_H__
>>>> +#define __DRM_DUMB_BUFFERS_H__
>>>> +
>>>> +struct drm_device;
>>>> +struct drm_mode_create_dumb;
>>>> +
>>>> +int drm_mode_size_dumb(struct drm_device *dev,
>>>> +		       struct drm_mode_create_dumb *args,
>>>> +		       unsigned long pitch_align,
>>>> +		       unsigned long size_align);
>>>> +
>>>> +#endif
>>>> -- 
>>>> 2.47.1
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-rockchip mailing list
>>>> Linux-rockchip@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

