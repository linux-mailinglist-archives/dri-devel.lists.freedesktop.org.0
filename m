Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E675D1D43A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1610E3F4;
	Wed, 14 Jan 2026 08:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gaij+tPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2510E3F4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:52:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso5526425e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768380756; x=1768985556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1bpcWnB4BcZSj7q9wPAqZQeLTaJp0K4KOi9eIDlDf/I=;
 b=gaij+tPXQ4FbfvWvQYyhPcx0bK53TUKDSryzPPQD4rGd1ZEelg+Tjg1qEGkNrQCV7m
 sMUf2/g5aQ9ZqfWtqxe5HSPjeMVsxDE/LkFOk7HXLby0asDH2qBYrJO/mfCfy/86OBVY
 xuPUg1+076stZfVyAUSJ55p5KC/f57yj+E0jUGUUhASr9aVvRUOGSbokaQe2PlHwswce
 VWp69H7OoUd9mIeeJvXvzuNvs8Kmr/p0CRt+K2P6ogMwxKp7FiA48yddDiaMuXQJ3TvN
 t+OyyxdehMIYvXBJSVLQ58hBW4pRjYlwd2tppxTZRmiXIIXVFHxAHmzknLyhfGOJaunN
 uHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380756; x=1768985556;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bpcWnB4BcZSj7q9wPAqZQeLTaJp0K4KOi9eIDlDf/I=;
 b=jxrEtYfP29dXfgOICIebwtVHvcF3YynfTPqeVpYfCXAoeNGIimE5L8W/Jm7Br+wZ41
 Ac+WzVOrN07s6SomhTy+ccw3bZNpxjbMrrpqebz9vuOWz5wsjYq9+f9Oj7DB9c9U7V/e
 HVH+Lc6ZqErnQ1LPfLKjnKEkJo96FeBkQYysozeSEB2zVKVhn58//Y6r3o9Ri8up0eOe
 qhN3wHf4EmoZdANBLkIQj+AqBGVzk3GS6s/ov7NCDQbzHOBb3vOvYG2Tc4FoiwlCtsL8
 XFz3VoNSfTAKYzY4tkIIC0rUgYIIXof7Nl1naRa43ASgTYXpRvgqMQri/eabySsC3KzG
 5ZbQ==
X-Gm-Message-State: AOJu0YwVJSftVOMUqn00cEvnjzDY54zdejCb1GtoWXYq97mn85xPG1yq
 4drApNHm6xUTP1dV6zNqahHkKD8FMWxWrKZlUA9iwL2qqI9GLx5ey6HuQgH+B5G74yc=
X-Gm-Gg: AY/fxX7VWYv+zwYqt+86hJluUNAWtwLa5+qMYekJmMJ1OmxNHvhbwy+xlz3+EkkKFll
 Q++t7hryKXOKvXjJvcil3MIUs2YbKrRlpq5a1ziWtT7LJwV7+VGyZcrRPDNnmjyIGnxlUK4mmAP
 PaBrpn/c2ycVqjvpD5EsVfaQ1xs5jCuLxiiGDHFXbTcLny+UxIZ5rBebdj7wnFYGId9xyIktH/Q
 YW2k8K5gEGcPOp5Iz4YjOaP4me0u70zPvqJBROyosDNi8FHrKRpdTHctD9V1Tu903UEScwEEO2d
 WujaNx92bS1Tza2QriOJL8hZiTtt8+MpF9bJLG9AWc/fFLbDXDy0kdjRjEUygsIEQ3aREuYYzso
 s04b/LnCBj+bwcGEFH3ZvwPKBceFRY9g7k6r6BOW6lZIWCtQdDufoY52U17X3a5i7UX8zX9ZrgE
 g22zP1x631DkuoRYr4rC0tKvD6Yy6BJUHYUXhw9Sh/RYM7YCNpVNviqyN5uaA5QGI=
X-Received: by 2002:a05:600c:16d3:b0:47e:e0b3:2437 with SMTP id
 5b1f17b1804b1-47ee0b329d3mr22429865e9.5.1768380756155; 
 Wed, 14 Jan 2026 00:52:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450?
 ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee0b89ee0sm18634095e9.1.2026.01.14.00.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:52:35 -0800 (PST)
Message-ID: <6a68b64d-27d3-474a-9c40-5a9973444395@linaro.org>
Date: Wed, 14 Jan 2026 09:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/panel: jd9365da: Support for Anbernic RG-DS Panel
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, jagan@edgeble.ai, heiko@sntech.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-4-macroalpha82@gmail.com>
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
In-Reply-To: <20260113195721.151205-4-macroalpha82@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/26 20:57, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for both panels used in the Anbernic RG-DS. These panels
> are physically identical and differ only with a single instruction
> in the init sequence. The init sequence commands suggest it uses
> an identical controller as the jd9365da.
> 
> Additionally, allow specifying per-panel dsi->mode_flags that can
> override the default values.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Co-developed-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
> Signed-off-by: Alexander Weinzerl <aweinzerl13@yahoo.com>
> ---
>   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 271 +++++++++++++++++-
>   1 file changed, 269 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 063ed9646d53..5386a06fcd08 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -33,6 +33,7 @@ struct jadard_panel_desc {
>   	unsigned int backlight_off_to_display_off_delay_ms;
>   	unsigned int display_off_to_enter_sleep_delay_ms;
>   	unsigned int enter_sleep_to_reset_down_delay_ms;
> +	unsigned long mode_flags;
>   };
>   
>   struct jadard {
> @@ -1113,6 +1114,258 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
>   	.enter_sleep_to_reset_down_delay_ms = 100,
>   };
>   
> +static int anbernic_rgds_init_cmds(struct jadard *jadard)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> +	struct drm_panel *panel = &jadard->panel;
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x0);
> +
> +	jadard_enable_standard_cmds(&dsi_ctx);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x6a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xbf);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
> +
> +	if (of_device_is_compatible(panel->dev->of_node,
> +				    "anbernic,rg-ds-display-top"))
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x05);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0xf7);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x78);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x6d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x34);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x3a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x1b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x34);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x2f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x3a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x2d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x1b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x4a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x57);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x77);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x49);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x4b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x47);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xe9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0xe9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xda);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0xfc);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x83, 0xf4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x87, 0x10);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1d);
> +
> +	jd9365da_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 10);
> +
> +	return dsi_ctx.accum_err;
> +};
> +
> +static const struct jadard_panel_desc anbernic_rgds_display_desc = {
> +	.mode = {
> +		.clock		= (640 + 260 + 220 + 260) * (480 + 10 + 2 + 16) * 60 / 1000,
> +
> +		.hdisplay	= 640,
> +		.hsync_start	= 640 + 260,
> +		.hsync_end	= 640 + 260 + 220,
> +		.htotal		= 640 + 260 + 220 + 260,
> +
> +		.vdisplay	= 480,
> +		.vsync_start	= 480 + 10,
> +		.vsync_end	= 480 + 10 + 2,
> +		.vtotal		= 480 + 10 + 2 + 16,
> +
> +		.width_mm	= 68,
> +		.height_mm	= 87,
> +		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init = anbernic_rgds_init_cmds,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +};
> +
>   static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -1126,8 +1379,14 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   		return PTR_ERR(jadard);
>   
>   	desc = of_device_get_match_data(dev);
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	if (desc->mode_flags)
> +		dsi->mode_flags = desc->mode_flags;
> +	else
> +		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +				  MIPI_DSI_MODE_VIDEO_BURST |
> +				  MIPI_DSI_MODE_NO_EOT_PACKET;
> +
>   	dsi->format = desc->format;
>   	dsi->lanes = desc->lanes;
>   
> @@ -1176,6 +1435,14 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id jadard_of_match[] = {
> +	{
> +		.compatible = "anbernic,rg-ds-display-bottom",
> +		.data = &anbernic_rgds_display_desc
> +	},
> +	{
> +		.compatible = "anbernic,rg-ds-display-top",
> +		.data = &anbernic_rgds_display_desc
> +	},
>   	{
>   		.compatible = "chongzhou,cz101b4001",
>   		.data = &cz101b4001_desc

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
