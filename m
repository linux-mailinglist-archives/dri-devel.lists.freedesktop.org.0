Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F5859FB6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A99110E1F3;
	Mon, 19 Feb 2024 09:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lfOkbKCi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g1FYU3iW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="blwaylYH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKF5NHZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2EF10E1F3;
 Mon, 19 Feb 2024 09:31:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 393342206A;
 Mon, 19 Feb 2024 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708335064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y/D66OSEdyzmFopZiKMpHruDnoXXVOF3XH6nd8SJXkQ=;
 b=lfOkbKCi4ahpqMn+NeVOrzi1OsiafPu9Xy36QJEQlYn3DM3Omk59Vgi+htm7PMrwIEyB42
 1VJhr298RqVH06Ubyz6eSHrLM7YLMF332e6cALEP3/r8WGGWSokftgWSoMQJMOqhRNt7AQ
 z7/0+8bqxK65KJlB8SGF7IW/lQy1nXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708335064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y/D66OSEdyzmFopZiKMpHruDnoXXVOF3XH6nd8SJXkQ=;
 b=g1FYU3iWx/6/NotX9cm6OVa9xXjz8/MJqeGLBr7c24b/9F+8265u5CZ3GBYt8pyTEiPn9F
 cQTyCq1sgY+pcHAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708335062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y/D66OSEdyzmFopZiKMpHruDnoXXVOF3XH6nd8SJXkQ=;
 b=blwaylYHeCH2C5R4qFf0n2eJOKCodP93xLcP5FClM09wXP9ER00fpqDK1rw1V9l0rbhTVy
 lBECg1qCnH0J50J9VoYYlxs6jQGa0879MCs99IB0C54IPLuPuhUdSt3O7IhgFh8YvvS/+X
 Zd1Ge/vZHwnzCphIRVYVEblZHqtBZYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708335062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y/D66OSEdyzmFopZiKMpHruDnoXXVOF3XH6nd8SJXkQ=;
 b=vKF5NHZD1dp07F/XhgD8zKRTBAD9GeDARvJz4hhD0cCWIp1ycOKx6HLszxOAvsLlYZgEQ2
 4Sm8wGGJcMuMDlBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D4E9613585;
 Mon, 19 Feb 2024 09:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OnqEMtUf02XBTgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Feb 2024 09:31:01 +0000
Message-ID: <4c25b689-ab92-4e84-b54c-e80f511e10c7@suse.de>
Date: Mon, 19 Feb 2024 10:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] fbdev: Clean up include dependencies in header
Content-Language: en-US
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-staging@lists.linux.dev
References: <20240213084403.20995-1-tzimmermann@suse.de>
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
In-Reply-To: <20240213084403.20995-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=blwaylYH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vKF5NHZD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.82 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_NONE(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 BAYES_HAM(-0.32)[75.68%];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[12]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -3.82
X-Rspamd-Queue-Id: 393342206A
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

A-b'd by Helge via email

Acked-by: Helge Deller <deller@gmx.de>

Am 13.02.24 um 09:42 schrieb Thomas Zimmermann:
> Remove unnecessary dependencies in the include statements of the
> header file <linux/fb.h>. Several files throughout the kernel include
> the fbdev header, so reducing dependencies positively affects other
> subsystems as well. Also fix up nouveau and fbtft, which need backlight.h
> in some their source files.
>
> v2:
> 	* include backlight.h in fbtft (kernel test robot)
>
> Thomas Zimmermann (8):
>    drm/nouveau: Include <linux/backlight.h>
>    staging/fbtft: Include <linux/backlight.h>
>    fbdev: Do not include <linux/backlight.h> in header
>    fbdev: Do not include <linux/fs.h> in header
>    fbdev: Do not include <linux/notifier.h> in header
>    fbdev: Do not include <linux/slab.h> in header
>    fbdev: Clean up forward declarations in header file
>    fbdev: Clean up include statements in header file
>
>   drivers/gpu/drm/nouveau/dispnv50/disp.c |  1 +
>   drivers/staging/fbtft/fb_ssd1351.c      |  2 ++
>   include/linux/fb.h                      | 24 +++++++++++++-----------
>   3 files changed, 16 insertions(+), 11 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

