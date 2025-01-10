Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC0A08DFD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D95010F05C;
	Fri, 10 Jan 2025 10:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xF4ntAKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4672810F05C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:29:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso14167445e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736504882; x=1737109682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zCZielNEvwAThRhgDFA5SYEJEbjFNG70f0hqIs6TOIk=;
 b=xF4ntAKPijpJgereT5elceVPNy0LtdYua57JaWoabfPT1v8y1kBUtGLS2qq0Cokg3v
 YoNLH/pKusgxqqWOgn2LQf0JimZIPsxqK5NheQvQIlLRk7BpIa60V0KTUat1FXIco0a6
 6GLUK3f/bfnOHg9voKYGdCo5qurRTvZCY4FLjLh4f7x/KgKakqw5DxIwQ2SOOFIhjJzA
 q7hSUsM6MKzmaHnVyyN/vIjSAZ3rMn5vU2xaMtXhx1Ki9bFBw2hi/kt664Cux92dlegF
 wp+Rq9JRsHbjCtjQOOokfZXJaD/CQLnyxjtL1MwsiVIJL/peNqxvY+XJaSYq94iQ2C7q
 IajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736504882; x=1737109682;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zCZielNEvwAThRhgDFA5SYEJEbjFNG70f0hqIs6TOIk=;
 b=WVHHZ7oCIgE8S86GkgBb9/pMVONn+YZR+Ujt3ZNOVYQCI3hwEGu52yYXmW7T/RLpg7
 VdMEUzjN8brgZJJn9QQgmrybfacmTZby4UEkoSb5Y9XNWzdCKTbnA3wYCKh/pnGhZF+T
 S+28WgeCXsfNRG3TsWYu5PhX8S1RN816JQUK954jeiIWclqvp0LCM4Rxlfd3bJ12/fxA
 LjWDKtdDgmQgo7AhLTzDs/Z+D3fwraZ23YqWRLnuvirU/WApz3SC4DVJjSWdGtyvNVrV
 BB3By3NDKB3yYoUg0LTpwTd4oGaCYi6K+U9yqcOUye7nQzCDYuRvfubZJCaIIep3XIDN
 xCTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOoul54O+1lNLOVP0OQJHzrD2NAi5fAZkRV5p/dpJpZndZnTheh1Y54D2rZOCUsJ1RLGKhTWrBFu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvf1Nnnu3Q+gtH78bDpItxcr/gQV2xxCWbV3lPis65ezQTiV/y
 9trFgb4/C0zi2+ju2As2CCnkTcQv46F3wbAk6Z8HfYsUzmNpDVx6agpAzekADUk=
X-Gm-Gg: ASbGncuJrn+O2Gc5jfMXzEMBmpNqTvS+cW2V4bBLlrw4NTCnvKoBiVXve0/+L+zMjoM
 ge0PYMgadULIabneX0Qruw6kOw4+KtfjJjZDq8p27nxTnTZkVEb2P/SbwhQpk4B53IEx7CM7Xb6
 kzSZlDUEk8G4ylsm+nCVUIv75We/hv6sDcts6R9Sbp1Hi82xxrD/+e6G7pMjAkOAQ5ZNQdMUgmW
 PEzh59NSV6qNdjpLQ//4O//9C2lOnYjDx0YFBnIgEeBm7qlbmPGXfyDU0ZBudoH+WgWqiE75uKp
 RxFT2hI9MEDubKRqnie0buA4ljidXEwKIw==
X-Google-Smtp-Source: AGHT+IEWAXtoc4FGVRRCMGfOgQC8SKcUrndf6I8V5q8jJHswm7GhrgjZeArKBtXkaCCPoLUoyga6rg==
X-Received: by 2002:a05:6000:4023:b0:385:f7a3:fed1 with SMTP id
 ffacd0b85a97d-38a87336e53mr8841883f8f.44.1736504881887; 
 Fri, 10 Jan 2025 02:28:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8?
 ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38d008sm4274465f8f.59.2025.01.10.02.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 02:28:01 -0800 (PST)
Message-ID: <abad21b8-fb2b-4014-9e00-a4abcbc39c22@linaro.org>
Date: Fri, 10 Jan 2025 11:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-edp: Add Starry 116KHD024006
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid>
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
In-Reply-To: <20250109142853.1.Ibcc3009933fd19507cc9c713ad0c99c7a9e4fe17@changeid>
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

On 09/01/2025 23:28, Douglas Anderson wrote:
> We have a few reports of sc7180-trogdor-pompom devices that have a
> panel in them that IDs as STA 0x0004 and has the following raw EDID:
> 
>    00 ff ff ff ff ff ff 00  4e 81 04 00 00 00 00 00
>    10 20 01 04 a5 1a 0e 78  0a dc dd 96 5b 5b 91 28
>    1f 52 54 00 00 00 01 01  01 01 01 01 01 01 01 01
>    01 01 01 01 01 01 8e 1c  56 a0 50 00 1e 30 28 20
>    55 00 00 90 10 00 00 18  00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fe
>    00 31 31 36 4b 48 44 30  32 34 30 30 36 0a 00 e6
> 
> We've been unable to locate a datasheet for this panel and our partner
> has not been responsive, but all Starry eDP datasheets that we can
> find agree on the same timing (delay_100_500_e200) so it should be
> safe to use that here instead of the super conservative timings. We'll
> still go a little extra conservative and allow `hpd_absent` of 200
> instead of 100 because that won't add any real-world delay in most
> cases.
> 
> We'll associate the string from the EDID ("116KHD024006") with this
> panel. Given that the ID is the suspicious value of 0x0004 it seems
> likely that Starry doesn't always update their IDs but the string will
> still work to differentiate if we ever need to in the future.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/panel/panel-edp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index f8511fe5fb0d..b0315d3ba00a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1993,6 +1993,7 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
>   
> +	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
>   	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
>   
>   	{ /* sentinal */ }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
