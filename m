Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD964C01346
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F102E10E415;
	Thu, 23 Oct 2025 12:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xCpHMp+R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="81mpbfL3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T0zqnMWK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mRn5gSNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E6610E415
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:47:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8293C1F79D;
 Thu, 23 Oct 2025 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761223615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=66Z5CznZ7odjpwPMy4M1I/dek6aDfSMiPt+5W7PivNI=;
 b=xCpHMp+RuAbppEodJeitpWmIaGDRA6rWHttqmKBCGTLcKOrejYcXS+tx2Rj/Mvd+BRjXER
 Oj+vHDFDXZlq3i9yG+5gRO/jU/u96WVQgldJGyRF5FcCtWura/l9yjcML98Dhhc+KI5Cqh
 2vVYU9oLbwpfsUJAxalhD469hRjzwcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761223615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=66Z5CznZ7odjpwPMy4M1I/dek6aDfSMiPt+5W7PivNI=;
 b=81mpbfL3PpOqyMoMpqNs13bqmkTHnCMEjAkz/kqsWDqcwJA3fvp7RdXk4s56IwItty6vqY
 CUaoWnNgg8oczADA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761223611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=66Z5CznZ7odjpwPMy4M1I/dek6aDfSMiPt+5W7PivNI=;
 b=T0zqnMWKPN+hTPuXFrFPDXf4U34+Wu5qFmQHpGoFZiFvcj3hY+ksScfpGvbCNm0akoFBMC
 o9ss9ONT+iE2cJcHgFa8UeHUgqK/mdaaFNcCFAqqNdiMu8c0JvGy8ZEQt99hnRfgEK1bDd
 pExJ/SAAnEk6UR5JqsT4GYXgMBssD3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761223611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=66Z5CznZ7odjpwPMy4M1I/dek6aDfSMiPt+5W7PivNI=;
 b=mRn5gSNWAE9kBZeXYIQsOWXxBYdArcF9jAuyKnH0XzoW8vZKNq/o1wXwvID3srjLzIfNPp
 AEwwi2eCz3qvEiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29EDC13285;
 Thu, 23 Oct 2025 12:46:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yjSYB7sj+mibAgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 12:46:51 +0000
Content-Type: multipart/mixed; boundary="------------W3Z0M8wWf0unhfX0d2zFxBG1"
Message-ID: <329a9f97-dd66-49c2-bc42-470566d01539@suse.de>
Date: Thu, 23 Oct 2025 14:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
To: Peter Schneider <pschneider1968@googlemail.com>,
 regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
 <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
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
In-Reply-To: <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
X-Spamd-Result: default: False [-3.19 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.953]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[googlemail.com,lists.linux.dev,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[googlemail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.19
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
--------------W3Z0M8wWf0unhfX0d2zFxBG1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 22.10.25 um 13:23 schrieb Peter Schneider:
> Am 22.10.2025 um 12:20 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 22.10.25 um 11:16 schrieb Peter Schneider:
>>> Am 22.10.2025 um 11:11 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 22.10.25 um 10:08 schrieb Peter Schneider:
>>>>>
>>>>> Your patch applied cleanly against 6.18-rc2 and the kernel built 
>>>>> fine, but unfortunately it did not solve the issue: my console 
>>>>> screen stays blank after booting. This is regardless whether I do 
>>>>> a soft reboot, press the reset button or power cycle and do a cold 
>>>>> boot. They are all the same.
>>>>
>>>> Just to be sure: you do see output at the early boot stages (BIOS, 
>>>> boot loader). It's at some later point during boot, the driver 
>>>> loads and the display blanks out?
>>>
>>> Yes, that's correct.
>>>
>>>> There's another patch attached. does this make a difference?
>>>
>>> Do I have to apply that against base 6.18-rc2 or against 6.18-rc2 + 
>>> your previous patch?
>>
>> Base 6.18-rc2. All the patches are against this.
>
> So with this new patch against 6.18-rc2, I first got this build error:
>
>   CC [M]  drivers/gpu/drm/ast/ast_mode.o
> drivers/gpu/drm/ast/ast_mode.c: In function 
> ‘ast_crtc_helper_atomic_disable’:
> drivers/gpu/drm/ast/ast_mode.c:857:12: error: unused variable 
> ‘vgacr17’ [-Werror=unused-variable]
>   857 |         u8 vgacr17 = 0xff;
>       |            ^~~~~~~
> cc1: all warnings being treated as errors
>
>
> because I always do my kernel builds with CONFIG_WERROR=y. So then I 
> commented out the now superfluous declaration in line 857 and the 
> build succeeded. However, unfortunately the issue still persists. The 
> screen still gets blanked on reboot (as clarified before, after 
> BIOS/POST messages, Grub boot menu, initial boot messages).

I've been able to reproduce the problem with an AST2300 test system. The 
attached patch fixes the problem for me. Can you please test and report 
on the results?

Best regards
Thomas


>
> Beste Grüße,
> Peter Schneider
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


--------------W3Z0M8wWf0unhfX0d2zFxBG1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-clear-preserved-bits-from-output-value.patch"
Content-Disposition: attachment;
 filename="0001-ast-clear-preserved-bits-from-output-value.patch"
Content-Transfer-Encoding: base64

RnJvbSBiOWE5MGQ5ZWYyNjZkNWY5ZDNhZWI5NzBhZTM1ZTEwYjcxNmZjNDY2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAyMyBPY3QgMjAyNSAxNDozMDoyOSArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogY2xlYXIgcHJlc2VydmVkIGJpdHMgZnJvbSBvdXRwdXQgdmFsdWUK
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggfCA5ICsrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X2Rydi5oCmluZGV4IDdiZTM2YTM1OGU3NC4uNjAyYmZmN2Y5OGQ5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9kcnYuaApAQCAtMjk4LDEzICsyOTgsMTQgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fYXN0X3dyaXRlOF9pKHZvaWQgX19pb21lbSAqYWRkciwgdTMyIHJlZywgdTggaW5k
ZXgsIHU4IHZhbCkKIAlfX2FzdF93cml0ZTgoYWRkciwgcmVnICsgMSwgdmFsKTsKIH0KIAot
c3RhdGljIGlubGluZSB2b2lkIF9fYXN0X3dyaXRlOF9pX21hc2tlZCh2b2lkIF9faW9tZW0g
KmFkZHIsIHUzMiByZWcsIHU4IGluZGV4LCB1OCByZWFkX21hc2ssCitzdGF0aWMgaW5saW5l
IHZvaWQgX19hc3Rfd3JpdGU4X2lfbWFza2VkKHZvaWQgX19pb21lbSAqYWRkciwgdTMyIHJl
ZywgdTggaW5kZXgsIHU4IHByZXNlcnZlX21hc2ssCiAJCQkJCSB1OCB2YWwpCiB7Ci0JdTgg
dG1wID0gX19hc3RfcmVhZDhfaV9tYXNrZWQoYWRkciwgcmVnLCBpbmRleCwgcmVhZF9tYXNr
KTsKKwl1OCB0bXAgPSBfX2FzdF9yZWFkOF9pX21hc2tlZChhZGRyLCByZWcsIGluZGV4LCBw
cmVzZXJ2ZV9tYXNrKTsKIAotCXRtcCB8PSB2YWw7Ci0JX19hc3Rfd3JpdGU4X2koYWRkciwg
cmVnLCBpbmRleCwgdG1wKTsKKwl2YWwgJj0gfnByZXNlcnZlX21hc2s7CisKKwlfX2FzdF93
cml0ZThfaShhZGRyLCByZWcsIGluZGV4LCB0bXAgfCB2YWwpOwogfQogCiBzdGF0aWMgaW5s
aW5lIHUzMiBhc3RfcmVhZDMyKHN0cnVjdCBhc3RfZGV2aWNlICphc3QsIHUzMiByZWcpCi0t
IAoyLjUxLjAKCg==

--------------W3Z0M8wWf0unhfX0d2zFxBG1--
