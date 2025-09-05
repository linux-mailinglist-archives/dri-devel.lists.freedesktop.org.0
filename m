Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C9B44E59
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 08:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD710E2C3;
	Fri,  5 Sep 2025 06:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EbfyS7fx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MmkLfQ93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EbfyS7fx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MmkLfQ93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342F110E2C3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 06:56:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7880A20599;
 Fri,  5 Sep 2025 06:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757055382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egy9Zu3bRx8BJ79Jn5qClQjMQorMYZAG+hUc9JPg81Y=;
 b=EbfyS7fxEI7KPPsn0tSrs1zCWMY0Nczx0L/5eVocn5q092opzWtLiFiKw1zP2JDTSMblU9
 S9ARISTityDxe7Rd6Pl8i0j0wq/lrY8Uh+CnvzKpJmwFF3xp+a5ONAg+/+rwHnxpuWzIds
 N4sqhFpgGtTU4CWGElJ6tphVPZ+cf4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757055382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egy9Zu3bRx8BJ79Jn5qClQjMQorMYZAG+hUc9JPg81Y=;
 b=MmkLfQ93Ma788dVf2SyUvDD3ZbcEz43fgxx4a3qmSaqMJJnC6upHMGDCr+aumG7QNlOG0h
 LP2NAiPVEPNjT8Aw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EbfyS7fx;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MmkLfQ93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757055382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egy9Zu3bRx8BJ79Jn5qClQjMQorMYZAG+hUc9JPg81Y=;
 b=EbfyS7fxEI7KPPsn0tSrs1zCWMY0Nczx0L/5eVocn5q092opzWtLiFiKw1zP2JDTSMblU9
 S9ARISTityDxe7Rd6Pl8i0j0wq/lrY8Uh+CnvzKpJmwFF3xp+a5ONAg+/+rwHnxpuWzIds
 N4sqhFpgGtTU4CWGElJ6tphVPZ+cf4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757055382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=egy9Zu3bRx8BJ79Jn5qClQjMQorMYZAG+hUc9JPg81Y=;
 b=MmkLfQ93Ma788dVf2SyUvDD3ZbcEz43fgxx4a3qmSaqMJJnC6upHMGDCr+aumG7QNlOG0h
 LP2NAiPVEPNjT8Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C857139B9;
 Fri,  5 Sep 2025 06:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +PUIEZaJumisfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Sep 2025 06:56:22 +0000
Message-ID: <5a79e01c-c1be-4386-a3b5-ef9580ae7195@suse.de>
Date: Fri, 5 Sep 2025 08:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] fbcon: Move bitops callbacks into separate struct
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
References: <20250818104655.235001-1-tzimmermann@suse.de>
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
In-Reply-To: <20250818104655.235001-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 TO_DN_NONE(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 7880A20599
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

ping for a review

Am 18.08.25 um 12:36 schrieb Thomas Zimmermann:
> Instances of fbcon use a number callbacks to support tile-based
> drawing or console rotation. The fields are writeable in struct
> fbcon_ops. Each case; unrotated, various rotated and tile-based
> drawing; uses a set of related calbacks. Updating these 'bitops'
> at runtime is spread throughout various helper functions.
>
> This series puts related callbacks into dedicated instances of the
> new type struct fbcon_bitops. Changing the callbacks at runtime
> then only requires to pick the correct instance. It further allows
> the various struct fbcon_bitops' to be declared 'static const', which
> makes them write-protected at runtime.
>
> Makes the fbcon bitops easier and safer to use and modify.
>
> Thomas Zimmermann (6):
>    fbcon: Fix empty lines in fbcon.h
>    fbcon: Rename struct fbcon_ops to struct fbcon
>    fbcon: Set rotate_font callback with related callbacks
>    fbcon: Move fbcon callbacks into struct fbcon_bitops
>    fbcon: Streamline setting rotated/unrotated bitops
>    fbcon: Pass struct fbcon to callbacks in struct fbcon_bitops
>
>   drivers/video/fbdev/core/bitblit.c      | 148 ++++----
>   drivers/video/fbdev/core/fb_internal.h  |   2 +
>   drivers/video/fbdev/core/fbcon.c        | 459 ++++++++++++------------
>   drivers/video/fbdev/core/fbcon.h        |  33 +-
>   drivers/video/fbdev/core/fbcon_ccw.c    | 180 +++++-----
>   drivers/video/fbdev/core/fbcon_cw.c     | 172 ++++-----
>   drivers/video/fbdev/core/fbcon_rotate.c |  47 +--
>   drivers/video/fbdev/core/fbcon_rotate.h |  18 +-
>   drivers/video/fbdev/core/fbcon_ud.c     | 192 +++++-----
>   drivers/video/fbdev/core/softcursor.c   |  18 +-
>   drivers/video/fbdev/core/tileblit.c     |  49 +--
>   11 files changed, 681 insertions(+), 637 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


