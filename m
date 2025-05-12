Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EA7AB39C3
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 15:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6555C10E19C;
	Mon, 12 May 2025 13:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PDJIHbw9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2EnbZdgF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PDJIHbw9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2EnbZdgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B1610E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 13:55:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 857D521180;
 Mon, 12 May 2025 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747058147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBdr3bvq5pE0BuqMVtK48aN9jats40VCxo7BIgE4GGw=;
 b=PDJIHbw9+zSsQrB6uKgOX2pL+yTpcD4qQ3euB3RNIm1vT2LOaHD4JfK+TmrWqJLIPeEr+4
 /xUW0X1STeEh9unwNXb3cbHCKHEANNHWQpc80PE4sGmNrBopqCXlt1KdZrWfiI5dXXEzO0
 P7UBzpEA3GQyJw83UxEgQG4YIHSDPd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747058147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBdr3bvq5pE0BuqMVtK48aN9jats40VCxo7BIgE4GGw=;
 b=2EnbZdgFUDqSNXKDANqAj8Q+pMmOnxy0cpJfKBE136MQf6FWRrLEyIFd6oi77OcYeWhAom
 VeVosHPVsdIkY5Ag==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PDJIHbw9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2EnbZdgF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747058147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBdr3bvq5pE0BuqMVtK48aN9jats40VCxo7BIgE4GGw=;
 b=PDJIHbw9+zSsQrB6uKgOX2pL+yTpcD4qQ3euB3RNIm1vT2LOaHD4JfK+TmrWqJLIPeEr+4
 /xUW0X1STeEh9unwNXb3cbHCKHEANNHWQpc80PE4sGmNrBopqCXlt1KdZrWfiI5dXXEzO0
 P7UBzpEA3GQyJw83UxEgQG4YIHSDPd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747058147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cBdr3bvq5pE0BuqMVtK48aN9jats40VCxo7BIgE4GGw=;
 b=2EnbZdgFUDqSNXKDANqAj8Q+pMmOnxy0cpJfKBE136MQf6FWRrLEyIFd6oi77OcYeWhAom
 VeVosHPVsdIkY5Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44B941397F;
 Mon, 12 May 2025 13:55:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id U71vD+P9IWg9MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 May 2025 13:55:47 +0000
Message-ID: <76a99e10-6040-4547-8ad2-6941c17f479e@suse.de>
Date: Mon, 12 May 2025 15:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm: Add helpers for programming hardware gamma LUTs
To: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-2-tzimmermann@suse.de>
 <61e26230-e1c2-449c-965a-1f84ede0ac2e@redhat.com>
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
In-Reply-To: <61e26230-e1c2-449c-965a-1f84ede0ac2e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 857D521180
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
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

Am 12.05.25 um 15:31 schrieb Jocelyn Falempe:
> On 09/05/2025 10:23, Thomas Zimmermann wrote:
>> Provide helpers that program hardware gamma LUTs. Tha gamma ramp is
>> either provided by the driver or generated by the helper.
>>
>> The DRM driver exports the GAMMA_LUT property with a fixed number of
>> entries per color component, such as 256 on 8-bit-wide components. The
>> entries describe the gamma ramp of each individual component. The new
>> helper drm_crtc_load_gamma_888() loads such gamma ramp to hardware. The
>> hardware uses each displayed pixel's individial components as indeces
>> into the hardware gamma table.
>>
>> For color modes with less than 8 bits per color component, the helpers
>> drm_crtc_load_gamma_565_from() and drm_crtc_load_gamma_555_from_888()
>> interpolate the provided gamma ramp to reduce it to the correct number
>> of entries; 5/6/5 for RGB565-like formats and 5/5/5 for RGB1555-like
>> formats.
>>
>> If no gamma ramp has been provided, drivers can use the new helper
>> drm_crtc_fill_gamma_888() to load a default gamma ramp with 256 entries
>> per color component. For color modes with less bits, the new helpers
>> drm_crtc_fill_gamma_565() and drm_crtc_fill_gamma_555() are available.
>> The default gamma ramp uses a gamma factor of 1. Later patches can
>> change this. For PCs, a gamma factor of 2.2 is common.
>>
>> For color modes with palette, drm_crtc_load_palette_8() load an 8-bit
>> palette into the hardware. If no palette has been specified,
>> drm_crtc_fill_palette_8() load a system-specific default palette. This
>> is currently only a grey-scale palette with increasing luminance, but
>> later patches can change this. For PCs, a VGA default palette could
>> be used.
>
> Thanks for this work. I've one comment below regarding the 
> drm_crtc_set_lut_func prototype.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_color_mgmt.c | 206 +++++++++++++++++++++++++++++++
>>   include/drm/drm_color_mgmt.h     |  27 ++++
>>   2 files changed, 233 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c 
>> b/drivers/gpu/drm/drm_color_mgmt.c
>> index 3969dc548cff..dd3e06605180 100644
>> --- a/drivers/gpu/drm/drm_color_mgmt.c
>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
>> @@ -630,3 +630,209 @@ int drm_color_lut_check(const struct 
>> drm_property_blob *lut, u32 tests)
>>       return 0;
>>   }
>>   EXPORT_SYMBOL(drm_color_lut_check);
>> +
>> +/*
>> + * Gamma-LUT programming
>> + */
>> +
>> +/**
>> + * drm_crtc_load_gamma_888 - Programs gamma ramp for RGB888-like 
>> formats
>> + * @crtc: The displaying CRTC
>> + * @lut: The gamma ramp to program
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs the gamma ramp specified in @lut to hardware. The input 
>> gamma
>> + * ramp must have 256 entries per color component.
>> + */
>> +void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct 
>> drm_color_lut *lut,
>> +                 drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 256; ++i)
>> +        set_gamma(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_load_gamma_888);
>> +
>> +/**
>> + * drm_crtc_load_gamma_565_from_888 - Programs gamma ramp for 
>> RGB565-like formats
>> + * @crtc: The displaying CRTC
>> + * @lut: The gamma ramp to program
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs the gamma ramp specified in @lut to hardware. The input 
>> gamma
>> + * ramp must have 256 entries per color component. The helper 
>> interpolates
>> + * the individual color components to reduce the number of entries 
>> to 5/6/5.
>> + */
>> +void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const 
>> struct drm_color_lut *lut,
>> +                      drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +    u16 r, g, b;
>> +
>> +    for (i = 0; i < 32; ++i) {
>> +        r = lut[i * 8 + i / 4].red;
>> +        g = lut[i * 4 + i / 16].green;
>> +        b = lut[i * 8 + i / 4].blue;
>> +        set_gamma(crtc, i, r, g, b);
>> +    }
>> +    /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +    for (i = 32; i < 64; ++i) {
>> +        g = lut[i * 4 + i / 16].green;
>> +        set_gamma(crtc, i, 0, g, 0);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_crtc_load_gamma_565_from_888);
>> +
>> +/**
>> + * drm_crtc_load_gamma_555_from_888 - Programs gamma ramp for 
>> RGB555-like formats
>> + * @crtc: The displaying CRTC
>> + * @lut: The gamma ramp to program
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs the gamma ramp specified in @lut to hardware. The input 
>> gamma
>> + * ramp must have 256 entries per color component. The helper 
>> interpolates
>> + * the individual color components to reduce the number of entries 
>> to 5/5/5.
>> + */
>> +void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const 
>> struct drm_color_lut *lut,
>> +                      drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +    u16 r, g, b;
>> +
>> +    for (i = 0; i < 32; ++i) {
>> +        r = lut[i * 8 + i / 4].red;
>> +        g = lut[i * 8 + i / 4].green;
>> +        b = lut[i * 8 + i / 4].blue;
>> +        set_gamma(crtc, i, r, g, b);
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_crtc_load_gamma_555_from_888);
>> +
>> +static void fill_gamma_888(struct drm_crtc *crtc, unsigned int i, 
>> u16 r, u16 g, u16 b,
>> +               drm_crtc_set_lut_func set_gamma)
>> +{
>> +    r = (r << 8) | r;
>> +    g = (g << 8) | g;
>> +    b = (b << 8) | b;
>> +
>> +    set_gamma(crtc, i, r, g, b);
>> +}
>> +
>> +/**
>> + * drm_crtc_fill_gamma_888 - Programs a default gamma ramp for 
>> RGB888-like formats
>> + * @crtc: The displaying CRTC
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs a default gamma ramp to hardware.
>> + */
>> +void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 256; ++i)
>> +        fill_gamma_888(crtc, i, i, i, i, set_gamma);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_fill_gamma_888);
>> +
>> +static void fill_gamma_565(struct drm_crtc *crtc, unsigned int i, 
>> u16 r, u16 g, u16 b,
>> +               drm_crtc_set_lut_func set_gamma)
>> +{
>> +    r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
>> +    g = (g << 10) | (g << 4) | (g >> 2);
>> +    b = (b << 11) | (b << 6) | (b << 1) | (b >> 4);
>> +
>> +    set_gamma(crtc, i, r, g, b);
>> +}
>> +
>> +/**
>> + * drm_crtc_fill_gamma_565 - Programs a default gamma ramp for 
>> RGB565-like formats
>> + * @crtc: The displaying CRTC
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs a default gamma ramp to hardware.
>> + */
>> +void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 32; ++i)
>> +        fill_gamma_565(crtc, i, i, i, i, set_gamma);
>> +    /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +    for (i = 32; i < 64; ++i)
>> +        fill_gamma_565(crtc, i, 0, i, 0, set_gamma);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_fill_gamma_565);
>> +
>> +static void fill_gamma_555(struct drm_crtc *crtc, unsigned int i, 
>> u16 r, u16 g, u16 b,
>> +               drm_crtc_set_lut_func set_gamma)
>> +{
>> +    r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
>> +    g = (g << 11) | (g << 6) | (g << 1) | (g >> 4);
>> +    b = (b << 11) | (b << 6) | (b << 1) | (r >> 4);
>> +
>> +    set_gamma(crtc, i, r, g, b);
>> +}
>> +
>> +/**
>> + * drm_crtc_fill_gamma_555 - Programs a default gamma ramp for 
>> RGB555-like formats
>> + * @crtc: The displaying CRTC
>> + * @set_gamma: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs a default gamma ramp to hardware.
>> + */
>> +void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 32; ++i)
>> +        fill_gamma_555(crtc, i, i, i, i, set_gamma);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_fill_gamma_555);
>> +
>> +/*
>> + * Color-LUT programming
>> + */
>> +
>> +/**
>> + * drm_crtc_load_palette_8 - Programs palette for C8-like formats
>> + * @crtc: The displaying CRTC
>> + * @lut: The palette to program
>> + * @set_palette: Callback for programming the hardware palette
>> + *
>> + * Programs the palette specified in @lut to hardware. The input 
>> palette
>> + * must have 256 entries per color component.
>> + */
>> +void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct 
>> drm_color_lut *lut,
>> +                 drm_crtc_set_lut_func set_palette)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 256; ++i)
>> +        set_palette(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_load_palette_8);
>> +
>> +static void fill_palette_8(struct drm_crtc *crtc, unsigned int i,
>> +               drm_crtc_set_lut_func set_palette)
>> +{
>> +    u16 Y = (i << 8) | i; // relative luminance
>> +
>> +    set_palette(crtc, i, Y, Y, Y);
>> +}
>> +
>> +/**
>> + * drm_crtc_fill_palette_8 - Programs a default palette for C8-like 
>> formats
>> + * @crtc: The displaying CRTC
>> + * @set_palette: Callback for programming the hardware gamma LUT
>> + *
>> + * Programs a default palette to hardware.
>> + */
>> +void drm_crtc_fill_palette_8(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_palette)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < 256; ++i)
>> +        fill_palette_8(crtc, i, set_palette);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_fill_palette_8);
>> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
>> index ed81741036d7..6cb577f6dba6 100644
>> --- a/include/drm/drm_color_mgmt.h
>> +++ b/include/drm/drm_color_mgmt.h
>> @@ -118,4 +118,31 @@ enum drm_color_lut_tests {
>>   };
>>     int drm_color_lut_check(const struct drm_property_blob *lut, u32 
>> tests);
>> +
>> +/*
>> + * Gamma-LUT programming
>> + */
>> +
>> +typedef void (*drm_crtc_set_lut_func)(struct drm_crtc *, unsigned 
>> int, u16, u16, u16);
>
> All drivers using this code, have 256 LUT size, and use 8bits value.
> So I would prefer to have it declared like this:
> typedef void (*drm_crtc_set_lut_func)(struct drm_crtc *, u8, u8, u8, u8);
>
> This will avoid to upcast from u8 to u16, and then from u16 to u8 in 
> each driver.

I don't want to change that, because that second shift really depends on 
the hardware:

- some of the VESA color modes affect bit shifts [1] (although I was 
unable to setup one so far)
- anything VGA-compatible would use 6 bits per component
- other drivers use 10 bits per component, for example amdgpu at [2].

To build reusable helpers, we need to take this into account.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.14.6/source/drivers/video/fbdev/vesafb.c#L93
[2] 
https://elixir.bootlin.com/linux/v6.14.6/source/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c#L2071

>
>> +
>> +void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct 
>> drm_color_lut *lut,
>> +                 drm_crtc_set_lut_func set_gamma);
>> +void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const 
>> struct drm_color_lut *lut,
>> +                      drm_crtc_set_lut_func set_gamma);
>> +void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const 
>> struct drm_color_lut *lut,
>> +                      drm_crtc_set_lut_func set_gamma);
>> +
>> +void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma);
>> +void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma);
>> +void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_gamma);
>> +
>> +/*
>> + * Color-LUT programming
>> + */
>> +
>> +void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct 
>> drm_color_lut *lut,
>> +                 drm_crtc_set_lut_func set_palette);
>> +
>> +void drm_crtc_fill_palette_8(struct drm_crtc *crtc, 
>> drm_crtc_set_lut_func set_palette);
>> +
>>   #endif
>
>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

