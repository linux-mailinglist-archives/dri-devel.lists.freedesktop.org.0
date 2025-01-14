Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43058A102D0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDE710E2CF;
	Tue, 14 Jan 2025 09:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Hj2diOiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aX0HJGYN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hj2diOiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aX0HJGYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6488D10E2CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:12:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17B3521133;
 Tue, 14 Jan 2025 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736845920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4+a29U3xRWgMa/ow/XzSAAXR4XhwWEJRZnI2aHUM6NI=;
 b=Hj2diOiSr6gx7o3RK0h6i6RCthQ2i3K4Wk5zkhI70FUZdcFaQ8gFfqA/yqcsjlfpphGFSu
 gBFlUFsTwcAyTJ4kvrN4zIUiy3Eqz7/MRqlpe2b9Y0TPcs7/FHz0yURWXT9yNZtven6Oew
 e7RMZqa4CtIDsyUXznb05BE5EJRib+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736845920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4+a29U3xRWgMa/ow/XzSAAXR4XhwWEJRZnI2aHUM6NI=;
 b=aX0HJGYNmHQmZ9ja6fpR/owLP4ZmLq6o2pjUXIYu01um4Kp5mOPCUdWh5wHv00NtKjquBm
 o+K0xtiDR5HyarAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736845920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4+a29U3xRWgMa/ow/XzSAAXR4XhwWEJRZnI2aHUM6NI=;
 b=Hj2diOiSr6gx7o3RK0h6i6RCthQ2i3K4Wk5zkhI70FUZdcFaQ8gFfqA/yqcsjlfpphGFSu
 gBFlUFsTwcAyTJ4kvrN4zIUiy3Eqz7/MRqlpe2b9Y0TPcs7/FHz0yURWXT9yNZtven6Oew
 e7RMZqa4CtIDsyUXznb05BE5EJRib+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736845920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4+a29U3xRWgMa/ow/XzSAAXR4XhwWEJRZnI2aHUM6NI=;
 b=aX0HJGYNmHQmZ9ja6fpR/owLP4ZmLq6o2pjUXIYu01um4Kp5mOPCUdWh5wHv00NtKjquBm
 o+K0xtiDR5HyarAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5BC4139CB;
 Tue, 14 Jan 2025 09:11:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TArrMl8qhmdKcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jan 2025 09:11:59 +0000
Message-ID: <94c5abb5-4c3f-44ec-ab6d-f173427a2c16@suse.de>
Date: Tue, 14 Jan 2025 10:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140FHM-N4Z panel entry
To: Andy Yan <andyshrk@163.com>, dianders@chromium.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250113085956.2150207-1-andyshrk@163.com>
 <34a1058f.9829.1945f2b448c.Coremail.andyshrk@163.com>
 <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
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
In-Reply-To: <341c653.7fa6.194640f0f37.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[163.com,chromium.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[163.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
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




Am 14.01.25 um 10:04 schrieb Andy Yan:
> Hi All,
>
> At 2025-01-13 18:17:38, "Andy Yan" <andyshrk@163.com> wrote:
>> Sorry, please don't merge this patch. after further testing,
>> I found that there are still some changce, it can't read edid.
> It turns out that we need set hpd-reliable-delay-ms = 120 in dts to ensure
> the right time to access edid.
> So the patch is ok, it is ready for review.
>
>> At 2025-01-13 16:59:54, "Andy Yan" <andyshrk@163.com> wrote:
>>> Add an eDP panel entry for BOE NV140FHM-N4Z.
>>>
>>> No datasheet found for this panel.
>>>
>>> edid:
>>> 00 ff ff ff ff ff ff 00 09 e5 09 0b 00 00 00 00
>>> 01 20 01 04 a5 1f 11 78 03 9b 75 99 5b 5d 8f 2a
>>> 23 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
>>> 01 01 01 01 01 01 c8 37 80 cc 70 38 28 40 6c 30
>>> aa 00 35 ae 10 00 00 1a 00 00 00 fd 00 30 3c 43
>>> 43 8f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
>>> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
>>> 00 4e 56 31 34 30 46 48 4d 2d 4e 34 5a 0a 00 35
>>>
>>> Signed-off-by: Andy Yan <andyshrk@163.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

>>> ---
>>>
>>> drivers/gpu/drm/panel/panel-edp.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
>>> index 94a46241dece..a3402b76aa3e 100644
>>> --- a/drivers/gpu/drm/panel/panel-edp.c
>>> +++ b/drivers/gpu/drm/panel/panel-edp.c
>>> @@ -1909,6 +1909,7 @@ static const struct edp_panel_entry edp_panels[] = {
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
>>> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_p2e200, "NV140FHM-NZ"),
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
>>> 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
>>> -- 
>>> 2.43.0

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

