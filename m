Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26231A457AD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692F110E875;
	Wed, 26 Feb 2025 08:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iKk8yCtS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mSZKK7LV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iKk8yCtS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mSZKK7LV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD48D10E877
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 08:08:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16CAC21192;
 Wed, 26 Feb 2025 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740557331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PbZP9a76kFF7v/5fgh8JyxkHa3nu4MM5DkC25sBFUEw=;
 b=iKk8yCtSvi+W43VW3jZwHJCfrBO3nFqO1nyRAg9WOGrtfQ99aNSDnqAyF1EuUYq73pJ0m0
 7cpDxjT0C4fgp0I3ZFIUtm81Yhw8oR7T3SZmlFUATHUhA0IN5cD94Qc9CHfPRdb1X+l47p
 jCRst/MdPF5COdGOpogNPilTCw4to0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740557331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PbZP9a76kFF7v/5fgh8JyxkHa3nu4MM5DkC25sBFUEw=;
 b=mSZKK7LV8gPe5qgFMdbMSl+qFS/2Xmg4JJdEEu4T8GUDxOgdsl847tENLpFf8LoUWx+hmP
 pbGLhxqo1wyxzFAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iKk8yCtS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mSZKK7LV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740557331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PbZP9a76kFF7v/5fgh8JyxkHa3nu4MM5DkC25sBFUEw=;
 b=iKk8yCtSvi+W43VW3jZwHJCfrBO3nFqO1nyRAg9WOGrtfQ99aNSDnqAyF1EuUYq73pJ0m0
 7cpDxjT0C4fgp0I3ZFIUtm81Yhw8oR7T3SZmlFUATHUhA0IN5cD94Qc9CHfPRdb1X+l47p
 jCRst/MdPF5COdGOpogNPilTCw4to0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740557331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PbZP9a76kFF7v/5fgh8JyxkHa3nu4MM5DkC25sBFUEw=;
 b=mSZKK7LV8gPe5qgFMdbMSl+qFS/2Xmg4JJdEEu4T8GUDxOgdsl847tENLpFf8LoUWx+hmP
 pbGLhxqo1wyxzFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD6F913A53;
 Wed, 26 Feb 2025 08:08:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jIF7KBLMvmfmPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 08:08:50 +0000
Message-ID: <69a78c98-d843-4e94-8559-7d435a56a442@suse.de>
Date: Wed, 26 Feb 2025 09:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mdacon: rework dependency list
To: Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Roland Kletzing <devzero@web.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
 <20250225164436.56654-3-arnd@kernel.org>
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
In-Reply-To: <20250225164436.56654-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.29 / 50.00];
 RSPAMD_URIBL(4.50)[arndb.de:email]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 BAD_REP_POLICIES(0.10)[]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmx.de,web.de,linux-foundation.org];
 FREEMAIL_ENVRCPT(0.00)[gmx.de,web.de]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[9];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,arndb.de:email];
 R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 16CAC21192
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.29
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



Am 25.02.25 um 17:44 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> mdacon has roughly the same dependencies as vgacon but expresses them
> as a negative list instead of a positive list, with the only practical
> difference being PowerPC/CHRP, which uses vga16fb instead of vgacon.
>
> The CONFIG_MDA_CONSOLE description advises to only turn it on when vgacon
> is also used because MDA/Hercules-only systems should be using vgacon
> instead, so just change the list to enforce that directly for simplicity.
>
> The probing was broken from 2002 to 2008, this improves on the fix
> that was added then: If vgacon is a loadable module, then mdacon
> cannot be built-in now, and the list of systems that support vgacon
> is carried over.
>
> Fixes: 0b9cf3aa6b1e ("mdacon messing up default vc's - set default to vc13-16 again")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> I have no idea when the last time was that someone actually tried using
> dualhead vgacon/mdacon with two ISA cards, or if it still works. We may
> be better off removing the driver altogether, but I don't see anything
> immediately wrong it with it.
> ---
>   drivers/video/console/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index ea4863919eb9..12f54480f57f 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -24,7 +24,7 @@ config VGA_CONSOLE
>   	  Say Y.
>   
>   config MDA_CONSOLE
> -	depends on !M68K && !PARISC && ISA
> +	depends on VGA_CONSOLE && ISA
>   	tristate "MDA text console (dual-headed)"
>   	help
>   	  Say Y here if you have an old MDA or monochrome Hercules graphics

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

