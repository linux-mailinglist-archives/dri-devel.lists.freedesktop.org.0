Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420993DF5F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 14:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B232A10E058;
	Sat, 27 Jul 2024 12:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lc/DofKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941BC10E09F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 12:47:11 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-663dd13c0bbso5626927b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722084430; x=1722689230; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ruf9ZndZlLo67VSTxRYzKSbRXRLxQV2q8v9gXBq+h+k=;
 b=Lc/DofKMgBJu9tpixjY9OAK/+RACpYGpwhH41T58Zeu+w26DA47BzPgAYxLMZJvyp3
 r+Bzn9k2KkWWftFeTNs0JGrUZddzu55Vn84nsBfYTObN+JJY5B369tGgbAtXQpsBgrxO
 w14JWosbNxLoSdERPKoC5aVAezTq1AfpXqE/+Z032gSwbOvBh//2DARGRy6l5Nl5JAGT
 yfHH4+JuS1LEi/0CfhEYXAIWM1xeXH2z4/9WzcqCllcuvHY6oSEKcuuxjYjnTPW7DDZr
 6+DNGaDBUuSvHqaVX5c+yaX0MhNQ0e1uUVI+vdSZIO3lYZPVnepUREVkL+Dxf3E5M9J8
 /+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722084430; x=1722689230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruf9ZndZlLo67VSTxRYzKSbRXRLxQV2q8v9gXBq+h+k=;
 b=O0UM/Zm5u2IEaozV9qq2lkMYTzLkOXzH9ca8z7FVXOYOaKmHdrXBc2qfXuGR9DzMH4
 +8hV+qAyMo6eu11YvijnnFeGbptHsUOZ4TCqMaR2KWMfRG/9y2CyjIpmsUwgY87FSIzL
 O2HRkLoEFRpo3coHtFLpKD+2TZ263L3/Oynhm0iKWfd1X2+AwBCh0SYQC3Z3KdgXt0NE
 mPRLLBIsXPeBoVdag4wNK9nCljcQVtTmDssDNAGAj3se3A/QyrBBh4BxcrjQPv8cKjTH
 Lt3Ir6kSFOk9ZEHnTbS4bdB/C1euGEpTykLLL8S6bRHuqeHXFiw7ooju0r1d6fNOqq/P
 32YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp7h1mQspli+q7uPvCirAwepuaxDWlBefSpTY+oOmedrzwE7WtfApzEC0Tv7nOwjF0CPRaHskf29/HbD6XGeoFQfNYlmVrzX2I188Cc9zN
X-Gm-Message-State: AOJu0Ywq8qYgwnJp1I6OZKThwF7IDFb9cBrW4B2lc0qSd5rIzu/0V3Z2
 IIwGIevGq1mzKtu1sV5YKuAkYStOgpkzVLRS7BnoPZe8JmX1b8/UTS7vbVhJix5Y5VO6ZQbrVOk
 yjlKxLzryf5umMl7w6QISh1IW99Sk+6m7NLkP+g==
X-Google-Smtp-Source: AGHT+IFhK/Aj+oSR7J0lYtH6rQPZBzgOq9awlN5aMDE4hP6kpLKtN1cPj+5K1G7neerc+C+JBOWJXklm+962FR0VIbM=
X-Received: by 2002:a05:690c:f0c:b0:64a:f40d:5fd2 with SMTP id
 00721157ae682-67a05b95447mr29458067b3.12.1722084430178; Sat, 27 Jul 2024
 05:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:46:59 +0300
Message-ID: <CAA8EJppFcPRcMzjB8hxbWK9G19J-C720DP7gukW3ds8j-Af92w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset the link phy params before link training
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, swboyd@chromium.org, 
 abel.vesa@linaro.org, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 26 Jul 2024 at 01:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Before re-starting link training reset the link phy params namely
> the pre-emphasis and voltage swing levels otherwise the next
> link training begins at the previously cached levels which can result
> in link training failures.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

-- 
With best wishes
Dmitry
