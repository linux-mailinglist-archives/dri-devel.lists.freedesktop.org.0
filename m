Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010AEBAF56B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3431910E688;
	Wed,  1 Oct 2025 07:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Nw08Yi8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AcQ0AOtZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nw08Yi8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AcQ0AOtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4610E688
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:01:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F25E1F80C;
 Wed,  1 Oct 2025 07:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759302074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=phL2KKERW4wQko4nU0Q4lnXBaCfi0UW7ZFQYr6LhonI=;
 b=Nw08Yi8dbeT2evlRHAYG6Kgp3/3ILuoGT7/JfA4u36odfq3K/1I/QCoqKv4YoMVdeHPuvf
 /lajSSlfIxq03rnJps8h9QNP7KdAlSD7nh6ZKVb9+3A4yoYfENWo6OBuxjLkiR0yQZr20/
 SPG9DamarzUGVf7Rg1uMakS1Tdoprks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759302074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=phL2KKERW4wQko4nU0Q4lnXBaCfi0UW7ZFQYr6LhonI=;
 b=AcQ0AOtZVvF3E/SGRTYsJBn3AmF9TCxUZgt5rZ2SbTg5/ydj5OkQ3mVXYl3K3GU3hi7Zrg
 +pBRDjtVDPf6CUBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Nw08Yi8d;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AcQ0AOtZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759302074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=phL2KKERW4wQko4nU0Q4lnXBaCfi0UW7ZFQYr6LhonI=;
 b=Nw08Yi8dbeT2evlRHAYG6Kgp3/3ILuoGT7/JfA4u36odfq3K/1I/QCoqKv4YoMVdeHPuvf
 /lajSSlfIxq03rnJps8h9QNP7KdAlSD7nh6ZKVb9+3A4yoYfENWo6OBuxjLkiR0yQZr20/
 SPG9DamarzUGVf7Rg1uMakS1Tdoprks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759302074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=phL2KKERW4wQko4nU0Q4lnXBaCfi0UW7ZFQYr6LhonI=;
 b=AcQ0AOtZVvF3E/SGRTYsJBn3AmF9TCxUZgt5rZ2SbTg5/ydj5OkQ3mVXYl3K3GU3hi7Zrg
 +pBRDjtVDPf6CUBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A57F913A3F;
 Wed,  1 Oct 2025 07:01:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RmMFJ7nR3GimFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Oct 2025 07:01:13 +0000
Message-ID: <dc90d72c-108e-46b4-8cbe-21221edb4f96@suse.de>
Date: Wed, 1 Oct 2025 09:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <03240fae-544f-4753-96c5-a116b4b5a318@suse.de>
 <20250915-active-placid-bustard-6e1faa@penduick>
 <5920ffe5-b6b1-484b-b320-332b9eb9db82@suse.de>
 <20250923-tentacled-cocky-bustard-597cb6@penduick>
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
In-Reply-To: <20250923-tentacled-cocky-bustard-597cb6@penduick>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[15];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,ffwll.ch,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,iki.fi,ti.com,lists.freedesktop.org,vger.kernel.org];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 0F25E1F80C
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

Am 23.09.25 um 11:37 schrieb Maxime Ripard:
> On Mon, Sep 15, 2025 at 11:11:39AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 15.09.25 um 10:42 schrieb Maxime Ripard:
>>> Hi Tohmas,
>>>
>>> On Tue, Sep 02, 2025 at 03:44:54PM +0200, Thomas Zimmermann wrote:
>>>>> +/**
>>>>> + * drm_atomic_build_readout_state - Creates an initial state from the hardware
>>>>> + * @dev: DRM device to build the state for
>>>>> + *
>>>>> + * This function allocates a &struct drm_atomic_state, calls the
>>>>> + * atomic_readout_state callbacks, and fills the global state old states
>>>>> + * by what the callbacks returned.
>>>>> + *
>>>>> + * Returns:
>>>>> + *
>>>>> + * A partially initialized &struct drm_atomic_state on success, an error
>>>>> + * pointer otherwise.
>>>>> + */
>>>>> +static struct drm_atomic_state *
>>>>> +drm_atomic_build_readout_state(struct drm_device *dev)
>>>>> +{
>>>>> +	struct drm_connector_list_iter conn_iter;
>>>>> +	struct drm_atomic_state *state;
>>>>> +	struct drm_mode_config *config =
>>>>> +		&dev->mode_config;
>>>>> +	struct drm_connector *connector;
>>>>> +	struct drm_printer p =
>>>>> +		drm_info_printer(dev->dev);
>>>>> +	struct drm_encoder *encoder;
>>>>> +	struct drm_plane *plane;
>>>>> +	struct drm_crtc *crtc;
>>>>> +	int ret;
>>>>> +
>>>>> +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
>>>>> +
>>>>> +	state = drm_atomic_state_alloc(dev);
>>>>> +	if (WARN_ON(!state))
>>>>> +		return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
>>>>> +	if (WARN_ON(!state->connectors)) {
>>>>> +		ret = -ENOMEM;
>>>>> +		goto err_state_put;
>>>>> +	}
>>>>> +
>>>>> +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
>>>>> +	if (WARN_ON(!state->private_objs)) {
>>>>> +		ret = -ENOMEM;
>>>>> +		goto err_state_put;
>>>>> +	}
>>>>> +
>>>>> +	drm_for_each_crtc(crtc, dev) {
>>>>> +		const struct drm_crtc_funcs *crtc_funcs =
>>>>> +			crtc->funcs;
>>>>> +		struct drm_crtc_state *crtc_state;
>>>>> +
>>>>> +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
>>>>> +
>>>>> +		if (crtc_funcs->atomic_readout_state) {
>>>>> +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
>>>>> +		} else if (crtc_funcs->reset) {
>>>>> +			crtc_funcs->reset(crtc);
>>>>> +
>>>>> +			/*
>>>>> +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
>>>>> +			 */
>>>>> +			crtc_state = crtc->state;
>>>>> +			crtc->state = NULL;
>>>> Chancing the crtc->state pointer behind the back of the reset callback seems
>>>> fragile. We never how if some other piece of the driver refers to it
>>>> (although illegally).
>>> I agree that it's clunky. I'm not sure who would use it at this point
>>> though: we're in the middle of the drm_mode_config_reset(), so the
>>> drivers' involvement is pretty minimal.
>>>
>>> I did wonder if changing reset to return the object instead of setting
>>> $OBJECT->state would be a better interface?
>> Probably not. The reset helper is supposed to initialize the object's
>> software and hardware state. But in most drivers, we're currently mostly
>> setting the minimal software state here and simply assume that hardware is
>> off. Returning the state would water down semantics even further.
>>
>> Having said that, I could imaging building an atomic_clean_state callback
>> that replaces the reset callback. It would work alongside the new
>> atomic_readout_state callback.  Current reset could be build upon that
>> callback. The atomic_clean_state would intentionally only take care of the
>> software state and leave hardware state undefined. This reflects the current
>> realities of most DRM drivers.   From that clean state, DRM could do an
>> atomic commit that also initializes the hardware.
> That sounds like a good idea, but I wonder how we would deal with reset
> then? Should we remove it entirely? Still call it? What do you think?

I think in that design, a reset would be atomic_clean_state + 
atomic_commit. The clean_state step would likely always happen, were we 
currently do the reset. In the long term, the commit step could be moved 
into drm_dev_register() or even the DRM client setup. The later place 
should make it easy for in-kernel DRM clients to adopt the current 
display config.  If there's no client enabled, a plain atomic_commit 
would set the HW to whatever is in the state.

The state could, of course, also come from atomic_readout_state in which 
case in which the display would just keep running as-is on the 
atomic_commit.

Best regards
Thomas

>
>>>> For now, wouldn't it be better to require a read-out helper for all elements
>>>> of the driver's mode-setting pipeline?  The trivial implementation would
>>>> copy the existing reset function and keep crtc->state to NULL.
>>> I also considered that, but I'm not sure we can expect bridges to have
>>> readout hooks filled for every configuration in the wild.
>>>
>>> But maybe we can look during drm_mode_config_reset() at whether all the
>>> objects have their hook filled, and if not fall back on reset for
>>> everything.
>> That's what I meant, I think.
>>
>>> It would make the implementation easier, but missing bridges
>>> implementations would trigger a mode change when it might actually work
>>> just fine since bridge state is pretty minimal.
>> If there's an element in the pipeline that's missing the readout helper, it
>> might be safer to fallback to that modeset instead of ending up with
>> inconsistent state.
> Yeah, that sounds fair.
>
> Maxime

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


