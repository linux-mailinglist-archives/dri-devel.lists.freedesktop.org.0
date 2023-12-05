Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72100804C4A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AB10E496;
	Tue,  5 Dec 2023 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317E10E488
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:28:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso8436825e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764906; x=1702369706; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NFKSpKSrRWoXFYENkiq8+HWQ5Z6F7TKJoFhiU9QOe50=;
 b=J+Iq/5sfsjYRoy1mSgjG3XS6ghcmxTWPpUpKJ4zsgdLCzLs0EBVgUEoLTP0MRupgs8
 3uVztffbzNFFhuiHb0vqM4U4YPQZHrtk/IEEYOwAWT859BA8SeADjh0zHfUp1k5UWdqj
 nqoU5vMibNlVFDHKlEbkq3J2AZlwhFBp2Xe0YoEN2Y6M5d0eMphejI8pjthUCSY3kTTf
 mHg36mDIgeeGS7nK2h6W1zWptJtFGErTda9e9GO6LaQqtGwScNnNmx0YT0zsr625ltiz
 mJurGxCEJ7mkwPJ6owDi+NWQOduOaXzgU1F89SNNWi1kFlhkHPJt3PBWzDnm3lazgXSO
 6OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764906; x=1702369706;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:from:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NFKSpKSrRWoXFYENkiq8+HWQ5Z6F7TKJoFhiU9QOe50=;
 b=CEuyxT+sKj7tRI0Z96TgBFo+XW1PWFfMe42yCJ2FUPZ4UwrRwC1j1uV+YnhRBOtotZ
 UsUSyo/UGT/8CfEyuSyClo7kz3g1I781WFu60rCLKuw5poY6mZ/Dx6xCx3U1J0On8lni
 3iJlKfppwKrxFSY+Y5Bd4L3Epi+GmNsuco9ZmwE+02wkLAbRNAv71hJew8ocPIOP3Wnf
 dlxfZGl5hDLx0j/mBKdTtUETNbR8qTXrSeEIvNUBRPffToCxAZnoVGPvW/nZjsh75yeC
 6MUQQLxzjHB5IqF9tBFO77+Uw1kgTsCimorpEDzA2gSCV7GBuIGpw7HUV7Ip4LkdNkAc
 EycQ==
X-Gm-Message-State: AOJu0YzPh3nk5Kulq3t95pFm2jUMWADZeMoMoSC9PaOymucw8G8XISly
 YAMurrODaw9EFVwNMRL9GZHIAg==
X-Google-Smtp-Source: AGHT+IHYiYh03gF0HR7CFXPhKVhJzy9KsD1yiXJ0hCAKQRDxLuSaDr/vOiQCjfOHYK/99proMO0sbQ==
X-Received: by 2002:a1c:7315:0:b0:40b:5e21:d341 with SMTP id
 d21-20020a1c7315000000b0040b5e21d341mr254803wmb.74.1701764905895; 
 Tue, 05 Dec 2023 00:28:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b0040849ce7116sm21619517wmq.43.2023.12.05.00.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 00:28:25 -0800 (PST)
Message-ID: <f93acb2c-0871-469e-9744-60e52f4b9918@linaro.org>
Date: Tue, 5 Dec 2023 09:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
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
In-Reply-To: <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 sboyd@kernel.org, sam@ravnborg.org, mturquette@baylibre.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2023 09:26, Neil Armstrong wrote:
> Hi,
> 
> On Mon, 04 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
>> From: Chris Morgan <macromorgan@hotmail.com>
>>
>> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
>> console.
>>
>> Changes since V1:
>>   - Corrected a bug with the DRM mode flags for the video driver.
>>   - Adjusted panel front and back porch and pixel clock to fix
>>     issues with display that occurred after correcting DRM mode
>>     flag bug.
>>   - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
>>
>> [...]
> 
> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
> 
> [01/10] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8c2c5d1d33f0725b7995f44f87a81311d13a441d
> [02/10] drm/panel: himax-hx8394: Drop shutdown logic
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e4f53a4d921eba6187a2599cf184a3beeb604fe2
> [03/10] dt-bindings: display: Document Himax HX8394 panel rotation
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=be478bc7ab08127473ce9ed893378cc2a8762611
> [04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a695a5009c8fd239a98d98209489997ff5397d2b
> [05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=00830a0d8f0d820335e7beb26e251069d90f2574
> [06/10] drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
>          https://cgit.freedesktop.org/drm/drm-misc/commit/?id=38db985966d2f0f89f7e1891253489a16936fc5e
> [07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
>          (no commit info)
> [08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
>          (no commit info)
> [09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
>          (no commit info)
> [10/10] arm64: dts: rockchip: Add Powkiddy X55
>          (no commit info)
> 

To clarify, only patches 1 to 6 were applied to drm-misc-next,

Thanks,
Neil
