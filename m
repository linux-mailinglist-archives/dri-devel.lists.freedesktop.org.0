Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7199DEA5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 08:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0611A10E504;
	Tue, 15 Oct 2024 06:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nH0hT9yl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kjNxbJfI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ARUMLGw1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qhWduwB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12F710E504
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 06:43:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC32921C94;
 Tue, 15 Oct 2024 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728974626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OdTBIW7f+j9B4+2XAjBRb8JDYu9AbT2aLwrZYRVzlLg=;
 b=nH0hT9ylrgBU8bV3/5eA6/OtjzZ2vDlJYNTz0I/xniNgRevnZ6nDiZ2fNpLSKQl2bIK/x/
 P7jRHiFvxA5QsxRW9Bh5oQX2H+tGi/nDcZzK44VfDjhY3Ftasw4rqFBqPYpbp1bV1oHIrh
 FKsyltbLoP2HZgUNDbrllCRI4YqsGI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728974626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OdTBIW7f+j9B4+2XAjBRb8JDYu9AbT2aLwrZYRVzlLg=;
 b=kjNxbJfI2tDzc3P0fuixz301U+s3iicdhg+MJx7w4aQXikB/NZ33RgGT8ThhmjYGuTKbw8
 OtsakaanjAf1PxAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ARUMLGw1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="qhWduwB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728974625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OdTBIW7f+j9B4+2XAjBRb8JDYu9AbT2aLwrZYRVzlLg=;
 b=ARUMLGw17vCqf1lYbEHEnRN4KUEDz8gSZQBf2YmjqBhA7FQmHS44NuR2s9t00XADe4/ShX
 e14om/bGnrBqvQ+61E1u6I0Th+aP1hQrYKEi+IkonCTYZCWIUDwpInjVG2YuQdg7qosPyo
 xR8j+3Y92V5A2YcovG6z2BsYk4IxShs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728974625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OdTBIW7f+j9B4+2XAjBRb8JDYu9AbT2aLwrZYRVzlLg=;
 b=qhWduwB/Djk3MwSd2udCehl5Gy2MkGlnQ24z1ZqUa+vD4yFKhWbwKfmv7OgsAkc5X4Kk1S
 C2WOhC0VpbPGlpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF1A513A42;
 Tue, 15 Oct 2024 06:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /tMWKSEPDmcMbwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Oct 2024 06:43:45 +0000
Message-ID: <c6ace627-553d-4aef-ad61-fb21efbc5e9a@suse.de>
Date: Tue, 15 Oct 2024 08:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [drm/ast] 4e29cc7c5c:
 WARNING:at_drivers/gpu/drm/ast/ast_dp.c:#ast_dp_set_enable[ast]
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <202410151028.f9a3ee37-lkp@intel.com>
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
In-Reply-To: <202410151028.f9a3ee37-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DC32921C94
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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



Am 15.10.24 um 04:44 schrieb kernel test robot:
>
> Hello,
>
> kernel test robot noticed "WARNING:at_drivers/gpu/drm/ast/ast_dp.c:#ast_dp_set_enable[ast]" on:
>
> commit: 4e29cc7c5c673299cfbaf4982fc8b6a72c9f706f ("drm/ast: astdp: Replace ast_dp_set_on_off()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master d61a00525464bfc5fe92c6ad713350988e492b88]
>
> in testcase: lkvs
> version: lkvs-x86_64-8e3b482-1_20241008
> with following parameters:
>
> 	test: rapl-server
>
>
>
> config: x86_64-rhel-8.3-func
> compiler: gcc-12
> test machine: 384 threads 4 sockets GENUINE INTEL(R) XEON(R) (Granite Rapids) with 128G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410151028.f9a3ee37-lkp@intel.com
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241015/202410151028.f9a3ee37-lkp@intel.com
>
>
>
> kern  :err   : [  234.161306] ast 0000:2d:00.0: [drm] *ERROR* Link training failed
> kern  :warn  : [  234.375338] ------------[ cut here ]------------
> kern  :warn  : [  234.375347] ast 0000:2d:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
> kern  :warn  : [  234.375489] WARNING: CPU: 0 PID: 8 at drivers/gpu/drm/ast/ast_dp.c:221 ast_dp_set_enable+0x153/0x1c0 [ast]

That's a HW issue. Aspeed isn't 100% DP compatible and therefore not all 
displays work. The link training happens internally in firmware; all we 
see is a status bit with the result.

> kern  :warn  : [  234.375541] Modules linked in: intel_uncore_frequency_tpmi ast(+) nvme intel_uncore_frequency_common intel_cstate intel_vsec_tpmi drm_shmem_helper intel_uncore dax_hmem drm_kms_helper qat_4xxx intel_th_gth nvme_core intel_qat dh_generic idxd intel_th_pci crc8 i2c_i801 intel_vsec i2c_smbus intel_th authenc idxd_bus wmi ipmi_ssif joydev acpi_ipmi ipmi_si ipmi_devintf ipmi_msghandler binfmt_misc loop fuse drm dm_mod ip_tables
> kern  :warn  : [  234.375610] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.11.0-rc7-01434-g4e29cc7c5c67 #1
> kern  :warn  : [  234.375622] Workqueue: events work_for_cpu_fn
> kern  :warn  : [  234.375657] RIP: 0010:ast_dp_set_enable+0x153/0x1c0 [ast]
> kern  :warn  : [  234.375667] Code: 48 8b 6b 50 48 85 ed 74 32 48 89 df e8 f6 73 1f bd 48 c7 c1 20 e4 80 c5 48 89 ea 48 c7 c7 80 e4 80 c5 48 89 c6 e8 6d a2 9e bb <0f> 0b 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 b8 00 00 00
> kern  :warn  : [  234.375675] RSP: 0018:ffa0000000f87480 EFLAGS: 00010286
> kern  :warn  : [  234.375684] RAX: 0000000000000000 RBX: ff110910893960c8 RCX: 0000000000000027
> kern  :warn  : [  234.375687] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ff1100081d030b08
> kern  :warn  : [  234.375692] RBP: ff110910898e8e40 R08: 0000000000000001 R09: ffe21c0103a06161
> kern  :warn  : [  234.375696] R10: ff1100081d030b0b R11: 0000000000000016 R12: 0000000000000010
> kern  :warn  : [  234.375699] R13: ff11000171490000 R14: ffe21c002e2920c4 R15: ff11000171490620
> kern  :warn  : [  234.375702] FS:  0000000000000000(0000) GS:ff1100081d000000(0000) knlGS:0000000000000000
> kern  :warn  : [  234.375706] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kern  :warn  : [  234.375708] CR2: 00007f5f08e5e423 CR3: 000000017b5a2002 CR4: 0000000000f71ef0
> kern  :warn  : [  234.375710] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> kern  :warn  : [  234.375712] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> kern  :warn  : [  234.375714] PKRU: 55555554
> kern  :warn  : [  234.375716] Call Trace:
> kern  :warn  : [  234.375722]  <TASK>
> kern  :warn  : [  234.375727]  ? __warn+0xcc/0x260
> kern  :warn  : [  234.375740]  ? ast_dp_set_enable+0x153/0x1c0 [ast]
> kern  :warn  : [  234.375749]  ? report_bug+0x261/0x2c0
> kern  :warn  : [  234.375772]  ? handle_bug+0x3c/0x70
> kern  :warn  : [  234.375789]  ? exc_invalid_op+0x17/0x40
> kern  :warn  : [  234.375793]  ? asm_exc_invalid_op+0x1a/0x20
> kern  :warn  : [  234.375813]  ? ast_dp_set_enable+0x153/0x1c0 [ast]
> kern  :warn  : [  234.375822]  ast_astdp_encoder_helper_atomic_enable+0x215/0x280 [ast]
> kern  :warn  : [  234.375831]  ? __pfx_ast_astdp_encoder_helper_atomic_enable+0x10/0x10 [ast]
> kern  :warn  : [  234.375841]  drm_atomic_helper_commit_modeset_enables+0x52a/0xb20 [drm_kms_helper]
> kern  :warn  : [  234.375891]  ? drm_atomic_helper_wait_for_dependencies+0x45f/0x7d0 [drm_kms_helper]
> kern  :warn  : [  234.375912]  drm_atomic_helper_commit_tail+0x72/0xd0 [drm_kms_helper]
> kern  :warn  : [  234.375934]  ast_mode_config_helper_atomic_commit_tail+0x44/0x60 [ast]
> kern  :warn  : [  234.375945]  commit_tail+0x227/0x4b0 [drm_kms_helper]
> kern  :warn  : [  234.375969]  drm_atomic_helper_commit+0x1ff/0x280 [drm_kms_helper]
> kern  :warn  : [  234.375991]  ? __pfx_drm_atomic_helper_commit+0x10/0x10 [drm_kms_helper]
> kern  :warn  : [  234.376014]  drm_atomic_commit+0x1ec/0x2b0 [drm]
> kern  :warn  : [  234.376114]  ? __drm_atomic_helper_set_config+0x49f/0x6c0 [drm]
> kern  :warn  : [  234.376164]  ? __pfx_drm_atomic_commit+0x10/0x10 [drm]
> kern  :warn  : [  234.376214]  ? __pfx___drm_atomic_helper_set_config+0x10/0x10 [drm]
> kern  :warn  : [  234.376263]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> kern  :warn  : [  234.376350]  ? drm_atomic_set_fb_for_plane+0x1bf/0x280 [drm]
> kern  :warn  : [  234.376404]  drm_client_modeset_commit_atomic+0x528/0x680 [drm]
> kern  :warn  : [  234.376460]  ? __pfx_drm_client_modeset_commit_atomic+0x10/0x10 [drm]
> kern  :warn  : [  234.376517]  ? __pfx___might_resched+0x10/0x10
> kern  :warn  : [  234.376534]  ? __pfx_mutex_lock+0x10/0x10
> kern  :warn  : [  234.376552]  ? __pfx_mutex_lock+0x10/0x10
> kern  :warn  : [  234.376556]  drm_client_modeset_commit_locked+0x125/0x440 [drm]
> kern  :warn  : [  234.376616]  drm_client_modeset_commit+0x3c/0x60 [drm]
> kern  :warn  : [  234.376671]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xd5/0x120 [drm_kms_helper]
> kern  :warn  : [  234.376693]  drm_fb_helper_set_par+0xae/0xe0 [drm_kms_helper]
> kern  :warn  : [  234.376719]  fbcon_init+0x77d/0x1760
> kern  :warn  : [  234.376742]  visual_init+0x2ff/0x5e0
> kern  :warn  : [  234.376771]  do_bind_con_driver+0x4b3/0xb50
> kern  :warn  : [  234.376783]  ? do_register_con_driver+0x3ab/0x5b0
> kern  :warn  : [  234.376788]  ? _raw_spin_lock_irqsave+0x8b/0xf0
> kern  :warn  : [  234.376797]  do_take_over_console+0x37/0x50
> kern  :warn  : [  234.376801]  do_fbcon_takeover+0xaa/0x1b0
> kern  :warn  : [  234.376805]  fbcon_fb_registered+0x23/0x80
> kern  :warn  : [  234.376809]  do_register_framebuffer+0x39d/0x710
> kern  :warn  : [  234.376821]  ? __pfx_do_register_framebuffer+0x10/0x10
> kern  :warn  : [  234.376824]  ? __pfx_mutex_lock+0x10/0x10
> kern  :warn  : [  234.376827]  ? __pfx_mutex_unlock+0x10/0x10
> kern  :warn  : [  234.376831]  register_framebuffer+0x21/0x40
> kern  :warn  : [  234.376834]  __drm_fb_helper_initial_config_and_unlock+0x173/0x3e0 [drm_kms_helper]
> kern  :warn  : [  234.376858]  drm_fbdev_shmem_client_hotplug+0x161/0x220 [drm_shmem_helper]
> kern  :warn  : [  234.376872]  drm_client_register+0x168/0x240 [drm]
> kern  :warn  : [  234.376927]  ast_pci_probe+0x2f9/0x4b0 [ast]
> kern  :warn  : [  234.376941]  ? __pfx_ast_pci_probe+0x10/0x10 [ast]
> kern  :warn  : [  234.376950]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> kern  :warn  : [  234.376956]  ? __schedule+0x7ec/0x1950
> kern  :warn  : [  234.376972]  ? __pfx_ast_pci_probe+0x10/0x10 [ast]
> kern  :warn  : [  234.376979]  local_pci_probe+0xda/0x190
> kern  :warn  : [  234.376999]  ? __pfx_local_pci_probe+0x10/0x10
> kern  :warn  : [  234.377002]  work_for_cpu_fn+0x52/0xa0
> kern  :warn  : [  234.377006]  process_one_work+0x676/0x1000
> kern  :warn  : [  234.377021]  worker_thread+0x714/0xf10
> kern  :warn  : [  234.377024]  ? __pfx_worker_thread+0x10/0x10
> kern  :warn  : [  234.377027]  kthread+0x2d8/0x3c0
> kern  :warn  : [  234.377041]  ? __pfx_kthread+0x10/0x10
> kern  :warn  : [  234.377044]  ret_from_fork+0x31/0x70
> kern  :warn  : [  234.377063]  ? __pfx_kthread+0x10/0x10
> kern  :warn  : [  234.377066]  ret_from_fork_asm+0x1a/0x30
> kern  :warn  : [  234.377080]  </TASK>
> kern  :warn  : [  234.377084] ---[ end trace 0000000000000000 ]---
> kern  :info  : [  234.377496] Console: switching to colour frame buffer device 80x30
> kern  :info  : [  235.421603] ast 0000:2d:00.0: [drm] fb0: astdrmfb frame buffer device
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

