Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301438284A3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 12:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF42410E3EE;
	Tue,  9 Jan 2024 11:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7316A10E3ED
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 11:19:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so2913430f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704799146; x=1705403946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=chfBbkQWFi3RkRvELDfeIygNC5jObvP1JNIy+u9NYiI=;
 b=u30hdPpFwmzrXPHl87bmr3vO0T62WbjgWZ1Hf9eZby4nN9SOBOmy6Eyd5xgnKwcKhe
 d9KfeIVtug2aPb/xIb+qHVhhkep0uLmmvEvLYTR+LrZnRVjz+tDSMZm842C/vFfJt4vG
 JQ8XGN158R6HgAXh9Q7cAdMt8IeJuD8rdtfb0Xq/tkgvkdpBP8QKIkMqXIZc0YOWWOfn
 2uSN7VeJjcqFt3L3UhKli0DRHQHrI9h2sB4TmkU500Z5Nxtu35JwSLwtd6/1SZtqOuQF
 xMwSqH9ulTmmVN3dHymZBmWUYj7Ngrw+z66Ea2XOmCoszkdo7ptrSM27DK9EyV06B2Gc
 ytMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704799146; x=1705403946;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=chfBbkQWFi3RkRvELDfeIygNC5jObvP1JNIy+u9NYiI=;
 b=s2Kf+wh0vLkndwHLnZBv5gb7AXcPqlaKoFsO4YiO8mVyp/iVK/ZJQ0loJsZiG5NeK1
 ch3SYxg0urxpSgTlXtA/jkp2FYvgqJE09rqo8aEOCaKbgPDexeal7sV5qM+W1Ex2X6Il
 HTCeNWwFcNsVQLtTlMQ64qWQ+/UoCvRaqHm7qRk/ty1QXyCCDkdjYHnR1h2jBRgr4QeP
 H8dFSaQu1Cf5weuHKF7Y1OvzztnerkTea/fIj1zJvxNA7p3kuBIppkkz3pnjGreL57yB
 Boq9HRMLxmOg796/rnyLT4KT9yuXVeIaUTxMupnE7OyLRZINm1NffzNW+6lWcpx+yt90
 RoPA==
X-Gm-Message-State: AOJu0YwKZniJHDgYiS3OVuf/7Bmw3Rx8QSQlshbBD/wrDbAEa2RuDIrX
 5tMTfv0qATflJsqdLGJS0tRrzfDfmAJQwzNNNPCNa8qpglx/sXMr
X-Google-Smtp-Source: AGHT+IEsZWXDG5nov5WgGdwrygI/N92ktso1pYJ/WeS1FwkcDt5mdmmfoNvhDk3tFn0aznqgxTrTuw==
X-Received: by 2002:a05:6000:10c5:b0:336:c963:25ee with SMTP id
 b5-20020a05600010c500b00336c96325eemr207146wrx.166.1704799145849; 
 Tue, 09 Jan 2024 03:19:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6193:3eba:f3ab:835f?
 ([2a01:e0a:982:cbb0:6193:3eba:f3ab:835f])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adfa38a000000b0033668ac65ddsm2152275wrb.25.2024.01.09.03.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 03:19:04 -0800 (PST)
Message-ID: <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
Date: Tue, 9 Jan 2024 12:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Content-Language: en-US, fr
To: Shengyang Chen <shengyang.chen@starfivetech.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
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
In-Reply-To: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
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
Cc: conor+dt@kernel.org, keith.zhao@starfivetech.com, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, dave.stevenson@raspberrypi.com,
 sam@ravnborg.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 jack.zhu@starfivetech.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 wahrenst@gmx.net, quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 09/01/2024 08:09, Shengyang Chen wrote:
> This patchset adds waveshare 7inch touchscreen panel support
> for the StarFive JH7110 SoC.

Could you precise which SKU you're referring to ? is it 19885 => https://www.waveshare.com/7inch-dsi-lcd.htm ?

Are you sure it requires different timings from the RPi one ? In the Waveshare
wiki it explicitly uses the rpi setup (vc4-kms-dsi-7inch) to drive it: https://www.waveshare.com/wiki/7inch_DSI_LCD

Neil

> 
> 
> changes since v1:
> - Rebased on tag v6.7.
> 
> patch 1:
> - Gave up original changing.
> - Changed the commit message.
> - Add compatible in panel-simple.yaml
> 
> patch 2:
> - Gave up original changing.
> - Changed the commit message.
> - Add new mode for the panel in panel-simple.c
> 
> v1: https://patchwork.kernel.org/project/dri-devel/cover/20231124104451.44271-1-shengyang.chen@starfivetech.com/
> 
> Shengyang Chen (2):
>    dt-bindings: display: panel: panel-simple: Add compatible property for
>      waveshare 7inch touchscreen panel
>    gpu: drm: panel: panel-simple: add new display mode for waveshare
>      7inch touchscreen panel
> 
>   .../bindings/display/panel/panel-simple.yaml  |  2 ++
>   drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 

