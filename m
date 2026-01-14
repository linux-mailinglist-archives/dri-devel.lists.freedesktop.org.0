Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C254D1D338
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD0510E5B7;
	Wed, 14 Jan 2026 08:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qij/XLsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9382310E5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:45:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso77172715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768380308; x=1768985108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
 b=Qij/XLsvziV/4yzF7CvLs3uqc5B6SUeUXq0GiaNRCd0KddlNeDZZ/j1d0T1byn+GbP
 xHWibFccxINFJK4zKRy2xFA1XRoqhrMBlZS9aVW+BTwbMMoNGwMG/3OPqxF0+tharY8S
 +YRMnLQOuvg1WyWXMPFXLtQHVoBeOBc8X8DnULx7jWGX5B2HvWieTfTcNS4W/g4GXsqg
 Bfgp87rjMqTSM8N3vqL80n9j/VqkjOWqB18LYkx2HcHqj9utUlNdPJFCYq4XU7+PVubq
 m/e7NN4jOC9KshrMhv1NSmapI/DGwXAK3jNtrUisSJ3cv+RmVKVAivBwsktlo9nHVnJD
 nIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380308; x=1768985108;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nn2P+cTkVwAykWlPC24DGRgRkCJONiMX3KadIJciMfk=;
 b=wJUb9oeCxHKJauL7kAmFrShzVi5FYvaOXHpT1hO8LCYE38GiEUmGnFnu6kfPEJ7YQ8
 B563bHpMnKgWgZrwCgDGi7NvVpmutbsP7RJnY/xtQcfqp9Z62cclXLadWM6hGPJ0GHsx
 mJtOxnq0F/MnUv1jI3thnTTlVovQO9/GMIPAD9HFos2TDqvuVKCJTKU2/Tj924FXjt9a
 szl7DYFG1zzh0qY4orakZsTgLr6wrGcDpz9LZeV4FVMJUSZMc+xfYwMVNAY8Ypv7srhN
 Dx97hW8qIxi5VuAjijQgHXmEfVPcHSrSBxf81xwKf/RLfeFvRB9OISRRUbD9hRpVkz1y
 tKMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHMs0vveenb917RSF9oJYyH1Etg9gpri2WgQKVQ4lDX1+HaDuo79wpqzi1Df8l6G/ewijS/RwG3Ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnoazHmpfDCZUL8exR1zUEnpIPBAhGcpjHsHxB1xNCL5w/QUfe
 aodVmEP8CVzOl5w1xgqGuepo26QSTHSt25pgXUOpRbl2Zrj4T7nVazqos3oy5oMLr9A=
X-Gm-Gg: AY/fxX6i3JucV0GTT0AVcEH5kVGkqlZGM4X0uL2Hsa+tWp2N367gr7K1bJ0G18rp7K0
 WcO9Hw/KdX+lQh/prLluhqma1R8dwhjf6OEG72mbno9a1K/yCLdmLkl6CkK1V6vtL4ZWpjgwJsv
 8O9yM/Rwss+OkF35cR9n8BTN54NYBs6L73ef6clCdh/fO0kyNbnubCFN6yLaenV//QzxuSavANo
 mGx2kKbkgLphU3r8n1JjiyzM9lGzPVUBfyWwkpX0WfKU8lIPc7tXn1YiptPP9x5OGZOrAXSEb9V
 rSLizrv/qyZkpzgkK/MF4z/j2p/MN+Szih23ZxvJQpyHpjG1yr18GVYa1SI76IIoYUblJDGxwsi
 MpqIqec4PXxar8e7s2EiwmCK/sTm31nAhN2uov9Yv/JFYdbgK+HcWQEESQvmn550B1Wjbn8qcGT
 N2furPfXhj0zU0nb6GRylc5vyAjXemVg5IID4oiVbAtHKszNOKx5Uri+j8O6vkvkg=
X-Received: by 2002:a05:600c:870b:b0:477:7b72:bf9a with SMTP id
 5b1f17b1804b1-47ee338a737mr19695785e9.28.1768380307818; 
 Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450?
 ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee57a2613sm16475575e9.6.2026.01.14.00.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:45:07 -0800 (PST)
Message-ID: <e879d3a1-45d9-46f0-adaf-6bea243ab807@linaro.org>
Date: Wed, 14 Jan 2026 09:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
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
In-Reply-To: <3149158c-a6c4-4c5d-9011-de4db8d1220c@oss.qualcomm.com>
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

Hi,

On 1/14/26 07:37, Akhil P Oommen wrote:
> On 10/22/2025 6:14 PM, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> In order to fix this state and allow the GMU to be properly
>> probed, let's add a proper driver for the GMU and add it to
>> the MSM driver components.
>>
>> Only the proper GMU has been tested since I don't have
>> access to hardware with a GMU wrapper.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>
> 
> Niel,
> 
> Could you please send the follow up revision of this patch? Lets get
> this fix merged.

I'm really struggling on the separate_gpu_kms part, it's not trivial at all.

I'll try again and report my current status.

Neil

> 
> -Akhil.
> 

