Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22204735CEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 19:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4546710E0B4;
	Mon, 19 Jun 2023 17:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2310E0B4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:17:46 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-77e35b6b0c4so73060439f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687195065; x=1689787065;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QWcThq/h02+s+wcg2Hr4AaoQzShvDZL/nv4qKzi7L/0=;
 b=VD9i3TkdDDQufCTvRUit9lzXjBd8u/si19gPyIFc/fDdnki0wJYQ4eVJkaasiV/xQF
 U+T4zbu2EJKFEVsAFbWBy7yH/EVoiDq/H/9XtAii4KMB12Jfk+5cISaHG/PRYkprQkU5
 cXMMKKWe/xdFZRUqnwYn45yryhOavn3ft9H2lZVWc3y1B/Qx49H5keTe/NNKUjGoVxNA
 I3A6mMGaFpwDlesvvsLdRPZE2ckvUpGHhSo1Aa0cHnisOOha5J71g9TgJolGpNAtmwoz
 kbEfHu0rBj1o2JoOE8fx4w5DKUTtn5F/IC6LeUGO3pkcgrAwzqw7rtqHHWqCSDj8FDSK
 Q2jQ==
X-Gm-Message-State: AC+VfDwIsXiQ8pXoBhbAt4haHIJ3fCL0eX3WsnZgVKQWK2uyMdcGoSQb
 me4WyI3XY+djJFrdmTGzrw==
X-Google-Smtp-Source: ACHHUZ6rYV4VuZykUXSkm0tKMSUKMNa10Ofovryp4YB+E712Rgarm82iPHFXZnH0jReYkDPABmnYmw==
X-Received: by 2002:a5e:880b:0:b0:774:84f4:6ea with SMTP id
 l11-20020a5e880b000000b0077484f406eamr6600673ioj.11.1687195064770; 
 Mon, 19 Jun 2023 10:17:44 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a02b604000000b0040fadba66b0sm101906jam.58.2023.06.19.10.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 10:17:44 -0700 (PDT)
Received: (nullmailer pid 1420938 invoked by uid 1000);
 Mon, 19 Jun 2023 17:17:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
 <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
Message-Id: <168719506209.1420922.17702142182740385412.robh@kernel.org>
Subject: Re: [PATCH v4 4/6] dt-bindings: display: stm32-ltdc: add optional
 st,fb-bpp property
Date: Mon, 19 Jun 2023 11:17:42 -0600
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 19 Jun 2023 18:55:23 +0200, Dario Binacchi wrote:
> Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> added property allows to size, within certain limits, the memory footprint
> required by the framebuffer.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: properties:st,fb-bpp:maxItems: False schema does not allow 1
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619165525.1035243-5-dario.binacchi@amarulasolutions.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

