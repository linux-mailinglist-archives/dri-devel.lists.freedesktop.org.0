Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99DAB3027
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 08:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E22910E2DC;
	Mon, 12 May 2025 06:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KxeNM7zB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YP1n/Z7E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vyRAoYEp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h6o6xCKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9A410E2DC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 06:58:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 849871F74B;
 Mon, 12 May 2025 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747033111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NtC7Zo82kXVCj54Rn2XFjGJuPSZpY+O5S7oBUnYnzYc=;
 b=KxeNM7zBdNixXBDoYeVztPvc18FfKpwWWqwa1MzbGs/9agNxg9p99YFrtnNqb0rZ6fvvf8
 dZiqdwtXVBztZC0jbW9C4JWBzCMw7zDBT1K2RCTP7r5H2LFurVNraETZOyHrrFK4JGNR0+
 wofHptcn6VUy3t+E/hnFk0FXyFO9eTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747033111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NtC7Zo82kXVCj54Rn2XFjGJuPSZpY+O5S7oBUnYnzYc=;
 b=YP1n/Z7EGL7fI0yzM1rNIbMKHg6z7QnUaGxH6QXZRzw0QgS0nKQaMlPaYbvJY/8sIonauV
 iiq3dvTtTI3HLkCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747033110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NtC7Zo82kXVCj54Rn2XFjGJuPSZpY+O5S7oBUnYnzYc=;
 b=vyRAoYEpLD3vz70xGU3USxDMUjrFztPsmp185LwWYnrll+eTLCd9NkfxsWI/Iy/RjzMqfu
 TQOrQGLmjGcQPkbZZL3g1rvcDCmgkkK+r+nVzZHRQcQfpqO9W1GGq6uL/hFl9GD3UiuP3h
 zqFiuZ3e0uyjwW8OtGPnaiXItFETvPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747033110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NtC7Zo82kXVCj54Rn2XFjGJuPSZpY+O5S7oBUnYnzYc=;
 b=h6o6xCKNCAo2bJm93Mu1aHzVrbsiAm8yNeiJGcmUaVOqcrPp3tE+loqNITJCzqXZIor41V
 YkuVa3OK+LdDcbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F058E137D2;
 Mon, 12 May 2025 06:58:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EDBZORWcIWjXAQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 May 2025 06:58:29 +0000
Message-ID: <787b65b9-3fa5-45b5-a0be-daea29fddc3b@suse.de>
Date: Mon, 12 May 2025 08:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tiny: panel-mipi-dbi: Use
 drm_client_setup_with_fourcc()
To: Fabio Estevam <festevam@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>, stable@vger.kernel.org
References: <20250417103458.2496790-1-festevam@gmail.com>
 <87cyd3c180.fsf@minerva.mail-host-address-is-not-set>
 <CAOMZO5CghWOyYse2nJjKzAk2tTGXTsag=EYeS+cS6tV6YO+NLw@mail.gmail.com>
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
In-Reply-To: <CAOMZO5CghWOyYse2nJjKzAk2tTGXTsag=EYeS+cS6tV6YO+NLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_RHS_MATCH_FROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,linux.intel.com,kernel.org,tronnes.org,lists.freedesktop.org,denx.de,vger.kernel.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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



Am 09.05.25 um 13:06 schrieb Fabio Estevam:
> Hi Javier and Thomas,
>
> On Tue, Apr 22, 2025 at 6:53 PM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Fabio Estevam <festevam@gmail.com> writes:
>>
>> Hello Fabio,
>>
>>> From: Fabio Estevam <festevam@denx.de>
>>>
>>> Since commit 559358282e5b ("drm/fb-helper: Don't use the preferred depth
>>> for the BPP default"), RGB565 displays such as the CFAF240320X no longer
>>> render correctly: colors are distorted and the content is shown twice
>>> horizontally.
>>>
>>> This regression is due to the fbdev emulation layer defaulting to 32 bits
>>> per pixel, whereas the display expects 16 bpp (RGB565). As a result, the
>>> framebuffer data is incorrectly interpreted by the panel.
>>>
>>> Fix the issue by calling drm_client_setup_with_fourcc() with a format
>>> explicitly selected based on the display's bits-per-pixel value. For 16
>>> bpp, use DRM_FORMAT_RGB565; for other values, fall back to the previous
>>> behavior. This ensures that the allocated framebuffer format matches the
>>> hardware expectations, avoiding color and layout corruption.
>>>
>>> Tested on a CFAF240320X display with an RGB565 configuration, confirming
>>> correct colors and layout after applying this patch.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 559358282e5b ("drm/fb-helper: Don't use the preferred depth for the BPP default")
>>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Could you please help apply this fix?

Merged into drm-misc-fixes

Best regards
Thomas

>
> Thanks

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

