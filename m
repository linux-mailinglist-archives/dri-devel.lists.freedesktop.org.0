Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83659CEE5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 04:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8210FE18;
	Tue, 23 Aug 2022 02:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2E14A74F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 02:59:17 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o184so14536330oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=qvhp/PN3z9UpYVuMsgcJC4Oy2/ZRSa/rXP6JnlrnMVE=;
 b=az+vjmCRAiH8OVkG5/hU8PD2mFnzsja9goZnbrBMHJd9nLcMTnLUg5MiEHoyqh7jnn
 wOm2wIMzhexx42WIblyq8kcg9WEyY9FzVna4DLoKKH1w+M2Cq4b5R9tmHYyFgC1mr41J
 kw9XBhn4x9y4g33vGeg83eV0TlNqNNSq7q2ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=qvhp/PN3z9UpYVuMsgcJC4Oy2/ZRSa/rXP6JnlrnMVE=;
 b=tpGCmxR4p0GK0+aGM9D2Gue7LtUkX6iqPoDFcyQd6LgTpE2C6+CeUDSAiACbU/FchB
 yYyNNlvBAQHmhulaoXe44elku0EkoHXYENatjYiTDSWYGpHXYOexNGJ7L5C2HW1t9wng
 s2tOuDLqfYTetxlxmJ+U3m+iyR/HNmPKZchqFFARcyJX7qwoCs7ObCcBxe+6dRiJihR6
 0QEDLEVZbaiZIAVy3UvfqFseThtgvkgI5UXjB/TSkeGo7LPUqJ6v6vxa6vsHHFnIwC0o
 W54/js3XZ8UjoKNgQIgxCL/tEtYwH0pDw8ZvmH+lvTUo8xoaqvo0aeykyMlFZTYAJkhf
 d6bQ==
X-Gm-Message-State: ACgBeo3A4aWLEnpve3sAxuhmqU/vDzqKS96Vg5bJfy/s3h8iRCpIehug
 d8MQP75FWKjGSrxIhlxntMS1GuEeEsZ0Ym8lXXvm9A==
X-Google-Smtp-Source: AA6agR6PXqCt0LKI+xicsTuPHjDNzX2YEQK4O0g6hF3ynofM3wUo3dz/OhsSM+18FJV2/aaMHYV1we5XWzeZaGEQuP4=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr508119oik.0.1661223557231; Mon, 22 Aug
 2022 19:59:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:59:16 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-3-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
 <20220822184900.307160-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:59:16 -0500
Message-ID: <CAE-0n50MJFha_OZqcF68rTGwNJmUo-34+erkw=7k3yEvXFg+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: msm/dp: add missing properties
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:48:59)
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 391910d91e43..52cbf00df0ba 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -70,9 +70,21 @@ properties:
>    operating-points-v2:
>      maxItems: 1
>
> +  opp-table: true
> +
>    power-domains:
>      maxItems: 1
>
> +  aux-bus:
> +    $ref: /schemas/display/dp-aux-bus.yaml#
> +
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      maximum: 3

It should be marked deprecated, right?
