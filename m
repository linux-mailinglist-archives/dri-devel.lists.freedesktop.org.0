Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54659989A74
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 08:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C3910E2D6;
	Mon, 30 Sep 2024 06:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aUCOPNiy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ka3+uIWF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PZpT+Kbp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wU3vrRfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D25210E2CE;
 Mon, 30 Sep 2024 06:19:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF7AE219B9;
 Mon, 30 Sep 2024 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727677156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WRi9Z5ZiysvObqQa2swCamqMpfPUqEta7MgFDBf0WDA=;
 b=aUCOPNiyb2lvz/enmPydf1Hb+o2wycScbnEJMPuwkjuXU6MQacbg4ys8+gZAX7KkQYdLi0
 lOuew5Ce8m3HEINbO7mHxt4WF3QiRIYc4GhKTPuN+55vlX8G+e7UkjwJlPyUZP61Hr6/8s
 dxas+sghtjuGpt/w9zvlaIze8/rYqCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727677156;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WRi9Z5ZiysvObqQa2swCamqMpfPUqEta7MgFDBf0WDA=;
 b=Ka3+uIWFMxOOvArDw4Ht0O+khN0+BlMdJCO/xqCmMgszzOCAQSOdgxLDpTXEmtsGmjEcjJ
 8jG6ngBrVFcxCeAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PZpT+Kbp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wU3vrRfH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727677155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WRi9Z5ZiysvObqQa2swCamqMpfPUqEta7MgFDBf0WDA=;
 b=PZpT+KbpViKwtny0dDfP5ufHDEjpThWDpduRnA0e2LHWvYDi1FjXeOQOKHufttpNVmDuK/
 7JU2KkwnB1zJh0qUc6dgDORv16jVVkg0x/+kPwos0X3oIO5TTgv2B+b+yZmAb3nwa7tm7K
 fZ/cAY10ztlxDg229f3Wbyj3Ml5LSYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727677155;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=WRi9Z5ZiysvObqQa2swCamqMpfPUqEta7MgFDBf0WDA=;
 b=wU3vrRfH4ugIuY0HWA1y1wc4JVbrEAXFIAAi5dJ4Czs3M1HDQQBQx88JUHKLgu0npx+TAh
 q4VWlaNJoHSfKxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 819B413A8B;
 Mon, 30 Sep 2024 06:19:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 89fVG+NC+maLbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 30 Sep 2024 06:19:15 +0000
Message-ID: <e88b9f07-6eb6-4da5-ba92-a5e7c7fb712e@suse.de>
Date: Mon, 30 Sep 2024 08:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Introduce DRM client library
To: Felix Kuehling <felix.kuehling@amd.com>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
 <53d17411-f906-4a83-a44c-d8de22f11cbc@amd.com>
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
In-Reply-To: <53d17411-f906-4a83-a44c-d8de22f11cbc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DF7AE219B9
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[amd.com,ffwll.ch,gmail.com,redhat.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Am 27.09.24 um 21:27 schrieb Felix Kuehling:
>
> On 2024-09-27 10:37, Thomas Zimmermann wrote:
>> With the next DRM client coming soon (drm_log) and most of DRM's
>> fbdev emulation consolidated in a few places, it's time to provide
>> a single place for the clients.
>>
>> The new module drm_client_lib.ko stores most of the common client
>> code. It's designed such that drivers can opt into client support,
>> but the presence of the client module depends on the user's kernel
>> configuration. Without selected clients, no client module will be
>> build.
>>
>> Thomas Zimmermann (5):
>>    drm/i915: Select DRM_CLIENT_SELECTION
>>    drm/xe: Select DRM_CLIENT_SELECTION
>
> BTW, we are using drm_client in amdgpu, as well: 
> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c#L155

Right. Patch 5 selects DRM_CLIENT in the driver's Kconfig item. This 
will prove the plain drm_client code without any of the shared 
implementations (fbdev, log, etc). Unless the user enabled such an 
implementation, of course.

I've tried several combinations of =y and =m settings of these options 
and found this to be working well.

Best regards
Thomas

>
> Regards,
>   Felix
>
>
>>    drm: Move client-device functions in to drm_client_dev.c
>>    drm: Select fbdev helpers for modules that require them
>>    drm: Add client-lib module
>>
>>   Documentation/gpu/drm-client.rst   |   3 +
>>   drivers/gpu/drm/Kconfig            |  34 +++++--
>>   drivers/gpu/drm/Makefile           |  20 +++--
>>   drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
>>   drivers/gpu/drm/drm_client.c       | 122 +------------------------
>>   drivers/gpu/drm/drm_client_dev.c   | 138 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_dumb_buffers.c |   2 +
>>   drivers/gpu/drm/drm_file.c         |   2 +
>>   drivers/gpu/drm/drm_framebuffer.c  |   2 +
>>   drivers/gpu/drm/drm_gem.c          |   2 +
>>   drivers/gpu/drm/i915/Kconfig       |   1 +
>>   drivers/gpu/drm/xe/Kconfig         |   1 +
>>   12 files changed, 196 insertions(+), 132 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_client_dev.c
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

