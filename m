Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7257741F569
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 21:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEF86EF2E;
	Fri,  1 Oct 2021 19:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC966EF2E;
 Fri,  1 Oct 2021 19:03:42 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so12742305otj.2; 
 Fri, 01 Oct 2021 12:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=32WLAnTHFBoGOE/uJ6iRvB75W1i2TcrETEHjkCusN0w=;
 b=H0LSBPG8ttEwRmKNwvNtfjkAZTOYyfqPZdOKw8V0hi+dlpX47e+3vHWjaVrTvNr44y
 FvXJkJ0KZpptYrXfg1tG4tG37Q0w33cPxNI70ZKXWzgj6AjGtJUR0+m2MTanf9e/13HD
 AwiWefuk083h1Mh5dS2c2gpw660tAoS1N0OE0QfeP1gLYwCEJhWkDEXcxMRe5y27Hlhg
 4SEd53ADnmR4Zygpb3BH5wx5DgyXteIV4D+PH9pQ9rFLToIyKtLH++7dCHE2InoBoMg3
 2ESfKMLsK0j7lPDvyVhBDdn45y4qM2qyrQsAv38j1Y3y+F46gB69vGFOztBgFV2VTbor
 Ixkg==
X-Gm-Message-State: AOAM531xMY9uituNfom07LnPeF12ZkmsmQuFTZcCQGQFp1rcUMbsiT2D
 ePv3mj96Ln3lYcIZX2kbpA==
X-Google-Smtp-Source: ABdhPJxvqWx8WLaWrgLnXX754a4A9djuxZTWjsNil7QKepEnxsdlv1ptk1BXwQPeNQu83EeoL/L/pQ==
X-Received: by 2002:a05:6830:2685:: with SMTP id
 l5mr11810994otu.9.1633115021277; 
 Fri, 01 Oct 2021 12:03:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j23sm1289849oih.30.2021.10.01.12.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 12:03:40 -0700 (PDT)
Received: (nullmailer pid 4113074 invoked by uid 1000);
 Fri, 01 Oct 2021 19:03:37 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Paul <sean@poorly.run>
Cc: Rob Clark <robdclark@gmail.com>, jani.nikula@linux.intel.com,
 swboyd@chromium.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <khsieh@codeaurora.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>
In-Reply-To: <20211001151145.55916-13-sean@poorly.run>
References: <20211001151145.55916-1-sean@poorly.run>
 <20211001151145.55916-13-sean@poorly.run>
Subject: Re: [PATCH v3 12/14] dt-bindings: msm/dp: Add bindings for HDCP
 registers
Date: Fri, 01 Oct 2021 14:03:37 -0500
Message-Id: <1633115017.933633.4113073.nullmailer@robh.at.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Oct 2021 11:11:41 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
> 
> We'll use a new compatible string for this since the fields are optional.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> 
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> ---
> 
> Disclaimer: I really don't know if this is the right way to approach
> this. I tried using examples from other bindings, but feedback would be
> very much welcome on how I could add the optional register ranges.
> 
> 
>  .../bindings/display/msm/dp-controller.yaml   | 34 ++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:0: [0, 183042048, 0, 5120] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:1: [0, 183308288, 0, 372] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dt.yaml: example-0: displayport-controller@ae90000:reg:2: [0, 183373824, 0, 44] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535361

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

