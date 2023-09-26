Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB47AF4A1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 22:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5F510E431;
	Tue, 26 Sep 2023 20:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913AC10E42F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 20:03:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bfea381255so163390191fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695758624; x=1696363424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nm8GBgmcikOdNvX8wfIBZbzYflQISfBjRI/dXwUjBnU=;
 b=G02KWeqhSpiIlgSh51fmIC7qOO8pt3hqoAb+GdHkBJtYjak8sCUxdY1xgEFe6LX0FY
 w3EDF36Go7qCgkSrFNlFnc8ixKmmTLoXfq5fv/ID11e8FcUedN1X6LQZpe3oddM7Er6z
 cKSJ0L+z3ufRC/c9o3ht/9xGCITNTZOO12fDGXrIYCZn7B+Il1se4tb4I3tFI8KcrT+X
 /+d01LP8nHY4UMpXlSiGa0b9rbmWJ8+bvEtd/LuDC8caAJMikr014GToTy6C7NdFsB9Y
 yFjLn0VDXTEkoJXs4lX6DdyGy/2Q8zTxQFPCK62Nggi9E8shUEiQHaGyjyihtsEMAofE
 k7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695758624; x=1696363424;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nm8GBgmcikOdNvX8wfIBZbzYflQISfBjRI/dXwUjBnU=;
 b=mGLiZclli6iw88Qt/SisDFQIXqoAIt5UPmNv6ymY8ObaQRIdw2WP1IRanJhNfY38L5
 q3xgazgGdyh6u6mTDw2GZn5JUp6TqYBlZnzXFVPCXyhEpNkVzYnZBtQiIglgjw1Hdsl3
 fRZazPlE2T8GRcNF5fyAXYgwT6boiOlOKBUSegG/Kfc5agxd+Okl4VEcHZ04nlUcSoVO
 jGUSw8cistMBR2hNtGLekIweKOvxEcoZrZXUhvpsQDgRY/NNsqPm08jWYu5s1sNT5CQX
 kjOzYowpz6aQj/oRxNfupe1TdulxPTTSrv2rT3ZLwi0ODgpgS3IHWvGVTXwOqfenJP7D
 Cxxw==
X-Gm-Message-State: AOJu0YyNzmiPB7T1lp1K47ZE4ZVs5PNUMpxKD0Exa7RgACjxhkiy7WAS
 854Rxg/XnBlZs1csPtv/FS1mzKVNnRodBoxDYVBsSA==
X-Google-Smtp-Source: AGHT+IGeipwcDBWcSLPGgovpnpzSz+I4k/YDje2FhGHgtpOSdtIU9pLq9f6wkifWJeipt95IYsSbBA==
X-Received: by 2002:a2e:3211:0:b0:2bc:b9c7:7ba8 with SMTP id
 y17-20020a2e3211000000b002bcb9c77ba8mr65338ljy.43.1695758624594; 
 Tue, 26 Sep 2023 13:03:44 -0700 (PDT)
Received: from [192.168.33.189]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a17090606cd00b009ae5e46210asm8169519ejb.99.2023.09.26.13.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 13:03:44 -0700 (PDT)
Message-ID: <84e63b82-4fef-416b-8dbe-3838ad788824@linaro.org>
Date: Tue, 26 Sep 2023 22:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 johan+linaro@kernel.org, andersson@kernel.org
References: <20230926174243.161422-1-danila@jiaxyga.com>
 <20230926174243.161422-2-danila@jiaxyga.com>
 <42a1d0ab-4e8d-461d-bb2c-977a793e52b2@linaro.org>
 <1695755445.902336096@f165.i.mail.ru>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <1695755445.902336096@f165.i.mail.ru>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.09.2023 21:10, Danila Tikhonov wrote:
> 
> I think you mean by name downstream dt - sdmmagpie-gpu.dtsi
> 
> You can see the forked version of the mainline here:
> https://github.com/sm7150-mainline/linux/blob/next/arch/arm64/boot/dts/qcom/sm7150.dtsi
> 
> All fdt that we got here, if it is useful for you:
> https://github.com/sm7150-mainline/downstream-fdt
> 
> Best wishes, Danila
Taking a look at downstream, atoll.dtsi (SC7180) includes
sdmmagpie-gpu.dtsi.

Bottom line is, they share the speed bins, so it should be
fine to just extend the existing entry.

Konrad
