Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A7C85F25
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6576910E433;
	Tue, 25 Nov 2025 16:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rxcHTUOS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yRvSJNwe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jxlKsqOZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pWGSpGSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C44D10E41E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:22:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE0FC2279F;
 Tue, 25 Nov 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764087728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qVWteth2CW4grxymKBfkcAQ2Y6lgyq+8fjlcjGvCdE=;
 b=rxcHTUOSMi91yqyshLu0nXlrTbfin/DxFYxy68+9o5Lz//U3hZZcdjlKLHiUcks2sNFb5d
 Nw+OBrAf2kdZEY8eaQrFByd0uhfsWG/FmvucIqTas+/tk5AXRhRPH5vvcJNRiCAVeu9sDs
 JlbSW7nQ5++eYnulUKTb2Pilge3qSMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764087728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qVWteth2CW4grxymKBfkcAQ2Y6lgyq+8fjlcjGvCdE=;
 b=yRvSJNwewWvQZN6EMbe+ZH57h9Ype/yn78RFRv+PNLYJCaiiGwSN/MWsLEvYlaOy7wnyVS
 T9xIEZPg7AUb66CQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jxlKsqOZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pWGSpGSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764087727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qVWteth2CW4grxymKBfkcAQ2Y6lgyq+8fjlcjGvCdE=;
 b=jxlKsqOZGQElJHBq1oPDmP5F6Jc54BuJNQY4M+S+XFJq6L493Mk0ifEe6vzy3vj9uOD1ch
 wsFa7Y9EcZSUiTHev6F14FH0ph+/SrIXnp6rmwNQ7esC+lj+GftEOWXVg/kanV0b1RaN86
 fPmOiadBoSqJP+lckHT6VBqAWLCafpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764087727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qVWteth2CW4grxymKBfkcAQ2Y6lgyq+8fjlcjGvCdE=;
 b=pWGSpGSfBZkjXtE6lj76qjxTTU7v28kiwiq9wRoAZ3aAPRRV+Fhr40paxglFA656gZ53M4
 1DSAyAx8WxL2H+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CE7F3EA63;
 Tue, 25 Nov 2025 16:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hQZWEa/XJWm8VQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 16:22:07 +0000
Message-ID: <65622142-c3b0-4ef3-9a74-09420bc2220d@suse.de>
Date: Tue, 25 Nov 2025 17:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Doug Anderson <dianders@chromium.org>
Cc: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nir Lichtman <nir@lichtman.org>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
 <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
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
In-Reply-To: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CE0FC2279F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[19];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,lists.freedesktop.org,vger.kernel.org,lichtman.org];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,suse.de:email,suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
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

Hi

Am 25.11.25 um 16:26 schrieb Doug Anderson:
> Hi,
>
> On Tue, Nov 25, 2025 at 5:06 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Remove the rest of the kbd support from DRM. Driver support has been
>> broken for years without anyone complaining.
>>
>> Kdb cannot use regular DRM mode setting, so DRM drivers have to
>> implement an additional hook to make it work (in theory). As outlined
>> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
>> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
>> setting. Non-atomic mode setting meanwhile has become rare.
>>
>> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
>> nouveau use non-atomic mode setting on older devices. But both drivers
>> have switched to generic fbdev emulation, which isn't compatible with
>> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
>> commits in this series for details
>>
>> Therefore remove the remaining support for kdb from the DRM drivers
>> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
>> there are no fbdev drivers with kdb support.
>>
>> If we ever want to address kdb support within DRM drivers, a place to
>> start would be the scanout buffers used by DRM's panic screen. These
>> use the current display mode. They can be written and flushed without
>> mode setting involved.
>>
>> Note: kdb over serial lines is not affected by this series and continues
>> to work as before.
>>
>> Thomas Zimmermann (5):
>>    drm/amdgpu: Do not implement mode_set_base_atomic callback
>>    drm/nouveau: Do not implement mode_set_base_atomic callback
>>    drm/radeon: Do not implement mode_set_base_atomic callback
>>    drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>>    fbcon: Remove fb_debug_enter/_leave from struct fb_ops
> Personally, I've never worked with kdb over anything other than
> serial, so this won't bother any of my normal workflows. That being
> said, at least as of a year ago someone on the lists was talking about
> using kdb with a keyboard and (presumably) a display. You can see a
> thread here:
>
> http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org

I wonder which driver or kernel that person was using. None of the 
current drivers would be working.

Best regards
Thomas

>
> Daniel may also have comments here?
>
> -Doug
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


