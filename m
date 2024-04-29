Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8138B5212
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 09:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37617112B0C;
	Mon, 29 Apr 2024 07:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jm8LKD+s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xfNlBn4o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CtT7dcQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N5/wMBiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA55112B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 07:17:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A301A202FE;
 Mon, 29 Apr 2024 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714375020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CWnS1dINpx1Ckq7m4uduFkzjruDvnOn+AP28uKJXghU=;
 b=jm8LKD+sp2NaZMl/jiS5I8w3CZddvw1USm2yp9bICZ/PBYxDzP+Y1gtLfhvnRbuK3O+/qF
 mCjSt4QHTOQ1qECGXmFOx/jMUIGU9SzceQFX1m+iDkf0x+5f8W8X8AHzzmA3ohXbrcgEPq
 nykikicC7/KRAgtDWfqWB7V09f/F9LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714375020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CWnS1dINpx1Ckq7m4uduFkzjruDvnOn+AP28uKJXghU=;
 b=xfNlBn4o5Kc+b1kxka2t77ABg7Amfex/GGl3kYgzG4xojIm+cVbmLmda3x/TCvHCBqig3V
 tyO5HphGRNIQJMAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CtT7dcQq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="N5/wMBiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714375019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CWnS1dINpx1Ckq7m4uduFkzjruDvnOn+AP28uKJXghU=;
 b=CtT7dcQqpmNZ743dQcCGpwy+1qIgHWiNRyorq31r7B9Cvj6kvs8CS7bWfaRx8xKDt34HsY
 zjIdhf62lhjzDoblZ6sJ2uU6dhf1/yc9cAGt+HitLD7JGf6HHMaeMjxmx6a0metJLjvrkK
 mBBiCdBkLmkgMsnrxnnQ99aYwnprF4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714375019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CWnS1dINpx1Ckq7m4uduFkzjruDvnOn+AP28uKJXghU=;
 b=N5/wMBiEMqBEzbH/2Rqyz1cU94cUUbGx6NXLp5UrCV/UoCMUxHyVUSyjg/mwDC1RjCorFu
 8QBgihQC1pCxTiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8610C138A7;
 Mon, 29 Apr 2024 07:16:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qBmjH2tJL2ancgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Apr 2024 07:16:59 +0000
Message-ID: <ecf30bde-f7a7-434f-8be0-352c376a96ee@suse.de>
Date: Mon, 29 Apr 2024 09:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: After suspend/resume cycle ASPEED VGA monitor suffers with "No
 Signal" state.
To: Cary Garrett <cogarre@gmail.com>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com>
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
In-Reply-To: <8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -6.50
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A301A202FE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,redhat.com];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim]
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

Am 23.04.24 um 21:51 schrieb Cary Garrett:
> Hello,
>
> An Aspeed VGA monitor, in my case AST 2400, after a suspend/resume
> cycle suffers with a "No Signal" state. This is also true of a
> IPMI/BMC remote console. To restore the "Signal" state requires
> a reboot or the following workaround.
>
> To restore the "Signal" state without rebooting issue the
> following commands from a SSH session or serial console
> after every suspend/resume cycle:
>
>    sudo modprobe -r ast
>    sudo modprobe ast
>    
> This a home media server which is updated infrequently, so
> I am unable offer any guidance as to when this issue started
> occurring.

Just to clarify, suspend/resume did restore the display in earlier versions?

Best regards
Thomas

>
> Regards, Cary Garrett
>
>
>
> Current environment:
>
> uname -a:
> Linux xxxxxx-server 6.8.7-arch1-1 #1 SMP PREEMPT_DYNAMIC Wed, 17 Apr 2024 15:20:28 +0000 x86_64
> GNU/Linux
>
> modinfo:
> filename:       /lib/modules/6.8.7-arch1-1/kernel/drivers/gpu/drm/ast/ast.ko.zst
> license:        GPL and additional rights
> description:    AST
> author:         Dave Airlie
> firmware:       ast_dp501_fw.bin
> srcversion:     7E39455BCA2D11E968D8B2B
> alias:          pci:v00001A03d00002010sv*sd*bc03sc*i*
> alias:          pci:v00001A03d00002000sv*sd*bc03sc*i*
> depends:        i2c-algo-bit
> retpoline:      Y
> intree:         Y
> name:           ast
> vermagic:       6.8.7-arch1-1 SMP preempt mod_unload
> sig_id:         PKCS#7
> signer:         Build time autogenerated kernel key
> sig_key:        76:06:C7:84:BC:2F:C6:38:38:61:C1:6F:32:D5:6A:03:88:22:68:1C
> sig_hashalgo:   sha512
> signature:      30:66:02:31:00:AD:83:EB:D2:9B:91:E6:C3:9B:52:89:51:4B:BB:06:
> 		DE:D7:44:A6:6B:07:92:AA:75:2A:0B:20:26:73:58:09:DF:C3:86:C6:
> 		FC:B7:D4:13:5F:5D:35:4D:67:89:73:0E:C2:02:31:00:C3:98:99:67:
> 		B4:74:02:5C:6D:D3:81:13:D4:9F:B4:F4:CF:37:8A:7C:84:8C:73:BF:
> 		DF:4D:D5:34:B0:0A:CE:0E:59:67:28:98:07:BF:D7:FA:68:B3:37:43:
> 		02:1C:59:3E
> parm:           modeset:Disable/Enable modesetting (int)
>
> lspci:
> 04:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Graphics Family (rev 30) (prog-if
> 00 [VGA controller])
> 	DeviceName: Onboard VGA
> 	Subsystem: Super Micro Computer Inc Device 0804
> 	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR-
> FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR-
> <PERR- INTx-
> 	Interrupt: pin A routed to IRQ 16
> 	Region 0: Memory at f6000000 (32-bit, non-prefetchable) [size=16M]
> 	Region 1: Memory at f7000000 (32-bit, non-prefetchable) [size=128K]
> 	Region 2: I/O ports at d000 [size=128]
> 	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> 	Capabilities: [40] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [50] MSI: Enable- Count=1/4 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Kernel driver in use: ast
> 	Kernel modules: ast
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

