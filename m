Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9863554F6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 15:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C463899DB;
	Tue,  6 Apr 2021 13:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F30899DB;
 Tue,  6 Apr 2021 13:24:10 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so3697386ook.2; 
 Tue, 06 Apr 2021 06:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=KqiWovFcA0VWUEW5WeOEp/JpvO8enKS6XaPrtTWARiI=;
 b=CMJIz7ipaY4ZDxMei9fs2WmPP7bwcBmQRW+UFGhcLC9SGO9CbPKV9UkqjHLReAydVO
 Ws+uD3s9Vn1yj49Ix97CrITNWxv7LNt0/jjc3igcS8L9d1yHWIMUg1ZhSvYpwU3P31Q3
 NqX9Y2o/4A3C7oXfd961Sj94fu4dRRu5RvjZilfGgnFR2pPCUcF/NtfIVRSkl28P65h/
 puUC89ocMatf9uY0AsfBunE+ZU9YckyU3LyJvn3jmKGvNHewGGh9OW8znwneKtyu701R
 Aj00ghLF55IiGv67mU/lovSKXhWIITplnf9fXKQa3qy4Dzi6jhRcetgylG6mwvVbmcqW
 u+qg==
X-Gm-Message-State: AOAM533pnE9vhnn4fxNmw95bPeHBd9E3YrLs0EAZIkQnilwAQIoMQcma
 xUCXFwcw8QKlxUoQM/997g==
X-Google-Smtp-Source: ABdhPJxJ41PdfLWO25H89QYPRHvvbckpBygxU6F09QKrCy3911/J1yRX6LxM3v5h+JUwJEogJi7wcA==
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr26861642ooj.25.1617715449941; 
 Tue, 06 Apr 2021 06:24:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a6sm4670188otb.41.2021.04.06.06.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:24:08 -0700 (PDT)
Received: (nullmailer pid 1674498 invoked by uid 1000);
 Tue, 06 Apr 2021 13:24:05 -0000
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
In-Reply-To: <1617620770-26202-3-git-send-email-mkrishn@codeaurora.org>
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
 <1617620770-26202-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v15 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Date: Tue, 06 Apr 2021 08:24:05 -0500
Message-Id: <1617715445.168054.1674497.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org, vinod.koul@linaro.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tanmay@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Apr 2021 16:36:09 +0530, Krishna Manikandan wrote:
> Add YAML schema for the device tree bindings for DSI PHY.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
> 
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> 
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
> 
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
> 
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
>  5 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.example.dt.yaml:0:0: /example-0/dsi-phy@fd922a00: failed to match any schema with compatible: ['qcom,dsi-phy-28nm']

See https://patchwork.ozlabs.org/patch/1462327

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
