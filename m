Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7039169F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B865A10E655;
	Tue, 25 Jun 2024 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ydP0TQ/G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZPj1vUVL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mpove98n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lIb7qUGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38D810E655
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:14:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1629219A3;
 Tue, 25 Jun 2024 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719324881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=24k5i67hRgymQTObx7I9vnlLhjMkfOViIjbcxV4j27M=;
 b=ydP0TQ/GvL8gg00yOf+T9Mi0F5lsuItJ7CtOhe6WcWzs6T8CfpcM2DtCrRAQHV5Zt2Rh/r
 /NoY3xsTiPB86Tl4gxCFSuCZI8gVAO9IAeFS1iXL19AqHGZeFr/E95JZ2NkgXhnT3Lkclq
 FbuiyuprZH34Cj3X5i7tzseKOXlp1C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719324881;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=24k5i67hRgymQTObx7I9vnlLhjMkfOViIjbcxV4j27M=;
 b=ZPj1vUVLnT2kqRlz4N2IrEz+jZ6VsN3+vQMQCcaNTTtcvfE7n49U7zNc/itpvF3HX9pdkt
 hI0AEO9C3y0r/hCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mpove98n;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lIb7qUGt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719324880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=24k5i67hRgymQTObx7I9vnlLhjMkfOViIjbcxV4j27M=;
 b=mpove98nPt0ZKaeq0ZARv8PyOqKkzmBjt2KadMpXCIKVrcA+kBVNujoGGiR+9HwOv/sCJf
 DCN1QWIAss8D1Vy1QvYsDFM/npqhHLLsDkrKj7mfFzbsDIZIr7IiAOQxFUZ/N+s3qeIN1s
 BV4SD0fPGklo61SVUnOfw5GsWtHznyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719324880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=24k5i67hRgymQTObx7I9vnlLhjMkfOViIjbcxV4j27M=;
 b=lIb7qUGtxrAnQEvu0Twj250p0HP1TA3JvYR+DN7uAfpoMvclvTZfoA1YD4SjfOsnmFkMU2
 fx7n1/mdIc1OHiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A506B13A9A;
 Tue, 25 Jun 2024 14:14:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KpL8JtDQemaEKAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jun 2024 14:14:40 +0000
Message-ID: <cbe57a4a-de59-42d1-882f-f66cbd09ecf2@suse.de>
Date: Tue, 25 Jun 2024 16:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/fb-helper: Don't schedule_work() to flush frame
 buffer during panic()
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com, yudong.wang@intel.com
References: <20240531074521.30406-1-qiuxu.zhuo@intel.com>
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
In-Reply-To: <20240531074521.30406-1-qiuxu.zhuo@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F1629219A3
X-Spam-Score: -4.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,intel.com:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Am 31.05.24 um 09:45 schrieb Qiuxu Zhuo:
> Sometimes the system [1] hangs on x86 I/O machine checks. However, the
> expected behavior is to reboot the system, as the machine check handler
> ultimately triggers a panic(), initiating a reboot in the last step.
>
> The root cause is that sometimes the panic() is blocked when
> drm_fb_helper_damage() invoking schedule_work() to flush the frame buffer.
> This occurs during the process of flushing all messages to the frame
> buffer driver as shown in the following call trace:
>
>    Machine check occurs [2]:
>      panic()
>        console_flush_on_panic()
>          console_flush_all()
>            console_emit_next_record()
>              con->write()
>                vt_console_print()
>                  hide_cursor()
>                    vc->vc_sw->con_cursor()
>                      fbcon_cursor()
>                        ops->cursor()
>                          bit_cursor()
>                            soft_cursor()
>                              info->fbops->fb_imageblit()
>                                drm_fbdev_generic_defio_imageblit()
>                                  drm_fb_helper_damage_area()
>                                    drm_fb_helper_damage()
>                                      schedule_work() // <--- blocked here
>      ...
>      emergency_restart()  // wasn't invoked, so no reboot.
>
> During panic(), except the panic CPU, all the other CPUs are stopped.
> In schedule_work(), the panic CPU requires the lock of worker_pool to
> queue the work on that pool, while the lock may have been token by some
> other stopped CPU. So schedule_work() is blocked.
>
> Additionally, during a panic(), since there is no opportunity to execute
> any scheduled work, it's safe to fix this issue by skipping schedule_work()
> on 'oops_in_progress' in drm_fb_helper_damage().
>
> [1] Enable the kernel option CONFIG_FRAMEBUFFER_CONSOLE,
>      CONFIG_DRM_FBDEV_EMULATION, and boot with the 'console=tty0'
>      kernel command line parameter.
>
> [2] Set 'panic_timeout' to a non-zero value before calling panic().
>
> Reported-by: Yudong Wang <yudong.wang@intel.com>
> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_fb_helper.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d612133e2cf7..6d7b6f038821 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -628,6 +628,9 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
>   static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
>   				 u32 width, u32 height)
>   {
> +	if (oops_in_progress)
> +		return;
> +
>   	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
>   
>   	schedule_work(&helper->damage_work);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

