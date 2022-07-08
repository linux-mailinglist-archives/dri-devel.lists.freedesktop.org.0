Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09656AFC9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C209E10E14F;
	Fri,  8 Jul 2022 01:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767C810E14F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 01:33:49 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 t26-20020a9d775a000000b006168f7563daso15259295otl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
 b=HPhW9RBebWqkQ9PrCQBGni3TYxxHU0PMMIzS+aI8g7tdTc/ktP9jChMXoLxyZLZzok
 6jJbBqFyVY98ivY+HhPAl1eSH/pKrNe+5DUTFW4SQ2V5tO+sIDjoHSgR24wBj+m1u0lf
 WaYaF42SUgX3aZq6FtJWxMtiennDcPDH2n2vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=NZJnks1XrICiLmh83N/nfcU+CsA4QrBVqgFUGpAdW4k=;
 b=VP41C1Jqrzs82Ao5o6wDav9Lx1LxEtQj4PTPfKQ+ESd1bKiKGTO5kDXQUnt/gJDaKE
 8jfv4KgBlWMWd9ojsaJVIhII7RYr6QmypQ+hZFvrU8HdBt8dWP3JER2MXO5Ms/Nf8Gor
 7zFAxp6UqEmZxdJc/FnLJb3WDuQj7oOOB+sf+bW3mDUsZjbVTFgezgYyKDm/rYvWEUTS
 N7DGuDl9DpXwGnlSff7G3jd5mJWHuaQkHZgRp/1+v1s1cPocwd+yFzXsDLU0CgRGlEZ/
 7YmwecgAw0Pp+2ja8F82Exbkf1WfoFhwsgXMvtyiU0E+UJfz79LfLXkJAGGsyqA+FdDq
 vJkQ==
X-Gm-Message-State: AJIora81w0WCjsn4fT0pDJRh/nrdc19kjxYRImZwOxKkPyB8A0PngNhj
 GvTGbDN1ITTFMVUgXLq0gTT540bKJckkNv30GKIDqw==
X-Google-Smtp-Source: AGRyM1uyEcjzTSo/c6W2hKlHGeOkhVQpn/Aafq4q9l5KVnaNd85lX4vrq2pZIBrYfA8oXbPHME/u1frODdIdXteTN/I=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr474851otl.159.1657243968788; Thu, 07 Jul
 2022 18:32:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:32:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:32:48 -0700
Message-ID: <CAE-0n53An_S5H-jj7GPorLg0Q4jW=KqEn5CCrfqs6fn6LBtGNA@mail.gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: msm/dp: account for clocks specific for
 qcom, sc7280-edp
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

Quoting Dmitry Baryshkov (2022-07-07 14:32:00)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f00eae66196f..1ef845005b14 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -119,6 +111,50 @@ required:
>    - power-domains
>    - ports
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-edp
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: XO clock

What is this for? I would guess it's for the eDP phy, but that isn't
part of the eDP controller, so probably it can be removed.

> +            - description: eDP reference clock

Same for this one, looking at the binding for qcom,sc7280-edp-phy. Can
we simply remove these two clks from sc7280? I think it will be fine.
