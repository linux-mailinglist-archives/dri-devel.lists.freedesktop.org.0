Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C0A72AC0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB1A10E85D;
	Thu, 27 Mar 2025 07:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sY6+7Etu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0jExAd5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sY6+7Etu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0jExAd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75E10E85D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:44:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56ACC1F395;
 Thu, 27 Mar 2025 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743061446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F5KAlevZCj/tA2hrXD8uiOlTMS5SEiExwS2cdruF7cc=;
 b=sY6+7EtuFlZ++7aFXn3Q/A7mutgrygoRoV/iAI2w3/qXM/X510jGjoSuE5H9NiuJpEBset
 fowTPECsWEiP8/j7sT2IvutK1FymoBkxaHDssKSL9bVxNwkdy2GgMg6VOjbID0Ub1tsfnF
 l+tiDxcBOXyeHe6YpqBrthqEztwP66k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743061446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F5KAlevZCj/tA2hrXD8uiOlTMS5SEiExwS2cdruF7cc=;
 b=z0jExAd5Q9S0kovIE8pmUHwLWL7TQbmAocPGetkNqT0bNsPvwilgrXhheubFmsouNoH4Df
 R90NjsBp6/Xsr5AQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sY6+7Etu;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z0jExAd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743061446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F5KAlevZCj/tA2hrXD8uiOlTMS5SEiExwS2cdruF7cc=;
 b=sY6+7EtuFlZ++7aFXn3Q/A7mutgrygoRoV/iAI2w3/qXM/X510jGjoSuE5H9NiuJpEBset
 fowTPECsWEiP8/j7sT2IvutK1FymoBkxaHDssKSL9bVxNwkdy2GgMg6VOjbID0Ub1tsfnF
 l+tiDxcBOXyeHe6YpqBrthqEztwP66k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743061446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F5KAlevZCj/tA2hrXD8uiOlTMS5SEiExwS2cdruF7cc=;
 b=z0jExAd5Q9S0kovIE8pmUHwLWL7TQbmAocPGetkNqT0bNsPvwilgrXhheubFmsouNoH4Df
 R90NjsBp6/Xsr5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 306041376E;
 Thu, 27 Mar 2025 07:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c/JFCsYB5WcTYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Mar 2025 07:44:06 +0000
Message-ID: <b9a9cf64-154d-4efd-8cf8-a3e39fe55a21@suse.de>
Date: Thu, 27 Mar 2025 08:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/cirrus-qemu: Use framebuffer format as-is, drop
 adjustments
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@redhat.com, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250325171716.154097-1-tzimmermann@suse.de>
 <20250325171716.154097-4-tzimmermann@suse.de>
 <hujnqeg74eoiz4lj46xhetdpytfgndg4iegwpszqf3ztjzuw6o@tis4zsp7slc3>
 <98df4fc3-019f-4feb-a49e-987a97e36c95@suse.de>
 <iks6ntl56uyo2cx3k4trgeu5z6ilxe6leaoexi7azd4woutefa@yct7554fra2i>
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
In-Reply-To: <iks6ntl56uyo2cx3k4trgeu5z6ilxe6leaoexi7azd4woutefa@yct7554fra2i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 56ACC1F395
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 26.03.25 um 14:04 schrieb Gerd Hoffmann:
> On Wed, Mar 26, 2025 at 01:30:13PM +0100, Thomas Zimmermann wrote:
>> Hi,
>>
>> first of all, what about the other patches?
>>
>> - Patch 1 is a bugfix.
>> - Patch 4 depends on this one.
>> - Patch 2 should be given consideration.
> Looks reasonable to me.  Don't feel like giving a reviewed-by due to not
> following drm development very closely any more, so
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>
>>> Second, because there is no way to communicate the hardware constrains
>>> of the cirrus.  userspace can query the formats, and userspace can query
>>> the resolutions, but there is no way to tell userspace that not all
>>> combinations are valid and that you have to go for the DRM_FORMAT_RGB565
>>> format if you want higher resolutions.
>> The viable strategy for user space is to allocate a variety of different
>> configs and check them one by one, thus filtering out the ones that work.
> Last time I checked (which has been a few years) alot of existing
> software didn't do that.  Maybe that changed with atomic becoming
> more mature though.
>
>>> Essentially the format conversations allows the driver to hide the
>>> oddities of the prehistoric hardware from userspace, so things are
>>> more smooth when running wayland on the cirrus.
>> I'm aware of the situation. We've had similar discussions about other
>> low-end hardware, but generally went with the hardware limits.
>>
>> Please note that there is a trade-off here: the effect of this series is
>> that the maximum resolution will be limited to 800x600.
> Ah, ok, this is how you deal with the problem, go with the max
> resolution the cirrus can support at 32 bpp.
>
> Could be more explicit in the commit message, especially the 800x600
> limit, there is a high chance people search for that when their display
> resolution changes after a kernel update.
>
>> If user space would appropriately validate atomic states, lower bpp
>> could still support higher resolutions. But converting color formats
>> on the fly isn't free. I recently did some simple measurements in a
>> different context and converting from 32 bpp to 16 bpp took 3 times as
>> long as memcpy'ing the raw pixels.
> Ouch.  That is alot.
>
>>> PS: https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
>>> still applies of course.
>> It's been 10 years since you wrote that. So maybe it's time to re-consider
>> cirrus' exceptions and just go for a 'dumb implementation'. Anyone can
>> easily switch to better alternatives.
> Fair enough.
>
> With an improved commit message:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks for reconsidering. I'll send out an updated series with an 
expanded commit message.

Best regards
Thomas

>
> take care,
>    Gerd
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

