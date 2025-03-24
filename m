Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA3A6D553
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 08:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6DA10E13C;
	Mon, 24 Mar 2025 07:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TTVhwUAx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i4mSqylD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TTVhwUAx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i4mSqylD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B158810E13C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 07:43:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 192591F788;
 Mon, 24 Mar 2025 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742802207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3cHSh3OJgCCHL2Lc/c+zsJTlX+2v7fbJA4aX368ZXks=;
 b=TTVhwUAxzeki8CTvpVI4qCBzZc+bYF51vwxQD6JpFM1hT/5T5WAcwDrkJeW6xDZ1nWFBA1
 ZiqsWNWoec6QBqUL6EA8QssC+lfs0NSkkAxUH59NleQUSPni+1KkM79Gwi3/yfRQ2kFtm3
 q19RexMyKluK2WYv7sSo8IpNXeQ8js4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742802207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3cHSh3OJgCCHL2Lc/c+zsJTlX+2v7fbJA4aX368ZXks=;
 b=i4mSqylDRpIrf1Ei1usgJXamOr+H/ebYUddKSnqlxLyxxCJVFoOgEXWPwf5VDWRcHJVUeQ
 hHjJahBtk3kekjDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742802207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3cHSh3OJgCCHL2Lc/c+zsJTlX+2v7fbJA4aX368ZXks=;
 b=TTVhwUAxzeki8CTvpVI4qCBzZc+bYF51vwxQD6JpFM1hT/5T5WAcwDrkJeW6xDZ1nWFBA1
 ZiqsWNWoec6QBqUL6EA8QssC+lfs0NSkkAxUH59NleQUSPni+1KkM79Gwi3/yfRQ2kFtm3
 q19RexMyKluK2WYv7sSo8IpNXeQ8js4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742802207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3cHSh3OJgCCHL2Lc/c+zsJTlX+2v7fbJA4aX368ZXks=;
 b=i4mSqylDRpIrf1Ei1usgJXamOr+H/ebYUddKSnqlxLyxxCJVFoOgEXWPwf5VDWRcHJVUeQ
 hHjJahBtk3kekjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB31213874;
 Mon, 24 Mar 2025 07:43:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vs1jLB4N4WdOPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Mar 2025 07:43:26 +0000
Message-ID: <fd216fbf-ff4b-4d33-a8be-b1b7fe525a35@suse.de>
Date: Mon, 24 Mar 2025 08:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
To: Daniel Thompson <danielt@kernel.org>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-9-tzimmermann@suse.de> <Z91NHP65X9GFIYOe@aspen.lan>
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
In-Reply-To: <Z91NHP65X9GFIYOe@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -4.30
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

Hi

Am 21.03.25 um 12:27 schrieb Daniel Thompson:
> On Fri, Mar 21, 2025 at 10:54:01AM +0100, Thomas Zimmermann wrote:
>> Remove support for fb events from the lcd subsystem. Provide the
>> helper lcd_notify_blank_all() instead. In fbdev, call
>> lcd_notify_blank_all() to inform the lcd subsystem of changes
>> to a display's blank state.
>>
>> Fbdev maintains a list of all installed notifiers. Instead of fbdev
>> notifiers, maintain an internal list of lcd devices.
>>
>> v3:
>> - export lcd_notify_mode_change_all() (kernel test robot)
>> v2:
>> - maintain global list of lcd devices
>> - avoid IS_REACHABLE() in source file
>> - use lock guards
>> - initialize lcd list and list mutex
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Thanks for reviewing.  There are reviews of all patches. If nothing else 
comes in, feel free to merge it via the backlight tree.  I can also take 
the series into dri-devel.

Best regards
Thomas

>
>
> Daniel.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

