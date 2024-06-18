Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8190DC24
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 21:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236C310E775;
	Tue, 18 Jun 2024 19:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WeWv7JnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6410E775
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 19:02:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so808485e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718737352; x=1719342152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
 b=WeWv7JnNwX9KNYin7q4cH64oCnYBy+0RKypF+Qr0uN8mY4P0VOg3ZCsGnpmEAPP5gc
 Jkc4fYjhbUkpsHS1dtx5RMi2jBAoeJaWpeT8ceIOLHs1Zs7jnXNZIlaK4gj/jSB4Cu6F
 QjHUyslomF9u8a1NtIbweqvImOgIriycA9VonKh2ldb0z6jm9gv21Q0eewBLsXT7Xiwp
 F/0X8HfZbwiliyJesvPqNb3zdsKZerhKFUBRjDbTE+4pIb3WXpTf7rre+JYhB7f3kbie
 DNmjnBccJnBcD89xp7Hgq2OHoUOnlZx4xytmGnegzXX8wO1YGNQGAHdUu0tNvW6ZF8Mx
 UfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718737352; x=1719342152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
 b=AmwIrnH9jFK3/yZm66huKfaKQNYlOSyjbgx17+0+1pnmAaXDRjCmgGhdXIhVQn0HOP
 FYUEBkZ/QAs6PGumVAub5eKifvMUKx1OnJuiB0YyWghmIPQfCGkytmkrYZXqRz42nVE/
 pryoJjEyI62lcEgIAbmY6/q5q6/L2D6GyBVKnYEW2VAsmkETF2ECEQPsVU0dY0C7dH9L
 pghU0jOd/M2J9UKxEi1rjwoC5zTvx/AS6eyl8P/HggT1Stila6VH8Is1plGH2w/tZc6e
 SFZvYz6GBMnJkMEImHknN8RA0cD3XxRk/3XW3nYvrEgoJyWXUhAliY153sgBjTmOF8bD
 JThQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVtEVnEMxyJqqElmztcs4ReXqxowFv3tG172NBpMtdws2obavZ9F4lrEjcg+phIqvo4mTJaue3T17b8riHr8qOGnouTuDo5f/p+/zsVBXi
X-Gm-Message-State: AOJu0YyGrsu6RQWlAhLqZ2ugaNs5v+IGUXlSgnDGgA+8+yxfZ8HjyqNo
 f0g8EH9NzBN/V1/nbkMSs9iztrZiHF5ZUgfzLWFwXtkQCcKuiEY8e6Hp51egk5o=
X-Google-Smtp-Source: AGHT+IG7lBWAP2S0mJtpOdeqTmDaeSfFJwS3uCXt8D79J41M/fUJYZCYbP8ihtzZVXtw5EnRrS5WtQ==
X-Received: by 2002:a05:600c:787:b0:421:8179:6127 with SMTP id
 5b1f17b1804b1-42474d41065mr6543715e9.20.1718737351821; 
 Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811?
 ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075093a3fsm15011713f8f.1.2024.06.18.12.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Message-ID: <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
Date: Tue, 18 Jun 2024 21:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-6-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618164303.66615-6-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/18/24 18:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +static inline void __build_asserts(void)
> +{
> +	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> +	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> +	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> +	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> +	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> +}
> +

patch:394: new blank line at EOF

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
