Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14B905610
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CD610E8B0;
	Wed, 12 Jun 2024 15:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rKuaDqau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3710E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:00:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4217990f997so38162135e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718204411; x=1718809211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Jhh2/EbO+KzKdZ2Ceo1EYx6oUtTDKk/jJAIaFVIVoMI=;
 b=rKuaDqausEeWitJgUkBrNo4/ZqUi726UssObYCfWtt6VclRMJYyNVKLjyGL2zSo8/A
 F1A6TnXKwtCCR1zbblVRoiGXSm79SkWziXQR9Vbex8k9Hvuzf9lUNx2+CArJEEVk5soI
 Wti/Nd3gPhhwxpGMCrhGO7g54y1HrJ1G94skVv8RV/4+nFyriAcWThIKzfmFKKphaJwo
 42Txa6v0PteDfZcH+cY818XPgL1kwuDUQssrYgfPsZ37frrKeZtO08HVoxoyKUmfrj6b
 Bfiwifbfn7a57uE494dwGTdCiE+MgqUq9x6Vg63inoLndcmlMt3JFj7O80qvoPs7gOV5
 WBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718204411; x=1718809211;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jhh2/EbO+KzKdZ2Ceo1EYx6oUtTDKk/jJAIaFVIVoMI=;
 b=gDByrfWAj/msKsaYbfMOw+gwVM9zzrziTrX4H6TERQDFwL5m5m9W9fBr9p3wZ62+WU
 ZRSGwefwLmv7w/XESEZjT1J5Cgz7o8781RxknM1Tmi8NSaqQ9kOAdwvasIHpk7vwybFA
 F0ZfiExosxlfmZvJQCi3Xw9IZ2FxUUwYXQnPzuLn+qtcWTlOnprn/VGimT20tNIVd/iX
 5DdP+lbTw0vWOGF4ZkAvk1cJVGAY2Ftypiiq5gGp3SozvyY3SNY6gywFjWpzBXUSVtA9
 L70TrCPxGYNwka0nmNqAOTyMcyN8oNWwafkKYLGlZtB1ms1vzoNPupb87Amv+d2fdEhJ
 yJ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0oYslqK7s5lJi5VqYrXLiQ0WxMxYhGHbqUcOP1N+sU6W3QASwCUjskAnGqpjxc0nspVC6A8kQWyZXGpO53zhx5NjPGj37WR9LkMUaWEun
X-Gm-Message-State: AOJu0YxjXpQsxRHECDzv2lwC4CaUsDdVMlKI92cJP2vhcjZ3Rx+XECII
 8slPLzNTApicfV+L0sTOu5kXXyAnWkTnkXSXQUrS4mNcUHCyP1ZGcrQQBZShuDI=
X-Google-Smtp-Source: AGHT+IHYnEIUuKhHAo+YHne7cw1OEPvSnqErGK9eKY2wBCW7WO7/RuHH1cbOVIMAIN9kpXDkMQlCSQ==
X-Received: by 2002:a7b:cbc5:0:b0:421:2711:cde9 with SMTP id
 5b1f17b1804b1-422864af234mr18269665e9.22.1718204410921; 
 Wed, 12 Jun 2024 08:00:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870ebadbsm29401255e9.23.2024.06.12.08.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 08:00:09 -0700 (PDT)
Message-ID: <a29db79c-53ab-45a6-bdc3-b165475da0fb@linaro.org>
Date: Wed, 12 Jun 2024 17:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linus.walleij@linaro.org,
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
 <20240612133550.473279-3-tejasvipin76@gmail.com>
 <CAD=FV=VTEzSyTHm-YBwneBgpohK8uu460DER-GcsQWu-z9hJsg@mail.gmail.com>
 <9beb8011-cb0f-4694-87e7-d4c02de80cd8@linaro.org>
 <CAD=FV=Udsw=XCR204A8QGwVSAxyprLCrrOgmZf+pU+8m-7sQ0Q@mail.gmail.com>
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
In-Reply-To: <CAD=FV=Udsw=XCR204A8QGwVSAxyprLCrrOgmZf+pU+8m-7sQ0Q@mail.gmail.com>
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

On 12/06/2024 16:52, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 12, 2024 at 7:34 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 12/06/2024 16:21, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Jun 12, 2024 at 6:37 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>>>
>>>> ctx would be better off treated as a pointer to account for most of its
>>>> usage so far, and brackets should be added to account for operator
>>>> precedence for correct evaluation.
>>>>
>>>> Fixes: f79d6d28d8fe7 ("drm/mipi-dsi: wrap more functions for streamline handling")
>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>>> ---
>>>>    include/drm/drm_mipi_dsi.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Yeah. Looking closer at the history, it looks like it was always
>>> intended to be a pointer since the first users all used it as a
>>> pointer.
>>>
>>> Suggested-by: Douglas Anderson <dianders@chromium.org>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>
>>> I've also compile-tested all the panels currently using mipi_dsi_msleep().
>>>
>>> Neil: Given that this is a correctness thing, I'd rather see this land
>>> sooner rather than later. If you agree, maybe you can land these two
>>> patches whenever you're comfortable with them?
>>
>> Applying them, but inverting them, fix should go first.
> 
> Well, they're both fixes, and inverting them means that you get a
> compile failure across several panels if you happen to be bisecting
> and land on the first commit, but it doesn't really matter. I guess
> the compile failure is maybe a benefit given that they were not doing
> their delays properly... ;-)

Yes, and thanksfully there's a fix for the build failure!

> 
> -Doug

