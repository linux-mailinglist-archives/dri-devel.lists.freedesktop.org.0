Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86389D9C6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26207112D89;
	Tue,  9 Apr 2024 13:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ezJVGgUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8023B112D89
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:07:10 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d700beb60bso90612841fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712668028; x=1713272828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mD9HahIS/u9+HSSzjjJzihLRc6+ONRfzq0lWek3XQms=;
 b=ezJVGgUD9vWe3kncItHGIHUQ6gQc3Nsva3zkcDHsZnoCbSSmCaxdKOzwkOa5B8PLoY
 DpGbpQV4m4noJeMubuMallu4Ewb91gmZVNQ5O9O1rVXQ1qA5VhGq2xKTgN2b1FPPfoh7
 wxwXWPYQDjgEIbNRlKcOqv2jYtwJ5QeedUcyHS1OFe0sD9vpLIgVgPMJO06qqpdVn6Gg
 xL3mU9NkHO/N1dpiZPjdFuBUKnpUG41CpJ+pknWj2ES/0wb/kBhr1z7F1MDTyti+pfeO
 PRv8R3uZHZ0gHfXUTcX8WQMVB9Er/OD0AKUtu4boShLEcEKacGdBGW21bj2lInE/5Jg4
 BylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712668028; x=1713272828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mD9HahIS/u9+HSSzjjJzihLRc6+ONRfzq0lWek3XQms=;
 b=Q1COa31POnlO7TzNhnKBbbyoXjrTtIW41Iszrq6Vj+v0LYdrBMd/muQjWem2JqlEtt
 uuK9pxhkTfAi4SRok4zUGt7Gz8AOpZQK79ex+ttTvZWwgxEqpXEAhKs83pZ9Jq2Rsgwt
 JA+Yde6Sfsf/E4LHS7bXyOU9LJBX3VfgdfcQ7ALqNlFVhxs/d1zBy5MOve/3wbLYJuSm
 5hVfN/Dvw2kJPsTVyiDAYAR2SaaHXwRx+RZ+n4Zt6XruR1JLDjOTwdbbo8KxluOeBkbv
 VfFZs5xPz9aNVQJviKgD3im9KHYXSaP32pWkwWSUo20RmjheuR94f8vHEaZ5KVkZx8BH
 YDQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZvV6EFltixnmAT/4cqig4Bhx7EC0TW1Na0UJL44ulNM2Cp4f7FHI/9k6XdKncJjA0nrforLUYaSaG5IU60HCsi9Dun67WxhQAz0CfN7C
X-Gm-Message-State: AOJu0YxI2g+H4r41XAHyJ5DRa5fH77SyZOmI9PgjPkh1UIF/untdjcZs
 t53DQPevWiZJeHWfA8X3qDAtdZwGVzOx+ktV82AOglPHMYvRJUnUhOhXGLdE85g=
X-Google-Smtp-Source: AGHT+IECVOi5mERBh0lhbexEvVIRcOp7bZFWNoq9SWgbOnpPcHlP2Mqa5Ar2Ql0Cjq7XotzkTLG5uA==
X-Received: by 2002:a05:651c:1a28:b0:2d4:6a34:97bf with SMTP id
 by40-20020a05651c1a2800b002d46a3497bfmr12807180ljb.49.1712668028431; 
 Tue, 09 Apr 2024 06:07:08 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002d845ffd60bsm1557767lji.3.2024.04.09.06.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 06:07:08 -0700 (PDT)
Message-ID: <30d4c3bf-6fd8-4f5c-8628-e84b3746d4ca@linaro.org>
Date: Tue, 9 Apr 2024 15:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: fix CP cycles stat retrieval on a7xx
To: zan@falconsigh.net, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, robdclark@gmail.com,
 Zan Dobersek <zdobersek@igalia.com>
References: <20240409125700.651398-1-zan@falconsigh.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409125700.651398-1-zan@falconsigh.net>
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



On 4/9/24 14:57, zan@falconsigh.net wrote:
> From: Zan Dobersek <zdobersek@igalia.com>
> 
> a7xx_submit() should use the a7xx variant of the RBBM_PERFCTR_CP register
> for retrieving the CP cycles value before and after the submitted command
> stream execution.
> 
> Signed-off-by: Zan Dobersek <zdobersek@igalia.com>
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> ---

Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>

Thanks!

Konrad
