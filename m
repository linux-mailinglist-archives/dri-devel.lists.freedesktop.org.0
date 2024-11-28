Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A759DBAD8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 16:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA1110E004;
	Thu, 28 Nov 2024 15:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AXZgskj4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D8copplw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AXZgskj4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D8copplw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6E110E004
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 15:47:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74E581F79D;
 Thu, 28 Nov 2024 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732808829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uKWyaFa0mX+PHx38AhoVOgLoivrOl8b9B3vecYhZ3VA=;
 b=AXZgskj4crTYcDj44pclUd6Kz4061C9MURJUIbMC7nw1EptHsRtyB00LhNtTU9AGt/fUnP
 VpWobUgdFr4+5iCzg0n6j8dZOL+G/KeEH8RZJgkC3d9CogKbdb5fWC0VObZaJ96UbjheYK
 0NsC9F68c+EfVT7JYVWZvfJuc2CQqAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732808829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uKWyaFa0mX+PHx38AhoVOgLoivrOl8b9B3vecYhZ3VA=;
 b=D8copplwZisVgxHeoa8QbgB8kfTOwQAQeeybIAibRNudPkpA1FLxrJ+cUGptff331Ml7hz
 fp1+NvjdTYd8pRCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732808829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uKWyaFa0mX+PHx38AhoVOgLoivrOl8b9B3vecYhZ3VA=;
 b=AXZgskj4crTYcDj44pclUd6Kz4061C9MURJUIbMC7nw1EptHsRtyB00LhNtTU9AGt/fUnP
 VpWobUgdFr4+5iCzg0n6j8dZOL+G/KeEH8RZJgkC3d9CogKbdb5fWC0VObZaJ96UbjheYK
 0NsC9F68c+EfVT7JYVWZvfJuc2CQqAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732808829;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uKWyaFa0mX+PHx38AhoVOgLoivrOl8b9B3vecYhZ3VA=;
 b=D8copplwZisVgxHeoa8QbgB8kfTOwQAQeeybIAibRNudPkpA1FLxrJ+cUGptff331Ml7hz
 fp1+NvjdTYd8pRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 473A313690;
 Thu, 28 Nov 2024 15:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hC8gEH2QSGdhLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Nov 2024 15:47:09 +0000
Content-Type: multipart/mixed; boundary="------------P0xzCZ0cKZ0v1KO4CcaVotQX"
Message-ID: <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de>
Date: Thu, 28 Nov 2024 16:47:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/fbdev-dma: regression
To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>
References: <20220621104617.8817-1-tzimmermann@suse.de>
 <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info>
 <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
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
In-Reply-To: <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-0.90)[-0.905];
 NEURAL_HAM_SHORT(-0.20)[-0.992]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 HAS_ATTACHMENT(0.00)[]
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
--------------P0xzCZ0cKZ0v1KO4CcaVotQX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 11.11.24 um 14:42 schrieb Nuno Gonçalves:
> On Mon, Nov 11, 2024 at 1:22 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> The patch in question changes the whole memory management of the
>> affected code. It's also noteworthy that most of it has been reworked
>> for the upcoming v6.12. Maybe this already fixed the problem. Kernel
>> v6.11-rc7 added commit 5a498d4d06d6 ("drm/fbdev-dma: Only install
>> deferred I/O if necessary"), which possibly fixes the problem as well.
>>
>> But there's no explicit fix for this problem and I have not seen any
>> other related reports. Any further information is welcome.
> Issue was present since 5ab91447aa13b8b98bc11f5326f33500b0ee2c48 and
> tested until 6.12-rc3.
> Is there any suggestion on how to dig down?

Here's a first attempt to address this bug. Could you please apply the 
attached patch and report on the results? It should work against the 
upcoming v6.13-rc1 or against a recent drm-misc-next.

Best regards
Thomas

>
> Thanks

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------P0xzCZ0cKZ0v1KO4CcaVotQX
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fbdev-dma-Support-deferred-I-O-without-smem_start.patch"
Content-Disposition: attachment;
 filename*0="0001-fbdev-dma-Support-deferred-I-O-without-smem_start.patch"
Content-Transfer-Encoding: base64

RnJvbSA0MGQ0ODEyNjY0OTc0MzdlYmFhNTMxMmM5YWY5NjQxMzYxYjE3MmY4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAyOCBOb3YgMjAyNCAxNDoyNTowMyArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGZiZGV2LWRtYTogU3VwcG9ydCBkZWZlcnJlZCBJL08gd2l0aG91dCBzbWVt
X3N0YXJ0CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jCmluZGV4IGIxNGI1ODFjMDU5ZC4uNmE5NGQx
YjYyNDc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2RtYS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZG1hLmMKQEAgLTgsNiArOCw3IEBACiAj
aW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1l
YnVmZmVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZG1hX2hlbHBlci5oPgorI2luY2x1
ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogCiAvKgogICogc3RydWN0
IGZiX29wcwpAQCAtMTI0LDYgKzEyNSwyOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9m
Yl9oZWxwZXJfZnVuY3MgZHJtX2ZiZGV2X2RtYV9oZWxwZXJfZnVuY3MgPSB7CiAJLmZiX2Rp
cnR5ID0gZHJtX2ZiZGV2X2RtYV9oZWxwZXJfZmJfZGlydHksCiB9OwogCitzdGF0aWMgc3Ry
dWN0IHBhZ2UgKmRybV9mYmRldl9kbWFfZ2V0X3BhZ2Uoc3RydWN0IGZiX2luZm8gKmluZm8s
IHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQoreworCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9o
ZWxwZXIgPSBpbmZvLT5wYXI7CisJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBmYl9o
ZWxwZXItPmZiOworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gZHJtX2dlbV9mYl9n
ZXRfb2JqKGZiLCAwKTsKKwljb25zdCB2b2lkICphZGRyID0gaW5mby0+c2NyZWVuX2J1ZmZl
ciArIG9mZnNldDsKKwlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7CisKKwlpZiAoZmJfV0FS
Tl9PTl9PTkNFKGluZm8sIG9mZnNldCA+IG9iai0+c2l6ZSkpCisJCXJldHVybiBOVUxMOwor
CisJaWYgKGlzX3ZtYWxsb2NfYWRkcihhZGRyKSkKKwkJcGFnZSA9IHZtYWxsb2NfdG9fcGFn
ZShhZGRyKTsKKwllbHNlIGlmICh2aXJ0X2FkZHJfdmFsaWQoYWRkcikpCisJCXBhZ2UgPSB2
aXJ0X3RvX3BhZ2UoYWRkcik7CisKKwlpZiAoIWZiX1dBUk5fT05fT05DRShpbmZvLCAhcGFn
ZSkpCisJCWdldF9wYWdlKHBhZ2UpOworCisJcmV0dXJuIHBhZ2U7Cit9CisKIC8qCiAgKiBz
dHJ1Y3QgZHJtX2ZiX2hlbHBlcgogICovCkBAIC0yMTcsNiArMjQwLDcgQEAgaW50IGRybV9m
YmRldl9kbWFfZHJpdmVyX2ZiZGV2X3Byb2JlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9o
ZWxwZXIsCiAJLyogZGVmZXJyZWQgSS9PICovCiAJaWYgKHVzZV9kZWZlcnJlZF9pbykgewog
CQlmYl9oZWxwZXItPmZiZGVmaW8uZGVsYXkgPSBIWiAvIDIwOworCQlmYl9oZWxwZXItPmZi
ZGVmaW8uZ2V0X3BhZ2UgPSBkcm1fZmJkZXZfZG1hX2dldF9wYWdlOwogCQlmYl9oZWxwZXIt
PmZiZGVmaW8uZGVmZXJyZWRfaW8gPSBkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvOwogCiAJ
CWluZm8tPmZiZGVmaW8gPSAmZmJfaGVscGVyLT5mYmRlZmlvOwotLSAKMi40Ny4wCgo=

--------------P0xzCZ0cKZ0v1KO4CcaVotQX--
