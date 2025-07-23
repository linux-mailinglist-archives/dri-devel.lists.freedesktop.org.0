Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC7B0EB38
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8092D10E75D;
	Wed, 23 Jul 2025 07:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UyqH2OzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195710E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:03:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so63968405e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753254222; x=1753859022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=O/Mv9hJ7CADfZdG1vjDLpd9cy/jj2sy/v75wb10UpHw=;
 b=UyqH2OzYl1gqgVBNckbHXgxoWXkKXjiSProLCem2tJeEJoBhriCqTGPRHt1sEbHgBv
 UEdY5QNB/yT6SSmIdghSbGf3JUP38PRc+ArIVlzECAZvgeOFuX72DbqKRp0TamEpZmFd
 VKsyVpoFKAQh6QSjEvI/s/ywpbekwpE1vbloiId0WWQ2FGbzUosn5hspkwZfcDdWavTq
 PglDc3sVfCAkjsYnatv18vJSfEuopGtDRCPtcB7jkwSCcB1d04dYDIuqCwaNa47l9tXQ
 zDgZU9FN3NS0Qvd4VVudom/poQN2HAoKaoTdpIQrMCnJbzxsqq9/Hkty3+vymS/Y29Qy
 JYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753254222; x=1753859022;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O/Mv9hJ7CADfZdG1vjDLpd9cy/jj2sy/v75wb10UpHw=;
 b=S2NOF6FHkzb+9Zw42eWqOhwOL06wJmI9OJxCGaiYhJFKZEt1d3eil8TJ0n1FP5qfN6
 ww/Fa++5KiMDmXg/BG+ODnNnXKkiGbG8H7JrZiVsu8Crr2kwddhf8/ypQamq68XHvwdh
 6KBlSaVNLZsqjluhXXG5CWajZ5rNO5dggV3uzM7dK1qWGUqgo9j5qlFqf71ZGqm06zNP
 5t9v7XPRGzyPGvI7Jb0IW9BlWpNloKOopOLmDnLXi0btZvZH4mcd67C8zfWG848Uk42X
 tWshEeiUooWw4hyx3Rb8WyAUdRHNgymHTmXo/WpYUshKzdAXHCKaCVe6DYYzJ4UOZiuC
 IPkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVanT0rl9wkev4o70wOQE35/Q1K0jHxtbul0axW3uZ5hYRVdZd5Gv3DoQPXzp5YLEHUp/Px1IM/DM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3ni0cR+CX7LisTX1DhbWf9Ka434kX58uS7EjrurBcfjVtGchO
 RzgLfc5HLwPY7v6qYpzuKOFFQ1I83RG1ChLCArlV5yrrle7icuKj3urchJaORo+0S64=
X-Gm-Gg: ASbGncvMhJUTo7jWszQaxZbpD1x4XnoBFOFymla1g7rL9PVfnuws2EXxT2WO+rt+gdI
 ++psmlGWLfKIlPRCvFQ8I6ZQ6kq3BeawoV6uC+At2vVWARzki4uZi99UhdyfZEiY6ktHkbBG0q3
 WlRV+vHA087RpqpsmdcQrmHGD1QZa4gqZpL9z9V1tDK448J0yd1PV8N5j6kmliVGOy6CDzRTs5p
 djChkXznWNUK5kyRthxLjdXKAcQr0hNMRYRK4koq0bQoclykKz5Nu4cKIZnSnSyGiaJKLtS54iM
 VtCgSAagcHUqBRXRx1U86vxIFHdUV4gSuSIzsQPrEvjSfyfejWqpHtPvSlR+AOMytCLH1TrVVGg
 0R4ZGVrVCrKIOiPww4WCRnjhWvM6vM0+1p+Tqq757hOcXnCB+6iSjaTJ9yaC3eaIznSvplNWNKX
 J/ro2VbWDHIw==
X-Google-Smtp-Source: AGHT+IGS53ymu9qWaAuGjwDNEKZnmHcq4dCaL9RMrzf74MJb80sfF+LLy2tGg+h9gGlfS5OVufoOcw==
X-Received: by 2002:a05:600c:5185:b0:454:ab1a:8c39 with SMTP id
 5b1f17b1804b1-45868d2dfddmr11464645e9.26.1753254221959; 
 Wed, 23 Jul 2025 00:03:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294?
 ([2a01:e0a:3d9:2080:8813:2f0d:f9e0:5294])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458691993d3sm13152435e9.10.2025.07.23.00.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 00:03:41 -0700 (PDT)
Message-ID: <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>
Date: Wed, 23 Jul 2025 09:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
To: Johan Hovold <johan@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
 <Z_kB3jOH04-zFnym@hovoldconsulting.com>
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
In-Reply-To: <Z_kB3jOH04-zFnym@hovoldconsulting.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2025 13:49, Johan Hovold wrote:
> On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
>> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> 
> Please squash this one with the patch adding the user.
>   
>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -6389,6 +6389,11 @@ data-pins {
>>   					bias-pull-up;
>>   				};
>>   			};
>> +
>> +			edp_hpd_active: edp-hpd-active-state {
> 
> Please keep the nodes sorted by name.
> 
>> +				pins = "gpio119";
>> +				function = "edp_hot";
> 
> There is no "edp_hot" function on x1e so I wonder how this has been
> tested.
> 
> As I mentioned in a comment to an earlier revision this pin has been
> configured by the firmware as "edp0_hot".

With edp_hot, screen stays black with UI comes up, with edp0_hot it works again.

> 
> Since there is also an "edp1_hot" pin, this needs to be reflected in the
> node name and label.
> 
> Pin configurations really do belong in board files, but unfortunately
> this was not followed for x1e. You should still include the bias
> configuration (somewhere).

Which bias ? do this pin config needs an additional bias config ?

Neil

> 
>> +			};
>>   		};
>>   
>>   		stm@10002000 {
> 
> Johan

