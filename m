Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE16B337FB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607AB10E3EC;
	Mon, 25 Aug 2025 07:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SJ4aDrtg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lPQ1wO40";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KXo5Fj2W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VRa84Bg+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB910E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:40:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3E56211F5;
 Mon, 25 Aug 2025 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756107655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CrXs71rS6n9RGS4r0t0K3B7fNTdcgXj7C+tduoQYygs=;
 b=SJ4aDrtgMqDZ6jRWPP2oa2DjxYD19sLRAuK8L0z2LVSYGcAkKgP6vlANzXcz8k66oG/a9M
 P8NzBfxuZ8BGpq4s8EFX5vgcA2TtlbVZZAGi6ClXhKofnlYzGXtPEdUUKbskkbGY6Lwnh7
 qEAumJKkhstDs2z3obo1ZqwLhEpEdvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756107655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CrXs71rS6n9RGS4r0t0K3B7fNTdcgXj7C+tduoQYygs=;
 b=lPQ1wO40+Ge9igiE7wClk1bdbB8JBpC3XZ7L1ZK9l7lxu8oYB3Tf0zarpMJIR1MB/8rE8s
 qxN4RHSZ306nCMCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KXo5Fj2W;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VRa84Bg+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756107654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CrXs71rS6n9RGS4r0t0K3B7fNTdcgXj7C+tduoQYygs=;
 b=KXo5Fj2WzInSiRNZaGvAoIaoLLSaR3T+Rml8gWx/LH3GueQAaUlHXfINQNGVwYHW9c0jrG
 wAPaDtuNVPa3J5vnzsNOLUFy4gipnIWNj9dpUxT3qk9BoV4UW67oygEXIUklphKy9XwINR
 gYsjP8xIYM6bmQPGLU2/4B4qYvh+izs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756107654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CrXs71rS6n9RGS4r0t0K3B7fNTdcgXj7C+tduoQYygs=;
 b=VRa84Bg+LxkK6dIoCB8pryKXze9M3Tit3b2kVNU3ZJP+JeEwA3lsw2V6t8JuL+Yaok1696
 kfyH+63nhP3jCNBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D0341368F;
 Mon, 25 Aug 2025 07:40:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pb9OGoQTrGiPNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Aug 2025 07:40:52 +0000
Message-ID: <f78cf9e0-6ce2-4366-9dfc-670b9e03d0c0@suse.de>
Date: Mon, 25 Aug 2025 09:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum
 ast_dram_layout
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <202508240748.TUAvbluX-lkp@intel.com>
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
In-Reply-To: <202508240748.TUAvbluX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D3E56211F5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linaro.org,lists.linux.dev,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
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

Am 25.08.25 um 09:26 schrieb Dan Carpenter:
> Hi Thomas,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-ast-Do-not-print-DRAM-info/20250822-213333
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
> patch link:    https://lore.kernel.org/r/20250822132846.25376-7-tzimmermann%40suse.de
> patch subject: [PATCH 6/6] drm/ast: Put AST_DRAM_ constants into enum ast_dram_layout
> config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240748.TUAvbluX-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508240748.TUAvbluX-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/ast/ast_2100.c:63 ast_2100_get_dram_layout_p2a() error: uninitialized symbol 'dram_layout'.
>
> vim +/dram_layout +63 drivers/gpu/drm/ast/ast_2100.c
>
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  38  static enum ast_dram_layout ast_2100_get_dram_layout_p2a(struct ast_device *ast)
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  39  {
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  40  	u32 mcr_cfg;
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  41  	enum ast_dram_layout dram_layout;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  42
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  43  	ast_write32(ast, 0xf004, 0x1e6e0000);
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  44  	ast_write32(ast, 0xf000, 0x1);
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  45  	mcr_cfg = ast_read32(ast, 0x10004);
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  46
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  47  	switch (mcr_cfg & 0x0c) {
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  48  	case 0:
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  49  	case 4:
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  50  		dram_layout = AST_DRAM_512Mx16;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  51  		break;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  52  	case 8:
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  53  		if (mcr_cfg & 0x40)
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  54  			dram_layout = AST_DRAM_1Gx16;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  55  		else
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  56  			dram_layout = AST_DRAM_512Mx32;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  57  		break;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  58  	case 0xc:
> 334d62edac4c5b Thomas Zimmermann 2025-08-22  59  		dram_layout = AST_DRAM_1Gx32;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  60  		break;
>
> Should there be a default case?

Thanks for reporting. That only happens now with the values being an 
enum type. The first case (512Mx16) would be the default. Will be fixed 
in the next iteration.

Best regards
Thomas

>
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  61  	}
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  62
> 334d62edac4c5b Thomas Zimmermann 2025-08-22 @63  	return dram_layout;
> b59465efc7cb88 Thomas Zimmermann 2025-08-22  64  }
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


