Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834FB03A2F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B010E42D;
	Mon, 14 Jul 2025 09:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LRb9WCN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bIc23QE+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LRb9WCN3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bIc23QE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520710E427
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:00:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 756642170E;
 Mon, 14 Jul 2025 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752483609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j23UyznXBazRmRr8ekm5Tw6PXdMITLt5Hely4wU12hI=;
 b=LRb9WCN3UYSG6Ni30oRhiQoGYLuJx/+D6rKjn9Di2ZknaZI9aXBCTcyVO0J9FQxp+n7QOF
 gpK4JWaZEIJ/oHTYUHoSJp01Gu3ejcf/uvTyi/A0mFekCSPAQnerYeHB2e/6cC9nSiTzRv
 YkLvVaZhGw+fToQFJwl2q3LJXNKorh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752483609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j23UyznXBazRmRr8ekm5Tw6PXdMITLt5Hely4wU12hI=;
 b=bIc23QE+iBN6eUwkGR4q8CxnECMmiuMJL3a6vnKhKRsU3gD9BytNlkgm8PIsriCKEWShWc
 Pa4aTKgD1ksvpEDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LRb9WCN3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bIc23QE+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752483609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j23UyznXBazRmRr8ekm5Tw6PXdMITLt5Hely4wU12hI=;
 b=LRb9WCN3UYSG6Ni30oRhiQoGYLuJx/+D6rKjn9Di2ZknaZI9aXBCTcyVO0J9FQxp+n7QOF
 gpK4JWaZEIJ/oHTYUHoSJp01Gu3ejcf/uvTyi/A0mFekCSPAQnerYeHB2e/6cC9nSiTzRv
 YkLvVaZhGw+fToQFJwl2q3LJXNKorh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752483609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=j23UyznXBazRmRr8ekm5Tw6PXdMITLt5Hely4wU12hI=;
 b=bIc23QE+iBN6eUwkGR4q8CxnECMmiuMJL3a6vnKhKRsU3gD9BytNlkgm8PIsriCKEWShWc
 Pa4aTKgD1ksvpEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FBA7138A1;
 Mon, 14 Jul 2025 09:00:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K59PChnHdGiOOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 09:00:09 +0000
Message-ID: <6588c619-01b6-4df5-9cc1-27a96efb76bf@suse.de>
Date: Mon, 14 Jul 2025 11:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS
 to TRAINING_PATTERN_SET
To: imre.deak@intel.com, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708212331.112898-1-imre.deak@intel.com>
 <aG-j3NuvQCwLJKCO@ideak-desk> <aHTGkoRydum652gC@ideak-desk>
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
In-Reply-To: <aHTGkoRydum652gC@ideak-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,gitlab.freedesktop.org:url,suse.de:mid,suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 756642170E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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



Am 14.07.25 um 10:57 schrieb Imre Deak:
> Hi,
>
> On Thu, Jul 10, 2025 at 02:28:28PM +0300, Imre Deak wrote:
>> Hi Thomas, Maxime, Maarten,
>>
>> the patch this change fixes (commit a40c5d727b81) was merged via
>> drm-intel and is also part of v6.16-rc4 (there cherry-picked in commit
>> a3ef3c2da675).
>>
>> Are you ok with merging this fix via drm-intel as well, so that it could
>> be still merged to v6.16 before that's released?
> any objections to merging this patch to drm-intel? If not, could someone
> ack it?

Sure, a-b me.

Best regards
Thomas

>
> Thanks,
> Imre
>
>> Thanks,
>> Imre
>>
>> On Wed, Jul 09, 2025 at 12:23:31AM +0300, Imre Deak wrote:
>>> Commit a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from
>>> DPCD_REV to LANE0_1_STATUS") stopped using the DPCD_REV register for
>>> DPCD probing, since this results in link training failures at least when
>>> using an Intel Barlow Ridge TBT hub at UHBR link rates (the
>>> DP_INTRA_HOP_AUX_REPLY_INDICATION never getting cleared after the failed
>>> link training). Since accessing DPCD_REV during link training is
>>> prohibited by the DP Standard, LANE0_1_STATUS (0x202) was used instead,
>>> as it falls within the Standard's valid register address range
>>> (0x102-0x106, 0x202-0x207, 0x200c-0x200f, 0x2216) and it fixed the link
>>> training on the above TBT hub.
>>>
>>> However, reading the LANE0_1_STATUS register also has a side-effect at
>>> least on a Novatek eDP panel, as reported on the Closes: link below,
>>> resulting in screen flickering on that panel. One clear side-effect when
>>> doing the 1-byte probe reads from LANE0_1_STATUS during link training
>>> before reading out the full 6 byte link status starting at the same
>>> address is that the panel will report the link training as completed
>>> with voltage swing 0. This is different from the normal, flicker-free
>>> scenario when no DPCD probing is done, the panel reporting the link
>>> training complete with voltage swing 2.
>>>
>>> Using the TRAINING_PATTERN_SET register for DPCD probing doesn't have
>>> the above side-effect, the panel will link train with voltage swing 2 as
>>> expected and it will stay flicker-free. This register is also in the
>>> above valid register range and is unlikely to have a side-effect as that
>>> of LANE0_1_STATUS: Reading LANE0_1_STATUS is part of the link training
>>> CR/EQ sequences and so it may cause a state change in the sink - even if
>>> inadvertently as I suspect in the case of the above Novatek panel. As
>>> opposed to this, reading TRAINING_PATTERN_SET is not part of the link
>>> training sequence (it must be only written once at the beginning of the
>>> CR/EQ sequences), so it's unlikely to cause any state change in the
>>> sink.
>>>
>>> As a side-note, this Novatek panel also lacks support for TPS3, while
>>> claiming support for HBR2, which violates the DP Standard (the Standard
>>> mandating TPS3 for HBR2).
>>>
>>> Besides the Novatek panel (PSR 1), which this change fixes, I also
>>> verified the change on a Samsung (PSR 1) and an Analogix (PSR 2) eDP
>>> panel as well as on the Intel Barlow Ridge TBT hub.
>>>
>>> Note that in the drm-tip tree (targeting the v6.17 kernel version) the
>>> i915 and xe drivers keep DPCD probing enabled only for the panel known
>>> to require this (HP ZR24w), hence those drivers in drm-tip are not
>>> affected by the above problem.
>>>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>> Fixes: a40c5d727b81 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")
>>> Reported-and-tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>   drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>>> index 1c3920297906b..1ecc3df7e3167 100644
>>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>>> @@ -742,7 +742,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>>>   	int ret;
>>>   
>>>   	if (dpcd_access_needs_probe(aux)) {
>>> -		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
>>> +		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
>>>   		if (ret < 0)
>>>   			return ret;
>>>   	}
>>> -- 
>>> 2.44.2
>>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

