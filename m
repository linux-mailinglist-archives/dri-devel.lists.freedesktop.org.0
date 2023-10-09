Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E177BD5EB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D2510E22A;
	Mon,  9 Oct 2023 08:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A510E22A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:57:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-327be5fe4beso3891073f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696841824; x=1697446624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=20IhD3DbtExVKpTNHHdJ+qviTzAO61ihrX5GQAYq0yM=;
 b=tTjTEZgqE+hx5nXlFzK0Nn/IgOTT0v+ffzCZSmCGAJKsKK4gcEY7CPaSWU4KEAXcqP
 QC0x3882Cvs3fJaJr+CYguUfbQAA6Rz9ZEJVC5aNqNSsz4iK4fbrOh2Gv211WXRFsa/U
 1S08Hcgc2MQRcBXyuLE4o3J8JgoJVkuOno6CkioxmrMk87vSeb4wS0raTxCV6AFTcG+L
 LStriuiozp/wjObKCVi6tys1ReHHboRzDShr0khw7TgnVowv5Jad9VsFIwmu6kQTgvvc
 FBeq/7uJcnakZZzRDAPOqVqI0X1fjZ3bEQe0eYPcRd1UOjlAZkptzEqk/g7jfWT58K+Q
 ZVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841824; x=1697446624;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=20IhD3DbtExVKpTNHHdJ+qviTzAO61ihrX5GQAYq0yM=;
 b=NoPy/LWxIhKQk8m7QXxQ3uNaFh5tDt59EoJHGfhOr9uzFxV/V9liWYfnOjoOA87VB5
 681198J30dOUjFGOBSMFVWbyx9jDU+vj6V8GoAwpwCk1X795ychq65DHyjX1x2ivgPl1
 InFM4QDxXQdoxPZh5RKol7uWExzK9Ts1UdoRRGpoU5dT+abIsurf+Ib0Ryb6ykMF6zzS
 EdBiZ5tOrcXt8gbgEC1xKjXw6vGv2s2PMmfuLxIiFlPxihj3Sh0FDpElBPArTJtWq7r5
 eFxu60dACRnKzgCRnidwHBu/ORMMiRpaVxQQr3nHcrPX9CQrnJhl1EDcpVi0WgsaD0gi
 ED6A==
X-Gm-Message-State: AOJu0Yw9sJyyLj2MvnG+4l8KNCDNYXPc333/c0VHrM9Ky2KynOEjMJSp
 YHSFJxYYZR8A+Ipgyc07WVVgkB3ANEPBk1t7wKAsuSUs
X-Google-Smtp-Source: AGHT+IH0i8kEX6PYBwVQWP8U0pI3LmQpNgbpRNwQakkyxjARRuS0lm0+DLxX320ZnHrU2/fAtmCgAQ==
X-Received: by 2002:a05:6000:10c2:b0:321:68af:947 with SMTP id
 b2-20020a05600010c200b0032168af0947mr11828477wrx.8.1696841824507; 
 Mon, 09 Oct 2023 01:57:04 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00323330edbc7sm8974100wrt.20.2023.10.09.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 01:57:04 -0700 (PDT)
Message-ID: <d38226b2-9e93-4469-afa5-d1b76c9b9537@linaro.org>
Date: Mon, 9 Oct 2023 10:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: boe-tv101wum-nl6: Completely pull GPW to
 VGL before TP term
Content-Language: en-US, fr
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 quic_jesszhan@quicinc.com, sam@ravnborg.org,
 yangcong5@huaqin.corp-partner.google.com
References: <20231007064949.22668-1-zhouruihai@huaqin.corp-partner.google.com>
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
In-Reply-To: <20231007064949.22668-1-zhouruihai@huaqin.corp-partner.google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 08:49, Ruihai Zhou wrote:
> The sta_himax83102 panel sometimes shows abnormally flickering
> horizontal lines. The front gate output will precharge the X point of
> the next pole circuit before TP(TouchPanel Enable) term starts, and wait
> until the end of the TP term to resume the CLK. For this reason, the X
> point must be maintained during the TP term. In abnormal case, we
> measured a slight leakage at point X. This because during the TP term,
> the GPW does not fully pull the VGL low, causing the TFT to not be
> closed tightly.
> 
> To fix this, we completely pull GPW to VGL before entering the TP term.
> This will ensure that the TFT is closed tightly and prevent the abnormal
> display.
> 
> Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI panel")
> Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
> ---
> Changes since v1:
> 
> - Rebased on top of drm-misc-next
> - Add Fixes tag from Jessica's comment
> 
> v1: https://patchwork.kernel.org/project/dri-devel/patch/20230912105932.16618-1-zhouruihai@huaqin.corp-partner.google.com/
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 5ac926281d2c..c9087f474cbc 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1342,9 +1342,7 @@ static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] = {
>   	_INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),
>   	_INIT_DCS_CMD(0xCB, 0x86),
>   	_INIT_DCS_CMD(0xD2, 0x3C, 0xFA),
> -	_INIT_DCS_CMD(0xE9, 0xC5),
> -	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
> -	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
>   	_INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),
>   	_INIT_DCS_CMD(0xBD, 0x02),
>   	_INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
