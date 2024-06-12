Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA6904EE7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 11:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E321D10E7E5;
	Wed, 12 Jun 2024 09:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dUHrEf2H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373E10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:14:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4217990f8baso38344225e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718183656; x=1718788456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=C7+3ehk3k80azJprWFHz12j2AqrrZqNt2dQt3W1z4is=;
 b=dUHrEf2H4+sERrZIv9kk3siCnhqlOrzGVNmCK4qacZKe5mWyebSZondhmPQQtwMvNU
 p7oMR66wf+k6pveY+RKbX5TpMBlqwMq5xWDyCxmJthe7Jd9Z5rgdk/Hi0GdX3cEGDbkp
 HrMhojxZVudWnGadG1QNHk6Vgfk6bA+fLBB+6qpNAU6WXWnjIT5SB772bs15+bsFHbAa
 4Pd63ZNJTcnYEjl15ia1l79PoWIcakan7PR3E8W79TSeQNz1qd/VNo7CatnCMUjaogrL
 5yEpwppb+iYVAH5GY3FTJw82tVLmoIFl1v/eeTJb9DoQ8BCYDyd3CZk15S+EgLV2fODs
 uxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718183656; x=1718788456;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C7+3ehk3k80azJprWFHz12j2AqrrZqNt2dQt3W1z4is=;
 b=WkByZ8GrNoCg+I/TBUVvjahfrdhFwvtyDgqIoF+/M35rBGs1vAdC+doRBYeRJqYIYq
 mGeniQ+HXB72om/Exwu0lIQVUU8Rq9wfpEpPd6K/8r+FRBKjXU72PwJvFO4PVsOo+Rzv
 iRJsZW3ffJ4mk/wyul0C2C7bOzeBnNWJEXD0aLknM7q4zihWrnIioQ+QQ24szgsZf8oJ
 H7t7A3hLCJmROPk6JpzsAY+iND6dNTUS8yE48lVgGY8LumLWtioM8rGRZaiz+TCD7XEh
 sBj3iWsu4ev4rCTx05ghnnGC8Oi/YJoXo0ybmJozmd3mNk1gXS/m7NAQW4AfHD5zBF7A
 DlAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDH31QfWAIUSAzQwoVx4OeM/NmQxTYU6okUildHT+dnYK69ij4XMxMCXEnZr/jXH1EXqmAhXJNjNDzs6yV9nBL+ktw7N4IVVmG/uMRFADn
X-Gm-Message-State: AOJu0YxT2ZcrxxQiZyC7NqC8uq9wBSf82z9/pjFkHPcrGluS2SQAdPOj
 qN7AQWcken8WpKiZomLD4/78Ei+IuYWkevpg34npbjXNWHIR2ntKrlnCEUJj608=
X-Google-Smtp-Source: AGHT+IHSnPZLMh8nLBPj0z3mqsdUoaX11cJEjdktl0PSUl58lMC/iGQGJrtDX+Zk653q+mlvzvaJZQ==
X-Received: by 2002:a05:600c:1d01:b0:421:2df2:2850 with SMTP id
 5b1f17b1804b1-422865ad643mr9257465e9.31.1718183656306; 
 Wed, 12 Jun 2024 02:14:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229c60f758sm4633975e9.20.2024.06.12.02.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:14:15 -0700 (PDT)
Message-ID: <6c78b68b-cdce-493e-bd26-0329a61607c0@linaro.org>
Date: Wed, 12 Jun 2024 11:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel : truly-nt35521: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
 <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
 <uhnjrzii3ydzdsnhc54sbglpy46drzwg2m6if5ymid7gjabcvd@ppzdg6xz4xx7>
 <CAD=FV=WJdp0btifYjGLN5_bfGSEwcEM5nPv8M7872190T3uMRA@mail.gmail.com>
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
In-Reply-To: <CAD=FV=WJdp0btifYjGLN5_bfGSEwcEM5nPv8M7872190T3uMRA@mail.gmail.com>
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

On 11/06/2024 23:12, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jun 11, 2024 at 2:10 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, Jun 11, 2024 at 08:57:48AM -0700, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Jun 11, 2024 at 7:44 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>>>
>>>> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
>>>> mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
>>>> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
>>>> sony tulip truly nt35521 panel.
>>>>
>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>>      - Fix patch format
>>>>      - Fix code style
>>>>
>>>> v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com/
>>>>
>>>> ---
>>>>   .../panel/panel-sony-tulip-truly-nt35521.c    | 435 +++++++++---------
>>>>   1 file changed, 209 insertions(+), 226 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>>>> index 6d44970dccd9..5a050352c207 100644
>>>> --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>>>> +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
>>>> @@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt35521 *ctx)
>>>>   static int truly_nt35521_on(struct truly_nt35521 *ctx)
>>>>   {
>>>>          struct mipi_dsi_device *dsi = ctx->dsi;
>>>> -       struct device *dev = &dsi->dev;
>>>> -       int ret;
>>>> +
>>>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>>>
>>> It's not a huge deal, but normally in the kernel all the variable
>>> declarations are cuddled together. AKA no blank line between the
>>> declaration of "dsi" and the declaration of "dsi_ctx". It would be
>>> awesome if you could send a v3 fixing that. When you send v3, feel
>>> free to add this above your own Signed-off-by:
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>
>>> ...with that, the patch will probably sit on the mailing lists for a
>>> week or two and then get applied. Neil may want to apply it, but if
>>> he's busy I can do it too.
>>>
>>> I believe you were planning on tackling some more of the panels. Since
>>> you're still getting started sending patches, maybe keep it to a
>>> smaller batch for now and send another 10 or so? Probably best to keep
>>> it as one panel driver per patch.
>>>
>>> -Doug
>>
>> Do we want to delay this until the mipi_dsi_msleep() is fixed?
> 
> Yeah, that's a good point. I saw the mipi_dsi_msleep() problem after I
> reviewed this patch, but you're right that it should be fixed first.

Yeah it should wait after mipi_dsi_msleep is fixed.

Neil

> 
> -Doug

