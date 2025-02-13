Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E24A3414A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:07:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C6810EAC5;
	Thu, 13 Feb 2025 14:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yqN+ctyD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ymOu7Xl0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gzXpQrid";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t33cFLA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EEF10EAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:07:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDB251F7A8;
 Thu, 13 Feb 2025 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739455619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UU8ccXQYojm4A1gYs88PyDtJvguSjurGqgRMdk4zYoY=;
 b=yqN+ctyDUvDWDAdlIZNheB+43h5ewvXI2ZjlHY/XU7umqCajLcrzOPKB6KQmrLNIibnnFx
 rdwo13yElhkl20EM8q6Z5ON5r/F95OyyLohA0Yd7FhuGNVFlqyX/strvxYwKDzV5jmHBLh
 KuOZPi4BcVTSdtyBDB7+rwvYwohTK5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739455619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UU8ccXQYojm4A1gYs88PyDtJvguSjurGqgRMdk4zYoY=;
 b=ymOu7Xl05UaODl7onCg3AIHCqn8QjnOe4ZMvQBBZ67Y7R3qOTx30Q7MsdfmcyZILPiOjOx
 U/prO5Co0lQePjBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gzXpQrid;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="t33cFLA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739455618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UU8ccXQYojm4A1gYs88PyDtJvguSjurGqgRMdk4zYoY=;
 b=gzXpQriddbr11r73VOrkjAhOusVenq299ajMdJQjGL6ORRbAnRXhVavcVBYUMXQQYtr/fv
 82IMHVA8+TQvaIUMRijWWwGrwVxj5kA0BKX5miLv61r7DZfY/7EZWrdpztOiEcpBuLaDEX
 Hfpk4JwpDynI8kFaM4nticrg75Xz+OA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739455618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UU8ccXQYojm4A1gYs88PyDtJvguSjurGqgRMdk4zYoY=;
 b=t33cFLA/z7d0bpq1C8kY5AgC2tWLVsYes236LZEaSctsBnyV/1Scl6rO9y20Smv249fS7m
 6kwwPzZI2bRmDKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85CC613874;
 Thu, 13 Feb 2025 14:06:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AyVfH4L8rWfsYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 14:06:58 +0000
Message-ID: <fa913baa-7208-45bf-94e5-71d7e3f37623@suse.de>
Date: Thu, 13 Feb 2025 15:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
 <ef58703e-75c8-4b35-8acc-4bd79abbb150@linux.intel.com>
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
In-Reply-To: <ef58703e-75c8-4b35-8acc-4bd79abbb150@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDB251F7A8
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,quicinc.com,linux.intel.com,ffwll.ch,kernel.org]; 
 RCPT_COUNT_SEVEN(0.00)[9]; TAGGED_RCPT(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi

Am 12.02.25 um 14:27 schrieb Jacek Lawrynowicz:
> Hi,
>
> Thanks for your detailed feedback and constructive suggestions. I appreciate this as it is not easy to learn all process details otherwise.
>
> On 2/12/2025 11:20 AM, Thomas Zimmermann wrote:
>> Hi,
>>
>> here's a complaint about the lack of process and documentation in accel/, and ivpu specifically. I came across this series while preparing the weekly PR for drm-misc-next and found myself unable to extract much useful information to report. This is a problem for a development process that relies on transparency, accountability and collaboration. Other problematic examples are at [1] and [2]. IIRC I had similar issues in previous development cycles.
>>
>> I cannot assess the quality of the code itself, but the process and documentation involved does not meet the requirements.
>>
>> - 'Changes for <version>' is not an meaningful description for a patch series. It's not the submitter (or anyone else) deciding that this series gets merged into version so-and-so. The series gets merged when it is ready to be merged.
>>
>> - Apparently this series contains 3 different things (buffer imports, locking, debugging); so it should be 3 series with each addressing one of these topics.
>>
>> - The series' description just restates the patch descriptions briefly. It should rather give some indication of the problem being solved by the contained patches, and context on why this is worth solving. (I know that this is often complicated to state clearly to outsiders.)
> We were sometimes using patchsets to bundle patches that were tested together. We apologize for any confusion this may have caused, as we were not aware that this approach was not preferred. Moving forward, we will ensure that patches are split into separate series, each addressing a specific topic. I hope this will help improve clarity and make it easier to understand and assess the changes.

Thank you.

>
>> - Review should be public. I understand that it's often only one dev team working on a specific driver, discussing issues internally. Still it makes sense to do the code reviews in public, so that others can follow what is going on in the driver. Public code reviews are also necessary to establish consent and institutional knowledge within the wider developer community. You miss that with internal reviews.
>>
>> - These patches come with R-b tags pre-applied. Even for trivial changes, R-b tags should given in public. If the R-bs have been given elsewhere, please include a reference to that location. The tags (R-b, A-b, T-b, etc) are not just for verifying the code itself. They also establish trust in the development process involving each patch; and in the developers involved in that process. This needs to happen in public to be effective.
> We value all public comments and typically wait a week for public reviews before submitting patches, regardless of whether an R-b tag is pre-applied. I was not aware that pre-applying R-b tags was an issue. We we will ensure that all R-b tags are added publicly from now on.
>
>> - The kernel's (or any FOSS') development is organized around individuals, not organizations. Having each developer send their changes individually would likely resolve most of the current problems.
> OK, I'll talk to the team about this.

Thanks again.

>
>> I understand that accel is not graphics and can feel somewhat detached from the rest of DRM. Yet it is part of the DRM subsystem. This development cycles' ivpu series' made me go to IRC and ask for accel/ to be removed from the drm-misc tree. Luckily the other maintainer were more charitable. So I make these remarks in good faith and hope that we can improve the processes within accel/.
> I appreciate your feedback and would welcome more remarks. Please keep in mind that all accel drivers are new, and it takes time to learn all the upstream rules.
> The kernel/DRM development process is quite unique, and not everything is fully documented. I find emails like this to be incredibly valuable and I am eager to comply with the guidelines.
> I just need some patience and guidance as I navigate through this. Thank you for your understanding and support.

Remember, you DO have a say in these guidelines. Those rules come from 
what works best for everyone; not only what maintainers say. It's just 
that now it doesn't work too well for accel/.

Best regards
Thomas

>
> Regards,
> Jacek
>
>> Best regards
>> Thomas
>>
>> [1] https://patchwork.freedesktop.org/series/143182/
>> [2] https://patchwork.freedesktop.org/series/144101/
>>
>>
>> Am 04.02.25 um 09:46 schrieb Jacek Lawrynowicz:
>>> Add possibility to import single buffer into multiple contexts,
>>> fix locking when aborting contexts and add some debug features.
>>>
>>> Andrzej Kacprowski (2):
>>>     accel/ivpu: Add missing locks around mmu queues
>>>     accel/ivpu: Prevent runtime suspend during context abort work
>>>
>>> Karol Wachowski (3):
>>>     ccel/ivpu: Add debugfs interface for setting HWS priority bands
>>>     accel/ivpu: Add test modes to toggle clock relinquish disable
>>>     accel/ivpu: Implement D0i2 disable test modea
>>>
>>> Tomasz Rusinowicz (1):
>>>     accel/ivpu: Allow to import single buffer into multiple contexts
>>>
>>>    drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
>>>    drivers/accel/ivpu/ivpu_drv.c     |  2 +-
>>>    drivers/accel/ivpu/ivpu_drv.h     |  4 ++
>>>    drivers/accel/ivpu/ivpu_fw.c      |  4 ++
>>>    drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
>>>    drivers/accel/ivpu/ivpu_gem.h     |  1 +
>>>    drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
>>>    drivers/accel/ivpu/ivpu_hw.h      |  5 ++
>>>    drivers/accel/ivpu/ivpu_job.c     | 10 +++-
>>>    drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
>>>    drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
>>>    11 files changed, 202 insertions(+), 20 deletions(-)
>>>
>>> -- 
>>> 2.45.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

