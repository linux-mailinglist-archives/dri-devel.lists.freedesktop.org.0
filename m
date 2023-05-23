Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B333970E901
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 00:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9345610E514;
	Tue, 23 May 2023 22:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A72610E514
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 22:18:20 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6af754a2f2cso130302a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684880299; x=1687472299;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0/95G6TtWDMqnJqi09q4BRdDKrrrr1cl8z6kSG/6bRA=;
 b=EpgcMKYX7ZmcZXeWw9ncSTvvIo+JDU+pU9qQBWhs6KpRW3NwhdOWdvseVwDIw+6OV1
 L9i/jktqYNGBtXzShKMjjQS2G3pvT0YzoKMp/9sa7vFLsuGQFxSnB1tCsAc0j5QWSlE1
 0UzegNXAcrRhU1IZ9GfuV5o/89e4x//dzsKE+ZDnlxXE/XbvX7g5C8Q6PKzyaCrA8BD2
 Zlr4aB2XnJBNVQfIYJrXGC3IEj1b5AlYiArz61zNb9xLKnQU6nqoxf66nezbEdhfw/qW
 1TO4hcV4ky7yb2kOb6hYgd9dXdVlafhsD+77gXbccwoesGrTyl1L0tklJVi7GfkmDV2P
 GHAQ==
X-Gm-Message-State: AC+VfDwd0mxqzH52gYRqlz0jRguP7ocynyI2n5x5vcrMwb2xO9IlN6IR
 bWJIWEbUDOft8R7XhTtvPA==
X-Google-Smtp-Source: ACHHUZ4QOOvthD3w2RdBiE5VTT3ti9m94NuJVi4/VOv1vNaUnI/8iObgUbyNTlHl5zM/LlxIgDjLdA==
X-Received: by 2002:a05:6830:1d66:b0:6a5:ea63:b9e6 with SMTP id
 l6-20020a0568301d6600b006a5ea63b9e6mr7643237oti.16.1684880298905; 
 Tue, 23 May 2023 15:18:18 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v26-20020a05683018da00b006a5db4474c8sm3909647ote.33.2023.05.23.15.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 15:18:18 -0700 (PDT)
Received: (nullmailer pid 2003240 invoked by uid 1000);
 Tue, 23 May 2023 22:18:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
 <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
Message-Id: <168488029701.2003121.3742030688630968396.robh@kernel.org>
Subject: Re: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0
 Ethernet controller
Date: Tue, 23 May 2023 17:18:17 -0500
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
Cc: andrew@lunn.ch, simon.horman@corigine.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, opendmb@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, richardcochran@gmail.com, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 davem@davemloft.net, robh+dt@kernel.org, christian.koenig@amd.com,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 23 May 2023 14:53:43 -0700, Justin Chen wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Add a binding document for the Broadcom ASP 2.0 Ethernet
> controller.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
> v3
> 	- Adjust compatible string example to reference SoC and HW ver
> 
> v3
>         - Minor formatting issues
>         - Change channel prop to brcm,channel for vendor specific format
>         - Removed redundant v2.0 from compat string
>         - Fix ranges field
> 
> v2
>         - Minor formatting issues
> 
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 145 +++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.example.dtb: ethernet@9c00000: compatible: ['brcm,bcm72165-asp', 'brcm,asp-v2.0'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1684878827-40672-3-git-send-email-justin.chen@broadcom.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

