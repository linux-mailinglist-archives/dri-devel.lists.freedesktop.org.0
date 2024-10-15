Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728C99DF24
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45CC10E516;
	Tue, 15 Oct 2024 07:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D956hEbf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2q7xdBtK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D956hEbf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2q7xdBtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3693C10E515
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:13:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FFFA21E3E;
 Tue, 15 Oct 2024 07:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728976394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n14q1u5D8ol1fNqL2U+ZXkFX29UM6BktWPp7FLgCb9s=;
 b=D956hEbfVykrHY0u9FScOUKdAUMg+gxsILZZu8VctnSuk4fqrIsIFFYPR1j2AYdshIJk28
 BIFyM1BVnGJiWSCpL2tgJmUHbYjT1Q5/Izza4Gr9bWp52/3YjwbFS6GSsb2GkpGi3Fx6jE
 I66lXT5B8tQwB13RUroY6lOi43hsnCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728976394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n14q1u5D8ol1fNqL2U+ZXkFX29UM6BktWPp7FLgCb9s=;
 b=2q7xdBtKJHBwQ88WZ1e05Icum9PP5+5zfWddkVJbrLjeVxteiFP7CFtbpEM5282Uk+/3Su
 qaiosLvYtIIAM/Cg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D956hEbf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2q7xdBtK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728976394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n14q1u5D8ol1fNqL2U+ZXkFX29UM6BktWPp7FLgCb9s=;
 b=D956hEbfVykrHY0u9FScOUKdAUMg+gxsILZZu8VctnSuk4fqrIsIFFYPR1j2AYdshIJk28
 BIFyM1BVnGJiWSCpL2tgJmUHbYjT1Q5/Izza4Gr9bWp52/3YjwbFS6GSsb2GkpGi3Fx6jE
 I66lXT5B8tQwB13RUroY6lOi43hsnCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728976394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n14q1u5D8ol1fNqL2U+ZXkFX29UM6BktWPp7FLgCb9s=;
 b=2q7xdBtKJHBwQ88WZ1e05Icum9PP5+5zfWddkVJbrLjeVxteiFP7CFtbpEM5282Uk+/3Su
 qaiosLvYtIIAM/Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D85F13A42;
 Tue, 15 Oct 2024 07:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6wCjFQoWDmdOdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Oct 2024 07:13:14 +0000
Message-ID: <9be5b869-2af7-4ea6-9231-75a46ab205dd@suse.de>
Date: Tue, 15 Oct 2024 09:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
 <SJ1PR11MB6083AC96151969AD04C4330DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083B44A9FCF128144AEC78DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <f03a55ee-e355-40dd-94ad-749baeb435c8@suse.de>
 <SJ1PR11MB608330D5E114CAF1408DEC9CFC792@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083EEC3C157E3293377C5D0FC792@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4cac0f96-b984-4846-959b-617a301c7295@suse.de>
 <SJ1PR11MB608375AE30D1E2188DC6B0D0FC442@SJ1PR11MB6083.namprd11.prod.outlook.com>
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
In-Reply-To: <SJ1PR11MB608375AE30D1E2188DC6B0D0FC442@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9FFFA21E3E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_EQ_ADDR_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Am 14.10.24 um 19:14 schrieb Luck, Tony:
>> Attached is a full revert of the vblank support for you to test. If that
>> undoes the bug, I'll post it for review to the list.
> Thomas.
>
> I applied that to v6.12-rc3. Builds cleanly.
>
> System boots with no warnings.
>
> MGAG device is present:
>
> $ dmesg | grep mgag
> [   31.277259] mgag200 0000:08:00.0: vgaarb: deactivate vga console
> [   31.298138] [drm] Initialized mgag200 1.0.0 for 0000:08:00.0 on minor 0
> [   31.324081] fbcon: mgag200drmfb (fb0) is primary device
> [   31.414494] mgag200 0000:08:00.0: [drm] fb0: mgag200drmfb frame buffer device
>
> VGA console working.
>
> Thanks. Please apply my tags:
>
> Reported-by: Tony Luck <tony.luck@intel.com>
> Tested-by: Tony Luck <tony.luck@intel.com>

Thanks a lot for helping. The revert is at

https://lore.kernel.org/dri-devel/20241015063932.8620-1-tzimmermann@suse.de/T/#u

Best regards
Thomas

>
> -Tony
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

