Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB4A35BBB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 11:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21B510EC4A;
	Fri, 14 Feb 2025 10:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w7dd6H0U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TrQy1eum";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w7dd6H0U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TrQy1eum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D710EC4A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 10:45:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7B6721215;
 Fri, 14 Feb 2025 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739529944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gbPKconONkHxzWMyeln3Aj196OSi34n4UJA2Y/lGdcU=;
 b=w7dd6H0UHQT5eFJkEP+v+AH9NV4nusden8ZdOzW9haeUGuKPxIM7dA4F6XhpTewrkd95b9
 Vzg0KS8bLMiWZFDek83c+c7YVSTc3IRp1XFUrExo1xyVTI11PABYM0eQzTRULLG71a57kr
 50BOf/fX+uyCvjjFKrHNIAPFD/9oV1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739529944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gbPKconONkHxzWMyeln3Aj196OSi34n4UJA2Y/lGdcU=;
 b=TrQy1eumStsY2L1vME/9AQyXpdo0EP2ELCJqkxLaliUBgplL/1YshvZZMcAIU2a6wbIEIp
 iNTxGkSls+GayVAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w7dd6H0U;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TrQy1eum
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739529944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gbPKconONkHxzWMyeln3Aj196OSi34n4UJA2Y/lGdcU=;
 b=w7dd6H0UHQT5eFJkEP+v+AH9NV4nusden8ZdOzW9haeUGuKPxIM7dA4F6XhpTewrkd95b9
 Vzg0KS8bLMiWZFDek83c+c7YVSTc3IRp1XFUrExo1xyVTI11PABYM0eQzTRULLG71a57kr
 50BOf/fX+uyCvjjFKrHNIAPFD/9oV1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739529944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gbPKconONkHxzWMyeln3Aj196OSi34n4UJA2Y/lGdcU=;
 b=TrQy1eumStsY2L1vME/9AQyXpdo0EP2ELCJqkxLaliUBgplL/1YshvZZMcAIU2a6wbIEIp
 iNTxGkSls+GayVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95B4E137DB;
 Fri, 14 Feb 2025 10:45:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HkoqI9ger2fsUwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Feb 2025 10:45:44 +0000
Message-ID: <1c0d0fde-1b4f-4cef-987a-fceca7659a70@suse.de>
Date: Fri, 14 Feb 2025 11:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/ast: cursor: Move format conversion to shared
 helper
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250213163845.118207-1-tzimmermann@suse.de>
 <20250213163845.118207-3-tzimmermann@suse.de>
 <02c2167a-9d86-4660-bf96-8de6b5f48c8e@redhat.com>
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
In-Reply-To: <02c2167a-9d86-4660-bf96-8de6b5f48c8e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B7B6721215
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Am 14.02.25 um 11:35 schrieb Jocelyn Falempe:
> On 13/02/2025 17:25, Thomas Zimmermann wrote:
>> User-space cursor-image data is encoded in ARBG8888, while hardware
>> supports ARGB4444. Implement the format conversion as part of the
>> format-helper framework, so that other drivers can benefit.
>>
>> This allows to respect the damage area of the cursor update. In
>> previous code, all cursor image data had to be converted on each
>> update. Now, only the changed areas require an update. The hardware
>> image is always updated completely, as it is required for the
>> checksum update.
>
> Hum, for a 64x64 cursor size, I don't see much benefit to handle 
> damage area (And I'm not sure userspace actually change only parts of 
> the cursor).

Of course.  I could imagine a user space that implements fully generic 
plane handling and treats all planes as equal; hence doing damage 
handling on cursors. But current user space usually treats cursor planes 
separately from primary planes and always replaces the cursor image with 
a different one. But we get it for free, so why not?

>
>>
>> The format-conversion helper still contains the old implementation's
>> optimization of writing 2 output pixels at the same time.
>
> Thanks, it looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Thanks for reviewing.

Best regards
Thomas

>
>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_drv.h       |  4 +-
>>   drivers/gpu/drm/ast/ast_mode.c      | 71 +++++++----------------------
>>   drivers/gpu/drm/drm_format_helper.c | 69 ++++++++++++++++++++++++++++
>>   include/drm/drm_format_helper.h     |  3 ++
>>   4 files changed, 92 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index d3115b31b032..973abd0cbd42 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -113,7 +113,9 @@ enum ast_config_mode {
>>   #define AST_MAX_HWC_WIDTH    64
>>   #define AST_MAX_HWC_HEIGHT    64
>>   -#define AST_HWC_SIZE        (AST_MAX_HWC_WIDTH * 
>> AST_MAX_HWC_HEIGHT * 2)
>> +#define AST_HWC_PITCH        (AST_MAX_HWC_WIDTH * SZ_2)
>> +#define AST_HWC_SIZE        (AST_MAX_HWC_HEIGHT * AST_HWC_PITCH)
>> +
>>   #define AST_HWC_SIGNATURE_SIZE    32
>>     /* define for signature structure */
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 974f4eb46bc3..ed00275d6418 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -657,61 +657,16 @@ static u32 ast_cursor_calculate_checksum(const 
>> u8 *src, unsigned int width, unsi
>>       return csum;
>>   }
>>   -static void ast_update_cursor_image(u8 __iomem *dst, const u8 
>> *src, u8 *tmp, int width, int height)
>> +static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
>> +                 unsigned int width, unsigned int height)
>>   {
>> -    union {
>> -        u32 ul;
>> -        u8 b[4];
>> -    } srcdata32[2], data32;
>> -    union {
>> -        u16 us;
>> -        u8 b[2];
>> -    } data16;
>> +    u8 __iomem *dst = ast->cursor_plane.base.vaddr;
>>       u32 csum = 0;
>> -    s32 alpha_dst_delta, last_alpha_dst_delta;
>> -    u8 *dstxor;
>> -    const u8 *srcxor;
>> -    int i, j;
>> -    u32 per_pixel_copy, two_pixel_copy;
>>   -    alpha_dst_delta = AST_MAX_HWC_WIDTH << 1;
>> -    last_alpha_dst_delta = alpha_dst_delta - (width << 1);
>> -
>> -    srcxor = src;
>> -    dstxor = tmp + last_alpha_dst_delta + (AST_MAX_HWC_HEIGHT - 
>> height) * alpha_dst_delta;
>> -    per_pixel_copy = width & 1;
>> -    two_pixel_copy = width >> 1;
>> -
>> -    for (j = 0; j < height; j++) {
>> -        for (i = 0; i < two_pixel_copy; i++) {
>> -            srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
>> -            srcdata32[1].ul = *((u32 *)(srcxor + 4)) & 0xf0f0f0f0;
>> -            data32.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> -            data32.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> -            data32.b[2] = srcdata32[1].b[1] | (srcdata32[1].b[0] >> 4);
>> -            data32.b[3] = srcdata32[1].b[3] | (srcdata32[1].b[2] >> 4);
>> -            memcpy(dstxor, &data32, 4);
>> -
>> -            dstxor += 4;
>> -            srcxor += 8;
>> -        }
>> -
>> -        for (i = 0; i < per_pixel_copy; i++) {
>> -            srcdata32[0].ul = *((u32 *)srcxor) & 0xf0f0f0f0;
>> -            data16.b[0] = srcdata32[0].b[1] | (srcdata32[0].b[0] >> 4);
>> -            data16.b[1] = srcdata32[0].b[3] | (srcdata32[0].b[2] >> 4);
>> -            memcpy(dstxor, &data16, 2);
>> -
>> -            dstxor += 2;
>> -            srcxor += 4;
>> -        }
>> -        dstxor += last_alpha_dst_delta;
>> -    }
>> -
>> -    csum = ast_cursor_calculate_checksum(tmp, width, height);
>> +    csum = ast_cursor_calculate_checksum(src, width, height);
>>         /* write pixel data */
>> -    memcpy_toio(dst, tmp, AST_HWC_SIZE);
>> +    memcpy_toio(dst, src, AST_HWC_SIZE);
>>         /* write checksum + signature */
>>       dst += AST_HWC_SIZE;
>> @@ -800,9 +755,7 @@ static void 
>> ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>>       struct drm_framebuffer *fb = plane_state->fb;
>>       struct drm_plane_state *old_plane_state = 
>> drm_atomic_get_old_plane_state(state, plane);
>>       struct ast_device *ast = to_ast_device(plane->dev);
>> -    struct iosys_map src_map = shadow_plane_state->data[0];
>>       struct drm_rect damage;
>> -    const u8 *src = src_map.vaddr; /* TODO: Use mapping abstraction 
>> properly */
>>       u64 dst_off = ast_plane->offset;
>>       u8 __iomem *dst = ast_plane->vaddr; /* TODO: Use mapping 
>> abstraction properly */
>>       u8 __iomem *sig = dst + AST_HWC_SIZE; /* TODO: Use mapping 
>> abstraction properly */
>> @@ -816,8 +769,18 @@ static void 
>> ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>>        */
>>         if (drm_atomic_helper_damage_merged(old_plane_state, 
>> plane_state, &damage)) {
>> -        ast_update_cursor_image(dst, src, ast_cursor_plane->argb4444,
>> -                    fb->width, fb->height);
>> +        u8 *argb4444 = ast_cursor_plane->argb4444;
>> +        struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
>> +            IOSYS_MAP_INIT_VADDR(argb4444),
>> +        };
>> +        unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
>> +            AST_HWC_PITCH,
>> +        };
>> +
>> +        drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
>> +                        shadow_plane_state->data, fb, &damage,
>> + &shadow_plane_state->fmtcnv_state);
>> +        ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
>>           ast_set_cursor_base(ast, dst_off);
>>       }
>>   diff --git a/drivers/gpu/drm/drm_format_helper.c 
>> b/drivers/gpu/drm/drm_format_helper.c
>> index b1be458ed4dd..ecb278b63e8c 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -978,6 +978,75 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map 
>> *dst, const unsigned int *dst_pit
>>   }
>>   EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
>>   +static void drm_fb_argb8888_to_argb4444_line(void *dbuf, const 
>> void *sbuf, unsigned int pixels)
>> +{
>> +    unsigned int pixels2 = pixels & ~GENMASK_ULL(0, 0);
>> +    __le32 *dbuf32 = dbuf;
>> +    __le16 *dbuf16 = dbuf + pixels2 * sizeof(*dbuf16);
>> +    const __le32 *sbuf32 = sbuf;
>> +    unsigned int x;
>> +    u32 val32;
>> +    u16 val16;
>> +    u32 pix[2];
>> +
>> +    for (x = 0; x < pixels2; x += 2, ++dbuf32) {
>> +        pix[0] = le32_to_cpu(sbuf32[x]);
>> +        pix[1] = le32_to_cpu(sbuf32[x + 1]);
>> +        val32 = ((pix[0] & 0xf0000000) >> 16) |
>> +            ((pix[0] & 0x00f00000) >> 12) |
>> +            ((pix[0] & 0x0000f000) >> 8) |
>> +            ((pix[0] & 0x000000f0) >> 4) |
>> +            ((pix[1] & 0xf0000000) >> 0) |
>> +            ((pix[1] & 0x00f00000) << 4) |
>> +            ((pix[1] & 0x0000f000) << 8) |
>> +            ((pix[1] & 0x000000f0) << 12);
>> +        *dbuf32 = cpu_to_le32(val32);
>> +    }
>> +    for (; x < pixels; x++) {
>> +        pix[0] = le32_to_cpu(sbuf32[x]);
>> +        val16 = ((pix[0] & 0xf0000000) >> 16) |
>> +            ((pix[0] & 0x00f00000) >> 12) |
>> +            ((pix[0] & 0x0000f000) >> 8) |
>> +            ((pix[0] & 0x000000f0) >> 4);
>> +        dbuf16[x] = cpu_to_le16(val16);
>> +    }
>> +}
>> +
>> +/**
>> + * drm_fb_argb8888_to_argb4444 - Convert ARGB8888 to ARGB4444 clip 
>> buffer
>> + * @dst: Array of ARGB4444 destination buffers
>> + * @dst_pitch: Array of numbers of bytes between the start of two 
>> consecutive scanlines
>> + *             within @dst; can be NULL if scanlines are stored next 
>> to each other.
>> + * @src: Array of ARGB8888 source buffer
>> + * @fb: DRM framebuffer
>> + * @clip: Clip rectangle area to copy
>> + * @state: Transform and conversion state
>> + *
>> + * This function copies parts of a framebuffer to display memory and 
>> converts
>> + * the color format during the process. The parameters @dst, 
>> @dst_pitch and
>> + * @src refer to arrays. Each array must have at least as many 
>> entries as
>> + * there are planes in @fb's format. Each entry stores the value for 
>> the
>> + * format's respective color plane at the same index.
>> + *
>> + * This function does not apply clipping on @dst (i.e. the 
>> destination is at the
>> + * top-left corner).
>> + *
>> + * Drivers can use this function for ARGB4444 devices that don't 
>> support
>> + * ARGB8888 natively.
>> + */
>> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>> +                 const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>> +                 const struct drm_rect *clip, struct 
>> drm_format_conv_state *state)
>> +{
>> +    static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
>> +        2,
>> +    };
>> +
>> +    drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, 
>> state,
>> +            drm_fb_argb8888_to_argb4444_line);
>> +}
>> +EXPORT_SYMBOL(drm_fb_argb8888_to_argb4444);
>> +
>>   /**
>>    * drm_fb_blit - Copy parts of a framebuffer to display memory
>>    * @dst:    Array of display-memory addresses to copy to
>> diff --git a/include/drm/drm_format_helper.h 
>> b/include/drm/drm_format_helper.h
>> index 428d81afe215..a1347e47e9d5 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -110,6 +110,9 @@ void drm_fb_xrgb8888_to_argb2101010(struct 
>> iosys_map *dst, const unsigned int *d
>>   void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned 
>> int *dst_pitch,
>>                     const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>>                     const struct drm_rect *clip, struct 
>> drm_format_conv_state *state);
>> +void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const 
>> unsigned int *dst_pitch,
>> +                 const struct iosys_map *src, const struct 
>> drm_framebuffer *fb,
>> +                 const struct drm_rect *clip, struct 
>> drm_format_conv_state *state);
>>     int drm_fb_blit(struct iosys_map *dst, const unsigned int 
>> *dst_pitch, uint32_t dst_format,
>>           const struct iosys_map *src, const struct drm_framebuffer *fb,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

