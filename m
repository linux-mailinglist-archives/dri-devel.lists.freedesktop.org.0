Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7BDB40205
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 15:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9E210E6D8;
	Tue,  2 Sep 2025 13:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hIOzX/NM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xaisRgqh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hIOzX/NM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xaisRgqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9514110E6D8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 13:08:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06DAE211E7;
 Tue,  2 Sep 2025 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756818495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sQKX48qPcgwHVW+NCAlkDrUqgPcoHhJtJTs0F29hUFQ=;
 b=hIOzX/NMrpSI02Cf/ondEAjOizE+dT4kS36RjI8WIB5l5WupySwTkjtkEEEEhTwa4f7Xmy
 kGZA9rSWGrtiaxoRHuK4nWbb69dc9yHgwn/DIBeN4NYA3Fgs0grfspa2VqcCUy02e1EopT
 CPrTjZD8VdLedVtvyHEKx2dA3q+j9yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756818495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sQKX48qPcgwHVW+NCAlkDrUqgPcoHhJtJTs0F29hUFQ=;
 b=xaisRgqhtLeq8MQWuHCrvyPRAk0ilpPkFZ3MSZmz/gUZzOujfuCmgaE+QpDkN+pwuxFRaO
 LWzgruOEaAG9vzAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="hIOzX/NM";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xaisRgqh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756818495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sQKX48qPcgwHVW+NCAlkDrUqgPcoHhJtJTs0F29hUFQ=;
 b=hIOzX/NMrpSI02Cf/ondEAjOizE+dT4kS36RjI8WIB5l5WupySwTkjtkEEEEhTwa4f7Xmy
 kGZA9rSWGrtiaxoRHuK4nWbb69dc9yHgwn/DIBeN4NYA3Fgs0grfspa2VqcCUy02e1EopT
 CPrTjZD8VdLedVtvyHEKx2dA3q+j9yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756818495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sQKX48qPcgwHVW+NCAlkDrUqgPcoHhJtJTs0F29hUFQ=;
 b=xaisRgqhtLeq8MQWuHCrvyPRAk0ilpPkFZ3MSZmz/gUZzOujfuCmgaE+QpDkN+pwuxFRaO
 LWzgruOEaAG9vzAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A1FA13888;
 Tue,  2 Sep 2025 13:08:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IQ4/AT7stmhaVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 13:08:14 +0000
Message-ID: <d807d181-6b14-4711-b297-72dcd49b4937@suse.de>
Date: Tue, 2 Sep 2025 15:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/29] drm/atomic: Document atomic state lifetime
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-1-14ad5315da3f@kernel.org>
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
In-Reply-To: <20250902-drm-state-readout-v1-1-14ad5315da3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,ideasonboard.com,kwiboo.se,iki.fi];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 06DAE211E7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> How drm_atomic_state structures and the various entity structures are
> allocated and freed isn't really trivial, so let's document it.

Thanks for doing this.

>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   Documentation/gpu/drm-kms.rst |  6 ++++++
>   drivers/gpu/drm/drm_atomic.c  | 45 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1edc758a6bc6fb5ff9c8e1c7749ff..dc0f61a3d29e752889077d855a4bea381f2e2c18 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -280,10 +280,16 @@ structure, ordering of committing state changes to hardware is sequenced using
>   :c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
>   
>   Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
>   coverage of specific topics.
>   
> +Atomic State Lifetime
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_atomic.c
> +   :doc: state lifetime
> +
>   Handling Driver Private State
>   -----------------------------
>   
>   .. kernel-doc:: drivers/gpu/drm/drm_atomic.c
>      :doc: handling driver private state
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index cd15cf52f0c9144711da5879da57884674aea9e4..b356d26faad4acaa25c1fe6f9bd5043b6364ce87 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -44,10 +44,55 @@
>   #include <drm/drm_writeback.h>
>   
>   #include "drm_crtc_internal.h"
>   #include "drm_internal.h"
>   
> +/**
> + * DOC: state lifetime
> + *
> + * &struct drm_atomic_state represents an update to video pipeline state.
> + *
> + * Its lifetime is:
> + *
> + * - at reset time, the entity reset implementation will allocate a
> + *   new, default, state and will store it in the entity state pointer.

Can you somehow mention drm_mode_config_reset() here? 'Reset time' might 
be too abstract.

> + *
> + * - whenever a new update is needed:
> + *
> + *   + we allocate a new &struct drm_atomic_state using drm_atomic_state_alloc().
> + *
> + *   + we copy the state of each affected entity into our &struct
> + *     drm_atomic_state using drm_atomic_get_plane_state(),
> + *     drm_atomic_get_crtc_state(), drm_atomic_get_connector_state(), or
> + *     drm_atomic_get_private_obj_state(). That state can then be
> + *     modified.
> + *
> + *     At that point, &struct drm_atomic_state stores three state
> + *     pointers for that particular entity: the old, new, and existing
> + *     (called "state") states. The old state is the state currently
> + *     active in the hardware, ie either the one initialized by reset()

'ie' should be replaced by 'which is'. AFAIK ie is used like this: 
(i.e., ...).

> + *     or a newer one if a commit has been made. The new state is the
> + *     state we just allocated and we might eventually commit to the
> + *     hardware. The existing state points to the state we'll eventually
> + *     have to free, the new state for now.

That final sentence is confusing. What are we doing with the existing 
state? Will the old state ever become the existing state? You also never 
explain this below.

Maybe only focus on the old and new state for now and explain the 
meaning of the existing state in a separate bullet point.

Best regards
Thomas

> + *
> + *   + Once we run a commit, it is first checked and if the check is
> + *     successful, it is committed. Part of the commit is a call to
> + *     drm_atomic_helper_swap_state() which will turn the new state into
> + *     the active state. Doing so involves updating the entity state
> + *     pointer (&drm_crtc.state or similar) to point to the new state,
> + *     and the existing state will now point to the old state, that used
> + *     to be active but isn't anymore.
> + *
> + *   + When the commit is done, and when all references to our &struct
> + *     drm_atomic_state are put, drm_atomic_state_clear() runs and will
> + *     free all the old states.
> + *
> + *   + Now, we don't have any active &struct drm_atomic_state anymore,
> + *     and only the entity active states remain allocated.
> + */
> +
>   void __drm_crtc_commit_free(struct kref *kref)
>   {
>   	struct drm_crtc_commit *commit =
>   		container_of(kref, struct drm_crtc_commit, ref);
>   
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


