Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3C95C7F2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED97A10EC46;
	Fri, 23 Aug 2024 08:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gryGGpAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB2E10EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:23:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso13059235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724401380; x=1725006180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Qc4wLUWi1Q+2Pe5opNOMu1JRII1BPT5sStPy3UveR5g=;
 b=gryGGpApuoeGewwZ68X4+wJJ+FfnSR+GBE747NVrbC97goHuAI7OpZmmjeB+XBCMPx
 TzvAsaqWmXWWtZBpdIuj8aWRuPS8GtmqExmSQN3k/0redQ8o/z5JJSkl2nhpcQQL/Y00
 16QM4YkjNIJtrwDPn5EqTc+cFqCPDpHifEMWWeW9J3iORkDTSdv4AUtYEkQztX1wYbqp
 AbhOMbFyQWw+n/1mMmaGfEfDDnwfBJ2Nh7Al8wV5sKpDaN8gJY3xDI9jNvRXjQYtlvTf
 PTjk3yc+J3dUkqu9n4QD+0ILuXseurF9C7YEk0cfMY884jaY9rA8JsZ25wKCmboAG3Mg
 vZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724401380; x=1725006180;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Qc4wLUWi1Q+2Pe5opNOMu1JRII1BPT5sStPy3UveR5g=;
 b=wniGVbA41JMxVsWl+l9rnoFdYb48FpVB9UqFDnZhw3MxJfgsZ3RfjAy8uDBoQj1HtA
 SP4whjDztBXA+hOa1y3G1GzW1gvnqqmjbg6b3k9p64dwOHPN3mUstsdaqXI1YG/TP1W0
 Bik8QqfwUoX+eU1tOefVFVQWIEX1j4J6uQYr3a3jRhGUqSr26r9B8jLjW3AlUXtNnIfB
 7eYGXbTKjdjuIaFLYQ8K4LhWZfETKgm5X9Aiggu8pAmQ2/9zPqCSAhqmDGgnP0e7tE3A
 vVGKRiEcoNq+eyEMpbWR6IAngo1ZT8KzjHXhxq2kwiHOroi7kzYpNc/9YIZZbJBuzPJv
 1xiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb93rbGKf+kc8o4VmQP1rLl5tfOgui0g/sl5N5K23xuoukYyfN9CnlAwJutgLslvdR8WMWDOOTk4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhh8Fz31mHXHuiaARUkotEyFUtBaityUpoWpyXuwIm8Ku2gq89
 wbmucU8eKq+/ddO1DBR3YMkRbFOBWixU0lv+8sGanK34xzdFOTvwUFJECHIicy0=
X-Google-Smtp-Source: AGHT+IGsJclyRKt8iDBR8hUT5br0NSiyxooWh2o8K/cqt5NhzX54de3+f5WlTDDBrQXur1IMfj43hA==
X-Received: by 2002:a05:600c:cc5:b0:426:54c9:dfed with SMTP id
 5b1f17b1804b1-42acc9f66d1mr10896105e9.28.1724401379995; 
 Fri, 23 Aug 2024 01:22:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:995c:3fea:6b19:4a51?
 ([2a01:e0a:982:cbb0:995c:3fea:6b19:4a51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac516251fsm50749625e9.25.2024.08.23.01.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 01:22:59 -0700 (PDT)
Message-ID: <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
Date: Fri, 23 Aug 2024 10:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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

On 15/08/2024 20:26, Antonino Maniscalco wrote:
> This series implements preemption for A7XX targets, which allows the GPU to
> switch to an higher priority ring when work is pushed to it, reducing latency
> for high priority submissions.
> 
> This series enables L1 preemption with skip_save_restore which requires
> the following userspace patches to function:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> 
> A flag is added to `msm_gem_submit` to only allow submissions from compatible
> userspace to be preempted, therefore maintaining compatibility.
> 
> Some commits from this series are based on a previous series to enable
> preemption on A6XX targets:
> 
> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
> Antonino Maniscalco (7):
>        drm/msm: Fix bv_fence being used as bv_rptr
>        drm/msm: Add submitqueue setup and close
>        drm/msm: Add a `preempt_record_size` field
>        drm/msm/A6xx: Implement preemption for A7XX targets
>        drm/msm/A6xx: Add traces for preemption
>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>        drm/msm/A6xx: Enable preemption for A7xx targets
> 
>   drivers/gpu/drm/msm/Makefile              |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 ++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
>   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
>   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
>   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
>   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
>   include/uapi/drm/msm_drm.h                |   5 +-
>   11 files changed, 995 insertions(+), 16 deletions(-)
> ---
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> change-id: 20240815-preemption-a750-t-fcee9a844b39
> 
> Best regards,

For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 MR & vkcube

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

If you think of more tests to run, please tell me.

Neil
