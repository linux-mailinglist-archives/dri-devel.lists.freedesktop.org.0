Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN68AeYYn2n3YwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:44:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C7199DD7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D3B10E361;
	Wed, 25 Feb 2026 15:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RfcC+2JG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHwZt5+P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RfcC+2JG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHwZt5+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CC410E361
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:44:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C3185BD4B;
 Wed, 25 Feb 2026 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772034271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8QrVcp3XJnpZtRKefQ5Z+vfTy807siQM/mfm21NNyXk=;
 b=RfcC+2JGD0wYlLiwAC3y3i8QAF7MhpbA0nb61a+DxNGUYZIdPknPkKyf5kVZ0BFr2abxSz
 ciehsK5FS0g48EbKU3DRFujV96SPLMJNSHowIoaqQTBKSLFdNPB6+s71dbnQZxhyh/x1C1
 7hkjskqStTjnju7ZW5X9/ojx/K1bWsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772034271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8QrVcp3XJnpZtRKefQ5Z+vfTy807siQM/mfm21NNyXk=;
 b=FHwZt5+PHC52ZcUKjKdAYcphBmJZrL4L1yr+HzuNPYV1/lTK+dyXOUlrzmMmBUkSqxeO9k
 xm0kB3Xz2x7AWsDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RfcC+2JG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FHwZt5+P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772034271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8QrVcp3XJnpZtRKefQ5Z+vfTy807siQM/mfm21NNyXk=;
 b=RfcC+2JGD0wYlLiwAC3y3i8QAF7MhpbA0nb61a+DxNGUYZIdPknPkKyf5kVZ0BFr2abxSz
 ciehsK5FS0g48EbKU3DRFujV96SPLMJNSHowIoaqQTBKSLFdNPB6+s71dbnQZxhyh/x1C1
 7hkjskqStTjnju7ZW5X9/ojx/K1bWsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772034271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8QrVcp3XJnpZtRKefQ5Z+vfTy807siQM/mfm21NNyXk=;
 b=FHwZt5+PHC52ZcUKjKdAYcphBmJZrL4L1yr+HzuNPYV1/lTK+dyXOUlrzmMmBUkSqxeO9k
 xm0kB3Xz2x7AWsDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 502273EA65;
 Wed, 25 Feb 2026 15:44:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G1AaEt8Yn2lmKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Feb 2026 15:44:31 +0000
Message-ID: <acb347a4-51a6-4093-a5a3-c8e6c6382070@suse.de>
Date: Wed, 25 Feb 2026 16:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drm/gud] RFC: Convert dev_* logging to drm_*() for
 multi-instance GUD devices?
To: "hardik.phalet" <hardik.phalet@pm.me>, Ruben Wauters <rubenru09@aol.com>
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
References: <DGLADYEJGEKE.3JJBF0RHQ4T6H@pm.me>
 <c22170a2-b9d9-4cf9-8b10-a56fcb28301b@suse.de>
 <b8c179c1e557bfda50be169182d9c1f328693e81.camel@aol.com>
 <Jm9Imv-4KyfCKRB0pb5-1ToDa87cWio_j4nPB4HWQbgecFbIpUcTNeGMOLAPAy0xSfrS_n6tfKKmghJ8aeJ3sxhPuHLoRePBO2_hELC6l0w=@pm.me>
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
In-Reply-To: <Jm9Imv-4KyfCKRB0pb5-1ToDa87cWio_j4nPB4HWQbgecFbIpUcTNeGMOLAPAy0xSfrS_n6tfKKmghJ8aeJ3sxhPuHLoRePBO2_hELC6l0w=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hardik.phalet@pm.me,m:rubenru09@aol.com,m:seanpaul@chromium.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,aol.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 5A7C7199DD7
X-Rspamd-Action: no action

Hi

Am 25.02.26 um 15:27 schrieb hardik.phalet:
> Hi Ruben, hi Thomas,
>
> I’ll pick up the drm_simple_encoder_init() TODO first. Once that’s in a good shape, I can look into the logging conversion in GUD as a follow-up.

There are a lot of them. I strongly suggest to send one patch at a time.

Best regards
Thomas

>
> I’ll send a patch for the encoder cleanup once I have something ready.
>
> Thanks for the pointers!
>
> regards,
> Hardik
>
> On Wednesday, 25 February 2026 at 17:33, Ruben Wauters <rubenru09@aol.com> wrote:
>
>> Hi
>>
>> On Wed, 2026-02-25 at 09:48 +0100, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 22.02.26 um 07:45 schrieb Hardik Phalet:
>>>> Hi Ruben,
>>>>
>>>> I am looking to work on a small starter task in DRM and was considering
>>>> converting logging in drivers/gpu/drm/gud from dev_info/dev_warn/dev_err
>>>> to the drm_*() helpers where a struct drm_device is already (or readily)
>>>> available.
>> My apologies, I seem to have missed this message in the first place, I
>> think this is mainly fine.
>>>> Since GUD is a USB-backed DRM driver and can have multiple active
>>>> instances, using drm_*() would make log messages instance-aware and
>>>> consistent with DRM drivers.
>>>>
>>>> Before preparing a patch series, I wanted to check whether this kind of
>>>> conversion is welcome for GUD, and whether there are any parts of the driver
>>>> you would prefer to keep using dev_*() instead of drm_*().
>> In my opinion, logging that relates specifically to USB should use dev
>> rather than logging that relates to drm, if it does relate to drm then
>> it should be fine to convert them. I'm happy to accept a patch.
>>>> If this is fine, I plan to keep the changes mechanical and scoped only to
>>>> call sites where drm_device is already in scope, preserving logging
>>>> semantics.
>>> I'm not Ruben, but generally speaking that conversion of the logging is
>>> ok. But there's not much in gud to convert and the early calls in
>>> gud_probe() should rather not be converted.
>> I agree with Thomas here, gud_probe() as a function is still a bit of a
>> mess, but since it relates to early init, and the early parts are
>> mainly to do with USB and capabilities assessment, they should remain
>> dev
>>> If you're looking for an easy task, maybe try open-coding
>>> drm_simple_encoder_init(). There's an upcoming TODO item at [1].
>> I'm happy for you to do conversions if you want, but this also seems to
>> be a good task to do. If not I probably will end up looking at it
>> myself eventually.
>>
>> Ruben
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://lore.kernel.org/dri-devel/20260224153656.261351-17-tzimmermann@suse.de/T/#Z2e.:..:20260224153656.261351-17-tzimmermann::40suse.de:1Documentation:gpu:todo.rst
>>>> Thanks,
>>>> Hardik
>>>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


