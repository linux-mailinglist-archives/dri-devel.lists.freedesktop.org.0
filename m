Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93BABFF715
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387C110E093;
	Thu, 23 Oct 2025 07:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZQ4C6HOi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wJq3k0f/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2KdfIl+9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JYBoeqFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8C710E093
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:02:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFA321F397;
 Thu, 23 Oct 2025 07:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761202939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZVvoOzwh5j9AYt0h5Jf9ru41okK9IE0M+KdZ+Xy6iX8=;
 b=ZQ4C6HOiC+F3ptsD12PQryGvJXoPFmsqbJUhMpU+LRlvmD6vJXM+NYF6L1zxtdb2MTK0+O
 lb2NfVe+DseErUENfbNmjd9uSecVRj7FLhw6sOrw04vNWKN1x9GYpsm8ApBVA5Xl2YR21o
 NQ7L/WbWN3cKn84L53dWoMPpgrlXvKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761202939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZVvoOzwh5j9AYt0h5Jf9ru41okK9IE0M+KdZ+Xy6iX8=;
 b=wJq3k0f/ktzlKcSWD+1q/Btk59BxP2IJ24dsyKBcG+pwUaRB0Ui6zCon+RvPx4FtscxV63
 b2kYJR82b5JVhUBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2KdfIl+9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JYBoeqFI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761202935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZVvoOzwh5j9AYt0h5Jf9ru41okK9IE0M+KdZ+Xy6iX8=;
 b=2KdfIl+9354wACNt7zqirNWlmv8WSJiZVLFwwQLR43VQ3rD6qxQMPG8m5M2Zke3ZkVKYRD
 GtPbaAJN8hadQQq3ZVZGWePZyzhD7zrLKRHbh93dUz5KbeAoXHHUbw6l+TrHOxQpxADfhx
 e+hS7yosqPlusVFIBN8XJopR5OmHE9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761202935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZVvoOzwh5j9AYt0h5Jf9ru41okK9IE0M+KdZ+Xy6iX8=;
 b=JYBoeqFI/ePNbid/eSXYlJ/dC/nN+NhpQ1WgAKkKoRxk/HlIH9CO3Et6pMTw4zZj/5OFXe
 u/6aI+1EJESiadBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDD48136CF;
 Thu, 23 Oct 2025 07:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id A0DQMPbS+WhINAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 07:02:14 +0000
Message-ID: <5894f3ce-1d0b-4628-9db5-972fa16dac19@suse.de>
Date: Thu, 23 Oct 2025 09:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
To: Hans de Goede <hansg@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, nickblack@linux.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
 <9eb60fce-b235-4dad-8672-1cc4e61309c5@kernel.org>
 <2457f184-96ee-4937-8b3d-ccd97deef118@suse.de>
 <8890f707-56bb-4b6b-a8e8-aad9fb1e0ab8@kernel.org>
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
In-Reply-To: <8890f707-56bb-4b6b-a8e8-aad9fb1e0ab8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EFA321F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUBJECT_ENDS_QUESTION(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
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

Am 22.10.25 um 20:37 schrieb Hans de Goede:
[...]
>> Yes, the GRUB patch is mostly useful for VESA. For EFI on x86,
>> I posted a patch series to fetch the EDID in the EFI stub and
>> forward it to the kernel. Have a look at [1].
> This looks good, very nice!
>
> I assume the stub + copying thing is because this all depends
> on EFI boot services and this cannot be done after calling
> exit-bootservices, right ?

Yes.

>
> You might want to mention that in the commit-messages.

Good idea. I'll do so in the next update.

>
>> For non-x86 EFI systems, I also have a prototype, but wanted to get the x86 done first. I have to some research if systemd-boot requires anything extra.
> Since the kernel now retrieves the EDID itself I don't expect
> systemd-boot to need anything extra. Unlike grub which loads
> the kernel itself even in EFI mode (a), I believe that systemd
> always executes the kernel as an EFI binary and thus always
> uses the efistub (which IMHO is the right thing to do).
>
>> Things are moving in the right direction.
> Definitely, once more thank you for working on this.
>
> Regards,
>
> Hans
>
>
> a) Grub upstream that is, Fedora at least has patches to
> instead execute the kernel as an EFI binary using the stub

Same here on openSUSE Tumbleweed. But upstream GRUB's EDID support 
should also work with UEFI; not just VESA.

Best regards
Thomas

>
>> [1] https://lore.kernel.org/lkml/20251015160816.525825-1-tzimmermann@suse.de/
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


