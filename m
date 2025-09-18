Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C24B8450B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 13:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9BD10E70F;
	Thu, 18 Sep 2025 11:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="a/nuax2c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h7voNygG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a/nuax2c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h7voNygG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98C910E707
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 11:17:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72056336E7;
 Thu, 18 Sep 2025 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758194237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mut0b748Hi+Q5LznaSKN6uCnTAhEVcZK4pYNYVoEwis=;
 b=a/nuax2cmfkhubJeAoLVxVYHr1ojN7o1zNQdKLihxDkWJdbjL01R3vNH5pyqeovt/8GHZO
 uiNHzqUmO+tdiJldMIl8yMs4DlCBaoSQAXnDWW2ONwtnIekR2lW+zlz//3bz2pd/6u3K8C
 Xi8oQGWpcJ6tYZiYhiKFtRHlzD+eQIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758194237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mut0b748Hi+Q5LznaSKN6uCnTAhEVcZK4pYNYVoEwis=;
 b=h7voNygGEVSiJ/N3Lq0JGbSTVvoEn6yC6rakBXAHgfjMBg1ks4frCqDuCjDz85L5ocNSG1
 53cYHqaRZbBJFpCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="a/nuax2c";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h7voNygG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758194237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mut0b748Hi+Q5LznaSKN6uCnTAhEVcZK4pYNYVoEwis=;
 b=a/nuax2cmfkhubJeAoLVxVYHr1ojN7o1zNQdKLihxDkWJdbjL01R3vNH5pyqeovt/8GHZO
 uiNHzqUmO+tdiJldMIl8yMs4DlCBaoSQAXnDWW2ONwtnIekR2lW+zlz//3bz2pd/6u3K8C
 Xi8oQGWpcJ6tYZiYhiKFtRHlzD+eQIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758194237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mut0b748Hi+Q5LznaSKN6uCnTAhEVcZK4pYNYVoEwis=;
 b=h7voNygGEVSiJ/N3Lq0JGbSTVvoEn6yC6rakBXAHgfjMBg1ks4frCqDuCjDz85L5ocNSG1
 53cYHqaRZbBJFpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4106F13A39;
 Thu, 18 Sep 2025 11:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VuMxDj3qy2hzfgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 11:17:17 +0000
Content-Type: multipart/mixed; boundary="------------vupL6B6jOl0dl79XEW8C83jg"
Message-ID: <f1de37ae-2ae4-4513-98fd-18617016704a@suse.de>
Date: Thu, 18 Sep 2025 13:17:16 +0200
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
In-Reply-To: <cox6kpackepnunrlhpsssvgdmjd24477cc7mide52xptmmoxyr@ijjotb3xju3v>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 72056336E7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+]; DKIM_TRACE(0.00)[suse.de:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,bootlin.com:url,suse.de:dkim,suse.de:mid,suse.de:email];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -3.41
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
--------------vupL6B6jOl0dl79XEW8C83jg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 18.09.25 um 04:04 schrieb Nick Bowler:
> On Wed, Sep 17, 2025 at 11:14:45AM -0400, Nick Bowler wrote:
>> On Fri, Aug 29, 2025 at 03:07:14PM +0200, Thomas Zimmermann wrote:
>>> The ast driver doesn't do much during shutdown. Could you please out-comment
>>> the lines at either [2] xor [3] and report on either effect? These calls
>>> turn of the video chip's memory access and sync pulses. Not doing that might
>>> resolve the problem.
>>>
>>> [2] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L835
>>> [3] https://elixir.bootlin.com/linux/v6.16.3/source/drivers/gpu/drm/ast/ast_mode.c#L839
>> I can try this.
> OK, I tested 6.17-rc6 and reproduced the problem on this version.  Then:
>
>    - Deleting [2] (only) appears to make no difference whatsoever. That
>      is, deleting the following line in ast_mode.c:
>
>        ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
>
>    - Deleting [3] (only) appears sufficient to make things work again,
>      that is, deleting the following line in ast_mode.c:
>
>        ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);

Please test if the attached patch fixes the problem for you.

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


--------------vupL6B6jOl0dl79XEW8C83jg
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ast-Use-VGACR17-sync-enable.patch"
Content-Disposition: attachment;
 filename="0001-ast-Use-VGACR17-sync-enable.patch"
Content-Transfer-Encoding: base64

RnJvbSA1MWViYjU3M2EwOTA0OTRkZTc5Y2JiNzFlOWIyOTI1NWUxMzY0ZTFjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogVGh1LCAxOCBTZXAgMjAyNSAwOTo1MDoyOCArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIGFzdDogVXNlIFZHQUNSMTcgc3luYyBlbmFibGUKCkJsYW5rIHRoZSBkaXNw
bGF5IGJ5IGRpc2FibGluZyBzeW5jIHB1bHNlcyB3aXRoIFZHQUNSMTc8Nz4uIFNvbWUKQk1D
J3MgZG9uJ3QgaGFuZGxlIFZHQUNSQjYgY29ycmVjdGx5LiBBbmQgZG9uJ3QgbW9kaWZ5IFZH
QVNSMSdzIFNECmJpdCwgd2hpY2ggb25seSBkaXNhYmxlcyBHUFUgYWNjZXNzIHRvIFZSQU0u
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMTQgKysrKysrLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3JlZy5oICB8ICAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYwppbmRleCBiNGU4ZWRjN2M3NjcuLjBkZjA2ZGU5YjY0NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYwpAQCAtODM2LDIyICs4MzYsMjAgQEAgYXN0X2NydGNfaGVscGVyX2F0
b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiBzdGF0aWMgdm9pZCBhc3RfY3J0
Y19oZWxwZXJfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKIAlzdHJ1Y3QgYXN0X2RldmljZSAqYXN0ID0g
dG9fYXN0X2RldmljZShjcnRjLT5kZXYpOworCXU4IHZnYWNyMTcgPSAweDAwOwogCi0JYXN0
X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkksIDB4YjYsIDB4ZmMsIDB4
MDApOwotCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBU1JJLCAweDAx
LCAweGRmLCAweDAwKTsKKwl2Z2FjcjE3IHw9IEFTVF9JT19WR0FDUjE3X1NZTkNfRU5BQkxF
OworCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBQ1JJLCAweDE3LCAw
eDdmLCB2Z2FjcjE3KTsKIH0KIAogc3RhdGljIHZvaWQgYXN0X2NydGNfaGVscGVyX2F0b21p
Y19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlKQogewogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUg
PSBkcm1fYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7CiAJc3RydWN0
IGFzdF9kZXZpY2UgKmFzdCA9IHRvX2FzdF9kZXZpY2UoY3J0Yy0+ZGV2KTsKLQl1OCB2Z2Fj
cmI2OworCXU4IHZnYWNyMTcgPSAweGZmOwogCi0JYXN0X3NldF9pbmRleF9yZWdfbWFzayhh
c3QsIEFTVF9JT19WR0FTUkksIDB4MDEsIDB4ZGYsIEFTVF9JT19WR0FTUjFfU0QpOwotCi0J
dmdhY3JiNiA9IEFTVF9JT19WR0FDUkI2X1ZTWU5DX09GRiB8Ci0JCSAgQVNUX0lPX1ZHQUNS
QjZfSFNZTkNfT0ZGOwotCWFzdF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdB
Q1JJLCAweGI2LCAweGZjLCB2Z2FjcmI2KTsKKwl2Z2FjcjE3ICY9IH5BU1RfSU9fVkdBQ1Ix
N19TWU5DX0VOQUJMRTsKKwlhc3Rfc2V0X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZH
QUNSSSwgMHgxNywgMHg3ZiwgdmdhY3IxNyk7CiAKIAkvKgogCSAqIEhXIGN1cnNvcnMgcmVx
dWlyZSB0aGUgdW5kZXJseWluZyBwcmltYXJ5IHBsYW5lIGFuZCBDUlRDIHRvCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X3JlZy5oCmluZGV4IGUxNWFkYWYzYTgwZS4uMzA1NzhlM2IwN2U0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9yZWcuaApAQCAtMjksNiArMjksNyBAQAogI2RlZmluZSBBU1RfSU9fVkdB
R1JJCQkJKDB4NEUpCiAKICNkZWZpbmUgQVNUX0lPX1ZHQUNSSQkJCSgweDU0KQorI2RlZmlu
ZSBBU1RfSU9fVkdBQ1IxN19TWU5DX0VOQUJMRQlCSVQoNykgLyogY2FsbGVkICJIYXJkd2Fy
ZSByZXNldCIgaW4gZG9jcyAqLwogI2RlZmluZSBBU1RfSU9fVkdBQ1I4MF9QQVNTV09SRAkJ
KDB4YTgpCiAjZGVmaW5lIEFTVF9JT19WR0FDUjk5X1ZHQU1FTV9SU1JWX01BU0sJR0VOTUFT
SygxLCAwKQogI2RlZmluZSBBU1RfSU9fVkdBQ1JBMV9WR0FJT19ESVNBQkxFRAlCSVQoMSkK
LS0gCjIuNTEuMAoK

--------------vupL6B6jOl0dl79XEW8C83jg--
