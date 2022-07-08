Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B956AFC5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6DE10FB57;
	Fri,  8 Jul 2022 01:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80210F42C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:31:32 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s188so25192005oib.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
 b=Ue0qNkMJastmFq+YudyeYt2KIe+niHTqyrivhnn+9BmvMSOmjJzkOt/UBQWfBf2b53
 cC1+vGvZvdYF516WCMQwCHxWN3Q/j7JhyJOecljID8oFeNWFvSQkgWYcRvUfp8fhypoT
 fqeCky+as3DBGScPTDOT6uHMYWv6Qge4d41+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
 b=Qi40hzWzSBzr+Fba+FnEeoiejoGMqzPzD/y1LY04xmbbQV3+PH/gFl7JesOxaO9OJi
 FYDii752e34hMjXQdmYCbogIggsCp3fIrEEHb1Y/jDj7meIDZbDcThG7ZjjWTTsqTojL
 K6oUJ/ox6hGhUOu2WVqDBxyX6FgXd2eokcwmXun4Gqup5Ix3zJehjzk4N7KL7XXvVwxc
 7Lpx0VKFGrx70DXW38L9GX3OCR6RE3FPJTi+VJUxpcAUFyTPKOwPYwa8A5ZUzQMyGAxo
 LgLuNABeLlwAu6r4GxQtGAT9zfLjxAUx8y4hbbaiqWdiFkrcMeV5F9ehYhkBjhRsaXwB
 VNeQ==
X-Gm-Message-State: AJIora9aSgoKYesFFsTR0j+1FC67IwCTUWRi00zed0OCZIrijmU5IlTn
 Yq3AcffSH4NcjytuRDq6a/SW9MkfaGAkRekVdAmKaw==
X-Google-Smtp-Source: AGRyM1seFnmCmW9IUueoNP90VpqA1jwKAoGBliX7GDJogEyAv6R8J1FU+8CcIIRVxUr4LlXHPKu47wp3cT8ZmPpjRSE=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr498377oib.63.1657243832038; Thu, 07
 Jul 2022 18:30:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:30:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:30:31 -0700
Message-ID: <CAE-0n53ES+cLCWpd_T1bohybNrw4V7ntj87AbsesQJcmFedcgw@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: msm/dp: add missing properties
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

Quoting Dmitry Baryshkov (2022-07-07 14:31:59)
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (eDP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
