Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C085155A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662C10ED85;
	Mon, 12 Feb 2024 13:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XQCadbS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173910E706
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:36:11 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-410deab9c56so5014545e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707744970; x=1708349770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=74ExFZRZ6onRvv/q7DNU+xV1ydzYGkcZ6r0iw+QAiOw=;
 b=XQCadbS7K9B40kaZRiWea5cl1fYgEiE3pP3ESQr/CVuWKl5nOxoWWjGV65NkNUuZcp
 Fcji9WLLMC28dmHEHidGLLFBu6hm9vDDPcXXSQNW6tTqcIOPBpuqLwonT7qe/jYqtXgo
 +y1a7q/9mFAj01wmTE6hbrWL5MkqoJ99xopPpTmci2rwjKmwzCyyL/xGTzGPTduwJ+mK
 gkQ3y41V5cxd9qPGEyzjy/awWxKCIGXS4l/zm0+9d/5JfT2JtwW3grMFiayPT9zCt8xu
 XSo9zhbBWAOrfhgygtvftNHLHVkf9FRwvlHzDh7kkrplGKoJKK5CE/eqiuYDEp9VhvwN
 cMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707744970; x=1708349770;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=74ExFZRZ6onRvv/q7DNU+xV1ydzYGkcZ6r0iw+QAiOw=;
 b=fPkzrCVAcyHkyd3Veq/AkqzQbVy3htDUb4f3HMTDar2Yj+uQAMJJkiBtzRZqi+hifP
 3QvjkoRJnJMTe2W5Tk+ypMZtXgLUTKSaoYZuHwCu0mwhJ+YPp81ZEVSnALU6cI1EmWV9
 rmfSojZGFBxFROqOB21efT8mMshdh4d7nR8sRv/rfdKTWMO8v+GrthZgs53q5mD90w9o
 psM3KQQtnxNECUmc/GKsAJtO/TSoRPFuJBSN/zU0khAxG6eCOCLcnR+o16peyh9hNwIR
 A18QuYyiEjZqa/GlBuP9gFy7c/duHTEmS1vhed2GWFUDa6QXa/inz8ztj2IhxTyvidaq
 +PFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXTTQ/Mr36PaaJgnW7OFyvnb64pXBVI0b0inTBiVFIIHtfXrhjm7YtIjLvkX5di7mWxdAOjJ21L++lO6aDNL1o/UoTyI1xVNFu57TZU2U/
X-Gm-Message-State: AOJu0YxG3IQCahAXCzM29VzD/iMHZWem7jElfxHUiLo4lBY1qjTPOw1d
 8VbA2Uu9c8UI0q8Cn37wLHr2D1cgQXqKXqEb/pPNy7pgnZMELvZaGiYE1iAKwcY=
X-Google-Smtp-Source: AGHT+IHxiOespFpZaN9WenVMCi5tYoRC71Rge5Y/lysp6dckeGcJpXUwPmAH8chS3wwMFs1t7xyxGw==
X-Received: by 2002:a05:600c:1d07:b0:410:cf4f:68e1 with SMTP id
 l7-20020a05600c1d0700b00410cf4f68e1mr2395117wms.2.1707744969631; 
 Mon, 12 Feb 2024 05:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCgnvirB9i9+S1u6JvMGnDSR/MdRPev3xT/whgmQ3kVizbkAlZA6Q0amVId/eUHGe8k/yZRvTSqCMNwDOl0JzBXkyvE8QSjDdkA1qxcheaCT8SpThUMPtSdxo5dn/ahCA4JJmVi0Pl0uanONdqVVO16y2xNLpHg1oMPpxRnNjT82gYNeIXw7esqqfNFyvimfbE9Z+jn/a6Wan6hy6ocxx86SKVOl0JvefGcsL56lxsjK1K8SmA+cZqKG2fiJPH56R2dnM7iUUcKWqm6wa919z2W5filsIGkf33d5Q/vsWIpVXXGXLowBc2VwRgba5WNkwfO9Aea5XLVez+xsSubmQ7Fqmn2/Onqii8wOquLC4QjpDm8YI5LN6sO7k/AD43OnB9kl8jJxByl5AlSww/6EryO0twX0dZAD086dWX7hvHaWoavbmtRYd/RiUpT+UOEZWtxGTIPsOpVpXYNwTH4e5sNnVLb+qlo/0C5Ecr/rAry7HhSmbSEMGMM+yZUbH+eSVewZiu6gCj6nDOWKLEVzXgEBqV2DAX48zO+ROPK0DdWAVN+Lslkz/Y32lqTbgsueS4mL5fFcLnP3rlZwGojJf2AjWEQ982/6BTK1r6068bXcSvVtSAK1rgvAWdhILammp+266OHfTfL3XKy242uF1sg3nCLAtJzuNFFXXnuHrubbuelj27cXprV1z7Wx2SlQskdg1lQpqIvDH8z+sDlWcdPI+Yvkn9DnkSCyEsv0ef3kreyYHbMwI+NTNOBjVxuatQeNx36fCRFmqCtaQ13gbMtHuM5yvj0hKMTz7ca4rPsPf35v+xbfl9DEDh5EFpvJZyNw==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a7bc3d4000000b0040fff3382casm8592379wmj.46.2024.02.12.05.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 05:36:09 -0800 (PST)
Message-ID: <fff6f6e1-ca2d-4f15-b891-d9b52de8a72f@linaro.org>
Date: Mon, 12 Feb 2024 14:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: enable GPU
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-5-708a40b747b5@linaro.org>
 <CAA8EJpryCXUxs69ockt0TN4LOuBB-4dZkLYHUZyN1Uq0isMjYg@mail.gmail.com>
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
In-Reply-To: <CAA8EJpryCXUxs69ockt0TN4LOuBB-4dZkLYHUZyN1Uq0isMjYg@mail.gmail.com>
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

Hi,

On 12/02/2024 14:32, Dmitry Baryshkov wrote:
> On Mon, 12 Feb 2024 at 12:37, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> Add path of the GPU firmware for the SM8650-QRD board
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> index 8515498553bf..7151f3dc67c4 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> @@ -525,6 +525,14 @@ &ipa {
>>          status = "okay";
>>   };
>>
>> +&gpu {
>> +       status = "okay";
>> +
>> +       zap-shader {
>> +               firmware-name = "qcom/sm8650/gen70900_zap.mbn";
> 
> But why? For sm8450 / sm8550 we had "a730_zap.mbn" and "a740_zap.mbn"

No idea why, this is the vendor's fw name, it uses the chipid (2 for sm8550, 9 for sm8650) instead of the commercial name like the seq file (gen70900_sqe.fw).

Neil

> 
>> +       };
>> +};
>> +
>>   &mdss {
>>          status = "okay";
>>   };
>>
>> --
>> 2.34.1
>>
> 
> 

