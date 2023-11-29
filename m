Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC77FDBF7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8994710E625;
	Wed, 29 Nov 2023 15:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8C10E625
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:52:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3330fd19820so1335501f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 07:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701273131; x=1701877931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4famAvle2kJjYcIFB5bzZGKAJDcLuy9OE7bpmdck83Q=;
 b=irOY2WCipXPqFBW3ikcXnVgBPw39rb+wkX4IwbAetMc/A2iA11WfRsxoi5+PUWTjPp
 EyOp1caNubyj/yGcVZpPoMHb0969UJ+MGQhhb5dAFrpuZOmKOd916/SX2ZZk6zSGlBd9
 CJIV3BWAeFvkL5JNlc9RJMCKXUogyYw6A23nTHHceukLDtrhx7tlp1zsh1wscEmKsgtR
 EIX3WLjrpscZffKkNlrQ5ogV8ajy4fi64jUMzzufMJbBJ265idddMoUXToO4D2IqPz3q
 oUypEU/nrSFWOW5fKDB5vCTq9uBFUUaUM/wqGWsqgMdg7ZxewcgX4BA9gfJKX8J/6zux
 84TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701273131; x=1701877931;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4famAvle2kJjYcIFB5bzZGKAJDcLuy9OE7bpmdck83Q=;
 b=vZOVC8LdyQoz9mEq0+H3FdDjlneEKxVBlsT0Ajm25hErwJ03cpx4pPab8QJmSTyKy5
 5e73WNI7hZ77MaOCfcLQ09ladpeZyowY2Wo2OHy0o88Z1pZzIca+gxtZ8uaKY6Oa/Z24
 xxy8HPJeYM6JyHr92pWVTd0LiWNrFUcjFVIgWj0tR2Jz3eSEB5lhDOZR/7ktVO+mVB+q
 hkhEckS+xuwsSToDOUQKMLyE6eF++GIGtr4nNKFfjoz9++nc0k/+lA8NE4gpO5AsFYbQ
 YXZtjBFyU5ulSp4oWxWWJp101mmnfRs6P6n0HpTSNa0wNhQqzTuySXh+7MV+ePCtbKsE
 A2CQ==
X-Gm-Message-State: AOJu0YxxQ4PoR1kpvuWNehjL/qzqTaiA4ha6MpQbUV2pysbq9RaLWUpv
 CUdEu5TeX20ZK9kwTZvILWvnuw==
X-Google-Smtp-Source: AGHT+IG8dCqyB8dnmneKaFL0jhuQQlUTzQyrmSUA4Cf1pttKfFhgsdFTUwPs5HwVey6pVAScAboFgg==
X-Received: by 2002:a05:6000:178d:b0:333:6cf:2b5 with SMTP id
 e13-20020a056000178d00b0033306cf02b5mr6887796wrg.46.1701273131133; 
 Wed, 29 Nov 2023 07:52:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c?
 ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600001c600b00332ff21038fsm9743825wrx.106.2023.11.29.07.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 07:52:10 -0800 (PST)
Message-ID: <e2904e4e-fe02-4624-bd68-9c3ad18f41fd@linaro.org>
Date: Wed, 29 Nov 2023 16:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: nt36523: fix return value check in
 nt36523_probe()
Content-Language: en-US, fr
To: Yang Yingliang <yangyingliang@huaweicloud.com>,
 dri-devel@lists.freedesktop.org
References: <20231129090715.856263-1-yangyingliang@huaweicloud.com>
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
In-Reply-To: <20231129090715.856263-1-yangyingliang@huaweicloud.com>
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
Cc: mripard@kernel.org, lujianhua000@gmail.com, tzimmermann@suse.de,
 yangyingliang@huawei.com, quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2023 10:07, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> mipi_dsi_device_register_full() never returns NULL pointer, it
> will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
> 
> Fixes: 0993234a0045 ("drm/panel: Add driver for Novatek NT36523")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> index 9b9a7eb1bc60..a189ce236328 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> @@ -1254,9 +1254,9 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
>   			return dev_err_probe(dev, -EPROBE_DEFER, "cannot get secondary DSI host\n");
>   
>   		pinfo->dsi[1] = mipi_dsi_device_register_full(dsi1_host, info);
> -		if (!pinfo->dsi[1]) {
> +		if (IS_ERR(pinfo->dsi[1])) {
>   			dev_err(dev, "cannot get secondary DSI device\n");
> -			return -ENODEV;
> +			return PTR_ERR(pinfo->dsi[1]);
>   		}
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
