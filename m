Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD999615E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977BF10E670;
	Wed,  9 Oct 2024 07:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i59JT3PN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAC910E670
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:47:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-37d39d9f782so367656f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460072; x=1729064872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6d/wEUJmoAyjx81Rr68K4zml6B0H5nLhQoMhNeac2Go=;
 b=i59JT3PNxyUERA6D1bWlozD14qGbL7ymsewtRsAM6JnNpM0gDGx9ILt3LqpeIbclm1
 vAtF3e15Mc9bmGWh+b3BOO8h43lPf865oVX55hKER1CG1j+sZxh00XA8cAzmMi3ioN26
 oJFZK8b8Ytb0OafxUrfFCemCqY3DSYPiFL7eFSGaOs7m3owh16kXASiRrSB/aQEYKuTD
 XGo5PR86NPVBfirCCQNe1u3cOfaBtDzxZDbaxyMYnKpKp8hYh04CaI8LZ/dNRcWDXWGu
 YHtVKNE9JDM8rN0jkBRtfj9TLVgm1KYAYQKnxMFXXJIhHK+KZVSd2VK2TX75Ev2Yiuey
 bbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460072; x=1729064872;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6d/wEUJmoAyjx81Rr68K4zml6B0H5nLhQoMhNeac2Go=;
 b=Oa+eStwh2r+TYUqQRtSMfL/OPO3xtC6RSeXSdHj2SVXRhfH/ayjT4nS9mMaXwripJl
 eOQ5mZ6oYUtPPCG8MyDtweaaHohB4+UqsTbU0nS/5wS8O9SULimjUsI/wOcNRgkfKZaA
 edHBXqFQvn3aGkrggW87adrwNLJKVCsl2Yj3oKATPOFKnck0WOre/YM8Sz/NW5VQLgQq
 PaL2bfmPZ5x14C+yc4PXPH+S5Ei4IypctM1trYkXiU+Mp350Am4rrfSGcHwLGzbDAuCZ
 5zHITewoEEjq7DyidcDqOYX7eW+4bOt094dGV2WK6rqBEfunuILJs6kC/pwCxITT3TW/
 ZxOw==
X-Gm-Message-State: AOJu0YzCTX9He8DdCwDQWmA0V32twjAa95XIcosJjuvhq5E60aTpE6T/
 qRr72DH8yOcQVr5T9fjJJuG/QhxHUr24UjIzRPSvietvrTd6qPSkDoBlAYaEgI8=
X-Google-Smtp-Source: AGHT+IEvrnhIoAuMTon6xqmvCaAZoTWYymMHH2lK6WFOt4s+0AuzWuqn1dU2NJTUF+byVEcH1O0HGg==
X-Received: by 2002:adf:fa46:0:b0:374:c269:df79 with SMTP id
 ffacd0b85a97d-37d3aa413e5mr783367f8f.22.1728460071858; 
 Wed, 09 Oct 2024 00:47:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf?
 ([2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d39cb1358sm1208476f8f.25.2024.10.09.00.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 00:47:51 -0700 (PDT)
Message-ID: <2d6aa5af-f4b9-4585-9ed5-8ae4abd9e4af@linaro.org>
Date: Wed, 9 Oct 2024 09:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_0/2=5D_drm/panel=3A_ilitek-ili9881c=3A_Sup?=
 =?UTF-8?Q?port_in-panel_180=C2=B0_rotation?=
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
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
In-Reply-To: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
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

On 26/06/2024 16:40, Philipp Zabel wrote:
> The Ilitek IL9881C controller can rotate the image by 180°. This
> might be desirable on devices with their display mounted upside down,
> that don't have rotation capability in the SoC display controller.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Philipp Zabel (2):
>        drm/panel: ilitek-ili9881c: Explicitly set address mode, allow 180° rotation
>        drm/panel: ilitek-ili9881c: Report subpixel order according to rotation
> 
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240626-drm-panel-ili9881c-rotation-54d53a885d7c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
