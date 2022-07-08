Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC056AFCF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101E0112A00;
	Fri,  8 Jul 2022 01:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F823112A00
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:35:34 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id i126so25449078oih.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TQpl5B+0hWufVFjVqqJcq4KlF7PnqVm/SI/AJ6WncfM=;
 b=SpXjqtfNgTrQWcax3vJDG2y9BzLbH/0KkJT+pWMYKethklQEnaTEPShccD5cvWLHPg
 QJg1dgZfhZInlscmdV2+fz/uMpvzt6FxpmFcHdu5JgJg0cVhh4LLEINtpWo+PukPsTC0
 eO9TuwKtBmwWjXpnI2SxFAr+0QhbCp0ai+dR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TQpl5B+0hWufVFjVqqJcq4KlF7PnqVm/SI/AJ6WncfM=;
 b=G9WBsjpH6OrbLbFdwCo45jwSg5adrkVbaRbJeDcgQY8n2I8C+2MH4mljA32sJTU7PC
 H8GdH1xkTosx5TqXEA2LGdHz/ApevOwbHPgaHw6Lscj2m211bGGUEq6jEDEvkzJa/1Ad
 2S0/smjLgNojotiXLkMiIxLOyw8sLU3IV5zk2KzwVcvb60PJ2Rgo/AjCdjnsg4oYd6Bq
 qvUDwF5dFrh9Gb+RvVCLdPyQigx3ZwllYtgcuKn0aeFdBsbozLPV2lVoWpaW++3ECLGr
 4r7ZtgePhkDWK33WS2S4r1xTO8EXWTu9uZKiejKHA/z0B1OEnoeDkL/elYNx4OC/q+N9
 S6GQ==
X-Gm-Message-State: AJIora9foCyIbk/jO8nydI+oZbaBvBaI/O4g3kzX+moglP3HE4ehMY/8
 dIgn/FFyWvY9EDViZ3fUePzLewCNPAP7c5c8HbLYrA==
X-Google-Smtp-Source: AGRyM1tTsAzOgDKcA9SVpIMxetlrFugPxbCIiIKPc6PvKc5O2dFGuLHvqmrSiLVP09rpp9TI8YtG5hoeWDuMH6201ug=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr466507oil.193.1657244073489; Thu, 07 Jul
 2022 18:34:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:34:33 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-9-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-9-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:34:33 -0700
Message-ID: <CAE-0n52g1z3tgoeD6QziNNfVz7XSMswWEFLmJHtZ+mkQO-J6ZQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: drop #clock-cells from
 displayport-controller
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

Quoting Dmitry Baryshkov (2022-07-07 14:32:03)
> Drop #clock-cells from DP device node. It is a leftover from the times
> before splitting the it into controller and PHY devices. Now clocks are
> provided by the PHY, while the controller doesn't provide any clocks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Same "the it" comment.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
