Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEADCB2782
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 09:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9443C10E230;
	Wed, 10 Dec 2025 08:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aGeMwvPC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8zh6lf0g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mJdo66Zi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WcDZ8ZpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3DF10E230
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 08:55:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8F2B5BDA7;
 Wed, 10 Dec 2025 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765356952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=88qj7UpUpm29AgmPoNzNIhHRqnpnRY8JBV+f2vppG18=;
 b=aGeMwvPCVbS31IcpD2XvDzA5I6GL2ZPF3hU4ZoYNSRtGhXiyRRxGUdWneNtCpKeh97fIjy
 y1UTJf7BvG007LXCSQzx8xulSbxXWHmOrzsPiuxinsPBWfAqhAbfLGtaYefPexJQqdiLwr
 AKDfze0NEjF3g9dKb2UIClSttB9xQos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765356952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=88qj7UpUpm29AgmPoNzNIhHRqnpnRY8JBV+f2vppG18=;
 b=8zh6lf0gIVDXg6LhBoWamXyaw6aIui1X2hcFFdiGsMGtfYopNZfKghNdKBKRbQME8LtiER
 v9wnEnnQrw42RtDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mJdo66Zi;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WcDZ8ZpB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765356950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=88qj7UpUpm29AgmPoNzNIhHRqnpnRY8JBV+f2vppG18=;
 b=mJdo66ZisXJzThL7XufmkDvTKcVonJJSTBBVTP3Wf4/ZxJkKH4uFhQl1oBd0G/djdpz0x2
 laHhFnWX69D2q0NQu4Ugg1QAUGZSom13/aXuIakjwtofLhoiVAV/Q6LkySxkWlY5qs/kgb
 Aw9Ek/wrH7/JUMpkFNRBBIrdL7PyiVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765356950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=88qj7UpUpm29AgmPoNzNIhHRqnpnRY8JBV+f2vppG18=;
 b=WcDZ8ZpB8tZCg/5gfemp8fBPS/AgomNjI6Kf0vGzcUtjDZbmX9p67MVnT2mhFzaF2JRHPP
 y2an2ELio4tvTjBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B14DA3EA63;
 Wed, 10 Dec 2025 08:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nOzyKZY1OWmnMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Dec 2025 08:55:50 +0000
Content-Type: multipart/mixed; boundary="------------mK046Yku9LlBu3T02BDCk66J"
Message-ID: <a4243932-5878-4b37-b1f0-fb0c706ed1f2@suse.de>
Date: Wed, 10 Dec 2025 09:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
References: <9191ea89-81ce-4200-a356-39fa4a155062@suse.de>
 <A0A92AB8-FA61-4AAC-96C9-00BE93E3F6D6@exactco.de>
 <12407aa9-a084-46a1-98cb-9649e7f24098@suse.de>
 <20251209.131329.130523044849026405.rene@exactco.de>
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
In-Reply-To: <20251209.131329.130523044849026405.rene@exactco.de>
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+,1:+,2:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 MID_RHS_MATCH_FROM(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 xcode_sparc_t4_1:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.com:url]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: D8F2B5BDA7
X-Spam-Flag: NO
X-Spam-Score: -3.41
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

This is a multi-part message in MIME format.
--------------mK046Yku9LlBu3T02BDCk66J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 09.12.25 um 13:13 schrieb René Rebe:
> Hi,
>
> On Mon, 8 Dec 2025 09:44:23 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>>>> On the 2400-and-onwards models, ast could set
>>>> drm_device.mode_config.quirk_addfb_prefer_host_byte_order. If set, the
>>>> format lookup will select a different format on BE machines. [1] For
>>>> example requesting XRGB8888 returns BGRX8888 instead. If ast later
>>>> sees such a format in the atomic_update code, it could transparently
>>>> swap bytes when writing out pixels to the video memory.  IIRC this
>>>> works transparently to DRM clients and fbcon.  I think this would be
>>>> the preferred way of fixing the issue.
>>> Uff, I get better than nothing ;-)
>> Well, you can set the quirk in mode config. And then in
>> ast_handle_damage(), you'll require a switch for the big-endian
>> formats. [1]
>>
>> ast_handle_damage(...)
>> {
>>      ...
>>
>>      switch (fb->format->format) {
>>          default:
>>              drm_fb_memcyp()
>>              break;
>>          case DRM_FORMAT_BGRX8888:
>>          case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
>>              /* Swap bytes on big-endian formats */
>>              drm_fb_swab(dst, fb->pitches, src, fb, clip, false,
>> fmtcnv_state);
>>              break;
>>      }
>> }
>>
>> You can get that final argument fmtcnv_state from the DMR shadow-plane
>> state. [2]
>>
>> [1]
>> https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L549
>> [2]
>> https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L558
>>
>> Does that fix the color corruption?
> Following your suggestions conversion does not want to just work:
>
> root@XCODE_SPARC_T4_1:~# dmesg  | tail
> [  105.444761] ast 0000:0a:00.0: AST 2200 detected
> [  105.444947] ast 0000:0a:00.0: [drm] dram MCLK=266 Mhz type=2 bus_width=32
> [  105.444963] ast 0000:0a:00.0: [drm] Using analog VGA
> [  105.445470] [drm] Initialized ast 0.1.0 for 0000:0a:00.0 on minor 0
> [  105.673289] ast 0000:0a:00.0: [drm] format BX24 little-endian (0x34325842) not supported
> [  105.673302] ast 0000:0a:00.0: [drm] No compatible format found
> [  105.673348] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)
> [  105.901306] ast 0000:0a:00.0: [drm] format BX24 little-endian (0x34325842) not supported
> [  105.901319] ast 0000:0a:00.0: [drm] No compatible format found
> [  105.901350] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)

Oh well...

There's a very simple patch attach. Does it fix the problem?

Best regards
Thomas

>
> WIP w/ BIG_ENDIAN temp commented out to test the code-path on the
> otherwise function big-endian byte-swapping SPARC64 AST:
>
> diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
> index 2d3ad7610c2e..3f17aa263bdb 100644
> --- a/drivers/gpu/drm/ast/ast_cursor.c
> +++ b/drivers/gpu/drm/ast/ast_cursor.c
> @@ -227,6 +227,12 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
>   			}
>   			break;
>   		}
> +
> +#if 0 //def __BIG_ENDIAN
> +		/* Big-endian byte-swapping */
> +		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
> +#endif
> +
>   		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
>   		ast_set_cursor_base(ast, dst_off);
>   	}
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index cd08990a10f9..1065f481ec5f 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -526,12 +526,23 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>   
>   static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
>   			      struct drm_framebuffer *fb,
> -			      const struct drm_rect *clip)
> +			      const struct drm_rect *clip,
> +			      struct drm_format_conv_state *fmtcnv_state)
>   {
>   	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
>   
>   	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> -	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +
> +	switch (fb->format->format) {
> +	default:
> +		drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +		break;
> +	case DRM_FORMAT_BGRX8888:
> +	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
> +		/* Swap bytes on big-endian formats */
> +		drm_fb_swab(&dst, fb->pitches, src, fb, clip, false, fmtcnv_state);
> +		break;
> +	}
>   }
>   
>   static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
> @@ -557,11 +568,25 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
>   	}
>   
> +
>   	/* if the buffer comes from another device */
>   	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
> +#if 0 // def __BIG_ENDIAN
> +		/* Big-endian byte-swapping */
> +		switch (fb->format->format) {
> +		case DRM_FORMAT_RGB565:
> +			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE_16);
> +			break;
> +		case DRM_FORMAT_XRGB8888:
> +			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa2, 0x3f, AST_IO_VGACRA2_BE_MODE);
> +			break;
> +		}
> +#endif
> +
>   		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   		drm_atomic_for_each_plane_damage(&iter, &damage) {
> -			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
> +			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage,
> +					  &shadow_plane_state->fmtcnv_state);
>   		}
>   
>   		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> @@ -1020,6 +1045,11 @@ int ast_mode_config_init(struct ast_device *ast)
>   		dev->mode_config.max_height = 1200;
>   	}
>   
> +#ifdef __BIG_ENDIAN
> +	//if (ast->chip >= AST2400)
> +		dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
> +#endif
> +
>   	dev->mode_config.helper_private = &ast_mode_config_helper_funcs;
>   
>   	ret = ast_primary_plane_init(ast);
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 30578e3b07e4..4e11ece9fce7 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -34,6 +34,8 @@
>   #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
> +#define AST_IO_VGACRA2_BE_MODE		BIT(7)
> +#define AST_IO_VGACRA2_BE_MODE_16	(AST_IO_VGACRA2_BE_MODE | BIT(6))
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
>   #define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


--------------mK046Yku9LlBu3T02BDCk66J
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-swap-bytes-on-BE-machines.patch"
Content-Disposition: attachment;
 filename="0001-ast-swap-bytes-on-BE-machines.patch"
Content-Transfer-Encoding: base64

RnJvbSBlYTJjYmNhNzEyZDZlNmU1YjMxMTRiODlmYzQxZmU1MWE4Mzc2ODYyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCAxMCBEZWMgMjAyNSAwOTo1MjoyMyArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogc3dhcCBieXRlcyBvbiBCRSBtYWNoaW5lcwoKLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
b2RlLmMKaW5kZXggY2QwODk5MGExMGY5Li41N2M2ZmJjMzIzMmIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKQEAgLTUyNiwxMiArNTI2LDE4IEBAIHN0YXRpYyBpbnQgYXN0X3ByaW1h
cnlfcGxhbmVfaGVscGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwK
IAogc3RhdGljIHZvaWQgYXN0X2hhbmRsZV9kYW1hZ2Uoc3RydWN0IGFzdF9wbGFuZSAqYXN0
X3BsYW5lLCBzdHJ1Y3QgaW9zeXNfbWFwICpzcmMsCiAJCQkgICAgICBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwKLQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkK
KwkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCwKKwkJCSAgICAgIHN0cnVj
dCBkcm1fZm9ybWF0X2NvbnZfc3RhdGUgKmZtdGNudl9zdGF0ZSkKIHsKIAlzdHJ1Y3QgaW9z
eXNfbWFwIGRzdCA9IElPU1lTX01BUF9JTklUX1ZBRERSX0lPTUVNKGFzdF9wbGFuZV92YWRk
cihhc3RfcGxhbmUpKTsKIAogCWlvc3lzX21hcF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29m
ZnNldChmYi0+cGl0Y2hlc1swXSwgZmItPmZvcm1hdCwgY2xpcCkpOworCisjaWYgZGVmaW5l
ZChfX0JJR19FTkRJQU4pCisJZHJtX2ZiX3N3YWIoJmRzdCwgZmItPnBpdGNoZXMsIHNyYywg
ZmIsIGNsaXAsICFzcmNbMF0uaXNfaW9tZW0sIGZtdGNudl9zdGF0ZSk7CisjZWxzZQogCWRy
bV9mYl9tZW1jcHkoJmRzdCwgZmItPnBpdGNoZXMsIHNyYywgZmIsIGNsaXApOworI2VuZGlm
CiB9CiAKIHN0YXRpYyB2b2lkIGFzdF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBk
YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLApAQCAtNTYxLDcgKzU2Nyw4IEBAIHN0YXRp
YyB2b2lkIGFzdF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKHN0cnVjdCBk
cm1fcGxhbmUgKnBsYW5lLAogCWlmIChkcm1fZ2VtX2ZiX2JlZ2luX2NwdV9hY2Nlc3MoZmIs
IERNQV9GUk9NX0RFVklDRSkgPT0gMCkgewogCQlkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2Vf
aXRlcl9pbml0KCZpdGVyLCBvbGRfcGxhbmVfc3RhdGUsIHBsYW5lX3N0YXRlKTsKIAkJZHJt
X2F0b21pY19mb3JfZWFjaF9wbGFuZV9kYW1hZ2UoJml0ZXIsICZkYW1hZ2UpIHsKLQkJCWFz
dF9oYW5kbGVfZGFtYWdlKGFzdF9wbGFuZSwgc2hhZG93X3BsYW5lX3N0YXRlLT5kYXRhLCBm
YiwgJmRhbWFnZSk7CisJCQlhc3RfaGFuZGxlX2RhbWFnZShhc3RfcGxhbmUsIHNoYWRvd19w
bGFuZV9zdGF0ZS0+ZGF0YSwgZmIsICZkYW1hZ2UsCisJCQkJCSAgJnNoYWRvd19wbGFuZV9z
dGF0ZS0+Zm10Y252X3N0YXRlKTsKIAkJfQogCiAJCWRybV9nZW1fZmJfZW5kX2NwdV9hY2Nl
c3MoZmIsIERNQV9GUk9NX0RFVklDRSk7Ci0tIAoyLjUyLjAKCg==

--------------mK046Yku9LlBu3T02BDCk66J--
