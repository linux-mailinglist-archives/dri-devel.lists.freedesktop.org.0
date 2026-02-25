Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIjLMNmonmntWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:46:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5917193AC8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526810E6C9;
	Wed, 25 Feb 2026 07:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dh//wXuT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l2oZZcGT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dh//wXuT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l2oZZcGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8C310E6C4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:46:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AC763F6B9;
 Wed, 25 Feb 2026 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772005587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cNqoO+dBnKKD6y58B5MRCxrnHOgk5Ia7UiXTBumv1ck=;
 b=Dh//wXuTVvPxAc9jIv3UmHMx3u7YKxbFgXjlFSCcJ9/H65O1wqSRjab/r7YicXEwklFvKs
 J3RHBkZSnMmqLK3y/Glb25n3d24nqHNX3z4EZiLmBO/YhFKe0rNrRdSSOoKYDlhXtVeMgI
 Pc+YRwd2Tgq3tjTrU64g0wVv+6SIZhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772005587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cNqoO+dBnKKD6y58B5MRCxrnHOgk5Ia7UiXTBumv1ck=;
 b=l2oZZcGT9xurabXT0Fk8/xsqqK1W2S0KR50m11KEMBrxtVXYhC57PawYCUPGJHBz0E5H92
 iLLGLZFhLY/+T6Cg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Dh//wXuT";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l2oZZcGT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772005587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cNqoO+dBnKKD6y58B5MRCxrnHOgk5Ia7UiXTBumv1ck=;
 b=Dh//wXuTVvPxAc9jIv3UmHMx3u7YKxbFgXjlFSCcJ9/H65O1wqSRjab/r7YicXEwklFvKs
 J3RHBkZSnMmqLK3y/Glb25n3d24nqHNX3z4EZiLmBO/YhFKe0rNrRdSSOoKYDlhXtVeMgI
 Pc+YRwd2Tgq3tjTrU64g0wVv+6SIZhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772005587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cNqoO+dBnKKD6y58B5MRCxrnHOgk5Ia7UiXTBumv1ck=;
 b=l2oZZcGT9xurabXT0Fk8/xsqqK1W2S0KR50m11KEMBrxtVXYhC57PawYCUPGJHBz0E5H92
 iLLGLZFhLY/+T6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B628A3EA65;
 Wed, 25 Feb 2026 07:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kj0GK9KonmnTLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 07:46:26 +0000
Message-ID: <78c4992a-d340-4f00-8e25-0e8e7299ba4a@suse.de>
Date: Wed, 25 Feb 2026 08:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] drm/mipi-dbi: Replace simple-display helpers
 with regular atomic heleprs
To: wens@kernel.org
Cc: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com, 
 david@lechnology.com, architanant5@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 dri-devel@lists.freedesktop.org
References: <20260224153656.261351-1-tzimmermann@suse.de>
 <CAGb2v647KWOOTUxpLdgom53kDmF5z0m+retOqy2HOmLei2m=_w@mail.gmail.com>
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
In-Reply-To: <CAGb2v647KWOOTUxpLdgom53kDmF5z0m+retOqy2HOmLei2m=_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: D5917193AC8
X-Rspamd-Action: no action

Hi

Am 24.02.26 um 17:18 schrieb Chen-Yu Tsai:
> Hi,
>
> On Tue, Feb 24, 2026 at 11:37 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> We keep getting new drivers based on the obsolete simple-display pipeline,
>> such as the recent driver for st7789v panels. [1] But submitters cannot
>> know, as the simple-display helpers are fully documented and still used
>> in several places.
> Could you include a reference to the discussion to obsolete the
> simple-display pipeline? That would be helpful. All I can find are some
> patch series that convert individual drivers, and many of them just say
> that it is obsolete, without pointing to actual discussion or documentation.

I don't think there is a discussion on the ML, but it got discussed to 
some extent on IRC at least years ago. Hence there's no official log.

But generally, you can read Sima's blog entry about mid layers [1] and 
the Lwn article on the mid-layer topic. [2] Citing the latter: "The core 
thesis of the "midlayer mistake" is that midlayers are bad and should 
not exist. That common functionality which it is so tempting to put in a 
midlayer should instead be provided as library routines which can used, 
augmented, or ignored by each bottom level driver independently."

That is also the problem of the simple-display pipeline. The code [3] 
doesn't even do anything. It mostly maps the regular atomic calls to its 
own interfaces. Having those own interfaces breaks composability of the 
driver's components. Specifically, we have to re-implement interfaces 
for shadow buffers to make them work with the simple-display interfaces. 
[4]  The best way forward is to inline the simple-display code into the 
few drivers that use it. Luckily this is merely a refactoring job.

I'll include this argument in the commit description of the final patch.

Best regards
Thomas

[1] https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html
[2] https://lwn.net/Articles/336262/
[3] 
https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/drm_simple_kms_helper.c
[4] 
https://elixir.bootlin.com/linux/v6.19/source/drivers/gpu/drm/drm_gem_atomic_helper.c#L407

>
>
> Thanks
> ChenYu
>
>> Hence, convert all the mipi-dbi drivers over to regular atomic helpers
>> and remove simple-display support from mipi-dbi in this series. Then
>> undocument the helpers and add TODO items for final their removal.
>>
>> Patch 1 changes the mode-setting logic get CRTC and panel updates into
>> the correct order. This patch is probably the most fragile change in the
>> series.
>>
>> Patches 2 and 3 prepare mipi-dbi to allow for atomic helpers to be used.
>>
>> Patches 5 to 14 update mipi-dbi drivers one by one. The st7735r driver
>> requires some additional minor preparation. Overall, the refactoring is
>> always the same.
>>
>> Patches 15 abd 16 clean up mipi-dbi and the simple-display helpers.
>>
>> These patches need some testing, as I can only compile them. At least
>> one of the drivers should be tried on hardware. Regressions should be
>> easy to fix, as these changes are mostly refactoring jobs.
>>
>> [1] https://lore.kernel.org/dri-devel/20260221071351.22772-1-architanant5@gmail.com/
>>
>> Thomas Zimmermann (16):
>>    drm/mipi-dbi: Only modify planes on enabled CRTCs
>>    drm/mipi-dbi: Support custom pipelines with drm_mipi_dbi_dev_init()
>>    drm/mipi-dbi: Provide callbacks for atomic interfaces
>>    drm/hx8357d: Use regular atomic helpers; drop simple-display helpers
>>    drm/ili9163: Use regular atomic helpers; drop simple-display helpers
>>    drm/ili9225: Use regular atomic helpers; drop simple-display helpers
>>    drm/ili9341: Use regular atomic helpers; drop simple-display helpers
>>    drm/ili9486: Use regular atomic helpers; drop simple-display helpers
>>    drm/mi0283qt: Use regular atomic helpers; drop simple-display helpers
>>    drm/panel-mipi-dbi: Use regular atomic helpers; drop simple-display
>>      helpers
>>    drm/st7586: Use regular atomic helpers; drop simple-display helpers
>>    drm/st7735r: Rename struct st7735r_priv to struct st7735r_device
>>    drm/st7735r: Rename priv variable to st7735r
>>    drm/st7735r: Use regular atomic helpers; drop simple-display helpers
>>    drm/mipi-dbi: Remove simple-display helpers from mipi-dbi
>>    drm/simple-kms: Deprecate simple-kms helpers
>>
>>   Documentation/gpu/drm-kms-helpers.rst   |  12 -
>>   Documentation/gpu/introduction.rst      |   5 -
>>   Documentation/gpu/todo.rst              |  32 +++
>>   drivers/gpu/drm/drm_crtc.c              |   6 +-
>>   drivers/gpu/drm/drm_gem_atomic_helper.c |  22 --
>>   drivers/gpu/drm/drm_mipi_dbi.c          | 352 ++++++------------------
>>   drivers/gpu/drm/drm_modeset_helper.c    |   3 -
>>   drivers/gpu/drm/drm_simple_kms_helper.c |  83 ------
>>   drivers/gpu/drm/sitronix/st7586.c       | 194 +++++++++----
>>   drivers/gpu/drm/sitronix/st7735r.c      | 142 ++++++++--
>>   drivers/gpu/drm/tiny/hx8357d.c          | 138 +++++++++-
>>   drivers/gpu/drm/tiny/ili9163.c          | 139 +++++++++-
>>   drivers/gpu/drm/tiny/ili9225.c          | 193 +++++++++----
>>   drivers/gpu/drm/tiny/ili9341.c          | 139 +++++++++-
>>   drivers/gpu/drm/tiny/ili9486.c          | 130 ++++++++-
>>   drivers/gpu/drm/tiny/mi0283qt.c         | 139 +++++++++-
>>   drivers/gpu/drm/tiny/panel-mipi-dbi.c   | 142 ++++++++--
>>   include/drm/drm_mipi_dbi.h              | 140 ++++++----
>>   include/drm/drm_simple_kms_helper.h     | 216 +--------------
>>   19 files changed, 1366 insertions(+), 861 deletions(-)
>>
>>
>> base-commit: 1c44015babd759b8e5234084dffcc08a0b784333
>> --
>> 2.52.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


