Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE7CF7069
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 08:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41310E045;
	Tue,  6 Jan 2026 07:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AUoj+rcX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jd5J0qJc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ictWIf1/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HQuEzCag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CBE10E226
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 07:24:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B47C55BCC3;
 Tue,  6 Jan 2026 07:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbjyOwUBc5QAUS7xU8cGbibcjh+OxK7XIodNv3EeTS4=;
 b=AUoj+rcXZAu65YSJDKbAV+Gr4pfP9Wwdl1I9JsdlNFSv1kOTNbK91lNGdA/2dKqbHf8rh6
 N7b6qSuBOkWQuUr+RGk1WIGxfiKEe3qTCfZ5z9Nu+IxeHk7DYnYIFLHRCcRYMm4xTPgY9X
 B3DNaRtsLieXnf3XP+Uz3TC4f9hhFho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbjyOwUBc5QAUS7xU8cGbibcjh+OxK7XIodNv3EeTS4=;
 b=Jd5J0qJcuzcIJHXdH3r1QINpiALFTNIDU0WEMXJaRoTKqqiYMh5FDqBqwuB8e4sxUSIHPS
 eFInRhhgpZ0beNAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ictWIf1/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HQuEzCag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767684258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbjyOwUBc5QAUS7xU8cGbibcjh+OxK7XIodNv3EeTS4=;
 b=ictWIf1/5N+mZZT+FjVjcp+CN9TmJEV8wiHYdifwMTXKVraOIDzWYYkJFuY0gMVxDIgix/
 axjb1txTvjofv95KVlWQsizTLECoU7buuO2Gg/9BIdjbJaqSoXCkwASnLOb0FvpJNCmxq0
 pDTtpxmeoBp4wRNlWzxH/KlX7mv0mwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767684258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbjyOwUBc5QAUS7xU8cGbibcjh+OxK7XIodNv3EeTS4=;
 b=HQuEzCaggU+ADgTNwlOap38VdDT8Hn63a8LRBQCRExE36xDdMXxSZKcl1R51qscvyyQO9f
 ck/r6HEDyY1QYpAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6020F3EA63;
 Tue,  6 Jan 2026 07:24:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XT5pFaK4XGkBewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jan 2026 07:24:18 +0000
Message-ID: <bc484bfe-5fd5-42c7-9068-ca4e7984b774@suse.de>
Date: Tue, 6 Jan 2026 08:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/mode_object: add
 drm_object_immutable_property_get_value()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20260106-drm-fix-lut-checks-v3-0-f7f979eb73c8@oss.qualcomm.com>
 <20260106-drm-fix-lut-checks-v3-1-f7f979eb73c8@oss.qualcomm.com>
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
In-Reply-To: <20260106-drm-fix-lut-checks-v3-1-f7f979eb73c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,igalia.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,suse.com:url,suse.de:email,suse.de:dkim,suse.de:mid];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: B47C55BCC3
X-Spam-Flag: NO
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



Am 06.01.26 um 04:09 schrieb Dmitry Baryshkov:
> We have a helper to get property values for non-atomic drivers and
> another one default property values for atomic drivers. In some cases we
> need the ability to get value of immutable property, no matter what kind
> of driver it is. Implement new property-related helper,
> drm_object_immutable_property_get_value(), which lets the caller to get
> the value of the immutable property.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_mode_object.c | 25 +++++++++++++++++++++++++
>   include/drm/drm_mode_object.h     |  3 +++
>   2 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index b45d501b10c8..2d943a610b88 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -385,6 +385,31 @@ int drm_object_property_get_default_value(struct drm_mode_object *obj,
>   }
>   EXPORT_SYMBOL(drm_object_property_get_default_value);
>   
> +/**
> + * drm_object_immutable_property_get_value - retrieve the value of a property
> + * @obj: drm mode object to get property value from
> + * @property: property to retrieve
> + * @val: storage for the property value
> + *
> + * This function retrieves the software state of the given immutable property
> + * for the given mode object.
> + *
> + * This function can be called by both atomic and non-atomic drivers.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_object_immutable_property_get_value(struct drm_mode_object *obj,
> +					    struct drm_property *property,
> +					    uint64_t *val)
> +{
> +	if (drm_WARN_ON(property->dev, !(property->flags & DRM_MODE_PROP_IMMUTABLE)))
> +		return -EINVAL;
> +
> +	return __drm_object_property_get_prop_value(obj, property, val);
> +}
> +EXPORT_SYMBOL(drm_object_immutable_property_get_value);
> +
>   /* helper for getconnector and getproperties ioctls */
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
> index c68edbd126d0..44a0d6f8d01f 100644
> --- a/include/drm/drm_mode_object.h
> +++ b/include/drm/drm_mode_object.h
> @@ -133,6 +133,9 @@ int drm_object_property_get_value(struct drm_mode_object *obj,
>   int drm_object_property_get_default_value(struct drm_mode_object *obj,
>   					  struct drm_property *property,
>   					  uint64_t *val);
> +int drm_object_immutable_property_get_value(struct drm_mode_object *obj,
> +					    struct drm_property *property,
> +					    uint64_t *val);
>   
>   void drm_object_attach_property(struct drm_mode_object *obj,
>   				struct drm_property *property,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


