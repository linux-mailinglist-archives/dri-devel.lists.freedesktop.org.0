Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED58A7290
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBCC10F278;
	Tue, 16 Apr 2024 17:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UUM+wvP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CC510F278
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:43:37 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5d8b887bb0cso3515830a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713289417; x=1713894217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eUEau/pEpt9AkOO4LFO9sGSkzJlYdG9OShqBDzpNMbY=;
 b=UUM+wvP7b4NZv0BOAggygOAUvMZKfHZbw1qot77HbIwXiVkn2Jh5TbIsvEC2o/IHaY
 811Xb1FYl3yx04ccRqNA9lEs34EoKFcnHp9olO+N1NYryKPX6FwANV/whPiFq17glxA7
 kqBL4XYvN/zLFqub4gMzL5f4XOKpL2g8Ba4ErzKTarWbOoslxDKZKm5UfNBmOVgaZ3f/
 iNm0YEDgaW1KNgJu3xmVj+FeK+q99wwW3Bb3ryh/NS5kLOQd5rpFM9Ghvw1w4cE+alRL
 Cnf3kz2Gz9RRnBhbVrph0uw2UUBHsPX3APpsqEextK7FtwXhlq1oWvKc+/JEkSRC5v13
 f41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713289417; x=1713894217;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eUEau/pEpt9AkOO4LFO9sGSkzJlYdG9OShqBDzpNMbY=;
 b=pmyLyA644s9L0o4hyK9mCtX5QAeV6hmlJkFuUiMaxqRmtYD1vDHXzwE338FLAuSFlF
 mU41WcRjaVp4yPIttL0Fcxc3Yam+JQ2IylkO0qAjIILQKdVZmPgQaDVm8KP6BrvL4U2F
 iMGKAyLKvj93Roh4DrQjTfncy+gdLb6GNlZ0nvC9+EkSy6CHojLa/iS3AhXtJM8MuO9j
 jE0a72INAQirJu8SmR6nFl2G0uGVNiMfZ+1eoNWUCZ2KAVbNhx7sln1BFvZJHYUwAnoz
 zGB/cRw+H5J6ZmLgKNPyp/WMDowSzoG7T4K/PN95c2AczOkXO5O7dKvBureWIOFRsAq1
 5Jvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuwb7YgSUzZQ8zGpXURsQIGXuymZa3mdFvHejjqFkDvIeJs2SD3fbmydlj8Wv3aEeLCHE3HMRJlnjBODt7WijKrZVo5qgKlbMEUmFiw+r3
X-Gm-Message-State: AOJu0YzUy/kWT0jbp7amCQKEFDwcIFXwRa4hZ08XXL4KaZU0mJDlGryB
 IZtq3VdkrhyTlpn785vh3I8vnOyTMflRxu5KprqD9Pd0E/8gbartT9g82FLbTGc=
X-Google-Smtp-Source: AGHT+IFRHoGMcojV7sRgDp2sh67vGhlINTD73jHd6Lrwp10g0HQj6Lso/F+xzibAylchEXJh5urGzg==
X-Received: by 2002:a05:6a21:2791:b0:1a8:4266:3d02 with SMTP id
 rn17-20020a056a21279100b001a842663d02mr15369692pzb.30.1713289417249; 
 Tue, 16 Apr 2024 10:43:37 -0700 (PDT)
Received: from [10.36.52.145] ([24.75.208.156])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a056a001e0d00b006ecf25d0b8dsm9284521pfb.184.2024.04.16.10.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 10:43:36 -0700 (PDT)
Message-ID: <6a05d4ff-1f27-4b7d-88f2-050288d8dc7b@linaro.org>
Date: Tue, 16 Apr 2024 19:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 8/9] drm/panel: novatek-nt35950: Don't log an error
 when DSI host can't be found
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Vinay Simha BN <simhavcs@gmail.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20240415-anx7625-defer-log-no-dsi-host-v3-0-619a28148e5c@collabora.com>
 <20240415-anx7625-defer-log-no-dsi-host-v3-8-619a28148e5c@collabora.com>
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
In-Reply-To: <20240415-anx7625-defer-log-no-dsi-host-v3-8-619a28148e5c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 15/04/2024 23:49, Nícolas F. R. A. Prado wrote:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 648ce9201426..028fdac293f7 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -556,10 +556,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   		}
>   		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
>   		of_node_put(dsi_r);
> -		if (!dsi_r_host) {
> -			dev_err(dev, "Cannot get secondary DSI host\n");
> -			return -EPROBE_DEFER;
> -		}
> +		if (!dsi_r_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER, "Cannot get secondary DSI host\n");
>   
>   		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
>   		if (!nt->dsi[1]) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
