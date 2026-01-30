Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMgTOrZafGkYMAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:16:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EBB7D11
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E4710E90D;
	Fri, 30 Jan 2026 07:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D7RLHwGb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iEYCRyBS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D7RLHwGb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iEYCRyBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B8410E90D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:16:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27E3C3459C;
 Fri, 30 Jan 2026 07:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769757360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KZZkXzd5fDUPvrsXerfENlc5CNZiHeiuJ0gmlq1LAjs=;
 b=D7RLHwGbKRKdmuy8PDdBOWu0Qirok3quoFv0F8VysGACX1bn5FvNFFPtyZe409pCv2hkOB
 1khY37CPgP29176jPUVbN6X/2nFAUbuOdrBQmFv7NbZ9BZ6gqa7jxHBcLNrLEPRVd1L17R
 sGwAz0rGPRGouXX9RC7LlxmI3AjYEIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769757360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KZZkXzd5fDUPvrsXerfENlc5CNZiHeiuJ0gmlq1LAjs=;
 b=iEYCRyBSOfK/KWhXTCXj/vLjdWDeE3pDWpLaxdOTsKOZKFvxczFcUsD8DtfTliNsN68EEb
 wa3myes6j8qTzIDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769757360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KZZkXzd5fDUPvrsXerfENlc5CNZiHeiuJ0gmlq1LAjs=;
 b=D7RLHwGbKRKdmuy8PDdBOWu0Qirok3quoFv0F8VysGACX1bn5FvNFFPtyZe409pCv2hkOB
 1khY37CPgP29176jPUVbN6X/2nFAUbuOdrBQmFv7NbZ9BZ6gqa7jxHBcLNrLEPRVd1L17R
 sGwAz0rGPRGouXX9RC7LlxmI3AjYEIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769757360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KZZkXzd5fDUPvrsXerfENlc5CNZiHeiuJ0gmlq1LAjs=;
 b=iEYCRyBSOfK/KWhXTCXj/vLjdWDeE3pDWpLaxdOTsKOZKFvxczFcUsD8DtfTliNsN68EEb
 wa3myes6j8qTzIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B55573EA61;
 Fri, 30 Jan 2026 07:15:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /8ddKq9afGkiFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Jan 2026 07:15:59 +0000
Message-ID: <8d238204-b0f6-48a7-9afc-480097c32a23@suse.de>
Date: Fri, 30 Jan 2026 08:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
 <338ff7cf-1c7d-48da-b1b8-37aac440fed0@suse.de>
 <88f33e4e-5d0e-4520-a399-5be2901a3281@intel.com>
 <27af79a8-ee84-4845-a737-82d3883536e7@redhat.com>
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
In-Reply-To: <27af79a8-ee84-4845-a737-82d3883536e7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jfalempe@redhat.com,m:jacob.e.keller@intel.com,m:airlied@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:mid,suse.de:dkim,suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 579EBB7D11
X-Rspamd-Action: no action

Hi Jocelyn

Am 29.01.26 um 19:47 schrieb Jocelyn Falempe:
> On 29/01/2026 18:35, Jacob Keller wrote:
>> On 1/29/2026 12:15 AM, Thomas Zimmermann wrote:
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c 
>>>> b/drivers/gpu/drm/ mgag200/mgag200_bmc.c
>>>> index a689c71ff165..599b710bab9b 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>>> @@ -1,6 +1,7 @@
>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>   #include <linux/delay.h>
>>>> +#include <linux/iopoll.h>
>>>>   #include <drm/drm_atomic_helper.h>
>>>>   #include <drm/drm_edid.h>
>>>> @@ -12,7 +13,7 @@
>>>>   void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>>>>   {
>>>>       u8 tmp;
>>>> -    int iter_max;
>>>> +    int ret;
>>>>       /*
>>>>        * 1 - The first step is to inform the BMC of an upcoming mode
>>>> @@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device 
>>>> *mdev)
>>>>        * 3a- The third step is to verify if there is an active scan.
>>>>        * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
>>>>        */
>>>
>>> Either these comments or the original test seems incorrect.
>>>
>>> The test below is supposed to detect whether the BMC is scanning out 
>>> from the framebuffer. While it reads a horizontal scanline the bit 
>>> should be 0. That's what the test is for, but it gets the condition 
>>> wrong.
>>>
>>>> -    iter_max = 300;
>>>> -    while (!(tmp & 0x1) && iter_max) {
>>>> -        WREG8(DAC_INDEX, MGA1064_SPAREREG);
>>>> -        tmp = RREG8(DAC_DATA);
>>>> -        udelay(1000);
>>>> -        iter_max--;
>>>> -    }
>>>> +    ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
>>>> +                1000, 300000, false,
>>>> +                MGA1064_SPAREREG);
>>>
>>> The original while loop ran as long as "!(tmp & 0x1)". And now the 
>>> test stops if "!(tmp & 0x1)" AFAICT.  This (accidentally?) fixes the 
>>> test and makes the comment correct.
>>>
>>>
>>>> +    if (ret == -ETIMEDOUT)
>>>> +        return;
>>>>       /*
>>>>        * 3b- This step occurs only if the remove is actually
>>>
>>> Since you're at it, maybe fix this comment to say
>>>
>>> '... only if the remote BMC is ...'
>>>
>>>>        * scanning. We are waiting for the end of the frame which is
>>>>        * a 1 on remvsyncsts (XSPAREREG<1>)
>>>>        */
>>>> -    if (iter_max) {
>>>> -        iter_max = 300;
>>>> -        while ((tmp & 0x2) && iter_max) {
>>>> -            WREG8(DAC_INDEX, MGA1064_SPAREREG);
>>>> -            tmp = RREG8(DAC_DATA);
>>>> -            udelay(1000);
>>>> -            iter_max--;
>>>> -        }
>>>> -    }
>>>> +    (void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
>>>> +                1000, 300000, false,
>>>> +                MGA1064_SPAREREG);
>>>
>>> Again, the comment and original code disagree and the original test 
>>> condition appears to be inverted. It whats to test of the BMC has 
>>> finished scanning out the final frame. The bit should turn 1. 
>>> Instead it tests if the bit is already 1, which is likely true. 
>>> Hence that's probably where your 300 msec delays comes from.
>>>
>>> Best regards
>>> Thomas
>>>
>> @Dave or @Jocelyn, any chance one of you could help me figure out 
>> whether Thomas is correct here? It does seem likely that the 
>> conditions were originally inverted and thus forcing a wait for 
>> 300msec every time regardless. That does match my experience... But I 
>> don't have (and web searches failed to find) any relevant datasheets...
>
> I will give it a try tomorrow, on my test machine, and check what this 
> register value is in this case.

Thanks.

> Regarding documentation, I've only seen the original documentation for 
> the Matrox AGP card from 1999, but I never seen one with the BMC 
> registers.

Yeah, there's no documentation for the BMC interface AFAIK.

But the G200 manual has a description of the CRTC's  vsyncsts ("VSync 
Status"), which turns 1 whenever the display is doing vsync.  My 
assumption is that remvsyncsts ("Remote VSync Status") has the same 
semantics for the BMC output. Same for the remhsyncsts bit. The comments 
in this file indicate this.

>
> From what I understand this code is only there to wait enough time. As
> mgag200_bmc_stop_scanout() is only called on hotplug, we could even 
> replace that part with a msleep(300);

We do this on every mode switch from [1]. Presumably it stops the BMC 
output such that we can switch the mode reliably.

[1] 
https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


