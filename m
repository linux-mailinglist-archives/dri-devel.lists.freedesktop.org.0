Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2A91BCE2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0472810E251;
	Fri, 28 Jun 2024 10:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pGX/DviV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XDL3tMEP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HawAV4bY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2J8CVjin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DB510E251
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:51:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 100C321BDA;
 Fri, 28 Jun 2024 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719571916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+drOhoB9vzBtMjEuXTmpkIyRBvpBJ8gCy2J0l8CCUk=;
 b=pGX/DviVjhsWeNbk8gFsdqKu8blHs7RJrprwy2M9pCYUIIITvb5GaZnQo4+5zFBjZJvZZj
 NEKxqxoIaB3f7FolqzbPXy77EJFaT7hhyScTB7lab8l7C0h51BnqFH7lINBVbgo4tARUPn
 y/SF/BNwKu5r+vYwrL6yY67TRe8Dxtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719571916;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+drOhoB9vzBtMjEuXTmpkIyRBvpBJ8gCy2J0l8CCUk=;
 b=XDL3tMEP/PlQfuQQ8pRC/WJ0ERPdZPhGlCbnZ/uocDMGTkBg86BfhYSKR0veqaphcVz2Nh
 5xEq460GrFeaWeBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HawAV4bY;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2J8CVjin
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719571915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+drOhoB9vzBtMjEuXTmpkIyRBvpBJ8gCy2J0l8CCUk=;
 b=HawAV4bYpKviVw+2X8HrDNt9HZWoY3xPqDXFBonuS8DqpMLFFBr1651W8Tg8+9uRtMjnxy
 j3Kvv84xpEarFryC/kO1QcUA/1Ysse6uvszwkORHuq+R1YrPdNjkQvvb1VhCh2k/FelBcL
 mCFibQBQnV5JP0TDlGo6NmkPskDaf7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719571915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8+drOhoB9vzBtMjEuXTmpkIyRBvpBJ8gCy2J0l8CCUk=;
 b=2J8CVjinf1gGvE9BNfSN33lIA33Qb4aTDBT4KpSuHkWjdu1Aym2CssyFYJXVOYX9+FxK1+
 ibkiiy0arrvJdrDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD7B11373E;
 Fri, 28 Jun 2024 10:51:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zqE1MMqVfmYQTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jun 2024 10:51:54 +0000
Message-ID: <b48b2efd-c33c-486c-be80-8fb9a985514d@suse.de>
Date: Fri, 28 Jun 2024 12:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/ast: Handle primary-plane format setup in
 atomic_update
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <20240627153638.8765-1-tzimmermann@suse.de>
 <20240627153638.8765-5-tzimmermann@suse.de>
 <c999656a-bf16-4cbc-bc35-8af8302aad66@redhat.com>
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
In-Reply-To: <c999656a-bf16-4cbc-bc35-8af8302aad66@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 100C321BDA
X-Spam-Flag: NO
X-Spam-Score: -4.50
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

Am 28.06.24 um 11:54 schrieb Jocelyn Falempe:
>
>
> On 27/06/2024 17:27, Thomas Zimmermann wrote:
>> Several color registers are programmed in the DPMS code of the CRTC's
>> atomic_enable helper. This code will not be executed if the color format
>> changes without a full mode switch. The same code already exists in the
>> atomic_update helper of the primary plane. There, the code will not run
>> if only the display mode changes.
>
> This last sentence is unclear to me.

OK, sure. It means that the plane's code might not run if the color 
format stays the same when the display mode changes. I'll try to reword.

Best regards
Thomas

>
>>
>> The color format is a property of the primary plane, so consolidate all
>> code in the plane's atomic_update.
>
> With the comment clarified,
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index e8312b3472ed..6a81d657175d 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -649,12 +649,12 @@ static void 
>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>       struct drm_plane_state *old_plane_state = 
>> drm_atomic_get_old_plane_state(state, plane);
>>       struct drm_framebuffer *old_fb = old_plane_state->fb;
>>       struct ast_plane *ast_plane = to_ast_plane(plane);
>> +    struct drm_crtc *crtc = plane_state->crtc;
>> +    struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>>       struct drm_rect damage;
>>       struct drm_atomic_helper_damage_iter iter;
>>   -    if (!old_fb || (fb->format != old_fb->format)) {
>> -        struct drm_crtc *crtc = plane_state->crtc;
>> -        struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>> +    if (!old_fb || (fb->format != old_fb->format) || 
>> crtc_state->mode_changed) {
>>           struct ast_crtc_state *ast_crtc_state = 
>> to_ast_crtc_state(crtc_state);
>>           struct ast_vbios_mode_info *vbios_mode_info = 
>> &ast_crtc_state->vbios_mode_info;
>>   @@ -1025,7 +1025,6 @@ static void ast_crtc_dpms(struct drm_crtc 
>> *crtc, int mode)
>>       u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
>>       struct ast_crtc_state *ast_state;
>>       const struct drm_format_info *format;
>> -    struct ast_vbios_mode_info *vbios_mode_info;
>>         /* TODO: Maybe control display signal generation with
>>        *       Sync Enable (bit CR17.7).
>> @@ -1039,10 +1038,6 @@ static void ast_crtc_dpms(struct drm_crtc 
>> *crtc, int mode)
>>           format = ast_state->format;
>>             if (format) {
>> -            vbios_mode_info = &ast_state->vbios_mode_info;
>> -
>> -            ast_set_color_reg(ast, format);
>> -            ast_set_vbios_color_reg(ast, format, vbios_mode_info);
>>               if (crtc->state->gamma_lut)
>>                   ast_crtc_set_gamma(ast, format, 
>> crtc->state->gamma_lut->data);
>>               else
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

