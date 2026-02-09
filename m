Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHIuBdWaiWkv/gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:29:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8210CF53
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6125E10E1EC;
	Mon,  9 Feb 2026 08:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pEitiYFB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CaSbs8sh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pEitiYFB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CaSbs8sh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440E10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:29:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3EF935BCF0;
 Mon,  9 Feb 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770625743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrTTzmBMq+OMAmwQb2kOqTnAf1hggW0W3DsIcvKQV4s=;
 b=pEitiYFBViHT1bHLjE37dFoNBCwhelYWKv1kyjVscwubQlpCXr7IudrisguH3+Ezgwy7l1
 3O+sfKWK85ax14dSC3bYEBwBNH0eGxf4RfR2brh2XdHoCahusfWufpTL5K9mkGTgZgC/t2
 WnS9fZ20ljG9ypUDX+aZtfT3kW03mn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770625743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrTTzmBMq+OMAmwQb2kOqTnAf1hggW0W3DsIcvKQV4s=;
 b=CaSbs8shkUqV/0lQqCEIVgY+V3GvRb74cWvP9VORMj90YgRydrpwP8RAsEDG1w8QPXifDf
 tymq3kYeB1NNOXAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770625743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrTTzmBMq+OMAmwQb2kOqTnAf1hggW0W3DsIcvKQV4s=;
 b=pEitiYFBViHT1bHLjE37dFoNBCwhelYWKv1kyjVscwubQlpCXr7IudrisguH3+Ezgwy7l1
 3O+sfKWK85ax14dSC3bYEBwBNH0eGxf4RfR2brh2XdHoCahusfWufpTL5K9mkGTgZgC/t2
 WnS9fZ20ljG9ypUDX+aZtfT3kW03mn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770625743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrTTzmBMq+OMAmwQb2kOqTnAf1hggW0W3DsIcvKQV4s=;
 b=CaSbs8shkUqV/0lQqCEIVgY+V3GvRb74cWvP9VORMj90YgRydrpwP8RAsEDG1w8QPXifDf
 tymq3kYeB1NNOXAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09D6B3EA63;
 Mon,  9 Feb 2026 08:29:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EYD4AM+aiWlxMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Feb 2026 08:29:03 +0000
Message-ID: <f315b3fe-3b16-466d-a125-d8bd0666bd8d@suse.de>
Date: Mon, 9 Feb 2026 09:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] drm/atomic: Make drm_atomic_private_obj_init
 fallible
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
 <20260128-drm-private-obj-reset-v4-1-90891fa3d3b0@redhat.com>
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
In-Reply-To: <20260128-drm-private-obj-reset-v4-1-90891fa3d3b0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	URIBL_MULTI_FAIL(0.00)[suse.de:server fail,intel.com:server fail,suse.com:server fail,gabe.freedesktop.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,suse.com:url,intel.com:email]
X-Rspamd-Queue-Id: 61E8210CF53
X-Rspamd-Action: no action



Am 28.01.26 um 13:43 schrieb Maxime Ripard:
> Since we're going to move the drm_private_obj state allocation to a
> callback, we need to be able to deal with its possible failure.
>
> Make drm_private_obj_init return an error code on failure.
>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_atomic.c | 14 +++++++++-----
>   include/drm/drm_atomic.h     |  8 ++++----
>   2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 52738b80ddbeb124896f6124df5628e2ac27faa4..4191a8333fc4ebdfc10f664c837a3f1693eff022 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -925,16 +925,18 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>    * @funcs: pointer to the struct of function pointers that identify the object
>    * type
>    *
>    * Initialize the private object, which can be embedded into any
>    * driver private object that needs its own atomic state.
> + *
> + * RETURNS:
> + * Zero on success, error code on failure
>    */
> -void
> -drm_atomic_private_obj_init(struct drm_device *dev,
> -			    struct drm_private_obj *obj,
> -			    struct drm_private_state *state,
> -			    const struct drm_private_state_funcs *funcs)
> +int drm_atomic_private_obj_init(struct drm_device *dev,
> +				struct drm_private_obj *obj,
> +				struct drm_private_state *state,
> +				const struct drm_private_state_funcs *funcs)
>   {
>   	memset(obj, 0, sizeof(*obj));
>   
>   	drm_modeset_lock_init(&obj->lock);
>   
> @@ -942,10 +944,12 @@ drm_atomic_private_obj_init(struct drm_device *dev,
>   	obj->state = state;
>   	obj->funcs = funcs;
>   	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
>   
>   	state->obj = obj;
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(drm_atomic_private_obj_init);
>   
>   /**
>    * drm_atomic_private_obj_fini - finalize private object
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 178f8f62c80fc58fe42e8564a716da1a99ddb7da..712f5fb977bff8a15592a3949444d9ac306e6c54 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -721,14 +721,14 @@ drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
>   
>   struct drm_connector_state * __must_check
>   drm_atomic_get_connector_state(struct drm_atomic_state *state,
>   			       struct drm_connector *connector);
>   
> -void drm_atomic_private_obj_init(struct drm_device *dev,
> -				 struct drm_private_obj *obj,
> -				 struct drm_private_state *state,
> -				 const struct drm_private_state_funcs *funcs);
> +int drm_atomic_private_obj_init(struct drm_device *dev,
> +				struct drm_private_obj *obj,
> +				struct drm_private_state *state,
> +				const struct drm_private_state_funcs *funcs);
>   void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
>   
>   struct drm_private_state * __must_check
>   drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
>   				 struct drm_private_obj *obj);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


