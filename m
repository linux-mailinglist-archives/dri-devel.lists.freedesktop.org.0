Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC624AEE2CC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAC410E494;
	Mon, 30 Jun 2025 15:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q4npsiXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE3710E494
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:39:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so10741005e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297947; x=1751902747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5ZziG/0VfzA1IKuwjL2tWIJBNA1ugi01gvbDxIGbv/M=;
 b=q4npsiXIhZdBwScRzyvGBtSEaHLYkTIn9e2AMx51m2+IHQmJAitWC0mBGex2NsQtmL
 SFLSXpBSIf7WwvE7jPAuu5RIeHG4RvdEWfqN6aBNpX6mv4ASQGCwgMf5OGhnrRw6a466
 g2redZNwWl8aeQWvQbAdeVevU8mauaqUKefpo5n1ogXmb6fSAQZ4VCy5GGCDR4yRwFcV
 OAAnpwkkNV4xUh/Qo/UsvliUQmICeBsolhKzSzTuir3CQxZEYJLtt1u5LWHEAd/U3g1y
 peT6Gd1PSH2BsK5R903a1JLFjGhbH+LzfOk8A7J+aPkOZGflQWT84nS+HH1+ncKG1b7N
 Kvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297947; x=1751902747;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5ZziG/0VfzA1IKuwjL2tWIJBNA1ugi01gvbDxIGbv/M=;
 b=e0LiAzR1VeIGsE2cvsTCBcxJL0v4o83K0S0o4xT8TbnR+l6ze5c+2Gj2xvnlLDWxpr
 KLUhqXdb63HfydpgIPJoD48JGT9pQinBLpfeYKSkDsbYrKTpKFHjrMFYSL2oF+UTqXzs
 3POfj+Hs1YxjOYXVdF07EvpRkHoc3JBkaeD+9/1E1kMTK0DcGzkwjbZON5phQTGU5oq6
 mork3/dR8epF36+JjoxSK/kwaxDOY74q4fmGWcagej+uKd+rpn7GQvQVJEPFq/XgzPCZ
 MyuYhElt+G5JiZ1GKWascKfY6CZTCCPkL7QoIvkv2wXDVnt03fMqqwAloJZ1VMew8Ddn
 p+7Q==
X-Gm-Message-State: AOJu0YyT1gQCtftOayB9plvTzQyfselhMTvGtm82za4H+KTDlIeP4WV0
 poPWrNTv3D7SIGGNOnwbABgnunYm+bGiy37TGt47DxVFybX7FDFHYg9CBzVgmriGBCc=
X-Gm-Gg: ASbGncs7mytoUs0lEcq+AHHNff1hpGOihKddJZ/Aw4FD0FD6kmFt+2obe528DVy0cyW
 iYY5HdnGlYDDReRhLbt3tkHmPKGUAIeaesa6md0+5rZvtc+eQbfiHJFwq9rqBQyKQ8X7mMnC2XQ
 obtOQz36IBMqo9D8SdhxIWMNhdHUi9wq1Z43tUv7GpimJjwPUb+2l8ecbA64hPbXEj1BUx49kdh
 E+3AnMQotgPHZWIKayyQsewN3/BiqbMHuS0fRpy1Syhpz5G3z7q4lq0vRXZ6/hSsxAxrrJ/Vgpu
 XpKxYgUMVv2MEK6nj1d1uy4425LJYhJlj0QoF+zd2pt4Sd5V1OjwzNGkpeaKi+XvxHV9Ew3rqtL
 HPHH77hFbsYxuBe9xJjJBKGn6YQ93w4Bwqwroj/Lv/AmqPb7pBw==
X-Google-Smtp-Source: AGHT+IE/EGZJuAhfhPDcepQz5wUmqLOrRpHMIC8QD5spKCHPPzfBv4cSrm45NH3NPOTs4Wj0I/lClw==
X-Received: by 2002:a05:600c:5250:b0:448:e8c0:c778 with SMTP id
 5b1f17b1804b1-4538ee61eedmr121126635e9.22.1751297947477; 
 Mon, 30 Jun 2025 08:39:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453941c67c2sm94163985e9.5.2025.06.30.08.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:39:07 -0700 (PDT)
Message-ID: <7b564815-c9e0-435c-bd77-63da42aabacb@linaro.org>
Date: Mon, 30 Jun 2025 17:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
 <20250627-dsi-vsync-flush-v2-4-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-4-4066899a5608@pengutronix.de>
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

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the unused MIPI_DSI_MODE_VSYNC_FLUSH flag. Whether or not a display
> FIFO flush on vsync is required to avoid sending garbage to the panel is
> not a property of the DSI link, but of the integration between display
> controller and DSI host bridge.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   include/drm/drm_mipi_dsi.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..369b0d8830c3d14a4fc1e8e38d5fa55f04ca143e 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -130,8 +130,6 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>   #define MIPI_DSI_MODE_VIDEO_NO_HBP	BIT(6)
>   /* disable hsync-active area */
>   #define MIPI_DSI_MODE_VIDEO_NO_HSA	BIT(7)
> -/* flush display FIFO on vsync pulse */
> -#define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
>   /* disable EoT packets in HS mode */
>   #define MIPI_DSI_MODE_NO_EOT_PACKET	BIT(9)
>   /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
