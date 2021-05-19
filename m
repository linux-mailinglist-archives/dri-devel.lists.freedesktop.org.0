Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE83898D5
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 23:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DCB6E2B6;
	Wed, 19 May 2021 21:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF766E2B6;
 Wed, 19 May 2021 21:48:58 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso13100879otn.3; 
 Wed, 19 May 2021 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DKBY4C70+yMGXVKS4zX8Rv3RkluTwSHLjx9Ijn2Fbu0=;
 b=KLZELTpCFkdnFFpLmzn+c+V9LskREPF6pP9clIyNOMTulWUEbcWJUquNkjeHEz8Fob
 B5NMX+uQaJ488XMz7GEao55kkRCo0e9nYD+j681CwIjxcuDLDJLwGmxBV+q37Oy3kzXJ
 fCeLSeK8uDrXfPNFADM9ExOoWm0HdopiErFY5MKNB7Eyh0ga8o95FDCkjJjgeXVLADx8
 gaGsYHgVKRhRTpoXNe1tfvY2cwnPoau/bijR2OSYAJz1p0EBPfCD2pwvJIeMS1Qfej6m
 gCbMt0k+0O/iv+361Sj0FECogX4qhEwI+kg+H1iGJCRZk53hQFnNz+AnnRUloY8UZjEs
 ysIA==
X-Gm-Message-State: AOAM532v8plWASnzWw8m/mX4cSlyeGAhicTmh+5dedoM8xdjM4JTZHQA
 xKqgdkqs8U6CkbJzDpvGVw==
X-Google-Smtp-Source: ABdhPJye89tMFxcBxGyJDTEoGXfkCtFUTPgxthvAlCu61laiKziMZZtdD04ofYvGHcI35GzSfLpUag==
X-Received: by 2002:a9d:61cb:: with SMTP id h11mr1263447otk.19.1621460937495; 
 Wed, 19 May 2021 14:48:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i18sm129061oot.48.2021.05.19.14.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 14:48:56 -0700 (PDT)
Received: (nullmailer pid 3717476 invoked by uid 1000);
 Wed, 19 May 2021 21:48:55 -0000
Date: Wed, 19 May 2021 16:48:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v16 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
Message-ID: <20210519214855.GA3717420@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, vinod.koul@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org, tanmay@codeaurora.org,
 swboyd@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 15:33:42 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for DPU device tree bindings.
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
> 
> Changes in v9:
>     - Combine target specific dsi controller yaml files
>       to a single yaml file (Rob Herring)
>     - Combine target specific dsi phy yaml files into a
>       single yaml file (Rob Herring)
>     - Use unevaluatedProperties and additionalProperties
>       wherever required
>     - Remove duplicate properties from common yaml files
> 
> Changes in v10:
>     - Split the patch into separate patches for DPU, DSI and
>       PHY (Stephen Boyd)
>     - Drop unnecessary fullstop (Stephen Boyd)
>     - Add newline whereever required (Stephen Boyd)
>     - Add description for clock used (Stephen Boyd)
>     - Modify the description for interconnect entries  (Stephen Boyd)
>     - Drop assigned clock entries as it a generic property (Stephen Boyd)
>     - Correct the definition for interrupts (Stephen Boyd)
>     - Drop clock names from required properties (Stephen Boyd)
>     - Drop labels for display nodes from example (Stephen Boyd)
>     - Drop flags from interrupts entries (Stephen Boyd)
> 
> Changes in v11:
>     - Drop maxItems for clocks (Stephen Boyd)
> 
> Changes in v12:
>     - Add description for register property (Stephen Boyd)
>     - Add maxItems for interrupts (Stephen Boyd)
>     - Add description for iommus property (Stephen Boyd)
>     - Add description for interconnects (Stephen Boyd)
>     - Change display node name to display_controller (Stephen Boyd)
> 
> Changes in v13:
>     - Add maxItems for reg property (Stephen Boyd)
>     - Add ranges property in example (Stephen Boyd)
>     - Modify description for iommus property (Stephen Boyd)
>     - Add Dp bindings for ports in the same patch (Stephen Boyd)
>     - Remove soc from examples and change address and size cells
>       accordingly (Stephen Boyd)
>     - Add reference for ports
> 
> Changes in v14:
>     - Modify title for SC7180 and SDM845 yaml files (Stephen Boyd)
>     - Add required list for display-controller node (Stephen Boyd)
> 
> Changes in v16:
>     - Add reference for port (Rob Herring)
>     - Make additionalProperties as false (Rob Herring)
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml           | 228 +++++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 212 +++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 -------------
>  3 files changed, 440 insertions(+), 141 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
