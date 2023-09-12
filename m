Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6179D167
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8DF10E06C;
	Tue, 12 Sep 2023 12:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7110E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 12:52:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-529fb2c6583so7196049a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694523164; x=1695127964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9jJ5YX4xBOqwnaDAA68a0z5gq1OlAA8KPc5IjRYAL0=;
 b=Z8oKXaezBHAdF1OK6Mnhyrq1mnEsJTnoZFXpPNAugX/5Ssbmes+7gyLgnv10ml5X1s
 J5JmMPDmRqHaE9so7qwtbGHYimxdnw4xEwqxwvs2TpCaonFjpcbxqHv7LELvQnZ9NlqY
 kgicUWZ1pCOygfRW335nuwKUxf4majzyf3mM2g5bwFve8n1Ukn/NVtl8oYQzkWEpHU52
 Auuf6d31JS1P9XCq4xXEPNskY+EHFawBNFUok5CuJBVynAce1JwBFv3EOT4FfL7fqVY6
 TPTsNfWplsLkNzbgfTYAmOI9+yHUH9QAcKfZzeSZjsE+68QLdfTI8gfumUEOc0EDDc1f
 c7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694523164; x=1695127964;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u9jJ5YX4xBOqwnaDAA68a0z5gq1OlAA8KPc5IjRYAL0=;
 b=ud+UQHrDnooYgOhYT/KlYZhOrIXraUbTldS1hcK7QkBxg3QNeyXBmf4vt0Dg5S+pz1
 dB45NsnjEhaasdImQ0F32nXC/WDekZJwR0Om3eSyMNVVV6mql1/pSsT5M0BO9+RSk6Cj
 +gkiDnQQoK1CMwo8oT/sGMU3aZcUxgi8rsQ1lwA/Df3nOFzFLzgNcxldLTSEt76U40AF
 xgYAIZRipqNFmQ2fco4k0c+Hup3VzxinvAxysZ+xzVJ/l9+C0xJBp5K6ctiOTjuAz5c5
 5QrC93oSOvO27N7aqb4sZ75rQ3S4pNfj/Jx3L9Cwu+1vFa/4Xug1NDFfNG60Zf08nhJ1
 JwsQ==
X-Gm-Message-State: AOJu0YxIjk0sCSA3R3Wyn0F1CwMlGCUD1d2jpbsn/XHAllE1td2GmWy9
 KM+8Vs9qbjTS6DnrRBU6Q9BDkw==
X-Google-Smtp-Source: AGHT+IH7nhx4jfbGgITc9GdSYQHAbQFjAg2RV99LbZV7dHCx51LUIjf5t0mtTdLSyctO699x7bk/HA==
X-Received: by 2002:a05:6402:1bc1:b0:52f:bd62:2219 with SMTP id
 ch1-20020a0564021bc100b0052fbd622219mr25440edb.37.1694523164009; 
 Tue, 12 Sep 2023 05:52:44 -0700 (PDT)
Received: from [192.168.37.232]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cfd2000000b00527e7087d5dsm5807381edy.15.2023.09.12.05.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 05:52:43 -0700 (PDT)
Message-ID: <50d7a478-5d4e-40fc-9c1b-e4f99b17a11d@linaro.org>
Date: Tue, 12 Sep 2023 14:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/msm/a6xx: Add A740 support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
 <20230628-topic-a7xx_drmmsm-v3-9-4ee67ccbaf9d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230628-topic-a7xx_drmmsm-v3-9-4ee67ccbaf9d@linaro.org>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.08.2023 14:56, Konrad Dybcio wrote:
> A740 builds upon the A730 IP, shuffling some values and registers
> around. More differences will appear when things like BCL are
> implemented.
> 
> adreno_is_a740_family is added in preparation for more A7xx GPUs,
> the logic checks will be valid resulting in smaller diffs.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]

>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV,
That's a funny conflict resolution (should have been in the previous
commit..). If there are no other comments, could you fix this up while
applying, Rob?

Konrad
