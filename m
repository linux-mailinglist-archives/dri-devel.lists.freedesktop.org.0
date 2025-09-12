Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14BB54362
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 09:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699710EBBD;
	Fri, 12 Sep 2025 07:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z0wZnOP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isGIUBf1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z0wZnOP5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="isGIUBf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6810EBB6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:01:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97DCA383DB;
 Fri, 12 Sep 2025 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757660491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dTHhJ3vgML5f24AgYYZpi70uG3GT8J4du87fr0FPp6Q=;
 b=z0wZnOP5UbQ0LERxkmk6GcHYMB9JdCh+1mCLbuxtbvGFp9xnw7b6GnSGTopzGGlMKiSstb
 UPlfQNe0QB3tCihGOfAIXWQ/cz9N1XpmVaPzu0ieBxqs+w8g/Bdtt+cs0ColTyuAWFTh6p
 lMbNujSBS2r+AiXqe7HlpN5BSB+FQTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757660491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dTHhJ3vgML5f24AgYYZpi70uG3GT8J4du87fr0FPp6Q=;
 b=isGIUBf1TGF2o/W3Rkh+AmmxdLU65LRb3PWdwy3qor3qgVbL+yS0ncL2oeQCO4Vquk6C/l
 C1H5gBdFuARQEOAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=z0wZnOP5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=isGIUBf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757660491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dTHhJ3vgML5f24AgYYZpi70uG3GT8J4du87fr0FPp6Q=;
 b=z0wZnOP5UbQ0LERxkmk6GcHYMB9JdCh+1mCLbuxtbvGFp9xnw7b6GnSGTopzGGlMKiSstb
 UPlfQNe0QB3tCihGOfAIXWQ/cz9N1XpmVaPzu0ieBxqs+w8g/Bdtt+cs0ColTyuAWFTh6p
 lMbNujSBS2r+AiXqe7HlpN5BSB+FQTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757660491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dTHhJ3vgML5f24AgYYZpi70uG3GT8J4du87fr0FPp6Q=;
 b=isGIUBf1TGF2o/W3Rkh+AmmxdLU65LRb3PWdwy3qor3qgVbL+yS0ncL2oeQCO4Vquk6C/l
 C1H5gBdFuARQEOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 493B713869;
 Fri, 12 Sep 2025 07:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GhJwEEvFw2hZEAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Sep 2025 07:01:31 +0000
Message-ID: <d452d75a-5a0a-42c2-9ea1-fcd08b09176c@suse.de>
Date: Fri, 12 Sep 2025 09:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
To: Michael Kelley <mhklinux@outlook.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 "deller@gmx.de" <deller@gmx.de>, "arnd@arndb.de" <arnd@arndb.de>,
 "soci@c64.rulez.org" <soci@c64.rulez.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <E2D7F2119CB4>
 <1757437112-2509-1-git-send-email-ptsm@linux.microsoft.com>
 <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
 <SN6PR02MB415755A10BD2C9D0E7F847FCD40EA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ccc6011c-d1bb-48b1-bf35-6fea1b1e8a49@linux.microsoft.com>
 <SN6PR02MB41578C2984A84B4D0AA17943D408A@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB41578C2984A84B4D0AA17943D408A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 97DCA383DB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[outlook.com,linux.microsoft.com,gmx.de,arndb.de,c64.rulez.org,gmail.com,infradead.org,linaro.org,kernel.org,vger.kernel.org,lists.freedesktop.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_EQ_ADDR_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,outlook.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
X-Spam-Score: -3.01
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

Am 12.09.25 um 05:24 schrieb Michael Kelley:
> From: Prasanna Kumar T S M <ptsm@linux.microsoft.com> Sent: Thursday, September 11, 2025 9:28 AM
>> Hi Michael,
>>
>> On 10-09-2025 20:55, Michael Kelley wrote:
>>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Wednesday, September
>> 10, 2025 2:36 AM
>>>> Hi
>>>>
>>>> Am 09.09.25 um 18:58 schrieb Prasanna Kumar T S M:
>>>>> The Hyper-V DRM driver is available since kernel version 5.14 and
>>>>> provides full KMS support along with fbdev emulation via the DRM fbdev
>>>>> helpers. This makes the hyperv_fb driver redundant, remove it.
>>>> I'm all for removing obsolete drivers. But hyperv_drm likely first needs
>>>> to merge the patch at
>>>> https://lore.kernel.org/dri-devel/20250904145806.430568-5-tzimmermann@suse.de/
>>>> It's been tested and works well. If maintainers from Microsoft have a
>>>> look at the patch first, we could possibly land it fairly soon.
>>> Thomas --
>>>
>>> My testing of your v3 patch series for vblank timers ended up getting a
>>> WARN_ON after about 3 days of usage. See [1]. So I don't think it's 100%
>>> ready yet.
>>>
>>> But I agree we need your synthetic vblank timer support to address the
>>> Hyper-V DRM driver performance issue, before removing the Hyper-V
>>> fbdev driver. (See [2] for a description of the performance issue.)
>>>
>>> Second, isn't it customary to mark a driver as deprecated for a period
>>> of time, before removing it entirely? I don't see any documentation
>>> on the deprecation process, but I've seen it done in other cases. If you
>>> grep through all the kernel Kconfig files, you'll see entries tagged with
>>> DEPRECATED. Also the driver should be updated to output a deprecated
>>> message when it loads.
>> Is deprecating the driver a mandatory step?
>>
> I'm not aware of a mandatory requirement, at least not in the sense
> of it being documented in Documentation/process like other aspects
> of the Linux kernel development process. So I would say it's up to
> the Maintainers for Hyper-V and FBDEV as to whether the Hyper-V
> FB driver should go through a deprecation phase before being
> removed.
>
> Of course, the purpose of the deprecation phase is to be "nice"
> to users of the driver by giving them some warning that it is going
> away. That gives them an opportunity to raise objections, and/or
> to do any necessary migration to the replacement driver. I suspect
> there aren't many (or any?) users of Hyper-V FB that can't just move
> to the Hyper-V DRM driver, but who knows. We might be surprised.

Let's mark the driver as unmaintained now. There should be a kernel LTS 
release around December [1], after which hyperv-fb could be removed. 
Anyone with hard dependencies on hyperv-fb can remain in the LTS for a 
few more years.

Best regards
Thomas

[1] https://www.kernel.org/category/releases.html

>
> Michael

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


