Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246099260CD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD010E7DB;
	Wed,  3 Jul 2024 12:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VPSWtT35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AAC10E7E3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:48:33 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so55056311fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720010911; x=1720615711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=x11iuqRGe4Tgv5rOzurWgHtPcvZZMPkYb7YxaddpGqE=;
 b=VPSWtT35F4ad6xM7lCEuIfF0/rq6rJXJJm+Q5FhNK5whWF0SeXvn60I9BoEtl++rUV
 hyOK8Ibw3hv46A2bF2G1jDDmRVrEoJFyVpcbJF4lhAT3KHDwN8cy9BA6ulXnCYSbyWTy
 fuQpcD5Kzsm7BD4toEHTUlks/086Y/r2rmEymcaMxS3wvGeyRwu4K40IeUwAlvH0bVg2
 JT2h/t3thUcmzznx5RTYw54JSHeZtweLh8jdECDQ/limWKkXDI/Kjkt4kcDKilYKTosf
 8hgyjFFKvJAgaaRw7JA8ISjwIksKZMJin6kghoYw5AkCAIQLltG3KSwpA1c8gTJc29n5
 UAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720010911; x=1720615711;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x11iuqRGe4Tgv5rOzurWgHtPcvZZMPkYb7YxaddpGqE=;
 b=qE1XSngWipVkwJAY2dV8VH6kkz+1SRhljGmKBLrImwpsNeTd3hyOcs8AUcobALaAa/
 02Spc2K3jFMgWW2jATsV417JcdyxF63vH9pi4cdJhepQbLe7Mnc7+sqIHLYdzcAYhfCv
 ZPAKuvBBjqeVJ5XZfdGFDvgIiDGoGy1xskimgInDX5tsKbBraDwQao5N1WOO5hpxATXj
 t//ONg3BohyiEJ25caogu/L7X/vFx6kk8L86tEIeg+asPpyssK+Froem2c7FkRta6x4U
 JWclBEQ35umJk9UK5YFR0xEMzOzpXnH9j6q/x6DwDbFNifwHa5noSmbZI0XhRq9wZVXy
 Kn0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk9pxhidNyNP5UPMBBI43eVbw+xBsOgFj0kAfOq6ykRZOmiGFeObPwJL1ZXUee8eoYi75Tdxy+u0scFcBoqU8yGRWal2rdQILfNNEV19Ub
X-Gm-Message-State: AOJu0Yy99OWMIuj18oATdCgQYguqefkiSucwuGlfESgtUSatR/mZ+QTI
 wkDO3ehwn1D7ibFrFybhz2m0UFgf9AFp5GiB8/MSK/UUZ3OdTPMh6rfmrjilVr4=
X-Google-Smtp-Source: AGHT+IEgpBgzmnLDU0pqMOnMuikxdfaM8cWgSqf7ihXy6Ww9djEMRDj3Spb9YqLBoyszuYbuJHQxPg==
X-Received: by 2002:a2e:a889:0:b0:2e9:8a0a:ea05 with SMTP id
 38308e7fff4ca-2ee5e3ad756mr89968581fa.17.1720010911158; 
 Wed, 03 Jul 2024 05:48:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71?
 ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd634sm15990961f8f.9.2024.07.03.05.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:48:30 -0700 (PDT)
Message-ID: <06f8113c-8e83-411a-a4bf-bfadc2560882@linaro.org>
Date: Wed, 3 Jul 2024 14:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
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
In-Reply-To: <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
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

On 03/07/2024 13:36, Dmitry Baryshkov wrote:
> On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:

<snip>

> 
>>
>> Can we use TEE subsystem?
>> -------------------------
>> There are workarounds for some of the issues above. The question is if we
>> should define our own UAPI or try to use a hack-y way of fitting into
>> the TEE subsystem. I am using word hack-y, as most of the workaround
>> involves:
>>
>> - "diverging from the definition". For instance, ignoring the session
>>    open and close ioctl calls or use file descriptors for all remote
>> resources (as, fd is the closet to capability) which undermines the
>> isolation provided by the contexts,
>>
>> - "overloading the variables". For instance, passing object ID as file
>>    descriptors in a place of session ID, or
>>
>> - "bypass TEE subsystem". For instance, extensively rely on meta
>>    parameters or push everything (e.g. kernel services) to the back-end
>> driver, which means leaving almost all TEE subsystem unused.

Why can't you extend the TEE subsystem with those features ?

>>
>> We cannot take the full benefits of TEE subsystem and may need to
>> implement most of the requirements in the back-end driver. Also, as
>> discussed above, the UAPI is not suitable for capability-based use cases.
>> We proposed a new set of ioctl calls for SMC-Invoke driver.
>>
>> In this series we posted three patches. We implemented a transport
>> driver that provides qcom_tee_object. Any object on secure side is
>> represented with an instance of qcom_tee_object and any struct exposed
>> to TEE should embed an instance of qcom_tee_object. Any, support for new
>> services, e.g. memory object, RPMB, userspace clients or supplicants are
>> implemented independently from the driver.
>>
>> We have a simple memory object and a user driver that uses
>> qcom_tee_object.
> 
> Could you please point out any user for the uAPI? I'd like to understand
> how does it from from the userspace point of view.

<snip>

