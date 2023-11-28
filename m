Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805627FB6A2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475710E477;
	Tue, 28 Nov 2023 10:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0C810E476
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:04:30 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so1603531fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701165869; x=1701770669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=uqZNlYO+4fXm1Z4ILbIvuuTtMTy9j6l7hH3PusjR6BQ=;
 b=C1LeI5hhnBm7dyl19byKNhfSsDPg7RvBW9rf7GI+F1l9fpJYXBAtXKHceVWZWQFv2e
 6XzRqZmfG5lRUiuPF0q6RIOhYrn8//eAYubxeQKTSo4jG0CLcuM7s83HAoZIaPNHhylM
 p5GmB3HYD+R1pxep1sw/0oDNEw/kdyv6LoGPjma9lWMGo9w4Z07LHLpfLui2Bq3m8qvt
 tWkntTgGpWu03y/JqKQTYlnaQxJC+t21ahm9/TruBJvCk4d/s+/5LFEQZka3kqlB288O
 2YUC6liLqwqDnncrBMzuKLI8+H6WfHNvbcNW9UjEleYZAaKhZt6cUrRW1rcwUn2/qGdg
 C7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701165869; x=1701770669;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uqZNlYO+4fXm1Z4ILbIvuuTtMTy9j6l7hH3PusjR6BQ=;
 b=RYEl47N0FTPC0q7agSAYgNIsqtjZltTT2COx3xJHH8Le2rVjFuq7kXzYHOSAkZ4jFQ
 Hz1/ZPhbU51QCdMgG9a7bfqwZCodRMiLuT3rO1gA8P/n5h8NT5t/jPr49V+jUkb/2E6c
 CLcuAvjyc/2CV4Hlwd38KYyAZbmlMHnSoEzamwBhXYT6CXgz7pSIDNVk41aWXOTGLoAa
 SXg86IzgCEBRyGfi8ab7o4WVtUB9wJmfdsflsSurbubIn+xYGVSaleVk55/6t5rD+yth
 3yTiB6OoaJ7FYHKFipBvfy8xnLbDmQrz8NSQenp/ooLO5EKR1DGb+Z3oynA+JScUJ8ZE
 cNTw==
X-Gm-Message-State: AOJu0YzJYfvFxj0L1cBII46h5shpOLyR23PodmROldkoJIEQfX7+Q3vC
 0ZCTHKcfCS2waU+RafjISoTFkA==
X-Google-Smtp-Source: AGHT+IEtwDkK+p/g3380X9UdQJDrGWwB3mLB36GDGD9BTyNpm+IlezcMvViInhOwqMgnmPIm1BWDQg==
X-Received: by 2002:a2e:a48b:0:b0:2c9:a0c8:b688 with SMTP id
 h11-20020a2ea48b000000b002c9a0c8b688mr4227270lji.26.1701165868753; 
 Tue, 28 Nov 2023 02:04:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a05600c4e4f00b0040b40e3f877sm10329497wmq.6.2023.11.28.02.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 02:04:28 -0800 (PST)
Message-ID: <4e7ff29e-3cac-429b-932e-c9c79a319d4b@linaro.org>
Date: Tue, 28 Nov 2023 11:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/3] Revert panel fixes and original buggy patch
Content-Language: en-US, fr
To: Linus Walleij <linus.walleij@linaro.org>
References: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
 <20231127232542.GB25590@pendragon.ideasonboard.com>
 <CACRpkdYWjHbgWQc46hGM3bg+5nf4NiveEZJmHrnx0X-=XsUDLA@mail.gmail.com>
 <80be087e-0341-487f-b6d9-8772d7c6128a@linaro.org>
 <CACRpkdZmowhDhCgnEYokjQC8T0930ZKEr18f5ZsM=ZmD0PDGig@mail.gmail.com>
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
In-Reply-To: <CACRpkdZmowhDhCgnEYokjQC8T0930ZKEr18f5ZsM=ZmD0PDGig@mail.gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/11/2023 10:34, Linus Walleij wrote:
> On Tue, Nov 28, 2023 at 9:30 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> 
>> You can apply them now, or tell me if you want me to apply them.
> 
> Please apply them Neil (to drm-misc-fixes) order 2, 1, 3 for bisectability.

Sure, doing it right now.

Neil

> 
> Yours,
> Linus Walleij

