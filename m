Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E390C894
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DDC10E627;
	Tue, 18 Jun 2024 11:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zlOXKRAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6631410E627
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:10:37 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5295e488248so5836938e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709035; x=1719313835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
 b=zlOXKRAo8zVeSknhjuuG0NBsB1flBDWGd0Figt0ZeFBuAptu7zOD6DjOxC3t6ctG0H
 nFx6I/BXKtorOVD+43NXL0IdxndIT5RGEoYD6AHir3+JjRn5suHU6LDkSxyo++ShGEfW
 LXcYkAaRHjl5cmzg/dQd5HG24+iMtKBeaxwJtC5eSpCCMTAtetxPqFzlm/rNjP3YWiM3
 WyG6rsh4A63kqwkUV+mrADOJkOi1kJ2zqE1DDy4xWXxkTyq4bDoU8TC+7n4IAViyB7hh
 mFBGz8U07fI7KTSLRjcd9PAopQ0GXxZ9kTvLbMeBFWvuHWtwP83jXP3JWoq+WpTUO47A
 +96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709035; x=1719313835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CamK4h0tVkXA5tm1M1BFkFYkjXyPGLjdWaiQdzsO90=;
 b=HTQKnkYrRbm0PQPazNG/bwT3SRF79iO9Dp969SRozAF2K5bxMYCanAhuFKv0pc4Xtq
 UDqyVIIc9N8YloeXF2n9XPJRdr8PgFvzZ9p++3yJngDT3o0H8jWas6MGgBUnj4eCgitK
 V7qSNLZgs056Ndgur0tbZ4vB5ujp9yK2Qv6TgCeVkj1CrEgVDLqGcORmtj1hdBk2l652
 a5ZtOOrQf6SKzMSBb7k1jSh4Q140XCsCAMLUuAYNA7FJEUWnkIMIjd4+WqmKnLs+D8bY
 SBKV1DdnSzWRHH4Md+Z107aGTxg2lVvs+5YpWu2u3MCAzxskNpPr1oe2CXPOIzAggBaQ
 nANA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrWVRasdf1HJpBhw0SZJ6AtFRDe1OtYrAeMMmCmbwmD2rnYL7QR8WMr7tTgM235d5r2YKSd0morU4rdmwPzqx7lDfYASy/0bgunl4XoHkc
X-Gm-Message-State: AOJu0Yw2NhkaRA/N4QJ89gE08E+NWhvgAts5MppaT3ah3+kLvrikivz2
 HmvQycqcgVr6BJtdo7FIJHv4Mv0N92QYohpFH2WCKs3dlrMnIMSz/fBrhBzfwe8=
X-Google-Smtp-Source: AGHT+IGXPsTBfIq7KgoZ+FjqKnXfQE7o5TjJhqwbSz0mtaVsqH0uGjATHX6jD/wxyZ6VImIIA0MtLg==
X-Received: by 2002:ac2:43ae:0:b0:52c:8a16:b085 with SMTP id
 2adb3069b0e04-52ca6e65542mr7104199e87.19.1718709035526; 
 Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282569esm1480851e87.41.2024.06.18.04.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:10:35 -0700 (PDT)
Message-ID: <9d9cb645-b3dc-4081-859f-d2be981a696f@linaro.org>
Date: Tue, 18 Jun 2024 13:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/msm/adreno: Split catalog into separate files
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-3-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-3-robdclark@gmail.com>
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
