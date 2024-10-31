Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159259B7798
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 10:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FE710E868;
	Thu, 31 Oct 2024 09:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KiA6TDRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5093C10E868
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:34:48 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so6381751fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730367286; x=1730972086; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=52187t9uJurq+P/uw4PiJkFFucVapnrqKoa1BJIfUH0=;
 b=KiA6TDRy8IQXQ7XOXVaHNkpf+FbivomihtSXzLplC4chByq2C/UP4heyo/jCZjixW/
 7OJxLL/iCtHu0s0K1MD72HcYxGHrhxTeYFRkWxqOy4zP09CKjjoXs4e4u+rqujZK+AjS
 SMeMBoZwukr2YYXnglPrvYIjfrZaakovR63dbPqpYavm21YxYAx4Vp2u4lWf5KzdSDo4
 0PpRyorxkK5rBoFuDvurzJToCV+kmiGjcIPtnBpTFRhyjInzZ0bG8JW9xnc/ywNPy+kJ
 3cHMbv9utbE339W1MOZ/DmZjB1tb+o7Roe+N5epIs6McA1OupV0geoZVd0cq5yLa/vkr
 1p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730367286; x=1730972086;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=52187t9uJurq+P/uw4PiJkFFucVapnrqKoa1BJIfUH0=;
 b=IOulRcVabsfwMo2f5acV6S4g0iL1yfzoe9woCqcLP7d4PrRVWwTxmkMaD8ZecF7ACc
 2tdGQwX6sHxycuzS6NJzXaddwV81FheAKdtOs6iNpn5qxlks870rJTadcMi0DgWUAIjo
 lfi6KJ21wupElj6Q6HRsO+Vj7wJbcir0fk+Q2L7Lv0ZVcS01mAyIM3Gw3ZsKYc1MBFeE
 4cwTUP5JHcZG/eXsN2mUmKgJWWOA+NI+93xsaVvczZe6qxUI/rKH3Ei84KVOhffBDgda
 GzDRb/Rx+caEpQr9+ariXMzPv64EmytzOyjb2AAbNwAyNllzah5vYJn/HRDJgJ2RVngy
 Jzlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSCjUiYdkuK8+fSxvVOPVplX1/MHDXDm4WkVmg85VLNzFZ1aoMWbnn1A6oxlZRl+a1QwkBKpg17go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4C9+bRjSBO8kgCtQeVDCIw9G+esAqG1ZTBHBH4udYSE/q1BJh
 w8CZZtGXFg/f3EFo6CHP3h3dj+Amg1AkO5XuKqN3xXLaI3ulc3C1PD0eDsvdZWw=
X-Google-Smtp-Source: AGHT+IE+HGfdUSlArgSClbSE11U6rFflXL9twTbhwG6MHRAZhapeIumH10fnNc6RWiXd8+UR6RJa5Q==
X-Received: by 2002:a2e:b88d:0:b0:2fb:3d86:d932 with SMTP id
 38308e7fff4ca-2fcbdfaea70mr88655391fa.12.1730367286373; 
 Thu, 31 Oct 2024 02:34:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514?
 ([2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7b50sm1568120f8f.6.2024.10.31.02.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:34:45 -0700 (PDT)
Message-ID: <ca083f58-eb6c-4cb3-85f0-b51c7509fe96@linaro.org>
Date: Thu, 31 Oct 2024 10:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>, Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
 <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
 <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
 <CAD=FV=WmPmroitmYL3a4pdw8ai2LiQpJ6=zYh0kUdqcp6463Rw@mail.gmail.com>
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
In-Reply-To: <CAD=FV=WmPmroitmYL3a4pdw8ai2LiQpJ6=zYh0kUdqcp6463Rw@mail.gmail.com>
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

On 30/10/2024 18:50, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 30, 2024 at 12:24 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> On 10/29/24 12:24 AM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Fri, Oct 25, 2024 at 9:00 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>>>
>>>> @@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h3146w_data = {
>>>>                  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>>>>   };
>>>>
>>>> -static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
>>>> +static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context *dsi_ctx, int page)
>>>>   {
>>>> -       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>>>> -       u8 d[3] = { 0x98, 0x81, page };
>>>> +       u8 d[4] = { 0xff, 0x98, 0x81, page };
>>>>
>>>> -       return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
>>>> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));
>>>
>>> FWIW: the above might be slightly better as:
>>>
>>> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x98, 0x81, page);
>>>
>>> That would make it more documenting that the 0xff is the "cmd", has
>>> fewer lines of code, and also gets the array marked as "static const"
>>> which might make the compiler slightly more efficient. ;-)
>>>
>>> Not really a huge deal, though.
>>>
>>
>> I did try this initially, but got an error because of page not being a
>> compile time constant. Not sure how I should handle this.
> 
> Ha, that makes sense! It can't be "static const" because that means
> that there's one storage location that's never changing and that's
> just not true. I tried to see if there was some way to make the
> mipi_dsi_dcs_write_seq_multi() smarter and have it detect if
> everything is constant but I couldn't find any way to do that. The
> __builtin_constant_p() trick doesn't seem to work with more than one
> number.
> 
> So I think what you have is fine then. If this becomes common I guess
> we can make an alternative version of mipi_dsi_dcs_write_seq_multi()
> that just uses "const" instead of "static const".
> 
> I'll plan to apply your patch next week unless someone beats me to it.

I'll apply it today so it can go in v6.13 :-)

Neil

> 
> -Doug

