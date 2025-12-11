Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F9CB5B95
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3D10E72C;
	Thu, 11 Dec 2025 12:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uJBjyoPD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hpYo+yxN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uJBjyoPD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hpYo+yxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1BA10E72C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:01:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F0945BE30;
 Thu, 11 Dec 2025 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765454467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zkp6Ecu9H4FlmSXH/ICp1u7TFvR8FXQVVnlXqjO5cpo=;
 b=uJBjyoPDiumCdZMFzG/Uc+M3HZ48n0Zn+WtazbFTRUJq/363IFvStSfijfKsFN3teX7xyE
 Ds2lT8jiOEn/fmU9nEq4k61OQMnGDv/vROOJNMVHShTkJtvnkqQln/K7nxqYA9A0m6z7Bn
 egfCqrKl4kEJ0yu0eJLx0Xvp8hwhtZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765454467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zkp6Ecu9H4FlmSXH/ICp1u7TFvR8FXQVVnlXqjO5cpo=;
 b=hpYo+yxNbWf0gaMwNjbq+Y6COkePS7FTTCADfiI1CXH8TN6TE5d8iWGCSZaN1HjZPb3eqk
 bAix+2l8U5Ua7zBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765454467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zkp6Ecu9H4FlmSXH/ICp1u7TFvR8FXQVVnlXqjO5cpo=;
 b=uJBjyoPDiumCdZMFzG/Uc+M3HZ48n0Zn+WtazbFTRUJq/363IFvStSfijfKsFN3teX7xyE
 Ds2lT8jiOEn/fmU9nEq4k61OQMnGDv/vROOJNMVHShTkJtvnkqQln/K7nxqYA9A0m6z7Bn
 egfCqrKl4kEJ0yu0eJLx0Xvp8hwhtZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765454467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zkp6Ecu9H4FlmSXH/ICp1u7TFvR8FXQVVnlXqjO5cpo=;
 b=hpYo+yxNbWf0gaMwNjbq+Y6COkePS7FTTCADfiI1CXH8TN6TE5d8iWGCSZaN1HjZPb3eqk
 bAix+2l8U5Ua7zBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1DD53EA63;
 Thu, 11 Dec 2025 12:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VjqlOYKyOmlaCAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Dec 2025 12:01:06 +0000
Message-ID: <35714551-4aae-41c3-a1d2-02ecb27af910@suse.de>
Date: Thu, 11 Dec 2025 13:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm: Add driver for Sitronix ST7920 LCD displays
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
 <20251126-st7920-v5-2-64eda5267d35@gmail.com>
 <c8ed7bf9-b5fb-4246-a079-2c77bd98989d@suse.de>
Content-Language: en-US
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
In-Reply-To: <c8ed7bf9-b5fb-4246-a079-2c77bd98989d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[dt]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[12];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, suse.com:url]
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

Hi Iker,

Am 11.12.25 um 12:42 schrieb Thomas Zimmermann:
>
>
[...]
>
> The rest of the code looks good and I think this can go in with the 
> final fixes applied.

With the final issues fixed, you can add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to the patch.

Best regards
Thomas

>
> Best regards
> Thomas
>
>
>> +}
>> +
>> +static void st7920_primary_plane_atomic_disable(struct drm_plane 
>> *plane,
>> +                         struct drm_atomic_state *state)
>> +{
>> +    struct drm_device *drm = plane->dev;
>> +    struct st7920_device *st7920 = drm_to_st7920(drm);
>> +    struct drm_plane_state *plane_state = 
>> drm_atomic_get_new_plane_state(state, plane);
>> +    struct drm_crtc_state *crtc_state;
>> +    struct st7920_crtc_state *st7920_crtc_state;
>> +    int idx;
>> +
>> +    if (!plane_state->crtc)
>> +        return;
>> +
>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
>> plane_state->crtc);
>> +    st7920_crtc_state = to_st7920_crtc_state(crtc_state);
>> +
>> +    if (!drm_dev_enter(drm, &idx))
>> +        return;
>> +
>> +    st7920_clear_screen(st7920, st7920_crtc_state->data_array);
>> +
>> +    drm_dev_exit(idx);
>> +}
>> +
>> +/* Called during init to allocate the plane's atomic state. */
>> +static void st7920_primary_plane_reset(struct drm_plane *plane)
>> +{
>> +    struct st7920_plane_state *st7920_state;
>> +
>> +    drm_WARN_ON_ONCE(plane->dev, plane->state);
>> +
>> +    st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
>> +    if (!st7920_state)
>> +        return;
>> +
>> +    __drm_gem_reset_shadow_plane(plane, &st7920_state->base);
>> +}
>> +
>> +static struct drm_plane_state 
>> *st7920_primary_plane_duplicate_state(struct drm_plane *plane)
>> +{
>> +    struct drm_shadow_plane_state *new_shadow_plane_state;
>> +    struct st7920_plane_state *st7920_state;
>> +
>> +    if (drm_WARN_ON_ONCE(plane->dev, !plane->state))
>> +        return NULL;
>> +
>> +    st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
>> +    if (!st7920_state)
>> +        return NULL;
>> +
>> +    new_shadow_plane_state = &st7920_state->base;
>> +
>> +    __drm_gem_duplicate_shadow_plane_state(plane, 
>> new_shadow_plane_state);
>> +
>> +    return &new_shadow_plane_state->base;
>> +}
>> +
>> +static void st7920_primary_plane_destroy_state(struct drm_plane *plane,
>> +                        struct drm_plane_state *state)
>> +{
>> +    struct st7920_plane_state *st7920_state = 
>> to_st7920_plane_state(state);
>> +
>> +    kfree(st7920_state->buffer);
>> +
>> + __drm_gem_destroy_shadow_plane_state(&st7920_state->base);
>> +
>> +    kfree(st7920_state);
>> +}
>> +
>> +static const struct drm_plane_helper_funcs 
>> st7920_primary_plane_helper_funcs = {
>> +    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>> +    .atomic_check = st7920_primary_plane_atomic_check,
>> +    .atomic_update = st7920_primary_plane_atomic_update,
>> +    .atomic_disable = st7920_primary_plane_atomic_disable,
>> +};
>> +
>> +static const struct drm_plane_funcs st7920_primary_plane_funcs = {
>> +    .update_plane = drm_atomic_helper_update_plane,
>> +    .disable_plane = drm_atomic_helper_disable_plane,
>> +    .reset = st7920_primary_plane_reset,
>> +    .atomic_duplicate_state = st7920_primary_plane_duplicate_state,
>> +    .atomic_destroy_state = st7920_primary_plane_destroy_state,
>> +    .destroy = drm_plane_cleanup,
>> +};
>> +
>> +static enum drm_mode_status st7920_crtc_mode_valid(struct drm_crtc 
>> *crtc,
>> +                            const struct drm_display_mode *mode)
>> +{
>> +    struct st7920_device *st7920 = drm_to_st7920(crtc->dev);
>> +
>> +    return drm_crtc_helper_mode_valid_fixed(crtc, mode, &st7920->mode);
>> +}
>> +
>> +static int st7920_crtc_atomic_check(struct drm_crtc *crtc,
>> +                     struct drm_atomic_state *state)
>> +{
>> +    struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>> +    struct st7920_crtc_state *st7920_state = 
>> to_st7920_crtc_state(crtc_state);
>> +    int ret;
>> +
>> +    ret = drm_crtc_helper_atomic_check(crtc, state);
>> +    if (ret)
>> +        return ret;
>> +
>> +    st7920_state->data_array = kmalloc(BYTES_IN_DISPLAY, GFP_KERNEL);
>> +    if (!st7920_state->data_array)
>> +        return -ENOMEM;
>> +
>> +    return 0;
>> +}
>> +
>> +static void st7920_crtc_atomic_enable(struct drm_crtc *crtc,
>> +                      struct drm_atomic_state *state)
>> +{
>> +    struct drm_device *drm = crtc->dev;
>> +    struct st7920_device *st7920 = drm_to_st7920(drm);
>> +    int idx;
>> +    int ret;
>> +
>> +    if (!drm_dev_enter(drm, &idx))
>> +        return;
>> +
>> +    st7920_hw_reset(st7920);
>> +
>> +    ret = st7920_init(st7920);
>> +    if (ret)
>> +        drm_err(drm, "Failed to init hardware: %d\n", ret);
>> +
>> +    drm_dev_exit(idx);
>> +}
>> +
>> +static void st7920_crtc_atomic_disable(struct drm_crtc *crtc,
>> +                       struct drm_atomic_state *state)
>> +{
>> +    struct spi7920_error err = {0};
>> +    struct drm_device *drm = crtc->dev;
>> +    struct st7920_device *st7920 = drm_to_st7920(drm);
>> +    int idx;
>> +
>> +    drm_dev_enter(drm, &idx);
>> +
>> +    st7920_power_off(st7920, &err);
>> +
>> +    drm_dev_exit(idx);
>> +}
>> +
>> +/* Called during init to allocate the CRTC's atomic state. */
>> +static void st7920_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +    struct st7920_crtc_state *st7920_state;
>> +
>> +    drm_WARN_ON_ONCE(crtc->dev, crtc->state);
>> +
>> +    st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
>> +    if (!st7920_state)
>> +        return;
>> +
>> +    __drm_atomic_helper_crtc_reset(crtc, &st7920_state->base);
>> +}
>> +
>> +static struct drm_crtc_state *st7920_crtc_duplicate_state(struct 
>> drm_crtc *crtc)
>> +{
>> +    struct st7920_crtc_state *st7920_state;
>> +
>> +    if (drm_WARN_ON_ONCE(crtc->dev, !crtc->state))
>> +        return NULL;
>> +
>> +    st7920_state = kzalloc(sizeof(*st7920_state), GFP_KERNEL);
>> +    if (!st7920_state)
>> +        return NULL;
>> +
>> +    __drm_atomic_helper_crtc_duplicate_state(crtc, 
>> &st7920_state->base);
>> +
>> +    return &st7920_state->base;
>> +}
>> +
>> +static void st7920_crtc_destroy_state(struct drm_crtc *crtc,
>> +                        struct drm_crtc_state *state)
>> +{
>> +    struct st7920_crtc_state *st7920_state = 
>> to_st7920_crtc_state(state);
>> +
>> +    kfree(st7920_state->data_array);
>> +
>> +    __drm_atomic_helper_crtc_destroy_state(state);
>> +
>> +    kfree(st7920_state);
>> +}
>> +
>> +/*
>> + * The CRTC is always enabled. Screen updates are performed by
>> + * the primary plane's atomic_update function. Disabling clears
>> + * the screen in the primary plane's atomic_disable function.
>> + */
>> +static const struct drm_crtc_helper_funcs st7920_crtc_helper_funcs = {
>> +    .mode_valid = st7920_crtc_mode_valid,
>> +    .atomic_check = st7920_crtc_atomic_check,
>> +    .atomic_enable = st7920_crtc_atomic_enable,
>> +    .atomic_disable = st7920_crtc_atomic_disable,
>> +};
>> +
>> +static const struct drm_crtc_funcs st7920_crtc_funcs = {
>> +    .reset = st7920_crtc_reset,
>> +    .destroy = drm_crtc_cleanup,
>> +    .set_config = drm_atomic_helper_set_config,
>> +    .page_flip = drm_atomic_helper_page_flip,
>> +    .atomic_duplicate_state = st7920_crtc_duplicate_state,
>> +    .atomic_destroy_state = st7920_crtc_destroy_state,
>> +};
>> +
>> +static const struct drm_encoder_funcs st7920_encoder_funcs = {
>> +    .destroy = drm_encoder_cleanup,
>> +};
>> +
>> +static int st7920_connector_get_modes(struct drm_connector *connector)
>> +{
>> +    struct st7920_device *st7920 = drm_to_st7920(connector->dev);
>> +
>> +    return drm_connector_helper_get_modes_fixed(connector, 
>> &st7920->mode);
>> +}
>> +
>> +static const struct drm_connector_helper_funcs 
>> st7920_connector_helper_funcs = {
>> +    .get_modes = st7920_connector_get_modes,
>> +};
>> +
>> +static const struct drm_connector_funcs st7920_connector_funcs = {
>> +    .reset = drm_atomic_helper_connector_reset,
>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>> +    .destroy = drm_connector_cleanup,
>> +    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static const struct drm_mode_config_funcs st7920_mode_config_funcs = {
>> +    .fb_create = drm_gem_fb_create_with_dirty,
>> +    .atomic_check = drm_atomic_helper_check,
>> +    .atomic_commit = drm_atomic_helper_commit,
>> +};
>> +
>> +static const uint32_t st7920_formats[] = {
>> +    DRM_FORMAT_XRGB8888,
>> +};
>> +
>> +DEFINE_DRM_GEM_FOPS(st7920_fops);
>> +
>> +static const struct drm_driver st7920_drm_driver = {
>> +    DRM_GEM_SHMEM_DRIVER_OPS,
>> +    DRM_FBDEV_SHMEM_DRIVER_OPS,
>> +    .name            = DRIVER_NAME,
>> +    .desc            = DRIVER_DESC,
>> +    .date            = DRIVER_DATE,
>> +    .major            = DRIVER_MAJOR,
>> +    .minor            = DRIVER_MINOR,
>> +    .driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>> +    .fops            = &st7920_fops,
>> +};
>> +
>> +static int st7920_init_modeset(struct st7920_device *st7920)
>> +{
>> +    struct drm_display_mode *mode = &st7920->mode;
>> +    struct drm_device *drm = &st7920->drm;
>> +    unsigned long max_width, max_height;
>> +    struct drm_plane *primary_plane;
>> +    struct drm_crtc *crtc;
>> +    struct drm_encoder *encoder;
>> +    struct drm_connector *connector;
>> +    int ret;
>> +
>> +    /*
>> +     * Modesetting
>> +     */
>> +
>> +    ret = drmm_mode_config_init(drm);
>> +    if (ret) {
>> +        drm_err(drm, "DRM mode config init failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    mode->type = DRM_MODE_TYPE_DRIVER;
>> +    mode->clock = 30;
>> +    mode->hdisplay = st7920->width;
>> +    mode->htotal = st7920->width;
>> +    mode->hsync_start = st7920->width;
>> +    mode->hsync_end = st7920->width;
>> +    mode->vdisplay = st7920->height;
>> +    mode->vtotal = st7920->height;
>> +    mode->vsync_start = st7920->height;
>> +    mode->vsync_end = st7920->height;
>> +    mode->width_mm = 27;
>> +    mode->height_mm = 27;
>> +
>> +    max_width = max_t(unsigned long, mode->hdisplay, 
>> DRM_SHADOW_PLANE_MAX_WIDTH);
>> +    max_height = max_t(unsigned long, mode->vdisplay, 
>> DRM_SHADOW_PLANE_MAX_HEIGHT);
>> +
>> +    drm->mode_config.min_width = mode->hdisplay;
>> +    drm->mode_config.max_width = max_width;
>> +    drm->mode_config.min_height = mode->vdisplay;
>> +    drm->mode_config.max_height = max_height;
>> +    drm->mode_config.preferred_depth = 24;
>> +    drm->mode_config.funcs = &st7920_mode_config_funcs;
>> +
>> +    /* Primary plane */
>> +
>> +    primary_plane = &st7920->primary_plane;
>> +    ret = drm_universal_plane_init(drm, primary_plane, 0, 
>> &st7920_primary_plane_funcs,
>> +                    st7920_formats, ARRAY_SIZE(st7920_formats),
>> +                    NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>> +    if (ret) {
>> +        drm_err(drm, "DRM primary plane init failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drm_plane_helper_add(primary_plane, 
>> &st7920_primary_plane_helper_funcs);
>> +
>> +    drm_plane_enable_fb_damage_clips(primary_plane);
>> +
>> +    /* CRTC */
>> +
>> +    crtc = &st7920->crtc;
>> +    ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
>> +                    &st7920_crtc_funcs, NULL);
>> +    if (ret) {
>> +        drm_err(drm, "DRM crtc init failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drm_crtc_helper_add(crtc, &st7920_crtc_helper_funcs);
>> +
>> +    /* Encoder */
>> +
>> +    encoder = &st7920->encoder;
>> +    ret = drm_encoder_init(drm, encoder, &st7920_encoder_funcs,
>> +                   DRM_MODE_ENCODER_NONE, NULL);
>> +    if (ret) {
>> +        drm_err(drm, "DRM encoder init failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    encoder->possible_crtcs = drm_crtc_mask(crtc);
>> +
>> +    /* Connector */
>> +
>> +    connector = &st7920->connector;
>> +    ret = drm_connector_init(drm, connector, &st7920_connector_funcs,
>> +                 DRM_MODE_CONNECTOR_Unknown);
>> +    if (ret) {
>> +        drm_err(drm, "DRM connector init failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drm_connector_helper_add(connector, 
>> &st7920_connector_helper_funcs);
>> +
>> +    ret = drm_connector_attach_encoder(connector, encoder);
>> +    if (ret) {
>> +        drm_err(drm, "DRM attach connector to encoder failed: %d\n", 
>> ret);
>> +        return ret;
>> +    }
>> +
>> +    drm_mode_config_reset(drm);
>> +
>> +    return 0;
>> +}
>> +
>> +static int st7920_probe(struct spi_device *spi)
>> +{
>> +    struct st7920_device *st7920;
>> +    struct regmap *regmap;
>> +    struct device *dev = &spi->dev;
>> +    struct drm_device *drm;
>> +    int ret;
>> +
>> +    regmap = devm_regmap_init_spi(spi, &st7920_spi_regmap_config);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    st7920 = devm_drm_dev_alloc(dev, &st7920_drm_driver,
>> +                    struct st7920_device, drm);
>> +    if (IS_ERR(st7920))
>> +        return PTR_ERR(st7920);
>> +
>> +    drm = &st7920->drm;
>> +
>> +    st7920->drm.dev = dev;
>> +    st7920->regmap = regmap;
>> +    st7920->spi = spi;
>> +    st7920->width = ST7920_DEFAULT_WIDTH;
>> +    st7920->height = ST7920_DEFAULT_HEIGHT;
>> +
>> +    st7920->reset_gpio = devm_gpiod_get_optional(dev, "reset", 
>> GPIOD_OUT_LOW);
>> +    if (IS_ERR(st7920->reset_gpio)) {
>> +        ret = PTR_ERR(st7920->reset_gpio);
>> +        return dev_err_probe(dev, ret, "Unable to retrieve reset 
>> GPIO\n");
>> +    }
>> +
>> +    spi_set_drvdata(spi, st7920);
>> +
>> +    ret = st7920_init_modeset(st7920);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = drm_dev_register(drm, 0);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "DRM device register failed\n");
>> +
>> +    drm_client_setup(drm, NULL);
>> +
>> +    return 0;
>> +}
>> +
>> +static void st7920_remove(struct spi_device *spi)
>> +{
>> +    struct st7920_device *st7920 = spi_get_drvdata(spi);
>> +
>> +    drm_dev_unplug(&st7920->drm);
>> +    drm_atomic_helper_shutdown(&st7920->drm);
>> +}
>> +
>> +static void st7920_shutdown(struct spi_device *spi)
>> +{
>> +    struct st7920_device *st7920 = spi_get_drvdata(spi);
>> +
>> +    drm_atomic_helper_shutdown(&st7920->drm);
>> +}
>> +
>> +static struct spi_driver st7920_spi_driver = {
>> +    .driver = {
>> +        .name = DRIVER_NAME,
>> +        .of_match_table = st7920_of_match,
>> +    },
>> +    .id_table = st7920_spi_id,
>> +    .probe = st7920_probe,
>> +    .remove = st7920_remove,
>> +    .shutdown = st7920_shutdown,
>> +};
>> +module_spi_driver(st7920_spi_driver);
>> +
>> +MODULE_DESCRIPTION(DRIVER_DESC);
>> +MODULE_AUTHOR("Iker Pedrosa <ipedrosam@gmail.com>");
>> +MODULE_LICENSE("GPL v2");
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


