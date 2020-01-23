Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3931463E3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD886F9CF;
	Thu, 23 Jan 2020 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59796F9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 08:50:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so2161375wrq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 00:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+aDaNxW55mnMFa7Igu78ESj2cFmoiUhidgs6ZZ+Zj4E=;
 b=PTM6D6/D5L+P4YuL58I2oxcppLY9OqsxU+2T8p3JxXU+yjLvCM87lUIH577abP5fbU
 6uoT3EUGBfBacyWa9RpfBaqHSU6gfwK63CYSF7YwaeAonw6vnrEzE3phrQgIZlJRASS8
 Ne1NpgwiitedMMG9w6PGNLwvqkkh/zQwbQAyG0JFsHqeIUmUbURqVbnydPTLeE+TSdWU
 XbUKnf9pjiJZHGaSK5XsWc0Y2vwgcGlE3FFTPoNksaXD+vVjKsv2MdkJCef9YR8FFjXf
 +H0gy3UormBzCBDskhBT563OT90HwLJH6bA9QV+Fv4J1JyhToI9ZweHbM6lTcqQFySJ+
 aZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+aDaNxW55mnMFa7Igu78ESj2cFmoiUhidgs6ZZ+Zj4E=;
 b=Pwroq++LRCfw4k1WciFyuBlJn7JXKlqFrW/h1gK6Tz/YuWEyALe2Y3bMDO2HmEzv5/
 11wwUn7M6bX8Nc0Q509/paOU0F+ATGRt7G5ZBAVJV9F8GxHJ21gRvp3ltV7+KoBpOXZH
 QbicWV/Akxd6ZbdoLK/kCM98k6QWc7BKO9bUeNxaaR7EGwV0Ai0Lrz24LfKdLHBaKcRQ
 RBEgCjghsovx9wblFQ/o7FDz3vgnrK5rBJn/k6HJmADbeu72MdRCwOxaKOw6/Mgy9IiJ
 lZdXDw1rIoySFsUkcrtESpO+PTP5jgiEy/C0Uo7pV+NK7Z61Oq+8oXCY7j20lcU4ut7H
 TK0A==
X-Gm-Message-State: APjAAAXy22pQj2Q8UeQCY7gsup38IE18nlEwGXPJNm9J0h+fVpvL7A9N
 dx/cS76syRgNc0GW8n8Kl68EMw==
X-Google-Smtp-Source: APXvYqyyNzgB3mT+fwNoFDnECxaONvXVuzJeP+hKdx1WepSslYLSRFiGxhCsmt8gfnvuTFpM+RDojQ==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr16443184wro.416.1579769448990; 
 Thu, 23 Jan 2020 00:50:48 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a16sm2144280wrt.37.2020.01.23.00.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 00:50:48 -0800 (PST)
Subject: Re: [PATCH v7 06/12] drm/bridge: Add the necessary bits to support
 bus format negotiation
To: Jonas Karlman <jonas@kwiboo.se>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
 <20200122111700.1924960-7-boris.brezillon@collabora.com>
 <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
 <20200123083933.64fc98be@collabora.com>
 <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <55bb66c6-d5a8-289e-d430-b846f469cf3a@baylibre.com>
Date: Thu, 23 Jan 2020 09:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
Content-Language: en-US
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2020 08:52, Jonas Karlman wrote:
> On 2020-01-23 08:39, Boris Brezillon wrote:
>> On Wed, 22 Jan 2020 23:44:28 +0000 (UTC)
>> Jonas Karlman <jonas@kwiboo.se> wrote:
>>
>>>> +static int
>>>> +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>>>> +					struct drm_crtc_state *crtc_state,
>>>> +					struct drm_connector_state *conn_state)
>>>> +{
>>>> +	struct drm_connector *conn = conn_state->connector;
>>>> +	struct drm_encoder *encoder = bridge->encoder;
>>>> +	struct drm_bridge_state *last_bridge_state;
>>>> +	unsigned int i, num_out_bus_fmts;
>>>> +	struct drm_bridge *last_bridge;
>>>> +	u32 *out_bus_fmts;
>>>> +	int ret = 0;
>>>> +
>>>> +	last_bridge = list_last_entry(&encoder->bridge_chain,
>>>> +				      struct drm_bridge, chain_node);
>>>> +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>>>> +							    last_bridge);
>>>> +
>>>> +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>>> +		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
>>>> +
>>>> +		/*
>>>> +		 * If the driver implements ->atomic_get_output_bus_fmts() it
>>>> +		 * should also implement the atomic state hooks.
>>>> +		 */
>>>> +		if (WARN_ON(last_bridge_state))  
>>>
>>> This looks wrong, with this changed to WARN_ON(!last_bridge_state)
>>> my RK3328 HDMI2.0/YUV444/YUV420/10-bit branch at [1] starts working.
>>>
>>> With WARN_ON(last_bridge_state) I get:
>>>
>>> [    6.606658] WARNING: CPU: 0 PID: 167 at drivers/gpu/drm/drm_bridge.c:746 drm_atomic_bridge_chain_check+0x2b8/0x308
>>> [    6.606673] Hardware name: Pine64 Rock64 (DT)
>>>
>>> [    6.606754] Call trace:
>>> [    6.606759]  drm_atomic_bridge_chain_check+0x2b8/0x308
>>> [    6.606764]  drm_atomic_helper_check_modeset+0x89c/0xab8
>>> [    6.606768]  drm_atomic_helper_check+0x1c/0xa0
>>> [    6.606772]  drm_atomic_check_only+0x464/0x708
>>> [    6.606777]  drm_atomic_commit+0x18/0x58
>>
>> Add
>>
>> const drm_bridge_funcs ... = {
>> 	...
>> 	.atomic_reset = drm_atomic_helper_bridge_reset,
>> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> 	...
>> };
>>
>> and that should work.
> 
> That is what I added and what made that this warning is being triggered.
> The comment state that atomic state is needed, but the check warns when there is a state.
> 
> I have this:
> 
> static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
> 	...
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
> 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
> 	.atomic_check = dw_hdmi_bridge_atomic_check,
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> 	...
> };
> 
> and
> 
> static const struct drm_bridge_funcs dw_hdmi_rockchip_bridge_funcs = {
> 	...
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_get_input_bus_fmts = dw_hdmi_rockchip_get_input_bus_fmts,
> 	.atomic_check = dw_hdmi_rockchip_bridge_atomic_check,
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> };
> 
> after applying the following I got a hdmi signal again
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 0c28816146ba..7e7b0fac8f4f 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -743,7 +743,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>  		 * If the driver implements ->atomic_get_output_bus_fmts() it
>  		 * should also implement the atomic state hooks.
>  		 */
> -		if (WARN_ON(last_bridge_state))
> +		if (WARN_ON(!last_bridge_state))
>  			return -EINVAL;
>  
>  		out_bus_fmts = funcs->atomic_get_output_bus_fmts(last_bridge,
> 
> Regards,
> Jonas
> 
>>
>>>
>>> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20200122-bus-format
>>>
>>> Regards,
>>> Jonas

With this fix :
Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
