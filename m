Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F024DBFB177
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB98010E15B;
	Wed, 22 Oct 2025 09:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="W0aWkm30";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZTAhkox9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="urvz5H0T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QK2lD9CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060FB10E15B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:12:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0BB7D1F397;
 Wed, 22 Oct 2025 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761124321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cw5kWRl1Bd7qYVYp6/DsOMSD1R+FICQyPDwP157acEg=;
 b=W0aWkm30t7gzuBhBdM6UjDNBoNTPWCsxOk4jTCgGxu3dgF6u6ejB5sAl2GEpWrQ9WwGiSK
 6JfRaxSe1nMC85ZJQjKcXNhHS7ctdI9ewJve00BtHCBuG7NZo7GAG4yIDg9BjBh96N8Unn
 mfRTKnGtMk/aDrDWdb3jlebsZopjwZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761124321;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cw5kWRl1Bd7qYVYp6/DsOMSD1R+FICQyPDwP157acEg=;
 b=ZTAhkox9wIlL5Z97TRd7ANxIUCzk4Yqf9QoGIEg5zBfMyldXLyg/dz+I6TkeENmMJxDMJw
 Vky4jEdEtDowi1BA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=urvz5H0T;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QK2lD9CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761124317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cw5kWRl1Bd7qYVYp6/DsOMSD1R+FICQyPDwP157acEg=;
 b=urvz5H0T6GpVq39dohXI5YdVSGsBu+ZFYVPeqbHEDxV6JVrV2CHN7HqHm3Co5+rqZNrxTG
 uEK7kGwiyoIufW8wAixc0F/xmPlfz6rC5pr9EtxuFsJNf6WCaCFjuc6hJEJ6ZknXfHZGhb
 czqU+2jiZVHEaWMlRwfzGCTjKxXBj+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761124317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cw5kWRl1Bd7qYVYp6/DsOMSD1R+FICQyPDwP157acEg=;
 b=QK2lD9CFNTaG8cjouCCkfuK2tZxdHCs5FgZLEPwb05lIDmj8XSgXnYODdRNStOQUjubnLe
 7G6oo22OY0Iy3tAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C76F13A29;
 Wed, 22 Oct 2025 09:11:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EjnwJNyf+Gj3dAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Oct 2025 09:11:56 +0000
Content-Type: multipart/mixed; boundary="------------LYtJwVQ0ylxAhEFDOTekbpiR"
Message-ID: <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
Date: Wed, 22 Oct 2025 11:11:56 +0200
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
In-Reply-To: <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0BB7D1F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.41 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.978];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[googlemail.com,lists.linux.dev,vger.kernel.org];
 RCPT_COUNT_TWELVE(0.00)[12]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[googlemail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; HAS_ATTACHMENT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
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
--------------LYtJwVQ0ylxAhEFDOTekbpiR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

Am 22.10.25 um 10:08 schrieb Peter Schneider:
> Hi Thomas,
>
> thanks very much for your quick response!
>
> (adding Thorsten to CC)
>
>
> Am 22.10.2025 um 08:51 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 22.10.25 um 05:27 schrieb Peter Schneider:
>>> #regzbot introduced: 6f719373b943a955fee6fc2012aed207b65e2854
>>>
>>> Hi all,
>>>
>>> I have encountered a serious (for me) regression with 6.18-rc2 on my 
>>> 2-socket Ivy Bridge Xeon E5-2697 v2 server. After booting, my 
>>> console screen goes blank and stays blank. 6.18-rc1 was still fine.
>>>
>>> The machine has an Asus Z9PE-D16 server mainboard with an onboard 
>>> ASpeed AST2300 VGA chip with 16MB VRAM. I have attached an older HP 
>>> Monitor to it via old VGA jack/cable. It also has a second graphics 
>>> card in a PCI-E slot; an older NVidia GTX 560. It is not connected 
>>> to a monitor, but I have configured it via kernel command line for 
>>> PCI-pass- through to VMs running on this server (I use Proxmox VE, 
>>> i.e. QEMU/KVM virtual machines). Currently, no VMs use this yet, and 
>>> also no VMs are autostarting with machine boot. So when this 
>>> regression occurs, the server is idle. Pressing a key on the 
>>> keyboard does not make the screen come alive. The server is running 
>>> fine though, and I can access it via SSH. It just has no graphic 
>>> output anymore. In case this is important, the machine also has a 
>>> ASMB6 BMC (can be used via http).
>>>
>>> I have attached dmesg output from both 6.18-rc1 which is fine, and 
>>> 6.18-rc2 which exhibits this bug. I have bisected the issue, please 
>>> see attached git bisect.log.
>>
>> Thanks for the detailed bug report.
>>
>> Attached is a patch that partially reverts the broken commit. Could 
>> you please apply it on top of the broken kernel and report on the 
>> results?
>>
>> Best regards
>> Thomas
>
>
> Your patch applied cleanly against 6.18-rc2 and the kernel built fine, 
> but unfortunately it did not solve the issue: my console screen stays 
> blank after booting. This is regardless whether I do a soft reboot, 
> press the reset button or power cycle and do a cold boot. They are all 
> the same.

Just to be sure: you do see output at the early boot stages (BIOS, boot 
loader). It's at some later point during boot, the driver loads and the 
display blanks out?

There's another patch attached. does this make a difference?

Best regards
Thomas

>
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


--------------LYtJwVQ0ylxAhEFDOTekbpiR
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-v2-ast-Set-clear-screen-disable-bit.patch"
Content-Disposition: attachment;
 filename="0001-v2-ast-Set-clear-screen-disable-bit.patch"
Content-Transfer-Encoding: base64

RnJvbSAwODAwZThhZWFmMGMxZmQ2YzQ5YTlmZTIxNGYzOWM2NTUzNDViYjMxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogV2VkLCAyMiBPY3QgMjAyNSAwODo0ODo0OSArMDIwMApTdWJqZWN0
OiBbUEFUQ0hdIFt2Ml0gYXN0OiBTZXQvY2xlYXIgc2NyZWVuLWRpc2FibGUgYml0CgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDEyICsrKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbW9kZS5jCmluZGV4IDljZTg3NGRiYTY5Yy4uMDVjYmYyZmM2NTYwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04MjAsNiArODIwLDcgQEAgYXN0X2NydGNfaGVs
cGVyX2F0b21pY19mbHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiBzdGF0aWMgdm9pZCBh
c3RfY3J0Y19oZWxwZXJfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIHsKIAlzdHJ1Y3QgYXN0X2RldmljZSAq
YXN0ID0gdG9fYXN0X2RldmljZShjcnRjLT5kZXYpOworCXU4IHZnYXNyMSA9IDB4ZmY7CiAJ
dTggdmdhY3IxNyA9IDB4MDA7CiAJdTggdmdhY3JiNiA9IDB4ZmY7CiAKQEAgLTgyOCw2ICs4
MjksOSBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2VuYWJsZShzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdCBkcm1fYXRvbQogCiAJYXN0X3NldF9pbmRleF9y
ZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkksIDB4MTcsIDB4N2YsIHZnYWNyMTcpOwogCWFz
dF9zZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBQ1JJLCAweGI2LCAweGZjLCB2
Z2FjcmI2KTsKKworCXZnYXNyMSAmPSB+QVNUX0lPX1ZHQVNSMV9TRDsKKwlhc3Rfc2V0X2lu
ZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1ZHQVNSSSwgMHgwMSwgMHhkZiwgdmdhc3IxKTsK
IH0KIAogc3RhdGljIHZvaWQgYXN0X2NydGNfaGVscGVyX2F0b21pY19kaXNhYmxlKHN0cnVj
dCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQpAQCAt
ODM1LDkgKzgzOSwxMyBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2Rp
c2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2F0bwogCXN0cnVjdCBk
cm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9vbGRfY3J0
Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7CiAJc3RydWN0IGFzdF9kZXZpY2UgKmFzdCA9IHRvX2Fz
dF9kZXZpY2UoY3J0Yy0+ZGV2KTsKIAl1OCB2Z2FjcjE3ID0gMHhmZjsKKwl1OCB2Z2FzcjEg
PSAweDAwOwogCi0JdmdhY3IxNyAmPSB+QVNUX0lPX1ZHQUNSMTdfU1lOQ19FTkFCTEU7Ci0J
YXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19WR0FDUkksIDB4MTcsIDB4N2Ys
IHZnYWNyMTcpOworCXZnYXNyMSB8PSBBU1RfSU9fVkdBU1IxX1NEOworCWFzdF9zZXRfaW5k
ZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBU1JJLCAweDAxLCAweGRmLCB2Z2FzcjEpOwor
CisJLy92Z2FjcjE3ICY9IH5BU1RfSU9fVkdBQ1IxN19TWU5DX0VOQUJMRTsKKwkvL2FzdF9z
ZXRfaW5kZXhfcmVnX21hc2soYXN0LCBBU1RfSU9fVkdBQ1JJLCAweDE3LCAweDdmLCB2Z2Fj
cjE3KTsKIAogCS8qCiAJICogSFcgY3Vyc29ycyByZXF1aXJlIHRoZSB1bmRlcmx5aW5nIHBy
aW1hcnkgcGxhbmUgYW5kIENSVEMgdG8KLS0gCjIuNTEuMAoK

--------------LYtJwVQ0ylxAhEFDOTekbpiR--
