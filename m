Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD36A8B446
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96910E895;
	Wed, 16 Apr 2025 08:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0usSjG8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fPJmfU2F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0usSjG8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fPJmfU2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C9710E895
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:47:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84DEF21169;
 Wed, 16 Apr 2025 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744793248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/iQa/bHlCIV3jsmb10Jofbx4+n/X1xLWQ0SmjyAFFU=;
 b=0usSjG8LHRzyBwcpCz++NuQFU/uSctREooE549wfOjtbR7nvram3QfDrQOq9lHI0ATTcQD
 uyXqzsxKHLLnD1To5LJ3FbQ0P5+kmGri8Kf//bDsVNG8NBFu2bn64UiBwXVy1D6yhtr5f2
 Xb5LSbjPXNqXv6ibhhe3YqiaMaAU9Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744793248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/iQa/bHlCIV3jsmb10Jofbx4+n/X1xLWQ0SmjyAFFU=;
 b=fPJmfU2F7RvE0YdLZyDgz14wtr2fM+90sHR2rvmyNTNj6C+ghnnOUb9v+eHRzUtM1ktWhO
 /Hl4Nwf0uH5cTvAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0usSjG8L;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fPJmfU2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744793248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/iQa/bHlCIV3jsmb10Jofbx4+n/X1xLWQ0SmjyAFFU=;
 b=0usSjG8LHRzyBwcpCz++NuQFU/uSctREooE549wfOjtbR7nvram3QfDrQOq9lHI0ATTcQD
 uyXqzsxKHLLnD1To5LJ3FbQ0P5+kmGri8Kf//bDsVNG8NBFu2bn64UiBwXVy1D6yhtr5f2
 Xb5LSbjPXNqXv6ibhhe3YqiaMaAU9Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744793248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/iQa/bHlCIV3jsmb10Jofbx4+n/X1xLWQ0SmjyAFFU=;
 b=fPJmfU2F7RvE0YdLZyDgz14wtr2fM+90sHR2rvmyNTNj6C+ghnnOUb9v+eHRzUtM1ktWhO
 /Hl4Nwf0uH5cTvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63EAA13976;
 Wed, 16 Apr 2025 08:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5u0LF6Bu/2e9ZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Apr 2025 08:47:28 +0000
Message-ID: <5c544eef-554f-46f8-942f-0062278abf16@suse.de>
Date: Wed, 16 Apr 2025 10:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MGA G200 issue in 6.12 and up
To: David Airlie <airlied@redhat.com>, Wakko Warner <wakko@animx.eu.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org
References: <Z/anHRAx3SQWr+h8@animx.eu.org> <Z/2pzDAplsZz8AVd@animx.eu.org>
 <CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com>
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
In-Reply-To: <CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84DEF21169
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi,

thanks for reporting.

Am 16.04.25 um 03:46 schrieb David Airlie:
> adding some people
>
> On Tue, Apr 15, 2025 at 10:35 AM Wakko Warner <wakko@animx.eu.org> wrote:
>> I found the fix that works for me.  See below.
>>
>> Wakko Warner wrote:
>>> I decided to upgrade to 6.14 on a system with a Matrox G200 onboard vga
>>> (supermicro X9SCL).
>>>
>>> I use this system via the BMC.  When the mgag200 driver loads, the bmc
>>> screen flashes between no signal and the screen.  The rate seems to be about
>>> 1 second no signal and 1 second with signal.
>>>
>>> 6.12 and 6.13 both have this problem.
>>>
>>> 6.11 does not have this problem.
>>>
>>> I have a monitor plugged into the vga port and it doesn't have this problem
>>> on any of the kernels I've tried.  Only the remote connection through the bmc
>>> has this problem.  I have booted the system with and with out the monitor
>>> plugged in, it does not appear to make a difference.
>> I found a thread on arch linux forums
>> (https://bbs.archlinux.org/viewtopic.php?id=303819) where the op has the
>> same issue.  He bisected and came up with the bad commit.
>> That commit is
>> d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e drm/mgag200: Add dedicated variables
>> for blanking fields
>>
>> I searched this commit and manually reverted it from my vanilla 6.14 and it
>> works fine.  No blinking in the BMC remote console and the external VGA
>> works fine as well.

I sent out a patch for what I think is the problem. See

https://lore.kernel.org/dri-devel/20250416083847.51764-1-tzimmermann@suse.de/

Testing and feedback would be much appreciated.

Best regards
Thomas

>>
>> --
>>   Microsoft has beaten Volkswagen's world record.  Volkswagen only created 22
>>   million bugs.
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

