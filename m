Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819577F151
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F87510E1AF;
	Thu, 17 Aug 2023 07:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34BF10E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:36:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe8a158fcbso54265935e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692257787; x=1692862587;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Yzl7a8+5IB1CNHhOEs5Xg8hAGghVtGCOILuPNKubrt8=;
 b=c33daJrNcMkRXznZKdv2DaruMd9SfyjQJw497nfC6uKkCh+yHPHptVCFv2wmoWvGT7
 R6BZR0dei5Cs1abELQml4flPhR5En3S5RdV6DlvAVVxooi5fBFDZykS1O0o89uCAj8dg
 N/Z+YnJVaEkZRxkU79o7fYx7R0ONvAOyfj6Ok79PErJE9Hbr8s09tYj7rPyR+KRg8oGA
 RLnvVoz49WsJqppek7Pm0gObh3BcwmG3dx60b5MYnT3SwTs24w6ghSu3stiHsk+q4d52
 twnLFS+TB+1ueWVaX47bfzdeOiLx0rsgBVpSp2U6DWQqjw/RShdX6KRY5quv4goIfTdS
 Cr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692257787; x=1692862587;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Yzl7a8+5IB1CNHhOEs5Xg8hAGghVtGCOILuPNKubrt8=;
 b=KzatjHz9ifpCpd/w6FY9vtVf+rOQfHzCZldp4pTCZNmROYv7IzN1u4Heud4idijgJW
 901zMSOz4BxihWjuEmniPPSwSxWJJxCNFH8ey9nneeyZzYp5VbwxDyFScCIMOPtAOoMf
 7bwbtVYgCIBHxoct486nWxqEBQ2U+eCNDg3BRb/6K0HbnDpy/FboMHJagKPgHKzerK1e
 Ab8EfhOF8X4y4wcTuzEEUOn9Bf9iL5D9dpnwIXRGhiNnia+xP7Jza8+mZ0aaobhXuJXq
 WAXg7/tqS9SFCiVoAty5ybJjPS+py5014ZtDR1fl4YgZYL3SKc2qLZXwuzN4mlGud+Ya
 /yhg==
X-Gm-Message-State: AOJu0Ywpa4xl2lJ4D0Rr1kJozELv/TdRT0k7bYnOB7DHD+yLlvU87sem
 pydatV4tZZ/dSOM4KLwBaqlDCw==
X-Google-Smtp-Source: AGHT+IEOLxMwaD7hbBhWrxMgxFZgbRUO1WyMzPWmahh5d08G8G9qEnl/I6A5h3OhYygqWUUVFWNliA==
X-Received: by 2002:a7b:c3d8:0:b0:3fe:2079:196c with SMTP id
 t24-20020a7bc3d8000000b003fe2079196cmr4298579wmj.16.1692257787387; 
 Thu, 17 Aug 2023 00:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f7e5:5c44:e391:5ae8?
 ([2a01:e0a:982:cbb0:f7e5:5c44:e391:5ae8])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003fa95f328afsm1920413wmi.29.2023.08.17.00.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 00:36:26 -0700 (PDT)
Message-ID: <ed7ced8a-a117-4d07-810f-a994b764248c@linaro.org>
Date: Thu, 17 Aug 2023 09:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Content-Language: en-US, fr
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org
References: <CGME20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2@eucas1p1.samsung.com>
 <20230809145641.3213210-1-m.szyprowski@samsung.com>
 <169175865996.293502.7367123633298049810.b4-ty@kernel.org>
 <daa749eb-fd67-b4b6-ffde-ab779547259b@samsung.com>
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
In-Reply-To: <daa749eb-fd67-b4b6-ffde-ab779547259b@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2023 08:06, Marek Szyprowski wrote:
> On 11.08.2023 14:59, Robert Foss wrote:
>> On Wed, 9 Aug 2023 16:56:41 +0200, Marek Szyprowski wrote:
>>> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
>>> doesn't report empty level of packer header FIFO. In case of those SoCs,
>>> use the old way of waiting for empty command tranfsfer FIFO, removed
>>> recently by commit 14806c641582 ("Drain command transfer FIFO before
>>> transfer").
>>>
>>>
>>> [...]
>> Fixed formatting warning related to commit message syntax.
>>
>> Applied, thanks!
> 
> Thanks for applying it, but yesterday I've noticed that this patch has
> been dropped from linux-next for some unknown reasons. I also cannot
> find it in today's linux-next (next-20230817):
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/gpu/drm/bridge/samsung-dsim.c?h=next-20230817
> 
> Any idea what has happened?

Rob applied it too late, the last drm-misc-next PR was sent before this patch was applied,
and the dim process (https://drm.pages.freedesktop.org/maintainer-tools/index.html) automatically
merges drm-misc-next-fixes instead of drm-misc-next after -rc6, drm-misc-next-fixes is aligned
with the last drm-misc-next PR before -rc6.

But the patch is still in drm-misc-next since it never closes

Neil


> 
> 
> Best regards

