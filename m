Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD63C1D370
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E137510E159;
	Wed, 29 Oct 2025 20:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UTB00pgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7B510E159
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:35:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so2189835e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761770125; x=1762374925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5bMBjt+VM1Vp3nKTpZq9XQvYVyPrL/jZ53DiT5wADSM=;
 b=UTB00pgSpMbb2ffYSnmEkpmVggnHF7a0Xz3neF26nMZT+a9wkELqQTkG/R9nMiVnQj
 BKZ6q/jl+hTagVUKsejS5eH26dgZkrXIbmCoNze4dHaP//L7ga4uHwfllwqZniO4azcz
 vCYqGJ3/Mazy7VL5f2PoZWFMCB5acXg73jwOdQ5m0mntBdLGLGQ3RHH8J8a6sGzbvNR6
 jWJgFOFOfw0URWGSP8Q+ECl7PuKyXvTBcGM2YNNjVL6E0GmbLEtffztZerIMquZyIYHe
 f8ypDnpxkFcrOIq1lG8rP8UTRWB/XpYdF5pNkwuZwVpWDeEYuwvdhrkcvxZocrLaDWwC
 X1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761770125; x=1762374925;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5bMBjt+VM1Vp3nKTpZq9XQvYVyPrL/jZ53DiT5wADSM=;
 b=KHWPEsoHwPxCxvLSLcisFszHTyX21MhGglYZhZ7FmEROQylakyShxoq/RJ4Bqlpvs8
 ZwCA+zQXi9oHzCeRhv5sJ6eWBo6GZVJpq3Jrr0Cc2giebPrtY1qP1AtG7iSCMBEx/b20
 gS2xfEhP2AeN67jmzH86ZZ00kVDHrtbDa2yVZQ2AsO6ufGOCHaITrkOoPtGp1RO5/J5y
 BCFon4Wi3MD5aipNs26blQQdCa6mHeeq7pO4khYav1fyI0cvNdPGSZgFO1R+3qhKGvz9
 05c+DYT8pe7IYuTHoZK7q+p0k3GC8nB2Ozvw1UZmuy2oEcCiin1o5V8viOPB088s748H
 YFug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgqti8EahrjriZgMIXX3pcpWvRM68rJWZSlJuUMtmYdu41jeWC7XjO0VbNV2edxWsXHyvmXOXt3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp7J+jrZSTI39bicuXMVs/zHNoZn5GKodUuccNQNbYe0HsuoE7
 3MORK+96Hl+w8MddHFuNSBmTUh8e0AwQJxwqpQ045ZwxDLq2HkCMuMrYv0rXmCPFNKU=
X-Gm-Gg: ASbGncuNtVmkhR8c43PJMoFeoZ/HIo9NVYnZnL5ntOYv3bCrp49mQ1XDtSMy3zRz6Q5
 AhxwmDIOCp7UhYRDBj9tZXPGa6jypfudHurD+/COjwsskIYGFp052RNn/MJmfly1u+WRlIdLFvk
 MWIN1gaZAp/MWDIj4KigOU81pHG1VaBZuZwXle5ZTLacZESZdInWwY1udoVFDcOcp6X7G8KdszS
 d0Cwh/dCV1Ybl5wwijRYV7aY8dugXzWDElekBAh9lBoono+b+11GKKO+rJp11LVZlegA0D/4Ql2
 5AjupDM4vjVrQqOBnOkqHFjEBzYeqlOXp/N1AXtROdSCjSaw3yr6BEHWetotkIwSF9Sa+NJTpZ2
 w1FWeCPVbU9/K2C2ojtwCxAT9gdWeon6aeX+YEnacxQo38sTFDImDdLOQ2cnjIbG8ce3uuendFR
 PGX62Swnj+h9zMOTsCHJsJYz5KgAMnfeL5AM1OwyjNkVoIbbNxmQ==
X-Google-Smtp-Source: AGHT+IF6uIhMMwm7yKC3UlQSKCBgpIpqEhODgFU8Ll4WjBwNbuDD7B8WtcIHm/9PH6IkoIdOjhDvSg==
X-Received: by 2002:a05:600c:190f:b0:477:1bb6:17de with SMTP id
 5b1f17b1804b1-4771e1e1154mr37420475e9.30.1761770124813; 
 Wed, 29 Oct 2025 13:35:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adc18sm2128255e9.6.2025.10.29.13.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 13:35:24 -0700 (PDT)
Message-ID: <ecb7d7de-d674-49d2-b373-39041b363167@linaro.org>
Date: Wed, 29 Oct 2025 21:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] drm/panel/lpm102a188a: Switch to
 mipi_dsi_generic_write_seq_multi()
To: rtapadia730@gmail.com, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net
References: <20250921183720.237761-2-rtapadia730@gmail.com>
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
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
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

On 9/21/25 20:37, rtapadia730@gmail.com wrote:
> From: Rajeev Tapadia <rtapadia730@gmail.com>
> 
> Replace deprecated mipi_dsi_generic_write_seq() calls with
> mipi_dsi_generic_write_seq_multi(). This avoids hidden early returns
> and matches the direction of other panel drivers.
> 
> No functional change intended.
> 
> Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
> ---
> 
> Question for reviewers:
> In this patch, I switched to using mipi_dsi_generic_write_seq_multi().
> Currently, if both link1 and link2 return errors, only one error is
> reported via accum_err. How should this ideally be handled? Should we
> report the first error, the last, or combine them somehow?

No it's fine, the first error is catched and reported.

The good way to do this is via this macro:

#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)	\
		do {								\
			dsi_ctx.dsi = dsi0;					\
			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
			dsi_ctx.dsi = dsi1;					\
			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
		} while (0)

with a single context. The mipi_dsi_dcs_write_seq_multi will print the
error from the proper DSI and the context will have the appropriate error.

Neil

> 
>   drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 5f897e143758..982cb61849a0 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -162,27 +162,34 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>   static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>   {
>   	/* Clear the manufacturer command access protection */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +	struct mipi_dsi_multi_context dsi_ctx1 = {.dsi = jdi->link1};
> +	struct mipi_dsi_multi_context dsi_ctx2 = {.dsi = jdi->link2};
> +
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_CMD_ACS_PROT,
>   				   MCS_CMD_ACS_PROT_OFF);
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_CMD_ACS_PROT,
>   				   MCS_CMD_ACS_PROT_OFF);
>   	/*
>   	 * Change the VGH/VGL divide rations to move the noise generated by the
>   	 * TCONN. This should hopefully avoid interaction with the backlight
>   	 * controller.
>   	 */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx1, MCS_PWR_CTRL_FUNC,
>   				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>   				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>   				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>   				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>   
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx2, MCS_PWR_CTRL_FUNC,
>   				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
>   				   MCS_PWR_CTRL_PARAM1_DEFAULT,
>   				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
>   				   MCS_PWR_CTRL_PARAM2_DEFAULT);
>   
> +	if (dsi_ctx1.accum_err < 0)
> +		return dsi_ctx1.accum_err;
> +	if (dsi_ctx2.accum_err < 0)
> +		return dsi_ctx2.accum_err;
>   	return 0;
>   }
>   

