Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EDB985CA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 08:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F02D10E11D;
	Wed, 24 Sep 2025 06:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Evrby7JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DW4gAodH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Evrby7JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DW4gAodH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132210E11D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:14:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 936C922091;
 Wed, 24 Sep 2025 06:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758694460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lPUmYKtSrf64sFK/B5EDnsD6H5h49EYj3T2v1Sipsy8=;
 b=Evrby7JOXOeIUdwwEkH3pT8Nw4r38FXS+9Q9ma0Zy7wjHEVmCdsuIFYYUnEunAltCL/x/i
 Uwl03/tDYRNk3h3rFx66vcO/vLWgQGdd6QWMEGplwI878gcymjM6ofnV3f5Tlgs1XTSksf
 x++4B3uAIR+BcxvEwkyYLS2p/eATKng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758694460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lPUmYKtSrf64sFK/B5EDnsD6H5h49EYj3T2v1Sipsy8=;
 b=DW4gAodHhFNTG/oBwDSju6E/KInHS+4E618OPCW8o+0iUdd5ZF/oxATLR3qGMwtERtgVKK
 7AWwHzBaG0SNtPCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758694460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lPUmYKtSrf64sFK/B5EDnsD6H5h49EYj3T2v1Sipsy8=;
 b=Evrby7JOXOeIUdwwEkH3pT8Nw4r38FXS+9Q9ma0Zy7wjHEVmCdsuIFYYUnEunAltCL/x/i
 Uwl03/tDYRNk3h3rFx66vcO/vLWgQGdd6QWMEGplwI878gcymjM6ofnV3f5Tlgs1XTSksf
 x++4B3uAIR+BcxvEwkyYLS2p/eATKng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758694460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lPUmYKtSrf64sFK/B5EDnsD6H5h49EYj3T2v1Sipsy8=;
 b=DW4gAodHhFNTG/oBwDSju6E/KInHS+4E618OPCW8o+0iUdd5ZF/oxATLR3qGMwtERtgVKK
 7AWwHzBaG0SNtPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3197613647;
 Wed, 24 Sep 2025 06:14:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8sAmCjyM02hHVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 24 Sep 2025 06:14:20 +0000
Message-ID: <a4b677f1-9c30-426b-bead-bebf19f099f5@suse.de>
Date: Wed, 24 Sep 2025 08:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250922: xe_device_sysfs.c:300:25: error: label 'cleanup'
 used but not defined
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Ben Copeland <benjamin.copeland@linaro.org>
References: <CA+G9fYuZZUQq=7qPavXnHZtX9oQ=amfYVeYRZu3SHfD0ReD6nQ@mail.gmail.com>
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
In-Reply-To: <CA+G9fYuZZUQq=7qPavXnHZtX9oQ=amfYVeYRZu3SHfD0ReD6nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 23.09.25 um 11:51 schrieb Naresh Kamboju:
> The arm64 and x86_64 builds failed on the Linux next-20250922 tag build due
> to following build warnings / errors with gcc and clang toolchain.
>
> First seen on next-20250922
> Good: next-20250919
> Bad: next-20250922
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Test regression: next-20250922: xe_device_sysfs.c:300:25: error: label
> 'cleanup' used but not defined
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build error
> drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
> drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup'
> used but not defined
>    300 |                         goto cleanup;
>        |                         ^~~~

There's been a merge conflict within this code. drm-tip [1] contains a 
working version.

[1] 
https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_device_sysfs.c?ref_type=heads#L300

Best regards
Thomas

>
> ## Source
> * Kernel version: 6.17.0-rc7
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: 6.17.0-rc6-next-20250922
> * Git commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
> * Architectures: arm64, x86_64
> * Toolchains: gcc-13 and clang-20
> * Kconfigs: allyesconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29968978/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250922/log-parser-build-gcc/gcc-compiler-drivers_gpu_drm_xe_xe_device_sysfs_c-error-label-cleanup-used-but-not-defined/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/config
>
> --
> Linaro LKFT

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


