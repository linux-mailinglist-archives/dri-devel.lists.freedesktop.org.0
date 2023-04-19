Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE76E7984
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 14:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF37F10E949;
	Wed, 19 Apr 2023 12:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B76C10E949
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 12:20:25 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-18785c2f39fso866425fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 05:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681906824; x=1684498824;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vDWn7LWX55rdAgK8lkZTjI/cl/gmcQIjVsQZmuaFPok=;
 b=dqhAIYvQW3jM8eeTea3V1IeLzma09XSf7aZ8oIbFVPb3vwbgcSEXGyjcmrAYGhYFRS
 gbvRkDZO/JaaSmk5bbH3XM4FjvilVjDfHQCPLITID+s73EjVt39y7tuisllHMFPQwMpM
 55kOfj6S4vGlsyCnZvWdce/r6NkJdHANNp1QAvz1XQBOgwQxwVUNpBbXg6QwqtuoAjk0
 pfUls2/UXaXYqJL7ySHcDC1y2bIvpwAO9DkA4FtEdjcNF2QrR3hzO90EfYXJpQYdSMxk
 v3wV3V+TgUWKPRIMzG9VkK5G8kvqrJ78Ujvgx3/pcluvnzuGeggYUVkbyAhfusvBq9Ba
 NswA==
X-Gm-Message-State: AAQBX9dwb6weUsicLGTkhPHrSJk4dpqxYZz6Y4AEqQLnGCpzXv7DvHxV
 AZ+Z56vJpfsakf52fBQteA==
X-Google-Smtp-Source: AKy350achMGLsukLbt5lzLwN1OM7sY4Y18eDzdY5EhXFZgcfFGxbh3Xvp0buod3QAyAniCdmJL8Ycg==
X-Received: by 2002:a05:6870:f295:b0:17f:e768:60fb with SMTP id
 u21-20020a056870f29500b0017fe76860fbmr3024069oap.54.1681906823992; 
 Wed, 19 Apr 2023 05:20:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 64-20020a4a0143000000b00529cc3986c8sm6920510oor.40.2023.04.19.05.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 05:20:23 -0700 (PDT)
Received: (nullmailer pid 3779626 invoked by uid 1000);
 Wed, 19 Apr 2023 12:20:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justinpopo6@gmail.com>
In-Reply-To: <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
 <1681863018-28006-2-git-send-email-justinpopo6@gmail.com>
Message-Id: <168190678873.3778743.3635324500677416742.robh@kernel.org>
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Date: Wed, 19 Apr 2023 07:20:22 -0500
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
Cc: andrew@lunn.ch, dri-devel@lists.freedesktop.org, justin.chen@broadcom.com,
 edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 richardcochran@gmail.com, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 18 Apr 2023 17:10:13 -0700, Justin Chen wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> ---
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: asp@9c00000: mdio@c614:compatible:0: 'brcm,asp-v2.0-mdio' is not one of ['brcm,genet-mdio-v1', 'brcm,genet-mdio-v2', 'brcm,genet-mdio-v3', 'brcm,genet-mdio-v4', 'brcm,genet-mdio-v5', 'brcm,unimac-mdio']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: asp@9c00000: mdio@c614: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: asp@9c00000: mdio@ce14:compatible:0: 'brcm,asp-v2.0-mdio' is not one of ['brcm,genet-mdio-v1', 'brcm,genet-mdio-v2', 'brcm,genet-mdio-v3', 'brcm,genet-mdio-v4', 'brcm,genet-mdio-v5', 'brcm,unimac-mdio']
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: asp@9c00000: mdio@ce14: Unevaluated properties are not allowed ('compatible' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: /example-0/asp@9c00000/mdio@c614: failed to match any schema with compatible: ['brcm,asp-v2.0-mdio']
Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: /example-0/asp@9c00000/mdio@ce14: failed to match any schema with compatible: ['brcm,asp-v2.0-mdio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1681863018-28006-2-git-send-email-justinpopo6@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

