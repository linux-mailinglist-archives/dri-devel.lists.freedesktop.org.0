Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135B851146
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8184310EC41;
	Mon, 12 Feb 2024 10:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZIBn2C5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D94710EC41
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:42:53 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so43771611fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707734571; x=1708339371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=a1oPdZBnKqKSBzao8ZSP9DjSYpKnjrU7QOhn8hTFi48=;
 b=ZIBn2C5h7sI5PGHwezh9BnXvGs94oFsoud4PKT6TEemAtwUBeAHEOEeyaDZMCfBknf
 qoF4GyxX4NiCZ3mVOJBX8FzTBLOtOhnYMmX2KZ1wvWYoGv3xOsm4BhQPW1FYBt8nss+1
 VBazMVPAuTYAbjMC6zZqJal19cBiqLTi9OP+gBZBcGfQ8jRJj4qycWXKyQ+BtJjnABB3
 jaihdAbfRQRqyCpqflcNpJM3smsE8Jlk6SqIgwK0vH60xNLrFc3u+hl6n8oW38vtYO7T
 kflg7jRByZZjBL9N5MI22BaN51TtEGtmnzs6LB3sJhsAWSqaQZUiqZouWv05bMDCqYak
 6p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734571; x=1708339371;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1oPdZBnKqKSBzao8ZSP9DjSYpKnjrU7QOhn8hTFi48=;
 b=DFsDoKYn15wYrPcdWp5srq14wkck74zAzz+2YMujdvhm0cAuTO73MsoCOE7HYqoFxM
 qN2pCq5XlvazYgGNwrqKtZCT+aYwi5tjEqPfRULlwiL1HCZsYwkq79i+DeRP8VU+UjMa
 PbMoCQa0/lwtjGQJcHHM389vMYbLYjAItmAUcuglr2coXrHderfj0M/H3p5r0q9HaN17
 mPvy9nLx+Sno9vLYXze+VtvMJ/1vyuqqIjBMomB6AbY8HSSfgqG+Ypsef0DKTHdxlMtf
 yW94nTYORkKzXn56K4aIfaeX/t+sEOojckwG9kv5rFBwi39OXl/A37M6472RJZWixEWT
 wceg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJopIgf3qO9Xt1Q1PiUM1m5EUWALKKood4Mluf+a6Wm1SCsJ48zqcGIWfHPxp5/bwslpjpHOW3ngC5vhPS8A0Wv/7ITn/ZVjvpljGTF1Eq
X-Gm-Message-State: AOJu0YxsMjJG5cDLQiZvCjAzQui+MgtHelK+khzB/xL0+cFfUhpQrOze
 9lxGHymIujt9N4YtJtbKMNwFdNmlLzofMkDVg8olDeuwh0dC5gtBbQJOop726pI=
X-Google-Smtp-Source: AGHT+IHYHCImbdKOmN4+PmM5r2d3rzw3UZ7jC5CqA3YWWONjsgNMoSk+hmdjz6ntq1RBbyQC/rD/kA==
X-Received: by 2002:a2e:3c19:0:b0:2cf:1977:d098 with SMTP id
 j25-20020a2e3c19000000b002cf1977d098mr4537778lja.40.1707734570881; 
 Mon, 12 Feb 2024 02:42:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBTv0gERFkitI3tSXtHCI3bqTrIcksSSsOz+rZ1yN2EcT/pwdBkHbrjeYcKgsmPMUMRFANtARb8/Jxs9pyyEt6QNVGNIPbeWf+yCtoH8z9UgBjit9MyaiYhzflbVNSqyk86qMbbiDB36D3R5r67wdCM+QNFUbZ2FujOR7+KS8oWt65idTmzxuOGT0AZsk3o89/OegmKXg+dX8o6cG0TY4l9kI90i2zJ3r69mx/w/vTkHhX7qVR4y7Sg+B5Vjxu+TZHLiHQJJ3r1zSN3kWnhRwZEpLhQ+VDpmsCuAIGH8j+s/IF2OAVz+YSYlr1bc0f5Cun1cy1z0Nl4iQeCByTP7+SnliaPyf3ctctnNSr1VYAr8f0389XCUcL9uQSWfQpUpZ5NAcQvD5RHWC/SQnYwDTTlO0H/at1fBjdw4Oo/WWDuIt0h2QZUddJLDEgx9sbOg35WAP08HKt1heOA88Jip8oRTMNI+npASiH5f6QBkjAT1PsEzbaShSVvMIIL+Q1GhYdMTebdEaKSlWnU5ycAtI0NdNU4TPP8h4JNpIChi4p6dUMBTLhS18xYSow7jCSsHec+vcfE+5+9RWV4SA2b0zbWqfBfsofTT9EHFZkMSlNCN7wX7ufaTzomdk/2rF5hOrHmaRmcNj2rcUz2dUDNBnWYS8ktGAaG2x/NIRuulWajhYwShWHsPvJOYm0gbCB50yGrVcwY2fVcPIXF3Hx5hJy8EX+QCWL0FZfP7zUzLkpEepDhZjF4sR9ecFJ+/kY6zF8LIUhzVKm1HIBwmoxlZujxgQ22csDqF/JZVLZQaOq0WmOdolfd1LKEBge
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233]) by smtp.gmail.com with ESMTPSA id
 i25-20020a170906a29900b00a3600d7c2fbsm70567ejz.176.2024.02.12.02.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 02:42:50 -0800 (PST)
Message-ID: <1a7d7283-1437-46f5-8983-bd551f5a9801@linaro.org>
Date: Mon, 12 Feb 2024 11:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm/gmu: Document Adreno 750 GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-1-708a40b747b5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212-topic-sm8650-gpu-v1-1-708a40b747b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.02.2024 11:37, Neil Armstrong wrote:
> Document the Adreno 750 GMU found on the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
