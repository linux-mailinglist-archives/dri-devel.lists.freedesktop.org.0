Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E941D9DB335
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 08:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206B810E241;
	Thu, 28 Nov 2024 07:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vjkb7Gia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JFJPflEA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vjkb7Gia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JFJPflEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE110E241
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 07:35:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1C041F44F;
 Thu, 28 Nov 2024 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732779325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bLG1RE1jpCHtMopI2vM1hTmyBzV0q1LXrRRo4l+OAI4=;
 b=Vjkb7GiabLmFcUpR7xA19tPdTfw+RjbCGaGAqF7Z6PLCaMOIoXfyywZ1d84jFrWfVcxYKK
 XIa9vqvmL3fY4ZA1ufTZ2caGLazSXY7CjMyBlIRCY4rJ253wx8OY1e34iYj/aaOYqm4OHe
 hX8RfVRetJNxD8HwP7MsiSYcT48w77g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732779325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bLG1RE1jpCHtMopI2vM1hTmyBzV0q1LXrRRo4l+OAI4=;
 b=JFJPflEA6S/po8v0qgCR0pxGjRiBCQoNomKxXOf8mUw3qzok/rQYOJGCTBXDjpjzwOMq+H
 Is0FLipqC1Zd41Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732779325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bLG1RE1jpCHtMopI2vM1hTmyBzV0q1LXrRRo4l+OAI4=;
 b=Vjkb7GiabLmFcUpR7xA19tPdTfw+RjbCGaGAqF7Z6PLCaMOIoXfyywZ1d84jFrWfVcxYKK
 XIa9vqvmL3fY4ZA1ufTZ2caGLazSXY7CjMyBlIRCY4rJ253wx8OY1e34iYj/aaOYqm4OHe
 hX8RfVRetJNxD8HwP7MsiSYcT48w77g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732779325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bLG1RE1jpCHtMopI2vM1hTmyBzV0q1LXrRRo4l+OAI4=;
 b=JFJPflEA6S/po8v0qgCR0pxGjRiBCQoNomKxXOf8mUw3qzok/rQYOJGCTBXDjpjzwOMq+H
 Is0FLipqC1Zd41Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7758F13690;
 Thu, 28 Nov 2024 07:35:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id atsuGzwdSGczFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Nov 2024 07:35:24 +0000
Message-ID: <0d5ff447-26be-487b-bac4-11c0db629010@suse.de>
Date: Thu, 28 Nov 2024 08:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/hibmc: Drop dependency on Aarch86
To: Sui Jingfeng <sui.jingfeng@linux.dev>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, kong.kongxinwei@hisilicon.com,
 sumit.semwal@linaro.org, yongqin.liu@linaro.org, jstultz@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241127133732.470414-1-tzimmermann@suse.de>
 <3f503233-394e-49de-9ad1-c6c4ff5fb085@suse.de>
 <ae294204-1521-48bd-ad05-83f64b54e784@linux.dev>
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
In-Reply-To: <ae294204-1521-48bd-ad05-83f64b54e784@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.dev,linaro.org,hisilicon.com,google.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
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


Am 27.11.24 um 19:53 schrieb Sui Jingfeng:
> Hi,
>
>
> On 2024/11/27 21:38, Thomas Zimmermann wrote:
>> s/Aarch86/AArch64
>>
>
> Or just 'arm64'.

The kernel calls it arm64. So that would make sense, I guess. I'll fix 
it before merging the patch.

>
>
>>
>> Am 27.11.24 um 14:37 schrieb Thomas Zimmermann:
>>> There exists x86-based hardware with HiSilicon BMC chipsets. This
>>> driver works well on these systems. Drop the dependency on ARM64.
>>>
>>> Tested on RH1288 V3.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Thanks.

Best regards
Thomas

>
>
>>> ---
>>>   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig 
>>> b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>>> index 80253d39664a..93b8d32e3be1 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>>> @@ -1,7 +1,7 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   config DRM_HISI_HIBMC
>>>       tristate "DRM Support for Hisilicon Hibmc"
>>> -    depends on DRM && PCI && (ARM64 || COMPILE_TEST)
>>> +    depends on DRM && PCI
>>>       depends on MMU
>>>       select DRM_CLIENT_SELECTION
>>>       select DRM_KMS_HELPER
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

