Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D2933D2F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081310EAD9;
	Wed, 17 Jul 2024 12:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oYiDT5Ip";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iK5fw4FK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oYiDT5Ip";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iK5fw4FK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F69710EA7F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 12:54:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C849B21C15;
 Wed, 17 Jul 2024 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721220887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qEe5+lzwt8ILRVnUi8amUfQX1sUlQUDiy9I/qbEZGFQ=;
 b=oYiDT5Ipk2SVWRc7uniElaBhBAW3jSTzjsOWZayMMe5jlVDyPFdgU/1Ltl3TN+XO6To6Ii
 GZjEJVNUrOuYHfLrD/QWlSEQ2cJxId1/SUDHHcJZfOVbm69pfgZaG8dkZtrSpgCBPye7j0
 +HHIRYA9Lw0dO9znRlIEdbgilTC284M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721220887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qEe5+lzwt8ILRVnUi8amUfQX1sUlQUDiy9I/qbEZGFQ=;
 b=iK5fw4FKEmWFGZSnl9M0OahxnNMXg/7ZnlCibMfD+NTVhg3Ez9ViBjWZLTQeQT0zHnOEYm
 sYiKyLCOOH44dmBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721220887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qEe5+lzwt8ILRVnUi8amUfQX1sUlQUDiy9I/qbEZGFQ=;
 b=oYiDT5Ipk2SVWRc7uniElaBhBAW3jSTzjsOWZayMMe5jlVDyPFdgU/1Ltl3TN+XO6To6Ii
 GZjEJVNUrOuYHfLrD/QWlSEQ2cJxId1/SUDHHcJZfOVbm69pfgZaG8dkZtrSpgCBPye7j0
 +HHIRYA9Lw0dO9znRlIEdbgilTC284M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721220887;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qEe5+lzwt8ILRVnUi8amUfQX1sUlQUDiy9I/qbEZGFQ=;
 b=iK5fw4FKEmWFGZSnl9M0OahxnNMXg/7ZnlCibMfD+NTVhg3Ez9ViBjWZLTQeQT0zHnOEYm
 sYiKyLCOOH44dmBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9250D1368F;
 Wed, 17 Jul 2024 12:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eRQAIhe/l2aEZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 12:54:47 +0000
Message-ID: <dd29b801-cf6c-4bec-9aa7-5c64f6d6fc6e@suse.de>
Date: Wed, 17 Jul 2024 14:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/probe-helpers: Work around multi-outputs-per-CRTC
 problem
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240715093936.793552-1-tzimmermann@suse.de>
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
In-Reply-To: <20240715093936.793552-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_NONE(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

As discussed on irc, we rather improve the in-kernel DRM client's 
support for cloned outputs (for fbcon) and then remove the hacks from 
the ast and mgag200 drivers. Userspace compositors need to support 
cloned outputs to a minimum.

https://dri.freedesktop.org/~cbrill/dri-log/index.php?channel=dri-devel&date=2024-07-17

Best regards
Thomas

Am 15.07.24 um 11:38 schrieb Thomas Zimmermann:
> Old or simple hardware only supports a single CRTC with multiple
> conenctoed outputs. This breaks most userspace compositors, which
> only support a single output per CRTC. This currently happens with
> ast and mgag200 drivers. The drivers contain a work around that
> dynamically disables all but one connected output.
>
> Patches 1 and 2 push the workaround into probe helpers and make it
> configurable in the kernel config. For each connector, the driver
> needs to specify a bitmask of connectors with higher priority. If
> one of them is connected, the connector at hand is always reported
> as disconnected. Connectors without priority bitmask as not affected.
>
> Patches 3 to 5 update and simplify the ast drivers. The new workaround
> now allows to have multiple physical conenctors in ast. So patch 5
> finally allows VGA and DisplayPort on the same device.
>
> Patches 6 and 7 update mgag200.
>
> Any future driver that exposes the same problem as ast and mgag200
> can simply hook into the workaround. Hopefully userspace can be fixed
> at some point.
>
> Thomas Zimmermann (7):
>    drm/probe-helper: Call connector detect functions in single helper
>    drm/probe-helper: Optionally report single connected output per CRTC
>    drm/ast: Set connector priorities
>    drm/ast: Remove struct ast_bmc_connector
>    drm/ast: Support ASTDP and VGA at the same time
>    drm/mgag200: Set connector priorities
>    drm/mgag200: Remove struct mgag200_bmc_connector
>
>   drivers/gpu/drm/Kconfig                   |  15 +++
>   drivers/gpu/drm/ast/ast_drv.h             |  17 +--
>   drivers/gpu/drm/ast/ast_main.c            |   2 +-
>   drivers/gpu/drm/ast/ast_mode.c            |  49 ++------
>   drivers/gpu/drm/drm_probe_helper.c        | 137 +++++++++++++++++++---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c     |  44 +------
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |   9 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +-
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +-
>   include/drm/drm_connector.h               |   2 +
>   include/drm/drm_probe_helper.h            |   2 +
>   16 files changed, 177 insertions(+), 128 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

