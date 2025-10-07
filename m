Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D48BC0C81
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BADA10E5B7;
	Tue,  7 Oct 2025 08:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="NSa1fb+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5oCTVcZK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NSa1fb+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5oCTVcZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA0B10E5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:51:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F7541F7B7;
 Tue,  7 Oct 2025 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759827090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tbJTJpLwjBmXuAyfWKpVEI1MdnKtyIlz2dYDnFjI3gQ=;
 b=NSa1fb+mroZbWuVXq6mZWIU5oS5c7U1Wk207zvfWPHTGbvMp8usgqkU/VVJ0xtKMJxCzVB
 D+NJDP2EVPWiqarCiFlnxFBcjww1Q0ozeipCWjCzWMCZJQRePgUUxtbvH/LJJDsjRRe77H
 8KnhlifmhERrFIOZirHK1rJ+XOwbzsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759827090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tbJTJpLwjBmXuAyfWKpVEI1MdnKtyIlz2dYDnFjI3gQ=;
 b=5oCTVcZK4x7g2SpV47mf3wL9bi/YYKBhz1U36JYYo8xMXG2k2qFVZGDNa0icOqm0Pb3pX3
 HECwi8r4Mu0aTXBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759827090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tbJTJpLwjBmXuAyfWKpVEI1MdnKtyIlz2dYDnFjI3gQ=;
 b=NSa1fb+mroZbWuVXq6mZWIU5oS5c7U1Wk207zvfWPHTGbvMp8usgqkU/VVJ0xtKMJxCzVB
 D+NJDP2EVPWiqarCiFlnxFBcjww1Q0ozeipCWjCzWMCZJQRePgUUxtbvH/LJJDsjRRe77H
 8KnhlifmhERrFIOZirHK1rJ+XOwbzsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759827090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tbJTJpLwjBmXuAyfWKpVEI1MdnKtyIlz2dYDnFjI3gQ=;
 b=5oCTVcZK4x7g2SpV47mf3wL9bi/YYKBhz1U36JYYo8xMXG2k2qFVZGDNa0icOqm0Pb3pX3
 HECwi8r4Mu0aTXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2258813693;
 Tue,  7 Oct 2025 08:51:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HDT0BpLU5GjZQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 08:51:30 +0000
Content-Type: multipart/mixed; boundary="------------BKHzetE687peU8NbqM0brEVV"
Message-ID: <e0104f10-9230-41e5-acd1-4ca95c38220e@suse.de>
Date: Tue, 7 Oct 2025 10:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <ef6558a9-c44a-4c66-967c-187f260f73e1@suse.de>
 <xeipdyk2i2lpkg4rrvz4cl2l3ch62sl4zoa73qvlms3ek3zkci@y7xqbgjulaet>
 <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
 <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
 <5949fd73-3ca4-4bd9-8092-2d9923dcbfd3@suse.de>
 <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
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
In-Reply-To: <qjyncqymjja57h2wxxv3ebuqpip5qu7yjalccons5xmtzfw5h5@m3u4rvbqzcxt>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.20 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.20
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
--------------BKHzetE687peU8NbqM0brEVV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 04.10.25 um 02:31 schrieb Nick Bowler:
> On Wed, Oct 01, 2025 at 09:26:28AM +0200, Thomas Zimmermann wrote:
>> Am 18.09.25 um 13:17 schrieb Thomas Zimmermann:
>>> Am 18.09.25 um 04:04 schrieb Nick Bowler:
>>>> On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
>>>>> On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
>>>>>> The ast driver doesn't do much during shutdown. Could you
>>>>>> please out-comment the lines at either [2] xor [3] and report
>>>>>> on either effect?
> [...]
>>>>>> [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
>>>>>> [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
> [...]
>>>>     - Deleting [3] (only) appears sufficient to make things work again,
>>>>       that is, deleting the following line in ast_mode.c:
>>>>
>>>>         ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>>> Please test if the attached patch fixes the problem for you.
>> Have you been able to test the patch?
> In the normal scenario where everything is working and I reboot, then
> the display remains on for the firmware (this would seem to be an
> improvement).
>
> But it introduces a new problem: the screen no longer turns back on if
> I boot the patched kernel from the "display off" state.  The unpatched
> 6.17 kernel would at least turn the display back on from this.
> Furthermore, rebooting from this state keeps the display off.
>
> The earlier change [3] above has no such problems.

Thanks again for testing. Looks like your BMC is especially picky about 
these settings. :)

Attached are two patches; each trying to eliminate one of the possible 
causes. Could you please test them individually and report the results?

Best regards
Thomas

>
> Thanks,
>    Nick

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


--------------BKHzetE687peU8NbqM0brEVV
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-Use-VGACR17-sync-enable-and-VGACRB6-sync-off.patch"
Content-Disposition: attachment;
 filename*0="0001-ast-Use-VGACR17-sync-enable-and-VGACRB6-sync-off.patch"
Content-Transfer-Encoding: base64

RnJvbSAzZWE5MTc2MmFkMDc3ZjQ5MTQzYWU2Y2JmNDgwMjAzODZhMmVjYzY1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxOCBTZXAgMjAyNSAwOTo1MDoyOCArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogVXNlIFZHQUNSMTcgc3luYyBlbmFibGUgYW5kIFZHQUNSQjYgc3lu
YyBvZmYKCkJsYW5rIHRoZSBkaXNwbGF5IGJ5IGRpc2FibGluZyBzeW5jIHB1bHNlcyB3aXRo
IFZHQUNSMTc8Nz4uIFNvbWUKQk1DJ3MgZG9uJ3QgaGFuZGxlIFZHQUNSQjYgY29ycmVjdGx5
LiBBbmQgZG9uJ3QgbW9kaWZ5IFZHQVNSMSdzIFNECmJpdCwgd2hpY2ggb25seSBkaXNhYmxl
cyBHUFUgYWNjZXNzIHRvIFZSQU0uCi0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9y
ZWcuaCAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IDZiOWQ1MTBjNTA5ZC4u
ZmU4MDg5MjY2ZGI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04MzYsMjIgKzgz
NiwyNCBAQCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YywKIHN0YXRpYyB2b2lkIGFzdF9jcnRjX2hlbHBlcl9hdG9taWNfZW5hYmxlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogewog
CXN0cnVjdCBhc3RfZGV2aWNlICphc3QgPSB0b19hc3RfZGV2aWNlKGNydGMtPmRldik7CisJ
dTggdmdhY3IxNyA9IDB4MDA7CisJdTggdmdhY3JiNiA9IDB4MDA7CiAKLQlhc3Rfc2V0X2lu
ZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQUNSSSwgMHhiNiwgMHhmYywgMHgwMCk7Ci0J
YXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FTUkksIDB4MDEsIDB4ZGYs
IDB4MDApOworCXZnYWNyMTcgfD0gQVNUX0lPX1ZHQUNSMTdfU1lOQ19FTkFCTEU7CisJdmdh
Y3JiNiAmPSB+KEFTVF9JT19WR0FDUkI2X1ZTWU5DX09GRiB8IEFTVF9JT19WR0FDUkI2X0hT
WU5DX09GRik7CisKKwlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQUNS
SSwgMHgxNywgMHg3ZiwgdmdhY3IxNyk7CisJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3Qs
IEFTVF9JT19WR0FDUkksIDB4YjYsIDB4ZmMsIHZnYWNyYjYpOwogfQogCiBzdGF0aWMgdm9p
ZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRj
LCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiB7CiAJc3RydWN0IGRybV9jcnRj
X3N0YXRlICpvbGRfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9jcnRjX3N0YXRl
KHN0YXRlLCBjcnRjKTsKIAlzdHJ1Y3QgYXN0X2RldmljZSAqYXN0ID0gdG9fYXN0X2Rldmlj
ZShjcnRjLT5kZXYpOwotCXU4IHZnYWNyYjY7CisJdTggdmdhY3IxNyA9IDB4ZmY7CiAKLQlh
c3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQVNSSSwgMHgwMSwgMHhkZiwg
QVNUX0lPX1ZHQVNSMV9TRCk7Ci0KLQl2Z2FjcmI2ID0gQVNUX0lPX1ZHQUNSQjZfVlNZTkNf
T0ZGIHwKLQkJICBBU1RfSU9fVkdBQ1JCNl9IU1lOQ19PRkY7Ci0JYXN0X3NldF9pbmRleF9y
ZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkksIDB4YjYsIDB4ZmMsIHZnYWNyYjYpOworCXZn
YWNyMTcgJj0gfkFTVF9JT19WR0FDUjE3X1NZTkNfRU5BQkxFOworCWFzdF9zZXRfaW5kZXhf
cmVnX21hc2soYXN0LCBBU1RfSU9fVkdBQ1JJLCAweDE3LCAweDdmLCB2Z2FjcjE3KTsKIAog
CS8qCiAJICogSFcgY3Vyc29ycyByZXF1aXJlIHRoZSB1bmRlcmx5aW5nIHByaW1hcnkgcGxh
bmUgYW5kIENSVEMgdG8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Jl
Zy5oIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcmVnLmgKaW5kZXggZTE1YWRhZjNhODBl
Li4zMDU3OGUzYjA3ZTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Jl
Zy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3JlZy5oCkBAIC0yOSw2ICsyOSw3
IEBACiAjZGVmaW5lIEFTVF9JT19WR0FHUkkJCQkoMHg0RSkKIAogI2RlZmluZSBBU1RfSU9f
VkdBQ1JJCQkJKDB4NTQpCisjZGVmaW5lIEFTVF9JT19WR0FDUjE3X1NZTkNfRU5BQkxFCUJJ
VCg3KSAvKiBjYWxsZWQgIkhhcmR3YXJlIHJlc2V0IiBpbiBkb2NzICovCiAjZGVmaW5lIEFT
VF9JT19WR0FDUjgwX1BBU1NXT1JECQkoMHhhOCkKICNkZWZpbmUgQVNUX0lPX1ZHQUNSOTlf
VkdBTUVNX1JTUlZfTUFTSwlHRU5NQVNLKDEsIDApCiAjZGVmaW5lIEFTVF9JT19WR0FDUkEx
X1ZHQUlPX0RJU0FCTEVECUJJVCgxKQotLSAKMi41MS4wCgo=
--------------BKHzetE687peU8NbqM0brEVV
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-Use-VGACR17-sync-enable-and-VGASR01-screen-disab.patch"
Content-Disposition: attachment;
 filename*0="0001-ast-Use-VGACR17-sync-enable-and-VGASR01-screen-disab.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA2N2U5Y2JiNjZiZTQ3ZmQyYWVhZGQyYWQ5MWZlMTVlMDc2MzQwMTQwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxOCBTZXAgMjAyNSAwOTo1MDoyOCArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogVXNlIFZHQUNSMTcgc3luYyBlbmFibGUgYW5kIFZHQVNSMDEgc2Ny
ZWVuIGRpc2FibGUKCkJsYW5rIHRoZSBkaXNwbGF5IGJ5IGRpc2FibGluZyBzeW5jIHB1bHNl
cyB3aXRoIFZHQUNSMTc8Nz4uIFNvbWUKQk1DJ3MgZG9uJ3QgaGFuZGxlIFZHQUNSQjYgY29y
cmVjdGx5LiBLZWVwIHRoZSBjaGFuZ2UgdG8gVkdBU1IxJ3MKU0QgYml0LCBhcyBzb21lIEJN
Q3MgZGlzYWJsZSBHUFUgYWNjZXNzIHRvIFZSQU0uCi0tLQogZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbW9kZS5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9yZWcuaCAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IDZiOWQ1
MTBjNTA5ZC4uOGUzZDU2Nzk4ZTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04
MzYsMjIgKzgzNiwyNCBAQCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIHN0YXRpYyB2b2lkIGFzdF9jcnRjX2hlbHBlcl9hdG9taWNfZW5h
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0
YXRlKQogewogCXN0cnVjdCBhc3RfZGV2aWNlICphc3QgPSB0b19hc3RfZGV2aWNlKGNydGMt
PmRldik7CisJdTggdmdhY3IxNyA9IDB4MDA7CisJdTggdmdhc3IwMSA9IDB4MDA7CiAKLQlh
c3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQUNSSSwgMHhiNiwgMHhmYywg
MHgwMCk7Ci0JYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FTUkksIDB4
MDEsIDB4ZGYsIDB4MDApOworCXZnYWNyMTcgfD0gQVNUX0lPX1ZHQUNSMTdfU1lOQ19FTkFC
TEU7CisJdmdhc3IwMSAmPSB+QVNUX0lPX1ZHQVNSMV9TRDsKKworCWFzdF9zZXRfaW5kZXhf
cmVnX21hc2soYXN0LCBBU1RfSU9fVkdBQ1JJLCAweDE3LCAweDdmLCB2Z2FjcjE3KTsKKwlh
c3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQVNSSSwgMHgwMSwgMHhkZiwg
dmdhc3IwMSk7CiB9CiAKIHN0YXRpYyB2b2lkIGFzdF9jcnRjX2hlbHBlcl9hdG9taWNfZGlz
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZSkKIHsKIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlID0gZHJt
X2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOwogCXN0cnVjdCBhc3Rf
ZGV2aWNlICphc3QgPSB0b19hc3RfZGV2aWNlKGNydGMtPmRldik7Ci0JdTggdmdhY3JiNjsK
LQotCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBU1JJLCAweDAxLCAw
eGRmLCBBU1RfSU9fVkdBU1IxX1NEKTsKKwl1OCB2Z2FjcjE3ID0gMHhmZjsKIAotCXZnYWNy
YjYgPSBBU1RfSU9fVkdBQ1JCNl9WU1lOQ19PRkYgfAotCQkgIEFTVF9JT19WR0FDUkI2X0hT
WU5DX09GRjsKLQlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQUNSSSwg
MHhiNiwgMHhmYywgdmdhY3JiNik7CisJdmdhY3IxNyAmPSB+QVNUX0lPX1ZHQUNSMTdfU1lO
Q19FTkFCTEU7CisJYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkks
IDB4MTcsIDB4N2YsIHZnYWNyMTcpOwogCiAJLyoKIAkgKiBIVyBjdXJzb3JzIHJlcXVpcmUg
dGhlIHVuZGVybHlpbmcgcHJpbWFyeSBwbGFuZSBhbmQgQ1JUQyB0bwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9yZWcuaAppbmRleCBlMTVhZGFmM2E4MGUuLjMwNTc4ZTNiMDdlNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcmVnLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfcmVnLmgKQEAgLTI5LDYgKzI5LDcgQEAKICNkZWZpbmUgQVNUX0lPX1ZHQUdSSQkJ
CSgweDRFKQogCiAjZGVmaW5lIEFTVF9JT19WR0FDUkkJCQkoMHg1NCkKKyNkZWZpbmUgQVNU
X0lPX1ZHQUNSMTdfU1lOQ19FTkFCTEUJQklUKDcpIC8qIGNhbGxlZCAiSGFyZHdhcmUgcmVz
ZXQiIGluIGRvY3MgKi8KICNkZWZpbmUgQVNUX0lPX1ZHQUNSODBfUEFTU1dPUkQJCSgweGE4
KQogI2RlZmluZSBBU1RfSU9fVkdBQ1I5OV9WR0FNRU1fUlNSVl9NQVNLCUdFTk1BU0soMSwg
MCkKICNkZWZpbmUgQVNUX0lPX1ZHQUNSQTFfVkdBSU9fRElTQUJMRUQJQklUKDEpCi0tIAoy
LjUxLjAKCg==

--------------BKHzetE687peU8NbqM0brEVV--
