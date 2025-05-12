Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0288AB3630
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5678510E183;
	Mon, 12 May 2025 11:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lX+8YgxR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AaTupqTw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lX+8YgxR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AaTupqTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5010E183
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:48:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A5EF1F387;
 Mon, 12 May 2025 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747050481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P/xgfo4coMIWbhkXr1qQoSvH8xgdook6MpHrG8zUTpU=;
 b=lX+8YgxRMYOHbZLSRZHDxHnovPiVwxV1fweh7hIRxLSY7T3eIeHtAB7N14TFQjrc4Tqg8W
 ydbB0KLUPbDrc6YqRj2/7UqpWOxXUtlKqWbtTuG8RkRCzgDkJx5uy85Db0+wbnglRNZ6jU
 4tTlWNWfq7Lt0J5G9gX2GgLvbyrjXWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747050481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P/xgfo4coMIWbhkXr1qQoSvH8xgdook6MpHrG8zUTpU=;
 b=AaTupqTw8q1HIcCCeQH1TBEei/hboN5hKpW9/G5IRnE8ojk2QozKNsdQXFI2buYwaBTUDW
 eLmmT5k5H/33IOCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lX+8YgxR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AaTupqTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747050481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P/xgfo4coMIWbhkXr1qQoSvH8xgdook6MpHrG8zUTpU=;
 b=lX+8YgxRMYOHbZLSRZHDxHnovPiVwxV1fweh7hIRxLSY7T3eIeHtAB7N14TFQjrc4Tqg8W
 ydbB0KLUPbDrc6YqRj2/7UqpWOxXUtlKqWbtTuG8RkRCzgDkJx5uy85Db0+wbnglRNZ6jU
 4tTlWNWfq7Lt0J5G9gX2GgLvbyrjXWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747050481;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=P/xgfo4coMIWbhkXr1qQoSvH8xgdook6MpHrG8zUTpU=;
 b=AaTupqTw8q1HIcCCeQH1TBEei/hboN5hKpW9/G5IRnE8ojk2QozKNsdQXFI2buYwaBTUDW
 eLmmT5k5H/33IOCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E81B61397F;
 Mon, 12 May 2025 11:48:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Vq9QN/DfIWhPeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 May 2025 11:48:00 +0000
Message-ID: <47ca248e-2c8f-456c-afdb-c9b30c9a3e71@suse.de>
Date: Mon, 12 May 2025 13:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Provide helpers for programming gamma ramps and
 palettes
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250509083911.39018-1-tzimmermann@suse.de>
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
In-Reply-To: <20250509083911.39018-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3A5EF1F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_NONE(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
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



Am 09.05.25 um 10:23 schrieb Thomas Zimmermann:
> We have a number of drivers that offer simple gamma correction and
> palette modes. Depending on their hardware, the drivers process the
> provided data in similar ways. Unify the functionality in several
> DRM color-management helpers and update the drivers. The new helpers
> can load provided data or generate default data to load.
>
> With the drivers; ast, mgag200 ofdrm and vesadrm; gamma ramps are
> always 8 bit wide. For 24-bit color depth, 8-bit gamma ramps are being
> loaded to hardware as provided. For lower color depths the hardware
> often requires the gamma ramp to be reduced to the number of bits
> per pixel component, which the new helpers can do automatically. The
> exception is ast's hardware, which always uses 8-bit gamma ramps.

> The default gamma ramp uses a factor of 1.0 (as has been the case in
> existing the per-driver implementations). A later update could change
> this to the common value of 2.2 or a system-specific value.

That might not be such a great idea. See 
https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&highlight_names=&date=2025-05-12&show_html=true

>
> Helpers for palettes either load an 8-bit palette or generate a default
> palette with increasing luminance. The goal for the default is to keep
> the display content visible with black at index 0. A later update could
> possibly load a system-specific default palette.
>
> Thomas Zimmermann (5):
>    drm: Add helpers for programming hardware gamma LUTs
>    drm/ast: Use helpers for programming gamma ramps and palettes
>    drm/mgag200: Use helpers for programming gamma ramps
>    drm/ofdrm: Use helpers for programming gamma ramps
>    drm/vesadrm: Use helpers for programming gamma ramps
>
>   drivers/gpu/drm/ast/ast_mode.c           |  69 +++++---
>   drivers/gpu/drm/drm_color_mgmt.c         | 206 +++++++++++++++++++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c   |  78 ++++-----
>   drivers/gpu/drm/sysfb/ofdrm.c            |  78 ++++-----
>   drivers/gpu/drm/sysfb/vesadrm.c          | 100 ++++-------
>   include/drm/drm_color_mgmt.h             |  27 +++
>   10 files changed, 380 insertions(+), 194 deletions(-)
>
>
> base-commit: 842c3c276c106040f9b96d72b9df35ed6aed9ae9

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

