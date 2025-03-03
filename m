Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65328A4BBD8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9F510E3B9;
	Mon,  3 Mar 2025 10:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yhxD9S0R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zMArEjSR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yhxD9S0R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zMArEjSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EFD10E3B9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:16:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9EC522116F;
 Mon,  3 Mar 2025 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740997018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ubBbK8oAs7y69hr1F84Z6OKu7WqZ9MJzrnq0Kb84LZw=;
 b=yhxD9S0RtH+ee/4MpLeQYBI9x9HoemOtFaXb8QphJZyW3CogvzMFNLJMPHYdZ9BP8v2DCf
 noZ3+L3GY2lNdQPJ9OOwPnNXgw4ERKrauJTF6Zy4GPkWZPUB7VjNvXEuR5H5EDX7CClJNl
 yJPt4H6Yde/APypBkHGrjhUB+LR2w0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740997018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ubBbK8oAs7y69hr1F84Z6OKu7WqZ9MJzrnq0Kb84LZw=;
 b=zMArEjSRRA+K+xUpanyzoFiTtvpExhBLuZLV5vJZmyaY3aIQTKuiL3MVMoE19wGRhl3uyN
 vmT0VyHJZM76B7CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740997018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ubBbK8oAs7y69hr1F84Z6OKu7WqZ9MJzrnq0Kb84LZw=;
 b=yhxD9S0RtH+ee/4MpLeQYBI9x9HoemOtFaXb8QphJZyW3CogvzMFNLJMPHYdZ9BP8v2DCf
 noZ3+L3GY2lNdQPJ9OOwPnNXgw4ERKrauJTF6Zy4GPkWZPUB7VjNvXEuR5H5EDX7CClJNl
 yJPt4H6Yde/APypBkHGrjhUB+LR2w0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740997018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ubBbK8oAs7y69hr1F84Z6OKu7WqZ9MJzrnq0Kb84LZw=;
 b=zMArEjSRRA+K+xUpanyzoFiTtvpExhBLuZLV5vJZmyaY3aIQTKuiL3MVMoE19wGRhl3uyN
 vmT0VyHJZM76B7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8084B13939;
 Mon,  3 Mar 2025 10:16:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JV4RHpqBxWfwFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Mar 2025 10:16:58 +0000
Content-Type: multipart/mixed; boundary="------------GL0ZmSbBMAkmRkceUspk6EFf"
Message-ID: <cec03d41-f04d-4fb4-b76d-2c1e6fd02c11@suse.de>
Date: Mon, 3 Mar 2025 11:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
To: Nicolas Baranger <nicolas.baranger@3xo.fr>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <bc089e81-2e09-41e9-a9d1-68b2f4372e7f@suse.de>
 <183881a57671db7eebada5ac8cbcb8cf@3xo.fr>
 <17888ffd-4311-436b-9fec-dfb041268643@suse.de>
 <aceb4e94f0a08ce62879a5b976407507@3xo.fr>
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
In-Reply-To: <aceb4e94f0a08ce62879a5b976407507@3xo.fr>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.19 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-0.99)[-0.993];
 NEURAL_HAM_SHORT(-0.20)[-0.996];
 MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
 MIME_BASE64_TEXT(0.10)[]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 HAS_ATTACHMENT(0.00)[]
X-Spam-Score: -3.19
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
--------------GL0ZmSbBMAkmRkceUspk6EFf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(cc'ing Jocelyn)

Am 03.03.25 um 09:44 schrieb Nicolas Baranger:
> Hi Thomas
>
>> I do have an idea what might be happening here. You are using 6.13.1, 
>> right?  If I give you a patch file for this kernel, are you able to 
>> apply it (with 'git am') for testing and report the kernel's logging 
>> output?
>
> Yes I'm using Linux 6.13.1 but I can also test with the latest 
> linux-stable 6.13.5 or on mainline, whatever help you the best.
> The only thing is I cannot go before Linux 6.13+ because it it fix DIO 
> write on netfs (regression introduced in 6.10) and I'm using this 
> feature for backups.
>
> I think I should be able to patch and use 'git am' (In the worst 
> there's always https://git-scm.com/docs/git-am), and I would be happy 
> to report the kernel logging output

Great. You'll find a patch attached against the 6.13 kernel. Let me know 
if it doesn't apply.

If it applies, please run your performance test and look at the dmesg 
output. It should contain warnings about shared GEM objects. Can you 
please report some of this output?

Best regards
Thomas

>
> Thanks again for help
>
> Kind regards
> Nicolas Baranger
>
> Le 2025-03-03 09:19, Thomas Zimmermann a écrit :
>
>> Hi
>>
>> Am 03.03.25 um 09:07 schrieb Nicolas Baranger: Dear Thomas
>>
>> You are using NVidia's proprietary driver, right? Did you reach out 
>> to them wrt this problem? Or searched their support forums, online 
>> help, etc? If so, what are the results?
>> Yes I'm using NVidia propriétary driver.
>> Maybe I'm wrong but I did not ask their support directly because 
>> first, for me it seems that there is no issue with the NVidia driver 
>> and unfortunately NVidia is not as opensource mind as Linux kernel 
>> community (as an example you can have a look on my last PR here 
>> https://github.com/NVIDIA/open-gpu-kernel-modules/pull/783 which had 
>> not been reviewed since 3+ weeks... and without this PR, it's 
>> impossible to build open or closed source NVidia drivers on mainline)
>
> I see.
>
> I do have an idea what might be happening here. You are using 6.13.1, 
> right?  If I give you a patch file for this kernel, are you able to 
> apply it (with 'git am') for testing and report the kernel's logging 
> output?
>
> Best regards
> Thomas
>
>> Second, I thought I already report it here but on my system using a 
>> recent kernel and embeded ast 0.1.0 driver has a very poor rendering 
>> and graphic is very slow, twinkle is high, had poor colors and it's 
>> happenning even if the NVidia driver is unloaded
>> The screen flickering is high too and it's like if I was using an old 
>> cathode ray tube monitor (I'm using an LCD monitor which display a 
>> nice and eyes confortable picture when using ast 1.15.1 driver or 
>> when displaying directly the video output of the Nvidia GPU(using 
>> HDMI output)).
>> Third, approximately from Linux 6.10+ using the embeded ast driver I 
>> have some lag when sliding a window on Gnome desktop (Xorg not 
>> Wayland) and CPU is highly used (some coreS at 100%), but I do not 
>> have those lag with ast 1.15.1 and CPU is less used (1 core at less 
>> than 80% max)
>> For the moment, I think Linux 6.12.9 is the worst I constat
>>
>> Last, I found that Linux 6.1.128 is working perfectly out of the box 
>> with embeded ast 0.1.0 driver and there is a manifest lost of 
>> performances with Vulkan and Nvidia prime render offload when 
>> upgrading to Linux 6.2 (using same NVidia driver version, I did test 
>> those 3 versions  535.216.01, 550.142, and 550.144.03 with similar 
>> results).
>> But in Linux 6.2, except the lost of performances, I did not constat 
>> the poor rendering and twinkle on the screen nor lag when sliding a 
>> window on the desktop or too high CPU usage.
>>
>> So I suspect there is something else introduced between Linux 6.2 and 
>> mainline which cause this behavior.
>>
>> I'm continuing bissection and I'm sorry, it's not as fast as I would 
>> as each tests tooks some times and I must never tell something wrong 
>> to git if I don't want to restart all the work...
>>
>> Thanks again for answer and help
>>
>> Kind regards
>> Nicolas Baranger
>>
>> Le 2025-02-28 11:06, Thomas Zimmermann a écrit :
>>
>> Hi
>>
>> Am 11.02.25 um 19:15 schrieb Nicolas Baranger:
>>
>> Dear maintener
>>
>> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
>> driver on mainline kernel (6.13.0 + 6.13.1).
>>
>> ASPEED video driver is availiable here:
>> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
>>
>> But it only work for LTS kernel
>> So I modify the DKMS package and I build a new Debian DKMS package 
>> with the adapted  source.
>> My patch can be find here :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
>> See the README:
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
>>
>> Using this new 'ast 1.15.1' driver, performance are amazing compared 
>> to the 'ast' driver include in kernel tree, specially when using a 
>> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card 
>> as the main video card and as the main and only video output (the 
>> discrete GPU is used only for offloading 3D or for cuda/opencl)
>> You are using NVidia's proprietary driver, right? Did you reach out 
>> to them wrt this problem? Or searched their support forums, online 
>> help, etc? If so, what are the results?
>>
>> Best regards
>> Thomas
>>
>> So to make things easier, I include the new 'ast 1.15.1' driver in 
>> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
>> It's working fine as you can see on this video :
>> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 
>> I upload all the work I've done here :
>> https://xba.soartist.net/ast-drm_nba_20250211/
>>
>> See the global README :
>> https://xba.soartist.net/ast-drm_nba_20250211/README
>>
>> and the README in nba-kernel sub-directory :
>> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
>>
>> I'm not a developer so please let me know if I made the things the 
>> right way and if this new 'ast 1.15.1' driver can be ported to 
>> linux-next or linux-? ?
>> If you need more explanations, do not hesitate to contact me, I would 
>> be happy to help
>>
>> Kind regards
>> Nicolas Baranger

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------GL0ZmSbBMAkmRkceUspk6EFf
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-warn-if-shared-buffers-are-in-I-O-memory.patch"
Content-Disposition: attachment;
 filename="0001-warn-if-shared-buffers-are-in-I-O-memory.patch"
Content-Transfer-Encoding: base64

RnJvbSBjODZkODc0MzUwYmE2ZGQ2N2NjNzlmYTNmNzYzYzEyNmJjOWRjOTg3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogTW9uLCAzIE1hciAyMDI1IDExOjEyOjEwICswMTAwClN1YmplY3Q6
IFtQQVRDSF0gd2FybiBpZiBzaGFyZWQgYnVmZmVycyBhcmUgaW4gSS9PIG1lbW9yeQoKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA5ICsrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwppbmRl
eCBjM2I5NTA2NzU0ODUuLjQ0NzgxZjdiNzMzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUu
YwpAQCAtNTA1LDYgKzUwNSwxNSBAQCBzdGF0aWMgdm9pZCBhc3RfaGFuZGxlX2RhbWFnZShz
dHJ1Y3QgYXN0X3BsYW5lICphc3RfcGxhbmUsIHN0cnVjdCBpb3N5c19tYXAgKnNyYwogewog
CXN0cnVjdCBpb3N5c19tYXAgZHN0ID0gSU9TWVNfTUFQX0lOSVRfVkFERFJfSU9NRU0oYXN0
X3BsYW5lLT52YWRkcik7CiAKKwl7CisJCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtID0g
ZmItPm9ialswXTsKKworCQlpZiAoZ2VtICYmIGdlbS0+ZG1hX2J1ZikgeworCQkJZHJtX3dh
cm4oZmItPmRldiwgIkdFTSBvYmplY3QgaXMgc2hhcmVkLCBsb2NhdGVkIGluIEkvTyBtZW1v
cnk6ICVkXG4iLAorCQkJCSBzcmMtPmlzX2lvbWVtKTsKKwkJfQorCX0KKwogCWlvc3lzX21h
cF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29mZnNldChmYi0+cGl0Y2hlc1swXSwgZmItPmZv
cm1hdCwgY2xpcCkpOwogCWRybV9mYl9tZW1jcHkoJmRzdCwgZmItPnBpdGNoZXMsIHNyYywg
ZmIsIGNsaXApOwogfQotLSAKMi40OC4xCgo=

--------------GL0ZmSbBMAkmRkceUspk6EFf--
