Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC257A0D2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659F2ACCD;
	Tue, 19 Jul 2022 14:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EC12A89E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:11:03 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id q14so11837653iod.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Y5OqVVuKuyGM5tSfFefSufSVX//uNjIb8bTox4lv9B4=;
 b=cffdbYReRzKqndniwIy5ciOvhRWM8eYPdmWZ7mH2cNHLzkPSffpX7VHEOlIModLJZp
 182Db20QgOu001n+V6x4CQ+Wr9bs5UCcTD62oxwbIBcjvNWK5uLSFvgXjh/YlaS//rMl
 4WrD8tFUWSS9wGyjeG+k+Oy5IiRdBrDopLWq5gptTt5PbPTEOWEpISadRi0ZFrIKAIL3
 f/BOJBN92rHxCbo9Qm2AqUzCZOWUcYPlaI25HyUr8fD1osmr5ZEeREIJD6Ot+fjaw/IH
 N9tGJmZdCGr9UmBXtiiGswpq4ajZFcoDrnm4wgWYJaluB+GkN4rJgQZxkQSRFyM8tcGj
 a+TA==
X-Gm-Message-State: AJIora9ibgq+Sx+Yh/C4cqtorTPi8IWFHInZvCvfdaAndgSc4znM+Hmg
 njNkazdUvJ8BIEiWULD3bg==
X-Google-Smtp-Source: AGRyM1tmPybaNriO5iuTlCMQP3qIIAb3WcIZg9dLpekVyr22JqnJHiC9sY3jNqs/TtBNJeyAOdtU7A==
X-Received: by 2002:a05:6638:264d:b0:33f:5cb4:935f with SMTP id
 n13-20020a056638264d00b0033f5cb4935fmr16848739jat.98.1658239862483; 
 Tue, 19 Jul 2022 07:11:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a926b10000000b002dc1f1a7cc2sm5853691ilc.31.2022.07.19.07.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 07:11:02 -0700 (PDT)
Received: (nullmailer pid 1153345 invoked by uid 1000);
 Tue, 19 Jul 2022 14:11:00 -0000
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@connolly.tech>
In-Reply-To: <20220718213051.1475108-4-caleb@connolly.tech>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-4-caleb@connolly.tech>
Subject: Re: [PATCH 3/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Date: Tue, 19 Jul 2022 08:11:00 -0600
Message-Id: <1658239860.441333.1153344.nullmailer@robh.at.kernel.org>
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
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 22:30:50 +0100, Caleb Connolly wrote:
> From: Sumit Semwal <sumit.semwal@linaro.org>
> 
> LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [caleb: convert to yaml]
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/display/panel/lg,43408.yaml      | 41 +++++++++++++++++++
>  .../display/panel/panel-simple-dsi.yaml       |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,43408.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/lg,43408.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/lg,43408.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/lg,43408.yaml: duplicate '$id' value 'http://devicetree.org/schemas/display/panel/panel-lvds.yaml#'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

