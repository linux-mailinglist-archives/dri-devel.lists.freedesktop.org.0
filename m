Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C6A1B288
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FC210E2C1;
	Fri, 24 Jan 2025 09:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gp84dhXf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0BkHg836";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gp84dhXf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0BkHg836";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46710E2C1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:22:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4718121176;
 Fri, 24 Jan 2025 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737710571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RRNEtgDHPtXgnuhsCM74cMIZDrutbIJ+WVqQXHwkEgs=;
 b=gp84dhXfqvxq9xzP1W+3eP0bbe61TgmbG9g+U1m1tdRzsWV4VWAT1Xwwoxv8F+t5LOFNjr
 TFuvJZ+Vgi3S8adqBEi6Zlo9OnESV6FH8VAjGuSrhW66GF+HIFdRzRrta2+g7/mITJOfxN
 OsUfVGdS6NcTb3W2vF71GBlXw2LqOJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737710571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RRNEtgDHPtXgnuhsCM74cMIZDrutbIJ+WVqQXHwkEgs=;
 b=0BkHg836jTGFyy9BNL2KhE8kis7bgZ08dGJL1f5HR4YUGoHstGdQxMVAdy7u0tVXghRJEl
 20/mEMfaGdFZYrAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gp84dhXf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0BkHg836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737710571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RRNEtgDHPtXgnuhsCM74cMIZDrutbIJ+WVqQXHwkEgs=;
 b=gp84dhXfqvxq9xzP1W+3eP0bbe61TgmbG9g+U1m1tdRzsWV4VWAT1Xwwoxv8F+t5LOFNjr
 TFuvJZ+Vgi3S8adqBEi6Zlo9OnESV6FH8VAjGuSrhW66GF+HIFdRzRrta2+g7/mITJOfxN
 OsUfVGdS6NcTb3W2vF71GBlXw2LqOJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737710571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RRNEtgDHPtXgnuhsCM74cMIZDrutbIJ+WVqQXHwkEgs=;
 b=0BkHg836jTGFyy9BNL2KhE8kis7bgZ08dGJL1f5HR4YUGoHstGdQxMVAdy7u0tVXghRJEl
 20/mEMfaGdFZYrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11B9013999;
 Fri, 24 Jan 2025 09:22:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /WWAAutbk2cjWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 09:22:51 +0000
Message-ID: <1230848e-d83a-49f2-9d1a-de97b5edc1a4@suse.de>
Date: Fri, 24 Jan 2025 10:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix default resolution on BMC when DP is not
 connected
To: Jocelyn Falempe <jfalempe@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250124084546.2094575-1-jfalempe@redhat.com>
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
In-Reply-To: <20250124084546.2094575-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4718121176
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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

Hi Jocelyn


Am 24.01.25 um 09:45 schrieb Jocelyn Falempe:
> The physical_status of ast_dp is not reliable, as it reports as
> connected even when no monitor is connected.

This status comes from VGACRDF, which is undocumented unfortunately. So 
IDK the exact semantics. Do you know if the other case can also happen 
where a connected monitor is not reported?

> This makes the default
> BMC resolution to be 640x480 for remote access.
> So consider that if there is no edid, no monitor is connected, and
> add the BMC 1024x768 default resolution.
> I've debugged this regression on ast_dp, but as dp501 is similar, I
> fixed both in this patch.
>
> This regression was likely introduced by commit 2281475168d2
> ("drm/ast: astdp: Perform link training during atomic_enable")
> But I fixed it in the BMC get_modes handling.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Fixes: bbad0090b9f4 ("drm/ast: astdp: Transparently handle BMC support")
> ---
>   drivers/gpu/drm/ast/ast_dp.c    | 14 +++++++-------
>   drivers/gpu/drm/ast/ast_dp501.c | 14 +++++++-------
>   2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 0e282b7b167c..6c8ea95a2230 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -361,19 +361,19 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>   static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)

I don't think this is the right place to fix the problem. The field 
physical_status should always contain the correct physical status. So 
the fix should go into ast_dp_connector_helper_detect_ctx(). There's [1] 
something like

   if (ast_dp_status_is_connected(ast))
     status = connected

and that's where it should read the EDID without updating the 
connector's EDID property. Example code:

   if (ast_dp_status_is_connected(ast)) {
     edid = drm_edid_read_custom(/* like in get_modes */)
     if (drm_edid_valid(edid))
       status = connected
     drm_edid_free(edid)
   }

The EDID test could also go into _is_connected() directly. A comment 
about false positives from VGACRDF might make sense as well.

[1] 
https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/ast/ast_dp.c#L397

>   {
>   	struct ast_connector *ast_connector = to_ast_connector(connector);
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +	const struct drm_edid *drm_edid = NULL;
>   	int count;
>   
> -	if (ast_connector->physical_status == connector_status_connected) {
> -		struct ast_device *ast = to_ast_device(connector->dev);
> -		const struct drm_edid *drm_edid;
> -
> +	if (ast_connector->physical_status == connector_status_connected)
>   		drm_edid = drm_edid_read_custom(connector, ast_astdp_read_edid_block, ast);
> -		drm_edid_connector_update(connector, drm_edid);
> +
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	if (drm_edid) {
>   		count = drm_edid_connector_add_modes(connector);
>   		drm_edid_free(drm_edid);
>   	} else {
> -		drm_edid_connector_update(connector, NULL);
> -
>   		/*
>   		 * There's no EDID data without a connected monitor. Set BMC-
>   		 * compatible modes in this case. The XGA default resolution
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 9e19d8c17730..c92db65e3f20 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c

I'd rather leave this out. The detection works differently for DP501.

Best regards
Thomas

> @@ -504,19 +504,19 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
>   static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>   {
>   	struct ast_connector *ast_connector = to_ast_connector(connector);
> +	struct ast_device *ast = to_ast_device(connector->dev);
> +	const struct drm_edid *drm_edid = NULL;
>   	int count;
>   
> -	if (ast_connector->physical_status == connector_status_connected) {
> -		struct ast_device *ast = to_ast_device(connector->dev);
> -		const struct drm_edid *drm_edid;
> -
> +	if (ast_connector->physical_status == connector_status_connected)
>   		drm_edid = drm_edid_read_custom(connector, ast_dp512_read_edid_block, ast);
> -		drm_edid_connector_update(connector, drm_edid);
> +
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	if (drm_edid) {
>   		count = drm_edid_connector_add_modes(connector);
>   		drm_edid_free(drm_edid);
>   	} else {
> -		drm_edid_connector_update(connector, NULL);
> -
>   		/*
>   		 * There's no EDID data without a connected monitor. Set BMC-
>   		 * compatible modes in this case. The XGA default resolution
>
> base-commit: 798047e63ac970f105c49c22e6d44df901c486b2

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

