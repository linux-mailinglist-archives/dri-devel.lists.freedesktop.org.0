Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CAAABB5F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 09:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D1C10E042;
	Tue,  6 May 2025 07:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SkMO06yo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J6odBsss";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkMO06yo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J6odBsss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454110E042
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 07:39:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 929981F394;
 Tue,  6 May 2025 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746517177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
 b=SkMO06yoach6wLGwv+m29h4epdrHbnuEUjxt3MMGeBwNjEQMefXO2wrKWt9IKp0cbJ3kEJ
 NGwOrUSFhnAQYKYEkpSWxNsa4a6TZRnwxhr2q8CWy6dSlcuLnhQhV9858ZW+lRT6lCjSGz
 T3F3COVb2vtENSdJFE1pBrkNRipBdR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746517177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
 b=J6odBsssK3RtaI9VQnBx2yRbe5nOASXuMAzGT0Cz8GUoSCZTRBI4t+XlkdmaU/EDHsEfW+
 TaQGX4fKK6a7hfDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746517177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
 b=SkMO06yoach6wLGwv+m29h4epdrHbnuEUjxt3MMGeBwNjEQMefXO2wrKWt9IKp0cbJ3kEJ
 NGwOrUSFhnAQYKYEkpSWxNsa4a6TZRnwxhr2q8CWy6dSlcuLnhQhV9858ZW+lRT6lCjSGz
 T3F3COVb2vtENSdJFE1pBrkNRipBdR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746517177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ehkdWJ3YE419DK32pcGDu4hccVQUEQyIl3HFAkVAK9A=;
 b=J6odBsssK3RtaI9VQnBx2yRbe5nOASXuMAzGT0Cz8GUoSCZTRBI4t+XlkdmaU/EDHsEfW+
 TaQGX4fKK6a7hfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DE3D137CF;
 Tue,  6 May 2025 07:39:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YdmYDbm8GWgATAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 May 2025 07:39:37 +0000
Message-ID: <e8b91c26-77e4-41a6-ab32-b0ef1bb7962c@suse.de>
Date: Tue, 6 May 2025 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250416065820.26076-1-tzimmermann@suse.de>
 <Z_96e7Lv-sEDUS6U@phenom.ffwll.local> <aBHoRTdsdOLFhzfg@phenom.ffwll.local>
 <20250505092949.1124657d@collabora.com>
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
In-Reply-To: <20250505092949.1124657d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,amd.com,kernel.org,linux.intel.com,lists.freedesktop.org,linaro.org,vger.kernel.org,lists.linaro.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email, suse.de:mid, suse.de:email,
 linaro.org:email, imap1.dmz-prg2.suse.org:helo]
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

Am 05.05.25 um 09:29 schrieb Boris Brezillon:
> On Wed, 30 Apr 2025 11:07:17 +0200
> Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
>> On Wed, Apr 16, 2025 at 11:38:03AM +0200, Simona Vetter wrote:
>>> On Wed, Apr 16, 2025 at 08:57:45AM +0200, Thomas Zimmermann wrote:
>>>> Test struct drm_gem_object.import_attach to detect imported objects.
>>>>
>>>> During object clenanup, the dma_buf field might be NULL. Testing it in
>>>> an object's free callback then incorrectly does a cleanup as for native
>>>> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
>>>> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
>>>>
>>>> v3:
>>>> - only test for import_attach (Boris)
>>>> v2:
>>>> - use import_attach.dmabuf instead of dma_buf (Christian)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>>> Reported-by: Andy Yan <andyshrk@163.com>
>>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>>> Tested-by: Andy Yan <andyshrk@163.com>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-media@vger.kernel.org
>>>> Cc: linaro-mm-sig@lists.linaro.org
>>> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>> Also quick doc request: We do have a bit of overview documentation for
>> prime here about specifically this lifetime fun, and why there's a chain
>> of references and hence a distinction between imported foreign dma-buf and
>> re-imported native dma-buf:
>>
>> https://dri.freedesktop.org/docs/drm/gpu/drm-mm.html#reference-counting-for-gem-drivers
>>
>> I think it would be good to augment this with more links to functions
>> (like this one recently added and fixed in this patch here) and struct
>> members to that overview. And maybe also link from key function and struct
>> functions back to that overview doc. Otherwise I think the next person
>> will get confused by this rather tricky code again and break a corner
>> cases.
> BTW, could we also backmerge 6.15-rc5 into drm-misc-next so the fix is
> also present in drm-misc-next?

drm-misc-next is now at -rc5

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

