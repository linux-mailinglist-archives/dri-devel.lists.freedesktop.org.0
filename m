Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B272AE1B10
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 14:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B4C10E21F;
	Fri, 20 Jun 2025 12:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CleL97Th";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y0GaulEY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CleL97Th";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y0GaulEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1891110E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 12:36:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C105121277;
 Fri, 20 Jun 2025 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750422999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wcmVPTi7vIOdf5AAsoKPtXfw88H0bsohljGtlEtiO1o=;
 b=CleL97ThuipPTMPBDuxUj3+mT916TVvreBhnza44yx4kymZoTsyS79mgwTFNC81rzZAGBe
 uml8lR+3MJf16T30sSWmFCppHWQbDwr+hOVVP32anOJ6nmycN8F2+p5mHpDcd907AIPHvZ
 RZyWcgxlQCciK5qNyzfMjk9EgjLojbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750422999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wcmVPTi7vIOdf5AAsoKPtXfw88H0bsohljGtlEtiO1o=;
 b=Y0GaulEYaYocQ2z56h/sbNkeVGZmx+PdCAEmT2eyuAZpfSWaS/jqWSdq9j6vwkt6JAn9aI
 /4YQgs26LjOEoyBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750422999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wcmVPTi7vIOdf5AAsoKPtXfw88H0bsohljGtlEtiO1o=;
 b=CleL97ThuipPTMPBDuxUj3+mT916TVvreBhnza44yx4kymZoTsyS79mgwTFNC81rzZAGBe
 uml8lR+3MJf16T30sSWmFCppHWQbDwr+hOVVP32anOJ6nmycN8F2+p5mHpDcd907AIPHvZ
 RZyWcgxlQCciK5qNyzfMjk9EgjLojbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750422999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wcmVPTi7vIOdf5AAsoKPtXfw88H0bsohljGtlEtiO1o=;
 b=Y0GaulEYaYocQ2z56h/sbNkeVGZmx+PdCAEmT2eyuAZpfSWaS/jqWSdq9j6vwkt6JAn9aI
 /4YQgs26LjOEoyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C675136BA;
 Fri, 20 Jun 2025 12:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pCmIFNdVVWizKgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 20 Jun 2025 12:36:39 +0000
Message-ID: <8874b905-dd1a-4bcc-9572-edcf5451f400@suse.de>
Date: Fri, 20 Jun 2025 14:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
 <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
 <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
 <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
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
In-Reply-To: <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[fairphone.com,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,gmx.de];
 TAGGED_RCPT(0.00)[dt]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[15]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 20.06.25 um 14:07 schrieb Luca Weiss:
> On Fri Jun 20, 2025 at 1:28 PM CEST, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 20.06.25 um 13:07 schrieb Luca Weiss:
>>> Hi Thomas,
>>>
>>> On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>>>>> Some devices might require keeping an interconnect path alive so that
>>>>> the framebuffer continues working. Add support for that by setting the
>>>>> bandwidth requirements appropriately for all provided interconnect
>>>>> paths.
>>>>>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>     drivers/video/fbdev/simplefb.c | 83 ++++++++++++++++++++++++++++++++++++++++++
>>>>>     1 file changed, 83 insertions(+)
>>>>>
>>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>>>>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e84db80f7f9b743d074 100644
>>>>> --- a/drivers/video/fbdev/simplefb.c
>>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>>> @@ -27,6 +27,7 @@
>>>>>     #include <linux/parser.h>
>>>>>     #include <linux/pm_domain.h>
>>>>>     #include <linux/regulator/consumer.h>
>>>>> +#include <linux/interconnect.h>
>>>> With alphabetical sorting:
>>>>
>>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Thanks for the reviews!
>>>
>>> For both simpledrm.c and simplefb.c, the includes are not strictly
>>> alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall I
>>> just try and slot it into the best fitting place, or make them sorted in
>>> my patch? Or I can add a separate commit for each driver before to sort
>>> them.
>>>
>>> Let me know!
>> Best is to try to fit it into the <linux/*> block. In simpledrm, it's
>> probably my mistake. Don't bother with sending an extra cleanup if you
>> don't want to.
> I was mostly asking whether this diff is okay as part of my patch (for
> just adding <linux/interconnect.h>)
>
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index be95fcddce4c..f2efa4b51401 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -13,18 +13,19 @@
>    */
>   
>   #include <linux/aperture.h>
> +#include <linux/clk.h>
>   #include <linux/errno.h>
>   #include <linux/fb.h>
> +#include <linux/interconnect.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> -#include <linux/platform_data/simplefb.h>
> -#include <linux/platform_device.h>
> -#include <linux/clk.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_clk.h>
>   #include <linux/of_platform.h>
>   #include <linux/parser.h>
> +#include <linux/platform_data/simplefb.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/regulator/consumer.h>
>   
>
> Or if you want this churn to be a separate commit. Either way is fine
> with me, just trying to figure out the preferences of this subsystem :)

If you want to resort the entries, please do so in a separate patch.

Best regards
Thomas

>
> Regards
> Luca
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

