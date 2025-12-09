Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4C6CAF20E
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 08:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C84310E1BA;
	Tue,  9 Dec 2025 07:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0mXjSg/q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4XoVGMfu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jbY21gCF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x+fE+Yim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384B10E1BA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 07:27:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 749B333796;
 Tue,  9 Dec 2025 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765265248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MuIa8dUwTcVgYgFHAyhAg0EMcbS1x7oo3yj6XjTARVE=;
 b=0mXjSg/qe3onaWeHVykC8rjAT7T1YRcPpDDMruzq/zpUA3/ZH8uNqMZ0IhSiyF8zARuD+5
 Fv5D12KA3nQNLk4jiPRQK5GFs/iruobTeZJeFYidJ/e86Btzvbxs0Ge+CUeNB/rupQj614
 OdyaCBI84imOISRIe861i4gGBDZUoWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765265248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MuIa8dUwTcVgYgFHAyhAg0EMcbS1x7oo3yj6XjTARVE=;
 b=4XoVGMfuBHWNQjYGKXPhGpM+G0gT9albFgojxv0+Cm7+6D94GRwO+mOsgCKIESV9D+0RcQ
 RZVJSYKVvq2Zh7Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jbY21gCF;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=x+fE+Yim
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765265247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MuIa8dUwTcVgYgFHAyhAg0EMcbS1x7oo3yj6XjTARVE=;
 b=jbY21gCFuJRh9OxbtX2fmR1L5ppLTLdNiy0VTldE8xLlNZj+G43RKLoo1U0CdVooKdTH8C
 4gK6rUDF90+bjtCyK09baEmV8AnND1+bcCetOtUM+k1PFHo2e9+jGmKQ2Aj0OpBwYNKrgv
 Uo9psuB/2O71ZWAK2+W+3Z36AfnOlGI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765265247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MuIa8dUwTcVgYgFHAyhAg0EMcbS1x7oo3yj6XjTARVE=;
 b=x+fE+Yim4Zu283DIddp/kSveMGNZPg4EXT+aqWYXeEUiIZRXHIQEy/CQTabg1wFHuXR7FA
 kPGzIdrtS03ZKzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24BB43EA63;
 Tue,  9 Dec 2025 07:27:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9HbrBl/PN2kySAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 07:27:27 +0000
Message-ID: <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
Date: Tue, 9 Dec 2025 08:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
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
In-Reply-To: <20251209042744.7875-1-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmx.de,linuxfoundation.org];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 749B333796
X-Spam-Flag: NO
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

Hi

Am 09.12.25 um 05:27 schrieb Chintan Patel:
> Hi all,
>
> This small series makes several legacy fbdev drivers buildable with
> CONFIG_FB_DEVICE=n. Currently, multiple fbdev drivers rely on fb_info->dev
> and sysfs attribute registration unconditionally, which leads to build
> failures whenever FB_DEVICE is disabled.
>
> Thomas previously noted that FB_DEVICE should eventually become optional
> and that drivers should not depend on sysfs or fb_info->dev being present
> unless the Kconfig explicitly selects it. This series pushes in that
> direction by tightening the FB_DEVICE dependency boundary without changing
> any runtime behaviour when FB_DEVICE=y.
>
> What this series does *not* change
>
> - No functional behaviour changes when FB_DEVICE=y.
> - No removal of sysfs interfaces.
> - No changes to fbops, memory allocation, or display update paths.
>
> Build & test coverage
>
> Tested with the following combinations:
>
> 1. **FB=y, FB_DEVICE=y**
>     - Baseline configuration; no regressions expected.
>
> 2. **FB=y, FB_DEVICE=n**
>     - Drivers build successfully.
>     - No sysfs attributes are created.
>     - fbdev devices operate normally (where applicable).
>
> 3. **FB=n**
>     - Drivers depend on FB, so they properly do not build, unchanged.
>
> Motivation
>
> This moves fbdev closer to supporting FB_DEVICE as truly optional, helps
> reduce Kconfig entanglement, and clears several long-standing TODO items
> as suggested by Thomas Zimmermann around legacy sysfs usage inside fbdev
> drivers.
>
> Feedback is welcome, especially on whether the guard boundaries around
> sysfs are placed correctly or whether more logic should be pulled under
> CONFIG_FB_DEVICE.

I left a comment on the first patch. If things still build nicely, then

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

for the series.

Best regards
Thomas

>
> Thanks,
> Chintan
>
> Chintan Patel (3):
>    fbtft: Make sysfs and dev_*() logging conditional on FB_DEVICE
>    omapfb: Guard sysfs code under CONFIG_FB_DEVICE
>    sh_mobile_lcdc: Guard overlay sysfs interfaces under CONFIG_FB_DEVICE
>
>   drivers/staging/fbtft/fbtft-core.c            | 20 +++++++++++++++++--
>   drivers/staging/fbtft/fbtft-sysfs.c           |  8 ++++++++
>   drivers/video/fbdev/omap2/omapfb/Kconfig      |  2 +-
>   .../video/fbdev/omap2/omapfb/omapfb-sysfs.c   | 11 ++++++++++
>   drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 ++++
>   5 files changed, 42 insertions(+), 3 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


