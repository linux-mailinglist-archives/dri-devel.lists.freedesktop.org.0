Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D056AFCB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D34898C4;
	Fri,  8 Jul 2022 01:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979F10EFC4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:34:19 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso13732548fac.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4V1jJFFBwe0tkM3Ad5Ot/7v9+0qxLzwLjVqs7lYKRhs=;
 b=RHCML0O3BeCec/megjPGrCsRqQ5mbPdK58IEcrU+PY/dNU56gGGgb1h46RpENStZxq
 LhL7qLe4+vgxQ0h08J35HhTUyTqFH/C6E9v+ObEaM0TNh96UOLTbA+gPbTcaI97SKXgt
 7N23jcUWTGzK1fcK2Nu1mavb5UOqAigxH/+KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4V1jJFFBwe0tkM3Ad5Ot/7v9+0qxLzwLjVqs7lYKRhs=;
 b=DzQI21UOU9tdSXWi3jCDvCqG5w5X7MHLLAXBw3bMZ9KraL2lyRkI5Rx7hhXlcwfGmR
 avEOhKO7kz9ZLRTvfaIQZCApLTqZD3itfC/H1+ncF+DbuZ/hV40lkmHvmdIHDJtEyIi3
 n2tEgkJy1cp+tyTN7iOXij5HBUWzkLE5k1kI95LGT5nPAJnI14MTOKyMDWwDrxJx1STk
 mBxHaL9c/r7XuP+QJMns+Mr4AKK9Pv9Lux7aq92yxVksPsv8z6WZMqcE6fZqxkmkPCLZ
 D463/aF1v0L+pYG3/mYbimNKTLd33QZD3sAsYPJODhIFAWm4nnYWiv39YXGjaif28nk1
 FuRg==
X-Gm-Message-State: AJIora+pzNo8fYJ898qhUTPrTrNISeCF1pCFaK7oO7txKyREUOcmphLX
 VIw97xISbjno7zzbktkcwOY5qM8eIoBx3PbWCgQnHg==
X-Google-Smtp-Source: AGRyM1uZd+As7N/om9IBZ/Qo1/4OAME0XQal8tqtiWDDQMG8lxaPRcreILzi1QA3h+/OQ1eKkqN1gCUup3mg5cMWJGk=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr545769oap.63.1657243998193; Thu, 07 Jul
 2022 18:33:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:33:17 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:33:17 -0700
Message-ID: <CAE-0n51EA+YQudOwFU0S9OS17gc-iBEDUT3DYYHVbd2G1zWL=g@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: msm/dp: handle DP vs eDP difference
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

Quoting Dmitry Baryshkov (2022-07-07 14:32:01)
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. Also
> aux-bus should not be used for DP controllers. Take care of these
> differences.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
