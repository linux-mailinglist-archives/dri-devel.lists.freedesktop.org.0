Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A4BE9A4B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE58910EC57;
	Fri, 17 Oct 2025 15:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xcSfxPPC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8X/LtTH4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xcSfxPPC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8X/LtTH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441F710EC57
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:18:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B817A1FF15;
 Fri, 17 Oct 2025 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760714287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T3GLww76RJcsd2GjX3gg3/FMhdYzc0pTJwH6K/kNPXY=;
 b=xcSfxPPCNp1TboryKAwOsxL7amZ4DE3ooNWWGwGmSRi6QXff7lfOzu2/fMvajzPRBssgCM
 DO2w9O39uhMWldaDsH1L/Cfg9zCA4uo+u4RCSKXv5Cw+1ETeVuJqirIWQpMS1chMmmWHet
 QokKLgjKJgc5CF6DYdq8LmVWwI+RXtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760714287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T3GLww76RJcsd2GjX3gg3/FMhdYzc0pTJwH6K/kNPXY=;
 b=8X/LtTH4djdAVrPyuc9fminwuQWQRNqlvrxfEsEdnv4TFrkHxocfqGsAHZD373TQ2xpQBy
 Kl7aJnBffxynU4Bg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xcSfxPPC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8X/LtTH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760714287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T3GLww76RJcsd2GjX3gg3/FMhdYzc0pTJwH6K/kNPXY=;
 b=xcSfxPPCNp1TboryKAwOsxL7amZ4DE3ooNWWGwGmSRi6QXff7lfOzu2/fMvajzPRBssgCM
 DO2w9O39uhMWldaDsH1L/Cfg9zCA4uo+u4RCSKXv5Cw+1ETeVuJqirIWQpMS1chMmmWHet
 QokKLgjKJgc5CF6DYdq8LmVWwI+RXtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760714287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=T3GLww76RJcsd2GjX3gg3/FMhdYzc0pTJwH6K/kNPXY=;
 b=8X/LtTH4djdAVrPyuc9fminwuQWQRNqlvrxfEsEdnv4TFrkHxocfqGsAHZD373TQ2xpQBy
 Kl7aJnBffxynU4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0253313A71;
 Fri, 17 Oct 2025 15:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w3EIOi5e8mgsCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Oct 2025 15:18:06 +0000
Message-ID: <53982a5b-c3ac-4977-83cb-5b4e6d240f75@suse.de>
Date: Fri, 17 Oct 2025 17:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: Add more RGB swizzling options
To: Frank Li <Frank.li@nxp.com>, Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017144626.66918-1-marek.vasut@mailbox.org>
 <aPJcXLcvX15A0HtA@lizhi-Precision-Tower-5810>
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
In-Reply-To: <aPJcXLcvX15A0HtA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B817A1FF15
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[infradead.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email,pengutronix.de:email,suse.de:dkim,suse.de:mid,suse.de:email,nxp.com:email,mailbox.org:email,lists.freedesktop.org:email,ideasonboard.com:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[18];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,gmail.com,ideasonboard.com,nxp.com,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[dt]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
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

Am 17.10.25 um 17:10 schrieb Frank Li:
> On Fri, Oct 17, 2025 at 04:45:38PM +0200, Marek Vasut wrote:
>> Add additional buffer format swizzling options beyond XR24, the
>> hardware is capable of sampling other formats, fill them in.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Liu Ying <victor.liu@nxp.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-clk@vger.kernel.org
>> ---
>> Liu, please test on MX8qxp , I do not have that hardware.
>> ---
>>   drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
>> index 1d8f74babef8a..397af0e9b0236 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
>> @@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>>   		DRM_FORMAT_XRGB8888,
>>   		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>>   		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_ARGB8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
>> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
>> +	}, {
>> +		DRM_FORMAT_ABGR8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
>> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
>> +	}, {
>> +		DRM_FORMAT_XBGR8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGBA8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
>> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGBX8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_BGRA8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
>> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_BGRX8888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGB888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_BGR888,
>> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
>> +	}, {
>> +		DRM_FORMAT_RGB565,
>> +		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
>> +		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>>   	},
>>   };
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
>> index e40d5d66c5c1f..68d32b76fab95 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
>> @@ -33,6 +33,14 @@ do {									\
>>
>>   static const uint32_t dc_plane_formats[] = {
>>   	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_ARGB8888,
>> +	DRM_FORMAT_ABGR8888,
>> +	DRM_FORMAT_XBGR8888,
>> +	DRM_FORMAT_RGBA8888,
>> +	DRM_FORMAT_RGBX8888,
>> +	DRM_FORMAT_BGRA8888,
>> +	DRM_FORMAT_BGRX8888,
>> +	DRM_FORMAT_RGB565,
> Is it posssible sort by name?

The plane-format arrays are (roughly) sorted by hardware preference.

Best regards
Thomas

>
> Frank
>>   };
>>
>>   static const struct drm_plane_funcs dc_plane_funcs = {
>> --
>> 2.51.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


