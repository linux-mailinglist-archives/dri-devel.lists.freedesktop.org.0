Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HKBpFzv3p2lpnAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:11:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55E1FD51F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 10:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ACE10E988;
	Wed,  4 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0YJtaA4P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twf61IoF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0YJtaA4P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="twf61IoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF2510E988
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 09:11:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 838725BD8C;
 Wed,  4 Mar 2026 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772615478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fDIPlEVlN5WpTj9ewGlGzSitCmY6MgIV+DCsJkgpd4U=;
 b=0YJtaA4PUSd2hYJvoggrvRMQg9GexGfdCivIaNF08wLjkmHDJlSXamjMc3gAqEz5iSjy2G
 Y0Af9SEf2ntKkDIxbiOYsp4UYQ3k3D49XzCO/ZsHBBmZDcLuCNw1n0JKspu7G9M23sjkrx
 2Ie6fQsdjzI4R34XGLU3JMMPTdCUc9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772615478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fDIPlEVlN5WpTj9ewGlGzSitCmY6MgIV+DCsJkgpd4U=;
 b=twf61IoFmdUHXSAP6fWTARuRfX3XMXuuvW8ejTOO6E4XoQ8xQkorN8XNfLuTxh3Da0vlTB
 oTzwSrT/EXQk+WDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0YJtaA4P;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=twf61IoF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772615478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fDIPlEVlN5WpTj9ewGlGzSitCmY6MgIV+DCsJkgpd4U=;
 b=0YJtaA4PUSd2hYJvoggrvRMQg9GexGfdCivIaNF08wLjkmHDJlSXamjMc3gAqEz5iSjy2G
 Y0Af9SEf2ntKkDIxbiOYsp4UYQ3k3D49XzCO/ZsHBBmZDcLuCNw1n0JKspu7G9M23sjkrx
 2Ie6fQsdjzI4R34XGLU3JMMPTdCUc9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772615478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fDIPlEVlN5WpTj9ewGlGzSitCmY6MgIV+DCsJkgpd4U=;
 b=twf61IoFmdUHXSAP6fWTARuRfX3XMXuuvW8ejTOO6E4XoQ8xQkorN8XNfLuTxh3Da0vlTB
 oTzwSrT/EXQk+WDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5629A3EA69;
 Wed,  4 Mar 2026 09:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KC/PEzb3p2lnOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Mar 2026 09:11:18 +0000
Message-ID: <4f9b6f94-ed54-4324-a47a-4b379b4e9866@suse.de>
Date: Wed, 4 Mar 2026 10:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] vc,fbcon,fonts: Proper handling of font data
To: Helge Deller <deller@gmx.de>, gregkh@linuxfoundation.org, sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <11c9e67c-36f9-4d27-8064-41b804cc0c02@gmx.de>
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
In-Reply-To: <11c9e67c-36f9-4d27-8064-41b804cc0c02@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
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
X-Rspamd-Queue-Id: CE55E1FD51F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,ravnborg.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:url]
X-Rspamd-Action: no action

Hi

Am 03.03.26 um 16:29 schrieb Helge Deller:
> On 3/2/26 15:08, Thomas Zimmermann wrote:
>> Provide helpers for handling console font data. Update consoles and VT.
>>
>> VT's vc_state stores font data as a plain byte array of glphys. Fbcon,
>> newport_con and the kernel's internal fonts store the glyph data as an
>> array of plain bytes plus a hidden header for reference counting, check
>> sums and buffer sizes. The reference counting only works for user-space
>> fonts but not for internal fonts. Font-data handling is duplicated in
>> several places. Most of the font handling is open-coded and mixed up 
>> with
>> VT's plain glyph arrays.
>>
>> To address these issues, add proper handling of font data to all 
>> involved
>> components: struct vc_font for font state in VC; a font data type for 
>> the
>> consoles. Then implement interfaces for handling font data one by one.
>>
>> Patch 1 prepares the fbdev interface.
>>
>> Patches 2 to 4 prepare VT's font handling.
>>
>> Patches 5 to 13 refactor fbcon and newport_con to use clean 
>> interfaces for
>> their fonts.
>>
>> Fbcon has long been a source of problems and bug reports. [1] With its
>> confusing implementation, it is hard to find the cause of these bugs.
>> Cleaning up the fbcon code will hopefully help with resolving bug 
>> reports
>> in the future.
>>
>> The series has been tested with fbcon under DRM's bochs driver by 
>> changing
>> fonts at runtime using the setfont utility. [2] The changes to 
>> newport_con
>> have only been tested to compile.
>>
>> v2:
>> - keep declaring the internal fonts in the public header file (Helge)
>> - rebase and clean up
>>
>> [1] 
>> https://lore.kernel.org/all/6992c84c.a70a0220.2c38d7.00e8.GAE@google.com/
>> [2] https://www.man7.org/linux/man-pages/man8/setfont.8.html
>>
>> Thomas Zimmermann (13):
>>    fbdev: Declare src parameter of fb_pad_ helpers as constant
>>    vt: Remove trailing whitespaces
>>    vt: Store font in struct vc_font
>>    vt: Calculate font-buffer size with vc_font_size()
>>    lib/fonts: Remove trailing whitespaces
>>    lib/fonts: Remove FNTCHARCNT()
>>    lib/fonts: Store font data as font_data_t; update consoles
>>    lib/fonts: Read font size with font_data_size()
>>    lib/fonts: Compare font data for equality with font_data_is_equal()
>>    lib/fonts: Manage font-data lifetime with font_data_get/_put()
>>    lib/fonts: Create font_data_t from struct console_font with
>>      font_data_import()
>>    lib/fonts: Store font data for user space with font_data_export()
>>    lib/fonts: Remove internal symbols and macros from public header file
>>
>>   drivers/video/console/newport_con.c |  61 +++----
>>   drivers/video/fbdev/core/bitblit.c  |  11 +-
>>   drivers/video/fbdev/core/fbcon.c    | 194 +++++++----------------
>>   drivers/video/fbdev/core/fbcon.h    |   8 +-
>>   drivers/video/fbdev/core/fbmem.c    |   6 +-
>>   include/linux/console_struct.h      |  59 ++++++-
>>   include/linux/fb.h                  |  10 +-
>>   include/linux/font.h                | 115 +++++++++-----
>>   lib/fonts/font.h                    |  38 +++++
>>   lib/fonts/font_10x18.c              |   2 +-
>>   lib/fonts/font_6x10.c               |   3 +-
>>   lib/fonts/font_6x11.c               |   2 +-
>>   lib/fonts/font_6x8.c                |   3 +-
>>   lib/fonts/font_7x14.c               |   2 +-
>>   lib/fonts/font_8x16.c               |   3 +-
>>   lib/fonts/font_8x8.c                |   2 +-
>>   lib/fonts/font_acorn_8x8.c          |   4 +-
>>   lib/fonts/font_mini_4x6.c           |  10 +-
>>   lib/fonts/font_pearl_8x8.c          |   2 +-
>>   lib/fonts/font_sun12x22.c           |   3 +-
>>   lib/fonts/font_sun8x16.c            |   3 +-
>>   lib/fonts/font_ter10x18.c           |   4 +-
>>   lib/fonts/font_ter16x32.c           |   4 +-
>>   lib/fonts/fonts.c                   | 236 +++++++++++++++++++++++++++-
>>   24 files changed, 518 insertions(+), 267 deletions(-)
>>   create mode 100644 lib/fonts/font.h
> Thomas, thanks for the nice cleanup!
> Beside a few minor comments which I posted to the various patches, the 
> series looks good.
>
> I've applied it for further testing to the fbdev git tree.

Great, thanks!

> In case you send later v3 series, I'll update it.

I'd preferably not modify the data structures for now. Shall I send an 
update for the typos?

Best regards
Thomas

>
> Thanks a lot!
> Helge

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


