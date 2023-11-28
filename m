Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D976A7FB419
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4E910E453;
	Tue, 28 Nov 2023 08:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26CA10E452
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:30:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b4734b975so13131595e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 00:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701160231; x=1701765031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UI9+225njmRZsv7a13t5KhvN35Dxdfq3Mcv8/7dVTvQ=;
 b=ua8DDie5FMeoxNwxzRVTkjJOJyrTQrIdBCgfJvqjicyhkJkBVmt4xVyN+lLnMFtk16
 sdWrrJfyWHVu3gyrkLIVIhd034dI3dKs51tCzQ9WmCUYGkCJYNmeMrh6hqSJdyYDrP+p
 cyWDUvx9mB/k4bXXq5b0epMoK8hkmPgfItB1Zb03T5kYWTS0yypRndq/g8EF+cUO35CL
 y/7IcJWuzoDLowZmiSiEkkxmqU93fy241iWZK8WP+O9r7pJ2whfc+kFcrokaDmSZjyeJ
 0rywknTCnla2LRuJD9acOoZ66IrdZ1ZhIhbh77kNCtfrSKUPF4fYuaomDWTSgnp0LXyj
 dnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701160231; x=1701765031;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UI9+225njmRZsv7a13t5KhvN35Dxdfq3Mcv8/7dVTvQ=;
 b=E0SwVcle3XEleK777k88yxzClKTM9jBHrBI6PtMlrEOU58hprMaRcv5ICgNqUO8f9l
 xLTWFaGdmrWTmZ9D4FqgRcFmH4MX1CM8Y0X3ST4Y7+J/wQcCDmTXg5B/zuQo6BKQg2+l
 untJ/3iGhR5gfXPF4rSrRBOmDujS+PMOdbD3XiOU5xNHrPjA/mt2fbjvUsJNfzJv/vBj
 6PwS9SPQGhZBDv8a1krACneE+whZ3DD3z/JOM3vUYfzSaqAcP8htzSbmvt0ZH5+5o2NT
 D1oXRDQmSfr44VGKtotnHdatUlDhGWECAIsvwsvvR4LG4CgF0ryq0UuA7NTcTcebHJlz
 sYmA==
X-Gm-Message-State: AOJu0Yycc7SlnRwLFfVurnyu4OoRVpyDFXJdRGfG9iSNmSZotriNSYOS
 8/mPgC41bqyi0MSuWpbBEWIToQ==
X-Google-Smtp-Source: AGHT+IFG4ZA6yx2M3SuXLBx5tg9XX22OhbiKLyWiaklFEpGLpkLApKcdMmQ84H3CIiYxHxq1JqlWpw==
X-Received: by 2002:a05:600c:314c:b0:405:95ae:4a94 with SMTP id
 h12-20020a05600c314c00b0040595ae4a94mr9142353wmo.5.1701160231062; 
 Tue, 28 Nov 2023 00:30:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b0040b38292253sm15217322wmq.30.2023.11.28.00.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 00:30:30 -0800 (PST)
Message-ID: <80be087e-0341-487f-b6d9-8772d7c6128a@linaro.org>
Date: Tue, 28 Nov 2023 09:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
Content-Language: en-US, fr
To: Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
 <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
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
In-Reply-To: <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
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
Cc: Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On 28/11/2023 00:36, Linus Walleij wrote:
> On Tue, Nov 28, 2023 at 12:25 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Tue, Nov 28, 2023 at 12:10:18AM +0100, Linus Walleij wrote:
>>> This series reverts the attempts to fix the bug that went
>>> into v6.7-rc1 in commit 199cf07ebd2b
>>> "drm/bridge: panel: Add a device link between drm device and panel device"
>>> and then it reverts that patch as well.
>>>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>> ---
>>> Linus Walleij (3):
>>>        Revert "driver core: Export device_is_dependent() to modules"
>>>        Revert "drm/bridge: panel: Check device dependency before managing device link"
>>>        Revert "drm/bridge: panel: Add a device link between drm device and panel device"
>>
>> To preserve bisectability, you should revert in the opposite order.
> 
> You mean apply patch 2, then 1, then 3 so the kernel builds after each
> revert?
> 
> Yeah that's a good idea, I don't know if I should apply these though, better
> someone else do it since I screwed up too much.
> 
> Another option is to just squash the reverts into one, that bisects too :/

You can apply them now, or tell me if you want me to apply them.

Neil

> 
> Yours,
> Linus Walleij

