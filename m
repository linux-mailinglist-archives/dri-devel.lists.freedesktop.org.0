Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358449981F7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 11:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA1110E039;
	Thu, 10 Oct 2024 09:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vk2srUWi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oABDb3E0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vk2srUWi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oABDb3E0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DC610E039
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 09:21:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 805D121FA4;
 Thu, 10 Oct 2024 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728552084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8j6Z60HZW08BiX96nznbPsEDR7zBOqfELsd+F4M+dP8=;
 b=Vk2srUWiGQDFLxwBnD3oUgGkROJuus92fan/EYqz5eDdDP6qYoSo49Rxbs1Wwmq6oxrZrv
 Xh49a2eZ5bS+bOWUh39r0ge40vDpVuo6MCzdhY/b0ozF0NJSwil02sLACcr660sCmAgyje
 +a82B2Y0sjdiyWIxgWDteKbA4WErtNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728552084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8j6Z60HZW08BiX96nznbPsEDR7zBOqfELsd+F4M+dP8=;
 b=oABDb3E0THaZgk7YO6vhcXnOI38wFO9wRMUiaUUtvYjkAizB/to4/EgC/QIuyRQtRnHivh
 8TWKkE0D+h3kcqAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728552084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8j6Z60HZW08BiX96nznbPsEDR7zBOqfELsd+F4M+dP8=;
 b=Vk2srUWiGQDFLxwBnD3oUgGkROJuus92fan/EYqz5eDdDP6qYoSo49Rxbs1Wwmq6oxrZrv
 Xh49a2eZ5bS+bOWUh39r0ge40vDpVuo6MCzdhY/b0ozF0NJSwil02sLACcr660sCmAgyje
 +a82B2Y0sjdiyWIxgWDteKbA4WErtNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728552084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8j6Z60HZW08BiX96nznbPsEDR7zBOqfELsd+F4M+dP8=;
 b=oABDb3E0THaZgk7YO6vhcXnOI38wFO9wRMUiaUUtvYjkAizB/to4/EgC/QIuyRQtRnHivh
 8TWKkE0D+h3kcqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C11713A6E;
 Thu, 10 Oct 2024 09:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IJwsDZScB2dgAgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Oct 2024 09:21:24 +0000
Content-Type: multipart/mixed; boundary="------------uSHRumF9m1pQPIMMhn8gkPyf"
Message-ID: <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
Date: Thu, 10 Oct 2024 11:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
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
In-Reply-To: <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Spam-Score: -1.70
X-Spamd-Result: default: False [-1.70 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-0.998];
 NEURAL_HAM_SHORT(-0.20)[-0.994];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_EQ_ADDR_SOME(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10]; HAS_ATTACHMENT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

This is a multi-part message in MIME format.
--------------uSHRumF9m1pQPIMMhn8gkPyf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 04.10.24 um 18:58 schrieb Luck, Tony:
> Thomas,
>
> v6.12-rc1 plus your off-by-one patch is still broken.

Thanks for testing. Here's another patch to try Ville's suggestion. It 
should disable HW vblank IRQs on your system. Could you please test it 
and report on the results?

Best regards
Thomas


>
> Console log from when things went off the rails:
>
> [   32.126676] Console: switching to colour dummy device 80x25
> [   32.134887] mgag200 0000:08:00.0: vgaarb: deactivate vga console
> [  OK  ] Started Show Plymouth Boot Screen.
> [  OK  ] Started Forward Password R…[   32.155183] mpt2sas_cm0: scatter gather: sge_in_main_msg(1), sge_per_chain(9), sge_per_io(128), chains_per_io(15)
> s to Plymouth Di[   32.157213] [drm] Initialized mgag200 1.0.0 for 0000:08:00.0 on minor 0
> rectory Watch   32.167994] mpt2sas_cm0: request pool(0x00000000b4be1d72) - dma(0xf880000): depth(3200), frame_size(128), pool_size(400 kB)
> m.
> [  OK  ] Reached target Path Units.
> [  OK  ] Reached target Basic System.
> [   32.190444] fbcon: mgag200drmfb (fb0) is primary device
> [   32.224946] mpt2sas_cm0: sense pool(0x000000005610eff3) - dma(0x10100000): depth(2939), element_size(96), pool_size (275 kB)
> [   32.225059] mpt2sas_cm0: reply pool(0x000000000f24e619) - dma(0x10180000): depth(3264), frame_size(128), pool_size(408 kB)
> [   32.225073] mpt2sas_cm0: config page(0x00000000ba53d4ed) - dma(0xfea3000): size(512)
> [   32.225076] mpt2sas_cm0: Allocated physical memory: size(7012 kB)
> [   32.225078] mpt2sas_cm0: Current Controller Queue Depth(2936),Max Controller Queue Depth(3072)
> [   32.225080] mpt2sas_cm0: Scatter Gather Elements per IO(128)
> [   32.242578] ixgbe 0000:03:00.0: Multiqueue Enabled: Rx Queue count = 63, Tx Queue count = 63 XDP Queue count = 0
> [   32.273473] mpt2sas_cm0: LSISAS2308: FWVersion(17.00.01.00), ChipRevision(0x05)
> [   32.273486] mpt2sas_cm0: Intel(R) Controller: Subsystem ID: 0x3050
> [   32.273490] mpt2sas_cm0: Protocol=(Initiator), Capabilities=(Raid,TLR,EEDP,Snapshot Buffer,Diag Trace Buffer,Task Set Full,NCQ)
> [   32.273693] scsi host6: Fusion MPT SAS Host
> [   32.281337] mpt2sas_cm0: sending port enable !!
> [   32.327525] ixgbe 0000:03:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:00:03.2 (capable of 32.000 Gb/s with 5.0 GT/s PCIe x8 link)
> [   32.349384] ------------[ cut here ]------------
> [   32.349467] [CRTC:34:crtc-0] vblank wait timed out
> [   32.349549] WARNING: CPU: 164 PID: 1820 at drivers/gpu/drm/drm_atomic_helper.c:1682 drm_atomic_helper_wait_for_vblanks.part.0+0x24f/0x260 [drm_kms_helper]
> [   32.349600] Modules linked in: crct10dif_pclmul crc32_pclmul crc32c_intel mgag200(+) ghash_clmulni_intel i2c_algo_bit sha512_ssse3 drm_shmem_helper drm_kms_helper sha256_ssse3 sha1_ssse3 ixgbe(+) mpt3sas mdio drm raid_class scsi_transport_sas dca wmi fuse
> [   32.349676] CPU: 164 UID: 0 PID: 1820 Comm: systemd-udevd Not tainted 6.12.0-rc1+ #170
> [   32.349694] Hardware name: Intel Corporation BRICKLAND/BRICKLAND, BIOS BRBDXSD1.86B.0338.V01.1603162127 03/16/2016
> [   32.349696] RIP: 0010:drm_atomic_helper_wait_for_vblanks.part.0+0x24f/0x260 [drm_kms_helper]
> [   32.349706] Code: 00 48 8d 7b 08 e8 61 96 36 e8 45 85 ff 0f 85 d3 fe ff ff 49 8b 56 20 41 8b b6 d8 00 00 00 48 c7 c7 b0 e0 e1 c0 e8 21 3d 2e e8 <0f> 0b e9 b5 fe ff ff 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
> [   32.349708] RSP: 0018:ffffa373a4097680 EFLAGS: 00010282
> [   32.349712] RAX: 0000000000000026 RBX: ffff94c556084028 RCX: 0000000000000000
> [   32.349715] RDX: 0000000000000002 RSI: ffffffffaaa3ec38 RDI: 00000000ffffffff
> [   32.349717] RBP: ffff94c55a259e00 R08: 0000000000000001 R09: 0000000000000000
> [   32.349719] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
> [   32.349721] R13: 0000000000000000 R14: ffff94c55b1893f0 R15: 0000000000000000
> [   32.349723] FS:  00007fc95bdc2b40(0000) GS:ffff94d1b2800000(0000) knlGS:0000000000000000
> [   32.349726] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   32.349728] CR2: 00007f906e3ca948 CR3: 000000000cd1c002 CR4: 00000000003706f0
> [   32.349730] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   32.349732] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   32.349734] Call Trace:
> [   32.349736]  <TASK>
> [   32.349739]  ? __warn+0x90/0x1a0
> [   32.349754]  ? drm_atomic_helper_wait_for_vblanks.part.0+0x24f/0x260 [drm_kms_helper]
> [   32.349764]  ? report_bug+0x1c3/0x1d0
> [   32.349779]  ? handle_bug+0x5b/0xa0
> [   32.349789]  ? exc_invalid_op+0x14/0x70
> [   32.349793]  ? asm_exc_invalid_op+0x16/0x20
> [   32.349811]  ? drm_atomic_helper_wait_for_vblanks.part.0+0x24f/0x260 [drm_kms_helper]
> [   32.349822]  ? __pfx_autoremove_wake_function+0x10/0x10
> [   32.349833]  drm_atomic_helper_commit_tail+0x71/0x80 [drm_kms_helper]
> [   32.349843]  mgag200_mode_config_helper_atomic_commit_tail+0x28/0x40 [mgag200]
> [   32.349851]  commit_tail+0x94/0x130 [drm_kms_helper]
> [   32.349862]  drm_atomic_helper_commit+0x13e/0x170 [drm_kms_helper]
> [   32.349872]  drm_atomic_commit+0x97/0xb0 [drm]
> [   32.349923]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   32.349955]  drm_client_modeset_commit_atomic+0x207/0x250 [drm]
> [   32.349991]  drm_client_modeset_commit_locked+0x5b/0x190 [drm]
> [   32.350015]  drm_client_modeset_commit+0x24/0x50 [drm]
> [   32.350038]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x95/0xd0 [drm_kms_helper]
> [   32.350050]  drm_fb_helper_set_par+0x2e/0x40 [drm_kms_helper]
> [   32.350059]  fbcon_init+0x2a8/0x560
> [   32.350070]  visual_init+0xc4/0x120
> [   32.350078]  do_bind_con_driver.isra.0+0x1a1/0x3d0
> [   32.350086]  do_take_over_console+0x10b/0x1a0
> [   32.350092]  do_fbcon_takeover+0x5c/0xc0
> [   32.350095]  fbcon_fb_registered+0x49/0x70
> [   32.350098]  do_register_framebuffer+0x184/0x230
> [   32.350109]  register_framebuffer+0x20/0x40
> [   32.350112]  __drm_fb_helper_initial_config_and_unlock+0x33e/0x590 [drm_kms_helper]
> [   32.350122]  ? drm_client_register+0x33/0xc0 [drm]
> [   32.350154]  drm_fbdev_shmem_client_hotplug+0x6c/0xc0 [drm_shmem_helper]
> [   32.350160]  drm_client_register+0x7b/0xc0 [drm]
> [   32.350184]  mgag200_pci_probe+0x90/0x180 [mgag200]
> [   32.350191]  local_pci_probe+0x46/0xa0
> [   32.350199]  pci_device_probe+0xb5/0x220
> [   32.350206]  really_probe+0xd9/0x380
> [   32.350214]  __driver_probe_device+0x78/0x150
> [   32.350249]  driver_probe_device+0x1e/0x90
> [   32.350254]  __driver_attach+0xd6/0x1d0
> [   32.350258]  ? __pfx___driver_attach+0x10/0x10
> [   32.350261]  bus_for_each_dev+0x66/0xa0
> [   32.350267]  bus_add_driver+0x111/0x240
> [   32.350272]  driver_register+0x5c/0x120
> [   32.350280]  ? __pfx_mgag200_pci_driver_init+0x10/0x10 [mgag200]
> [   32.350285]  do_one_initcall+0x62/0x3a0
> [   32.350299]  ? __kmalloc_cache_noprof+0x240/0x300
> [   32.350315]  do_init_module+0x64/0x240
> [   32.350329]  init_module_from_file+0x7a/0xa0
> [   32.350341]  idempotent_init_module+0x15f/0x260
> [   32.350353]  __x64_sys_finit_module+0x5a/0xb0
> [   32.350358]  do_syscall_64+0x73/0x190
> [   32.350364]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   32.350368] RIP: 0033:0x7fc95ca07e0d
> [   32.350371] Code: c8 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 80 0c 00 f7 d8 64 89 01 48
> [   32.350373] RSP: 002b:00007ffef10b2468 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   32.350377] RAX: ffffffffffffffda RBX: 0000562610eb0f80 RCX: 00007fc95ca07e0d
> [   32.350379] RDX: 0000000000000000 RSI: 00007fc95cb6132c RDI: 0000000000000010
> [   32.350381] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000000000000000
> [   32.350384] R10: 0000000000000010 R11: 0000000000000246 R12: 00007fc95cb6132c
> [   32.350386] R13: 0000562610ed00d0 R14: 0000000000000007 R15: 0000562610ed0380
> [   32.350397]  </TASK>
> [   32.350399] irq event stamp: 51727
> [   32.350402] hardirqs last  enabled at (51733): [<ffffffffa918f854>] vprintk_emit+0x3d4/0x3e0
> [   32.350407] hardirqs last disabled at (51738): [<ffffffffa918f807>] vprintk_emit+0x387/0x3e0
> [   32.350409] softirqs last  enabled at (51576): [<ffffffffa90e2891>] __irq_exit_rcu+0xa1/0x110
> [   32.350420] softirqs last disabled at (51569): [<ffffffffa90e2891>] __irq_exit_rcu+0xa1/0x110
> [   32.350423] ---[ end trace 0000000000000000 ]---
> [   32.350452] Console: switching to colour frame buffer device 128x48

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------uSHRumF9m1pQPIMMhn8gkPyf
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-mgag200-disable-vblank-on-buggy-hardware.patch"
Content-Disposition: attachment;
 filename="0001-mgag200-disable-vblank-on-buggy-hardware.patch"
Content-Transfer-Encoding: base64

RnJvbSBmNmQwODc2YTg1ZDNmNDA2MzlkMThkZWZlYWNjNzY2NmNkODQ4ZmVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxMCBPY3QgMjAyNCAxMToxNTo0OSArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIG1nYWcyMDA6IGRpc2FibGUgdmJsYW5rIG9uIGJ1Z2d5IGhhcmR3YXJlCgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNlLmMgfCA4ICsrKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2cyMDBzZS5jCmluZGV4IDlkY2Jl
ODMwNDI3MS4uYjIyODYwYjgyMzBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX2cyMDBzZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfZzIwMHNlLmMKQEAgLTUxNyw5ICs1MTcsMTEgQEAgc3RydWN0IG1nYV9kZXZpY2Ug
Km1nYWcyMDBfZzIwMHNlX2RldmljZV9jcmVhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNv
bnN0IHN0cnUKIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsKIAlkcm1fa21zX2hlbHBl
cl9wb2xsX2luaXQoZGV2KTsKIAotCXJldCA9IGRybV92YmxhbmtfaW5pdChkZXYsIDEpOwot
CWlmIChyZXQpCi0JCXJldHVybiBFUlJfUFRSKHJldCk7CisJaWYgKGluZm8tPmJ1Z19ub19z
dGFydGFkZCkgeworCQlyZXQgPSBkcm1fdmJsYW5rX2luaXQoZGV2LCAxKTsKKwkJaWYgKHJl
dCkKKwkJCXJldHVybiBFUlJfUFRSKHJldCk7CisJfQogCiAJcmV0dXJuIG1kZXY7CiB9Ci0t
IAoyLjQ2LjAKCg==

--------------uSHRumF9m1pQPIMMhn8gkPyf--
