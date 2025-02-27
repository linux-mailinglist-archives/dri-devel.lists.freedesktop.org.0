Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E102A47902
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBEE10E25C;
	Thu, 27 Feb 2025 09:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ly6losrb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgzQTyGf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ly6losrb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgzQTyGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE610E25C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:25:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D1171F38A;
 Thu, 27 Feb 2025 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740648333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=84jGCzOfenk39n3fQ2tGw741WbwinSTOHOE7D5W59+0=;
 b=ly6losrbrIxeVYzL4cQBa9lQoYYLJNDmOdi/fKo9+bCVM1hw+dJ9CZOmMHGLsT/nxUAPIh
 xSv4neyawmJstf+M2YQuGnr2cPTA7u783axf1610FzmljIhwoZobWcwBNo/gLkzCXLYs/Y
 2orK899DYf2puPnd7FmgktiqFZMhc6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740648333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=84jGCzOfenk39n3fQ2tGw741WbwinSTOHOE7D5W59+0=;
 b=JgzQTyGfkphco0WrGtXyX8Ub+v65qPaTxMtmX4GTH9Zay7YAt+UzW7AP1P90ZxIJd4rgoz
 ztOnLjeHOir/9pDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740648333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=84jGCzOfenk39n3fQ2tGw741WbwinSTOHOE7D5W59+0=;
 b=ly6losrbrIxeVYzL4cQBa9lQoYYLJNDmOdi/fKo9+bCVM1hw+dJ9CZOmMHGLsT/nxUAPIh
 xSv4neyawmJstf+M2YQuGnr2cPTA7u783axf1610FzmljIhwoZobWcwBNo/gLkzCXLYs/Y
 2orK899DYf2puPnd7FmgktiqFZMhc6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740648333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=84jGCzOfenk39n3fQ2tGw741WbwinSTOHOE7D5W59+0=;
 b=JgzQTyGfkphco0WrGtXyX8Ub+v65qPaTxMtmX4GTH9Zay7YAt+UzW7AP1P90ZxIJd4rgoz
 ztOnLjeHOir/9pDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E948813888;
 Thu, 27 Feb 2025 09:25:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F0ysNowvwGcbEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Feb 2025 09:25:32 +0000
Message-ID: <fb4c9b76-82dd-4227-9ee5-d7b52438bd0e@suse.de>
Date: Thu, 27 Feb 2025 10:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
 <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
 <29ecc7c4-2887-4989-a1d3-aa76b44c0387@suse.de>
 <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
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
In-Reply-To: <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[arndb.de,kernel.org,linuxfoundation.org,gmx.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
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

Am 26.02.25 um 12:46 schrieb Arnd Bergmann:
> On Wed, Feb 26, 2025, at 09:16, Thomas Zimmermann wrote:
>> Am 26.02.25 um 08:55 schrieb Arnd Bergmann:
>> Here's another general question. vgacon and fbcon only seem usable with
>> CONFIG_VT=y. Wouldn't it make sense to have them depend on CONFIG_VT=y?
>> dummycon could then be implemented as part of the vt code, maybe even
>> become a vt-internal thing. The console code is complex, so I'm probably
>> missing something here?
> I think in theory one may have a system use fbcon purely to get the
> boot logo, but not actually support VT.  I had also assumed there might
> be a way to use fbcon as the console (i.e. printk) but not register
> the tty, but it looks like the console code still requires vt.
>
> After I looked at the vt and conswitchp code some more, I wonder
> if we could go the other way and instead of integrating it more
> make the conswitchp logic optional: most of the complexity here
> deals with switching between text console and fbcon dynamically,
> but having any text console support is getting very rare (vga
> on alpha/mips/x86-32, newport on mips-ip22, sti on parisc).
>
> If we do this, the conswitchp code could be merged with dummycon
> in drivers/video/console, with the simpler alternative just
> calling into fbcon functions. I'm not sure if we can already drop
> vgacon from normal x86-64 distro configs, i.e. if there are cases
> that are not already covered by any of efi-earlycon, efifb,
> vga16fb, vesafb/uvesafb or a PCI DRM driver.

Thanks for the lengthy answer. I don't want to add work to your todo 
list. For vgacon, I wouldn't remove it yet, as there still exisits 
x86_64 systems with plain VGA support.

Best regards
Thomas


>
>      Arnd
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

