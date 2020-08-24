Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC597250BF5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 00:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67DA6E5D1;
	Mon, 24 Aug 2020 22:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A16C6E5D1;
 Mon, 24 Aug 2020 22:57:05 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id g13so10509096ioo.9;
 Mon, 24 Aug 2020 15:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xVGE6rEY1RUDdQNh7SGiTq/hwvuBPw98UGPGdGtkR3s=;
 b=XIDKYipVfwjRil4Ep+BGT+VaiOFuHtXTtAGah297VgvhlReJ+BUGrYW1i2Fd+1Gsx4
 cPcB5duRXyuvtn/0FjBzuPirmnDYBB8gS3okHzCBCJm5oJbFBRpYvxZwuQbDhlU1EQp8
 kfgtRYKN55tzBpgiJBXFvLxeoaHhf2xvNEB+q7bCt9cdrAP18HyPckUi6L15O4UyXGJe
 Pa3sZdVbztDvh9y84M29T1ej0Q5cStGdY9xkEYVHByuuOazeJuTSIsdQVmU+u0ougHfT
 oK3jxGTtZp+sTFXpC7xoNOfnCwHQSKGyHXNnLthO5zF+ADrfaAUgVn7sUL5OCFUDCvEl
 zQ2Q==
X-Gm-Message-State: AOAM532Ocg1eJPAhnqykLRCz4qL0SlJ3HdrnhdnuE2Mut59x6rV3T5B1
 1nxekl7Y8PU/5M8aMzcbfpw2iKBklg==
X-Google-Smtp-Source: ABdhPJxZzTqlGIuc2GQiyiK402zSrSHAuiMtS1zh+LVYBDoR7GLuyYLF4mBV82z4DWNQVeHgr2UhYQ==
X-Received: by 2002:a6b:6204:: with SMTP id f4mr6678058iog.56.1598309824569;
 Mon, 24 Aug 2020 15:57:04 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id i11sm7909593ilr.47.2020.08.24.15.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 15:57:03 -0700 (PDT)
Received: (nullmailer pid 3486301 invoked by uid 1000);
 Mon, 24 Aug 2020 22:57:02 -0000
Date: Mon, 24 Aug 2020 16:57:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: add yaml schemas for DPU and
 DSI bindings
Message-ID: <20200824225702.GA3460018@bogus>
References: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 07:08:02PM +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
>     - Changed dpu to DPU (Sam Ravnborg)
>     - Fixed indentation issues (Sam Ravnborg)
>     - Added empty line between different properties (Sam Ravnborg)
>     - Replaced reference txt files with  their corresponding
>       yaml files (Sam Ravnborg)
>     - Modified the file to use "|" only when it is
>       necessary (Sam Ravnborg)
> 
> Changes in v3:
>     - Corrected the license used (Rob Herring)
>     - Added maxItems for properties (Rob Herring)
>     - Dropped generic descriptions (Rob Herring)
>     - Added ranges property (Rob Herring)
>     - Corrected the indendation (Rob Herring)
>     - Added additionalProperties (Rob Herring)
>     - Split dsi file into two, one for dsi controller
>       and another one for dsi phy per target (Rob Herring)
>     - Corrected description for pinctrl-names (Rob Herring)
>     - Corrected the examples used in yaml file (Rob Herring)
>     - Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
>     - Move schema up by one level (Rob Herring)
>     - Add patternProperties for mdp node (Rob Herring)
>     - Corrected description of some properties (Rob Herring)
> 
> Changes in v5:
>     - Correct the indentation (Rob Herring)
>     - Remove unnecessary description from properties (Rob Herring)
>     - Correct the number of interconnect entries (Rob Herring)
>     - Add interconnect names for sc7180 (Rob Herring)
>     - Add description for ports (Rob Herring)
>     - Remove common properties (Rob Herring)
>     - Add unevalutatedProperties (Rob Herring)
>     - Reference existing dsi controller yaml in the common
>       dsi controller file (Rob Herring)
>     - Correct the description of clock names to include only the
>       clocks that are required (Rob Herring)
>     - Remove properties which are already covered under the common
>       binding (Rob Herring)
>     - Add dsi phy supply nodes which are required for sc7180 and
>       sdm845 targets (Rob Herring)
>     - Add type ref for syscon-sfpb (Rob Herring)
> 
> Changes in v6:
>     - Fixed errors during dt_binding_check (Rob Herring)
>     - Add maxItems for phys and phys-names (Rob Herring)
>     - Use unevaluatedProperties wherever required (Rob Herring)
>     - Removed interrupt controller from required properties for
>       dsi controller (Rob Herring)
>     - Add constraints for dsi-phy reg-names based on the compatible
>       phy version (Rob Herring)
>     - Add constraints for dsi-phy supply nodes based on the
>       compatible phy version (Rob Herring)
> 
> Changes in v7:
>     - Add default value for qcom,mdss-mdp-transfer-time-us (Rob Herring)
>     - Modify the schema for data-lanes (Rob Herring)
>     - Split the phy schema into separate schemas based on
>       the phy version (Rob Herring)
> 
> Changes in v8:
>     - Resolve merge conflicts with latest dsi.txt file
>     - Include dp yaml change also in the same series

I'm done reviewing this because I'm tired of repeating myself and you're 
just throwing crap at the wall and seeing what sticks. Get someone else 
working on QCom stuff to review because I'm done until someone I know 
and trust reviews it.

> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 236 +++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 216 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-common-controller.yaml         | 249 +++++++++++++++++++++
>  .../display/msm/dsi-controller-sc7180.yaml         | 120 ++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 120 ++++++++++

Once again, what's the difference between dsi-controller-sc7180.yaml and 
dsi-controller-sdm845.yaml? I don't see one. If there's not a 
difference, why do we have msm/dsi-common-controller.yaml? If there is a 
difference dsi-controller-sc7180.yaml and dsi-controller-sdm845.yaml 
should *only* have what's different because 
msm/dsi-common-controller.yaml should have everything that is the same.

>  .../bindings/display/msm/dsi-phy-10nm.yaml         |  62 +++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |  62 +++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         |  66 ++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         |  62 +++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  80 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  82 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 247 --------------------
>  13 files changed, 1355 insertions(+), 388 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
