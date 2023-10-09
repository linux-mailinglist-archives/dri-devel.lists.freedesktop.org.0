Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D87BE71A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 18:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612A10E17B;
	Mon,  9 Oct 2023 16:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D04810E289
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 16:57:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so7144669e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696870671; x=1697475471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
 b=NbgOv1Q+7MhjkMGNZj2cYkBf93e58GRGIk8DI+dQSQeEenHzO2/R1rQ5d/0+mC45yd
 lO65mDyqUVr7uPuu0LB5Nv0qLIwrQISOTsQ6v5l1oMfqvk5RUvtkHS1Z4kPGetBWnzmo
 VLWV5sjq/ZmOoH0lV58yNCnTTcme/WYcgrHk2zU28iOo1kkg2gqTtWv7AqK97PgUszRV
 mcVJZQREqab6Jw7QisYIYetsyzThLvm1ciG/hvZdJzqpJdVQXJiCaXji1Tr0RARWB4f7
 kGG2Hwy8ujy0LiqQ5wt76JsgmLDHUbSKhStFtKLxBd9CoXPs/BxH7FfgNQHBP2+VrBRc
 CZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696870671; x=1697475471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
 b=VQDLR+NHYKz6ehrgGHjE6kFUu7bNI0ACAuTWYkrTY7cafGtRrbU04y9bYm03/fxRi1
 t0eFJNa3ogsUO3B+VsPR3yPveqnTJdPeHaJkModlDB4sVnUFS8EQQEAj03zvWnZoRj8z
 dmt5vr89XsAJtn+zjqO80uZT3Y/jxhCPFbb0bfDsahZa/ijfb9sxCoGJWeIGFhLrjhi8
 2C8D59NGLCZ5cmMqgZsoWzNqfjoXA6Gvoex73BwZy1DN2gVdfVbA0GfqdPnNcj6eEErH
 p3ZSyHlzP3XoXX815Yg+MYdNZHTFm75eCeogKiryGO3t3NrkZFXWQbcbyZKBS1I88yu9
 uRoQ==
X-Gm-Message-State: AOJu0YzloPrqcQXpjDoWsOzVgqY5Fxu2lfRzTQWdOavGhccbuFMLERUM
 GXl0tv9zmg6boewvWfE0Q/oeFg==
X-Google-Smtp-Source: AGHT+IFwJmsKn/WUgJqM2TLCE9a+ICJ+nX962Esuh3YK7V9GVQk/E/b+LB5Mvk9da1r9nlDr/KyWEw==
X-Received: by 2002:ac2:4da3:0:b0:4ff:9a91:6b73 with SMTP id
 h3-20020ac24da3000000b004ff9a916b73mr9544388lfe.17.1696870671536; 
 Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a19a412000000b005047baf3385sm1488987lfc.181.2023.10.09.09.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Message-ID: <8d586220-eb79-446a-b789-5a7131c7a2ad@linaro.org>
Date: Mon, 9 Oct 2023 19:57:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] drm/msm: dpu1: create a dpu_hw_clk_force_ctrl()
 helper
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/10/2023 19:36, Neil Armstrong wrote:
> Add an helper to setup the force clock control as it will
> be used in multiple HW files.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
>   3 files changed, 26 insertions(+), 22 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

