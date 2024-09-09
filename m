Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D02971A94
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01083897FB;
	Mon,  9 Sep 2024 13:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJhmZsnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57541897FB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:15:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42ca573fd5aso27170415e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725887728; x=1726492528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=B95ObHJpdojG5xYgPYvRks8MDbQVxroVTSkoySW7Ido=;
 b=QJhmZsnqrhvcvtY+EF0KXCbZCPhXu6N03fRLBlOLLY/AVyMs9VR7Uvl0eHBVHP9uG0
 ILs4bfRqPRMKjvNOzXzgqEddKZuBbGx+BBRTzXju3D0j9GmRRZT3LxiXSLCewO1XxZwc
 qKIUowDZXdrFhvts165T8jlaOyYmtQCpMT9AtUW08SwS72a9gGnb+DgoP5JOyPx9ZpoR
 jMGQnQLacEEJ01M6SNyP+NB/nGIKkRwrhWZCfDQ0hN+aGlu831awbGrIv8XRtfMhV4JA
 T3971Epz0TNipmFVZDPHHwJIT/M5N/fhid8ja1JytDW+qdyaHy4FBxrb8RXQ4mRy4w8k
 Lglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725887728; x=1726492528;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=B95ObHJpdojG5xYgPYvRks8MDbQVxroVTSkoySW7Ido=;
 b=ilbfl4MVOJjYwZPiTsJQuGGrUapq8y4lTOej+2Aqldao5CovXxruF6qEKAb4HGa5sx
 SoujdRlVB87P+CbbSSs5xh8OSt8AJC7njHlTWAkt9gCObS2Sr9vh/kCEcQ4M6H/XmyoY
 uwMk/5YZ38acrnw+gYhgcTNxgt2DFP4rDg5JP1ZMMkBlMPD4kNqld7zrBX1PArNZChkj
 vcE45ZA6jYK2ozopmmsTBCnMYgquNX1gnsUQcqazZQVQ3/Au1cuRoybKbdr/z4Rv9e1W
 cSe5t9OTST0vxSgyVFs+9vDU7RRGoMDZk+7vbUf2+aQs6FxQyzuXRcoxQhv78/257tCr
 rsFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2kRtPp7egTj/JwIMvKlBvWHU/5n7Zu/e1fv5Q3QzkncNb/OK28nOTqikJn/HV5Fu57st9d2j1WU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVSBH3WYbGhC2bOythokdp3CMX4dujKRPIVXuPw1sYvP9RBOtr
 bxftE7TueCb3u+29IHa5QKb+E/BLsAn7l6ZTX0zeGGFiZpOhPOMpToc/juxyEcA=
X-Google-Smtp-Source: AGHT+IEU43fgBZkJDiu5N74vNjtuUNPxSdgWTgzbyhk1oykhQZa3fOmHlH6jxK/DCxOHnZ+0No77XA==
X-Received: by 2002:adf:f74b:0:b0:36b:b297:1419 with SMTP id
 ffacd0b85a97d-378895ca68dmr7209193f8f.20.1725887726980; 
 Mon, 09 Sep 2024 06:15:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850?
 ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956653d1sm6002863f8f.33.2024.09.09.06.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:15:26 -0700 (PDT)
Message-ID: <8cdfa4f1-3acd-4839-a490-9152174e3136@linaro.org>
Date: Mon, 9 Sep 2024 15:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 01/10] drm: bridge: dw_hdmi: Disable scrambler feature
 when not supported
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240908132823.3308029-1-jonas@kwiboo.se>
 <20240908132823.3308029-2-jonas@kwiboo.se>
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
In-Reply-To: <20240908132823.3308029-2-jonas@kwiboo.se>
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

On 08/09/2024 15:28, Jonas Karlman wrote:
> The scrambler feature can be left enabled when hotplugging from a sink
> and mode that require scrambling to a sink that does not support SCDC or
> scrambling.
> 
> Typically a blank screen or 'no signal' message can be observed after
> using a HDMI 2.0 4K@60Hz mode and then hotplugging to a sink that only
> support HDMI 1.4.
> 
> Fix this by disabling the scrambler feature when SCDC is not supported.
> 
> Fixes: 264fce6cc2c1 ("drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support")
> Reported-by: Christopher Obbard <chris.obbard@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: New patch
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0031f3c54882..9e7f86a0bf5c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2117,6 +2117,8 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>   				    HDMI_MC_SWRSTZ);
>   			drm_scdc_set_scrambling(hdmi->curr_conn, 0);
>   		}
> +	} else if (hdmi->version >= 0x200a) {
> +		hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
>   	}
>   
>   	/* Set up horizontal active pixel width */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
