Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB19F2C1E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5F110E542;
	Mon, 16 Dec 2024 08:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xMYfq8Np";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="acQh/99b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMYfq8Np";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="acQh/99b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110D310E528
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:41:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6ABD211EB;
 Mon, 16 Dec 2024 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734338512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5iJTX+uBOOIrqY9gF4wXjiiRiStJDPA3P+Sh39Hv26I=;
 b=xMYfq8NpsIp/UY9hi7XaKmo9QpfSFmqmyUbBKodLVbIyqrrEoyJfBKPIFJExZCpTS+uukg
 g9olKJl1E/zlUfDbK3//P+WiWP1BySEWkkHz6+hSB+O3wWvX6+iN7FtMOuxoYjXyd7n91a
 f/Z2+UjStnEjAOYqyMFnmdy9bWeqmXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734338512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5iJTX+uBOOIrqY9gF4wXjiiRiStJDPA3P+Sh39Hv26I=;
 b=acQh/99bgFAPREN8i6Q3dZY+Vp/1OTmMiNZ83Ur7Gd+Sixh61SpgX2J4kLq7w0VK2Fs6T6
 iZkyQ9+P8NepoPDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xMYfq8Np;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="acQh/99b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734338512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5iJTX+uBOOIrqY9gF4wXjiiRiStJDPA3P+Sh39Hv26I=;
 b=xMYfq8NpsIp/UY9hi7XaKmo9QpfSFmqmyUbBKodLVbIyqrrEoyJfBKPIFJExZCpTS+uukg
 g9olKJl1E/zlUfDbK3//P+WiWP1BySEWkkHz6+hSB+O3wWvX6+iN7FtMOuxoYjXyd7n91a
 f/Z2+UjStnEjAOYqyMFnmdy9bWeqmXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734338512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5iJTX+uBOOIrqY9gF4wXjiiRiStJDPA3P+Sh39Hv26I=;
 b=acQh/99bgFAPREN8i6Q3dZY+Vp/1OTmMiNZ83Ur7Gd+Sixh61SpgX2J4kLq7w0VK2Fs6T6
 iZkyQ9+P8NepoPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BB09137CF;
 Mon, 16 Dec 2024 08:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UA+eHNDnX2eudgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 08:41:52 +0000
Content-Type: multipart/mixed; boundary="------------ySx5PJpNBY0nl1rIzyRJJvkM"
Message-ID: <b2e2a217-dced-472f-9084-9822f7e6803c@suse.de>
Date: Mon, 16 Dec 2024 09:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: a bochs-drm (?) oops on head
To: "Dr. David Alan Gilbert" <dave@treblig.org>, kraxel@redhat.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <Z18dbfDAiFadsSdg@gallifrey>
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
In-Reply-To: <Z18dbfDAiFadsSdg@gallifrey>
X-Rspamd-Queue-Id: A6ABD211EB
X-Spam-Level: 
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; HAS_ATTACHMENT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.41
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

This is a multi-part message in MIME format.
--------------ySx5PJpNBY0nl1rIzyRJJvkM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 15.12.24 um 19:18 schrieb Dr. David Alan Gilbert:
> Hey Gerd, Thomas,
>    I've got the following oops that looks bochs-drm related on the current
> HEAD ( 4800575d8c0b2f354ab05ab1c4749e45e213bf73 ) and it's been there
> for at least a few days; this is
[...]
>
> The oops has :
> [   78.463760][    T1]  bochs_pci_driver_init+0x8a/0xc0
>
> in it, hence why I'm blaming that.
> (Other odd observation, the Tuxen flicker heavily during booting!)
>
> [   72.756014][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   72.758258][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> [   72.758793][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> [   72.767777][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> [   72.839222][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> [   72.839311][    T1] fbcon: Remapping primary device, fb1, to tty 1-63
> [   78.402163][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device
> [   78.459984][    T1] BUG: unable to handle page fault for address: ffff8dd345604004
> [   78.463246][    T1] #PF: supervisor write access in kernel mode
> [   78.463760][    T1] #PF: error_code(0x0002) - not-present page
> [   78.463760][    T1] PGD 72001067 P4D 72001067 PUD 72002067 PMD 7fbe1067 PTE 800ffffffa9fb060
> [   78.463760][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> [   78.463760][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #363 6c653a430ed30aae3dac648429c492a2726da3d7
> [   78.463760][    T1] Tainted: [W]=WARN, [N]=TEST
> [   78.463760][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   78.463760][    T1] RIP: 0010:devm_drm_dev_init_release+0x4e/0x140
[...]
>
> [   78.463760][    T1] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
>
> The config is a fairly full yes-config ish; see attached.

Thanks for reporting. I've been able to reproduce the problem by setting 
CONFIG_DEBUG_TEST_DRIVER_REMOVE 
<https://elixir.bootlin.com/linux/v6.13-rc2/K/ident/CONFIG_DEBUG_TEST_DRIVER_REMOVE>=y. 
The attached patch fixes the problem for me. Could you please test and 
report back the results.

Best regards
Thomas


>
> Dave
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------ySx5PJpNBY0nl1rIzyRJJvkM
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-bochs-Do-not-put-DRM-device-in-PCI-remove-callba.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-bochs-Do-not-put-DRM-device-in-PCI-remove-callba.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiZWJiYTNiMzRkNWRmNWFhN2M4ODJmMDgwNjMzYjQzZGRiODdmNGFkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogTW9uLCAxNiBEZWMgMjAyNCAwOToyMTo0NiArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGRybS9ib2NoczogRG8gbm90IHB1dCBEUk0gZGV2aWNlIGluIFBDSSByZW1v
dmUgY2FsbGJhY2sKClJlbW92aW5nIHRoZSBib2NocyBQQ0kgZGV2aWNlIHNob3VsZCBtYXJr
IHRoZSBEUk0gZGV2aWNlIGFzIHVucGx1Z2dlZAp3aXRob3V0IHJlbW92aW5nIGl0LiBIZW5j
ZSBjbGVhciB0aGUgcmVzcGVjdGl2ZSBjYWxsIHRvIGRybV9kZXZfcHV0KCkKZnJvbSBib2No
c19wY2lfcmVtb3ZlKCkuCgpGaXhlcyBhIGRvdWJsZSB1bnJlZiBpbiBkZXZtX2RybV9kZXZf
aW5pdF9yZWxlYXNlKCkuIEFuIGV4YW1wbGUgZXJyb3IKbWVzc2FnZSBpcyBzaG93biBiZWxv
dzoKClsgICAzMi45NTgzMzhdIEJVRzogS0FTQU46IHVzZS1hZnRlci1mcmVlIGluIGRybV9k
ZXZfcHV0LnBhcnQuMCsweDFiLzB4OTAKWyAgIDMyLjk1ODg1MF0gV3JpdGUgb2Ygc2l6ZSA0
IGF0IGFkZHIgZmZmZjg4ODE1MjEzNDAwNCBieSB0YXNrICh1ZGV2LXdvcmtlcikvNTkxClsg
ICAzMi45NTk1NzRdIENQVTogMyBVSUQ6IDAgUElEOiA1OTEgQ29tbTogKHVkZXYtd29ya2Vy
KSBUYWludGVkOiBHICAgICAgICAgICAgRSAgICAgIDYuMTMuMC1yYzItMS1kZWZhdWx0KyAj
MzQxNwpbICAgMzIuOTYwMzE2XSBUYWludGVkOiBbRV09VU5TSUdORURfTU9EVUxFClsgICAz
Mi45NjA2MzddIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKFEzNSArIElDSDks
IDIwMDkpLCBCSU9TIHJlbC0xLjE2LjMtMi1nYzEzZmYyY2QtcHJlYnVpbHQucWVtdS5vcmcg
MDQvMDEvMjAxNApbICAgMzIuOTYxNDI5XSBDYWxsIFRyYWNlOgpbICAgMzIuOTYxNDMzXSAg
PFRBU0s+ClsgICAzMi45NjE0MzldICBkdW1wX3N0YWNrX2x2bCsweDY4LzB4OTAKWyAgIDMy
Ljk2MTQ1Ml0gIHByaW50X2FkZHJlc3NfZGVzY3JpcHRpb24uY29uc3Rwcm9wLjArMHg4OC8w
eDMzMApbICAgMzIuOTYxNDYxXSAgPyBwcmVlbXB0X2NvdW50X3N1YisweDE0LzB4YzAKWyAg
IDMyLjk2MTQ3M10gIHByaW50X3JlcG9ydCsweGUyLzB4MWQwClsgICAzMi45NjE0NzldICA/
IHNyc29fYWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1ClsgICAzMi45NjM3MjVdICA/
IF9fdmlydF9hZGRyX3ZhbGlkKzB4MTQzLzB4MzIwClsgICAzMi45NjQwNzddICA/IHNyc29f
YWxpYXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1ClsgICAzMi45NjQ0NjNdICA/IGRybV9k
ZXZfcHV0LnBhcnQuMCsweDFiLzB4OTAKWyAgIDMyLjk2NDgxN10gIGthc2FuX3JlcG9ydCsw
eGNlLzB4MWEwClsgICAzMi45NjUxMjNdICA/IGRybV9kZXZfcHV0LnBhcnQuMCsweDFiLzB4
OTAKWyAgIDMyLjk2NTQ3NF0gIGthc2FuX2NoZWNrX3JhbmdlKzB4ZmYvMHgxYzAKWyAgIDMy
Ljk2NTgwNl0gIGRybV9kZXZfcHV0LnBhcnQuMCsweDFiLzB4OTAKWyAgIDMyLjk2NjEzOF0g
IHJlbGVhc2Vfbm9kZXMrMHg4NC8weGMwClsgICAzMi45NjY0NDddICBkZXZyZXNfcmVsZWFz
ZV9hbGwrMHhkMi8weDExMApbICAgMzIuOTY2Nzg4XSAgPyBfX3BmeF9kZXZyZXNfcmVsZWFz
ZV9hbGwrMHgxMC8weDEwClsgICAzMi45NjcxNzddICA/IHByZWVtcHRfY291bnRfc3ViKzB4
MTQvMHhjMApbICAgMzIuOTY3NTIzXSAgZGV2aWNlX3VuYmluZF9jbGVhbnVwKzB4MTYvMHhj
MApbICAgMzIuOTY3ODg2XSAgcmVhbGx5X3Byb2JlKzB4MWI3LzB4NTcwClsgICAzMi45Njgy
MDddICBfX2RyaXZlcl9wcm9iZV9kZXZpY2UrMHhjYS8weDFiMApbICAgMzIuOTY4NTY4XSAg
ZHJpdmVyX3Byb2JlX2RldmljZSsweDRhLzB4ZjAKWyAgIDMyLjk2ODkwN10gIF9fZHJpdmVy
X2F0dGFjaCsweDEwYi8weDI5MApbICAgMzIuOTY5MjM5XSAgPyBfX3BmeF9fX2RyaXZlcl9h
dHRhY2grMHgxMC8weDEwClsgICAzMi45Njk1OThdICBidXNfZm9yX2VhY2hfZGV2KzB4YzAv
MHgxMTAKWyAgIDMyLjk2OTkyM10gID8gX19wZnhfYnVzX2Zvcl9lYWNoX2RldisweDEwLzB4
MTAKWyAgIDMyLjk3MDI5MV0gID8gYnVzX2FkZF9kcml2ZXIrMHgxN2EvMHgyYjAKWyAgIDMy
Ljk3MDYyMl0gID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUKWyAgIDMy
Ljk3MTAxMV0gIGJ1c19hZGRfZHJpdmVyKzB4MTlhLzB4MmIwClsgICAzMi45NzEzMzVdICBk
cml2ZXJfcmVnaXN0ZXIrMHhkOC8weDE2MApbICAgMzIuOTcxNjcxXSAgPyBfX3BmeF9ib2No
c19wY2lfZHJpdmVyX2luaXQrMHgxMC8weDEwIFtib2Noc10KWyAgIDMyLjk3MjEzMF0gIGRv
X29uZV9pbml0Y2FsbCsweGJhLzB4MzkwClsuLi5dCgpBZnRlciB1bnBsdWdnaW5nIHRoZSBE
Uk0gZGV2aWNlLCBjbGllbnRzIHdpbGwgY2xvc2UgdGhlaXIgcmVmZXJlbmNlcy4KQ2xvc2lu
ZyB0aGUgZmluYWwgcmVmZXJlbmNlIHdpbGwgYWxzbyByZWxlYXNlIHRoZSBEUk0gZGV2aWNl
LgoKUmVwb3J0ZWQtYnk6IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgPGRhdmVAdHJlYmxpZy5v
cmc+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9aMThkYmZEQWlGYWRz
U2RnQGdhbGxpZnJleS8KRml4ZXM6IDA0ODI2ZjU4ODY4MiAoImRybS9ib2NoczogQWxsb2Nh
dGUgRFJNIGRldmljZSBpbiBzdHJ1Y3QgYm9jaHNfZGV2aWNlIikKQ2M6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVs
QHJlZGhhdC5jb20+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC5kZXYKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5j
IGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYwppbmRleCA4OWE2OTkzNzBhNTkuLmM2
N2UxZjkwNjc4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9ib2Nocy5jCkBAIC03NTcsNyArNzU3LDYgQEAg
c3RhdGljIHZvaWQgYm9jaHNfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAog
CWRybV9kZXZfdW5wbHVnKGRldik7CiAJZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oZGV2
KTsKLQlkcm1fZGV2X3B1dChkZXYpOwogfQogCiBzdGF0aWMgdm9pZCBib2Noc19wY2lfc2h1
dGRvd24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCi0tIAoyLjQ3LjEKCg==

--------------ySx5PJpNBY0nl1rIzyRJJvkM--
