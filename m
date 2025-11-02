Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C4C28E6C
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 12:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5D110E0BC;
	Sun,  2 Nov 2025 11:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ulDejbNT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOs+pFiA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ulDejbNT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOs+pFiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6023910E090
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 11:44:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77B4121976;
 Sun,  2 Nov 2025 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762083875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3rpRjFNk7I3yO3U+i+VbM9SsYbCLJkYa7H2rvdyHJnc=;
 b=ulDejbNT/docWm1ktehOhuANLJeqi4HTN3EAO4UmVZ2ZS70Ay3lM2kbZwAzbP2MxxHQQDm
 H4j5U750sQiOftxPWgoypD47O2kSDSsS6CvIdTZK+zGL3r+i+Ea0Aaecy0sGhkslpeduCN
 cqe3I0oz87yfDe56DeFrX4monyJzYsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762083875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3rpRjFNk7I3yO3U+i+VbM9SsYbCLJkYa7H2rvdyHJnc=;
 b=JOs+pFiAYTBy7RGFlT4BVjnQvVx22DLgDoi6Ek+MTIUz8SqMr7P8h2MjWkSTDeoiCiw/aI
 Qz+5S6CIKRkDcqDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ulDejbNT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JOs+pFiA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762083875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3rpRjFNk7I3yO3U+i+VbM9SsYbCLJkYa7H2rvdyHJnc=;
 b=ulDejbNT/docWm1ktehOhuANLJeqi4HTN3EAO4UmVZ2ZS70Ay3lM2kbZwAzbP2MxxHQQDm
 H4j5U750sQiOftxPWgoypD47O2kSDSsS6CvIdTZK+zGL3r+i+Ea0Aaecy0sGhkslpeduCN
 cqe3I0oz87yfDe56DeFrX4monyJzYsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762083875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3rpRjFNk7I3yO3U+i+VbM9SsYbCLJkYa7H2rvdyHJnc=;
 b=JOs+pFiAYTBy7RGFlT4BVjnQvVx22DLgDoi6Ek+MTIUz8SqMr7P8h2MjWkSTDeoiCiw/aI
 Qz+5S6CIKRkDcqDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 36B28136C7;
 Sun,  2 Nov 2025 11:44:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mG7uCyNEB2mGWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 02 Nov 2025 11:44:35 +0000
Message-ID: <9c67c29b-06e9-469b-9273-eaac368632d6@suse.de>
Date: Sun, 2 Nov 2025 12:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm: replace drm_print.h includes from headers
 with a forward declaration
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@redhat.com>, simona.vetter@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <cover.1761734313.git.jani.nikula@intel.com>
 <41bb4163-8f5b-47c5-8121-7010147bc5e6@suse.de>
 <b8cc203c44518822197023c2dbf4a21aad681a4c@intel.com>
 <c4e3b172-3df8-4d1b-a1b0-51cacae56f0c@suse.de>
 <18ad4c11261b85614f7e3a2aabe611f2ecbf16a5@intel.com>
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
In-Reply-To: <18ad4c11261b85614f7e3a2aabe611f2ecbf16a5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 77B4121976
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 31.10.25 um 11:01 schrieb Jani Nikula:
> On Thu, 30 Oct 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Am 30.10.25 um 10:31 schrieb Jani Nikula:
>>> Considering that this touches a lot of drivers, albeit just the include
>>> lists and thus highly unlikely to cause functional changes or hard
>>> conflicts, can I go ahead and merge this to drm-misc-next?
>> Of course, go ahead.
> Done, thanks again!

Looks like fallout from this series:


   CC [M]  drivers/gpu/drm/rockchip/rockchip_drm_vop2.o
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'vop2_convert_format':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:215:17: error: 
implicit declaration of function 'DRM_ERROR'; did you mean 'SO_ERROR'? 
[-Wimplicit-function-declaration]
   215 |                 DRM_ERROR("unsupported format[%08x]\n", format);
       |                 ^~~~~~~~~
       |                 SO_ERROR
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'rockchip_vop2_mod_supported':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:395:33: error: 
implicit declaration of function 'drm_dbg_kms' 
[-Wimplicit-function-declaration]
   395 |                                 drm_dbg_kms(vop2->drm,
       |                                 ^~~~~~~~~~~
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'vop2_setup_scale':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:602:25: error: 
implicit declaration of function 'drm_dbg'; did you mean 'dev_dbg'? 
[-Wimplicit-function-declaration]
   602 |                         drm_dbg(vop2->drm, "%s dst_w[%d] should 
align as 2 pixel\n",
       |                         ^~~~~~~
       |                         dev_dbg
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'vop2_core_clks_prepare_enable':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:763:17: error: 
implicit declaration of function 'drm_err'; did you mean 'pr_err'? 
[-Wimplicit-function-declaration]
   763 |                 drm_err(vop2->drm, "failed to enable hclk - 
%d\n", ret);
       |                 ^~~~~~~
       |                 pr_err
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'vop2_crtc_atomic_disable':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:967:17: error: 
implicit declaration of function 'drm_info'; did you mean 'pr_info'? 
[-Wimplicit-function-declaration]
   967 |                 drm_info(vop2->drm, "wait for vp%d dsp_hold 
timeout\n", vp->id);
       |                 ^~~~~~~~
       |                 pr_info
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'vop2_crtc_atomic_enable':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1758:41: error: 
implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? 
[-Wimplicit-function-declaration]
  1758 |  drm_warn(vop2->drm,
       |                                         ^~~~~~~~
       |                                         dev_warn
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c: In function 
'rk3576_vp_isr':
linux/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2198:17: error: 
implicit declaration of function 'drm_err_ratelimited'; did you mean 
'pr_err_ratelimited'? [-Wimplicit-function-declaration]
  2198 |                 drm_err_ratelimited(vop2->drm, "POST_BUF_EMPTY 
irq err at vp%d\n", vp->id);
       |                 ^~~~~~~~~~~~~~~~~~~
       |                 pr_err_ratelimited


Best regards
Thomas

>
> BR,
> Jani.
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


