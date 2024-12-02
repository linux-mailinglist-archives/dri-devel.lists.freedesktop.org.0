Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451C19E08E8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 17:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1B510E7C5;
	Mon,  2 Dec 2024 16:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qKiygYuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4nCA73gj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qKiygYuQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4nCA73gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7CF10E7C5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 16:44:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42FDD1F453;
 Mon,  2 Dec 2024 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733157876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9f2eFI5w35bIzBVfBhN6twwnG8ZmE/gcYzpmsgZNSV8=;
 b=qKiygYuQcCvWWoWIiX/t/7BQv6RhFhREQhiw81vg8ZIWq5miGvrY95+p9MBxElckPsyvnY
 oOUVINA9IW7Te8eQgDGPLBKsbdDJQOfZevNeiLXUxmabs74jb/eRdwK9Ze0CkDQJn7FWGf
 hJtTRSNtZvhirXA6BYU3heDO04AaUJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733157876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9f2eFI5w35bIzBVfBhN6twwnG8ZmE/gcYzpmsgZNSV8=;
 b=4nCA73gjsgX0On+wzeOu0Pg+ZQQCCwVIhPTpFanGOrmaKLgh4FEgxnHfBot9DR5Hxh705s
 KTi70MgNwJ+Dw8Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733157876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9f2eFI5w35bIzBVfBhN6twwnG8ZmE/gcYzpmsgZNSV8=;
 b=qKiygYuQcCvWWoWIiX/t/7BQv6RhFhREQhiw81vg8ZIWq5miGvrY95+p9MBxElckPsyvnY
 oOUVINA9IW7Te8eQgDGPLBKsbdDJQOfZevNeiLXUxmabs74jb/eRdwK9Ze0CkDQJn7FWGf
 hJtTRSNtZvhirXA6BYU3heDO04AaUJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733157876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9f2eFI5w35bIzBVfBhN6twwnG8ZmE/gcYzpmsgZNSV8=;
 b=4nCA73gjsgX0On+wzeOu0Pg+ZQQCCwVIhPTpFanGOrmaKLgh4FEgxnHfBot9DR5Hxh705s
 KTi70MgNwJ+Dw8Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C3AE13A31;
 Mon,  2 Dec 2024 16:44:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZH8LHfPjTWcYSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Dec 2024 16:44:35 +0000
Message-ID: <0a3b606b-e22e-46bf-912c-afeab906ca5c@suse.de>
Date: Mon, 2 Dec 2024 17:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Liu Ying <victor.liu@nxp.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Douglas Anderson <dianders@chromium.org>,
 Russell King <linux@armlinux.org.uk>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Jani Nikula <jani.nikula@intel.com>, Pin-yen Lin <treapking@chromium.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
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
In-Reply-To: <20241202114731.1005549-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[27]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; TAGGED_RCPT(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLg7pzcc16fhtr4ypxcuuyjwf8)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,nxp.com,ge.com,collabora.co.uk,amarulasolutions.com,chromium.org,armlinux.org.uk,linux.dev,collabora.com,lists.freedesktop.org];
 FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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




Am 02.12.24 um 12:47 schrieb Uwe Kleine-König:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>
> While add it, also remove commas after the sentinel entries.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> Hello,
>
> changes since (implicit) v1
> (https://lore.kernel.org/dri-devel/20240516123837.81664-2-u.kleine-koenig@pengutronix.de):
>
>   - Update author email address
>   - Rebase (trivially) to latest next
>   - Also convert drivers/gpu/drm/bridge/ite-it6263.c (which is new since
>     the series was orginally sent in May)
>
> Best regards
> Uwe
>
>   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>   drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>   drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>   drivers/gpu/drm/bridge/ite-it6263.c                      | 2 +-
>   drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>   drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 4 ++--
>   drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>   drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 ++++----
>   drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 4 ++--
>   drivers/gpu/drm/bridge/sii902x.c                         | 4 ++--
>   drivers/gpu/drm/bridge/sii9234.c                         | 4 ++--
>   drivers/gpu/drm/bridge/sil-sii8620.c                     | 4 ++--
>   drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>   drivers/gpu/drm/bridge/tc358768.c                        | 4 ++--
>   drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 4 ++--
>   drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>   drivers/gpu/drm/i2c/ch7006_drv.c                         | 2 +-
>   drivers/gpu/drm/i2c/sil164_drv.c                         | 2 +-
>   drivers/gpu/drm/i2c/tda9950.c                            | 4 ++--
>   drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>   22 files changed, 33 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index b754947e3e00..83d711ee3a2e 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -793,7 +793,7 @@ static void anx6345_i2c_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id anx6345_id[] = {
> -	{ "anx6345", 0 },
> +	{ "anx6345" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(i2c, anx6345_id);
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a2675b121fe4..3427322f986a 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2795,7 +2795,7 @@ static void anx7625_i2c_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id anx7625_id[] = {
> -	{"anx7625", 0},
> +	{ "anx7625" },
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index c83486cf6b15..da17f0978a79 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -597,7 +597,7 @@ static const struct of_device_id ch7033_dt_ids[] = {
>   MODULE_DEVICE_TABLE(of, ch7033_dt_ids);
>   
>   static const struct i2c_device_id ch7033_ids[] = {
> -	{ "ch7033", 0 },
> +	{ "ch7033" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ch7033_ids);
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index cbabd4e20d3e..1e4b20abc335 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -878,7 +878,7 @@ static const struct of_device_id it6263_of_match[] = {
>   MODULE_DEVICE_TABLE(of, it6263_of_match);
>   
>   static const struct i2c_device_id it6263_i2c_ids[] = {
> -	{ "it6263", 0 },
> +	{ "it6263" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 008d86cc562a..0faad10ba8e4 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3497,7 +3497,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id it6505_id[] = {
> -	{ "it6505", 0 },
> +	{ "it6505" },
>   	{ }
>   };
>   
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index e265ab3c8c92..52da204f5740 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -815,8 +815,8 @@ static const struct of_device_id lt8912_dt_match[] = {
>   MODULE_DEVICE_TABLE(of, lt8912_dt_match);
>   
>   static const struct i2c_device_id lt8912_id[] = {
> -	{"lt8912", 0},
> -	{},
> +	{ "lt8912" },
> +	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, lt8912_id);
>   
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1b31fdebe164..b3f5e69fb39b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1236,7 +1236,7 @@ static void lt9611_remove(struct i2c_client *client)
>   }
>   
>   static struct i2c_device_id lt9611_id[] = {
> -	{ "lontium,lt9611", 0 },
> +	{ "lontium,lt9611" },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, lt9611_id);
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 4d1d40e1f1b4..57f66e4f7843 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -914,7 +914,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
>   }
>   
>   static struct i2c_device_id lt9611uxc_id[] = {
> -	{ "lontium,lt9611uxc", 0 },
> +	{ "lontium,lt9611uxc" },
>   	{ /* sentinel */ }
>   };
>   
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 37f1acf5c0f8..a3dcee62e7a5 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -318,8 +318,8 @@ static void stdp4028_ge_b850v3_fw_remove(struct i2c_client *stdp4028_i2c)
>   }
>   
>   static const struct i2c_device_id stdp4028_ge_b850v3_fw_i2c_table[] = {
> -	{"stdp4028_ge_fw", 0},
> -	{},
> +	{ "stdp4028_ge_fw" },
> +	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, stdp4028_ge_b850v3_fw_i2c_table);
>   
> @@ -365,8 +365,8 @@ static void stdp2690_ge_b850v3_fw_remove(struct i2c_client *stdp2690_i2c)
>   }
>   
>   static const struct i2c_device_id stdp2690_ge_b850v3_fw_i2c_table[] = {
> -	{"stdp2690_ge_fw", 0},
> -	{},
> +	{ "stdp2690_ge_fw" },
> +	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, stdp2690_ge_b850v3_fw_i2c_table);
>   
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index e77aab965fcf..44e36ae66db4 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -319,8 +319,8 @@ static void ptn3460_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id ptn3460_i2c_table[] = {
> -	{"ptn3460", 0},
> -	{},
> +	{ "ptn3460" },
> +	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, ptn3460_i2c_table);
>   
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 9be9cc5b9025..127da22011b3 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1239,8 +1239,8 @@ static const struct of_device_id sii902x_dt_ids[] = {
>   MODULE_DEVICE_TABLE(of, sii902x_dt_ids);
>   
>   static const struct i2c_device_id sii902x_i2c_ids[] = {
> -	{ "sii9022", 0 },
> -	{ },
> +	{ "sii9022" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
>   
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 0c74cdc07032..cd7837c9a6e0 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -945,8 +945,8 @@ static const struct of_device_id sii9234_dt_match[] = {
>   MODULE_DEVICE_TABLE(of, sii9234_dt_match);
>   
>   static const struct i2c_device_id sii9234_id[] = {
> -	{ "SII9234", 0 },
> -	{ },
> +	{ "SII9234" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, sii9234_id);
>   
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index 26b8d137bce0..28a2e1ee04b2 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2368,8 +2368,8 @@ static const struct of_device_id sii8620_dt_match[] = {
>   MODULE_DEVICE_TABLE(of, sii8620_dt_match);
>   
>   static const struct i2c_device_id sii8620_id[] = {
> -	{ "sii8620", 0 },
> -	{ },
> +	{ "sii8620" },
> +	{ }
>   };
>   
>   MODULE_DEVICE_TABLE(i2c, sii8620_id);
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 7275e66faefc..4637bf6ea7a3 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2587,7 +2587,7 @@ static void tc_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id tc358767_i2c_ids[] = {
> -	{ "tc358767", 0 },
> +	{ "tc358767" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, tc358767_i2c_ids);
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 2cb748bbefcd..ec79b0dd0e2c 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1244,8 +1244,8 @@ static const struct regmap_config tc358768_regmap_config = {
>   };
>   
>   static const struct i2c_device_id tc358768_i2c_ids[] = {
> -	{ "tc358768", 0 },
> -	{ "tc358778", 0 },
> +	{ "tc358768" },
> +	{ "tc358778" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, tc358768_i2c_ids);
> diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> index a0a1b5dd794e..eaec70fa42b6 100644
> --- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
> +++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> @@ -389,7 +389,7 @@ static void dlpc3433_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id dlpc3433_id[] = {
> -	{ "ti,dlpc3433", 0 },
> +	{ "ti,dlpc3433" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(i2c, dlpc3433_id);
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9e31f750fd88..3f31102bef5f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1971,8 +1971,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>   }
>   
>   static struct i2c_device_id ti_sn65dsi86_id[] = {
> -	{ "ti,sn65dsi86", 0},
> -	{},
> +	{ "ti,sn65dsi86" },
> +	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, ti_sn65dsi86_id);
>   
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index b1b1e4d5a24a..7b8492d91df8 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -435,7 +435,7 @@ static void tfp410_i2c_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id tfp410_i2c_ids[] = {
> -	{ "tfp410", 0 },
> +	{ "tfp410" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
> index 131512a5f3bd..fcb0fcd6c897 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -486,7 +486,7 @@ static int ch7006_encoder_init(struct i2c_client *client,
>   }
>   
>   static const struct i2c_device_id ch7006_ids[] = {
> -	{ "ch7006", 0 },
> +	{ "ch7006" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ch7006_ids);
> diff --git a/drivers/gpu/drm/i2c/sil164_drv.c b/drivers/gpu/drm/i2c/sil164_drv.c
> index ff23422727fc..c17afa025d9d 100644
> --- a/drivers/gpu/drm/i2c/sil164_drv.c
> +++ b/drivers/gpu/drm/i2c/sil164_drv.c
> @@ -413,7 +413,7 @@ sil164_encoder_init(struct i2c_client *client,
>   }
>   
>   static const struct i2c_device_id sil164_ids[] = {
> -	{ "sil164", 0 },
> +	{ "sil164" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, sil164_ids);
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index 82d618c40dce..cbff851e0c85 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -486,8 +486,8 @@ static void tda9950_remove(struct i2c_client *client)
>   }
>   
>   static struct i2c_device_id tda9950_ids[] = {
> -	{ "tda9950", 0 },
> -	{ },
> +	{ "tda9950" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, tda9950_ids);
>   
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
> index 2160f05bbd16..57ce77c2be24 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -2094,7 +2094,7 @@ MODULE_DEVICE_TABLE(of, tda998x_dt_ids);
>   #endif
>   
>   static const struct i2c_device_id tda998x_ids[] = {
> -	{ "tda998x", 0 },
> +	{ "tda998x" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, tda998x_ids);
>
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

