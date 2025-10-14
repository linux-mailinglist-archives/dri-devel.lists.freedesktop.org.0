Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E6BD8305
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D99F10E57B;
	Tue, 14 Oct 2025 08:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="abchEqRI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EAXB2LYk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="abchEqRI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EAXB2LYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4D410E586
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:33:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96BC821D8C;
 Tue, 14 Oct 2025 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760430786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJbGhNs7yXqCu2TM4PLIzCVg37upHDVrwG0JVA1aymg=;
 b=abchEqRIqQt96fuRv+5tL106tzwSHXgPV2kjdFP1NoExc8i01hpwoqbDdLdzy/fs9ZvgYx
 gHgwva3UWw1i8O7dxZAuplbSntk+KM7+uKvPAueZfZYBnUbdBAxpAZJhQ4mzOhgzsN6+7P
 D1+fVNgobcSMnCmErqAZH4HWy+FWMAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760430786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJbGhNs7yXqCu2TM4PLIzCVg37upHDVrwG0JVA1aymg=;
 b=EAXB2LYk8dqTO4RysRaTLZjJl+tZT4XTnhR4QjSda/AsqTteXCdM4Toi/QDajDebLrarWb
 qE46o/+/Dp1NLQBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=abchEqRI;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EAXB2LYk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760430786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJbGhNs7yXqCu2TM4PLIzCVg37upHDVrwG0JVA1aymg=;
 b=abchEqRIqQt96fuRv+5tL106tzwSHXgPV2kjdFP1NoExc8i01hpwoqbDdLdzy/fs9ZvgYx
 gHgwva3UWw1i8O7dxZAuplbSntk+KM7+uKvPAueZfZYBnUbdBAxpAZJhQ4mzOhgzsN6+7P
 D1+fVNgobcSMnCmErqAZH4HWy+FWMAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760430786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aJbGhNs7yXqCu2TM4PLIzCVg37upHDVrwG0JVA1aymg=;
 b=EAXB2LYk8dqTO4RysRaTLZjJl+tZT4XTnhR4QjSda/AsqTteXCdM4Toi/QDajDebLrarWb
 qE46o/+/Dp1NLQBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 612AC13A44;
 Tue, 14 Oct 2025 08:33:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PE9NFsIK7mhFGAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Oct 2025 08:33:06 +0000
Message-ID: <404d4ac2-6227-400d-8031-f15b7274258f@suse.de>
Date: Tue, 14 Oct 2025 10:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Blank with VGACR17 sync enable, always clear
 VGACRB6 sync off
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 dianders@chromium.org, nbowler@draconx.ca
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20251010080233.21771-1-tzimmermann@suse.de>
 <9ad17cb1-3e09-4082-b52b-0b218812f114@redhat.com>
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
In-Reply-To: <9ad17cb1-3e09-4082-b52b-0b218812f114@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 96BC821D8C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 14.10.25 um 09:45 schrieb Jocelyn Falempe:
> On 10/10/2025 10:02, Thomas Zimmermann wrote:
>> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
>> by reenabling them. This VGA setting should be supported by all Aspeed
>> hardware.
>>
>> Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
>> VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
>> not reenable it after the soft reset. The display output remains dark.
>> When the display is off during boot, some BMCs set the sync-off bits in
>> VGACRB6, so the display remains dark. Observed with Blackbird AST2500
>> BMC. Clearing the sync-off bits unconditionally fixes these issues.
>>
>> Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
>> access to video memory.
>
> One comment below:>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: ce3d99c83495 ("drm: Call drm_atomic_helper_shutdown() at 
>> shutdown time for misc drivers")
>> Tested-by: Nick Bowler <nbowler@draconx.ca>
>> Reported-by: Nick Bowler <nbowler@draconx.ca>
>> Closes: 
>> https://lore.kernel.org/dri-devel/wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi/
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.7+
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 18 ++++++++++--------
>>   drivers/gpu/drm/ast/ast_reg.h  |  1 +
>>   2 files changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 6b9d510c509d..fe8089266db5 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_crtc 
>> *crtc,
>>   static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, 
>> struct drm_atomic_state *state)
>>   {
>>       struct ast_device *ast = to_ast_device(crtc->dev);
>> +    u8 vgacr17 = 0x00;
>> +    u8 vgacrb6 = 0x00;
>>   -    ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
>> -    ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
>> +    vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;

>> +    vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
> As vgacrb6 is 0, then this "&=" shouldn't do anything?

Indeed! I'll fix that in the next rev. But the result is luckily the 
same, :) because clearing these bits to 0 enables sync.

To give you some context on this code: Just writing plain 0x00 into the 
HW registers obscures what this code does. But assigning these AST_IO_ 
constants directly to the variables gives a compiler warning about size 
mismatches for storing long in u8. Hence these &= and |= constructs. So 
vgacrb6 should be 0xff and the &= statement clears the bits. It's a 
masked write below, so the remaining bits will be ignored.

Best regards
Thomas

>
>> +
>> +    ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
>> +    ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>>   }
>>     static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, 
>> struct drm_atomic_state *state)
>>   {
>>       struct drm_crtc_state *old_crtc_state = 
>> drm_atomic_get_old_crtc_state(state, crtc);
>>       struct ast_device *ast = to_ast_device(crtc->dev);
>> -    u8 vgacrb6;
>> +    u8 vgacr17 = 0xff;
>>   -    ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 
>> AST_IO_VGASR1_SD);
>> -
>> -    vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
>> -          AST_IO_VGACRB6_HSYNC_OFF;
>> -    ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>> +    vgacr17 &= ~AST_IO_VGACR17_SYNC_ENABLE;
>> +    ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
>>         /*
>>        * HW cursors require the underlying primary plane and CRTC to
>> diff --git a/drivers/gpu/drm/ast/ast_reg.h 
>> b/drivers/gpu/drm/ast/ast_reg.h
>> index e15adaf3a80e..30578e3b07e4 100644
>> --- a/drivers/gpu/drm/ast/ast_reg.h
>> +++ b/drivers/gpu/drm/ast/ast_reg.h
>> @@ -29,6 +29,7 @@
>>   #define AST_IO_VGAGRI            (0x4E)
>>     #define AST_IO_VGACRI            (0x54)
>> +#define AST_IO_VGACR17_SYNC_ENABLE    BIT(7) /* called "Hardware 
>> reset" in docs */
>>   #define AST_IO_VGACR80_PASSWORD        (0xa8)
>>   #define AST_IO_VGACR99_VGAMEM_RSRV_MASK    GENMASK(1, 0)
>>   #define AST_IO_VGACRA1_VGAIO_DISABLED    BIT(1)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


