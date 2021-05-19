Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908B3898F1
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 23:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232F6E3F2;
	Wed, 19 May 2021 21:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4D36E2BC;
 Wed, 19 May 2021 21:55:27 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so13112204otc.6; 
 Wed, 19 May 2021 14:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WLdhbkfROLOODKehFnwQndYXUu6pb9BwesCQWlQZNdw=;
 b=ie0hJN0J1C2ptZO8qi1rwwBfe5qDgM9zVvC+0SorSIPWHKQGGaqIf+9GBZNiPnX348
 bUXno7WfyzQeheWf1lJ1+C6o79BOayoWWMQ02Y5tJBJP/+NGKBWOtnZEhwHqRKzISQno
 w7RRr4ZS4XLTLSNjaVc5dVbW5agX3ceW9m3zAUVcykckevEMBC7OKJHSXnHfWuRGkA8F
 3qaKtB+qAj15J1EYhnHfOGv0vBaquLZ8/R2PNLuQjTmZzqGOq7+pDvydhjR4V1vSQoUe
 3Y9OqoHsWUiCyKAnAIP99+DaAqNwQbRcdOiMe87xitVO+oVROwyFYupCVf5MCR6bjB4n
 iq+A==
X-Gm-Message-State: AOAM530B0YJhMcbFh9PdTyoi88OAjvVIkKpNkUmzBoCA7chAXmfe4El0
 l0L4YAS5nUI9XjxFLeLWoQ==
X-Google-Smtp-Source: ABdhPJy49y22kLS9d/WyIC9ajGLpmAUxVb+mt4q2p/FqjQ7LQ4zq/L9X0mp5DRJqVySH6KSGKlsQBQ==
X-Received: by 2002:a9d:2271:: with SMTP id o104mr1314514ota.201.1621461326401; 
 Wed, 19 May 2021 14:55:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v22sm171283oic.37.2021.05.19.14.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 14:55:24 -0700 (PDT)
Received: (nullmailer pid 3727657 invoked by uid 1000);
 Wed, 19 May 2021 21:55:23 -0000
Date: Wed, 19 May 2021 16:55:23 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v16 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210519215523.GA3727626@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
 <1621332225-31918-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-3-git-send-email-mkrishn@codeaurora.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 15:33:44 +0530, Krishna Manikandan wrote:
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
> 
> Changes in v6:
>    - Add proper compatible string in example
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

Reviewed-by: Rob Herring <robh@kernel.org>
