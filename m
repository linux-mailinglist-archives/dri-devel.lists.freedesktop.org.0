Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E021D8E2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 16:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14989F35;
	Mon, 13 Jul 2020 14:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF35689F35;
 Mon, 13 Jul 2020 14:46:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v8so13740713iox.2;
 Mon, 13 Jul 2020 07:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nbDwnmZqExm0GJ0AQBPbfTfEhmeWr4XCe+A+8/PM6M0=;
 b=M8tC/XzaWaVpE/pyf6bdV6K7h/Olc4K/auJt7Z66zxjPB4Q0BUe0nNuIReAAFBrmoI
 F2/JrLeisy0gLq81FtOZZpKMFTtr1U18ClLchLz0q5RvD4He4k8gz0id+VbKyhemJjTX
 WA+tfXKaU0NMelWqG+7l2CxUCCwScfMNE7phfV0guzDcXkcNFX6MAuO1XGSF2xUx9vW2
 Jz/32xNaeUl2pattxtYOm9A/35+rsPJMRwg4eXfJg8GJa41w/j1NpgUvz5kzq9BCz5RZ
 9o8Q7FFMfFzlQi2q5y8RQi9Fu4BI8Vde4NengUECQAdHzHd1EIs/xYUCRTspOBX61jEG
 gqQw==
X-Gm-Message-State: AOAM5323bAzqgbrBMkT4mp1tFh7R9CcicqStbszWBiOZUwaoOjyxbe2/
 g1NnSc9QmBksd6okQc/kVA==
X-Google-Smtp-Source: ABdhPJyC5hljtwK8AI4NvIkZ9UF+F6cv86WbaPgrtAlXxynhWmF1sbz5QKxouIpA7c6uyqRQqrL5Nw==
X-Received: by 2002:a05:6638:2615:: with SMTP id
 m21mr394291jat.134.1594651603099; 
 Mon, 13 Jul 2020 07:46:43 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s11sm8669417ili.79.2020.07.13.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 07:46:42 -0700 (PDT)
Received: (nullmailer pid 157351 invoked by uid 1000);
 Mon, 13 Jul 2020 14:46:40 -0000
Date: Mon, 13 Jul 2020 08:46:40 -0600
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [v5] dt-bindings: msm: disp: add yaml schemas for DPU and DSI
 bindings
Message-ID: <20200713144640.GA155367@bogus>
References: <1594389469-2573-1-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594389469-2573-1-git-send-email-mkrishn@codeaurora.org>
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

On Fri, 10 Jul 2020 19:27:49 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsytem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema
> for the device tree bindings for the same.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v2:
> 	- Changed dpu to DPU (Sam Ravnborg)
> 	- Fixed indentation issues (Sam Ravnborg)
> 	- Added empty line between different properties (Sam Ravnborg)
> 	- Replaced reference txt files with  their corresponding
> 	  yaml files (Sam Ravnborg)
> 	- Modified the file to use "|" only when it is
> 	  necessary (Sam Ravnborg)
> 
> Changes in v3:
> 	- Corrected the license used (Rob Herring)
> 	- Added maxItems for properties (Rob Herring)
> 	- Dropped generic descriptions (Rob Herring)
> 	- Added ranges property (Rob Herring)
> 	- Corrected the indendation (Rob Herring)
> 	- Added additionalProperties (Rob Herring)
> 	- Split dsi file into two, one for dsi controller
> 	  and another one for dsi phy per target (Rob Herring)
> 	- Corrected description for pinctrl-names (Rob Herring)
> 	- Corrected the examples used in yaml file (Rob Herring)
> 	- Delete dsi.txt and dpu.txt (Rob Herring)
> 
> Changes in v4:
> 	- Move schema up by one level (Rob Herring)
> 	- Add patternProperties for mdp node (Rob Herring)
> 	- Corrected description of some properties (Rob Herring)
> 
> Changes in v5:
> 	- Correct the indentation (Rob Herring)
> 	- Remove unnecessary description from properties (Rob Herring)
> 	- Correct the number of interconnect entries (Rob Herring)
> 	- Add interconnect names for sc7180 (Rob Herring)
> 	- Add description for ports (Rob Herring)
> 	- Remove common properties (Rob Herring)
> 	- Add unevalutatedProperties (Rob Herring)
> 	- Reference existing dsi controller yaml in the common
> 	  dsi controller file (Rob Herring)
> 	- Correct the description of clock names to include only the
> 	  clocks that are required (Rob Herring)
> 	- Remove properties which are already covered under the common
> 	  binding (Rob Herring)
> 	- Add dsi phy supply nodes which are required for sc7180 and
> 	  sdm845 targets (Rob Herring)
> 	- Add type ref for syscon-sfpb (Rob Herring)
> ---
>  .../bindings/display/dsi-controller.yaml           |   4 +-
>  .../bindings/display/msm/dpu-sc7180.yaml           | 230 +++++++++++++++++++
>  .../bindings/display/msm/dpu-sdm845.yaml           | 210 ++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        | 141 ------------
>  .../display/msm/dsi-common-controller.yaml         | 178 +++++++++++++++
>  .../display/msm/dsi-controller-sc7180.yaml         | 115 ++++++++++
>  .../display/msm/dsi-controller-sdm845.yaml         | 115 ++++++++++
>  .../bindings/display/msm/dsi-phy-sc7180.yaml       |  79 +++++++
>  .../bindings/display/msm/dsi-phy-sdm845.yaml       |  81 +++++++
>  .../devicetree/bindings/display/msm/dsi-phy.yaml   |  79 +++++++
>  .../devicetree/bindings/display/msm/dsi.txt        | 246 ---------------------
>  11 files changed, 1089 insertions(+), 389 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-common-controller.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dsi.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-controller-sc7180.example.dt.yaml: example-0: dsi@ae94000:reg:0: [0, 183058432, 0, 1024] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dpu-sdm845.example.dt.yaml: example-0: mdss@ae00000:reg:0: [0, 182452224, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:0: [0, 183059456, 0, 512] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:1: [0, 183059968, 0, 640] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sc7180.example.dt.yaml: example-0: dsi-phy@ae94400:reg:2: [0, 183060992, 0, 480] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dpu-sc7180.example.dt.yaml: example-0: mdss@ae00000:reg:0: [0, 182452224, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:0: [0, 183059456, 0, 512] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:1: [0, 183059968, 0, 640] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-sdm845.example.dt.yaml: example-0: dsi-phy@ae94400:reg:2: [0, 183060992, 0, 480] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-controller-sdm845.example.dt.yaml: example-0: dsi@ae94000:reg:0: [0, 183058432, 0, 1024] is too long


See https://patchwork.ozlabs.org/patch/1326868

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
