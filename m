Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C480C31C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DBA10E355;
	Mon, 11 Dec 2023 08:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D731D10E355
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:28:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2718a768so44757915e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702283286; x=1702888086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=b86h1qVUlvkEy7uz455zczmOFDjJSlNbKkBl5oYZsN0=;
 b=bQCeWthqXFEwuh5CmqcbnyuqQFpelqKbXc0cmBdMU+JmTL0W/4o0MPnRXeni5cOMEL
 qUSpwqhbJenaPWGodvUARraAPAKMv8Fljce9FR3KL+MLI0zilziT46JLe5sHljVymEgv
 3zg2UeyFVuFpX53sWI/Q8BlfPxP42jyo+D352LJxceQaNF0/skiq0umpI0k3xTD9b/TH
 QyDm2oD+coxEQGLwn+uKCX8QPY2eeeE3lLQq6ifVwFAIj/QCUlJin6CLNPgYCV9mScQq
 ITy4PgDc02HEUctLqz4/U3rdu0dSRvXBLlVQCq3IEslx8My5tpVSBX0xkjQ/mlG+vkos
 wXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702283286; x=1702888086;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=b86h1qVUlvkEy7uz455zczmOFDjJSlNbKkBl5oYZsN0=;
 b=aT++uBrNcdCDmMYFASRJ8mtS6aYo2aJsaLAdvhfHPeAmmT65XvA1qajId2PlWBW1Nf
 JzeMS4O8LIERtcUyTU46w/ZtEu6GaL4HpixP5O+GWiqeGLjiEoBeDrxqKwcWhBTI/fh4
 4ifZ8YM4hlzg/IXc84BqdZiKQB/l0MM7lZlh8da2vp4GA9wt+SD9lOoFu8ZcuGA8rvGr
 UzAHtuaJS8pHSAO1fAZwOp7MldNijL/UJPASt4c+pkp29HPjGpSMgHR96EatJCF2bnax
 NajMxCqfiKxRDVtExHDKkz0XZfix/oIXqDEQD6lz1O7ExwamlY0U0H1mpaO8RD2nWq7L
 idJQ==
X-Gm-Message-State: AOJu0YyzYWnwZ2HyFqrjyTxFy7PCaxZI8mweSkinetkPM1oVrKo3FMZN
 pnditK2hQvJckD1dfUIOf8OQaw==
X-Google-Smtp-Source: AGHT+IE1JkCfTgzpIqb/cP2FfdEODGHnObJkGX6/XOJ3QckUeiVgFbXK6LIH4DyuBBQX5SXPQRvFhA==
X-Received: by 2002:a05:600c:4c8a:b0:40c:d3a:2447 with SMTP id
 g10-20020a05600c4c8a00b0040c0d3a2447mr2541433wmp.87.1702283286054; 
 Mon, 11 Dec 2023 00:28:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23?
 ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056000118d00b003333d46a9e8sm7955435wrx.56.2023.12.11.00.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 00:28:05 -0800 (PST)
Message-ID: <7b7f1f2c-d940-4ab1-abc3-1afe2ce42e67@linaro.org>
Date: Mon, 11 Dec 2023 09:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] drm/panel: st7701: Add Anbernic RG-ARC Panel Support
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, devicetree@vger.kernel.org
References: <20231208154847.130615-1-macroalpha82@gmail.com>
 <20231208154847.130615-4-macroalpha82@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20231208154847.130615-4-macroalpha82@gmail.com>
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
Cc: marex@denx.de, conor+dt@kernel.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2023 16:48, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Powkiddy RG-ARC is a series of 2 handheld devices, each with a 4
> inch 480x640 display. Add support for the display.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 136 ++++++++++++++++++
>   1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 036ac403ed21..421eb4592b61 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -423,6 +423,42 @@ static void kd50t048a_gip_sequence(struct st7701 *st7701)
>   		   0xFF, 0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
>   }
>   
> +static void rg_arc_gip_sequence(struct st7701 *st7701)
> +{
> +	st7701_switch_cmd_bkx(st7701, true, 3);
> +	ST7701_DSI(st7701, 0xEF, 0x08);
> +	st7701_switch_cmd_bkx(st7701, true, 0);
> +	ST7701_DSI(st7701, 0xC7, 0x04);
> +	ST7701_DSI(st7701, 0xCC, 0x38);
> +	st7701_switch_cmd_bkx(st7701, true, 1);
> +	ST7701_DSI(st7701, 0xB9, 0x10);
> +	ST7701_DSI(st7701, 0xBC, 0x03);
> +	ST7701_DSI(st7701, 0xC0, 0x89);
> +	ST7701_DSI(st7701, 0xE0, 0x00, 0x00, 0x02);
> +	ST7701_DSI(st7701, 0xE1, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,
> +		   0x00, 0x00, 0x20, 0x20);
> +	ST7701_DSI(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xE3, 0x00, 0x00, 0x33, 0x00);
> +	ST7701_DSI(st7701, 0xE4, 0x22, 0x00);
> +	ST7701_DSI(st7701, 0xE5, 0x04, 0x5C, 0xA0, 0xA0, 0x06, 0x5C, 0xA0,
> +		   0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xE6, 0x00, 0x00, 0x33, 0x00);
> +	ST7701_DSI(st7701, 0xE7, 0x22, 0x00);
> +	ST7701_DSI(st7701, 0xE8, 0x05, 0x5C, 0xA0, 0xA0, 0x07, 0x5C, 0xA0,
> +		   0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xEB, 0x02, 0x00, 0x40, 0x40, 0x00, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xEC, 0x00, 0x00);
> +	ST7701_DSI(st7701, 0xED, 0xFA, 0x45, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF,
> +		   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xB0, 0x54, 0xAF);
> +	ST7701_DSI(st7701, 0xEF, 0x08, 0x08, 0x08, 0x45, 0x3F, 0x54);
> +	st7701_switch_cmd_bkx(st7701, false, 0);
> +	ST7701_DSI(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0x17);
> +	ST7701_DSI(st7701, MIPI_DCS_SET_PIXEL_FORMAT, 0x77);
> +	ST7701_DSI(st7701, MIPI_DCS_EXIT_SLEEP_MODE, 0x00);
> +	msleep(120);
> +}
> +
>   static int st7701_prepare(struct drm_panel *panel)
>   {
>   	struct st7701 *st7701 = panel_to_st7701(panel);
> @@ -839,6 +875,105 @@ static const struct st7701_panel_desc kd50t048a_desc = {
>   	.gip_sequence = kd50t048a_gip_sequence,
>   };
>   
> +static const struct drm_display_mode rg_arc_mode = {
> +	.clock          = 25600,
> +
> +	.hdisplay	= 480,
> +	.hsync_start	= 480 + 60,
> +	.hsync_end	= 480 + 60 + 42,
> +	.htotal         = 480 + 60 + 42 + 60,
> +
> +	.vdisplay	= 640,
> +	.vsync_start	= 640 + 10,
> +	.vsync_end	= 640 + 10 + 4,
> +	.vtotal         = 640 + 10 + 4 + 16,
> +
> +	.width_mm	= 63,
> +	.height_mm	= 84,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct st7701_panel_desc rg_arc_desc = {
> +	.mode = &rg_arc_mode,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.panel_sleep_delay = 80,
> +
> +	.pv_gamma = {
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0x01) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0x16),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1d),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0e),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x12),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x06),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x0c),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x0a),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x09),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x25),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x00),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x03),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x00),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x3f),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3f),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1c)
> +	},
> +	.nv_gamma = {
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0x01) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC0_MASK, 0),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC4_MASK, 0x16),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1e),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0e),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC24_MASK, 0x11),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC52_MASK, 0x06),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC80_MASK, 0x0c),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC108_MASK, 0x08),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC147_MASK, 0x09),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC175_MASK, 0x26),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC203_MASK, 0x00),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC231_MASK, 0x15),
> +
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC239_MASK, 0x00),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC247_MASK, 0x3f),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3f),
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(DSI_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1c)
> +	},
> +	.nlinv = 0,
> +	.vop_uv = 4500000,
> +	.vcom_uv = 762500,
> +	.vgh_mv = 15000,
> +	.vgl_mv = -9510,
> +	.avdd_mv = 6600,
> +	.avcl_mv = -4400,
> +	.gamma_op_bias = OP_BIAS_MIDDLE,
> +	.input_op_bias = OP_BIAS_MIN,
> +	.output_op_bias = OP_BIAS_MIN,
> +	.t2d_ns = 1600,
> +	.t3d_ns = 10400,
> +	.eot_en = true,
> +	.gip_sequence = rg_arc_gip_sequence,
> +};
> +
>   static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	const struct st7701_panel_desc *desc;
> @@ -917,6 +1052,7 @@ static void st7701_dsi_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id st7701_of_match[] = {
> +	{ .compatible = "anbernic,rg-arc-panel", .data = &rg_arc_desc },
>   	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
>   	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
>   	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
