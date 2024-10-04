Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3398FF78
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC8810E25F;
	Fri,  4 Oct 2024 09:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="X3KLTaYf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4KtBbmFK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3KLTaYf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4KtBbmFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0E10E9C2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 09:17:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3EB521E2C;
 Fri,  4 Oct 2024 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728033426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ZNSdqpvnSRoYMeR2U1o4zbyOKGguZ35HIQ05/Q6lwQ=;
 b=X3KLTaYftw6+ttSAjuUPLsxQYEUs1ScTfPDHdBxS1+U52CBNkHP0zRM6yhHDEwEYcxvWaQ
 OsH8imeSOjqWvKtSH0VN2bi6bFdcbYiKIoaD3Ip/Z6MHVFgoVrLc7qBTUktdOCDPdSPZkO
 q1w6RXLHjPOpA6bi9BTmYsU0yBEdfZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728033426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ZNSdqpvnSRoYMeR2U1o4zbyOKGguZ35HIQ05/Q6lwQ=;
 b=4KtBbmFKzP8uO/vUOPQp7940rrCFw9v+J17pzDHFRXHnQYnYQ6ZFKA5VkJCES3iIW7SflP
 ZZJHAtJgC8BwroAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728033426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ZNSdqpvnSRoYMeR2U1o4zbyOKGguZ35HIQ05/Q6lwQ=;
 b=X3KLTaYftw6+ttSAjuUPLsxQYEUs1ScTfPDHdBxS1+U52CBNkHP0zRM6yhHDEwEYcxvWaQ
 OsH8imeSOjqWvKtSH0VN2bi6bFdcbYiKIoaD3Ip/Z6MHVFgoVrLc7qBTUktdOCDPdSPZkO
 q1w6RXLHjPOpA6bi9BTmYsU0yBEdfZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728033426;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/ZNSdqpvnSRoYMeR2U1o4zbyOKGguZ35HIQ05/Q6lwQ=;
 b=4KtBbmFKzP8uO/vUOPQp7940rrCFw9v+J17pzDHFRXHnQYnYQ6ZFKA5VkJCES3iIW7SflP
 ZZJHAtJgC8BwroAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CF9F13A55;
 Fri,  4 Oct 2024 09:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id psHDNI+y/2aLBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 09:17:03 +0000
Content-Type: multipart/mixed; boundary="------------1jT1IP0EKdljg6H4PgBZvlrj"
Message-ID: <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
Date: Fri, 4 Oct 2024 11:17:02 +0200
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
In-Reply-To: <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-1.70 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-0.998];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 TAGGED_RCPT(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 RCPT_COUNT_SEVEN(0.00)[10]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -1.70
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
--------------1jT1IP0EKdljg6H4PgBZvlrj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 02.10.24 um 18:15 schrieb Luck, Tony:
>> Thanks for the bug report. Can you provide the output of 'sudo lspci
>> -vvv' for the graphics device?
> Thomas,
>
> Sure. Here's the output (run on the v6.11.0 kernel)

Thanks. It doesn't look much different from other systems. IRQ is also 
assigned.

Attached is a patch that fixes a possible off-by-one error in the 
register settings. This would affect the bug you're reporting. If 
possible, please apply the patch to your 6.12-rc1, test and report the 
result.

Best regards
Thomas

>
> $ sudo lspci -vvv -s 0000:08:00.0
> 08:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA G200e [Pilot] ServerEngines (SEP1) (rev 05) (prog-if 00 [VGA controller])
>          Subsystem: Intel Corporation Device 0103
>          Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Interrupt: pin A routed to IRQ 16
>          Region 0: Memory at 90000000 (32-bit, prefetchable) [size=16M]
>          Region 1: Memory at 91800000 (32-bit, non-prefetchable) [size=16K]
>          Region 2: Memory at 91000000 (32-bit, non-prefetchable) [size=8M]
>          Expansion ROM at 91810000 [disabled] [size=64K]
>          Capabilities: [dc] Power Management version 2
>                  Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                  Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>          Capabilities: [e4] Express (v1) Legacy Endpoint, MSI 00
>                  DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <64ns, L1 <1us
>                          ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
>                  DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                          RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                          MaxPayload 128 bytes, MaxReadReq 128 bytes
>                  DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
>                  LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s, Exit Latency L0s <64ns
>                          ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>                  LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>                          ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                  LnkSta: Speed 2.5GT/s (ok), Width x1 (ok)
>                          TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>          Capabilities: [54] MSI: Enable- Count=1/1 Maskable- 64bit-
>                  Address: 00000000  Data: 0000
>          Kernel driver in use: mgag200
>          Kernel modules: mgag200
>
> -Tony

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------1jT1IP0EKdljg6H4PgBZvlrj
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-matrox-Fix-off-by-one-error-in-vblank-start-valu.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-matrox-Fix-off-by-one-error-in-vblank-start-valu.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzMDA1MmM0MTBiYTVkZTcxMDUwNmM3Mjc5YjY0MzRkYjM5ZTYwOTA2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogRnJpLCA0IE9jdCAyMDI0IDEwOjQzOjA0ICswMjAwClN1YmplY3Q6
IFtQQVRDSF0gZHJtL21hdHJveDogRml4IG9mZi1ieS1vbmUgZXJyb3IgaW4gdmJsYW5rIHN0
YXJ0IHZhbHVlCgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwppbmRleCA3MTU5OTA5
YWNhMWUuLjlkOTA1YjM3OWYzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9tb2RlLmMKQEAgLTIyNCw3ICsyMjQsNyBAQCB2b2lkIG1nYWcyMDBfc2V0X21vZGVfcmVn
cyhzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZAogCXZzeW5jc3RyID0gbW9kZS0+Y3J0Y192c3luY19zdGFydCAtIDE7CiAJdnN5bmNlbmQg
PSBtb2RlLT5jcnRjX3ZzeW5jX2VuZCAtIDE7CiAJdnRvdGFsID0gbW9kZS0+Y3J0Y192dG90
YWwgLSAyOwotCXZibGtzdHIgPSBtb2RlLT5jcnRjX3ZibGFua19zdGFydDsKKwl2Ymxrc3Ry
ID0gbW9kZS0+Y3J0Y192Ymxhbmtfc3RhcnQgLSAxOwogCXZibGtlbmQgPSB2dG90YWwgKyAx
OwogCiAJLyoKLS0gCjIuNDYuMAoK

--------------1jT1IP0EKdljg6H4PgBZvlrj--
