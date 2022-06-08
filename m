Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E1543DF8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 22:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992F11A0F7;
	Wed,  8 Jun 2022 20:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ABD11A132
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 20:56:35 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so28759147fac.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
 b=mspAVxZx07cISScTn8vphHUwaC9+I1lJP/rNe4vCeLEPkIMfrye3kzXFsg8y30kNUQ
 E8axWJREnFK7kgXPPdhb40iW94D8vS94Xa+Q1cGSDK+kpoAIHLcEnO9xUwW2BqULnlQt
 JgsziaHWOF+CdH+0ugkPKHjk7GSuBnZrUas/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
 b=C6PzaAFD5gfS84jlT2IwZLkKlfcSQTOW48zgVw/hRF6W4JPDZvXM45nLPVxgANKc+v
 5qd0277gqFWJKIrl1dvyjOUxkaR+Xp8lqGmhJZrUV6+BE1JWbb5ak1mRXcgtdAFs9Bph
 nmqrt0G9djdOBDPwmlLUOpAzTIqt5JlXYwY/QrqgwCd+yM+/s8J0/fR4FkxUCYHOz/6m
 /QhDg7Nyn7oH7EbcUZRxdvT4ebhB6FvqePwMOIUBpYOK50oJNHM0DGTojIuU/vWJFfx5
 xGB2Jjw+UAblP43I8x1TEdkcnB79nlFlZoED/WvTz+GvYLrFBMHvVRtP87tBRnuK+pmy
 9QPQ==
X-Gm-Message-State: AOAM533w5H1FY6kNhHhRw05ZzIWjd0RMMgM7trrSGGaKFT0dK3VbiGVy
 6C9HeonXY5RWYNbv4zYGfL58ut8uDD1pBBJJy/qFNw==
X-Google-Smtp-Source: ABdhPJyIaQ3UiUYUvaiSPO44e3POU/qNgkGu5ZFpgew9NSUx88rB+R+DEX5E3FMCjq8MpcqYcFKBsJcgHwyAMwkkIzQ=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3367934oap.193.1654721794575; Wed, 08
 Jun 2022 13:56:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:34 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:56:34 -0700
Message-ID: <CAE-0n53UGHQXcU++xk+sXxNTg78_Na=Cw4Jjtmn_JtknW=r+5w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:13)
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
