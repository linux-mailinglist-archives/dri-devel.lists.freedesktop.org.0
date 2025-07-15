Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA6B0537B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDC810E528;
	Tue, 15 Jul 2025 07:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y8Vww33Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VqIdmu5i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y8Vww33Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VqIdmu5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F5210E528
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 07:41:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 532771F38F;
 Tue, 15 Jul 2025 07:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752565273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Gk7G2jSEd+3kfJ8oGcpG/kwUEn5RkJvPAvLlM1rLHY=;
 b=y8Vww33QSPmXlKS1Ib8f1qcdoxDDWJ32ccV7Kurs1g2MFhyhYzqtO2nkrBLlEcvBDO+MAT
 7ZYjDImaywGjjSM9+KxSSYyYXBPuljzLMJ8wuZMR8LBhwVOKanrm3Y0MVfH3WqXNrDXMQP
 zqFtVwZsR+aEZlqVwgiUlan7W1fGBDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752565273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Gk7G2jSEd+3kfJ8oGcpG/kwUEn5RkJvPAvLlM1rLHY=;
 b=VqIdmu5iTxQV1Zz3TR3niskdIO4FmU+zu2Eklz8Hc6eQUZ5wnk61CukM+9hBxNn+rM8MIM
 6SToD1o5u3DAXGBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y8Vww33Q;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VqIdmu5i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752565273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Gk7G2jSEd+3kfJ8oGcpG/kwUEn5RkJvPAvLlM1rLHY=;
 b=y8Vww33QSPmXlKS1Ib8f1qcdoxDDWJ32ccV7Kurs1g2MFhyhYzqtO2nkrBLlEcvBDO+MAT
 7ZYjDImaywGjjSM9+KxSSYyYXBPuljzLMJ8wuZMR8LBhwVOKanrm3Y0MVfH3WqXNrDXMQP
 zqFtVwZsR+aEZlqVwgiUlan7W1fGBDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752565273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Gk7G2jSEd+3kfJ8oGcpG/kwUEn5RkJvPAvLlM1rLHY=;
 b=VqIdmu5iTxQV1Zz3TR3niskdIO4FmU+zu2Eklz8Hc6eQUZ5wnk61CukM+9hBxNn+rM8MIM
 6SToD1o5u3DAXGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9D6113A68;
 Tue, 15 Jul 2025 07:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h+LILxgGdmhVRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 07:41:12 +0000
Message-ID: <7053d7c9-62c1-480c-bca6-ca8ad6ca49a0@suse.de>
Date: Tue, 15 Jul 2025 09:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <aHT6i723ffg2_m2v@phenom.ffwll.local>
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
In-Reply-To: <aHT6i723ffg2_m2v@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCPT_COUNT_TWELVE(0.00)[20]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com,lists.freedesktop.org,lists.linux.dev];
 MID_RHS_MATCH_FROM(0.00)[]; TAGGED_RCPT(0.00)[etnaviv];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 532771F38F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Am 14.07.25 um 14:39 schrieb Simona Vetter:
> On Fri, Jul 11, 2025 at 11:35:15AM +0200, Thomas Zimmermann wrote:
>> Revert the use of drm_gem_object.dma_buf back to .import_attach->dmabuf
>> in the affected places. Also revert any fixes on top. Separates references
>> to imported and exported DMA bufs within a GEM object; as before.
>>
>> Using the dma_buf as the one authoritative field for the DMA buf turns
>> out to be fragile. The GEM object's dma_buf pointer can be NULL if
>> userspace releases the GEM handle too early. Sima mentioned that the fix
>> in commit 5307dce878d4 ("drm/gem: Acquire references on GEM handles for
>> framebuffers") is conceptionally broken. Linus still notices boot-up
>> hangs that might be related.
>>
>> Reverting the whole thing is the only sensible action here.
>>
>> Tested on virtio; and amdgpu, simpledrm plus udl for dma-buf sharing.
>>
>> Thomas Zimmermann (9):
>>    Revert "drm/framebuffer: Acquire internal references on GEM handles"
>>    Revert "drm/gem: Acquire references on GEM handles for framebuffers"
> Ok, I think all the below we should still apply for -fixes, because
> fundamentally gem_bo->dma_buf is not invariant over the lifetime of the
> buffer, while gem_bo->import_attach.dmabuf is. And so we blow up.
>
> For display drivers the handle_count reference mostly papers over the
> issues, but even display drivers are allowed to keep internal references
> to the underlying gem bo for longer. So there could be a bunch of really
> tricky bugs lurking.
>
> For render drivers it's even clearer, they don't have framebuffers as
> objects, so there the fb handle_count references does not help.
>
> I'm not opposed to trying to unify these fields for imported dma_buf, but
> currently they're just not. Hence all the reverts.

Thanks for the write up.

>
> The patches also need Fixes: and as needed, cc: stable added for merging.
> With that and the above text as additional justification added:
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
>
> Also we'd need to chase down any addiotional conversions that have only
> landed in -next meanwhile of course.
>
> ₣or the handle_count patches I'm less sure. I don't think they're
> justified for fixing the gem_bo->dma_buf NULL pointer issues, but they do
> probably help with the GETFB/2 confusion Christian has pointed out.
> Personally my preference is:
> 1. Apply the two reverts.
> 2. Create an igt testcase for the GETFB confusion
> 3. Figure out what the right fix for that is, which might or might not be
> the handle_count reference of drm_fb.
>
> But with my maintainer hat on I don't mind about the exact path, as long
> as we get there somehow. If you decide to do land the reverts, they also
> have my:
>
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Let's first revert all the dma_buf switching in drm-misc and other 
trees. They should
be easy. If we revert the framebuffer-related A changes first, we might 
end up with
these intermediate errors again.

There's no hurry with the framebuffer changes. We can address them after 
upstream
picked up the dma-buf reverts.

Best regards
Thomas

>
> Cheers, Sima
>
>>    Revert "drm/virtio: Use dma_buf from GEM object instance"
>>    Revert "drm/vmwgfx: Use dma_buf from GEM object instance"
>>    Revert "drm/etnaviv: Use dma_buf from GEM object instance"
>>    Revert "drm/prime: Use dma_buf from GEM object instance"
>>    Revert "drm/gem-framebuffer: Use dma_buf from GEM object instance"
>>    Revert "drm/gem-shmem: Use dma_buf from GEM object instance"
>>    Revert "drm/gem-dma: Use dma_buf from GEM object instance"
>>
>>   drivers/gpu/drm/drm_framebuffer.c            | 31 +---------
>>   drivers/gpu/drm/drm_gem.c                    | 64 +++-----------------
>>   drivers/gpu/drm/drm_gem_dma_helper.c         |  2 +-
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c |  8 ++-
>>   drivers/gpu/drm/drm_gem_shmem_helper.c       |  4 +-
>>   drivers/gpu/drm/drm_internal.h               |  2 -
>>   drivers/gpu/drm/drm_prime.c                  |  8 ++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  4 +-
>>   drivers/gpu/drm/virtio/virtgpu_prime.c       |  5 +-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c          |  6 +-
>>   include/drm/drm_framebuffer.h                |  7 ---
>>   11 files changed, 35 insertions(+), 106 deletions(-)
>>
>> -- 
>> 2.50.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

