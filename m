Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632CA4C58A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 16:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C7710E474;
	Mon,  3 Mar 2025 15:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1X4kg6t1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/9Z7tXhu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1X4kg6t1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/9Z7tXhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A90810E474
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 15:45:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90A8521199;
 Mon,  3 Mar 2025 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741016734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ak+RjPIQj4V4k7FMIvSJQyPpJOXQIaNwc6DJlet0xm0=;
 b=1X4kg6t1Olo3SZVeeaOJcdxj04j5VexJ2JuyzJ8RBGN5nrmGj2b9m+Y5XvFrniAv0B11A7
 LT4m4dJ3+XS+hXPTxMaqTzSScs01VgFCEe9NlqxW4aX4rI1NtjWmX1x5s9wG4vWqpYsAwY
 i16mEy8gLb576wjkL3/am8nq8Kylt84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741016734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ak+RjPIQj4V4k7FMIvSJQyPpJOXQIaNwc6DJlet0xm0=;
 b=/9Z7tXhuo3lkEr3ha+xJCgKsKEC8xKq0iCg6i8pQXIQr4uWV70OTg6KIDU24IFPd3aew2k
 xy0TuAdYCpjJi1CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741016734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ak+RjPIQj4V4k7FMIvSJQyPpJOXQIaNwc6DJlet0xm0=;
 b=1X4kg6t1Olo3SZVeeaOJcdxj04j5VexJ2JuyzJ8RBGN5nrmGj2b9m+Y5XvFrniAv0B11A7
 LT4m4dJ3+XS+hXPTxMaqTzSScs01VgFCEe9NlqxW4aX4rI1NtjWmX1x5s9wG4vWqpYsAwY
 i16mEy8gLb576wjkL3/am8nq8Kylt84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741016734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ak+RjPIQj4V4k7FMIvSJQyPpJOXQIaNwc6DJlet0xm0=;
 b=/9Z7tXhuo3lkEr3ha+xJCgKsKEC8xKq0iCg6i8pQXIQr4uWV70OTg6KIDU24IFPd3aew2k
 xy0TuAdYCpjJi1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37DB913A23;
 Mon,  3 Mar 2025 15:45:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0wivC57OxWcUFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Mar 2025 15:45:34 +0000
Message-ID: <fc353e0b-25dc-437c-84bc-c76fffd21b65@suse.de>
Date: Mon, 3 Mar 2025 16:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <361DAD47-01E8-4ED9-BC8C-0F98B08FFA5C@live.com>
 <FCAC702C-F84A-47F9-8C78-BBBB34D08500@live.com>
 <72610225-c6e0-413a-a791-468635743fc2@suse.de>
 <PN3PR01MB9597D311510957F1FDABE143B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <PN3PR01MB9597D311510957F1FDABE143B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[live.com]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,kodeit.net,vger.kernel.org,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[kodeit.net:email,live.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
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

Am 27.02.25 um 10:42 schrieb Aditya Garg:
>
>> On 27 Feb 2025, at 3:04 PM, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> ﻿Hi
>>
>>> Am 26.02.25 um 17:04 schrieb Aditya Garg:
>>> From: Kerem Karabay <kekrby@gmail.com>
>>>
>>> The Touch Bars found on x86 Macs support two USB configurations: one
>>> where the device presents itself as a HID keyboard and can display
>>> predefined sets of keys, and one where the operating system has full
>>> control over what is displayed.
>>>
>>> This commit adds support for the display functionality of the second
>>> configuration. Functionality for the first configuration has been
>>> merged in the HID tree.
>>>
>>> Note that this driver has only been tested on T2 Macs, and only includes
>>> the USB device ID for these devices. Testing on T1 Macs would be
>>> appreciated.
>>>
>>> Credit goes to Ben (Bingxing) Wang on GitHub for reverse engineering
>>> most of the protocol.
>>>
>>> Also, as requested by Andy, I would like to clarify the use of __packed
>>> structs in this driver:
>>>
>>> - All the packed structs are aligned except for appletbdrm_msg_information.
>>> - We have to pack appletbdrm_msg_information since it is requirement of
>>>    the protocol.
>>> - We compared binaries compiled by keeping the rest structs __packed and
>>>    not __packed using bloat-o-meter, and __packed was not affecting code
>>>    generation.
>>> - To maintain consistency, rest structs have been kept __packed.
>>>
>>> I would also like to point out that since the driver was reverse-engineered
>>> the actual data types of the protocol might be different, including, but
>>> not limited to, endianness.
>>>
>>> Link: https://github.com/imbushuo/DFRDisplayKm
>>> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
>>> Co-developed-by: Atharva Tiwari <evepolonium@gmail.com>
>>> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
>>> Co-developed-by: Aditya Garg <gargaditya08@live.com>
>>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>>> Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Thanks for the effort. As far as I'm concerned, this driver looks good. If no further comments come in, I can add it to the DRM tree in a few days.
> Thanks a lot Thomas, as well as Andy for reviewing the driver and making it better!

I've merged the driver into the DRM misc tree and it should be available 
in v6.15.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

