Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79F570E07
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 01:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85228BE18;
	Mon, 11 Jul 2022 23:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911528AF36;
 Mon, 11 Jul 2022 23:14:11 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id r76so6350107iod.10;
 Mon, 11 Jul 2022 16:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jumFwK9AGbuw9kGgRypv2bAf7SdJSaOWQBO8STW7sIs=;
 b=2wi1+/6TtvpebQZOtgnBzM8gSpGPtTzi3YsXeScukXQSrg5GCvehmfSaktAPlEFG/G
 BeRqmnck+yRb1QaJE+OMXwPkkxIdovElexFdnGN6RTeCXy37Q+y5WW6JiWmP28Rtdisk
 Xf76Le3+oXnqML9/zzyUFrDQCcCPRGi87Lfxw0LW8Git2bu02GbIsoxGhWkSqF9Y+qFG
 8JCKcD7MCu9RsIgi+hcKiQCva4bQbgC6Tk21ytkRuEdMXmjkoGb8PFaBPwHnC1jSKvFz
 b/RWZQ2cWC3nuIa7Jwcl8Uup+y06cVl1m7oAT6WdWX0GTr1AaDnysmbxUAxi760PblDr
 kr4w==
X-Gm-Message-State: AJIora9lvUrb7uZ7elHOKdRxdTBOkMQZVEHZnZlvZsDEK9oHYANekcvh
 MJqwXSVGdi2gQA8C1JNcsA==
X-Google-Smtp-Source: AGRyM1vPxgUEpN0i8lM1LCBi9mDWLlkHFHm+Ttu/CfuM1eV6NvUwcHx/wnckUb8o2p/1IymFz+cRjA==
X-Received: by 2002:a05:6602:2c49:b0:67b:a4c7:33a5 with SMTP id
 x9-20020a0566022c4900b0067ba4c733a5mr740339iov.151.1657581250743; 
 Mon, 11 Jul 2022 16:14:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a05663822b600b00335c0e07abdsm3467799jas.14.2022.07.11.16.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 16:14:10 -0700 (PDT)
Received: (nullmailer pid 449698 invoked by uid 1000);
 Mon, 11 Jul 2022 23:14:07 -0000
Date: Mon, 11 Jul 2022 17:14:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Message-ID: <20220711231407.GA449642-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
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
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 11:41:31 +0300, Dmitry Baryshkov wrote:
> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies
> from the DP controller driver. These supplies are now handled by the eDP
> or QMP PHYs. Mark these properties as deprecated and drop them from the
> example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
