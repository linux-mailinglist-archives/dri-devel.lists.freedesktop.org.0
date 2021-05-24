Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F012638F5D3
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 00:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB846E98E;
	Mon, 24 May 2021 22:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55286E98E;
 Mon, 24 May 2021 22:48:25 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id s19so28514872oic.7;
 Mon, 24 May 2021 15:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KpKDmmYFy0WymhW++fAl7+6dJhCoWfgKM1MbYWz2Ja0=;
 b=qp7QlCfohxyfUwbl7OPq1+xE4JOfgnK9Jpr0S8Udcu5Xd3sEEaRmYIv40TBiK9+WOK
 YPm84S9/0p58FBeVBdTv3AihFnUlQdWM8CFz7lLGDCe4kwhwlsdae6odXCvFWIb93Mdy
 PZfMxFVZO8HFvzYWy+u3m8Sxn6GfurhbTBnhu2u5nELn9h1KekoDqkt903fwnElb9ArM
 5YsgmeDVIGeR4eF2F21wypX4XZ4pEUgcsZjhcexd+DSJgy7yT/JMNpVDSCARDadZ69sM
 AQKrhTrxo3FFwtoi98+gh0yQ9FTWeQ+n16DpPflZS/qNiK6+OxkZ8RYtgABKajBp6jNP
 2sPQ==
X-Gm-Message-State: AOAM532JIj5eDdRdB2XZLwTyrQX3nh7NC1ENjkJrn3sBygkBF7TNUNTM
 l26UZVU79/nXFDHPM0i6cKQAbNxtkA==
X-Google-Smtp-Source: ABdhPJz5h2oM8aTFPJKI31HulznG3xW2XN9lU0oXrZlOIYquqz8vF2erRkrzWxbLCYco4ih9DhrhXw==
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr886196oie.78.1621896494189; 
 Mon, 24 May 2021 15:48:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c19sm2881987oiw.7.2021.05.24.15.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 15:48:13 -0700 (PDT)
Received: (nullmailer pid 1314077 invoked by uid 1000);
 Mon, 24 May 2021 22:48:12 -0000
Date: Mon, 24 May 2021 17:48:12 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v18 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
Message-ID: <20210524224812.GA1314047@robh.at.kernel.org>
References: <1621856653-10649-1-git-send-email-mkrishn@codeaurora.org>
 <1621856653-10649-2-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621856653-10649-2-git-send-email-mkrishn@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, tanmay@codeaurora.org,
 vinod.koul@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 17:14:11 +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v1:
>     - Separate dsi controller bindings to a separate patch (Stephen Boyd)
>     - Merge dsi-common-controller.yaml and dsi-controller-main.yaml to
>       a single file (Stephen Boyd)
>     - Drop supply entries and definitions from properties (Stephen Boyd)
>     - Modify phy-names property for dsi controller (Stephen Boyd)
>     - Remove boolean from description (Stephen Boyd)
>     - Drop pinctrl properties as they are standard entries (Stephen Boyd)
>     - Modify the description for ports property and keep the reference
>       to the generic binding where this is defined (Stephen Boyd)
>     - Add description to clock names (Stephen Boyd)
>     - Correct the indendation (Stephen Boyd)
>     - Drop the label for display dt nodes and correct the node
>       name (Stephen Boyd)
> 
> Changes in v2:
>     - Drop maxItems for clock (Stephen Boyd)
>     - Drop qcom,mdss-mdp-transfer-time-us as it is not used in upstream
>       dt file (Stephen Boyd)
>     - Keep child node directly under soc node (Stephen Boyd)
>     - Drop qcom,sync-dual-dsi as it is not used in upstream dt
> 
> Changes in v3:
>     - Add description for register property (Stephen Boyd)
> 
> Changes in v4:
>     - Add maxItems for phys property (Stephen Boyd)
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add reference for data-lanes property (Stephen Boyd)
>     - Remove soc from example (Stephen Boyd)
> 
> Changes in v5:
>     - Modify title and description (Stephen Boyd)
>     - Add required properties for ports node (Stephen Boyd)
>     - Add data-lanes in the example (Stephen Boyd)
>     - Drop qcom,master-dsi property (Stephen Boyd)
> 
> Changes in v6:
>     - Add required properties for port@0, port@1 and corresponding
>       endpoints (Stephen Boyd)
>     - Add address-cells and size-cells for ports (Stephen Boyd)
>     - Use additionalProperties instead of unevaluatedProperties (Stephen Boyd)
> 
> Changes in v7:
>     - Add reference for ports and data-lanes (Rob Herring)
>     - Add maxItems and minItems for data-lanes (Rob Herring)
> 
> Changes in v8:
>     - Drop common properties and description from ports (Rob Herring)
>     - Add reference for endpoint (Rob Herring)
>     - Add correct reference for data-lanes (Rob Herring)
>     - Drop common properties from required list for ports (Rob Herring)
> 
> Changes in v9:
>     - Drop reference for data-lanes (Rob Herring)
>     - Add unevaluatedProperties for endpoint (Rob Herring)
> 
>  .../bindings/display/msm/dsi-controller-main.yaml  | 185 +++++++++++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 249 ---------------------
>  2 files changed, 185 insertions(+), 249 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
