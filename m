Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF7B22275
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 11:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014E10E5C8;
	Tue, 12 Aug 2025 09:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RACKT0ro";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1PegsWVU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EG02BdcD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vqLcvkbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3652A10E116
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 09:12:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA6EA21AE2;
 Tue, 12 Aug 2025 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754989927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=94izK1UqE0zK/VkezMOFFQkw0IKhHTtrTLtBEaaeano=;
 b=RACKT0rotsxPojtjWG3BkUK1ZKyS+BCEF9h8k29Xosrq6VTnHe4GqVyS4MZtuKoqvAY4Ny
 ZfSvf96RG5sgKOumlcXXatabLU0OWzbAuM6j0o4oNElG917o34ZmXqqF6jqms5nk8gaJrG
 JzzfVCcx0pMZl9l92Fx7BVUdWgHBjx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754989927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=94izK1UqE0zK/VkezMOFFQkw0IKhHTtrTLtBEaaeano=;
 b=1PegsWVUwEJWPAmqzI3kgTJtmp/CVrH5b77fWQ5xJTV1TdVLDyTJni4NChUzFgTZ2fyQti
 QJ4oG+03WXLD6QBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EG02BdcD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vqLcvkbZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754989926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=94izK1UqE0zK/VkezMOFFQkw0IKhHTtrTLtBEaaeano=;
 b=EG02BdcDNNHGdD9ixA5Sh+CxC+CKuBVEUKm5UT+/wacUcMIGXY3iXpMHJ07YtiXpuD0IUC
 S9N/cEzSwUhX5AFcFGEBaEUOkr246zyihRSpKHUATGXkz+B1mqoJvfTzA5+0aGCffasqpL
 DaNE05gYlcsg1C/6t4coUrcSOGKAxwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754989926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=94izK1UqE0zK/VkezMOFFQkw0IKhHTtrTLtBEaaeano=;
 b=vqLcvkbZKKBxh0bIZwD88Gj9TfSmQ8z4DxKmim0d550Xyrpb6wY7ktT4abBsHD5jvUOZYn
 oFBFyl6SMXIPPvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 965C9136C7;
 Tue, 12 Aug 2025 09:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OiNDI2YFm2i2cQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 09:12:06 +0000
Message-ID: <914153f3-e250-41f5-bfd2-412def4e2fec@suse.de>
Date: Tue, 12 Aug 2025 11:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amdgpu: Use dma_buf from GEM object instance"
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250715082635.34974-1-tzimmermann@suse.de>
 <CADnq5_NRP8tokX7M9yKA=+sLrY0Owrg5gWyg-NH3qC1sNyZ8ww@mail.gmail.com>
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
In-Reply-To: <CADnq5_NRP8tokX7M9yKA=+sLrY0Owrg5gWyg-NH3qC1sNyZ8ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: CA6EA21AE2
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

Hi

Am 15.07.25 um 16:01 schrieb Alex Deucher:
> On Tue, Jul 15, 2025 at 4:38 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> This reverts commit 515986100d176663d0a03219a3056e4252f729e6.
>>
>> The dma_buf field in struct drm_gem_object is not stable over the
>> object instance's lifetime. The field becomes NULL when user space
>> releases the final GEM handle on the buffer object. This resulted
>> in a NULL-pointer deref.
>>
>> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
>> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
>> Acquire internal references on GEM handles") only solved the problem
>> partially. They especially don't work for buffer objects without a DRM
>> framebuffer associated.
>>
>> Hence, this revert to going back to using .import_attach->dmabuf.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Can I take this patch into drm-misc-fixes?

Best regards
Thomas

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
>>   3 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index ff98c87b2e0b..5743ebb2f1b7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
>>                  return false;
>>
>>          if (drm_gem_is_imported(obj)) {
>> -               struct dma_buf *dma_buf = obj->dma_buf;
>> +               struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>
>>                  if (dma_buf->ops != &amdgpu_dmabuf_ops)
>>                          /* No XGMI with non AMD GPUs */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 6626a6e64ff5..d1ccbfcf21fa 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -317,7 +317,8 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>>           */
>>          if (!vm->is_compute_context || !vm->process_info)
>>                  return 0;
>> -       if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf))
>> +       if (!drm_gem_is_imported(obj) ||
>> +           !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>>                  return 0;
>>          mutex_lock_nested(&vm->process_info->lock, 1);
>>          if (!WARN_ON(!vm->process_info->eviction_fence)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index af0f655dfd5b..b9b4f7d9186e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>>                  struct drm_gem_object *obj = &bo->tbo.base;
>>
>>                  if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
>> -                       struct dma_buf *dma_buf = obj->dma_buf;
>> +                       struct dma_buf *dma_buf = obj->import_attach->dmabuf;
>>                          struct drm_gem_object *gobj = dma_buf->priv;
>>                          struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
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


