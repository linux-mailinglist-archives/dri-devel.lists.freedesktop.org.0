Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817EC0CC9F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F45910E433;
	Mon, 27 Oct 2025 09:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ow+s/aox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mFCX9Ei1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ow+s/aox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mFCX9Ei1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2679610E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:56:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB9981F387;
 Mon, 27 Oct 2025 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761559011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r83Cy/mc02fZQTFlWzTU5lHgFwf03ZbG2vGkqc8Dqe0=;
 b=ow+s/aoxLOjRuwrYB6zLW43RewS2YlHDe+e4+YKiu+gQfb2CuJNXGvxdz+0Da6TROtQYnY
 VClDpLGFEUETyvEYahucGgKquYVRZ8OOJMHrNcPgKTeowvlEvdN8m6+CYIZhPCYScDuT48
 pzqZQbgwbAZNtVf/I+8XLOQgY+wNxeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761559011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r83Cy/mc02fZQTFlWzTU5lHgFwf03ZbG2vGkqc8Dqe0=;
 b=mFCX9Ei1Wemeb1PNr4c9R28kZ6hcjKgvnDSMYSLdT5iG2PybTv3JcoeuzjJB7IZQls26Bi
 LIr3blxS6ahfl0Cg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ow+s/aox";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mFCX9Ei1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761559011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r83Cy/mc02fZQTFlWzTU5lHgFwf03ZbG2vGkqc8Dqe0=;
 b=ow+s/aoxLOjRuwrYB6zLW43RewS2YlHDe+e4+YKiu+gQfb2CuJNXGvxdz+0Da6TROtQYnY
 VClDpLGFEUETyvEYahucGgKquYVRZ8OOJMHrNcPgKTeowvlEvdN8m6+CYIZhPCYScDuT48
 pzqZQbgwbAZNtVf/I+8XLOQgY+wNxeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761559011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r83Cy/mc02fZQTFlWzTU5lHgFwf03ZbG2vGkqc8Dqe0=;
 b=mFCX9Ei1Wemeb1PNr4c9R28kZ6hcjKgvnDSMYSLdT5iG2PybTv3JcoeuzjJB7IZQls26Bi
 LIr3blxS6ahfl0Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD876136CF;
 Mon, 27 Oct 2025 09:56:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1UPsKONB/2hreQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 09:56:51 +0000
Message-ID: <5daeda5a-c4d9-4a10-a5d3-c0808a23c144@suse.de>
Date: Mon, 27 Oct 2025 10:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251016145230.79270-1-tzimmermann@suse.de>
 <IA0PR11MB7185A7BA7B8CEAC46CBC0922F8F6A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <21851b98-06ee-4e2c-8570-70e8a4fe5d86@suse.de>
 <afc6ba14-cd95-49b9-89f5-e90fd19c8927@collabora.com>
 <a2afbc13-0be6-46ef-a6da-9461fd30376b@collabora.com>
 <126a0b10-a550-430c-a1b3-7e144461a0ff@suse.de>
 <IA0PR11MB71850CA585D6E42C1E7217DDF8F3A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <c6b44524-4e44-46e8-89b4-8f90e074431b@collabora.com>
 <84de3c82-638a-412c-8e25-9ff507d59400@suse.de>
 <IA0PR11MB7185DCAF9132F2CD92E42620F8F0A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <8ac5053a-5f76-4145-a2f6-6bdd8316163e@collabora.com>
 <c5aa4544-9ff6-4669-b8d2-f8548c4c4eda@collabora.com>
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
In-Reply-To: <c5aa4544-9ff6-4669-b8d2-f8548c4c4eda@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DB9981F387
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
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

Am 24.10.25 um 04:57 schrieb Dmitry Osipenko:
> On 10/24/25 05:55, Dmitry Osipenko wrote:
>> On 10/23/25 09:22, Kasireddy, Vivek wrote:
>>> Also, I think you might want to limit the plane sync to host mechanism to just guest
>>> blobs only because based on what Dmitry said the vblank timer helps in virgl/venus/
>>> native context use-cases. That is,
>>> @@ -138,7 +140,7 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>>>          for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
>>>                  struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
>>>
>>> -               if (bo->host3d_blob || bo->guest_blob) {
>>> +               if (bo->guest_blob && !vgdev->has_virgl_3d) {
>> Checking for obj->import_attach should be enough if it's only prime
>> sharing that doesn't work properly with vblank timer.
>>
>> Please verify that only prime needs the workaround and send the updated
>> patch.
> Don't forget to add clarifying comment to the code explaining the
> workaround.

Sent out as "drm/virtgpu: Make vblank event dependent on the external sync".

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


