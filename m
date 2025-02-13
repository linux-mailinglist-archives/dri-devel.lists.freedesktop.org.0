Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211AA3395F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 08:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB0A10EA1E;
	Thu, 13 Feb 2025 07:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="a7mSCrqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rnsdqvtq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a7mSCrqz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Rnsdqvtq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F9B10EA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:57:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B79D22A46;
 Thu, 13 Feb 2025 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739433454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l64wye6SggNBhfX1dIvY42n1nqPIDcrBOBmwvGtFeqA=;
 b=a7mSCrqzaJJKzwkheiVYHKkIMNuHnG7SZm9H6nNij0+FMIJgQT8WvSKK5L45tprIl4O8q5
 YgDTqRnGs4/li0YOAN8m5F9W5m3xEw2EUBFEtmtwLmmKi3KtoiB2KmG10c/MQ7aXSwvMps
 hjH6YT6MIyNtxCRJxccZ5tkP6iGZ0s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739433454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l64wye6SggNBhfX1dIvY42n1nqPIDcrBOBmwvGtFeqA=;
 b=RnsdqvtqooGxfTt3e14Bo12x6x8ikJu7lzJjpAkra7JhVMpZm5taa8iVW48pkqEzKwYNao
 KZeoI1s6feNh/ECg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a7mSCrqz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Rnsdqvtq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739433454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l64wye6SggNBhfX1dIvY42n1nqPIDcrBOBmwvGtFeqA=;
 b=a7mSCrqzaJJKzwkheiVYHKkIMNuHnG7SZm9H6nNij0+FMIJgQT8WvSKK5L45tprIl4O8q5
 YgDTqRnGs4/li0YOAN8m5F9W5m3xEw2EUBFEtmtwLmmKi3KtoiB2KmG10c/MQ7aXSwvMps
 hjH6YT6MIyNtxCRJxccZ5tkP6iGZ0s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739433454;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l64wye6SggNBhfX1dIvY42n1nqPIDcrBOBmwvGtFeqA=;
 b=RnsdqvtqooGxfTt3e14Bo12x6x8ikJu7lzJjpAkra7JhVMpZm5taa8iVW48pkqEzKwYNao
 KZeoI1s6feNh/ECg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DA1613874;
 Thu, 13 Feb 2025 07:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id o64EAu6lrWc5YwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 07:57:34 +0000
Message-ID: <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
Date: Thu, 13 Feb 2025 08:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Nicolas Baranger <nicolas.baranger@3xo.fr>, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
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
In-Reply-To: <194c4656963debcf074d87e89ab1a829@3xo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4B79D22A46
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
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

Hi Nicolas

Am 12.02.25 um 19:58 schrieb Nicolas Baranger:
> Dear maintener

That's mostly me and Jocelyn.

>
> I did include ast-drm driver version 1.15.1 (in replacement of version 
> 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
> dkms patch
>
> Last DKMS patch had been sucessfully tested on mainline.
> And last ast.ko version 1.15.1 included in linux tree had also been 
> sucessfully tested
>
> Online directory is updated with :
> - new DKMS patch
> - new DKMS srouces
> - new DKMS debian package
> - new tarball of mainline included ast_new ported in kernel tree
> - new kernel debian package (mainline with ast_new)
>
>
> NB: online directory is here: 
> https://xba.soartist.net/ast-drm_nba_20250211/
>
> Please let me know what I should do to see this change in linux-next

I'm having a little trouble with figuring out which of the many driver 
sources is the relevant one. Am I correct to assume it's the one at

https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/


About that driver: Although the official driver reports an ancient 
version number, it is an up-to-date driver. It is actually more 
up-to-date than Aspeed's package. Both drivers share source code and a 
few years ago there was an effort to bring the kernel's driver up to the 
same feature set. Since then, the kernel's driver has been updated, 
reworked and improved.

About the performance: From what I can tell, the only significant 
difference in these drivers is memory management. Your ast_new driver 
uses an older algorithm that we replaced quite a few releases ago. The 
old version was unreliable on systems with little video memory, so we 
had to replace it.  I don't know why the new code should be slower though.

If I give you a patch against a recent Linux kernel, are you capable of 
building the patched kernel and testing that change on your system?

Best regards
Thomas


>
> Thanks for help
>
> Kind regards
> Nicolas Baranger
>
>
> Le 2025-02-11 19:15, Nicolas Baranger a écrit :
>
>> Dear maintener
>>
>> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
>> driver on mainline kernel (6.13.0 + 6.13.1).
>>
>> ASPEED video driver is availiable here:
>> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
>>
>> But it only work for LTS kernel
>> So I modify the DKMS package and I build a new Debian DKMS package 
>> with the adapted  source.
>> My patch can be find here :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
>> See the README:
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
>>
>> Using this new 'ast 1.15.1' driver, performance are amazing compared 
>> to the 'ast' driver include in kernel tree, specially when using a 
>> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card 
>> as the main video card and as the main and only video output (the 
>> discrete GPU is used only for offloading 3D or for cuda/opencl)
>>
>> So to make things easier, I include the new 'ast 1.15.1' driver in 
>> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
>> It's working fine as you can see on this video :
>> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 
>>
>>
>> I upload all the work I've done here :
>> https://xba.soartist.net/ast-drm_nba_20250211/
>>
>> See the global README :
>> https://xba.soartist.net/ast-drm_nba_20250211/README
>>
>> and the README in nba-kernel sub-directory :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
>>
>> I'm not a developer so please let me know if I made the things the 
>> right way and if this new 'ast 1.15.1' driver can be ported to 
>> linux-next or linux-? ?
>> If you need more explanations, do not hesitate to contact me, I would 
>> be happy to help
>>
>> Kind regards
>> Nicolas Baranger

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

