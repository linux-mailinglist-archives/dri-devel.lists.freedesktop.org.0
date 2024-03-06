Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDE7873AB3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE351132AD;
	Wed,  6 Mar 2024 15:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Own9pRjq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c/78wxCO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Own9pRjq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c/78wxCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1391132AD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 15:33:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 531F46BA0D;
 Wed,  6 Mar 2024 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709739182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJDMTjbnu33E0L7KdIhD0GcQLjhYKTg+Q7LtwmV6NQ0=;
 b=Own9pRjqeo5aB8eYdx15qTmVNcw9D2Uw0yUeUOvJ7nClEUjqIG/Fvp9RMARFfI5HYI+DUs
 uOw58Tgz7ocChRMxtwYoruAqV9Z26Y9RlrpZhg0GUMlWd/idwjnnUE/4pLF7i5fJPTy7ZZ
 FcZ+eCj3iq6g8IEnHeaS97hkouCcp0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709739182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJDMTjbnu33E0L7KdIhD0GcQLjhYKTg+Q7LtwmV6NQ0=;
 b=c/78wxCOc1LhL73CoNUsRV4A7xhUIj6v0Utm3M61MpzkqhTetGWDimePbEK0IZDgBJ6Zm3
 JhQe7rxYMacl1mCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709739182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJDMTjbnu33E0L7KdIhD0GcQLjhYKTg+Q7LtwmV6NQ0=;
 b=Own9pRjqeo5aB8eYdx15qTmVNcw9D2Uw0yUeUOvJ7nClEUjqIG/Fvp9RMARFfI5HYI+DUs
 uOw58Tgz7ocChRMxtwYoruAqV9Z26Y9RlrpZhg0GUMlWd/idwjnnUE/4pLF7i5fJPTy7ZZ
 FcZ+eCj3iq6g8IEnHeaS97hkouCcp0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709739182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJDMTjbnu33E0L7KdIhD0GcQLjhYKTg+Q7LtwmV6NQ0=;
 b=c/78wxCOc1LhL73CoNUsRV4A7xhUIj6v0Utm3M61MpzkqhTetGWDimePbEK0IZDgBJ6Zm3
 JhQe7rxYMacl1mCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E468413A79;
 Wed,  6 Mar 2024 15:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 6FUONa2M6GXtegAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 15:33:01 +0000
Message-ID: <313c3730-10dd-42aa-8bd0-9f0a8627c1bb@suse.de>
Date: Wed, 6 Mar 2024 16:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
 <CAD=FV=VSFEFPzFhvMKwc7D3NBgnDq9qRp6eN1stSuhBCi_HoMQ@mail.gmail.com>
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
In-Reply-To: <CAD=FV=VSFEFPzFhvMKwc7D3NBgnDq9qRp6eN1stSuhBCi_HoMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Own9pRjq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="c/78wxCO"
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,chromium.org,redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org,igalia.com,poorly.run,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 531F46BA0D
X-Spam-Level: 
X-Spam-Score: -3.30
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

Am 06.03.24 um 16:05 schrieb Doug Anderson:
> Hi,
>
> On Wed, Mar 6, 2024 at 4:07 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi,
>>
>> sorry that I did not see the patch before.
>>
>> Am 27.02.24 um 23:19 schrieb Douglas Anderson:
>>> Even though the UDL driver converts to RGB565 internally (see
>>> pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
>>> compatibility. Let's add ARGB8888 to that list.
>> We had a heated discussion about the emulation of color formats. It was
>> decided that XRGB8888 is the only format to support; and that's only
>> because legacy userspace sometimes expects it. Adding other formats to
>> the list should not be done easily.
> Sorry! I wasn't aware of the previous discussion and nobody had
> brought it up till now. As discussed on #dri-devel IRC, I've posted a
> revert:
>
> https://lore.kernel.org/r/20240306063721.1.I4a32475190334e1fa4eef4700ecd2787a43c94b5@changeid
>
>
>>> This makes UDL devices work on ChromeOS again after commit
>>> c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
>>> commit things were "working" because we'd silently treat the ARGB8888
>>> that ChromeOS wanted as XRGB8888.
>> This problem has been caused by userspace. Why can it not be fixed there?
> I guess the one argument I could make is that the kernel isn't
> supposed to break userspace. Before the extra format validation patch,
> AKA commit c91acda3a380 ("drm/gem: Check for valid formats"),
> userspace worked. Now it doesn't.
>
> That being said, one can certainly argue that userspace was working in
> the past simply due to relying on a bug. ...and in such a case fixing
> the bug in userspace is preferred.
>
> I don't personally know _how_ to fix userspace but it feels like it
> should be possible.
>
>
>> And udl is just one driver. Any other driver without ARGB8888, such as
>> simpledrm or ofdrm, would be affected. Do these work?
> It's the ChromeOS compositor. I can totally believe that those drivers
> don't work. In this case, though, those drivers aren't needed by a USB
> peripheral that someone might plug in. ;-)

If you can fix to problem in the compositor, that would be the correct 
solution. If it's really not possible, we'd have to figure out something 
else.

We supported various combinations of source and destination formats in 
the kernel. But that results in state explosion at some point. And we 
wanted to move conversion code to userspace where possible. So only 
XRGB8888 was allowed, as it's sometimes necessary to support legacy 
userspace. (Ironically, one could make that argument for ARGB and the 
ChromeOS compositor. :) We even have code that works around incorrect 
ARGB reported by hardware or firmware, so that userspace absolutely does 
not see ARGB for the primary planes of simpledrm/ofdrm. [1]

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.7/source/drivers/gpu/drm/drm_format_helper.c#L1158

>
>
> -Doug

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

