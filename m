Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D551656AFC1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D9810FEAF;
	Fri,  8 Jul 2022 01:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470E389247
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:29:51 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id l81so25418513oif.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
 b=CykAEtsvYnPfrFIuJwuOCf0sw8z7xciHsnHSMcRh16QnXk6QlIvfrYCuLdkrEmDw8Y
 xUg/8KmL2U/g8kmyvsdHQy7ZmsMN3fBtiainjMMGzfllqj0dlPHpKGRfFA4CTnWyv2mx
 SaD57uEHfP6TCBWZoutJutR3hP34XDXxaOhfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
 b=yl0S7lp8gvL/TFXaSAJFzMMEnYfbMSYNwDzQSQ1dbuDj7SousNqwkWoEYK1QolTCgM
 mVG7wfkyAnbRnyl0mk/1EfoIHdmurjsP2ugWwhCf3W00WyQRDZdosEeRpzS/CuejVsyN
 +BZqyobrrU8f98Aq4kue/zGCZRXD+SfM9ZxKmVJIXkJexzrU33TFjhYaPXDdDYhkD4kA
 IKFS7kafgMtf9qfNBoRTAa48480cSgZlljEwu4fgnMWmHiQZICVbijDKi/5r7euxTnpD
 0+ASJEBPl867NLdtSLzeGO4wc6T+RV6P8O3oX6znBGTkgXzsEexwwVYmWBap3R8XmTmp
 LZag==
X-Gm-Message-State: AJIora+QgZqNZjLT6b7JHQoY55X5Je4twGPQeUWcCzhFJgJp1Q9mByr5
 rUxY2t/J8MmXW7cXnO33oOIot9WeUikn0ao9SBjWtw==
X-Google-Smtp-Source: AGRyM1uJ8/E8SerdAnJl3f3McgySgrfAOxikx5UkGEHyUZlQA3GOjpCjdWqPyZoanxplGHhTQrvxDsHhBt2MrfSEudI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr457469oil.193.1657243730587; Thu, 07 Jul
 2022 18:28:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:28:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:28:50 -0700
Message-ID: <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
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

Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
> The p1 region was probably added by mistake, none of the DTS files
> provides one (and the driver source code also doesn't use one). Drop it
> now.

Yes, looks like the driver doesn't use it.

>
> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 94bc6e1b6451..d6bbe58ef9e8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,7 +29,6 @@ properties:
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
> -      - description: p1 register block

The p1 registers exist on sc7180. They start where the example starts,
at 0xae91400.
