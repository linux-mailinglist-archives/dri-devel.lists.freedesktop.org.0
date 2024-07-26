Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35893D3D9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 15:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E6710E97A;
	Fri, 26 Jul 2024 13:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BwiRvHCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522A710E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 13:13:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so15403021fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721999629; x=1722604429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zh3vyC1WH4G3/hH1Lds2F5b/d+/by8NtQNhwTrmTrdY=;
 b=BwiRvHCIjtrfqWENoI+dYScv5vUhTN3pHClC1LDYmKqrmJw+zdzB9ZneSxo1KrU/es
 bMqeD4ynKOm+3VQsAaCIDq7KCBpKJP+TEOEzOJnZ4tmyOTVSk/Ts4Jsh/BPRY8OikHgU
 6aqxOIrReCqW5BifuBdtc6VYc/uGnwsw/2OhcbqLaDQAuXmizvb3eoj2e+kCeLXCbsMC
 lTXw/SdqHo8SA5KEQoL8SJkblMGHu0tYdXjirmN9kWPINpjlGkYbiZ3Inpe11+JKqnqz
 YAK+e4d93iYj/ZBSrnfJMRgpQDShNYYp7uoK02O/K293cbw7pXQPxCstdm0TaZ40LMrm
 BUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721999629; x=1722604429;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zh3vyC1WH4G3/hH1Lds2F5b/d+/by8NtQNhwTrmTrdY=;
 b=ETc5tBgY9sw4D6Iaj5hJjaB3l2PKvjoL8P5hTSUV67FCL3iPn+83PZokKZ6VONmsym
 A34C0kUF+y9S7cked44sSUhxZRK6xuNxFc6nanX83jKVTXnMnOt/SgEcmf1nsjEmzxE2
 n5LrOaOn6fSyEJNz0wBfCwGuc7k85M3M7B9pW3o7Ae/z2Caa7+nTi0pNDN3nsLe0QDOD
 p8MXl8VbakJ15HkvbhW7rWdoJyjcB8EnKWqHIdUOFkxu2lT4rrnlZlrlcVYxlkTbWGY+
 aJJIwGAEppbiV8tN2VjyugGX1xvHeJjQ6KjyRRuEjzfwGGN3imTHjJYAXZLDRNEwIvE5
 mG7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXibyXduB223xH6+5IRtME4SeZmq8B6VEp63ue+PReYMORptmQhZowZ+hv7V5VCwFqpUOyMMsQ8trOwWKdmkBl549q05HkgC85mIFXz4xUY
X-Gm-Message-State: AOJu0YyDhuEEOsZrCO+C9/d7CzXPb0Kg/DjIVTjPLo2MKpEiTgL/GoHy
 a13VQpEzo2xPmBQu/bzabFdvackjhmwBCkinkPEqhfxmTFNREguFvzvuJVTpYPA=
X-Google-Smtp-Source: AGHT+IHnthYvJSLZi9A6Pf8OaQCOFLwe8XfHMSX3Suyha+VZUk+mAsZml7xZkNIcx932RlRPoxus5w==
X-Received: by 2002:a2e:9f57:0:b0:2ef:18ae:5cc2 with SMTP id
 38308e7fff4ca-2f03db8e156mr37629931fa.21.1721999628861; 
 Fri, 26 Jul 2024 06:13:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:414f:cfed:daba:4cb?
 ([2a01:e0a:982:cbb0:414f:cfed:daba:4cb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280574a8a2sm80575835e9.23.2024.07.26.06.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 06:13:48 -0700 (PDT)
Message-ID: <d1bee4fe-03c6-427c-ac3d-7a33f1533ecd@linaro.org>
Date: Fri, 26 Jul 2024 15:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] mailmap: Add an entry for Konrad Dybcio
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
 <20240726-topic-konrad_email-v1-1-f94665da2919@kernel.org>
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
In-Reply-To: <20240726-topic-konrad_email-v1-1-f94665da2919@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2024 13:18, Konrad Dybcio wrote:
> Map my old addresses.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> ---
>   .mailmap | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.mailmap b/.mailmap
> index e51d76df75c2..d189c6424697 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -353,6 +353,8 @@ Kenneth Westfield <quic_kwestfie@quicinc.com> <kwestfie@codeaurora.org>
>   Kiran Gunda <quic_kgunda@quicinc.com> <kgunda@codeaurora.org>
>   Kirill Tkhai <tkhai@ya.ru> <ktkhai@virtuozzo.com>
>   Kishon Vijay Abraham I <kishon@kernel.org> <kishon@ti.com>
> +Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@linaro.org>
> +Konrad Dybcio <konradybcio@kernel.org> <konrad.dybcio@somainline.org>
>   Konstantin Khlebnikov <koct9i@gmail.com> <khlebnikov@yandex-team.ru>
>   Konstantin Khlebnikov <koct9i@gmail.com> <k.khlebnikov@samsung.com>
>   Koushik <raghavendra.koushik@neterion.com>
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
