Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC6C19B34
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AC810E77C;
	Wed, 29 Oct 2025 10:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G5zqHR2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976510E77B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 10:25:53 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-475c9881821so5329575e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761733552; x=1762338352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CU7TWVmxUfjdS/j+fhhfS1Lr/4BtUCHNuC4l5CHyDbI=;
 b=G5zqHR2TVlctVZf0Kl2ERLAd8N0nKDRxZJfvBLx1QB+lyLMHi0ZJ7QX73lbm4fzKcz
 z9cG36vHXE6mPxBNDHq2q+3CISC2SyMsXETzpi3T6i+BvYELvNvRWMHgg2FzKdryg6yY
 g5BmA2faYIiKkYV92/e7YaopS0f6RfSk3Zx8lo1QPJSabP9a9I5fUX3mOu7ihKUFAZ14
 VncwIvhBcL8Q9kwo/V1BmBtTBmdG6hWPt0RKd2q8pvtpkAfE0J0XLorUHUuueK6mLzZP
 FD6ZgAqESvVaJB29i3dIrnURu7M0/U72WKXCZeYdd4xElpPCeWby2r5Uy4MkjJCKgn1V
 XJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761733552; x=1762338352;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CU7TWVmxUfjdS/j+fhhfS1Lr/4BtUCHNuC4l5CHyDbI=;
 b=jFi8P+NgETwNHSgVW20u7y6Q8oDHjPf39A3aczg4unIJ1u6/4MfZOpm+jJxPivY283
 GZJ/AiAQ86/M2givyG8LMP5Lb9pJdtOK6BynoQ4VnSiLXHamsHwR4iTxYScubjcwJckx
 4wd2mu58jEZdpT5aw1O4bYtv2B2YrTyTDnRzO2rRJ6nIbO465zx16JL+XU/vuz/wZDCG
 2KWI7BhD2oN9tE2a+jG3Okyv6VWG1IfKQWiOJxP3uxbOWB1wKH/vWiDVrtvdUTodDOxo
 U7KxyvPxEVXt2AL749e9foo3Vu6XdVZ5TGokAe9eioUUsNZ7hZkDp0XjG7jh9/HXEvgV
 A3Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXrO36DtKk6/NCzQqicpSa1vLDdhN0iYHDrrTiEkCZOJuVpjIJ/r3co+Jk3qElVUqPMRYlHAv6JbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwseIeLW/aexKjd5CbOslD8EmE5VOYS8nLLBq5dXdlyPYX3ChUS
 1CJVZM50SCR38DPXy1T4P1wlR2kHe7Vguaoe1teGyCxUs8AOndRnKh4FyujGjfznOUDJCINKmoS
 xdcZnWgo=
X-Gm-Gg: ASbGnctLefdHjtI9DgLATwzKa6YFkuAaUGPzh4bLdHcWGvHbGar6Y2SmbH+nVEYkAC2
 EDV/FN3fbIgKAdiLSWtvlGSVHxylH+DUChtKZeZ4kLbPmjojDWM0sV6aGB1BX+wnKiHfkIGeTpO
 Ld3Brts5BlEPsJqTHEY0+EbV8TkWprvHr6YimK1DKDZI/d79dL1DsGLkyNQGkoMuBSU1gwjdiQH
 tzZBBvte6Vfg1HpF33GbsxyH6AWThkVHk8urQKdZrv8j1+LQblfCY120An8yGvYKNESaG9+DUcv
 8yA+CQjZNe4gbV2bUymRjmu+YPx20tcWx+yWAUlEaEOPnVSDUjNYz0Uw9onDjH26S1pG44eiE0h
 SuQIKC0HY1lGlPNexDjG1v2vQF0/P6sN/Cn8jjbnWG0bKnXS/i4G63GPRKLIP7vCZ8+4Pw8YucY
 JBWYU0mzX8EeKo2y+tjaHe2qFfNcPl65Qt0e1lBWoWgjtgngUOEQ==
X-Google-Smtp-Source: AGHT+IEaHuD6PBgXNpeW/yrwt9PlnJGDUDO8+HVfKS6ur9Ofnl58vj3by9OfMJOoTchhrlGpuEduUg==
X-Received: by 2002:a05:6000:1acd:b0:425:70cb:9ba8 with SMTP id
 ffacd0b85a97d-429ae8de800mr1917995f8f.1.1761733551856; 
 Wed, 29 Oct 2025 03:25:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm26655869f8f.26.2025.10.29.03.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 03:25:51 -0700 (PDT)
Message-ID: <e9e117ed-823c-47e3-8ed6-14dbecc844bc@linaro.org>
Date: Wed, 29 Oct 2025 11:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Jens Reidel <adrian@mainlining.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
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
In-Reply-To: <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/26/25 02:31, Jens Reidel wrote:
> On 10/22/25 14:44, Neil Armstrong wrote:
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
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>

<snip>

>>
>> ---
>> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
>> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
>>
>> Best regards,
> 
> Hi Neil,
> 
> thanks for the patch. With it applied, my GPU fails to initialize.
> Here's the related dmesg section:
> 
> [    1.733062] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x50020000
> [    1.735229] [drm] Initialized msm 1.13.0 for ae01000.display-controller on minor 0
> [    1.735403] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_sqe.fw from new location
> [    1.735513] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_gmu.bin from new location
> [    1.746710] a6xx_gmu 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x800000
> [    1.746766] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110
> 
> This could be because I have an Adreno 630-family GPU, which is marked as legacy in a6xx_gmu_init / a6xx_gmu_bind. Previously, the rest of the init code would just always run, while now, some parts are conditionally disabled for legacy GPUs - that may be unintentional? However, unconditionally enabling those parts seems to fail to initialize the GPU followed by a reset shortly after, so there's probably more to this.
> 
> Please let me know if there's anything I can do to help debug this.

Thanks for the report, it's an sdm845 based right ?

I may have mismatched the role of the legacy parameter...

Could you try this on top:
===========================><=====================================
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6e7c3e627509..403675ed18c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1925,6 +1925,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	struct msm_drm_private *priv = dev_get_drvdata(master);
  	struct msm_gpu *gpu = dev_to_gpu(&priv->gpu_pdev->dev);
  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	bool is_wrapper = adreno_has_gmu_wrapper(adreno_gpu);
  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
  	struct device_link *link;
@@ -1936,18 +1937,18 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	if (ret)
  		return ret;

-	if (adreno_has_gmu_wrapper(adreno_gpu))
+	if (is_wrapper)
  		/* Mark legacy for manual SPTPRAC control */
  		gmu->legacy = true;

-	if (!gmu->legacy)
+	if (!is_wrapper)
  		/* Set GMU idle level */
  		gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
  			GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;

  	pm_runtime_enable(gmu->dev);

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Get the list of clocks */
  		ret = a6xx_gmu_clocks_probe(gmu);
  		if (ret)
@@ -2063,7 +2064,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  		goto detach_cxpd;
  	}

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Other errors are handled during GPU ACD probe */
  		gmu->qmp = qmp_get(gmu->dev);
  		if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
@@ -2082,7 +2083,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	 */
  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Get the power levels for the GMU and GPU */
  		a6xx_gmu_pwrlevels_probe(gmu);

@@ -2115,7 +2116,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)

  err_mmio:
  	iounmap(gmu->mmio);
-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
  			iounmap(gmu->rscc);
  		free_irq(gmu->gmu_irq, gmu);
@@ -2123,7 +2124,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	}

  err_memory:
-	if (!gmu->legacy)
+	if (!is_wrapper)
  		a6xx_gmu_memory_free(gmu);

  	return ret;
===========================><=====================================

Thanks,
Neil

> 
> Best regards,
> Jens

