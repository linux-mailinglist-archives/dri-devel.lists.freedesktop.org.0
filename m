Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F894CF8F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 13:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4E10E8D6;
	Fri,  9 Aug 2024 11:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vYIcwks3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NP0WOyHb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vYIcwks3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NP0WOyHb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A04C10E8D5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 11:52:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B45FB1FF53;
 Fri,  9 Aug 2024 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723204344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6qay9yYk2Ua73nvh4JlATD1cRmsT84eKT5TkV8pMpwk=;
 b=vYIcwks3/Ae0F4OsDuuFyL+O7VmKe8ES5rlQMhSvaOMN9a54s0K1ttoPsIERq6MfOqz4Il
 VAMI3CPdAuLQbrgEuzF3d7/KwOt40LtR35h1cWr8hGnSzDIcyF6mvtfDEI4+kBlLv3x7F4
 hxlhl8ewy18WCQ1aKbf/pb2AzGjnMdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723204344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6qay9yYk2Ua73nvh4JlATD1cRmsT84eKT5TkV8pMpwk=;
 b=NP0WOyHbYJy6DYTfnVHw9T1BOcdPK5ofHlbDWrgPhDQv6EO3kDb9LeCBn6P3smtnnM6Kd2
 dE8albHBjNtyuDCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vYIcwks3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NP0WOyHb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723204344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6qay9yYk2Ua73nvh4JlATD1cRmsT84eKT5TkV8pMpwk=;
 b=vYIcwks3/Ae0F4OsDuuFyL+O7VmKe8ES5rlQMhSvaOMN9a54s0K1ttoPsIERq6MfOqz4Il
 VAMI3CPdAuLQbrgEuzF3d7/KwOt40LtR35h1cWr8hGnSzDIcyF6mvtfDEI4+kBlLv3x7F4
 hxlhl8ewy18WCQ1aKbf/pb2AzGjnMdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723204344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6qay9yYk2Ua73nvh4JlATD1cRmsT84eKT5TkV8pMpwk=;
 b=NP0WOyHbYJy6DYTfnVHw9T1BOcdPK5ofHlbDWrgPhDQv6EO3kDb9LeCBn6P3smtnnM6Kd2
 dE8albHBjNtyuDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8270313A7D;
 Fri,  9 Aug 2024 11:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bvqXHvgCtmbqYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Aug 2024 11:52:24 +0000
Message-ID: <48ba605a-1bea-425f-be8b-5addb5f90e79@suse.de>
Date: Fri, 9 Aug 2024 13:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/ast: astdp: Use struct drm_edid and helpers
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240806125601.78650-1-tzimmermann@suse.de>
 <20240806125601.78650-4-tzimmermann@suse.de>
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
In-Reply-To: <20240806125601.78650-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -6.50
X-Rspamd-Queue-Id: B45FB1FF53
X-Spamd-Result: default: False [-6.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi

Am 06.08.24 um 14:51 schrieb Thomas Zimmermann:
> Convert ASTDP support to struct drm_edid and its helpers. Simplifies
> and modernizes the EDID handling.
>
> The driver reads 4 bytes at once, but the overall read length is now
> variable. Therefore update the EDID read loop to never return more than
> the requested bytes.
>
> The device does not seem to support EDID extensions, as the driver
> actively clears any such information from the main EDID header. As
> the new interface allows for reading extension blocks for EDID, make
> sure that the block is always 0 (i.e., the main header). A later
> update might fix that.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c | 55 +++++++++++++++++++-----------------
>   1 file changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 217c155f0874..1eed1cc55280 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -20,11 +20,14 @@ static bool ast_astdp_is_connected(struct ast_device *ast)
>   	return true;
>   }
>   
> -static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
> +static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>   {
> -	struct ast_device *ast = to_ast_device(dev);
> +	struct ast_device *ast = data;
>   	int ret = 0;
> -	u8 i;
> +	unsigned int i;
> +
> +	if (block > 0)
> +		return -EIO; /* extension headers not supported */
>   
>   	/*
>   	 * Protect access to I/O registers from concurrent modesetting
> @@ -35,13 +38,23 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   	/* Start reading EDID data */
>   	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
>   
> -	for (i = 0; i < 32; i++) {
> +	for (i = 0; i < len; i += 4) {

After reading your review for DP501, I realized that I need to round len 
up to a multiple of 4.

Best regards
Thomas

> +		unsigned int offset;
>   		unsigned int j;
> +		u8 ediddata[4];
> +		u8 vgacre4;
> +
> +		offset = (i + block * EDID_LENGTH) / 4;
> +		if (offset >= 64) {
> +			ret = -EIO;
> +			goto out;
> +		}
> +		vgacre4 = offset;
>   
>   		/*
>   		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
>   		 */
> -		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, i);
> +		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, vgacre4);
>   
>   		/*
>   		 * CRD7[b0]: valid flag for EDID
> @@ -65,7 +78,7 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
>   			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
>   				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
> -				if (vgacrd6 == i)
> +				if (vgacrd6 == offset)
>   					break;
>   			}
>   		}
> @@ -93,7 +106,9 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>   			ediddata[2] = 0;
>   		}
>   
> -		ediddata += 4;
> +		memcpy(buf, ediddata, min((len - i), sizeof(ediddata)));
> +
> +		buf += 4;
>   	}
>   
>   out:
> @@ -330,29 +345,17 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
>   
>   static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   {
> -	void *edid;
> -	int succ;
> +	struct drm_device *dev = connector->dev;
> +	struct ast_device *ast = to_ast_device(dev);
> +	const struct drm_edid *drm_edid;
>   	int count;
>   
> -	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> -	if (!edid)
> -		goto err_drm_connector_update_edid_property;
> -
> -	succ = ast_astdp_read_edid(connector->dev, edid);
> -	if (succ < 0)
> -		goto err_kfree;
> -
> -	drm_connector_update_edid_property(connector, edid);
> -	count = drm_add_edid_modes(connector, edid);
> -	kfree(edid);
> +	drm_edid = drm_edid_read_custom(connector, ast_astdp_read_edid_block, ast);
> +	drm_edid_connector_update(connector, drm_edid);
> +	count = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
>   
>   	return count;
> -
> -err_kfree:
> -	kfree(edid);
> -err_drm_connector_update_edid_property:
> -	drm_connector_update_edid_property(connector, NULL);
> -	return 0;
>   }
>   
>   static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

