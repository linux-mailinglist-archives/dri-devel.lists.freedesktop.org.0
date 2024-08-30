Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC9965CEB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C651610EA1E;
	Fri, 30 Aug 2024 09:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fwki9eUy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0qrExyT+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fwki9eUy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0qrExyT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC1E10E9EE;
 Fri, 30 Aug 2024 09:31:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE81E1F7B9;
 Fri, 30 Aug 2024 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725010317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ueBA4VKcGNUQfjRjIck+gawE1IOEISsjr+Tr5xPpss=;
 b=fwki9eUynVDmWvTbujotvTj9EtckdlgpRLQcw5hV7OzE/fvXNh9SWYzhUK/LNmt1vAehNN
 68jMNshjlL+O3TQ8wwph4UhxoL0M2vrjcQOM1vXilNi+1d9f3ewb4DWdPZZWs9udWZmBm3
 miSOrwi7kPjExKNAYcZ/OvLDrP/MY2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725010317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ueBA4VKcGNUQfjRjIck+gawE1IOEISsjr+Tr5xPpss=;
 b=0qrExyT+0G2VsycLKRHsP9uRdJpFq2wkMbQNmOMy43GWfgZ+4EMJb7dycaWjcbaa5/qs4R
 cRlhwUOgI2xGN9CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fwki9eUy;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0qrExyT+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725010317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ueBA4VKcGNUQfjRjIck+gawE1IOEISsjr+Tr5xPpss=;
 b=fwki9eUynVDmWvTbujotvTj9EtckdlgpRLQcw5hV7OzE/fvXNh9SWYzhUK/LNmt1vAehNN
 68jMNshjlL+O3TQ8wwph4UhxoL0M2vrjcQOM1vXilNi+1d9f3ewb4DWdPZZWs9udWZmBm3
 miSOrwi7kPjExKNAYcZ/OvLDrP/MY2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725010317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1ueBA4VKcGNUQfjRjIck+gawE1IOEISsjr+Tr5xPpss=;
 b=0qrExyT+0G2VsycLKRHsP9uRdJpFq2wkMbQNmOMy43GWfgZ+4EMJb7dycaWjcbaa5/qs4R
 cRlhwUOgI2xGN9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FFD513A44;
 Fri, 30 Aug 2024 09:31:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nClBEo2R0WYYDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 09:31:57 +0000
Message-ID: <53d67a78-440c-4525-9226-bd253fd78e9c@suse.de>
Date: Fri, 30 Aug 2024 11:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 40/81] drm/stm: Run DRM default client setup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-41-tzimmermann@suse.de>
 <1bb15789-ae48-9a5f-aa35-c6c0b066d1dc@linux-m68k.org>
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
In-Reply-To: <1bb15789-ae48-9a5f-aa35-c6c0b066d1dc@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE81E1F7B9
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,lists.freedesktop.org,foss.st.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
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

Am 30.08.24 um 11:22 schrieb Geert Uytterhoeven:
> On Fri, 30 Aug 2024, Thomas Zimmermann wrote:
>> Call drm_client_setup_with-fourcc() to run the kernel's default client
>> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
>> setup can start the common fbdev client.
>>
>> v2:
>> - use drm_client_setup_with_fourcc()
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
>> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>
> WARNING: Duplicate signature

Interesting. Raphael gave a ack on v1 and v2 each. I re-imported v2 of 
the series from patchwork and it seems that it counted each ack 
independently.

Best regards
Thomas

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

