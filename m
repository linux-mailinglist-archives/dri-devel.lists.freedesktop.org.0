Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE891B9B5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D80810E5F3;
	Fri, 28 Jun 2024 08:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yDld8PpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D8710E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:22:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-424ad289949so2757555e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719562964; x=1720167764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ejCmoaZx7L5hxI3UhV27vQQ4p0lVv84FwVc9jqt9iL0=;
 b=yDld8PpHN+iRM1zyKeaV3CEHS3ZHR7NyxhatUj7bNL09oxWXzvqxACRmV1n/AykN5p
 6dECo5zSfQVkoaYAqnAZL002SxG4wMvZtPMlJORq9dyxpQejRVyAVl7fSxIqqu6dqNOa
 2TOf44KEdNjmN9XX6TbnQks1LXOfcJl1bfbdIWe4sGczFopTvVs1L1fUcr14wGJySi26
 P8s6oqVyj0V2Lz+VoLujg1CmepknF4uHxUjzHwy94r6lmudvEUvrZrdHd4QmDUrJLFKX
 dsNgXQhK42xIGZeiA4J6WpZokb7yI5s+zJXuTmnI067fNB3xFlNKo8fA8PW81ch2/+E4
 a31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719562964; x=1720167764;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ejCmoaZx7L5hxI3UhV27vQQ4p0lVv84FwVc9jqt9iL0=;
 b=gk+4AsRV/In2/wdamCJWrNHbZVNwCSCyX0Be1AStn1BQNSr/ci0eDYrRDHOxBeHlkF
 8aWWuaaneIX/IDzr9q8VQqmhKd1OV2AoeKaopuZazkt8TG8bK28Bzc/NHNemE1ckXwuB
 sIFSUX4/3ASNnvsdtYAW12uEiaZb+nM7NtytREMuoUCrTlY7auIS8AXfRYgtIhYIcPOd
 MdogOv9OZg7xGVDurIzReACMdRrZHEILbsBa4bwWdOWdBqxx0M93zLTosOs1iWBU/kQ4
 xpL20m/zvcK0HbOfdGzQzUDLQexz+s6SCAkxUzXjTCRzaBFtG/izATGEr1mj6dEbUksS
 IX9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRy4aA6cOAfAiH8q64PN5rrKvO0AHHkUEUmy4WiRQRSaf/Q0+b7MOIrdgLNnzeuhjFVMNOP3ZoTcZFZhd621LG89MTtTlj882uqttIOQh0
X-Gm-Message-State: AOJu0Yws7Gk/e9r5AZDZdKzBU/iDiulCEcfS39J5r7hToYWBZ+Dvsxd8
 2qHbiLe01bMsLI0r0tCRIH1FQTDio2yR+I9StOELSGetXJzDR1AoXNYxKteW67/VrIQ2yM4Gojg
 1jhY=
X-Google-Smtp-Source: AGHT+IGsqhz4Uid1khBusXHzl1AbAFWSd4S/HM/ELRHnGoggyTZHiDgsqMgKfH7YIPZTZAOoYehXfg==
X-Received: by 2002:adf:f088:0:b0:35e:8364:f4d4 with SMTP id
 ffacd0b85a97d-366e7a51bd6mr10921611f8f.58.1719562963761; 
 Fri, 28 Jun 2024 01:22:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b17d:324d:ca1:ab31?
 ([2a01:e0a:982:cbb0:b17d:324d:ca1:ab31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0e1688sm1511749f8f.60.2024.06.28.01.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 01:22:43 -0700 (PDT)
Message-ID: <8e7f8ef6-eba6-43e9-b0c6-6f5e5779a675@linaro.org>
Date: Fri, 28 Jun 2024 10:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/panel: st7701: Add Anbernic RG28XX panel
 support
To: Hironori KIKUCHI <kikuchan98@gmail.com>, linux-kernel@vger.kernel.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240628051019.975172-1-kikuchan98@gmail.com>
 <20240628051019.975172-4-kikuchan98@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240628051019.975172-4-kikuchan98@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2024 07:10, Hironori KIKUCHI wrote:
> The Anbernic RG28XX is a handheld gaming device with a 2.8 inch 480x640
> display. Add support for the display panel.
> 
> This panel is driven by a variant of ST7701 driver IC internally,
> confirmed by dumping and analyzing its BSP initialization sequence
> by using a logic analyzer. It is very similar to the existing
> densitron,dmt028vghmcmi-1a panel, but differs in some unknown
> register values. Besides, it is connected via SPI, so add a new entry
> for the panel.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 151 ++++++++++++++++++
>   1 file changed, 151 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 07980f010bb..8450a4317c1 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -471,6 +471,55 @@ static void rg_arc_gip_sequence(struct st7701 *st7701)
>   	msleep(120);
>   }
>   
> +static void rg28xx_gip_sequence(struct st7701 *st7701)
> +{
> +	st7701_switch_cmd_bkx(st7701, true, 3);
> +	ST7701_WRITE(st7701, 0xEF, 0x08);
> +
> +	st7701_switch_cmd_bkx(st7701, true, 0);
> +	ST7701_WRITE(st7701, 0xC3, 0x02, 0x10, 0x02);
> +	ST7701_WRITE(st7701, 0xC7, 0x04);
> +	ST7701_WRITE(st7701, 0xCC, 0x10);
> +
> +	st7701_switch_cmd_bkx(st7701, true, 1);
> +	ST7701_WRITE(st7701, 0xEE, 0x42);
> +	ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
> +
> +	ST7701_WRITE(st7701, 0xE1, 0x04, 0xA0, 0x06, 0xA0, 0x05, 0xA0, 0x07, 0xA0,
> +		   0x00, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		   0x00, 0x00, 0x00, 0x00);
> +	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x22, 0x22);
> +	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE5, 0x0C, 0x90, 0xA0, 0xA0, 0x0E, 0x92, 0xA0, 0xA0,
> +		   0x08, 0x8C, 0xA0, 0xA0, 0x0A, 0x8E, 0xA0, 0xA0);
> +	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x22, 0x22);
> +	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE8, 0x0D, 0x91, 0xA0, 0xA0, 0x0F, 0x93, 0xA0, 0xA0,
> +		   0x09, 0x8D, 0xA0, 0xA0, 0x0B, 0x8F, 0xA0, 0xA0);
> +	ST7701_WRITE(st7701, 0xEB, 0x00, 0x00, 0xE4, 0xE4, 0x44, 0x00, 0x40);
> +	ST7701_WRITE(st7701, 0xED, 0xFF, 0xF5, 0x47, 0x6F, 0x0B, 0xA1, 0xBA, 0xFF,
> +		   0xFF, 0xAB, 0x1A, 0xB0, 0xF6, 0x74, 0x5F, 0xFF);
> +	ST7701_WRITE(st7701, 0xEF, 0x08, 0x08, 0x08, 0x45, 0x3F, 0x54);
> +
> +	st7701_switch_cmd_bkx(st7701, false, 0);
> +
> +	st7701_switch_cmd_bkx(st7701, true, 3);
> +	ST7701_WRITE(st7701, 0xE6, 0x16);
> +	ST7701_WRITE(st7701, 0xE8, 0x00, 0x0E);
> +
> +	st7701_switch_cmd_bkx(st7701, false, 0);
> +	ST7701_WRITE(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0x10);
> +	ST7701_WRITE(st7701, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(120);
> +
> +	st7701_switch_cmd_bkx(st7701, true, 3);
> +	ST7701_WRITE(st7701, 0xE8, 0x00, 0x0C);
> +	msleep(10);
> +	ST7701_WRITE(st7701, 0xE8, 0x00, 0x00);
> +	st7701_switch_cmd_bkx(st7701, false, 0);
> +}
> +
>   static int st7701_prepare(struct drm_panel *panel)
>   {
>   	struct st7701 *st7701 = panel_to_st7701(panel);
> @@ -986,6 +1035,106 @@ static const struct st7701_panel_desc rg_arc_desc = {
>   	.gip_sequence = rg_arc_gip_sequence,
>   };
>   
> +static const struct drm_display_mode rg28xx_mode = {
> +	.clock		= 22325,
> +
> +	.hdisplay	= 480,
> +	.hsync_start	= 480 + 40,
> +	.hsync_end	= 480 + 40 + 4,
> +	.htotal		= 480 + 40 + 4 + 20,
> +
> +	.vdisplay	= 640,
> +	.vsync_start	= 640 + 2,
> +	.vsync_end	= 640 + 2 + 40,
> +	.vtotal		= 640 + 2 + 40 + 16,
> +
> +	.width_mm	= 44,
> +	.height_mm	= 58,
> +
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct st7701_panel_desc rg28xx_desc = {
> +	.mode = &rg28xx_mode,
> +
> +	.panel_sleep_delay = 80,
> +
> +	.pv_gamma = {
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x10),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x17),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0xd),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x5),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x7),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x1f),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x4),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x11),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0xe),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0x29),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
> +	},
> +	.nv_gamma = {
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0xd),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x14),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0xe),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x6),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x4),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x8),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x8),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x20),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x5),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x13),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x13),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0x26),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x30),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
> +	},
> +	.nlinv = 7,
> +	.vop_uv = 4800000,
> +	.vcom_uv = 1512500,
> +	.vgh_mv = 15000,
> +	.vgl_mv = -11730,
> +	.avdd_mv = 6600,
> +	.avcl_mv = -4400,
> +	.gamma_op_bias = OP_BIAS_MIDDLE,
> +	.input_op_bias = OP_BIAS_MIN,
> +	.output_op_bias = OP_BIAS_MIN,
> +	.t2d_ns = 1600,
> +	.t3d_ns = 10400,
> +	.eot_en = true,
> +	.gip_sequence = rg28xx_gip_sequence,
> +};
> +
>   static void st7701_cleanup(void *data)
>   {
>   	struct st7701 *st7701 = (struct st7701 *)data;
> @@ -1120,11 +1269,13 @@ static const struct of_device_id st7701_dsi_of_match[] = {
>   MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);
>   
>   static const struct of_device_id st7701_spi_of_match[] = {
> +	{ .compatible = "anbernic,rg28xx-panel", .data = &rg28xx_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, st7701_spi_of_match);
>   
>   static const struct spi_device_id st7701_spi_ids[] = {
> +	{ "rg28xx-panel" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(spi, st7701_spi_ids);

Looks fine !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
