Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C58A79CD7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 09:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F7C10E918;
	Thu,  3 Apr 2025 07:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="l6wA2+Ln";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZWV9rxk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l6wA2+Ln";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZWV9rxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2411C10E912
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 07:23:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB11A2116A;
 Thu,  3 Apr 2025 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743665003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g1blWvMEZIepGH22X2LA/p1AHhY717LbUd3yioMBF2M=;
 b=l6wA2+Lnj57Xy3Or0AKa6PSq5F/s8nTxtzXeBBC5vH3ZCOAEe3z5XCUpp9sL0BBaYTJrdB
 A5sWKeN1IB3sheGAwX5OKZPjvyc2UlqytpSzAfkzWoff+nJYk2RCweadHi71xuQAc24X8o
 soDOpoUTWEyylN2dY0rteGg87hwlvpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743665003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g1blWvMEZIepGH22X2LA/p1AHhY717LbUd3yioMBF2M=;
 b=sZWV9rxk6rnQe7jqxzdtS1/C75OMO8Q2Z+lxKD9efD9xN9vgziHtqDY1anbbAFbZX47AbR
 YQIJQQEoRGuoa/Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743665003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g1blWvMEZIepGH22X2LA/p1AHhY717LbUd3yioMBF2M=;
 b=l6wA2+Lnj57Xy3Or0AKa6PSq5F/s8nTxtzXeBBC5vH3ZCOAEe3z5XCUpp9sL0BBaYTJrdB
 A5sWKeN1IB3sheGAwX5OKZPjvyc2UlqytpSzAfkzWoff+nJYk2RCweadHi71xuQAc24X8o
 soDOpoUTWEyylN2dY0rteGg87hwlvpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743665003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g1blWvMEZIepGH22X2LA/p1AHhY717LbUd3yioMBF2M=;
 b=sZWV9rxk6rnQe7jqxzdtS1/C75OMO8Q2Z+lxKD9efD9xN9vgziHtqDY1anbbAFbZX47AbR
 YQIJQQEoRGuoa/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81AFA13A2C;
 Thu,  3 Apr 2025 07:23:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AuP4HWs37mflRAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Apr 2025 07:23:23 +0000
Message-ID: <308c1a27-1239-4145-8191-7510986ff256@suse.de>
Date: Thu, 3 Apr 2025 09:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC drm-next 0/1] Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, drawat.floss@gmail.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
References: <20250402084351.1545536-1-ryasuoka@redhat.com>
 <dae5089d-e214-4518-b927-5c4149babad8@suse.de>
 <CAHpthZp5L-iyE=sggm-fjooVsgLcMPpBSyNkfCC5Dj0B=Vy2JQ@mail.gmail.com>
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
In-Reply-To: <CAHpthZp5L-iyE=sggm-fjooVsgLcMPpBSyNkfCC5Dj0B=Vy2JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,lists.freedesktop.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

Am 02.04.25 um 15:52 schrieb Ryosuke Yasuoka:
> On Wed, Apr 2, 2025 at 6:45 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 02.04.25 um 10:43 schrieb Ryosuke Yasuoka:
>>> This patch adds drm_panic support for hyperv-drm driver. This function
>>> works but it's still needed to brush up. Let me hear your opinions.
>>>
>>> Once kernel panic occurs we expect to see a panic screen. However, to
>>> see the screen, I need to close/re-open the graphic console client
>>> window. As the panic screen shows correctly in the small preview
>>> window in Hyper-V manager and debugfs API for drm_panic works correctly,
>>> I think kernel needs to send signal to Hyper-V host that the console
>>> client refreshes, but I have no idea what kind of signal is needed.
>>>
>>> This patch is tested on Hyper-V 2022.
>>>
>>> Ryosuke Yasuoka (1):
>>>     drm/hyperv: Add support for drm_panic
>>>
>>>    drivers/gpu/drm/drm_simple_kms_helper.c     | 26 +++++++++++++
>>>    drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 42 +++++++++++++++++++++
>>>    include/drm/drm_simple_kms_helper.h         | 22 +++++++++++
>> No changes to simple_kms_helper please. This is obsolete and should go
>> away. Just put everything into hyperv_drm.
> OK. Maybe it will work without any modification in simple_kms_helper if we can
> call the pipe->funcs from draw_panic_plane() like drm_plane_helper_funcs.

No problem about that. Feel free to open-code everything that you need 
in the hyperv driver.

>
> Currently, the hyperv_drm is implemented with a simple display pipeline.
> The pipeline control functions are in pipe->funcs and they will call via
> drm_simple_kms_palne_helper_funcs. And these helper functions will
> be called by drm_panic_plane().

Someone should update the hyperv driver to not use simple pipe.

Best regards
Thomas

>
> Thank you for your comment.
> Ryosuke
>
>> Best regards
>> Thomas
>>
>>>    3 files changed, 90 insertions(+)
>>>
>>>
>>> base-commit: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

