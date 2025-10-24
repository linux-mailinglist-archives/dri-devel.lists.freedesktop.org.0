Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B154C06EBE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEBC10EAB8;
	Fri, 24 Oct 2025 15:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y4xVtONE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/KjazAUa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4xVtONE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/KjazAUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B701410EAB8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 15:18:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C3DE1F390;
 Fri, 24 Oct 2025 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761319083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kR7eCX26wmhe7fEXjCQ977C/EdqSk0gScKjOl25qq4o=;
 b=y4xVtONERTYaLbYbmTxzVToegK8UypCIkn+ovgb32omTRp0nR91wMyjCmU06UfC7+7Qmqp
 D8eebbCa0UDK+tWkTj3AnXiMQtQIx3AtoYbv1gdzhl27CQ4hnyROdx7lBcbBHohQFg82F5
 TmjD2eGLs58yaU/IrT9vVkAT4bPBGC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761319083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kR7eCX26wmhe7fEXjCQ977C/EdqSk0gScKjOl25qq4o=;
 b=/KjazAUabZTJtr9GlxHluGmNw+e5DhrKdC/WpbsjQ8O5xlUC7XRJDZ2zGQmWUzWtUYqe5F
 acwH5pXEB61IQ9Cg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y4xVtONE;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/KjazAUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761319083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kR7eCX26wmhe7fEXjCQ977C/EdqSk0gScKjOl25qq4o=;
 b=y4xVtONERTYaLbYbmTxzVToegK8UypCIkn+ovgb32omTRp0nR91wMyjCmU06UfC7+7Qmqp
 D8eebbCa0UDK+tWkTj3AnXiMQtQIx3AtoYbv1gdzhl27CQ4hnyROdx7lBcbBHohQFg82F5
 TmjD2eGLs58yaU/IrT9vVkAT4bPBGC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761319083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kR7eCX26wmhe7fEXjCQ977C/EdqSk0gScKjOl25qq4o=;
 b=/KjazAUabZTJtr9GlxHluGmNw+e5DhrKdC/WpbsjQ8O5xlUC7XRJDZ2zGQmWUzWtUYqe5F
 acwH5pXEB61IQ9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1047C132C2;
 Fri, 24 Oct 2025 15:18:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id F2UiAquY+2iacQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Oct 2025 15:18:03 +0000
Message-ID: <8384a735-9d90-4817-86a6-7b7bae81b6e2@suse.de>
Date: Fri, 24 Oct 2025 17:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dmabuf: Flush the cache in vmap
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Christian Brauner <brauner@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251024110432.1313391-1-jfalempe@redhat.com>
 <a1d6cf1f-02b6-4c89-84e2-4b2af39829ef@ursulin.net>
 <d123d897-8e65-417b-ad3f-40fe5b49f2b1@suse.de>
 <5ae02bda-0732-4dd4-827e-9e2dac7ae6bd@redhat.com>
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
In-Reply-To: <5ae02bda-0732-4dd4-827e-9e2dac7ae6bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C3DE1F390
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,bootlin.com:url];
 FREEMAIL_TO(0.00)[redhat.com,ursulin.net,linux.intel.com,intel.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
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

Am 24.10.25 um 15:33 schrieb Jocelyn Falempe:
> On 24/10/2025 14:40, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 24.10.25 um 13:53 schrieb Tvrtko Ursulin:
>>>
>>> On 24/10/2025 12:04, Jocelyn Falempe wrote:
>>>> On a lenovo se100 server, when using i915 GPU for rendering, and the
>>>> ast driver for display, the graphic output is corrupted, and almost
>>>> unusable.
>>>>
>>>> Adding a clflush call in the vmap function fixes this issue
>>>> completely.
>>>
>>> AST is importing i915 allocated buffer in this use case, or how 
>>> exactly is the relationship?
>>>
>>> Wondering if some path is not calling dma_buf_begin/end_cpu_access().
>>
>> Yes, ast doesn't call begin/end_cpu_access in [1].
>>
>> Jocelyn, if that fixes the issue, feel free to send me a patch for 
>> review.
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/ast/ 
>> ast_mode.c
>
> I tried the following patch, but that doesn't fix the graphical issue:
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
> b/drivers/gpu/drm/ast/ast_mode.c
> index b4e8edc7c767..e50f95a4c8a9 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -564,6 +564,7 @@ static void 
> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>         struct drm_crtc_state *crtc_state = 
> drm_atomic_get_new_crtc_state(state, crtc);
>         struct drm_rect damage;
>         struct drm_atomic_helper_damage_iter iter;
> +       int ret;
>
>         if (!old_fb || (fb->format != old_fb->format) || 
> crtc_state->mode_changed) {
>                 struct ast_crtc_state *ast_crtc_state = 
> to_ast_crtc_state(crtc_state);
> @@ -572,11 +573,16 @@ static void 
> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>                 ast_set_vbios_color_reg(ast, fb->format, 
> ast_crtc_state->vmode);
>         }
>
> +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +       pr_info("AST begin_cpu_access %d\n", ret);

Presumably, you end up in [1]. I cannot find the cflush there or in [2]. 
Maybe you need to add this call somewhere in there, similar to [3]. Just 
guessing.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c#L117
[2] 
https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/i915/gem/i915_gem_domain.c#L493
[3] 
https://elixir.bootlin.com/linux/v6.17.4/source/drivers/gpu/drm/i915/gem/i915_gem_object.c#L509

> +
>         drm_atomic_helper_damage_iter_init(&iter, old_plane_state, 
> plane_state);
>         drm_atomic_for_each_plane_damage(&iter, &damage) {
>                 ast_handle_damage(ast_plane, shadow_plane_state->data, 
> fb, &damage);
>         }
>
> +       drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
>         /*
>          * Some BMCs stop scanning out the video signal after the driver
>          * reprogrammed the offset. This stalls display output for 
> several
>
>
>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


