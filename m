Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4730C53419
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB3B10E76D;
	Wed, 12 Nov 2025 16:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u12Y14uL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rG1HjUoD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u12Y14uL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rG1HjUoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C08E10E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:03:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 162D21F45B;
 Wed, 12 Nov 2025 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8SiAjHfFhbCyo6IGweimAJjJ8bkYKQ3jSQnFyvS/HEI=;
 b=u12Y14uLfzyvlP/A9ckihhlInAzyCBULSdo+3Uwz88wfeoToQVVxdOyYzCXcgEnIr74IUH
 8DB/iSQQIQ08UBIUaWjJ/vdwNvlNPn5fYBjlLFAXD5fxqRb3vAgYXDAa0NArhqbNp7mW0e
 +9nRTlrq5Bai05ybv9+BUfnzWWCmTe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8SiAjHfFhbCyo6IGweimAJjJ8bkYKQ3jSQnFyvS/HEI=;
 b=rG1HjUoDj/SlDelKyE+PViqA97GGh2uocj1W33/6hPbIigBuJhd+uHiODd5Bn7LdMwx05e
 sfEAoQ2Qe4lyfXBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u12Y14uL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rG1HjUoD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8SiAjHfFhbCyo6IGweimAJjJ8bkYKQ3jSQnFyvS/HEI=;
 b=u12Y14uLfzyvlP/A9ckihhlInAzyCBULSdo+3Uwz88wfeoToQVVxdOyYzCXcgEnIr74IUH
 8DB/iSQQIQ08UBIUaWjJ/vdwNvlNPn5fYBjlLFAXD5fxqRb3vAgYXDAa0NArhqbNp7mW0e
 +9nRTlrq5Bai05ybv9+BUfnzWWCmTe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8SiAjHfFhbCyo6IGweimAJjJ8bkYKQ3jSQnFyvS/HEI=;
 b=rG1HjUoDj/SlDelKyE+PViqA97GGh2uocj1W33/6hPbIigBuJhd+uHiODd5Bn7LdMwx05e
 sfEAoQ2Qe4lyfXBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D99293EA61;
 Wed, 12 Nov 2025 16:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5B6pM8yvFGnIEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:03:24 +0000
Message-ID: <bf0cc834-6168-412f-bf39-6482b8c0f7dc@suse.de>
Date: Wed, 12 Nov 2025 17:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] drm/vblank: pass vblank to
 drm_vblank_count_and_time()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <39a203dcc71aa4bfcf349d9c85672a6b9db4201f.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 162D21F45B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.com:url];
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



Am 10.11.25 um 17:17 schrieb Jani Nikula:
> Use the vblank pointer instead of a dev, pipe pair to simplify code.
>
> Drop the pipe check warning, as we can be sure vblank->pipe is within
> limits.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

OK, this is what I was looking for in the previous patch. Would it make 
sense to change order of the patches?

> ---
>   drivers/gpu/drm/drm_vblank.c | 28 +++++++++++-----------------
>   1 file changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index e33b7fa6f19a..0a2e372dd549 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -950,18 +950,12 @@ EXPORT_SYMBOL(drm_crtc_vblank_count);
>    *
>    * This is the legacy version of drm_crtc_vblank_count_and_time().
>    */
> -static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
> +static u64 drm_vblank_count_and_time(struct drm_vblank_crtc *vblank,
>   				     ktime_t *vblanktime)
>   {
> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>   	u64 vblank_count;
>   	unsigned int seq;
>   
> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs)) {
> -		*vblanktime = 0;
> -		return 0;
> -	}
> -
>   	do {
>   		seq = read_seqbegin(&vblank->seqlock);
>   		vblank_count = atomic64_read(&vblank->count);
> @@ -993,7 +987,7 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
>   u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>   				   ktime_t *vblanktime)
>   {
> -	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
> +	return drm_vblank_count_and_time(drm_crtc_vblank_crtc(crtc),
>   					 vblanktime);
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> @@ -1136,18 +1130,18 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>   				struct drm_pending_vblank_event *e)
>   {
>   	struct drm_device *dev = crtc->dev;
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	u64 seq;
> -	unsigned int pipe = drm_crtc_index(crtc);
>   	ktime_t now;
>   
>   	if (drm_dev_has_vblank(dev)) {
> -		seq = drm_vblank_count_and_time(dev, pipe, &now);
> +		seq = drm_vblank_count_and_time(vblank, &now);
>   	} else {
>   		seq = 0;
>   
>   		now = ktime_get();
>   	}
> -	e->pipe = pipe;
> +	e->pipe = vblank->pipe;
>   	send_vblank_event(dev, e, seq, now);
>   }
>   EXPORT_SYMBOL(drm_crtc_send_vblank_event);
> @@ -1368,7 +1362,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>   	spin_unlock(&dev->vbl_lock);
>   
>   	/* Send any queued vblank events, lest the natives grow disquiet */
> -	seq = drm_vblank_count_and_time(dev, pipe, &now);
> +	seq = drm_vblank_count_and_time(vblank, &now);
>   
>   	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
>   		if (e->pipe != pipe)
> @@ -1645,7 +1639,7 @@ static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
>   	if (ret)
>   		goto err_unlock;
>   
> -	seq = drm_vblank_count_and_time(dev, pipe, &now);
> +	seq = drm_vblank_count_and_time(vblank, &now);
>   
>   	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\n",
>   		     req_seq, seq, pipe);
> @@ -1713,7 +1707,7 @@ static void drm_wait_vblank_reply(struct drm_vblank_crtc *vblank,
>   	 * to store the seconds. This is safe as we always use monotonic
>   	 * timestamps since linux-4.15.
>   	 */
> -	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);
> +	reply->sequence = drm_vblank_count_and_time(vblank, &now);
>   	ts = ktime_to_timespec64(now);
>   	reply->tval_sec = (u32)ts.tv_sec;
>   	reply->tval_usec = ts.tv_nsec / 1000;
> @@ -1878,7 +1872,7 @@ static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
>   
>   	assert_spin_locked(&dev->event_lock);
>   
> -	seq = drm_vblank_count_and_time(dev, pipe, &now);
> +	seq = drm_vblank_count_and_time(vblank, &now);
>   
>   	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
>   		if (e->pipe != pipe)
> @@ -2040,7 +2034,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>   	else
>   		get_seq->active = crtc->enabled;
>   	drm_modeset_unlock(&crtc->mutex);
> -	get_seq->sequence = drm_vblank_count_and_time(dev, pipe, &now);
> +	get_seq->sequence = drm_vblank_count_and_time(vblank, &now);
>   	get_seq->sequence_ns = ktime_to_ns(now);
>   	if (!vblank_enabled)
>   		drm_crtc_vblank_put(crtc);
> @@ -2101,7 +2095,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>   		goto err_free;
>   	}
>   
> -	seq = drm_vblank_count_and_time(dev, pipe, &now);
> +	seq = drm_vblank_count_and_time(vblank, &now);
>   	req_seq = queue_seq->sequence;
>   
>   	if (flags & DRM_CRTC_SEQUENCE_RELATIVE)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


