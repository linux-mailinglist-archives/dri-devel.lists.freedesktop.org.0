Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73105992C34
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C572810E204;
	Mon,  7 Oct 2024 12:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FSTZXJQ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vw3oskYp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FSTZXJQ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vw3oskYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C022910E204;
 Mon,  7 Oct 2024 12:44:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4BE8821B71;
 Mon,  7 Oct 2024 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728305070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cdM9AVkgX17+khx6Cbz5kuLyepgO1ofZSPaQkn5wo8U=;
 b=FSTZXJQ61t7jlznsx3XiFHhD6O6yu2arIP/yzbJlTRWrBBq84O0XvX2bYNKd4GgTBL4TIi
 eGz46c/wQ5JnxLL2CybtLBJhDj4t3XgCzLyRVjq9Hazfg0N3GiNYusHxQK1HHwzRMJ5Drp
 uZgD6ifZRz3WhxbNh/aHuhsX21IL5L0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728305070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cdM9AVkgX17+khx6Cbz5kuLyepgO1ofZSPaQkn5wo8U=;
 b=Vw3oskYpHEszAqj2zpqHifjwmbPCJzYN0E6sysTe/qIicRWavozV03zfeUJYQzL7gtHIA/
 mNJ56+DJMnFAImAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728305070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cdM9AVkgX17+khx6Cbz5kuLyepgO1ofZSPaQkn5wo8U=;
 b=FSTZXJQ61t7jlznsx3XiFHhD6O6yu2arIP/yzbJlTRWrBBq84O0XvX2bYNKd4GgTBL4TIi
 eGz46c/wQ5JnxLL2CybtLBJhDj4t3XgCzLyRVjq9Hazfg0N3GiNYusHxQK1HHwzRMJ5Drp
 uZgD6ifZRz3WhxbNh/aHuhsX21IL5L0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728305070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cdM9AVkgX17+khx6Cbz5kuLyepgO1ofZSPaQkn5wo8U=;
 b=Vw3oskYpHEszAqj2zpqHifjwmbPCJzYN0E6sysTe/qIicRWavozV03zfeUJYQzL7gtHIA/
 mNJ56+DJMnFAImAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E37DE132BD;
 Mon,  7 Oct 2024 12:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UDQqNq3XA2eoVgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Oct 2024 12:44:29 +0000
Message-ID: <365b4f14-8aa2-4561-8545-29b38fc363e7@suse.de>
Date: Mon, 7 Oct 2024 14:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer dereference with kernel 6.12.0-rc1 and ARUBA GPU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arthur Marsh <arthur.marsh@internode.on.net>
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, wuhoipok@gmail.com, x86@kernel.org
References: <d95eca6e-0266-4ebe-b9d9-3e8552c5b09a@suse.de>
 <20240930152520.4654-1-user@am64>
 <8c04ea38-11ba-4ec0-bb5f-d7441de3429f@amd.com>
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
In-Reply-To: <8c04ea38-11ba-4ec0-bb5f-d7441de3429f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,internode.on.net];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,internode.on.net];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,lists.freedesktop.org,ffwll.ch,lists.linux.dev,vger.kernel.org,kernel.org];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
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

Am 30.09.24 um 19:54 schrieb Christian König:
> I've been running into the same issue as well. Going to take a look.

Any results?

>
> Christian.
>
> Am 30.09.24 um 17:25 schrieb Arthur Marsh:
>> [   13.069630] [drm] radeon kernel modesetting enabled.
>> [   13.069681] radeon 0000:00:01.0: vgaarb: deactivate vga console
>> [   13.070435] Console: switching to colour dummy device 80x25
>> [   13.070632] [drm] initializing kernel modesetting (ARUBA 
>> 0x1002:0x990C 0x1002:0x0123 0x00).
>> [   13.070718] ATOM BIOS: 113
>> [   13.070778] radeon 0000:00:01.0: VRAM: 768M 0x0000000000000000 - 
>> 0x000000002FFFFFFF (768M used)
>> [   13.070781] radeon 0000:00:01.0: GTT: 1024M 0x0000000030000000 - 
>> 0x000000006FFFFFFF
>> [   13.070785] [drm] Detected VRAM RAM=768M, BAR=256M
>> [   13.070786] [drm] RAM width 64bits DDR
>> [   13.070884] [drm] radeon: 768M of VRAM memory ready
>> [   13.070885] [drm] radeon: 1024M of GTT memory ready.
>> [   13.070896] [drm] Loading ARUBA Microcode
>> [   13.504398] [drm] Internal thermal controller without fan control
>> [   13.504566] [drm] radeon: dpm initialized
>> [   13.839229] [drm] Found VCE firmware/feedback version 50.0.1 / 17!
>> [   13.839264] [drm] GART: num cpu pages 262144, num gpu pages 262144
>> [   13.863929] [drm] PCIE GART of 1024M enabled (table at 
>> 0x00000000001D6000).
>> [   13.864085] radeon 0000:00:01.0: WB enabled
>> [   13.864088] radeon 0000:00:01.0: fence driver on ring 0 use gpu 
>> addr 0x0000000030000c00
>> [   13.864467] radeon 0000:00:01.0: fence driver on ring 5 use gpu 
>> addr 0x0000000000075a18
>> [   13.884497] radeon 0000:00:01.0: fence driver on ring 6 use gpu 
>> addr 0x0000000030000c18
>> [   13.884502] radeon 0000:00:01.0: fence driver on ring 7 use gpu 
>> addr 0x0000000030000c1c
>> [   13.884503] radeon 0000:00:01.0: fence driver on ring 1 use gpu 
>> addr 0x0000000030000c04
>> [   13.884505] radeon 0000:00:01.0: fence driver on ring 2 use gpu 
>> addr 0x0000000030000c08
>> [   13.884506] radeon 0000:00:01.0: fence driver on ring 3 use gpu 
>> addr 0x0000000030000c0c
>> [   13.884507] radeon 0000:00:01.0: fence driver on ring 4 use gpu 
>> addr 0x0000000030000c10
>> [   13.884862] radeon 0000:00:01.0: radeon: MSI limited to 32-bit
>> [   13.884921] radeon 0000:00:01.0: radeon: using MSI.
>> [   13.885003] [drm] radeon: irq initialized.
>> [   13.903273] [drm] ring test on 0 succeeded in 3 usecs
>> [   13.903281] [drm] ring test on 3 succeeded in 4 usecs
>> [   13.903286] [drm] ring test on 4 succeeded in 3 usecs
>> [   13.949128] [drm] ring test on 5 succeeded in 2 usecs
>> [   13.968988] [drm] UVD initialized successfully.
>> [   14.078221] [drm] ring test on 6 succeeded in 17 usecs
>> [   14.078234] [drm] ring test on 7 succeeded in 3 usecs
>> [   14.078236] [drm] VCE initialized successfully.
>> [   14.078314] snd_hda_intel 0000:00:01.1: bound 0000:00:01.0 (ops 
>> radeon_audio_component_bind_ops [radeon])
>> [   14.078502] [drm] ib test on ring 0 succeeded in 0 usecs
>> [   14.078555] [drm] ib test on ring 3 succeeded in 0 usecs
>> [   14.078606] [drm] ib test on ring 4 succeeded in 0 usecs
>> [   14.153378] mc: Linux media interface: v0.10
>> [   14.593759] usb 1-3: dvb_usb_v2: found a 'Realtek RTL2832U 
>> reference design' in warm state
>> [   14.614227] [drm] ib test on ring 5 succeeded
>> [   14.625865] usb 1-3: dvb_usb_v2: will pass the complete MPEG2 
>> transport stream to the software demuxer
>> [   14.625885] dvbdev: DVB: registering new adapter (Realtek RTL2832U 
>> reference design)
>> [   14.625889] usb 1-3: media controller created
>> [   14.627064] dvbdev: dvb_create_media_entity: media entity 
>> 'dvb-demux' registered.
>> [   14.801142] i2c i2c-5: Added multiplexed i2c bus 6
>> [   14.801149] rtl2832 5-0010: Realtek RTL2832 successfully attached
>> [   14.801176] usb 1-3: DVB: registering adapter 0 frontend 0 
>> (Realtek RTL2832 (DVB-T))...
>> [   14.801189] dvbdev: dvb_create_media_entity: media entity 'Realtek 
>> RTL2832 (DVB-T)' registered.
>> [   14.957783] i2c i2c-6: fc0012: Fitipower FC0012 successfully 
>> identified
>> [   15.158461] [drm] ib test on ring 6 succeeded
>> [   15.178787] videodev: Linux video capture interface: v2.00
>> [   15.460709] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
>> [   15.460715] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR 
>> attached
>> [   15.460718] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still 
>> slightly experimental and functionality changes may follow
>> [   15.477759] usb 1-3: dvb_usb_v2: 'Realtek RTL2832U reference 
>> design' successfully initialized and connected
>> [   15.477878] usbcore: registered new interface driver dvb_usb_rtl28xxu
>> [   15.670413] [drm] ib test on ring 7 succeeded
>> [   15.671111] BUG: kernel NULL pointer dereference, address: 
>> 0000000000000050
>> [   15.671114] #PF: supervisor read access in kernel mode
>> [   15.671117] #PF: error_code(0x0000) - not-present page
>> [   15.671119] PGD 0 P4D 0
>> [   15.671123] Oops: Oops: 0000 [#1] PREEMPT_RT SMP NOPTI
>> [   15.671127] CPU: 2 UID: 0 PID: 437 Comm: udevd Not tainted 
>> 6.12.0-rc1 #6131
>> [   15.671132] Hardware name: Gigabyte Technology Co., Ltd. To be 
>> filled by O.E.M./F2A78M-HD2, BIOS F2 05/28/2014
>> [   15.671134] RIP: 0010:drm_dp_aux_register+0x59/0x110 
>> [drm_display_helper]
>> [   15.671164] Code: 86 c0 48 85 f6 48 89 83 b8 00 00 00 74 1c 48 8d 
>> bb b4 03 00 00 ba 30 00 00 00 e8 52 35 bc c7 48 8d 7b 08 5b 5d e9 37 
>> 31 93 c7 <48> 8b 70 50 48 85 f6 75 db 48 8b 30 eb d6 48 8d ab 88 04 
>> 00 00 48
>> [   15.671167] RSP: 0018:ffffb37f80e33960 EFLAGS: 00010246
>> [   15.671170] RAX: 0000000000000000 RBX: ffff892d407ee508 RCX: 
>> ffffffffc09b3bc0
>> [   15.671172] RDX: ffffffffc0869e40 RSI: 0000000000000000 RDI: 
>> ffff892d407ee9f0
>> [   15.671174] RBP: ffff892d407ee9f0 R08: ffff892d42fb8008 R09: 
>> 00000000c0c0c0c0
>> [   15.671176] R10: 0000000000000000 R11: 0000000000000001 R12: 
>> ffff892d5b64af50
>> [   15.671178] R13: ffff892d5b64b092 R14: ffff892d5b64af2e R15: 
>> 0000000000000018
>> [   15.671181] FS:  00007f066d882840(0000) GS:ffff89306f900000(0000) 
>> knlGS:0000000000000000
>> [   15.671183] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   15.671185] CR2: 0000000000000050 CR3: 00000001047a6000 CR4: 
>> 00000000000406f0
>> [   15.671188] Call Trace:
>> [   15.671190]  <TASK>
>> [   15.671192]  ? __die_body.cold+0x19/0x1e
>> [   15.671200]  ? page_fault_oops+0xa8/0x230
>> [   15.671206]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
>> [   15.671227]  ? search_module_extables+0x4f/0x90
>> [   15.671233]  ? fixup_exception+0x36/0x2f0
>> [   15.671239]  ? exc_page_fault+0x88/0x1b0
>> [   15.671244]  ? asm_exc_page_fault+0x22/0x30
>> [   15.671251]  ? __pfx_radeon_dp_aux_transfer_atom+0x10/0x10 [radeon]
>> [   15.671437]  ? drm_dp_aux_register+0x59/0x110 [drm_display_helper]
>> [   15.671463]  radeon_dp_aux_init+0x91/0xc0 [radeon]
>> [   15.671634] 
>> radeon_get_atom_connector_info_from_object_table+0x58e/0x880 [radeon]
>> [   15.671764]  ? 
>> radeon_get_atom_connector_info_from_supported_devices_table+0x5cf/0x600 
>> [radeon]
>> [   15.671895]  ? kstrdup+0x4c/0x70
>> [   15.671902]  ? __kmalloc_noprof+0x24d/0x340
>> [   15.671908]  radeon_modeset_init+0x375/0x470 [radeon]
>> [   15.672050]  ? radeon_device_init+0x667/0xb40 [radeon]
>> [   15.672179]  radeon_driver_load_kms+0xc2/0x260 [radeon]
>> [   15.672308]  radeon_pci_probe+0xff/0x170 [radeon]
>> [   15.672436]  pci_device_probe+0xbe/0x1a0
>> [   15.672441]  really_probe+0xde/0x350
>> [   15.672447]  ? pm_runtime_barrier+0x61/0xb0
>> [   15.672452]  ? __pfx___driver_attach+0x10/0x10
>> [   15.672457]  __driver_probe_device+0x78/0x110
>> [   15.672462]  driver_probe_device+0x2d/0xc0
>> [   15.672467]  __driver_attach+0xc9/0x1c0
>> [   15.672472]  bus_for_each_dev+0x6a/0xb0
>> [   15.672476]  ? migrate_enable+0xbf/0xf0
>> [   15.672480]  bus_add_driver+0x139/0x220
>> [   15.672485]  driver_register+0x6e/0xc0
>> [   15.672491]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
>> [   15.672616]  do_one_initcall+0x42/0x210
>> [   15.672622]  ? __kmalloc_cache_noprof+0x89/0x230
>> [   15.672627]  do_init_module+0x60/0x210
>> [   15.672631]  init_module_from_file+0x89/0xc0
>> [   15.672637]  __x64_sys_finit_module+0x142/0x390
>> [   15.672643]  do_syscall_64+0x47/0x110
>> [   15.672647]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   15.672653] RIP: 0033:0x7f066d6b3839
>> [   15.672657] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 
>> 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 
>> 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b7 85 0d 00 f7 d8 64 
>> 89 01 48
>> [   15.672659] RSP: 002b:00007ffead344b38 EFLAGS: 00000246 ORIG_RAX: 
>> 0000000000000139
>> [   15.672663] RAX: ffffffffffffffda RBX: 00005586f29e09b0 RCX: 
>> 00007f066d6b3839
>> [   15.672665] RDX: 0000000000000000 RSI: 00005586f29d08d0 RDI: 
>> 0000000000000011
>> [   15.672667] RBP: 0000000000000000 R08: 0000000000000000 R09: 
>> 00005586f29c0540
>> [   15.672669] R10: 00007f066d78cac0 R11: 0000000000000246 R12: 
>> 00005586f29d08d0
>> [   15.672671] R13: 0000000000020000 R14: 00005586f29d82e0 R15: 
>> 0000000000000000
>> [   15.672675]  </TASK>
>> [   15.672676] Modules linked in: rtl2832_sdr videobuf2_vmalloc 
>> videobuf2_memops videobuf2_v4l2 videobuf2_common videodev fc0012 
>> rtl2832 i2c_mux dvb_usb_rtl28xxu dvb_usb_v2 dvb_core mc 
>> snd_emu10k1_synth snd_emux_synth snd_seq_midi_emul snd_seq_virmidi 
>> radeon(+) snd_seq_midi snd_seq_midi_event snd_seq snd_emu10k1 
>> drm_ttm_helper ttm snd_hda_codec_hdmi drm_suballoc_helper 
>> snd_hda_intel snd_util_mem drm_display_helper snd_ac97_codec 
>> snd_intel_dspcfg snd_hda_codec snd_hda_core ac97_bus snd_hwdep 
>> snd_rawmidi snd_seq_device snd_pcm drm_kms_helper snd_timer 
>> edac_mce_amd k10temp sha512_ssse3 sha512_generic sha256_ssse3 
>> sha1_ssse3 drm aesni_intel snd gf128mul at24 crypto_simd cryptd 
>> soundcore acpi_cpufreq regmap_i2c emu10k1_gp gameport pcspkr evdev 
>> serio_raw i2c_algo_bit video sp5100_tco wmi button ext4 
>> crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid sg sr_mod 
>> cdrom sd_mod ata_generic crc32_pclmul firewire_ohci crc32c_intel 
>> firewire_core ahci i2c_piix4 crc_itu_t pata_atiixp i2c_smbus r8169 
>> libahci ohci_pci xhci_pci libata
>> [   15.672761]  realtek ohci_hcd ehci_pci xhci_hcd ehci_hcd 
>> mdio_devres scsi_mod scsi_common libphy usbcore usb_common
>> [   15.672773] CR2: 0000000000000050
>> [   15.672776] ---[ end trace 0000000000000000 ]---
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

