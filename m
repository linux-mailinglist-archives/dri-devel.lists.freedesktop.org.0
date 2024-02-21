Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3085D363
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 10:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29E510E4CE;
	Wed, 21 Feb 2024 09:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Zjv/klIi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUZ91t7T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zjv/klIi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JUZ91t7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238D10E4CE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 09:23:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 880B32205B;
 Wed, 21 Feb 2024 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708507399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mlwxUsar9qsnJji6/TOyKLeApaAnM6kT9bkCyRhsrDc=;
 b=Zjv/klIiePjnZh3LALfdjlerJGJdnthfdRvw2vGjI7FnePsCnCe06e+kdZVCTV1u/SPAAj
 cETOzDFWhN7o7IjHUR1+O5Xm6FXTGfc9wi2tenvSdo3z42zD0eqTw29rDc4X90nee/F0ah
 6YZ9tzOqufSt9lLhg7yhOMwvg1mmy1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708507399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mlwxUsar9qsnJji6/TOyKLeApaAnM6kT9bkCyRhsrDc=;
 b=JUZ91t7TZZ0oHeAOCysrjoYLPBPX4+ndhE9OFQ8EICLdJdD61Esxl5uNvVpM4t755wsB5I
 S277QK3wo4F2NfAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708507399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mlwxUsar9qsnJji6/TOyKLeApaAnM6kT9bkCyRhsrDc=;
 b=Zjv/klIiePjnZh3LALfdjlerJGJdnthfdRvw2vGjI7FnePsCnCe06e+kdZVCTV1u/SPAAj
 cETOzDFWhN7o7IjHUR1+O5Xm6FXTGfc9wi2tenvSdo3z42zD0eqTw29rDc4X90nee/F0ah
 6YZ9tzOqufSt9lLhg7yhOMwvg1mmy1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708507399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mlwxUsar9qsnJji6/TOyKLeApaAnM6kT9bkCyRhsrDc=;
 b=JUZ91t7TZZ0oHeAOCysrjoYLPBPX4+ndhE9OFQ8EICLdJdD61Esxl5uNvVpM4t755wsB5I
 S277QK3wo4F2NfAg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 44C5413A25;
 Wed, 21 Feb 2024 09:23:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 8BRoDwfB1WWYBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Feb 2024 09:23:19 +0000
Message-ID: <dfb06240-bd67-43fb-93d7-4fce9184fb20@suse.de>
Date: Wed, 21 Feb 2024 10:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] backlight: Replace struct fb_info in interfaces
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com,
 deller@gmx.de, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240215121326.GL9758@aspen.lan>
 <288a480c-74e9-49dd-a58d-294792771ea6@suse.de>
 <20240219150209.GB10170@google.com>
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
In-Reply-To: <20240219150209.GB10170@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linaro.org,gmail.com,gmx.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.09
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

Am 19.02.24 um 16:02 schrieb Lee Jones:
> On Thu, 15 Feb 2024, Thomas Zimmermann wrote:
>
>> Hi
>>
>> Am 15.02.24 um 13:13 schrieb Daniel Thompson:
>>> On Mon, Feb 12, 2024 at 05:16:33PM +0100, Thomas Zimmermann wrote:
>>>> Backlight drivers implement struct backlight_ops.check_fb, which
>>>> uses struct fb_info in its interface. Replace the callback with one
>>>> the does not use fb_info.
>>>>
>>>> In DRM, we have several drivers that implement backlight support. By
>>>> including <linux/backlight.h> these drivers depend on <linux/fb.h>.
>>>> At the same time, fbdev is deprecated for new drivers and likely to
>>>> be replaced on many systems.
>>>>
>>>> This patchset is part of a larger effort to implement the backlight
>>>> code without depending on fbdev.
>>>>
>>>> Patch 1 makes the backlight core match backlight and framebuffer
>>>> devices via struct fb_info.bl_dev. Patches 2 to 9 then go through
>>>> drivers and remove unnecessary implementations of check_fb. Finally,
>>>> patch 10 replaces the check_fb hook with controls_device, which
>>>> uses the framebuffer's Linux device instead of the framebuffer.
>>> I won't reply individually but I also took a look at the patches for
>>> the combo devices and it all looked good to me from a backlight
>>> point of view.
>>>
>>> However I don't want to drop Reviewed-by: on them since it risks those
>>> bit being mistaken for an ack and merged ahead of the patch 1...
>> Thanks for reviewing. Unless someone objects, my intention is to merge
>> everything via the drm-misc, so all patches should go in at once. I do have
>> a lot more patches that untangle backlight and fbdev almost completely, but
>> most of these changes are in the actual graphics drivers rather than the
>> backlight core code. So hopefully everything can go through the DRM tree; or
>> maybe the fbdev tree.
> This is only acceptable if the maintainers of those trees can provide me
> with a pull-request to a succinct (_only_ these patches) immutable
> branch.  If this is not possible, then I should like to merge the set
> through the Backlight tree and I can provide everyone else with said PR.

I see, there's a separate backlight tree.

I'm going to send another revision of this patchset. You either merge 
all of the patches via the backlight tree, or you could just merge 
patches 1, 5 and 6 for now. I'll take care to get the rest merged via 
other trees and I'll re-submoit patch 10 for a final clean up. Your choice.

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

