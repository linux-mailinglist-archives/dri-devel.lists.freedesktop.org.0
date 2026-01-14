Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4ED1D093
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C319B10E2DE;
	Wed, 14 Jan 2026 08:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dKnddNdf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xi0azGMA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dKnddNdf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xi0azGMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D2A10E2DE
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:13:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43A535BD35;
 Wed, 14 Jan 2026 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768378430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6moF34+qK1gn/F+wX915nzJUiepHL4ZhpjaofLS3VVY=;
 b=dKnddNdfi1SrguprTn2tNrzypzJ9vy5/aDRpbCMxliU+vXB0HeyuyZy1tz38HBewCIq/xx
 bzLeY/EwmpY4XBnm6uUqJULK6DLlNiEv6VswMMXbEw2CHKaSg8/msnVFIZODpbytEvz1r1
 L4UYp/Etq68GMDuUvWyhdHseGcav1t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768378430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6moF34+qK1gn/F+wX915nzJUiepHL4ZhpjaofLS3VVY=;
 b=xi0azGMACEmnv3JJqhoYDW83/4Bz2kFTvd59sVcIHutsFXxh7eXcrT6354LTK+ocE5V8Dw
 lZSL6PiTH9pWJpBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768378430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6moF34+qK1gn/F+wX915nzJUiepHL4ZhpjaofLS3VVY=;
 b=dKnddNdfi1SrguprTn2tNrzypzJ9vy5/aDRpbCMxliU+vXB0HeyuyZy1tz38HBewCIq/xx
 bzLeY/EwmpY4XBnm6uUqJULK6DLlNiEv6VswMMXbEw2CHKaSg8/msnVFIZODpbytEvz1r1
 L4UYp/Etq68GMDuUvWyhdHseGcav1t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768378430;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6moF34+qK1gn/F+wX915nzJUiepHL4ZhpjaofLS3VVY=;
 b=xi0azGMACEmnv3JJqhoYDW83/4Bz2kFTvd59sVcIHutsFXxh7eXcrT6354LTK+ocE5V8Dw
 lZSL6PiTH9pWJpBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE2703EA63;
 Wed, 14 Jan 2026 08:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XAtXOD1QZ2lqRAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Jan 2026 08:13:49 +0000
Message-ID: <85fbdbe9-28bb-43c1-a5cc-6ad8861b96a5@suse.de>
Date: Wed, 14 Jan 2026 09:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Julius Werner <jwerner@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Holland <samuel@sholland.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
 <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
 <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com>
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
In-Reply-To: <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,chromium.org,linux.intel.com,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.com:url,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
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

Am 13.01.26 um 23:32 schrieb Julius Werner:
>> Another question I have is why there's a separate device for the
>> coreboot-table? Couldn't the kernel just create the coreboot bus and
>> then populate it with the table entries? DT does that. If the
>> coreboot-table device is really just the parent for the other deivce,
>> that is incorrect, as I describe above.
> To be honest I didn't write this code and probably don't understand it
> well enough to answer that question (we should probably CC +Samuel,
> who did). I assume that it was done to get the automatic matching of
> the ACPI/DT entry that tells the kernel that a coreboot table exists.
> If there's a better way to achieve that, feel free to change it.

IDK. My take would have been to provide the coreboot table under 
/sys/firmware; similar to DT. And then walk over it and create devices 
for the known entries.

>
>> * the check on whether the CB_TAG_FRAMEBUFFER should be used or not by the
>>    kernel should also be there (what Thomas did in patch 1/8) but instead
>>    of omiting registering the coreboot device in the bus, the device could
>>    be marked as "unused" or "disabled" (by adding a field to coreboot_device).
> This sounds like a reasonable compromise. It still feels a bit odd to
> me that the check whether other framebuffers exist happens during
> parsing of the table rather than at the point where the table entry is
> actually used by something, but if that's the easiest way to make it
> work, I guess there's no harm in doing it there. (I'm still curious,
> though, why can't you just do the check in corebootdrm_probe(), and
> return -ENODEV if the other framebuffer is used? Wouldn't that be
> equivalent to what the old driver did?)

I have a new iteration of the series that creates a coreboot-framebuffer 
platform device for at the same place that currently creates the 
simple-framebuffer device (in framebuffer_probe()). So we can leave most 
of the code it as. There are also a number of bugs that this is going to 
fix. I'll post it soon.

Best regards
Thomas

>
>
>> * the coreboot_bus_match() function then can take this new field into
>>    account and only match if (device->entry.tag == id->tag && !device->unused)
>>    or something like that.
>>
>> That way no device will be removed from the bus and the corebootdrm driver
>> will only be probed when the device has to actually be used by the kernel.
>>
>> --
>> Best regards,
>>
>> Javier Martinez Canillas
>> Core Platforms
>> Red Hat
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


