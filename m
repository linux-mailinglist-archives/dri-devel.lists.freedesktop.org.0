Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945CA7DAAF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 12:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725C89FA5;
	Mon,  7 Apr 2025 10:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nk+j4t4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F93389FA5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 10:04:00 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso19456465e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744020239; x=1744625039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=s9HinkExaT6RLhQRIBbCS/ciYHS6bDl1MnAwf7+W0T4=;
 b=nk+j4t4dHzEDFX1N0ujudWyPAzwxN0dC34Me+wOYh6spQhaioveKs1o6iVWj/c2RhU
 DITHoVT0py7RmsBVJL6DfTc5GyiEwBviBD2X8JBXPfcJ1A21sFp4nXPs0ucLo3r0JLyf
 sakxacd6q1jQYqbVRB3DAXR4tu5gmYnOAyFmwa2YZO1cBBqopm2n1QR2cu5dqpWfrxFA
 0fsqGzHRTiTRLY31Q3zI/kOV9GbsQK6iE5ZbKfZEalNFFk5s6qoMHR6SpP/tmATq4O67
 blCBL1pk6sCTjXP2anZxnjF8DczzM/drf+P/RvbOXzwPSkRsA3EU17MerfxiecsIcVg/
 Eztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744020239; x=1744625039;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s9HinkExaT6RLhQRIBbCS/ciYHS6bDl1MnAwf7+W0T4=;
 b=VBDi4ygxSM4cJ5Wlg26IX+DcXBmOZ8gVezyKGtJks7kMSB8Y9K+ZtHfGu0JPn6vTfA
 Ipq9qCye7B7l9rdnbAI0tQWBSW8kndtizEjWr2/1MpsMs0gAuxmr4CB5AJjFIrkw77ke
 B2G2tcq305JiGsSjoDwtINpUFfH79MPpgrnbXOcq0tyaHGUzJ9o5kWCdFGTOZdcvm0OH
 mEFBu1KOy3JKnwDbMfz5NfKKpoitfh8bq2bD7tFwiSi8x5XKuWlI1+WgSb24Qx5+C10b
 Oxx0so1Y6HjENnbLwhqcDl30LSMPjYk5e3ui0Sv0rOjCmg9fnDxINA+hZvcguwJnkBjR
 4iIg==
X-Gm-Message-State: AOJu0Yzx3ljtzcEzQ4Pg0LWa5NuhRHy87ThqtAg37dfDMLzb2Z/16AYX
 SVYvEdZ/rQMgCgwlBnF6+auQeN3rNi9/svqlNCMqUa5ixzHmdwFw1PbHU6HW+9c=
X-Gm-Gg: ASbGncv2xXz6/Kwdia0Fc6eFsf+jI7f7KuajKsAZep1pxS9/HPUqFwNo42xvDgipV+Z
 ZfpQ3jIZ0PPW9CDxxxvuwQc6+OtionJKPEcIjVEXTgCsAohtC26S4kWK2IDv3TH3QRs+xNk6Hfk
 ONcRCSKYEaB/fSPoMV3nt+vMAl8bo6IAAXEYHr1FTUbSXU7qakHmq+5lCCLuoZsfQ3LAFGG3xoA
 bcnuzW/lck7D4zdZDDCLvrvDcRH1o2GNNYsTTkL6gj0NZ4B8CffWvQrJiuYMZAb1jQ/hXnIDdDr
 pFfVZoSyXXQXwJXxPeN46jzyQ1OopDKgXLLo2Isv7mIOssFl5srxqSlsawxjTZU7+MeV/4UDAqZ
 cHlcweXiRa7/Ns9uDdEHllQ==
X-Google-Smtp-Source: AGHT+IFEBXP8z3vBW8Gz6AOncAEfHt9xZOag+3XoHAxfL5+aQNCPhWcFTfnqF67fNk0u+70yvCBGWw==
X-Received: by 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id
 5b1f17b1804b1-43ecf8cf6b2mr133861595e9.15.1744020239130; 
 Mon, 07 Apr 2025 03:03:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605?
 ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301ba17csm11679985f8f.58.2025.04.07.03.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 03:03:58 -0700 (PDT)
Message-ID: <69543597-5e7e-454a-b83e-dd169a95baca@linaro.org>
Date: Mon, 7 Apr 2025 12:03:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/46] drm/panel: Use refcounted allocation in place of
 devm_kzalloc() - Part3
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Markuss Broks <markuss.broks@gmail.com>,
 Artur Weber <aweber.kernel@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Janne Grunau <j@jannau.net>, Michael Trimarchi
 <michael@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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

On 03/04/2025 22:20, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> Final set of drivers.
> 
> Part 1 of the conversion : https://patchwork.freedesktop.org/series/147082/
> Part 2 of the conversion : https://patchwork.freedesktop.org/series/147157/
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Anusha Srivatsa (46):
>        panel/orisetech-otm8009a: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm67191: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm67200: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm68200: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm692e5: Use refcounted allocation in place of devm_kzalloc()
>        panel/raydium-rm69380: Use refcounted allocation in place of devm_kzalloc()
>        panel/ronbo-rb070d30: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ams581vf01: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ams639rq08: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-atna33xc20: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-db7430: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-ld9040: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d16d0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d27a1: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6d7aa0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3fa7: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3ha2: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e3ha8: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e63j0x03: Use refcounted allocation in place of devm_kzalloc()
>        panel/s6e88a0-ams427ap24: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-s6e8aa0: Use refcounted allocation in place of devm_kzalloc()
>        panel/samsung-sofef00: Use refcounted allocation in place of devm_kzalloc()
>        panel/seiko-43wvf1g: Use refcounted allocation in place of devm_kzalloc()
>        panel/sharp-ls037v7dw01: Use refcounted allocation in place of devm_kzalloc()
>        panel/sharp-ls060t1sx01: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7701: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7703: Use refcounted allocation in place of devm_kzalloc()
>        panel/sitronix-st7789v: Use refcounted allocation in place of devm_kzalloc()
>        panel/sony-acx565akm: Use refcounted allocation in place of devm_kzalloc()
>        panel/sony-td4353-jdi: Use refcounted allocation in place of devm_kzalloc()
>        panel/truly-nt35521: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-summit: Use refcounted allocation in place of devm_kzalloc()
>        panel/synaptics-r63353: allocation in place of devm_kzalloc()
>        panel/tpo-td028ttec1: Use refcounted allocation in place of devm_kzalloc()
>        panel/tpo-td043mtea1: Use refcounted allocation in place of devm_kzalloc()
>        panel/tpo-tpg110: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-r66451: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-rm69299: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-rm692e5.c: Use refcounted allocation in place of devm_kzalloc()
>        panel/visionox-vtdr6130: Use refcounted allocation in place of devm_kzalloc()
>        panel/widechips-ws2401: Use refcounted allocation in place of devm_kzalloc()
>        panel/xinpeng-xpp055c272: Use refcounted allocation in place of devm_kzalloc()
>        panel/s6e88a0-ams452ef01: Use refcounted allocation in place of devm_kzalloc()
>        panel/nec-nl8048hl11: Use refcounted allocation in place of devm_kzalloc()
>        panel/panel-lvds: Use refcounted allocation in place of devm_kzalloc()
>        panel/lg-lb035q02: Use refcounted allocation in place of devm_kzalloc()
> 
>   drivers/gpu/drm/panel/panel-lg-lb035q02.c                | 10 ++++------
>   drivers/gpu/drm/panel/panel-lvds.c                       | 12 +++++-------
>   drivers/gpu/drm/panel/panel-nec-nl8048hl11.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-orisetech-otm8009a.c         | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm67191.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-raydium-rm67200.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm68200.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-raydium-rm692e5.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-ams581vf01.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-ams639rq08.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c         | 11 ++++++-----
>   drivers/gpu/drm/panel/panel-samsung-db7430.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-ld9040.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d27a1.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c         | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 11 +++++------
>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c            | 10 +++++-----
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c              | 11 +++++------
>   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c          | 10 ++++------
>   drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c            |  8 ++++----
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c           | 10 ++++------
>   drivers/gpu/drm/panel/panel-sony-acx565akm.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-sony-td4353-jdi.c            | 11 +++++------
>   drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c   | 11 +++++------
>   drivers/gpu/drm/panel/panel-summit.c                     | 10 +++++-----
>   drivers/gpu/drm/panel/panel-synaptics-r63353.c           | 11 +++++------
>   drivers/gpu/drm/panel/panel-tpo-td028ttec1.c             | 11 +++++------
>   drivers/gpu/drm/panel/panel-tpo-td043mtea1.c             | 10 ++++------
>   drivers/gpu/drm/panel/panel-tpo-tpg110.c                 | 11 +++++------
>   drivers/gpu/drm/panel/panel-visionox-r66451.c            |  9 +++++----
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c           | 10 +++++-----
>   drivers/gpu/drm/panel/panel-visionox-rm692e5.c           | 10 +++++-----
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c          | 11 +++++------
>   drivers/gpu/drm/panel/panel-widechips-ws2401.c           | 11 +++++------
>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c         | 10 ++++------
>   46 files changed, 223 insertions(+), 257 deletions(-)
> ---
> base-commit: de04bb0089a96cc00d13b12cbf66a088befe3057
> change-id: 20250402-b4-drm_panel_mass_driver_convert_part3-9b06bf9d3b22
> 
> Best regards,

With the patch 41 build failure fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
